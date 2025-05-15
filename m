Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CE8C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PAWbah0yZaLPKt8bN/YzgjbQx6cpILKxwG41q/VxDM=; b=B3CPqpU5cPSYpxRQh0+ABfnw7k
	77MyogTppLwNEHs2hkc0lbFEjCjQNvJpnLhXi88xRfLW0GfOv7LhkIWj4K1TW/R2vcInKTcsb0TPZ
	GIW7g414RN9F3M1Hdiz43Z+PCiGiW7Z9g+JaFSQ6gZDvAggteHE90YfokdgIVHxsRIvYH6EqQiFtv
	1Myf+5spsnCBgQxt8f+zLsWP2waR5Il40hfKNXhxjK5gK+WYq3uU3okU/op4gGh0DxBSQ940227r7
	HjjoaKdKiphe8VFm2mssCPenfJ+aoaznbuUY19BCeojMUTV4IW+rWlIAOzWBbtipQMY6a3oGa54Gb
	6lRnxKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeWf-00000001iJM-3i9p;
	Thu, 15 May 2025 19:45:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeQg-00000001hOg-00Ft
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:39:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54b10594812so1492702e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337980; x=1747942780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PAWbah0yZaLPKt8bN/YzgjbQx6cpILKxwG41q/VxDM=;
        b=hxal6eulIBSy8QJ6Gaw96YqK6UQalgj9bSxHWkNkqM78pxwXjhBFrNSWSbeM/5Wop4
         A6GdUhrjJOjBYdeBY4WfsuEMOLtc8XzIkMSdZ87MibdotfFobLsr7eF1PeJ0jUgESOOb
         yF/3qh3S4pgIz241tpgGmrB2l4evRciNykSlGDkXU/RswKqQ7hRzF+utwr8UUKkKxV4q
         a8IeOoFL+c0mEsiKgYLAvadA7DUodaWWGLIejpBsbSk10jW8eCI13X4qu5WrAMm1gmwb
         CXjkIeOzRErJ+jhMgzGEEaVPFNgJCW9jbAJyGEDNUrRFxEWDjp2WKw+FNU7xIkNjqlqn
         3nhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337980; x=1747942780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PAWbah0yZaLPKt8bN/YzgjbQx6cpILKxwG41q/VxDM=;
        b=YmhxFw6fjjMBAb9U6EfvUvkxEZkZ0nYub6Tq6OLOKdPCCpshou83BBRdYvqAvmSJDZ
         jfn118MUakGRkdTdOtHm4NV5+SIVFvgMmnOxI+qLnwSbZsiheuQMdEpGbXImQqk0pVgd
         g1qFqSm4fKM1LCZeHmvUkVTUiAZuJcnu5iKEMowYzS1wgJZhyTW9t6vAiQCDxNqSne4U
         pexXM12VNqkSkE14qrvEyeICc2ZsW6t2hBFZkcUwwVo1xUvK35WioNvU2bZxNKihV2xc
         ehX9e6ZihYOZO8f+jNv+65vHm86hcYAXSQq6N4e0+armSLgSoEpu/EF2qsjFwQ767qSu
         xBCA==
X-Gm-Message-State: AOJu0Yz5Yq/9fScBZltFG9BaOGCmwO2TxtKG+6Zn4fW4nnvO9S4REhAY
	2ff+nytAxM8goLpNbgDUYi95aHRh3OK0+xd/8ieEagrW/xLT3zkcH+yId+YH0dIVtCWuCQ==
X-Gm-Gg: ASbGncs457NGwRfPzTCN0Jw6XX1uxdX5dPS/kdQZKmvPNgVzUwyaoVqo74b3xyeQj0o
	Offt8J88cTm7ivdh3A3duyc1JcOIPMCUK9rV+ErQknQPV974LgghctM/17WzzsQbfcGzj06gUw+
	ekOP/5AWSztkPbhqGcxfY/zmwqxWQ5NVlhnkAKn03LzyJbBl4Bj5BWvL54cJLVwCgSvBYow2DJV
	h0vnfuWN+JDotSPvx62UKGnIFu++TBMEpEKrB4mKvYB1ZOGqNYvDOoX6xnmU4+SyivHAbPcp3i8
	exePH401vMDEJzSgmeMmzwQkFDdh8ufH9qkVG1jBMu/0WfxdyEjEixQUkUcqpIsY
X-Google-Smtp-Source: AGHT+IHW9iddu7UpubfDwo/rYmu1JB5MK+HjOhwFmRxU0JW/4FjJ5yJH6hjkqzFW9SjhkNhU1uMdpQ==
X-Received: by 2002:ac2:4c4a:0:b0:54a:cc04:e77e with SMTP id 2adb3069b0e04-550e7232549mr244972e87.44.1747337980004;
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:39 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:40 +0300
Subject: [PATCH v2 1/5] ARM: dts: vt8500: Add node address and reg in CPU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-1-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=2587;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=Xr/PvjPEMLBqNumA5DIM03p83Uegeyy87amuQoEaORo=;
 b=2Zj3AzCaYGXeurXVhu3IJqiWl0FbrlZy/9nVqwELkUvoCVo5Vaz62VEojoXvz/Jf7wpSyHU0f
 M+EadJAE+YLDoO55hAklrRt0i6knCbSsPkTFhuLeAFNRLfe+S/2A6n7
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_123942_043257_6950EB88 
X-CRM114-Status: GOOD (  11.63  )
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

Adjust CPU nodes according to current guidelines, including address
and reg. Set #address-cells accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index d1dd37220d41becece5d24fbb19aa71b01723e35..3cd86941db90c08ae4fbd3e0b1b079623bce28a9 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "via,vt8500";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 2b1819f0c5412648a83cd3eeb495f68d2e4100ef..34e55b8c2c8b20fe2598ccc9699551dc9c8e69a6 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8505";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 042eec78c085d19fc97d7f0f9721399c0716ff74..b42c77f99c006af31d4be8bbb985f536244edf8c 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8650";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 56342aa1d993a43e7ee766f93151c6d456496262..68e325163061b11e52027fbf291953a170f39469 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8750";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm1176jzf";
+			reg = <0x0>;
 		};
 	};
 

-- 
2.49.0


