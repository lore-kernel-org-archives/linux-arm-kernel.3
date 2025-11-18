Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B74CEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 02:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QM24pHmOGe73VnNxtQT+ZKbda/Zu23oD+FjlwZTAOyI=; b=I0xDoVYvN9lJjUXQcIBH3Wp22s
	+PE13pAJBR6qzAWWf4uOyFCDu9oLKFUNpNiE+QL+EKkbJ840D7tvU4tJF8J3Ukpr3L0EvhLaEFVKZ
	StSS0QVEFU+/fxadhMgMKcSYqwgp3V+wYr4pffOfh64FMrjgs6MRo3oInZR7vJYWZqsKYrwptoY0G
	JLszDDsHo7nPYYgIr1/d1AZdgsL50imw9gu1nQelMX9/OHPTpF2dzLCj/tU4RrsCa0Php3pnnPCJc
	Oz99904ZAlqwqz7QD3E4IsTL0AE8mEzzkxdQ0i9VcT1h6JOJ3zZnTayIuUc3b/EYULrwi8NaU/Iot
	jSE/y5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBng-0000000HFJh-3er7;
	Tue, 18 Nov 2025 02:50:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBne-0000000HFIy-0ea1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:35 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-297e264528aso50289455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 18:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434229; x=1764039029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QM24pHmOGe73VnNxtQT+ZKbda/Zu23oD+FjlwZTAOyI=;
        b=EX4noy+xIfbQbB3sOYAC4UBkAeFtRN1vIzIXoxTq9FwAFWO3TdX4XwxRRmiiBbMd8C
         4hJhfXhny8Ee+Md6eC+4u+lBbXgIBzMxuWchgQIr0/7U88nuaRoSw4iVyc/qtFIuI91F
         hi9e6RXf7WGN5aBXJS02lkzyTCqxEnFknVxrzDlNYjxnNh/HBpdf1PaVcg0Voy9Fnr9t
         uFqiuC/M+htUSeMVdUFs7b8SZAoQ2uUW8g5tHuQXg2aU68oAn/x/n4475OM3HOli4KcS
         wrlfroZ/07CSKUlO37whjVPnJXybOFnuV4BydE98q8GEVeVehqs+kqwInOCVMVCLdMEr
         LUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434229; x=1764039029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM24pHmOGe73VnNxtQT+ZKbda/Zu23oD+FjlwZTAOyI=;
        b=plJ0UOD63MxdS48ROLGNOifcyxN0K6E9EyTRyp83HlEXIw6as26ZnmPGG2S0xn1fTv
         Tnaxt4U+C+AY4u78lzG6kHKa+r+4Q06DWXBeEeVGZ+Y0QJJaMYXNaDim4RkATwBxKbXy
         MkvRdW8uyGvPVbvq+iEk5RhUZuX0yNQ2+OaW/kznoBSTeTTzICx0H0YsC1wne8EB67Zw
         9TRfbJCYV3MFdItdzkh6qUK04dtJauOWuvv+9Dje7vVx3MMeOPTtKtZxu4UsjhBVbFDI
         cg9HAOy7D03jMqeOWSg8v8oPy/P6joWIBjPQuYDoK3YVWFxmS3gdXp0w+QUnlTWOXYfO
         WW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRwnwO8u+jYwSuMaUXxZpV7l1CLqp/XjdddZNFBnVQeW9WC77kFIsg1jmKG9n9kz17HL32Jrl8yzggv4l8xgjI@lists.infradead.org
X-Gm-Message-State: AOJu0YwiijqzPeRsFbNXfHgPXJRusVS+926WNiw4Orwfy0de4pzLCdhM
	VoyYiCPPDBIlEzy5tzBBJ3GFu28+ubBznliqHF7HebSTY6MdwxfYISschJVmv+8WMVI=
X-Gm-Gg: ASbGnctrtmHLJUllCx7jyh6OOw81QrtQ4oXcwy2NhDqLqv67GapSyhGOgAjUgpg3SDT
	DdzXCFJ0+U1ELWL4Ymkoq//chH2jb3SrO2i1SGA6QMM++kyPP/Mah66ZMLnXChpju0aGFDciVr7
	JFhfVll5n2o+IDJKaT0qIcIg69pUD/eqGVqQ2vNiymXskqxQXgydQRENz5NxS9BAlh+w0dF85p7
	smHnW/4MvxK4Q4laf3et2AyQd5Tv2JLOGlUSnMqp7d5BhxsMXQ+8lmAJLoz7ZIKtlJQFZWKRNBy
	xJnvocx/K6sxYDyYPNdVbrKSBgO4ayTcrXzx6T8R4vJdumcKvg23gUndpUgK0vK0kIZAznQG2Fw
	CdlLLVZtuabd2tcLsgL1qIRsCxZVbnmfalqJa50pfup9oZIx45jveFKvCz9t9BjM2SR+O072zCp
	3cFWub3uNAEJXzl8NCtbP9sWZdEi2PE8lXZojROqDsDxe9
X-Google-Smtp-Source: AGHT+IG//MmOioKgeQxyquQSV+AQABBbek9ef0Tyb8nGN6zx2RjXRR+H2j9PabPhGgsPfYEQSkY3oA==
X-Received: by 2002:a17:903:3bcb:b0:274:3db8:e755 with SMTP id d9443c01a7336-2986a733f65mr177018075ad.30.1763434229196;
        Mon, 17 Nov 2025 18:50:29 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:28 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 0/8] Add NMI Support to RISC-V via SSE
Date: Tue, 18 Nov 2025 10:50:07 +0800
Message-Id: <20251118025015.42491-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185034_378752_441E2E6D 
X-CRM114-Status: GOOD (  10.22  )
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

This patchset is based on SSE[1]. It adds support for inter CPU NMI
interfaces, enabling operations such as CPU stopping, backtrace, and
kgdb to be performed via NMI which is a more robust approach compared
to IPI. In addition to inter CPU NMIs, it also adds support for unknown
NMI[2].

v1->v2: Utilized SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED for inter CPU NMI communication.

[1] https://lore.kernel.org/all/20251105082639.342973-1-cleger@rivosinc.com/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223



Yunhui Cui (8):
  drivers: firmware: riscv: add SSE NMI support
  riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
  smp: move num_other_online_cpus() into smp.h
  riscv: smp: use NMI for crash stop
  riscv: smp: retry CPU stop with NMI if IPI fails
  riscv: smp: use NMI for backtrace
  riscv: smp: kgdb: Use NMI for CPU roundup
  drivers: firmware: riscv: add unknown nmi support

 MAINTAINERS                            |   8 ++
 arch/arm64/kernel/smp.c                |  11 --
 arch/riscv/include/asm/sbi.h           |   1 +
 arch/riscv/include/asm/smp.h           |  11 ++
 arch/riscv/kernel/smp.c                |  74 +++++++----
 drivers/firmware/riscv/Kconfig         |  10 ++
 drivers/firmware/riscv/Makefile        |   1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 172 +++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          |  26 ++++
 include/linux/smp.h                    |  11 ++
 10 files changed, 289 insertions(+), 36 deletions(-)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

-- 
2.39.5


