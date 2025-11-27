Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744F5D116F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LZy+TydcqSmvcD0OxLxJaigZpJM+j3ByE+efESnjLA=; b=qKWnbugRtl//G4qMsBJg+qbZMJ
	bJkSZbkqqoesDqvQrAPgTu+GQrMIG2dFNC7ScF0j+1qqw5ZpmGlwPK/KSrwEIO5uOL/xqDGJdqJjk
	spjtVV95aefl4srV9HBhlVFb0VGw67yaym3E1SSpBz+P2O2wEToy9WRVAuwzy+iX/3fbn9NpJlWfN
	uHeGPnwuppGMNQA9xfUdRZhCWnPvf7ODrcZWfw9SJUkRzsD5wq/D5SdG7t77sl2aNfuqdRQSJOI/6
	LVTB0L64yBFvDi62U68YwLtKIcI5E6aW6khzZr9/oGt1PrW2jJzAV/jp8t2fGYJ/DDRpIUxL+AzZQ
	3COQDrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSIH-0000000Fuvw-13Qp;
	Thu, 27 Nov 2025 03:03:41 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOSIE-0000000Fuva-0E7V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 03:03:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/LZy+TydcqSmvcD0OxLxJaigZpJM+j3ByE+efESnjLA=;
	b=RFgcpNciTsUxTzW0FEuArat0oaFMJJ2ugPWHX2RcAh+P3gVPQqGvig+Pft78Z9ZRMCBbBALKf
	V9yv1Ur4Pry9lkqkiELK28rV3mOVmIfVuZK7uDYZmC/dZYQhNILrGHIyk/KOkMMDi7K9bqeRIhq
	FZJJ4NJqQB4A9/pEEKeUV6o=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dH1RV6VBszmV7N;
	Thu, 27 Nov 2025 11:01:42 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 719521402C4;
	Thu, 27 Nov 2025 11:03:31 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Nov 2025 11:03:30 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>, <linux@armlinux.org.uk>, <will@kernel.org>,
	<david.laight@runbox.com>, <rmk+kernel@armlinux.org.uk>
CC: <brauner@kernel.org>, <jack@suse.cz>, <nico@fluxnic.net>,
	<akpm@linux-foundation.org>, <hch@lst.de>, <jack@suse.com>,
	<wozizhi@huaweicloud.com>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <catalin.marinas@arm.com>, <rppt@kernel.org>,
	<vbabka@suse.cz>, <pfalcato@suse.de>, <lorenzo.stoakes@oracle.com>,
	<kuninori.morimoto.gx@renesas.com>, <tony@atomide.com>, <arnd@arndb.de>,
	<bigeasy@linutronix.de>, <punitagrawal@gmail.com>, <rjw@rjwysocki.net>,
	<marc.zyngier@arm.com>, <lilinjie8@huawei.com>, <liaohua4@huawei.com>,
	<wangkefeng.wang@huawei.com>, <pangliyuan1@huawei.com>, Xie Yuanbin
	<xieyuanbin1@huawei.com>
Subject: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad() with rcu read lock held
Date: Thu, 27 Nov 2025 11:03:16 +0800
Message-ID: <20251127030316.8396-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aSeNtFxD1WRjFaiR@shell.armlinux.org.uk>
References: <aSeNtFxD1WRjFaiR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_190338_440974_8DC3DCFE 
X-CRM114-Status: GOOD (  18.10  )
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

On, Wed, 26 Nov 2025 19:26:40 +0000, Al Viro wrote:
> For quick and dirty variant (on current tree), how about
> adding
> 	if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
> 		goto no_context;
>
> right after
>
> 	if (!ttbr0_usermode_access_allowed(regs))
> 		goto no_context;
>
> in do_page_fault() there?

On, Wed, 26 Nov 2025 23:31:00 +0000, Russell King (Oracle) wrote:
> Now, for 32-bit ARM, I think I am coming to the conclusion that Al's
> suggestion is probably the easiest solution. However, whether it has
> side effects, I couldn't say - the 32-bit ARM fault code has been
> modified by quite a few people in ways I don't yet understand, so I
> can't be certain at the moment whether it would cause problems.

I think I've already submitted a very similar patch, to fix another bug:
On Thu, 16 Oct 2025 20:16:21 +0800, Xie Yuanbin wrote:
> +#ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
> +	if (unlikely(addr > TASK_SIZE) && user_mode(regs)) {
> +		fault = 0;
> +		code = SEGV_MAPERR;
> +		goto bad_area;
> +	}
> +#endif
Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com

However, the patch seems to have received no response for a very long
time.

On Wed, 26 Nov 2025 23:31:00 +0000, Russell King wrote:
> I think the only thing to do is to try the solution and see what
> breaks. I'm not in a position to be able to do that as, having not
> had reason to touch 32-bit ARM for years, I don't have a hackable
> platform nearby. Maybe Xie Yuanbin can test it?

With pleasure.
By the way, for the config and test case shown in this patch:
vfs: Fix might sleep in load_unaligned_zeropad() with rcu read lock held
Link: https://lore.kernel.org/20251126101952.174467-1-xieyuanbin1@huawei.com
the warning can be reproduced directly on QEMU.

Xie Yuanbin

