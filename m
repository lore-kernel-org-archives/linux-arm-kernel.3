Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAB8C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=; b=A7UiGTuxydnGZfYvwTbxqfIAcL
	eZqc6n8xcQJ0UZPUKVcF9Knu93523W0Df12AYtjZaX25d9YBSBnbInpNJtwb67vdO0gZ1h7aa6Ot/
	eq1DDxe5n4poFpA28Zw7DkUKwNcEUIZOkSI7APUuODn7vMYRy7rqCmVMvGLGRcnWOKQjcHrqlawgz
	prrL/I2nUEVCF6VJodoBtExDP8mZvl8JGwhuXDPATgwkB87ZSVQsSBOS3xJh0//QE8nnBadKUp5pk
	KG+4jPGNCB8XjD8Eo4o0mqgg31kgJ7nmsHlLi01fL3tQz80gwgGWasyLqjQA1qy6eWlDInmwUDANK
	rvnK8wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgUE-0000000CxUv-1eOB;
	Wed, 22 Jul 2026 23:36:26 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmgU9-0000000CxSs-3aQQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 23:36:22 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6689f36ae56so8059d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763381; x=1785368181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=AliCOglVN8RSNA2VKtqZTeQWnks5eQsujNoqNyCn+Auoq54ZHSpBfrPk7c4T8Vspjn
         aj5mNpnpiK3d768TXU9aTsIRrQgR4Ic224KJ0mVYXRcbMYZd2ws/oa06br4ZMqzDbD1g
         OON6nOgIoE0s6icwtDIPisy7+BvC4CQNedWaUVteglkp8KftFQgsxbfrbKH2yvCgJTBA
         keHzRWOyjG9xgbSI4dLydEhRRKNV5xpeGXnUukZmHUidoKk1DQsgWZNPZxIxh9utsfIi
         lDZLvvhRYz3Ntb7UWnvfmxX8NDP6N5kRq4QfJTPZMM3I6GOxhyz8P0x5E4jZsKG/DFnD
         H8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763381; x=1785368181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSow7P/U4ty7TVa1wStrr2GU4gsF6dil0NdrrF14oGU=;
        b=SIh58+SXu45f8Q0DaB49NpCxe3QF8MLA1Ri9m6myvVngiKEXBLlstw6dFxRuzgNh98
         E5ns+FrjkzMg8G/Wx4U12EmWr08eJqup6i5awxehwKo5gu84ZOCBBh3YjCF2TCyi6oZP
         85LBy+0VnyhzhstyT3OcsK86KWJlOq/U9xZcu2aUZCXIW8WgrraQOrYr4PVotORCjQBN
         JArdKHrgSlf6JzLnR/LAKQ+VkrnNPooPQpOW2SvIKxAS1+B/KQBlqHcAAyYBzqU7W04/
         S44N9Jw5Xot982846NU7+28DfHJBG/2YvyUi+YzlEadpMHyuyyuf/ve7WaoBOAzLB9hq
         +mGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowz2YWJ2n+zvA4VpqiflIJPUCbMBvX5MBIIz+y6l1xSm8ozAGGvc7KgX10XQkbna8aBzgNY5+rQ7GmnI3E9gAn@lists.infradead.org
X-Gm-Message-State: AOJu0YxP3rtB+wEWtGxkrjxlbHoPWz/QOzlalt7PKRUReSUa74x2TnfM
	jhT/GuOSnrEroQ1+nx27bibFhZQCWj5FkgCj8llabDJUV2iHFal0EbwR
X-Gm-Gg: AR+sD11YtdDN9cD3YjRBbnZpCFq1U3GAw9gOYMe2UMjjzM36UHl0qjT4xukOsn4s+lb
	dYwKAFFjMeJyDmknRVOHcMa9A8PwjSrGIegfwJ2kITURRmS/nfnhoIF+fSF8FDWiYZGEyffUxZF
	644IBRaY8mZoxhpWBXn+FRWPdpHlpVua2S8c+1qOLOk6u2PcFFuEM8IHibtfnA2amIxZef1GTrI
	aan6myUWkf6eFH6pYIqwlrCzjFbJCLTPEm6O37OHQd8l8SZnRir9rsb8Ykishz0NjLVea0YpmIp
	wZ5AlsPTmhkRtjgDLN2wneO4/6/+SGefKalmcBWAlC/OdB8GtRiAAz0gSSNDrIMyv9BPBzw/8Hp
	pLljncopXln5mZljX0XgitlGPpkoGUG/Xj9aSum8I4/obx9jCgWlCDzxK0Jvty7BqIVm4ZQ40Qz
	c1MPIyIEFtayF4IEYPf6Q1B5d10Q82KT2uvqs5
X-Received: by 2002:a05:690c:d07:b0:80c:90ed:c79f with SMTP id 00721157ae682-81f4c30b5e3mr2230927b3.52.1784763380753;
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Wed, 22 Jul 2026 19:36:04 -0400
Message-ID: <20260722233604.3001063-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722233604.3001063-1-utilityemal77@gmail.com>
References: <20260722233604.3001063-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163621_910623_277DE691 
X-CRM114-Status: GOOD (  12.07  )
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

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index c2de662140ce..219fd76a4710 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0


