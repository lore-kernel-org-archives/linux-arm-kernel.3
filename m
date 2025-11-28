Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EC2CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbDjONWolVRWulV3h7Xuju+0Pp5SGwJDbywLzt8xkyA=; b=GOZZRO0uDGX0B0n8f8/xh3mDC4
	PC7NvPGZ4d3kQO/+ooiJNvUMWqYFw7VtHGlA3WRRAJY8fuRks+5vEqPvw2QCoE6z/sw3++uTVm793
	dmVpnFXY1vjVVNVVw7Raw3nbo9eydYnqzTjLGWJ/yZEWQEreLqDi79hszC6u7JY25mCFCkTNFdFQd
	3fH+bYvjKb1mI8XZiPcD06d7msNpBBit04JIYQaOm01erXY++U0ucEwuAmo4MkAR1HJj+FUUq5QBJ
	BmTr56mYHrVCO8KmLJ/fzDGiwt/eCVzWwikOMkoGFj352lMucUS69r3uqECeXN/96waQzH1yNVUwc
	Hk3W0XiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxD7-00000000PJf-1eLs;
	Fri, 28 Nov 2025 12:04:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxD4-00000000PHg-2c8O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 12:04:24 +0000
Date: Fri, 28 Nov 2025 13:03:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764331441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbDjONWolVRWulV3h7Xuju+0Pp5SGwJDbywLzt8xkyA=;
	b=rjvODXBfX/sGkP/SCBKWlg8gpJJxx2QtqmFIp+teBWBjiWqBL8VYrIZsj3aPHQUc6HIpf5
	+gJaijo1gEFelmDWDnOZWkoGyV1Xwk/V8deJSxh/TMhCEvj/MSbeCFh139+ess3+XZBA50
	2N7JPfLDkTVvg5GQNjOcGeY9KhJfhk/PPS2am97rxe1W/A6Uqjp51FL0YmE5eW0zsK+8z2
	jpK+InifjZCWat5n/Udg94w52lpUupY+dExqkuTK68yS0PABYP76Po+H+ZnD3hUZXH7kzv
	6ZRpS6PpL27XyGr7IsFGdkGqOUvzAfc4BZgwyrtKlH/cvlbGZJQ336rUeCu2zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764331441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbDjONWolVRWulV3h7Xuju+0Pp5SGwJDbywLzt8xkyA=;
	b=pwJZJJp2Pqx0lf2Ld6/O21R9gOY7TB3qWP8v0eYtWWqzIGVABTIINg+o1P9ZC0sFnIaQ3K
	YStQHA1g20ACsBBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: akpm@linux-foundation.org, arnd@arndb.de, brauner@kernel.org,
	david.laight@runbox.com, hch@lst.de, jack@suse.com,
	kuninori.morimoto.gx@renesas.com, liaohua4@huawei.com,
	lilinjie8@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com, marc.zyngier@arm.com, nico@fluxnic.net,
	pangliyuan1@huawei.com, pfalcato@suse.de, punitagrawal@gmail.com,
	rjw@rjwysocki.net, rmk+kernel@armlinux.org.uk, rppt@kernel.org,
	tony@atomide.com, vbabka@suse.cz, viro@zeniv.linux.org.uk,
	wangkefeng.wang@huawei.com, will@kernel.org,
	wozizhi@huaweicloud.com
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when
 handling with page faults of kernel address
Message-ID: <20251128120359.Xc09qn1W@linutronix.de>
References: <20251127145127.qUXs_UAE@linutronix.de>
 <20251128022756.9973-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251128022756.9973-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_040422_810041_7BFC109B 
X-CRM114-Status: GOOD (  18.44  )
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

On 2025-11-28 10:27:56 [+0800], Xie Yuanbin wrote:
> According to the discussion, it might be better to handle the kernel
> address fault directly, just like what x86 does, instead of finding VMA.

the kernel fault shouldn't have a VMA

> Link: https://elixir.bootlin.com/linux/v6.18-rc7/source/arch/x86/mm/fault.c#L1473
> ```c
> 	if (unlikely(fault_in_kernel_space(address)))
> 		do_kern_addr_fault(regs, error_code, address);
> 	else
> 		do_user_addr_fault(regs, error_code, address);
> ```
> 
> It seems your patches hasn't been merged into the linux-next branch yet.

I hope Russell will add them once he gets to it. They got reviewed, I
added them to the patch system.

> This patch is based on linux-next, so it doesn't include your
> modifications. This patch might conflict with your patch:
> Link: https://lore.kernel.org/20251110145555.2555055-2-bigeasy@linutronix.de
> so I'd like to discuss it with you.

what about this:

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ad58c1e22a5f9..b6b3cd893c808 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -282,10 +282,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	}
 
 	/*
-	 * If we're in an interrupt or have no user
-	 * context, we must not take the fault..
+	 * If we're in an interrupt or have no user context, we must not take
+	 * the fault. Kernel addresses are handled in do_translation_fault().
 	 */
-	if (faulthandler_disabled() || !mm)
+	if (faulthandler_disabled() || !mm || addr >= TASK_SIZE)
 		goto no_context;
 
 	if (user_mode(regs))

We shouldn't be getting here. Above TASK_SIZE there are just fix
mappings which don't fault and the VMALLOC array which should be handled
by do_translation_fault(). So this should be only the exception table.

This should also not clash with the previous patches. Would that work
for everyone?

> Thanks!
> 
> Xie Yuanbin

Sebastian

