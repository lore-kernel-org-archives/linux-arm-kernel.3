Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0981FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRh4g0QaY86Th/WId3M8eIlyv7sqo1XzF9a5KT2kIAA=; b=c2mnqdJiWdyiZhLToLo8iack1J
	bXqqcBYWlS7R7Wv9tuF5CkgYcGhQ5GrfyFKMgK0f/ORQ/1mBi9pCTHQ3vgIfRIP+Y0mS/8SScLA9s
	Ki9jUEKKBj/0blNr/S0aD7YZP1N4JVtpl4855fcMR27y7SJK0WNkwehKuj/tgt3UFzksV8qdm/P3c
	Fh2SDYf+G2YvhVVaQlnyCZBOmocogxqzzc69wApvo2vdiETqzG2vU8BQ98DRMBe7o3CvpUI10mavG
	9bhD2lY/pSOXWNTHb1JqU5GOhFxrrvE/jaa/Mz3H5e5hhJ2lJw4YBuNg5b/DaeA138Q6VxwoW+yEr
	qBFnKRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZe8b-0000000AFDT-3wrK;
	Wed, 09 Jul 2025 23:23:41 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdzU-0000000AERg-2fVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:14:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so234134f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102855; x=1752707655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRh4g0QaY86Th/WId3M8eIlyv7sqo1XzF9a5KT2kIAA=;
        b=kTbIB88KOgxeTUJJ6gQM/lnsECpEQAWHLunGxD8A+SWgfiBqUs1MjU+m81udyanVMu
         s4+mINshe4t0R/EMppDbmaYCKT91/G9RU+1KFzk9hanG3xZHhfsuHtS1xH61Xx3wr3gJ
         qhLUfjtMDwmGpqosFJQV2BDJIXQcGZOr/m4iWIq5LgeLvn07t4Opp1dtkH5ELwVFRORJ
         xtDO2r6xX/ZTxev8DqwOxeWtVs4NxVnhJQS0VGwsogUjMaLFUGzY2RCL2bI/O5dTz/q9
         ZXwQCzJgw1S1aF8BZwpnwVFwb/cIfVyfVFPyrdFDAu1s6qNpK/244/dV7tZYmcAfsFMJ
         s3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102855; x=1752707655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRh4g0QaY86Th/WId3M8eIlyv7sqo1XzF9a5KT2kIAA=;
        b=FHQXYgqKTyrr+ng8OH/jU/uOJUNZZEb1TDvBXEcAwcvNwnYgimvnHT5rQTPZQrjHzK
         dSFA2nuMzH3UYmxI/Sz2OM+aoEIpmm7lazUZOPQ6ixaLgAl6WZLDvtKHryFrYxR5jUtu
         w33l1F/FXSTf3rZJBDoud1eX9FO911yZMWoiAI+8Kbt1aeZhcyAUoQAH0mjIxsG6JahJ
         X2XnF0ZOfJeNp3QbO7WzI+2B/yY0jQtSTzDoGJMTOfnyxjCitEk+BcFZSGweS4hh5SGl
         zZoLgLiGoh6SlozUwaQH0vp13CHrUafBGvgq2Y7dPPbiWOJNIyMxjrOBp1hBb+flr3aq
         DX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0tzi8/5DQmOPZdLmhjzVLB3cFyI+H8pcbufxaxhqo7lLLvn1QD/U3bFzoEdHOGUc2RcCWzp/3ck+rJI2GR7aP@lists.infradead.org
X-Gm-Message-State: AOJu0YyUxiP5zqhN4qWpdZPBrnqyFgb737tWEN9xex3uYWysdtGh1raR
	rwgHJhffpcv1IeogavJG3W+jA5x9gQBm5AjzCFVdV/FleYBPLT5PnPUL
X-Gm-Gg: ASbGncsogxCRpf6IhVpBovzTjWJWDfCQxz2ZuksVBzDPgRUBAKBo/OkDOuGGsR9wgD0
	jNzNNUtLPaaRVNdG9/uE62wBYyuBoljsG9LS64eJtztVtBoB3rS2pbXOmAzdShIlw20hJKE434G
	5Q1UbjIVxmVtAvfJyEKd6SJw+x3VCO5znQe7cx8+b66DmSTOJKOD+eg2HgaF9bKN9OeZfP/5Z7m
	lgHM3R4GL/v/HDDjdOdyNyxZxBqhu+RR896Lb/uGqgERzhTQa1Yd3caDW0zeh9E7zrlLY28XXF/
	8jUyJSfSuc3p/2jIX1hqnUslGL1+uWhI/76RGZwEI+fhhO3IyZv8JPSmS1T5ZrJBosRjNON49iM
	atlHUxUOKBuiYcBuxZPeYMF10oY5W+70f3EH+veba7mUeS0xzdu5kCQ==
X-Google-Smtp-Source: AGHT+IEXy/xUSngXlbtshIlGqlOa2wRaPb/LCFqe2vjJDzVQGHHQvsHe4iqDOU2Hgyiv6s5/U9O54g==
X-Received: by 2002:a05:6000:21c7:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3b5e7881163mr1212345f8f.7.1752102855041;
        Wed, 09 Jul 2025 16:14:15 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd241210sm2048755e9.0.2025.07.09.16.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:14 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: tegra: Add memory controller on Tegra264
Date: Thu, 10 Jul 2025 01:14:00 +0200
Message-ID: <20250709231401.3767130-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_161416_675546_3A677EB0 
X-CRM114-Status: GOOD (  11.36  )
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

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index 0c9e4809b310..62c87a387b14 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/clock/nvidia,tegra264.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/tegra186-hsp.h>
+#include <dt-bindings/memory/nvidia,tegra264.h>
 #include <dt-bindings/reset/nvidia,tegra264.h>
 
 / {
@@ -196,6 +197,58 @@ smmu2: iommu@6000000 {
 			dma-coherent;
 		};
 
+		mc: memory-controller@8020000 {
+			compatible = "nvidia,tegra264-mc";
+			reg = <0x00 0x8020000 0x0 0x20000>, /* MC broadcast */
+			      <0x00 0x8040000 0x0 0x20000>, /* MC  0 */
+			      <0x00 0x8060000 0x0 0x20000>, /* MC  1 */
+			      <0x00 0x8080000 0x0 0x20000>, /* MC  2 */
+			      <0x00 0x80a0000 0x0 0x20000>, /* MC  3 */
+			      <0x00 0x80c0000 0x0 0x20000>, /* MC  4 */
+			      <0x00 0x80e0000 0x0 0x20000>, /* MC  5 */
+			      <0x00 0x8100000 0x0 0x20000>, /* MC  6 */
+			      <0x00 0x8120000 0x0 0x20000>, /* MC  7 */
+			      <0x00 0x8140000 0x0 0x20000>, /* MC  8 */
+			      <0x00 0x8160000 0x0 0x20000>, /* MC  9 */
+			      <0x00 0x8180000 0x0 0x20000>, /* MC 10 */
+			      <0x00 0x81a0000 0x0 0x20000>, /* MC 11 */
+			      <0x00 0x81c0000 0x0 0x20000>, /* MC 12 */
+			      <0x00 0x81e0000 0x0 0x20000>, /* MC 13 */
+			      <0x00 0x8200000 0x0 0x20000>, /* MC 14 */
+			      <0x00 0x8220000 0x0 0x20000>; /* MC 15 */
+			reg-names = "broadcast", "ch0", "ch1", "ch2", "ch3",
+				    "ch4", "ch5", "ch6", "ch7", "ch8", "ch9",
+				    "ch10", "ch11", "ch12", "ch13", "ch14",
+				    "ch15";
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			#interconnect-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			/* limit the DMA range for memory clients to [39:0] */
+			dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
+
+			emc: external-memory-controller@8800000 {
+				compatible = "nvidia,tegra264-emc";
+				reg = <0x00 0x8800000 0x0 0x20000>,
+				      <0x00 0x8890000 0x0 0x20000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&bpmp TEGRA264_CLK_EMC>;
+				clock-names = "emc";
+
+				#interconnect-cells = <0>;
+				nvidia,bpmp = <&bpmp>;
+			};
+		};
+
 		smmu0: iommu@a000000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x00 0xa000000 0x0 0x200000>;
-- 
2.50.0


