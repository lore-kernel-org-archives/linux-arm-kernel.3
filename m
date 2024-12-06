Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01990E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=40IeoncDegwdvePviQ9Ac1q99emn7vMhde6cXPhiSAU=; b=TJFVFA7thX1y6FYquKUcNocio0
	sxuqCvTgYJ50dQpi2NQGxWlRlFM9V4aB0MSzTaxxCQREbYCiDeCfybG9aEn1WQOtHWVyS/0KAQ3eu
	uqQ3eI18RFyduusxcMPyoMKCiuqMkDKrUocMUn5aYgAMGqmhas41wsRrR6hx752e8jG3fPA0QlxEe
	+o2cKQBRVh+ocLSzoSR6RSJ7fm0jOPWrkzWosTxr6IRDS6u52p9mZjTFmwt+jy/2V181JYypH+QeL
	zeY9Zjpdm8TMVAzFK1N1ebyX0ij3yLUVPtHwkePIvXMPtLaaGZH3f6EwZnZv2iVmPBMIFRlO/XmUu
	cS49KAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbNR-00000002CiL-1ZIn;
	Fri, 06 Dec 2024 16:40:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEU-00000002AIY-2jG2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862a921123so731780f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502668; x=1734107468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=40IeoncDegwdvePviQ9Ac1q99emn7vMhde6cXPhiSAU=;
        b=Oz+8D5pHjd/SxODqn5J2Gp0qmfHFM8eYkwJOtWKa5nXCkwefdLUH/71+SG67yHqNM2
         KxS4Qzdsq/E9AD2E0vIfRjyb4ctTkwh17amvWX9YapNmXN5zoxAZtximUiAPzivFxorc
         tfH6cCu7/qzOAEPRfv4x9E4wovffJWOXgMe83Ap71BsUFiaCsRKU5kdmYfr8oUEpGJGX
         QSkWiKelARSQe2MWQ3tgDYiILnuT3mMPFZLZhImxldupz9bTTJ2z0AWPzVp59Q7fAkGo
         4Mi16VYFutayMk2HygPjwpmCKtfHN6RCaHObNPZV7+qQ9XW07cfYMvM54XbJ80nn5MoP
         UMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502668; x=1734107468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40IeoncDegwdvePviQ9Ac1q99emn7vMhde6cXPhiSAU=;
        b=nxWL+i78fNljtG5I+osRvtG9bsyHHLSjSZf8j5jiC3O/qQimAdWxKticpb3oP43Vs9
         HLBXZjaGGxg4lM+p3/fmLCVgJSG/qbBJAoKe7ganABj5O1sXLBPh9LQFEdaCpWXpE0Qx
         MsQTmBx/Ch9bXCMdW9aluSVCfecmDaYv2dPKYRl82fTXiqMULeAM4r6l7zdlg7gQYHtT
         GQGBvoXK2xYKDuHZ0Evws1bdPcZX8q5w8ERGM8rjFFhFMENqE5Ehpv1zpNeI8Sy0qdrO
         JyxZJ3B9o1BDYgcuUbvR6WiQpv/1fn7mcyEnfOLAvHsZZDdCCtcSX5JFPoXyU49y9eic
         Lxmg==
X-Forwarded-Encrypted: i=1; AJvYcCUON/qvb1zFVGTsmgPBYVFM6GMH3QQdbzTZIN65eJJpwMInvJ67LUa0YACa8IiD5S2krgJ6YhncvGSEylwPVH5L@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx4GhFmAOXgETy5LFoUmuQZk6fV6sLE12YH1myueDr7hAgrgHG
	cGQNDIGhqRTGAzAjyL+RJv2scw1eEOojrslMEpWlEKfZ218lmDPRbFiE9RH99T0=
X-Gm-Gg: ASbGncuLtUobTThLsUj/A9CophlAejuwXEbsJCkvnbfR+18Ne+YeLKJR09AHUMquMhD
	OhqC75hoUA4veP7+drql5aN9Lvn8h3aZ4a5SAye6vB0tJxOvTopddu9+aif3cNerZRW9f2+fZk+
	oeDHN1Wd/0aqeEPJwTocF/mKMySxLHKshOR9yu9rrs+DnQA+LOdvuDUAQa8ddGhT49nXZjFjECO
	vyh2rGpjO0ujdJpEhRkkjWPrtc4Y8lAeqeZitDvWtbuiQJMhTI=
X-Google-Smtp-Source: AGHT+IHAkbc/dcGz/MjNU6vQq8UGceABhupZgIW1uIKLdzsf3QUJS33oSh5p4cBX6H9+RneNbzUK4A==
X-Received: by 2002:a5d:59a3:0:b0:385:dffb:4d66 with SMTP id ffacd0b85a97d-3862b36a491mr2894353f8f.17.1733502668076;
        Fri, 06 Dec 2024 08:31:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:07 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 0/4] riscv: add support for SBI Supervisor Software Events
Date: Fri,  6 Dec 2024 17:30:56 +0100
Message-ID: <20241206163102.843505-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083110_951914_3A01A56E 
X-CRM114-Status: GOOD (  22.64  )
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

The SBI Supervisor Software Events (SSE) extensions provides a mechanism
to inject software events from an SBI implementation to supervisor
software such that it preempts all other supervisor level traps and
interrupts. This specification is introduced by the SBI v3.0
specification[1].

Various events are defined and can be send asynchronously to supervisor
software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
as platform specific events. Events can be either local (per-hart) or
global. Events can be nested on top of each other based on priority and
can interrupt the kernel at any time.

First patch adds the SSE definitions. Second one adds support for SSE
at arch level (entry code and stack allocations) and third one at driver
level. Finally, the last patch add support for SSE events in the SBI PMU
driver. Additional testing for that part is highly welcomed since there
are a lot of possible path that needs to be exercised.

Amongst the specific points that needs to be handle is the interruption
at any point of the kernel execution and more specifically at the
beggining of exception handling. Due to the fact that the exception entry
implementation uses the SCRATCH CSR as both the current task struct and
as the temporary register to switch the stack and save register, it is
difficult to reliably get the current task struct if we get interrupted
at this specific moment (ie, it might contain 0, the task pointer or tp).
A fixup-like mechanism is not possible due to the nested nature of SSE
which makes it really hard to obtain the original interruption site. In
order to retrieve the task in a reliable maneer, add an additional
__sse_entry_task per_cpu array which stores the current task. Ideally,
we would need to modify the way we retrieve/store the current task in
exception handling so that it does not depend on the place where it's
interrupted.

Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
handled and does not adds any overhead to existing code. Moreover, it
provides "true" NMI-like interrupts which can interrupt the kernel at
any time (even in exception handling). This is particularly crucial for
RAS errors which needs to be handled as fast as possible to avoid any
fault propagation.

OpenSBI SSE support is already upstream.

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf [1]

---

Changes in v3:
 - Split arch/driver support
 - Fix potential register failure reporting
 - Set a few pr_err as pr_debug
 - Allow CONFIG_RISCV_SSE to be disabled
 - Fix build without CONFIG_RISCV_SSE
 - Remove fixup-like mechanism and use a per-cpu array
 - Fixed SSCRATCH being corrupted when interrupting the kernel in early
   exception path.
 - Split SSE assembly from entry.S
 - Add Himanchu SSE mask/unmask and runtime PM support.
 - Disable user memory access/floating point/vector in SSE handler
 - Rebased on master

v2: https://lore.kernel.org/linux-riscv/20240112111720.2975069-1-cleger@rivosinc.com/

Changes in v2:
 - Implemented specification v2
 - Fix various error handling cases
 - Added shadow stack support

v1: https://lore.kernel.org/linux-riscv/20231026143122.279437-1-cleger@rivosinc.com/

Clément Léger (4):
  riscv: add SBI SSE extension definitions
  riscv: add support for SBI Supervisor Software Events extension
  drivers: firmware: add riscv SSE support
  perf: RISC-V: add support for SSE event

 MAINTAINERS                          |  14 +
 arch/riscv/include/asm/asm.h         |  14 +-
 arch/riscv/include/asm/sbi.h         |  62 +++
 arch/riscv/include/asm/scs.h         |   7 +
 arch/riscv/include/asm/sse.h         |  38 ++
 arch/riscv/include/asm/switch_to.h   |  14 +
 arch/riscv/include/asm/thread_info.h |   1 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |  12 +
 arch/riscv/kernel/sse.c              | 134 ++++++
 arch/riscv/kernel/sse_entry.S        | 171 +++++++
 drivers/firmware/Kconfig             |   1 +
 drivers/firmware/Makefile            |   1 +
 drivers/firmware/riscv/Kconfig       |  15 +
 drivers/firmware/riscv/Makefile      |   3 +
 drivers/firmware/riscv/riscv_sse.c   | 691 +++++++++++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c         |  51 +-
 include/linux/riscv_sse.h            |  56 +++
 18 files changed, 1273 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sse.c
 create mode 100644 arch/riscv/kernel/sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sse.c
 create mode 100644 include/linux/riscv_sse.h

-- 
2.45.2


