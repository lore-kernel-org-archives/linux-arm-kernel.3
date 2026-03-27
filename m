Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEFA10F285F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+743C1c9bGbfvP4cQljiRojozWZ33IbKUWDmbpgGVs=; b=u7AO2RORQ/457/Ox09R9pWhBKA
	UapwjGh+p/oB9ZIEWmy3VSn1Gn9JWhKj9UUcdZo80WQ4AFiUpo1GjPULgbhCBvjbVb2VLYx9YHqSH
	0Q8B+1RYytbkEUDIliYx86gRkc8MWkZa/i5sqKmGttaObkMKrIl+ajRHWUdMp+lKcFUhf24y3jDWl
	UdV25E1ur7SeijB0W7x4Hoi5ImXtV8kYFnXLw2nLiHX5eUDM1u2ttxAWR/7X+CLaW7jLjyBb/Hfs3
	Wa23ijEP4R0fpO4u9PcZyQ2ng+4gECaClEs6ouXLkgQhTjwhgL2RZRWZnaJ85evT2ftpnRbbzb+0p
	evaLZD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ajb-00000007phE-0Fjx;
	Fri, 27 Mar 2026 17:12:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AjZ-00000007ph8-0BSM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1D7760127;
	Fri, 27 Mar 2026 17:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0883CC19423;
	Fri, 27 Mar 2026 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774631551;
	bh=MvMFqhnsZZr06SdVmhQQ8yFBO4J0YHjtEFCesOzEOVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CBBUkAdNPfmmIltuHE6pZ6GpwC9m1K+SXX9SsGPrXIW3gJCsavgLlBBFhllhQ8YOV
	 tt4v86XDdlFoZfXDWWeQB/kZRnJsC72/2SzZfO03eHu3zwjOw/NRJZJdfe7tPOsj/H
	 xZPsKYg2lEOyHQVDuzvBc3T+oW5ge/Ms1dc/coAeYjdDtxnlJCj3sgd0nOmr6HhLlb
	 ryVmy9CH86EKbBkS5gNJ82lQSGvFhRoc7XumwqORtvLuF6ft5AuU9wHZOeQVY8tmIJ
	 ikfw0WPIJMlejTpAQz8wOen8RRrBNWQTRHTEyw9/Q1dMm1o4NegwxmZRKfaj1AEbCW
	 zcL0eU61oIoEA==
Date: Fri, 27 Mar 2026 20:12:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
	akpm@linux-foundation.org, andreas@gaisler.com, ardb@kernel.org,
	bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com,
	chleroy@kernel.org, dave.hansen@linux.intel.com,
	davem@davemloft.net, david@kernel.org, devicetree@vger.kernel.org,
	dvyukov@google.com, elver@google.com, glider@google.com,
	hannes@cmpxchg.org, hpa@zytor.com, ilias.apalodimas@linaro.org,
	iommu@lists.linux.dev, jack@suse.cz, jackmanb@google.com,
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com,
	m.szyprowski@samsung.com, maddy@linux.ibm.com, mhiramat@kernel.org,
	mhocko@suse.com, mingo@redhat.com, mpe@ellerman.id.au,
	npiggin@gmail.com, robh@kernel.org, robin.murphy@arm.com,
	saravanak@kernel.org, sparclinux@vger.kernel.org, surenb@google.com,
	tglx@kernel.org, vbabka@kernel.org, viro@zeniv.linux.org.uk,
	will@kernel.org, x86@kernel.org, ziy@nvidia.com
Subject: Re: Warning from free_reserved_area() in next-20260325+
Message-ID: <aca6blFFWskxAcAr@kernel.org>
References: <20260323074836.3653702-10-rppt@kernel.org>
 <20260327140109.7561-1-spasswolf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327140109.7561-1-spasswolf@web.de>
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

Hi Bert,

On Fri, Mar 27, 2026 at 03:01:08PM +0100, Bert Karwatzki wrote:
> Starting with linux next-20260325 I see the following warning early in the
> boot process of a machine running debian stable (trixie) (except for the kernel):

Thanks for the report!

> [    0.027118] [      T0] ------------[ cut here ]------------
> [    0.027118] [      T0] Cannot free reserved memory because of deferred initialization of the memory map
> [    0.027119] [      T0] WARNING: mm/memblock.c:904 at __free_reserved_area+0xa9/0xc0, CPU#0: swapper/0/0
> [    0.027122] [      T0] Modules linked in:
> [    0.027123] [      T0] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc5-next-20260326-master #385 PREEMPT_RT 
> [    0.027125] [      T0] Hardware name: ASUS System Product Name/ROG STRIX B850-F GAMING WIFI, BIOS 1627 02/05/2026
> [    0.027125] [      T0] RIP: 0010:__free_reserved_area+0xa9/0xc0
> [    0.027126] [      T0] Code: 48 89 df 48 89 ee e8 06 fe ff ff 48 89 c3 48 39 e8 72 a0 5b 4c 89 e8 5d 41 5c 41 5d 41 5e c3 cc cc cc cc 48 8d 3d 97 c2 c6 00 <67> 48 0f b9 3a 45 31 ed eb df 66 66 2e 0f 1f 84 00 00 00 00 00 66
> [    0.027127] [      T0] RSP: 0000:ffffffff9b203e98 EFLAGS: 00010202
> [    0.027128] [      T0] RAX: 0000000e91c00001 RBX: ffffffff9b100c0f RCX: 0000000080000001
> [    0.027128] [      T0] RDX: 00000000000000cc RSI: 0000000e2d42d000 RDI: ffffffff9b32ef60
> [    0.027128] [      T0] RBP: ffff9eeafdd6fbc0 R08: 0000000000000000 R09: 0000000000000001
> [    0.027129] [      T0] R10: 0000000000001000 R11: 8000000000000163 R12: 000000000000006f
> [    0.027129] [      T0] R13: 0000000000000000 R14: 0000000000000045 R15: 000000005c8a1000
> [    0.027129] [      T0] FS:  0000000000000000(0000) GS:ffff9eeb21c05000(0000) knlGS:0000000000000000
> [    0.027130] [      T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.027130] [      T0] CR2: ffff9ee8ad801000 CR3: 0000000e2ce1e000 CR4: 0000000000f50ef0
> [    0.027131] [      T0] PKRU: 55555554
> [    0.027131] [      T0] Call Trace:
> [    0.027132] [      T0]  <TASK>
> [    0.027132] [      T0]  free_reserved_area+0x89/0xd0
> [    0.027133] [      T0]  alternative_instructions+0xee/0x110
> [    0.027136] [      T0]  arch_cpu_finalize_init+0x10f/0x160
> [    0.027138] [      T0]  start_kernel+0x686/0x710
> [    0.027140] [      T0]  x86_64_start_reservations+0x24/0x30
> [    0.027141] [      T0]  x86_64_start_kernel+0xd4/0xe0
> [    0.027142] [      T0]  common_startup_64+0x13e/0x141
> [    0.027143] [      T0]  </TASK>
> [    0.027144] [      T0] ---[ end trace 0000000000000000 ]---

Does this patch fix it for you?

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e87da25d1236..62936a3bde19 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2448,19 +2448,31 @@ void __init alternative_instructions(void)
 					    __smp_locks, __smp_locks_end,
 					    _text, _etext);
 	}
+#endif
 
+	restart_nmi();
+	alternatives_patched = 1;
+
+	alt_reloc_selftest();
+}
+
+#ifdef CONFIG_SMP
+/*
+ * With CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled we can free_init_pages() only
+ * after the deferred initialization of the memory map is complete.
+ */
+static int __init free_smp_locks(void)
+{
 	if (!uniproc_patched || num_possible_cpus() == 1) {
 		free_init_pages("SMP alternatives",
 				(unsigned long)__smp_locks,
 				(unsigned long)__smp_locks_end);
 	}
-#endif
 
-	restart_nmi();
-	alternatives_patched = 1;
-
-	alt_reloc_selftest();
+	return 0;
 }
+arch_initcall(free_smp_locks);
+#endif
 
 /**
  * text_poke_early - Update instructions on a live kernel at boot time
 
> Bert Karwatzki

-- 
Sincerely yours,
Mike.

