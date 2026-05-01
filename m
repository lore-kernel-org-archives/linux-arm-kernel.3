Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFD9CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skVC9z4AOYvJboBbJ+s6RNW76DmlEAxe5n7RJ+tdzao=; b=Sqe6XE+2SfvydizQ2PmOHRYrSv
	Os6Q3WDmK/A32FoUQy3P8hKB7fd6RdqjzmMJ0zs+xsUTWZPdS6DZ4/GCY1iGwfyOqaMcVyXtoFq4q
	uoq7j5zanvm16lgGvRNC/XVINW3X3HD7ljFNuK8mMqWvk96/pBKITUwB9fiLTnPjONFu7+G9d+TBh
	3EM1yM3sItHjX8Pzp2MPuEiOZtzUhgFTl4Zn6pet5tMsr3V0Zjy2m4vwDnz0hjTYXkGsA0oQWnHuX
	li3tGujldW61NUVSOoYskLXwV2OJsWkmCqHdUdzwKsQ8boGTXrJSNffT9A58r49Umm992hLGIoonm
	cro/7jGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIofR-00000007EUV-2Zbt;
	Fri, 01 May 2026 14:16:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIofO-00000007ETx-3Q5Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:16:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 706632A9A;
	Fri,  1 May 2026 07:16:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E57AB3F7B4;
	Fri,  1 May 2026 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777644988; bh=BayNa5jbz0M4jvagJ0bgGlBgBI0tYgCb5eIEkJ2Mmqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxNIlQxl/Cc35oPga4quxc30zuSS+wR7D1y58Bxd69AqzHhrwDi+YoOyF1lX/bHz+
	 fghYsV3F27IHNwoExqu4JjbMY/pr+tB4GKLCnI66w5ySpHxtC2yAlYeZhuzM9KDcwj
	 4vQqc1LIRvEKHMzcSaIwIWlcBA+/+ITuSIUbZbGA=
Date: Fri, 1 May 2026 15:16:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "zhangpengjie (A)" <zhangpengjie2@huawei.com>
Cc: will@kernel.org, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, mrigendra.chaubey@gmail.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zhanjie9@hisilicon.com, zhenglifeng1@huawei.com,
	lihuisong@huawei.com, yubowen8@huawei.com, linhongye@h-partners.com,
	linuxarm@huawei.com, wangzhi12@huawei.com
Subject: Re: [PATCH v2] arm64: smp: Do not mark secondary CPUs possible under
 nosmp
Message-ID: <afS1tJJkwDTKvNJ6@arm.com>
References: <20260423134654.4178271-1-zhangpengjie2@huawei.com>
 <ae9iqdt_qdJRjVZs@arm.com>
 <49f96032-6027-4c79-8d08-9545261e553f@huawei.com>
 <1b1b1319-2f98-4b5d-85ec-6fc4150b6f85@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1b1319-2f98-4b5d-85ec-6fc4150b6f85@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_071630_914464_4630CF13 
X-CRM114-Status: GOOD (  24.98  )
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

On Thu, Apr 30, 2026 at 05:54:35PM +0800, zhangpengjie (A) wrote:
> On 4/30/2026 5:34 PM, zhangpengjie (A) wrote:
> > On 4/27/2026 9:20 PM, Catalin Marinas wrote:
> > > On Thu, Apr 23, 2026 at 09:46:54PM +0800, Pengjie Zhang wrote:
> > > > Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.
> > > > 
> > > > However, arm64 still enumerates firmware-described CPUs during SMP
> > > > initialization, which can leave secondary CPUs visible to
> > > > for_each_possible_cpu() users even though they never reach the
> > > > bringup path in this configuration.
> > > > 
> > > > This is not just a cosmetic mask mismatch: code iterating over
> > > > possible CPUs may observe secondary CPU per-CPU state that is never
> > > > fully initialized under nosmp.
> > > I'm fine with the patch in principle but I fail to see why it is not
> > > mostly cosmetic. If we have possible & !present CPUs (there's another
> > > thread around cpuhp_smt_enable() to allow this combination on arm64),
> > > get_cpu_device() would return NULL and the core code is supposed to
> > > handle this. What other per-CPU state should be initialised for a
> > > possible CPU but it is not without this patch?
[...]
> Yes, possible-but-not-present CPUs are valid in the general hotplug
> model. The nosmp/maxcpus=0 case is different though: on arm64,
> smp_prepare_cpus() treats this as a UP-mandated boot and returns before
> marking secondary CPUs present, so these CPUs are deliberately kept out of
> the bringup path for this boot.
> 
> The kind of issue I had in mind was subsystem-owned per-CPU state where
> iteration follows cpu_possible_mask but the state is populated only from
> CPU online/probe paths. The CPPC nosmp issue fixed by commit 15eece6c5b05
> ("ACPI: CPPC: Fix NULL pointer dereference when nosmp is used") was the
> kind of mismatch I was thinking of, although CPPC itself has already been
> fixed to use online CPUs where appropriate.
> 
> I agree the changelog overstates this. I can respin with a toned-down
> changelog if you prefer.

Please do. Since it's not an urgent fix, I'll leave it for 7.2. With the
commit text changed:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

