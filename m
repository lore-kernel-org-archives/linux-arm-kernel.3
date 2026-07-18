Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1904AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+4ABO+bTkfPgOfO7AVPQCNenlwqlj31lfWE+FzUnWC8=; b=sAfImWGrePC6ZUWCUgsOMli1h+
	ip6W5eTsZV3H/1hhnkXhR1oAdeHlksv0RZdybHYIP1yqWh8+eJq6W/6skXCnFoqpm3Vu5egauq9D9
	DutXtlzuYx/8fVKEkP+fGmUx3zZVaxmL+mB7NyAWa0kEcMltFqtsSzOIdzVnEB949M9T/fR8WdxAk
	H2gRayME853MWJV4TKYh4ijhI1hLxs4S8/hm5e7PWzYESSCV7+djNWhj/5z3zHCN+kwxrY6UV5HOE
	Iv1WqUnDp/EMAHj2bJTciFdBvNiYlrR7JQPqaEa4uMCuwHFTxFhbtaotP3nKz9he7qK+/MIC2BtXA
	tT35tc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1B5-00000003wma-1vpy;
	Sat, 18 Jul 2026 09:17:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1B2-00000003wm5-1VjA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:17:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954d29264cso5098645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784366262; x=1784971062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4ABO+bTkfPgOfO7AVPQCNenlwqlj31lfWE+FzUnWC8=;
        b=I1RVtiDOZpCvADrD29KGhQeh8OfVW+t0aWLEOneQzCTSwN7xKIow1YeDqd22Fch9Uf
         tEnd+LU+Wa8N+HlULcnRzqvJ8EfESv8cYGCjrWrQ6pYiYpFUVdPoKnyCvekoXfo7ux2M
         j1C1CAWKE4GZ8/eDy22zFIgqe/WtqLHiJZC23LePho2aFnXBIvmpIXwJr0I1bJmf4OtT
         seH2dIe7RP8rDk5KJhJSCq+Shp5+ygxoe3nEJpwzMyb51V6XaIuqSDVyVEPqDInBNwn5
         PNCkKk/kR4FkoyNsDpsVbPeWWk0XZhD6VWLE1WNds7JiChWwhnQ/eCLEPmDQTxfRcrBf
         /iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784366262; x=1784971062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4ABO+bTkfPgOfO7AVPQCNenlwqlj31lfWE+FzUnWC8=;
        b=kp5/ohjKf1STn2shIhZKR8VHi1ciKhR/8tl/NerVhmrw2JPvpQvR7EDFPf17fxioGy
         LmJvmk+sitPBHuT+A5lW1053ThVIfI0kTmrjypCgmYQe11mVMxzO3Vn4YfRhBDUtuA1c
         GZwvOETSDjK3/tZvk47hr/68NKKvkw0feLtyE0x/+iitTqqn0IxcgxPRQ5hm4k07ualv
         IagvGdAR6iB8Vu80sYdqLnveb5OJ2X2yvRCldUclh0BfTZhiq2FG2fu3KjUPoiN7Q3Hb
         ZyJdKNCu+hw/gUVMbO9UO/VcYYGSmlz4UPahCv9CfX3GB0tgsx59ztsnvyrSdO0DtnLi
         a0kg==
X-Forwarded-Encrypted: i=1; AHgh+RrNo0CFczcn3SBS3AhXeMQN+aMx+8eQd76YiOQfTiq1hV0EgK2vC5OXUJ2MHmqjwI4r/JyBQQem3RVw3TVc2qV/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr1txMsCC0SOOoCAq79kmIFjAfd1rs28/Mt6XCZ2cIt/UUkjJ1
	W7dpVnsVzw4xVuGIzE7AuBkm4NI17+85lj/yUXmMx9FuDM2p/JJwT3AE
X-Gm-Gg: AfdE7ckgqZVLSIdTSi0ijQkIkQG9MN0XUaCJ5/EywlfPUFNSDXOmJoB27pMCMCJ+tB4
	na2JKHNwCOFiuffNE15zVZNKoCeqCo2yatDT908zDwdRKPhCtIRN2HBkx9LpaPZPC92g7EfMUWF
	0CTA5Dg8vYxPul4CEup9fDTpitq0OiEgsr8l8qX4ib/kNfc0u4i4XcVge0lmv9qAcvdD9hjKnJm
	LNisuep/8snhZmN7UDIi0hBVAAPLkfITMWFGBF8+ZBritCailLhBkLNTshQNKhE4jdAtqyJwNOT
	AVR94UrKtDQTgbuVj3RgvWNLz7O7wpVm2OQsyhXudGxxoCW2eZEsfMcCSCSoqTdUCXt3f4sbGC2
	FDqUDuFH15y8u7DPUniZfNld8EvoGSedwDRB5NooJk6AC1TrvtN2ac2FclbuiI8zo/GXEYOnphn
	y64bo1FXWaLYq8PncXcT4OhC3AhKIQy5EOxBTaLJ/VaabYIFBmm/51E+TKAX0eCfiq8JWOSsGwv
	OdpUrPoyXEh/rRo49Cls5vddEBkf9Ak0l4uhMWL
X-Received: by 2002:a05:600d:6413:20b0:495:47b9:f46 with SMTP id 5b1f17b1804b1-4954a52411emr55531825e9.39.1784366261485;
        Sat, 18 Jul 2026 02:17:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-002-153-175.77.2.pool.telefonica.de. [77.2.153.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm11186363f8f.17.2026.07.18.02.17.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 18 Jul 2026 02:17:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ARM: smp: set current pointer in assembly before jumping into C
Date: Sat, 18 Jul 2026 11:16:00 +0200
Message-Id: <20260718091600.92021-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_021744_417903_D18B966B 
X-CRM114-Status: GOOD (  10.31  )
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

With CONFIG_KCOV_INSTRUMENT_ALL=y, secondary CPUs fail to come online
on ARMv6K/ARMv7 SMP:

  CPU1: failed to boot: -38

The compiler inserts a call to __sanitizer_cov_trace_pc() at the entry
of secondary_start_kernel(), before set_current(task). The KCOV hook
dereferences current while TPIDRURO is still uninitialized, causing a
data abort before cpu_init() has installed the exception stacks. The
secondary CPU consequently never completes startup.

Initialize current in the secondary assembly handoff, as
__mmap_switched already does for the boot CPU.

Fixes: 50596b7559bf ("ARM: smp: Store current pointer in TPIDRURO register if available")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on QEMU vexpress-a15 (mainline and v6.12) and
realview-eb-mpcore with and without CONFIG_KCOV_INSTRUMENT_ALL.

The head-nommu.S change is untested because no currently reachable
Kconfig combination enables non-MMU SMP.

The redundant set_current(task) is retained to keep the fix minimal.

 arch/arm/kernel/head-nommu.S | 1 +
 arch/arm/kernel/head.S       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/kernel/head-nommu.S b/arch/arm/kernel/head-nommu.S
index b9d6818f1ee1..f80bbfbd3a6f 100644
--- a/arch/arm/kernel/head-nommu.S
+++ b/arch/arm/kernel/head-nommu.S
@@ -116,6 +116,7 @@ ENTRY(secondary_startup)
 	ldr	r7, __secondary_data		@ reload r7
 	ldr	sp, [r7, #12]			@ set up the stack pointer
 	ldr	r0, [r7, #16]			@ set up task pointer
+	set_current r0, r1
 	mov	fp, #0
 	b	secondary_start_kernel
 ENDPROC(secondary_startup)
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index f22c50d4bd41..a22403a629ef 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -442,6 +442,7 @@ ENTRY(__secondary_switched)
 	adr_l	r7, secondary_data + 12		@ get secondary_data.stack
 	ldr	sp, [r7]
 	ldr	r0, [r7, #4]			@ get secondary_data.task
+	set_current r0, r1
 	mov	fp, #0
 	b	secondary_start_kernel
 ENDPROC(__secondary_switched)
--
2.43.0

