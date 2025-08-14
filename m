Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9435CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=; b=ALgkJQM5OhmJvC9+fY47n+qPpU
	FtLGPR8aninf7WDkOabCp+6LEDPuLKVRb33DS5c00zvtDqLRCabsarIcnZXaqAPY/AKmR9qcXyzhM
	uul77pTF+0ud9+yAS/gPQDK0W7mfukFMzY8hZ2KlQSl5YWEBiARXlWtJUVor4nsVErpXp6og3SQR5
	Law0qPMD7NbpjHGxPZd75dqmzcbPpaS/Yh9VCZKegKtKj1bByr6wqPjhWdqhi3hZ8IfDEf3E1oIE7
	ANLtlo/lLC3ziYuC1UjTATzg3XkZwiPpJSZQ451pKx5iPTzlj77LrZOxG976B4R9J2IWjNytGuwPK
	7MykE/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUh9-0000000GV5B-3km1;
	Thu, 14 Aug 2025 09:56:27 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUCy-0000000GOZ9-0YP9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:25:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b4716fb320cso538458a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755163515; x=1755768315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=;
        b=NCRhMuSV1MhMkDHPRxLSHwn120ud1jkhL9H1bHAt6nUo7MwbScaBZXi+4oW5wjj8b7
         IsY/y7h6plMyxe5Zpfd5EyVGae29K92e2xQvuKZN2OZigc9dK9AK0iZcyZFa8VXeiw+4
         bzjN/blahJvJb9DFbHq40/AC15bHuyCVpkzZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163515; x=1755768315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enM03Y+SofNC9f2L6BJ7C/DVoLrJlmtDheNAd8lIknI=;
        b=vypl6dwS07u7FHCDEfedye1AwU6E96eFVU6KYEotnIjaOjRDMickK1jGdDxWPjFQMm
         v9y93WiwrURZBsk7bV39FekTZP7nXO4w3uET4Fv8BGQIl08sG/drznh+RSe9n8QfvrDs
         HxR4JuuHDjWuwb4I+vu2qE0BTynzeQcouk9KW0zDFOAdbTwk555SFwIMZ+1wWwRTsHTA
         AxRDvtYNydjXSrmkn16g3drln8trUCbP9xFstGU34nDNYGQARTnbis0l8jgIL13ekVBS
         tFfSHaVLDKUn1KoVzAlM5HUOwspsHg7/Cfst2Tj2dtq9q3ZUm4p5ef+by5ye+k0qKr26
         Kp0A==
X-Forwarded-Encrypted: i=1; AJvYcCWJE7cpiUzV7NN4Pc7CoyyZE3A1B2Y3ALZtNScBvWDYOqFZuJlmTzRz65nGvgu/i4MLUYeZJat5Vq3yasF1xCyf@lists.infradead.org
X-Gm-Message-State: AOJu0YyeshHx2OMm+ObN3/FxSl5yTUTkDgsIu6tjlfMNHrD2mNOsg++U
	26+R336ZAyurRdyCa1iQtaMjgFCC49JFxJu3iz/SrdsYNglDDc5WAQgTd3+sDh3E5g==
X-Gm-Gg: ASbGncunF3kwR2mL/8ztBkcH1nnk/59Fm9K7EfL7d+1KQayrG+06mnBsOMJKRIrQ0jZ
	e88RpLRwkqb7xJ13O1kRj1d2Z/Et9UbngSyOyKmQUP2WxvSAoxhhnBbmVWgyJVQYi1fn2+4pP4w
	/vTHHHf+HGUApMe8vdWBhewqOPbIIhHLd36V1pXDVWySrvfM/9SxRURYpS6gvLUjx7KWxuT2kiX
	emHow2H/MjpGC8/S4wlNBLKQBqixeg4YhLdBsutGR9nOMCfDOLA0B/jPcct4JVhrPr8wbHDRY1I
	0OJn4UdIf80OKMBmgpOzGd0Sbi9dY6GS1gRastHor9hlOa26PDAmQY2fNQiN66QnQqbi28zLiNb
	7t9I/iB9uihSiWU8IgN634rCe5Ks1re6GY/KQvsV9
X-Google-Smtp-Source: AGHT+IEGaNwQwUsuoFyhAT0RG891ff1UB5Uya2JxWtJ1QeDXdtqAdYENXV7IRVwIlXojpGbzegP6Lg==
X-Received: by 2002:a17:902:e84b:b0:240:3dbb:7603 with SMTP id d9443c01a7336-244584dc1d4mr36979635ad.19.1755163515364;
        Thu, 14 Aug 2025 02:25:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c44f:5805:6bc2:66d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976d13sm346186645ad.109.2025.08.14.02.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:25:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
Date: Thu, 14 Aug 2025 17:25:08 +0800
Message-ID: <20250814092510.211672-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022516_173187_0D09EC5A 
X-CRM114-Status: GOOD (  11.17  )
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

The first SCP core is used to drive the video decoder and encoders.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added SCP vreq pin
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index c5254ae0bb99..7fedbacdac44 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		scp_mem_reserved: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x800000>;
+			no-map;
+		};
+
 		apu_mem: memory@55000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x55000000 0 0x1400000>;
@@ -1077,6 +1083,13 @@ pins-bus {
 		};
 	};
 
+	scp_pins: scp-pins {
+		pins-scp-vreq {
+			pinmux = <PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO>;
+			bias-disable;
+		};
+	};
+
 	spi0_pins: spi0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
@@ -1146,6 +1159,18 @@ &postmask0_out {
 	remote-endpoint = <&dither0_in>;
 };
 
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+	firmware-name = "mediatek/mt8188/scp.img";
+	memory-region = <&scp_mem_reserved>;
+	status = "okay";
+};
+
 &sound {
 	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
 			"aud_etdm_spk_on", "aud_etdm_spk_off",
-- 
2.51.0.rc1.163.g2494970778-goog


