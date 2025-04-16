Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EABEC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4zrBJJLCZeJhENR6VmafxLFJBE/IGwmNNec6pbe9xA=; b=MjxxDHKfbtg/IykRF7nor/Kaq+
	zxjWohJ5jUa2L7/Fzy9k7jTyT6uM/pU2DsQujinYQirAj99xxdve82aDzOhawPCcX6ZeEuXHGhgrY
	1f+9XybvReZpjWNTfknx60RLVe1lr3ja8frUYpf3FtBkrA6sP4V9SRJOXW9GGs0ZX2K2CDEXubnFw
	61s4XfqdCNeMEFXgnmhY/jtNZxjSwUXLFruxc3OpgDz3oT7DXBj6meMTQ3hsYUTanZdJFDhHmmZ6z
	klQP6mEUjMaFtSQFLDwe+7bEc1x/5Uw8p/o6vQX2WRtfWKDILRa+wme914XPV282B8GShel16Jj/+
	N8Pjeb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Bf-0000000AW3h-2B18;
	Wed, 16 Apr 2025 18:08:39 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u578R-0000000AVCp-35DI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:05:21 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so53788605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744826717; x=1745431517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4zrBJJLCZeJhENR6VmafxLFJBE/IGwmNNec6pbe9xA=;
        b=ePGINGMKz01RJeUF+nSqdg7niCp1FCP+6Yy7pUPLicRDyL5dAiMFUaMA9l/LHUp2qY
         Ebck5BGP2hdsrJL1NCHoo0aWP0e0SoYuFpykB/oVjxOlpNsCWpiCTvghYyfweFhsajT8
         dyMlvgVFwvYJH1Ph1WqeU6nxnwluLA9+AjneSAVveAsoyzJeBXdosLzBdLuMkqAGKVV5
         Di0L8762T3SVo4HPDq2OBycmMg0bedrUjTmwa9bJvljbZScbBQHgfIS3+A7g2f4pctoG
         /qC+FCLbNy6/sWEtd2PstvZkY39e18mFLNUh63o405go7cYhvqp37Z8LJRMaN4XztMmF
         RL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826717; x=1745431517;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4zrBJJLCZeJhENR6VmafxLFJBE/IGwmNNec6pbe9xA=;
        b=dFoD6DySFsz4Fs3VOxMjttUzP7wxieJ/qRM9GtMuQcPKOKc/Cyzko/pT8bsei4rJtD
         1zozXvWl6Aq/cNd0kY7iEkoxDTEgOgkYyIse7/iaG+P2ryhPMJY9m++G1CL6ssW7rVKT
         l9S46DzNMdP+CC0/zjaJipnbciDREwEgoBRlR2Aam48tu2MCVeM2TL+/cyMMujBbCIGu
         JHhcS3nYyNotDy2i1OpQywW5Hhe2S7hRanIRGUlljGjX3XmtKhIeWA9m+IIJ10XCIIuo
         UKPuPqL/cMY4y0SvoWQHf/Hr22uTId/daG9eVeog+X2x9jay+3z4AnzwuNFQfT47jt66
         sjew==
X-Forwarded-Encrypted: i=1; AJvYcCUwsJ1za5lmzvdtabf2Bs6yhDYsK6EMbYgSCJb+NCUJrVhWQeNrdoTFIdKIm+Hz4Y0RuQwMGh5cti0pyudGGo5S@lists.infradead.org
X-Gm-Message-State: AOJu0YxTq9OrWuVkRA8Td7D3lIMTW69KmTS/WhgeJtv3GwWhT6gM2fw+
	VcJ766STA1EscJBizcvdfQg95f+3J+KLlYkmkp3Ndz9KEjbzyv8J0hdR2/zGMD3AWRrqxdlrauN
	d7vO7XM7B1Q==
X-Google-Smtp-Source: AGHT+IG37/jJdPo16ODppABBlkwhdau6i150sm+0uUTYuYiDLU7nXYICCYXasqDCVq/D4SyObvt76W48aTqKsA==
X-Received: from wmbbi11.prod.google.com ([2002:a05:600c:3d8b:b0:43b:bf16:d6be])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca3:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-4405d637b49mr28449355e9.15.1744826717658;
 Wed, 16 Apr 2025 11:05:17 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:04:30 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416180440.231949-1-smostafa@google.com>
Subject: [PATCH 0/4] KVM: arm64: UBSAN at EL2
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_110519_772162_896BBF24 
X-CRM114-Status: GOOD (  15.95  )
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

Many of the sanitizers the kernel supports are disabled when running
in EL2 with nvhe/hvhe/proctected modes, some of those are easier
(and makes more sense) to integrate than others.
Last year, kCFI support was added in [1]

This patchset adds support for UBSAN in EL2.
UBSAN can run in 2 modes:
  1) =E2=80=9CNormal=E2=80=9D (CONFIG_UBSAN_TRAP=3Dn): In this mode the com=
piler will
  do the UBSAN checks and insert some function calls in case of
  failures, it can provide more information(ex: what is the value of
  the out of bound) about the failures through those function arguments,
  and those functions(implemented in lib/ubsan.c) will print a report with
  such errors.

  2) Trap (CONFIG_UBSAN_TRAP=3Dy): This is a minimal mode, where similarly,
  the compiler will do the checks, but instead of doing function calls,
  it would do a =E2=80=9Cbrk #imm=E2=80=9D (for ARM64) with a unique code w=
ith the failure
  type, but without any extra information (ex: only print the out-bound lin=
e
  but not the index)

For nvhe/hvhe/proctected modes, #2 would be suitable, as there is no way to
print reports from EL2, so similarly to kCFI(even with permissive) it would
cause the hypervisor to panic.

But that means that for EL2 we need to compile the code with the same optio=
ns
as used by =E2=80=9CCONFIG_UBSAN_TRAP=E2=80=9D independently from the kerne=
l config.

This patch series adds a new KCONFIG for ARM64 to choose to enable UBSAN
separately for the modes mentioned.

The same logic decoding the kernel UBSAN is reused, so the messages from
the hypervisor will look similar as:
[   29.215332] kvm [190]: nVHE hyp UBSAN: array index out of bounds at: [<f=
fff8000811f2344>] __kvm_nvhe_handle___pkvm_init_vm+0xa8/0xac!

In this patch set, the same UBSAN options(for check types) are used for bot=
h
EL1/EL2, although a case can be made to have separate options (leading to
totally separate CFLAGS) if we want EL2 to be compiled with stricter checks
for something as protected mode.
However, re-using the current flags, makes code re-use easier for
report_ubsan_failure() and  Makefile.ubsan

[1] https://lore.kernel.org/all/20240610063244.2828978-1-ptosi@google.com/


Mostafa Saleh (4):
  arm64: Introduce esr_is_ubsan_brk()
  ubsan: Remove regs from report_ubsan_failure()
  KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
  KVM: arm64: Handle UBSAN faults

 arch/arm64/include/asm/esr.h     | 5 +++++
 arch/arm64/kernel/traps.c        | 4 ++--
 arch/arm64/kvm/handle_exit.c     | 6 ++++++
 arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
 arch/x86/kernel/traps.c          | 2 +-
 include/linux/ubsan.h            | 6 +++---
 lib/Kconfig.ubsan                | 9 +++++++++
 lib/ubsan.c                      | 8 +++++---
 scripts/Makefile.ubsan           | 5 ++++-
 9 files changed, 41 insertions(+), 10 deletions(-)

--=20
2.49.0.604.gff1f9ca942-goog


