Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E84C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=; b=kMDVjRwJ7lbMhgeW5wH2Hj5m7f
	NutNB+ZcD3uJfIxvNG+6iD/Mr3vzCjDVpxnm8HF6ru18zXXowJQ5crcYhYOJH7BkyJLfglo7bQhGG
	fw/tB6P4PIcrjxRKSUG67i6yo29lzq/bNvIujqpMIknSjrjIVXBhgCUivRyKZj8gPEytuvCZhi6yY
	YDJmVLEXw3Ysz7aRIhcMzqbGIonL2EAsyfcxTEZ0mpgjuzSlmw7K+eaZcSXKEL6jrpu8mzpbA0Pbg
	9d8ItFjfoGBllwn6nxhOmUADh4Ale/Upem1cJ5krbmtQ19t/hoSBsVrPJj0hQZqMvEumheOf7rFyM
	MXC66Usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l2-00000008EWB-2nY6;
	Tue, 10 Jun 2025 22:47:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qk-00000007P3C-10f2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso35983405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571349; x=1750176149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=c46Otk9LZTi/+n44Rz0JjZglGZYd2BzsKt+rGUN8LTuyIPmjhh+3PFxHt7z8GnLiy3
         2QymnfpoEG9KekGkQbrwHPiEA35MQE6eY5AakMC5JXMF9Cpx4AObtwgNTWYH+nys6/dT
         20Jsoy92ZOp639kZOnlTgfAJC++JvxP2CYuJ/KyOiPRNAi9fCy0cCz0Q1pcbz2qMOwkA
         hFVC8RK3fj6d00VwXnGzcK3PjlYCaP9ldFevBuAVwrx/dDirvBJAHks82SLTGk9Ojv12
         KEJgxDJQOKZLlYNqCK9xG0BenbHH0bL2kMwG1Ct8GvXZolnHMUrxidEYHmfmH9TNZ6jl
         3MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571349; x=1750176149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=WmRplnPjJrxICMWfLxX6p1tuU3Lx0kF8TtFLtGjNXEkTW0u/mZUJZLtaVbKSxzpDbP
         FBlhTyzlzVmaJQtLA9/EHHcL3gI9Arg60HDxcemSzIbnnY68Qo/2kRblj+9ANUTnqQR+
         /cnmQdbiBdSNy58BMR8DqVqgsNaKEYJBLptGQsbTx2nolKl2wVAZoHb/BGj2wCTUf/Jg
         ZB4fcRODG+zp2C4M5lsz3GCeaHbZruf1PSHxLt2871s9mA6VfnvC0I9kPTIZdZzVsyxj
         hD//LaepdyYtXmj1p950H9eQfIj1SF+3gIcvFsAJI/ERyMbRz+wdvEmh2cSHdyRzGykd
         /PWw==
X-Forwarded-Encrypted: i=1; AJvYcCV26z0Quk7hhcz8TfFDLztnwIiGMnzA+f0lI1E3THBFETxCutzRUISPy3jFAt73CYf1CT81VhP7GRyglULJgLSt@lists.infradead.org
X-Gm-Message-State: AOJu0YzflxherFI5JnQx0B2HPoQF26btz0TnwcBZq7CeZBOeCpFeUjOE
	hLZgBUeT14rvKEmFGl9KeVvB+bWiBmJPeqwM8vCDvDk11yiBxfE+S2gO
X-Gm-Gg: ASbGnctTIxbuwpGdt4azfp4N9Kl4gSOyUuNjRiHIa5O8SmfcHpaWI3nGwOCCwn+55Di
	iBaOsqcbKVqnsiGuohSP20b4Gg6UhdBts3qfBmZx0C92PxKAD3vnIWFPretTZDkYmltdyd3YWdM
	bD0l+pDCEM1zy4kdx/diLGZ2yTl9hzWJLS6qD/hcRqXPjNWbTd5LP2Tnu5825d2W+ALD0yshe4y
	bdyf0w4ug2yrkcqsZLZuQwQpCw0pLj5ifBX/pIM3CJ70elvV2APUqmXPNhoRMl4JLsEfiF9i/sc
	toAbczOvB9bt8DuruO2qGCPlrc0sGDsjLWbQ/hNv5yKrAz76yfFVdO/JE0yE+7CISTPHyskAqF7
	7M7qN3j19UCrUlY+Es94Y234=
X-Google-Smtp-Source: AGHT+IHSoBa8ZcJWksNpcGAtQt6xG8vZ9PxpTvdcpULBq5usdCTTV9sCqHBLSkFiGZ9cN/o6Et+0OQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a5319b64b0mr11663701f8f.41.1749571348281;
        Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 10 Jun 2025 12:01:50 -0400
Message-Id: <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090230_278737_478BE0A0 
X-CRM114-Status: GOOD (  15.01  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..307e1671eccf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1397,12 +1397,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


