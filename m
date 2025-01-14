Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB4EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=; b=Vid+lDFphaL5ieuF0ViXE6abZg
	CXC6ExNsQkkj6FnVuSgxbTrVSCfJdQLTmVIGMQJ3ILBjZulmtp3DxP/WRM2nHqptO5T6PL3KxDDnS
	4B1pc00W2QuxX8VK6Scp4GTyFwB7+s3V06pQGtGPYPTb+ppQfP9lJ+cA21yghTq1rrP67Ba6aLFks
	cLSowhEum530AA6aXJohKcoSO1O3i4TBcVtna16b/aFvQA5VCeRxf7dpFO9TGMPYtXeWm/iYF1xaN
	sgIMTuHuNFpZIH934FABz3tihq9334BEZ+nelZPA20qeaVoKEhi/J0FXK05NmIs/YjhQ8au1IaRKm
	Jyv7LJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcUR-00000007rbj-2fc0;
	Tue, 14 Jan 2025 08:41:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcTC-00000007rMt-2j5B;
	Tue, 14 Jan 2025 08:40:20 +0000
Date: Tue, 14 Jan 2025 09:40:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736844014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=;
	b=hpYgILLPXQ7SmDpUn60QinBCupBkKGG01dSa+3FTRxgCNWqRO6deM+5ajnF8F0Od2hJi0z
	cpxkUWPEgYxlKuFJaMAU5lKMBOMsqCHOy8bQU1BqkIFPZmu3C6m9guZo5f5gQe7CgWfAgj
	wXlrJ+vaLY79yRCYtXdOy7ekdepzM2+FdVeCX/9qEmHH9Disy0/cKsvFF+W1CBIVrlQCea
	CdXCh/v5ERdvmGs43kWOXeLO4kjwv39L0SRYilloKSbhCM9dQG/0V+AKwY49Zz5COQvlml
	dgkfNHCH4XX6YPAxAxjBf1Hw2izDtl+kF8Vz8wbVdA0kf1Oan0fsv7K9pzMvpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736844014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=;
	b=mNLDwfduAqnNjlxAvy66A4s1VI9taFFzoR0Bjcd3QoK3m68hFryx0HiKPwHcCzZrImHOWD
	IoGhvQiZnGydi4Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2 09/18] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
 <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>
 <20250113-kissable-monstrous-aace0cf7182e@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-kissable-monstrous-aace0cf7182e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_004018_969550_78BFD747 
X-CRM114-Status: GOOD (  13.34  )
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

On Mon, Jan 13, 2025 at 07:48:15PM +0000, Conor Dooley wrote:
> On Fri, Jan 10, 2025 at 04:23:48PM +0100, Thomas Weiﬂschuh wrote:
> > The generic storage implementation provides the same features as the
> > custom one. However it can be shared between architectures, making
> > maintenance easier.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> For rv64, nommu:
>   LD      vmlinux
> ld.lld: error: undefined symbol: vmf_insert_pfn
> >>> referenced by datastore.c
> >>>               lib/vdso/datastore.o:(vvar_fault) in archive vmlinux.a
> 
> ld.lld: error: undefined symbol: _install_special_mapping
> >>> referenced by datastore.c
> >>>               lib/vdso/datastore.o:(vdso_install_vvar_mapping) in archive vmlinux.a
> 
> Later patches in the series don't make it build again.
> rv32 builds now though, so thanks for fixing that.

Thanks for the report.
Can you try to diff below?

I'm adding rv64 and arm nommu configs to my test matrix and
doublechecking all kconfig dependencies.


diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 335cbbd4dddb..583c55910612 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,7 @@ config RISCV
        select ARCH_HAS_SYSCALL_WRAPPER
        select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
        select ARCH_HAS_UBSAN
-       select ARCH_HAS_VDSO_ARCH_DATA
+       select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
        select ARCH_KEEP_MEMBLOCK if ACPI
        select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE if 64BIT && MMU
        select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -115,7 +115,7 @@ config RISCV
        select GENERIC_SCHED_CLOCK
        select GENERIC_SMP_IDLE_THREAD
        select GENERIC_TIME_VSYSCALL if MMU && 64BIT
-       select GENERIC_VDSO_DATA_STORE
+       select GENERIC_VDSO_DATA_STORE if MMU
        select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
        select HARDIRQS_SW_RESEND
        select HAS_IOPORT if MMU

