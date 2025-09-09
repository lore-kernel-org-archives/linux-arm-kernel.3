Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DCCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KajtByV00Jiv7Lq5klOsW6LBWHVxcYTPd9aKtLeCCjQ=; b=MPdf2Jqr5kzvYccQsoGPJpFQVQ
	ljhCuXejmTQDC9hR19lLNbsaWzKUwa7UowGAoa4PKbXeHTqzcSJ1FCDI8thuFdC3l/CDQLWeBziAI
	2iLelik+onSxq3YwnOP7Rf958/vxUovOsoboMbXLBJAYMFAZhNw9Zh9Laio+Ef4XL83y5GMOUGcMY
	R04qi178Gn6bL54Go48q/79B67NtWphMyVwCKrda+dtQBNjnT9iJIW8Qd4l8L8+3vSh8sxT/TB6u8
	5t9EWAddK/+GUuHqjlYnzg1asY3tiJRXLOncXw4rhSIhb5SE7UjbDBlI5dMlf9wGRdMm75QvhunXL
	5VkUMTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zS-00000008tQi-0EaF;
	Tue, 09 Sep 2025 17:18:46 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyWZ-00000007R6e-1fXS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:36:44 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b04a302fb7cso298184766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757425001; x=1758029801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KajtByV00Jiv7Lq5klOsW6LBWHVxcYTPd9aKtLeCCjQ=;
        b=hU+ql3yr6iFFtb0H39/z2C0nPEsJOvXRFS+YkXf0M7XBjvpxuEPxzELtdCQmSYbEmZ
         A3fxYffvyqBEH640y6CDQbTR8Trl9+9xcA/esHhSII42wbWdMdGs+ujhfgDwUA/nA9X5
         d/hlX9BhOS/Y4IYLG5N95vvh0UrCWnZAgYqPABilseDwhSAWCwnm9x5SykCC1boljSt0
         SdEIEEL/AY3F+hUtuQgG3q1NWIL4pzcJC7rRarD9le5/jGJUyck1hmo39uetHrCAMHNG
         Q+Wn16pWSkC24/PByS2DyEe+jEaobQ9xnMorvwv+DTX8clPt+e5RaX2vZ2cTjxjTsENY
         opmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425001; x=1758029801;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KajtByV00Jiv7Lq5klOsW6LBWHVxcYTPd9aKtLeCCjQ=;
        b=iZEolNmz+XOciuDCeXzWHW+XD2y7dyfpxNSuPeWzuO4y3IfORpgfl1ak668HhV52Ym
         avhm3gXxpbyj/dSTSuml0zjfyTeB4SbckPWJBhd2xEhAVOkZOiUjgaPFnnvkokFsB+MS
         QJJ17PGawYjrFKEgyzk9ZbLL0Fo15z8JunK8D6lh/8GLZaQVBWvxHhWZQKFO6RmlQ5Fh
         xltC/JVEhQMPiNPBd9LZIsfVpYWmCsVxNKJVtoxxRR3vWTP4sMEz62zia74aT7nJbY2G
         URFR5NPNvldJBYjCqTq888iav5FyAKB+yU+GtTru3Ntpuod06pye4POhAoliU91eT3n8
         eQxQ==
X-Gm-Message-State: AOJu0YzVmR9kroKldueATOUlyiIhxr4auMS4lBo03A+FuxxYV8pi/kw3
	LF8RRX+J1joDNEGPnyOqot9Yt32vTg9x7oKEP1hcs4DVX1j9Ad/0ouk9jSgXnKAVfCnY0Lsmefj
	0Av7xSN3+Knghmh5UKdzuoiAmlkzTePXoKKmAYFQDW93bXfjy3XftFjiQz96MToZu6oUODCS1S3
	Km2R77wwzQfqN8EIbylzQpcWuX6HuleEUlHax+z5t7+tAk3toLU8IHQJXL6CoymZ5i/g==
X-Google-Smtp-Source: AGHT+IFqVLQR77jh2DKFIMEQIj5PFCy5tufvnMQYcv7fwo55KdSMKKQJ2x/wsNJRgC3/doxiiHv5VPKIl04qJA==
X-Received: from ejctk11.prod.google.com ([2002:a17:907:c28b:b0:b04:770f:8673])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:fd17:b0:af9:414d:9c2 with SMTP id a640c23a62f3a-b04b1403616mr1087102366b.3.1757425001267;
 Tue, 09 Sep 2025 06:36:41 -0700 (PDT)
Date: Tue,  9 Sep 2025 13:36:29 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909133631.3844423-1-smostafa@google.com>
Subject: [PATCH v2 0/2] Dump instructions on panic for pKVM/nvhe
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, perret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063643_434385_6DAFB693 
X-CRM114-Status: GOOD (  14.98  )
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

Changes in v2:
- Harden instr dumping based on Will's feedback.
- Collected tags

Mostafa Saleh (2):
  KVM: arm64: Dump instruction on hyp panic
  KVM: arm64: Map hyp text as RO and dump instr on panic

 arch/arm64/include/asm/traps.h  |  1 +
 arch/arm64/kernel/traps.c       | 15 +++++++++------
 arch/arm64/kvm/handle_exit.c    |  3 +++
 arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
 4 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.51.0.384.g4c02a37b29-goog


