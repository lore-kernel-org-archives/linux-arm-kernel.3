Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487B3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DodGNQ4J3R60otr7WXzwptpN2trZwaXPd+16aznDXKU=; b=QryYZfc2nela7/olRILYBOuj1v
	fC/6muEJ/NGHnexd4qB+YamZwwEv1SkJT4eqwbFN5VOFCbED0IqQZqVTBpSTUeA0EsoydntzZXBjw
	Fv5EZrrXehd0HyxiPnttrW9AizqD/UUUmXLhK1ba2NMTdp4+VKte0mI0N78DNPM4xFC6bmdOWuRd9
	JHCcpRM5cA/w+68ULS+v8vtIA1oWf70zyVVPQfroEsDxNP7dxSSooE85HgHL7eLPPx56m3naTxXok
	FxwnNpSB1zbl9qAzBwVu/bdMyoitkVhQwza5Dp00ygPx6dQVm0tOD2oi6aBGpVQphoeCbOncc/1L2
	XSjdZzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa42-0000000GRkZ-1CHb;
	Thu, 27 Nov 2025 11:21:30 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOa3z-0000000GRjo-2YMS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:21:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DodGNQ4J3R60otr7WXzwptpN2trZwaXPd+16aznDXKU=;
	b=kzAHUMF2dUX/75F2x8k4f67X3bwt94v+LeKbd6y1I+Pfnt/W9chF7FpLBH1NgTjP/L/NGfo8n
	xvIQ0+PuPafeVGbUpzBFi9IJnhCxY1y3YnVnFQlCNNtgM7nYb04k1porCfASxHwGKtjxPIckwVs
	1urT6Cq6FxhqN1lH2J74Qto=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dHDTl6J2qz1K96R;
	Thu, 27 Nov 2025 19:19:23 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id CD7A614011F;
	Thu, 27 Nov 2025 19:21:10 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Nov 2025 19:21:09 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>, <viro@zeniv.linux.org.uk>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <david.laight@runbox.com>,
	<rmk+kernel@armlinux.org.uk>
CC: <brauner@kernel.org>, <jack@suse.cz>, <nico@fluxnic.net>,
	<akpm@linux-foundation.org>, <hch@lst.de>, <jack@suse.com>,
	<wozizhi@huaweicloud.com>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <catalin.marinas@arm.com>, <rppt@kernel.org>,
	<vbabka@suse.cz>, <pfalcato@suse.de>, <lorenzo.stoakes@oracle.com>,
	<kuninori.morimoto.gx@renesas.com>, <tony@atomide.com>, <arnd@arndb.de>,
	<punitagrawal@gmail.com>, <rjw@rjwysocki.net>, <marc.zyngier@arm.com>,
	<lilinjie8@huawei.com>, <liaohua4@huawei.com>, <wangkefeng.wang@huawei.com>,
	<pangliyuan1@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad() with rcu read lock held
Date: Thu, 27 Nov 2025 19:20:35 +0800
Message-ID: <20251127112035.129014-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127072057.EbvhUyG4@linutronix.de>
References: <20251127072057.EbvhUyG4@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_032127_827328_0620CB18 
X-CRM114-Status: GOOD (  11.13  )
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

On, Thu, 27 Nov 2025 08:20:57 +0100, Sebastian Andrzej Siewior wrote:
> This all should be covered by the series here
> 	https://lore.kernel.org/all/20251110145555.2555055-1-bigeasy@linutronix.de/

Yes, I know it.

> or do I miss something.

We had some discussions about this bug:
Link: https://lore.kernel.org/lkml/20251126090505.3057219-1-wozizhi@huaweicloud.com/

The discussions:
Link: https://lore.kernel.org/CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com
Link: https://lore.kernel.org/20251126192640.GD3538@ZenIV
Link: https://lore.kernel.org/aSeNtFxD1WRjFaiR@shell.armlinux.org.uk

According to the discussion, in do_page_fault(), when addr >= TASK_SIZE,
we should not try to acquire the mm read lock or find vma. Instead, we
should directly call __do_kernel_fault() or __do_user_fault(). Your
submission just moved harden_branch_predictor() forward. I think we can
have more discussions about the patches to fix the missing spectre.

I am trying to write a new patch, I hope it will better handle these two
bugs and be compatible with PREEMPT_RT scenarios.

> Sebastian

Thanks!

Xie Yuanbin

