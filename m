Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7439EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=; b=f7/ZDhafCRX3J1Lhe9v1CjscoX
	yx66/D0TGuZUAu0P9Olrl204pOuR7AVUKjRnYyvDQ3vIt138BTtzXwXfRXx87k8VPIiUtS4cHrsbz
	+qtwyOJ+VFxgGgblp6MaTxwB6ZjHAZsOGTqX/cJCfgJZ3AflPxyETzvLUpmdm0O8plRHPU/jgmNZD
	O+kIRIy93YOcJL7ViNuVUTvTuKA6JhprCdJ276dZ5KRegAL8WJNhIGqesw/vbv9rX3EXF065FPwwy
	mLphY34uCLxLD1/1G1J8DHlREax9260K8UyXt1a6Orh9uzTUcQs50N5YUBxcGLAxuc7HXGUYKFZ1g
	RHErXUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kPd-00000006d06-3YiD;
	Tue, 15 Apr 2025 17:49:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jy9-00000006XpZ-0fFc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:21:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3913d129c1aso4071920f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737667; x=1745342467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=AogP63U16Ik0ilanaoEcas58QhMO4ZudEH//6Kqb46eSJaLDukDfnOh3z2loeR+Yr+
         TP/IkBDLAdeowNtjec5IkYtXWCYKG75efUGwHmOO1rHJm7jS8JYo3pFZaHHJpPGZgIFn
         2X6YpQuO8F38cVfhZu/ll+uz3qoPGQUB+xIIwLTbNICNbGwnvlNlqKdegM4VJqPjV35S
         tSVAdUBSXFo5iKJSsuhXUnqLYu02HXTitdRmHfpnmNfWvvzwhRBEB7kPZd8hQXdUtpKP
         inqN6onFYPkW4SXpFDyU6KJRcRF1vle/3PXdZJQbdJRNLzARcNjJF9GQj19xK44gN6Dr
         nLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737667; x=1745342467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=cX7RbPzTtarc8UyoqDgwnSow1UmH9igqyu1yyfbjwfkTeTzEAxTpesHTix2vFE1mJ1
         wcjsd1CR5zs6yCTFAb3qi2HdvoaPAYzsW+GPt7qYp0ZJECHNDyN5BY8dyXuClRDG1P20
         PaELg149zTCGYm1x+aQ+a1r1Fk9b/d00gebsC13I79uhqcXSFQF0MskD70G1DgltsOIl
         RmdSylDzCdSusdFge2oia/xYeBB2jm8IeYCvoZskBNFe1UWCa5NfFvxH+Oac1JOZFwtL
         6mk1DJn4Bg0v3EdO2cCL5bxtR6YMbodPPVQehqy1ijYBIDx4WLJ1kfhS/thKPIsf2yRY
         Dqog==
X-Forwarded-Encrypted: i=1; AJvYcCWSXXbgrx0Q3iYBAUlD0en5BpEPODGb2paBajl/wSE4jwZ9vqpVM5pwyF/0PM4qo4nPCHQ73HyuBaLSLh5qwQSs@lists.infradead.org
X-Gm-Message-State: AOJu0YzO+dAACUs2Q7ih+4PwgWZQyIsVHWdova9g6Whn9Edicari+Qzs
	hfi64j7Ysx8+TXQdOP+gi7sMlPGLk+jbDmvfEj5jwljwkdPRxjTF
X-Gm-Gg: ASbGnctmccOLs8lFWL3k/jSRIlxbHe6ibSxXIxf/7SOY19A17ZPHfD0GCHxwnrj2O8t
	iBzbB8fYaAT3vLVYI9HPAhUGfmBPvGy4NZpm6xEGMrhq0IpyKOWFPpePvjnoIXZBO6GXJ2VHD6p
	PK5UrFifuxo/BbOVJpBPSJkr0y+FVYV+kiCGJQ9ehkvNnG4Ltlu2uh7mODoIu4d0HqokfisInsf
	PxjlS85TPyKW5KVFiNZItXshTnhNVkf+4Zz7f343J31Xxz4fSe2Q4gz5cwXz5DH+if8EtxGgqs7
	9lnV1HVhMlGYhlCuWIEZPQGhNU1/hcj9FuyPCwAFMVbSj/sn5DVE650Dqvxk/fA34xMpsKw4R8T
	QEyE=
X-Google-Smtp-Source: AGHT+IHH3wzGSWrXRiwit47ROGdwVoqHne1P5CZMV6a2MyKyXpYB1Eq3JNyDUMsp35H0L5HNUwnmmA==
X-Received: by 2002:a05:6000:178d:b0:39e:cbca:74cf with SMTP id ffacd0b85a97d-39ee2735d3amr321139f8f.6.1744737667435;
        Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 15 Apr 2025 13:19:17 -0400
Message-Id: <20250415171919.5623-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102109_196766_5E23A7A9 
X-CRM114-Status: GOOD (  15.10  )
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
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
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


