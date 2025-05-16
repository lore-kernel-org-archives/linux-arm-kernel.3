Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07788C54795
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=; b=KLgczEi4wXuv+V8NzgdB93QVNv
	JxuWi/wA9xo7WgTMqOPq4X8ylSxW2MYm/UGUzV142mi2CTOPHe1cni9IjlgGn16hySLwAnftXgdSy
	urAwsV3rj/vFz424Uy3DvIsBxFZB6eVqlYOA8uZdbKU+ay3ytTshztmWKQECTzwpklPqQowdfeFT1
	oOhytkXCiNgu6yQFvqwuh3DqfHTiZvJtWYl5IZhM5TYmZ1f890AeoM4AcivE9tRqWKbEJSU2a/+9I
	0+4HsqGJDWUXu1ySM1p+5qzHvtFzkWephLkY13HOHkDIfF1gcTDLp7w6UGlvYPBpBoI/UqgqHLkmU
	28pueVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQC-00000003vBD-0qRF;
	Fri, 16 May 2025 15:56:29 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwv8-00000003qCf-0c6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:24:23 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-605f7d3215cso1343119eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409061; x=1748013861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=Z/Ke4th5lEFMb7/RcXD5yoeGlOpEZOb4mJv/1Az4BrJFvwU7JqZOK2iHPhzOA1FkHW
         LfQApDUbnUQK9qBlCyxxIlDD9sPyrs8BqY8Z1cVDHBzaZxiASjUE8BsAurNZ2ozSrsuM
         t0++wsEzoahJ2oP0CFR44BvKdJxBISssKBLKyozOQcrnw6Pco4QKvgqGefiyRdcUVac8
         n5xZi9LfVSzkXM252HcxmPGnOljRdqWqUCURnBoXbtonvPyzq2Ar1VomFO+3yvuB6OJl
         Ah8HojieyA6dkEPlyvQzQu6pESy3J4p/HHxHcAaS6SeNKhekBDaeTJXJDssCmmuhmPld
         Y5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409061; x=1748013861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtOqMVpDb5beeKTmS57Q+DqCN66UUqR4O4lRAPl/Pjc=;
        b=Aq/C7RYzssQCMeS9HIPz+VpKty3kG2JrJiFXY2FTWWN1wGAz+bKw+fyRzjrW30dTSB
         2eGlb9JS1G5R5A/xnVwyehDcBURbSe20W00tVC3aPsowAmDH+E4LEeOWmPhpn9A23fca
         HVK0k37OJYeFtCOnEAVY0aa9kwrCnNJuuG5WlDv2ZUML0hMHsTweMO6kxN8/IOPMyUNw
         yjVLH2APO5sVDU6zAAeCXeIbmvYAJSd6Md6KkpAf9oYSGl5t1iBRMQQIv0bEaONmgwzm
         3gjdxnqc6/ryViLmg2MsfUhOGv0hZB61moY7Ot+liKywDjky5ws0Un+/LNdZbA2i5vAR
         abZA==
X-Forwarded-Encrypted: i=1; AJvYcCXuJ49I4S+j75qIs4E3hPXNuqEsySku6pfSWEr/CS6Bm93B/bMEpsWUwrGi932h4gtmIZnaQkl3zMp9CCue6C+I@lists.infradead.org
X-Gm-Message-State: AOJu0YwvGACN2hKk3r7n2hyPPY4EJ/biDy7VQOdpYj3lZ3rbnf2fuORL
	Tmj5GjF1aZMmivvCNDptn5oSyHl6mHgK6tmTdUXUYmwuZUiUZ54NMiCUdNE/iRJkAPouofyBvEm
	g6MCR9hg=
X-Gm-Gg: ASbGncu1tsK/GDMcD8hKT+S+FkAiOxQHxbwEvqED0/oXv5p218veUa8PfXEPXaOCEYX
	GjT26wnseJ2owGeEuQSc7FFnN5+2hLTLRcuy9JyEFveck/0suJ6YiUUprLwIRHKX3hPssgVl79p
	xC8YfI9gOfU1kpgNTxU5ym48Y3tsiIU/Smxo2m0G5YDKbWBZJorq+XUEjcSknzxcgeXTXog/KR4
	9gDBqWWvhkzkKpO4XK5jfUuIIjXW0XmX4m/2NFvD34OUPzeEjieFeUyA5AiaS0vRhC2DeFq06ug
	GamFy9L3JmnW7S6C6FOCPy6xZdMes+DRkRGetDlvFL84punS02cn
X-Google-Smtp-Source: AGHT+IExb77aBo1LIezbIdH98oPYn1SbELTTVMkD5q9whj7vlwOG/qOpu/YD++YYt08LeDhnPFn1Zw==
X-Received: by 2002:a05:6a00:894:b0:740:a921:f6de with SMTP id d2e1a72fcca58-742a98e9c0cmr4813351b3a.23.1747409050021;
        Fri, 16 May 2025 08:24:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:09 -0700 (PDT)
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
Subject: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software Events
Date: Fri, 16 May 2025 17:23:38 +0200
Message-ID: <20250516152355.560448-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082422_184903_CB1ABE7C 
X-CRM114-Status: GOOD (  26.24  )
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
interrupts. This extension is introduced by the SBI v3.0 specification[1].

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
beginning of exception handling. Due to the fact that the exception entry
implementation uses the SCRATCH CSR as both the current task struct and
as the temporary register to switch the stack and save register, it is
difficult to reliably get the current task struct if we get interrupted
at this specific moment (ie, it might contain 0, the task pointer or tp).
A fixup-like mechanism is not possible due to the nested nature of SSE
which makes it really hard to obtain the original interruption site. In
order to retrieve the task in a reliable manner, add an additional
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

While OpenSBI SSE support is already upstream, an additional patch is
needed for the PMU perf driver to work as expected [2].

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
Link: https://github.com/rivosinc/opensbi/tree/dev/cleger/sse_pmu_irq [2]

---

Changes in v4:
 - Fix a bug when using per_cpu ptr for local event (Andrew)
 - Add sse_event_disable/enable_local()
 - Add pmu_disable/pmu_enable() to disable/enable SSE event
 - Update event ID description according to the latest spec
 - Fix comment about arguments in handle_sse()
 - Added Himanchu as a SSE reviewer
 - Used SYM_DATA_*() macros instead of hardcoded labels
 - Invoke softirqs only if not returning to kernel with irqs disabled
 - Remove invalid state check for write attribute function.
 - Remove useless bneq statement in sse_entry.S

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

 MAINTAINERS                          |  15 +
 arch/riscv/include/asm/asm.h         |  14 +-
 arch/riscv/include/asm/sbi.h         |  65 +++
 arch/riscv/include/asm/scs.h         |   7 +
 arch/riscv/include/asm/sse.h         |  45 ++
 arch/riscv/include/asm/switch_to.h   |  14 +
 arch/riscv/include/asm/thread_info.h |   1 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/asm-offsets.c      |  12 +
 arch/riscv/kernel/sse.c              | 132 +++++
 arch/riscv/kernel/sse_entry.S        | 169 +++++++
 drivers/firmware/Kconfig             |   1 +
 drivers/firmware/Makefile            |   1 +
 drivers/firmware/riscv/Kconfig       |  15 +
 drivers/firmware/riscv/Makefile      |   3 +
 drivers/firmware/riscv/riscv_sse.c   | 696 +++++++++++++++++++++++++++
 drivers/perf/Kconfig                 |   9 +
 drivers/perf/riscv_pmu.c             |  19 +
 drivers/perf/riscv_pmu_sbi.c         |  72 ++-
 include/linux/perf/riscv_pmu.h       |   3 +
 include/linux/riscv_sse.h            |  59 +++
 21 files changed, 1340 insertions(+), 13 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sse.c
 create mode 100644 arch/riscv/kernel/sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sse.c
 create mode 100644 include/linux/riscv_sse.h

-- 
2.49.0


