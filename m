Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EEEE74AD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gd8Mc8v14iSCV6tXKcMIGVB2dKHeyGJMYC7xc8llT34=; b=NltcnHqy4n2ZLiR2y7zHEv2VkI
	LqtJiR/Zy3ACjgRgUckXyUSsTRSMcXNaXOT/0yEeFQmxkdUqV9kIqgOGGBIIkwzcQOJtmY7MEiMFg
	4L+JJkAqQEbDJ98OhRk2HpR29TIWOAMzJNx5Ne1dQUx8pZr/9VeQU531tqlyP5QpRqufwQpKr/8Vz
	5ZCuhuLaPAe183H41I5joqjEjYiocx8gZBweV94Wt6njHazgovk509eTsrU4SuTYqNI03NDYK01yN
	ruJHsr9b/6J2DU/2Lganrs/GSuQT44L8xXMdf8hyArT0mOCZzyc7W1i+HjsaQlKqar2UB3duYcXoP
	bGC+PmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaKB-0000000AmAe-3qwC;
	Tue, 03 Dec 2024 21:20:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaJA-0000000AlxE-0kbn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DC655C6D80;
	Tue,  3 Dec 2024 21:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888FEC4CECF;
	Tue,  3 Dec 2024 21:19:45 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>,
	arnd@arndb.de,
	hch@lst.de,
	rppt@kernel.org,
	thuth@redhat.com
Subject: Re: [PATCH] arm64: patching: avoid early page_to_phys()
Date: Tue,  3 Dec 2024 21:19:43 +0000
Message-Id: <173326077458.517002.4357104295343949029.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202170359.1475019-1-mark.rutland@arm.com>
References: <20241202170359.1475019-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_131948_262736_3EB911A1 
X-CRM114-Status: UNSURE (   8.67  )
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

On Mon, 02 Dec 2024 17:03:59 +0000, Mark Rutland wrote:
> When arm64 is configured with CONFIG_DEBUG_VIRTUAL=y, a warning is
> printed from the patching code because patch_map(), e.g.
> 
> | ------------[ cut here ]------------
> | WARNING: CPU: 0 PID: 0 at arch/arm64/kernel/patching.c:45 patch_map.constprop.0+0x120/0xd00
> | CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc1-00002-ge1a5d6c6be55 #1
> | Hardware name: linux,dummy-virt (DT)
> | pstate: 800003c5 (Nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> | pc : patch_map.constprop.0+0x120/0xd00
> | lr : patch_map.constprop.0+0x120/0xd00
> | sp : ffffa9bb312a79a0
> | x29: ffffa9bb312a79a0 x28: 0000000000000001 x27: 0000000000000001
> | x26: 0000000000000000 x25: 0000000000000000 x24: 00000000000402e8
> | x23: ffffa9bb2c94c1c8 x22: ffffa9bb2c94c000 x21: ffffa9bb222e883c
> | x20: 0000000000000002 x19: ffffc1ffc100ba40 x18: ffffa9bb2cf0f21c
> | x17: 0000000000000006 x16: 0000000000000000 x15: 0000000000000004
> | x14: 1ffff5376625b4ac x13: ffff753766a67fb8 x12: ffff753766919cd1
> | x11: 0000000000000003 x10: 1ffff5376625b4c3 x9 : 1ffff5376625b4af
> | x8 : ffff753766254f0a x7 : 0000000041b58ab3 x6 : ffff753766254f18
> | x5 : ffffa9bb312d9bc0 x4 : 0000000000000000 x3 : ffffa9bb29bd90e4
> | x2 : 0000000000000002 x1 : ffffa9bb312d9bc0 x0 : 0000000000000000
> | Call trace:
> |  patch_map.constprop.0+0x120/0xd00 (P)
> |  patch_map.constprop.0+0x120/0xd00 (L)
> |  __aarch64_insn_write+0xa8/0x120
> |  aarch64_insn_patch_text_nosync+0x4c/0xb8
> |  arch_jump_label_transform_queue+0x7c/0x100
> |  jump_label_update+0x154/0x460
> |  static_key_enable_cpuslocked+0x1d8/0x280
> |  static_key_enable+0x2c/0x48
> |  early_randomize_kstack_offset+0x104/0x168
> |  do_early_param+0xe4/0x148
> |  parse_args+0x3a4/0x838
> |  parse_early_options+0x50/0x68
> |  parse_early_param+0x58/0xe0
> |  setup_arch+0x78/0x1f0
> |  start_kernel+0xa0/0x530
> |  __primary_switched+0x8c/0xa0
> | irq event stamp: 0
> | hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> | hardirqs last disabled at (0): [<0000000000000000>] 0x0
> | softirqs last  enabled at (0): [<0000000000000000>] 0x0
> | softirqs last disabled at (0): [<0000000000000000>] 0x0
> | ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: patching: avoid early page_to_phys()
      https://git.kernel.org/arm64/c/8d09e2d569f6

-- 
Catalin


