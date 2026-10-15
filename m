Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA22CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=; b=xny5B13wNDzWrkox5zL/yMSXWM
	SvvCPMNTQGj3T5YRwbHTIvvkGzBhf9vbShmGvlvpzT8L1cUWB4v+h37bJekDm1dl9R1FbE2NJ2MmW
	RP9V++R5ETTiINUOP+BUztYLtuiX54Lo50ATGZAZ5RNbpmIvGFeexJSuxyXZnq8stlT154JB7Nnc3
	VwlPp9tB77/Mpo5OmNv4ZNHXkZdXgTw62o0NYclBwFsNHJQHTZHfcyuMIfYy/n4lbehbR8gkrwhCL
	iO5mFiRolmVLtTXm+V8ExDPmQviNfzu4scYInu4a5uiLo7S6vvn8YnvGkJKkJrADNm4ue+SmL4ylY
	XsIPteCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGZI-0000000H7Hn-2O1C;
	Thu, 15 Oct 2026 08:12:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGZG-0000000H7Gf-31k7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:12:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c4649b35bso137933f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051921; x=1792656721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=lV78KoLMzSaZOMzJaoG1bO/6dy420NsbGqhReIMdbWpYUahzFn9MFapCgZx35q1vdD
         fBraN7OfFu6qEdcXUX7laTm5IvufopNfUTRZ3G/r9ErPqPp7LksA0o14cBDrV02WrYW5
         wa2o1urUGKZRC3moFSnteqJJ0+JBTZ6nTg0zc1ds4GXP1aV+/W8VNf4PKNruWB7Wm4Lv
         unY5Akbsc9cnOOm1bIussTQiISm25wXfqhMcBDeMsK+dpBQtp4gBj7jJauKN99OnM/Oo
         Dl2itCrr4U5WhqCtOu4K52+/jsRaeW7US//GxjyKhTnuPtCfZjWCGMl/bt3AIv5p+MoS
         yKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051921; x=1792656721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHuAmdmkXZvDWTufmXOc4smtM5tKnn8omClhm1kd2uo=;
        b=kzrY4X9f4vxLhIuMQrtV0wu/xklui5s3jZpXxsp1cT0uw0cJBroMHFAb+0pV26qkuz
         1FkkjdZrBi1UVfhLAIlabkdKBoi1llCh4D5et+kbA6fb7MBltGxys5MKjbgpsi5ZMXtS
         UnOUMY1tiS7yiAr/iuwyCrl4RkecNS9fkj8THEU1LXlh/QSIQrFvbHi5Tzi4ad7FpuRH
         BA/rfGLpfuWrhXh6Td3wWaxZZNaJFqgrCGX2UsvAEuiJYZ5kaeWanr9MMLhNxarlowL6
         ZcnW+H4o9Cn8rOY2wp1o0y45rp8yAO5cTdSH5bOyE+fWWwly85FTDNe6vSjSQv1veASI
         cwbA==
X-Forwarded-Encrypted: i=1; AKwUvBxBj5+wM75uAaS5wD5m5OPo1tcyp8JfNApMGsT4AQoKB72saRUbnv2BEJ4PNy+lhd1qu3KUCRzo7Iv0Fnk0NMgH@lists.infradead.org
X-Gm-Message-State: AFq9FYJoCr/jGk2BBZcOKFRkXxWnUC6oc86RgA1N+wYls8Z5rQvNayKr
	7XKxea2dfjjNWzi0pdcGSLzN9R5oTbzCx6UCuqYJL3LB2SSxnyiIn5mZ
X-Gm-Gg: AYBFou1GVAfO0IOPLiOWRu2Ldmd5BEGDyyZAJvLYCu04ANt5OhGMVz5+5ehSgADeV7J
	DeBh1/bFk4dOmZcWbqQaDMz6mzVqZ7jBFWg9vcVtFDHm5mNw4zw73l704JOZTgUbbp9B9RjyvCv
	ZR9LUVJD1hM/8VRdYsOrC3Sc1fO1B49P8Hd/3vL3nROYVCXVqWXbLNGPMI/6lK4uqbKe3EpMszH
	tGBAHS/T9FUk3ZH73KVKclfscsQu+Qbd5lS8xKJl5koFcvAMKTNzs8KJc3zufWzsSw7YTjhg7X3
	J3rUZMFDk28rx6ewcW9zjxa7Yae6LHjx7T+3cHcWEKN70iEuAA1/BxtS3cruJ7lbJfh60shdYhL
	Xx8y1YtH0btj9zLjDgXaBMTz1o/NE3KKQndeozRTJMedyCW27FgAhaScyW1SHa6LvGoDGl1ZN0J
	nkqx0JffSPrTKiIr+FJ2+7lkJ2YQFoKXkvRG0MEf7IS9GPedkODh9p6CfPMoHGc0d+MideAGyLh
	znhmgR3CkA+bw8aRgHobWydfsH+oG4palhLRJKWFu0tBOdvyBTRwZ1Tc6z02ks1WV9eCmn0gGg5
	3NiANR8dPAhdfD/uGGXdPAtiDmpNQ1Ix
X-Received: by 2002:a05:6000:2993:20b0:48c:4442:54e with SMTP id ffacd0b85a97d-48dbaae710dmr26750262f8f.30.1792051920518;
        Thu, 15 Oct 2026 01:12:00 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm16237534f8f.35.2026.10.15.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:11:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag on i2c3 GPIOs
Date: Thu, 15 Oct 2026 10:11:49 +0200
Message-ID: <20261015081149.5919-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_011202_773813_9570E188 
X-CRM114-Status: GOOD (  11.62  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
following run-time warning is seen:

gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 3e590afa4fab..036afa0f6990 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -287,8 +287,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca6416: gpio@20 {
-- 
2.47.3


