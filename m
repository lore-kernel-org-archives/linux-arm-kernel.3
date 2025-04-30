Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74351C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=son2TtAYXWFKHIb+qv3GEJQE2heH3nn7VYU4EbNQqf8=; b=qmqednJTh1ss5FvOY8oG80PdGi
	iCa8Mu9qNK53Q8D2cKtp59puCefKjTsjY/sPN3tJ1yZXYTku0Ki8vxPkN/SLpCBSWpfVrAzy2zHaF
	DmITXqOVGgVPNHfV116G7+FwM5oaLSgieMpQLv+dl423FzehPkb3raR4ioirZPOysL6yK8NN/JANX
	94Jww88l1lIx0v5xafQ1XwvO6gk3mZGfz4NU+McOFkp8onHslctsY+LvIZL0Vn+Gm7Tt1yyG0cb6n
	aZLgJlrsFwB7knEj+imWM52ZmyrJB+wI97VUU/FzgRwEDO/W/FQNH9hcJabgiLGEquyfFvzxCIfow
	7Ttze65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAM0-0000000DRnr-1lG6;
	Wed, 30 Apr 2025 16:32:12 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAAHO-0000000DR2Y-16Ek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 16:27:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so54119535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030443; x=1746635243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=son2TtAYXWFKHIb+qv3GEJQE2heH3nn7VYU4EbNQqf8=;
        b=rZDPdKq570jSyjFBKsRdLxzC4NC/0AvIMXICwhSrs79gpJLpEsP29RLOL1buxc843q
         1Oj4NYgMJ1ODlQ/kH5g20U8wONEdQb5kN11jT+xdbn1g+tGamh4Q9LD1MnF/W2WxJ3f0
         e5n0hTNOmTxo/6NyFhRgU8n8oxtKTDgTWWmq8/JdEQsdJEH0Y/nwAGBooVTsdrp/bZok
         byTDTdfHox7mOIXdbCP1ZagQWBrobDOC5E9hD3RGgk97eZsIGOW73q0dMnKQN4kO5nV3
         vQgm7cgdMajCFdCx2ZK874DefzOU4t66JNQgVhuzaj6nxmU3gufY6Bu5zj3rAiIal3i9
         3Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030443; x=1746635243;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=son2TtAYXWFKHIb+qv3GEJQE2heH3nn7VYU4EbNQqf8=;
        b=mXz2tyFibFwnOV4IIimDt69a5/V5mqzSFY4nj79iwOfvyNmi7yRllVhuvKtaTD8bJr
         n69gKDmRcoZAg2CkSk5dNAnBGNEFrqm+gZFuygDxvCyiudwowBSOI7YtVRFOTWPRDlTK
         2ULx2JUwEvIQdleHITobM3rir/mr5pWOhgGvAwxhNWgcZqsSpLclTBpLwpJ5SkM9DElV
         HyR00nURKm/82xG7IYAEv8mYoTMVWdeDdcxfVJTSIRm37sEtpt9BVoV/bV4gHKIK127s
         XNY7fkI+vkRmzdimx9FY3q4B4MkuYcXCsUklFDxa9GSUmDT9mEGdVHIAbA9H3qBYEjHg
         Avqw==
X-Forwarded-Encrypted: i=1; AJvYcCWMCZxlPJ9L+x6lHAQrsntxtkukEakXqHNgYyKP0ftI+GRFLX1R+kAptx0QH1cwEobJd+PGRa3JJvlJ+mdZcH4P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyw1x5h2ANqQyKt+w2ZBmlVFgJFh9a9r6MLJY2Gy13TiM0m13L
	2IfVwheGJag1Ek4EW85G+ddFEg+ExoeVPU186YrbwI5gyfGkxpN1RTdbwpOcy60G9DqgMvrqOFh
	VvDVU0tSniA==
X-Google-Smtp-Source: AGHT+IFQ2Mdes0eRtKfnxWeLvHYhOcWYODGlYYFwAfRst9gZKnEGAYllVA7JEZatII5sz3zXBjKQtfWJvzFPDQ==
X-Received: from wmqb17.prod.google.com ([2002:a05:600c:4e11:b0:440:5e10:a596])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0c:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-441b1f31004mr39397195e9.2.1746030443778;
 Wed, 30 Apr 2025 09:27:23 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-1-smostafa@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
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
X-CRM114-CacheID: sfid-20250430_092726_304347_CCF8D19A 
X-CRM114-Status: GOOD (  16.84  )
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

Changes from v1:
- https://lore.kernel.org/all/20250416180440.231949-1-smostafa@google.com/
- Collected Kees Acked-By
- Rename CFLAGS flag to CFLAGS_UBSAN_TRAP
- Small comment fix

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
2.49.0.967.g6a0df3ecc3-goog


