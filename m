Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF60D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ZNZVofZGu1foCFk4iS7YYI+xiRyGLmnKQ99yJXtiPY=; b=QEC7NTgA3hWY6ZlB0PdEuJ2pQR
	76F3o3JubLoiszGxBWTvh08b89YqYyXszaarJ0JPdsmzp8QxiqXcMGM18Ry1A5dCQVV+EooWBiq0v
	OYv6yaIn/SbYjM1Ika36brIjT/TfmOnREmKzexrS9U6bWSHR3F1U/fQMh21phiBXA1lOqiQBKX4z+
	VAFjtI79+wqJtX8vsA6iGB1iPWAqCfLOMbVB4fjzX14XiRRoajs9SsGaaN/gt7KnEQXrfUYVE6fGH
	q4eoIQvw2SZUycvj86j28nyRBr/PprmRWAJ4/3ZYJQQJlDdYD55en4HQwG1Erw0etc1DwZfHW1nO4
	uiTStEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObUw-0000000GbDL-3lpF;
	Thu, 27 Nov 2025 12:53:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObUt-0000000GbCd-45Bq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29558061c68so11646155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764247999; x=1764852799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZNZVofZGu1foCFk4iS7YYI+xiRyGLmnKQ99yJXtiPY=;
        b=k9A7JDsWEaUN7Bnju4SuqPOvV5rYRc1rV7gZEQNVSfOXLPdnnrikZwHaF6qgaeJwMp
         +lBnK6dz0T2cGYJUM4z7u1LwG6t/H8NuiK3H43wQSpjGTKPWcNWzPtRzbZ23vHF+BUuA
         VtJ7R4PGGrV9IP50P2L/x3QUTNOHlipCpnnXGf7409HMWaQ0GBdxKTdnlxO6ZkMhAM9i
         3dEZuW8kPtkb2RwlA3HZM5R8EOo9RbaAuEa8oDC3J5L6clMXL+gBG5k0gIhZfgl8ps8i
         AMIBmtryC/fn2s5AkBfuveMNI4+WBK+8nLrD1GX0PfCiuX7pOjlVihPvkHtdgmLvX/UU
         OMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247999; x=1764852799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZNZVofZGu1foCFk4iS7YYI+xiRyGLmnKQ99yJXtiPY=;
        b=VfCS/doFRzFH4AwEyD2PfX7bgTmid2CssoHgjPnU0BCWkfJQ1B9s8GGKtPJnleAmg8
         j83TW98SneYde71hezHmXmTGCdll/aF1ANyAXM4+iodrXi3YZxmB63uHXIi5UA8F4SrR
         gyGz5NCSi93HWtgi78btCeCDDmv+CeNXgidHNxqBGLt4qrgZdud7V8g1ef+J/xJtWK4g
         Bm9JXSeXWC4Ia51gNtoXD1fqbMlxi5GsIZhbxevDTPUUxaDGWYPzZve6yc2SQ4mkJC2K
         cRDD1oKRrPA3ew12rwV8sQ9L/b/W8xFiH6XbOvjv7VFdXtlBBUWdvjjUTjxx1TYUV+iZ
         spzA==
X-Forwarded-Encrypted: i=1; AJvYcCVnnMC5N5fuKRH4WcK3sza2tsUMJGULW6Mgc3AUUIxhdQa+VT3hOKO6x+JbZyENcC5Sli1mcmtCgi1jg7oVktOZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzhAssQjitVeQE9krYBm4qi2q8zqDpnu2tQ5PTOphflfY/3XifD
	wyWZRPSXUzjtIkB7BPEk65AEubzMqtmE0SuOpg0lBYh7tUHOt0aF4jqzIcFP9WjmCK8=
X-Gm-Gg: ASbGncsp2UtJtmpGx7YbVMtChHbGUvn1Nf+adv/eqBF9Dq/cECB1NZ7o/0yi2Ka75Ze
	J5oDUi9jMYQxKybAtf3as33wwjdDUUv3chaO1dyfNmwPaeVbobPVweDiv3+FJ4DOEFmAHGrKYol
	3w+CEWU0KKmgT5rH/lAOZn3BC8U480Lb0flDoznxo/nCFTVM6GQoOgnfuB6az8WOfggusacojJ7
	x6rbNoNXQR5zpQA0n4peLmpj/PYI0mxxAAY9gPGkOnoEmEwck2K3usj302VUnlMCPI0HPfUSePH
	HLwW+a13UYRMGTsKgoVtFKaM3J9ba115i1U+XwXyaxWumRCU21ouLpdJjpcbJBzWAmj8gqVfArd
	fqZaCq9h9F7Qx1c2WeUJD4ww+lz3nvZeuExWQwBIBsJIypYQgc0Wxf95mjzvHkXC0H7VroevNc7
	siwhhn0H2s+XTQWO9wyGC1tLJJubbbjyT+HW72RQPLuZWL
X-Google-Smtp-Source: AGHT+IFbPB3VBDRPpGKotxjjK89VWCiAp8ON0AApdZA0so65+L08mE9nOchaP5UOxH57kW6BMrEMPg==
X-Received: by 2002:a17:902:e548:b0:295:28a4:f0be with SMTP id d9443c01a7336-29b6be8e2ddmr285613205ad.10.1764247998954;
        Thu, 27 Nov 2025 04:53:18 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:18 -0800 (PST)
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
Subject: [PATCH v3 0/8] Add NMI Support to RISC-V via SSE
Date: Thu, 27 Nov 2025 20:52:57 +0800
Message-Id: <20251127125305.89961-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045320_097094_D1B17294 
X-CRM114-Status: GOOD (  11.45  )
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

v1->v2: Utilized SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED for inter
CPU NMI communication.

v2->v3:
1. Since CPU stop is not a high frequency operation, NMI is directly
used instead of IPI, without first attempting IPI and using NMI as
a fallback.

2. The parameter local_nmi_arg used by sse_event_register cannot represent
local NMI types (Crash, Stop, Backtrace, Kgdb) for multiple CPUs, so a new
per CPU variable local_nmi has been added to address this.

[1] https://lore.kernel.org/all/20251105082639.342973-1-cleger@rivosinc.com/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223

Yunhui Cui (8):
  drivers: firmware: riscv: add SSE NMI support
  riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
  smp: move num_other_online_cpus() into smp.h
  riscv: smp: use NMI for crash stop
  riscv: smp: use NMI for CPU stop
  riscv: smp: use NMI for backtrace
  riscv: smp: kgdb: use NMI for CPU roundup
  drivers: firmware: riscv: add unknown nmi support

 MAINTAINERS                            |   8 ++
 arch/arm64/kernel/smp.c                |  11 --
 arch/riscv/include/asm/sbi.h           |   1 +
 arch/riscv/include/asm/smp.h           |  11 ++
 arch/riscv/kernel/smp.c                |  58 ++++----
 drivers/firmware/riscv/Kconfig         |  10 ++
 drivers/firmware/riscv/Makefile        |   1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 175 +++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          |  26 ++++
 include/linux/smp.h                    |  11 ++
 10 files changed, 277 insertions(+), 35 deletions(-)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

-- 
2.39.5


