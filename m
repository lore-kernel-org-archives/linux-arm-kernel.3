Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F93FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 01:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAkJdxgsaAmyFMdkHSiVQj6HwV6946LAhWL61vW+bek=; b=Hg1lMI1/ofYgEXqtN3hXmFbvow
	Ll/d9NyUl+nlIDOejTEoubF+KRVosQtkX1v419PhipkIUQ7hidEVK7rY7aRA5Lx8wahRrGK7dnysj
	NbgIQyUNkbSeUCe7tHSnqyd39MFZZ1iPM4hrF8tLsgJKOmFX/bGaKnQgjiUD+nY3AOHQmsH8dtPOU
	jMreYJroX+2G0q273Wy9NB+2/tex8Ahs1mkA6wZe2Yo2bJE6eKJRG7cc+ZDOhBSMqqvbPq2RaYU94
	VlDtNo2r6a0Hr1WaXePw/yLEesTB8+u8cdrEBrwwaSBUA665U7kdvJnjBHmuis1P8GjQqk6pAURpY
	R9p/ChoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdHkn-0000000C3Ci-1um8;
	Sat, 27 Jun 2026 01:22:41 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdHkk-0000000C3CH-3HPd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 01:22:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oAkJdxgsaAmyFMdkHSiVQj6HwV6946LAhWL61vW+bek=;
	b=OYFkVtIdh8m8sYBjfMJzlbn82boz8hxAwipaWsE1FFTeRU8sliSaKXfe1s+teLY8L0O7PPVH8
	bF6FBr5HA2WYeKB3tfD36vOZPcI2r2kuMYmVYvPYnCuXIRDlmC2F6l2GabGbWLjYH38j4ygdaCc
	gpkWp+lY87QvVSnpSncmij0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gnF0n6VdTz12LDg;
	Sat, 27 Jun 2026 09:13:29 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B37C40571;
	Sat, 27 Jun 2026 09:22:15 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 27 Jun 2026 09:22:14 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <sunnanyong@huawei.com>,
	<xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 2/2] ARM: mm: protect show_pte() in do_DataAbort() fallback path
Date: Sat, 27 Jun 2026 09:22:10 +0800
Message-ID: <20260627012210.3031-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aj5ybKcDxl1tOIx4@shell.armlinux.org.uk>
References: <aj5ybKcDxl1tOIx4@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_182239_318646_75EB5271 
X-CRM114-Status: GOOD (  13.89  )
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

On Fri, 26 Jun 2026 13:37:00 +0100, Russell King wrote:
> On Fri, Jun 26, 2026 at 06:16:15PM +0800, Xie Yuanbin wrote:
>> I suggest that waiting for this patch to be merged first:
>> https://lore.kernel.org/20260625122612.43501-1-xieyuanbin1@huawei.com
>> which make sure that interrupts are enabled here.
>
> No, it doesn't ensure that.

Oh, I'm sorry my description wasn't clear. It should make sure that
for user unhandled faults, interrupts are enabled here, without
kernel unhandled faults.

> We are not "fixing" show_pte(), which is a diagnostic function when
> things go wrong in the kernel, and is there to *try* to give us
> information to diagnose what happened. It is *not* a function that
> is used routinely in the kernel.

For kernel faults, I fully agree with it. However, for
user faults, I think "fixing" is necessary.
We might be able to construct a user-mode program in some way to
repeatedly trigger unhandled faults -> show_pte(), such as executing bkpt
instruction, or something else, and then the kernel panic, this may be a
security vulnerability.

