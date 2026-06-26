Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1865CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dgrebeHjs4fpxqiQop24k7ud/2CLXwg2SgO1/ChW0o=; b=HXNI69poiQRlTj4VH9vdkjx+/O
	AdoXs2DbWzxQh5Suu349YncjPkD7k7syDNoDcBSRbWTxtOGrqIHIBzg5IJn2nwfpTHZ7bBZRofOUJ
	0EL/nveWFBv0PkFcsClbzOYEL89Srcmb2Wc+HRe4UznRsDC7S41B/iGeChi4xqVLeZPMrrRVDveLF
	HGi1CvfgSx/gvJRnhEnVDiyxDk+HH+9HG8YHginx6COvnKWFu3nMSqYhtI+N2DWWZ42H6yej1hIFU
	KItumu4VhPBbxNQltCjZSgI+GBkO2xgpR/fxKEjf6U6wH2t5m/WPhSvn34U1arlrKM2fKnYAzAKRy
	ImrDRZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3ci-0000000B4vT-3RbF;
	Fri, 26 Jun 2026 10:17:24 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cc-0000000B4le-0dkf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+dgrebeHjs4fpxqiQop24k7ud/2CLXwg2SgO1/ChW0o=;
	b=QIR/CpMKuhnyRARQVpkEnuyoAYO8fHYJtBAgGdtOnkbmAI7pjaS10Gym833rMASL2GnrETCAK
	hi+LXXZNs6iP1czILOvDS4naDBe1fzgC52avPQJ29IsxKqeqCHmQMJPxqMRGS6CB8Afq8EVJwT6
	q1VrGUkslPNt3305PFJ8PUc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gmrw16PzWzmV6M;
	Fri, 26 Jun 2026 18:08:01 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id A833540539;
	Fri, 26 Jun 2026 18:17:08 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 26 Jun 2026 18:17:08 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <xiqi2@huawei.com>, <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <sunnanyong@huawei.com>,
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH v3 2/2] ARM: mm: protect show_pte() in do_DataAbort() fallback path
Date: Fri, 26 Jun 2026 18:16:15 +0800
Message-ID: <20260626101615.60920-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626073048.3595106-3-xiqi2@huawei.com>
References: <20260626073048.3595106-3-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031718_696791_66D6A5DC 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jun 2026 15:30:48 +0800, Qi Xi wrote:
> @@ -638,7 +638,10 @@ do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
> 	pr_alert("8<--- cut here ---\n");
> 	pr_alert("Unhandled fault: %s (0x%03x) at 0x%08lx\n",
> 		inf->name, fsr, addr);
> -	show_pte(KERN_ALERT, current->mm, addr);
> +	if (mmap_read_trylock(current->mm)) {
> +		show_pte(KERN_ALERT, current->mm, addr);
> +		mmap_read_unlock(current->mm);
> +	}

For kernel faults, `current->mm` maybe NULL, and
`mmap_read_trylock(current->mm)` may cause a panic.
Also, interrupts may be disabled here.

I suggest that waiting for this patch to be merged first:
https://lore.kernel.org/20260625122612.43501-1-xieyuanbin1@huawei.com
which make sure that interrupts are enabled here.
Then, something like:
```c
	if (user_mode(regs))
		mmap_read_lock(current->mm);
	show_pte(KERN_ALERT, current->mm, addr);
	if (user_mode(regs))
		mmap_read_unlock(current->mm);
```

