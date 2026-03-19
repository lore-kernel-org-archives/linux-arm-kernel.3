Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF3D109023F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5KWTiJCMcaH4JlQWwOeL4gWSd0MErycqbXZQ8+Z8yc=; b=Cvdn2fYQ+QFAArgp/25BM+BK0s
	MqLNizkP5D+AXWGLTD0g20WUGXmOoy9P+k+6vQrhd3Yvr6xWkKN6eRP69Je6Z0sIzREBqkDwqu8g6
	ysPDqyj5qib0CrGNA05rsQec+mG4HoOi0D5nxMWUDCfz2uHdCFrY+ra0g7JiYqIk4CB79KCpoaYE+
	KFrMmS44ZkVVka3Xx66Mq6OuhlU2x8OCEBlHoElA7qQX1WjcC6KQQmYoxTSbe1ZBNnUiEaj69W3Jv
	10KalVqgkjziI/6ahGo3cR+MRGP31Ii0n+44q4DdSY+pFfgS2t62IluokHHBdUkCMzlygu3Myeu6m
	SMbgdMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G57-0000000B3bu-3oau;
	Thu, 19 Mar 2026 16:18:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3G55-0000000B3b8-1OBJ;
	Thu, 19 Mar 2026 16:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CB5A44100;
	Thu, 19 Mar 2026 16:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5EDC19424;
	Thu, 19 Mar 2026 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937121;
	bh=+rJxXvh9jbY/cYu63rGxCHb0s8bdU5IuTtrr+qf/8ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAhj5GuC0PfaoylzOpmZEg5wivkofnQ+GtRsdaeJOUJ4uAmHeX9yWUjJtJAn3it/L
	 DtIYhs/uZLj/VchTSC0AmON6+W7EzTrZwPGqVuCyAhjCjaHPnhkABYQUeqprmOj1i/
	 R/FWq7IVvWU1IGMy9FTlbHxdCNuIq9kR2X6GzLnLDJQbozNo/mkx2YeXRGXNiMY0o7
	 vQpts1+55w++E8C9ighzin4xwksBwu0yd2u4NfBf4vlh8psPZ69uaMIHcyWDj4a0OE
	 UwiaTPNnXiiVy+7V9ISLDkx2gH43hmidRMy6gz3GsbPkAVEku6PbjeRjw4rot/k9lf
	 Rn92JSY6yNwyg==
Date: Thu, 19 Mar 2026 18:18:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
Message-ID: <abwhzkhM9Bk9xPIf@kernel.org>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
 <20260319-config_migration-v1-1-42270124966f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-config_migration-v1-1-42270124966f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_091843_405575_A02DE702 
X-CRM114-Status: GOOD (  16.32  )
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

On Thu, Mar 19, 2026 at 09:19:40AM +0100, David Hildenbrand (Arm) wrote:
> All architectures that select CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE also
> select CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG. So we can just remove
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE.
> 
> For CONFIG_MIGRATION, make it depend on CONFIG_MEMORY_HOTREMOVE instead,
> and make CONFIG_MEMORY_HOTREMOVE select CONFIG_MIGRATION (just like
> CONFIG_CMA and CONFIG_COMPACTION already do).
> 
> We'll clean up CONFIG_MIGRATION next.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm64/Kconfig     | 1 -
>  arch/loongarch/Kconfig | 1 -
>  arch/powerpc/Kconfig   | 1 -
>  arch/riscv/Kconfig     | 1 -
>  arch/s390/Kconfig      | 1 -
>  arch/x86/Kconfig       | 1 -
>  mm/Kconfig             | 9 +++------
>  7 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index edc927d9e85a..d01800962d84 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -85,7 +85,6 @@ config S390
>  	select ARCH_32BIT_USTAT_F_TINODE
>  	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM

Not really related, but s390 does not have anything but SPARSEMEM_VMEMMAP.

> -	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_CC_CAN_LINK

-- 
Sincerely yours,
Mike.

