Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21F1107BCC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Tsdn7+1vCyaUHmngCU3ZIyKBw6uVtjSNrsm1j3NeCc=; b=UjgveMaNkkYbv2Pd3X8F0VNXy/
	mFzvE/stO+NO9w3vlvGMLFG7wdepbcM4sfI8KaNKeS8yg9J1PicTcHQEMfGbl3jNtbOCgd6c/tu2H
	yvG8h2PTDSYgBYHHiI1wnT30mxAOMZIkkD/po4rYfPNZe8DBujwQTI8KZObwbRHEhNtOEzV5DqeBj
	D/arLMySDadI114qM6dgLiKCbeWRC4O776yDYu7H0a/4GTzFO6VgAI0IIexKsoEUZc6aG1xQE0CNE
	23yGvOn+3ftSnYYfeLcabn3KCTesNAM2Pn0wRLcL9HDBAH3xXsPQR8h+/ZgL2KbfOGsl5pEAOq5B7
	fjYN1r3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15FY-00000000dGE-0GWD;
	Fri, 13 Mar 2026 16:20:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15FU-00000000dFB-3sfV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:20:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so27373625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773418827; x=1774023627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Tsdn7+1vCyaUHmngCU3ZIyKBw6uVtjSNrsm1j3NeCc=;
        b=i+5oGNt/Bsa4esTcFseHVJymCwjgfg3Mm+K8/jG6h9TU8cJakujK6llieWFQjiUEyh
         mHLYSBARmNRWS+Mca0DmBJrr3L3Ux8ugHlNyYtemBdkt5fpyeNFNeaw5kEYrDV0qHZ/B
         Kpp57OO6/rI081DAE9dOZanzKwpfaku7R79njyZRCDjMTT1RFG9hEpb39+SNNzXEtCit
         avLUoQoUK3YD76qjEmOF76xoYWwdZDXTXzQWnHcNwF50WEtvXA6ffrTSAvEMTRQAIYaP
         IS984BXUGVm4oN7FUFQ31VLGRzVdRjtEmI3g3BV9f8032YicPeTC1HXc+Mz1mKvrvJOG
         t0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418827; x=1774023627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Tsdn7+1vCyaUHmngCU3ZIyKBw6uVtjSNrsm1j3NeCc=;
        b=ZIruD9h9S0mFMD9u/41MN0BqXSJnEZXxxtzdUK5/2GeP+2ZdcMtGAckHeD8UA1cI4X
         vMNKmZieeq+zav1qrtF+zh1Jh+inbJNsD0m/cKx9WXHl6X4igK7t17C9CMwHA9Rx1C4v
         ekuu+LARxmWH8Ri4uWt8EIKV37Y1vAeRd4o38RkfrozFimffzjvf0PThxEBBV47GRs7g
         k0TfyLnGJhOHqcWWI0Bb4WCuhRy0AnVjW3igM8XMXGHI0XmZC0PlbGUVcVe8HY4cr3zs
         2WBbmGGC1q4wxMnSGAnzewslMqaXMkbjv+MJbcVMXeNiMxwusiHOviD6kTUS2RUEA5nI
         58rg==
X-Forwarded-Encrypted: i=1; AJvYcCXc+FQz7m2yS4vdYJkI2at7rtBKyNSEYdcfk17eYbzSQelpudW629q4e2H1CF5zbkIPRJF7DTgNEmixdtB3ekTT@lists.infradead.org
X-Gm-Message-State: AOJu0YzwniVmaxiPmgk8CyY5Ks21zbMuWpecc5vml12zAR17ISdjyv79
	ql8cuwAaJsgdidGWiS94JIM6xgPPSn7acMtc6TjsLLGf4FVaKLiKbVz6
X-Gm-Gg: ATEYQzzQ38Xv2y3ARmEgHGAR1ln3zLnUqjNHQNTl+rFMjU7gaNIVRCOY52RyGSXPV2P
	3O7oenPBrk9DGzLRHnoEptjW6gyO7bg8ZSIKP+jk1lZrN/55vTRDFoZe/uwZHxTcze/90AWfvK1
	Nwz0mBEPhvBAs0DSjOHSl2djudIvCOurUcqVePYFLa8pT5qxNaiHpjtfxiCRYL0luU8L9ySFMKK
	EgRbgTsrkiRMEot34DgjuCdKSn/wGhBCpxXORT3FYgl8OlRyFDcZ56KqSyucjwsklFDd/5b6OXL
	Z60nrSWrGd8XJ/BIFSxRVdFnTyu4eevWnzgfX9DIzB5ERc3+iyO7hi3AmPU27JbMlbRuljg/3w6
	pZCrSSkbQPIe5SJuApxZiomKTYUpiqTE93zAInaUuFh0d457asm7jjAuQ7iGnC+0YBTyri+TS0J
	byyyv4ieaJlFUiGZZipdxxkay++LfpC9oeaJodaxXC6Ex1M2zmr1L7uVibNZ5N4w/S9OjEyGzzx
	AebdYx3ely6HbiGov5AC9tB2gDwUx1vRY4JoPc=
X-Received: by 2002:a05:600d:4453:20b0:477:a54a:acba with SMTP id 5b1f17b1804b1-485567031a2mr49499595e9.17.1773418826939;
        Fri, 13 Mar 2026 09:20:26 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm219944515e9.10.2026.03.13.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:20:26 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 0/2] Add support for Variscite DART-MX91 and Sonata board
Date: Fri, 13 Mar 2026 17:20:01 +0100
Message-ID: <cover.1773417666.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092029_839796_55F32DB8 
X-CRM114-Status: GOOD (  12.75  )
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

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v4->v5:
 - Rebased the series to for-next branch

v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (2):
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 471 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 +++++++++++++++++
 3 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: 04faa34bb5e68338cc2568da78f6535f685dd4a7
prerequisite-patch-id: f5c8d966fa1a6b246f7eb1c249e7d6c353b2d71f
-- 
2.47.3


