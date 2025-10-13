Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2349ACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qptI1D+UsB6BnqEGTBrzAfay9TK/go8UORV6E6C+E8A=; b=rsZdestkkavgKRuUG3Rxa2Vw8w
	4C2m5op2NYPhPuSLigTYKF4qDAn6hh1aCoSpEvvnQwx2Xcos4tOavRi0fg0ROb+QsHR3vufixJJSK
	3Mk9Mcg2+5rNHla4zJslyh0HQIjO3TN0BIhcFbY4S1Zut2wVfb5++9S2JlSBdqE+oFpFuCCobGBN/
	5BicwkLSZ5IoLrEts9GqxD7g907lUyhmvLtIiF59ZwIfwRXkBKXyjWVGee/cZyYiMvuiYebzYaP2A
	GzgFL4ugxQgrPyZ/BGGKxRYBef6Im7XKvBQRtPVFMc1FX4VRSvbb6xtnJQt9l6UYzECrum6bmUFZz
	xw+wTnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87TX-0000000C3ck-1GkH;
	Mon, 13 Oct 2025 01:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87TV-0000000C3cK-487q
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qptI1D+UsB6BnqEGTBrzAfay9TK/go8UORV6E6C+E8A=; b=ViJFQebqMN6QS3Ks4Iv7QH/zcP
	bwo8uzUwgy603BDVBByuQc18uD9qBSCwb/T6Qc/qN6EQOZIR7sQyFGsaOIqY+p1t16f7xUTNy/s6k
	7kb8X15h2Zn8ga5eiPZkqLm/2avolXIny8VHq7+QGVexb1xDPatUFimHPZAt2V00OGL1zwKr9ohKg
	EkrRWuLoUyvXhi8Q3ledHhm+DVN3apAtEXGGuk+YZs3GAbfdnzHi5CMgR4yHZPnsL+hqdHCk9F50V
	333W/ZOMTUUXqkpR54r+1WDj0QuUQIcMHzJV5+EIJDqsxaBkZ7EDyHJca3D4tmhyNUkYsaD5FM0/x
	2P18cKvA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87TN-00000003zoC-2DWX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:35:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2698e4795ebso37075035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760319332; x=1760924132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qptI1D+UsB6BnqEGTBrzAfay9TK/go8UORV6E6C+E8A=;
        b=DxVAf+SOp0wN/T5XFbwIXfEOLgzDHoo7nLkWjq15qDRBjaGmFPwf2sCLFvj4nY89zM
         FD60UtVV4tflvi1KuJXl/CYtx6+uiNaIJBdufX/tpwFjnyzx5NcDxtsCY+BtZVc40SUG
         eTTxHIA45DxhegOyTKLIcOaPpLZAaAJ/Lx1EZP+Evjsnr3dRKbOlDO1J/L5oS6vXUBGd
         XT7VIcZ5cMCIO3fOrUwUiSzEkuhLG/+FMYwIx417g1ufDqjZPVQQQwzi6ghm/SbZ0+5K
         NHirKb1LBbUifopc8ljpaVCJ9o1CefY7gN+PEUvwXbLWx6KrwvOGog0mUnHpV1bu8NIJ
         ikxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760319332; x=1760924132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qptI1D+UsB6BnqEGTBrzAfay9TK/go8UORV6E6C+E8A=;
        b=UL6UfofgzuL0ZNFo0KgHz64FnxKuFpR9AI9kVnX/fNdij+TuHFMOC27VzTqeftSjt9
         7QOLdaPmK4NvnIGlaDeMDbHvkcJR3T2LI3HMn+ty25WJdgqPSUTPLSKbpepQnT+kMpgk
         pQH62HVljQmc/8AAVaOhIPg7G00C1L3k1zXqBiHQ76D5+GXg90DF//XzEJ3YvL4uciFb
         h/2ngDMAisk8bY6vP5dDaB7BGkSSF4lA1mPG4OBVlFHklYc7tD9frTo+2xZDWmehQsHC
         UuTtxL3QCj2cTaugHrTkML0sVe2qQoVI26mXAzqa0zGxUNIFFuRaMCwqFSv2Ten5xzzR
         VF+A==
X-Gm-Message-State: AOJu0YwWofC+GmSizVFG90RiyhT6cXlJF0SAA49USpacsMBEKJf2gqhz
	JNdjS+gvrfhUxeRph9mbPYtXxnntDz1QTIOVz+IyqUXT0pv5h/u47jLr
X-Gm-Gg: ASbGncvkxm7YvlUQ5Up4xXzZgnrVCIAZ02s17UXWemCDdjkyESNQUZ7PI5zCHy4zsT0
	I8bP7leq5vNshmQ9gKHVrBOV90MSrgjsJkPR2SGNgGMXOjEZoRXZBzIf2mEEuPNzZaLXDWTjBvC
	EjUuZXj8WcCGWrJOcmO8WAXbIHgcgfUCeeicvw5THKpdEsYt7Lxl8H221txC/m52u8KLS0rexB7
	MCl8irqss6MmrWaKq46bncUk+PHgEl+ey8/9cAaTte7fCDz7t9TiuqU1qS+LlwYKu8+yMCSOvbb
	IjiS7XZ0uPMw4LnqWK1vQje1+IutcgOoPyBI+J9VsAx0cpwuoXGFU/N4JIVtOq+TByx6gETup/l
	EpPTMymivC+qdPAwgHa29ZfQiqzoMCH473d7t4ln6A0AojYdGXD57iFNpSw4O43hJ5NMeo+2xjV
	zrS+4yMfwbpuYo1UIBo7RO
X-Google-Smtp-Source: AGHT+IGroTw4Ts05YI4y+eOASl5mjOVLbfKOD2hQkPWmmvN/0O+Vt+Jh4T1ULkHRoFOV/204fLbaYQ==
X-Received: by 2002:a17:902:f641:b0:28e:cc41:b0e1 with SMTP id d9443c01a7336-290273ef139mr239114615ad.36.1760319332207;
        Sun, 12 Oct 2025 18:35:32 -0700 (PDT)
Received: from fedora.. (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f35e62sm116996925ad.88.2025.10.12.18.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:35:31 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	leitao@debian.org,
	mark.rutland@arm.com,
	ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH] arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack
Date: Mon, 13 Oct 2025 01:35:08 +0000
Message-ID: <20251013013508.74677-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023538_839705_A8E49A32 
X-CRM114-Status: GOOD (  11.38  )
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

For those architectures with HAVE_SOFTIRQ_ON_OWN_STACK use
their dedicated softirq stack when !PREEMPT_RT. This condition
is ensured by SOFTIRQ_ON_OWN_STACK.

Let arm64 use SOFTIRQ_ON_OWN_STACK as well to select its
usage of the stack.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
---
 arch/arm64/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index c0065a1d77cf..15dedb385b9e 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -62,7 +62,7 @@ static void __init init_irq_stacks(void)
 	}
 }
 
-#ifndef CONFIG_PREEMPT_RT
+#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(struct pt_regs *regs)
 {
 	__do_softirq();
-- 
2.34.1


