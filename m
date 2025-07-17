Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2366EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 00:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmzLbnF2j6dVJaKPwtlQ/Mp9hl4jymVmhheF/GFsdMM=; b=AJaO7P00lKbWsqMK50JdZTpuYT
	wLz0VWtFmQq8mBL8BRzKMedzc43W6CZDO73NTFYq+MknMr94G3rTKBs3GHh0ZxGb/ZJ81m0CGyzNg
	R5cDuCJZ6DWrM1CCc9jvrRXH70LnNxxufcQUlcWeTy89zacKGuuKLzZbzb/9FOh6+v6vwgip2yw7C
	rGYLKvPW1XjcpmbFjsnLK5SgkoLCz6W9TvQwpMAgY8lV6Tp/r91Yfnp4LkD4Y9QEInhVC3j3iBlJA
	OPc2C/pD/WjFqr49Pel303W7y/89BFmk2SjRzXWnQVv1DtZ1bPvzw0cZKYg407xJL/PM7xx+3LMxO
	RYRa51+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYWg-0000000BNzN-2dsR;
	Fri, 18 Jul 2025 00:00:34 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucYKQ-0000000BMag-31sC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 23:47:55 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso704358f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 16:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752796073; x=1753400873; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bmzLbnF2j6dVJaKPwtlQ/Mp9hl4jymVmhheF/GFsdMM=;
        b=b9kuxyF7WM/Vl8G6sdJOAmwOGCIJX3mdOIKUEByr4xHi5sGj6zxQJNSSEOQJ7DA7hh
         y1bx/wJ4q+WEi5dSdp/f9RhD+/NT/7pqKc3hKhXVBHYk1EybChtY6W77UP7oALVEagIh
         RrVQrrmhKOS/rQWWyLFdb5Ej/Fds29XIdUlzIMG6YA0qoXdmgpzb0yGdQvgYx36Wa2gk
         U+TTdhHn/wPtuNIme/B3zptTPKENzUCitXnOsUGgie26VL3OX/q0bpC+tNbb63NykG82
         AfgF2nnKGQSb0f0jGElJX0KOsEl7tEHfE/T4yID2lZGNFlVi8Jy9H2GmdAOgL3T2p5Xc
         CklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752796073; x=1753400873;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmzLbnF2j6dVJaKPwtlQ/Mp9hl4jymVmhheF/GFsdMM=;
        b=qJajez/BxQDfMS/juO6ippA9H3V/Gb7AHzzOa2kQUAsZDnSolFG1mxqqkuQvsrhIcW
         V3jpDSCIKtp+GKJbSqrAdoqVsqJ+E+PoKdOQ7yLcoa5o5pyxy6ny72fElDtC8bmHCf9Z
         tM4QsjHh9paq4cC/uydGsyWjqGHT7igesyoNzQIrIGs8f870/HOuHjlAreAEPBqZaBXl
         USJ5g4fjO7Jdq6Q33dLuqHl8LYrZ327Sz3pI35Mp7ZMFz+yLBR+UUwWO4heENLZVUqRK
         ml8ZNOZi8AgKwsJn0PuCV8G1P238rSxRjq/z5dvnmFwWoj6aZkM2ro/dbeXtO67SQ8u/
         /MAg==
X-Gm-Message-State: AOJu0YxleTgELSsNA04lvqQg4V3A61RKENeLQTuzgEsTSW+Wn5ezZ1vt
	MO+FDwEhtdhgqRDqR78o32E9hPSJoH6zoz2JHvozv+Qw7HkhfQFKsDMYJlXI1wYkV5AnJjv2pZ4
	ZM8lSP8unxWFaLXZNFBwWoQisvlBUoA/BwrRSudziF7NlTD19z2YAdZySSUQNu6uwD1ouvCn9Sv
	+o+PYvRQrKchK9sTXoCji/VoHg7fir0LPVmmEac4nVWs6ylKGLmQA4XjPstMPTXOw5xQ==
X-Google-Smtp-Source: AGHT+IGZHRkGEI95lbs1FRrqgy+02r8k4XIFuVIZqzJTu8682nwwu/iFMxnvp6lbNsckQkII7hCCWDNCPJ+Z8w==
X-Received: from wmbhc26.prod.google.com ([2002:a05:600c:871a:b0:456:245b:44bf])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e8:0:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3b60dd651d2mr6895573f8f.2.1752796072756;
 Thu, 17 Jul 2025 16:47:52 -0700 (PDT)
Date: Thu, 17 Jul 2025 23:47:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250717234744.2254371-1-smostafa@google.com>
Subject: [PATCH 0/2] Dump instructions on panic for pKVM/nvhe
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_164754_779868_37BFF4DE 
X-CRM114-Status: GOOD (  13.03  )
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

This small series, adds support for dumping the faulting instructions on
panic in pKVM and nvhe, similarly to what the kernel does as follow:
[   12.012126] kvm [190]: nVHE hyp BUG at: [<ffff8000811c5f64>] __kvm_nvhe_handle___kvm_vcpu_run+0x4/0x8!
[   12.015747] kvm [190]: Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE_STACKTRACE
[   12.016044] Code: a8c17bfd d50323bf d65f03c0 d503245f (d4210000)
[   12.016082] kvm [190]: Hyp Offset: 0xffeff6887fe00000
[   12.016325] Kernel panic - not syncing: HYP panic:
[   12.016325] PS:204023c9 PC:000f8978013c5f64 ESR:00000000f2000800
[   12.016325] FAR:fff00000c016e01c HPFAR:00000000010016e0 PAR:0000000000000000

This can be useful in debugging cases of memory corruption.

The first patch adds this for nvhe and CONFIG_NVHE_EL2_DEBUG which is
straightforward as at the point of panic there is no stage-2 for the
host CPU, so it can re-use the kernel code to read and dump the faulting
instructions.

The second patch adds this support for pKVM, I splitted that into patches
as the pKVM changes are more fundamental, as now the hypervisor text would
be mapped in the host stage-2 as RO all the time.
An alternative is to make the hypervisor read its instructions on panic and
passes it to the kernel panic handler, but as we are out of registers
(X0-X7 used) for the arguments we would have to move that code to assembly.


Mostafa Saleh (2):
  KVM: arm64: Dump instruction on hyp panic
  KVM: arm64: Map hyp text as RO and dump instr on panic

 arch/arm64/include/asm/traps.h  |  1 +
 arch/arm64/kernel/traps.c       | 20 +++++++++++++-------
 arch/arm64/kvm/handle_exit.c    |  3 +++
 arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
 4 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


