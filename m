Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A6C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=33CK6psrpblH2CgU9WWzzRrMa5nOu4Xr746XCaWV3tk=; b=nHi2J0yF89LoiN27OF/RYIRwAc
	BoP2p7tx5LrWMlX7/auyo81FyMqzoEJxcnAc66QJigyGxuSl0ART26+ptE77xY1OLTIw66/j7fktX
	CLKAeTROMMk4YeFPHbPFgdsfDCIk1MRisIYRZd/93x2s297s0/Zj644a7Xoyh7Wfqvj49CiWp/TIY
	djfZV3af2rj2R9+6TN4hDHpqUqKVCfccwduWYS1sUlqy3x7NuDEuJJ47OgCiUSG9ssItPgCx4WNJ7
	NrkACl1cSSwWucKuNHTMCCaQ1Oo/M1SBfIIFweB6ri4F6p9YMaW+mNyfcfq49WmREKbomNXl5c1Mw
	fEprh+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcTp-00000002fLd-48iX;
	Mon, 10 Mar 2025 12:43:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcBF-00000002bF4-3bPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:24:27 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaec111762bso809872566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741609464; x=1742214264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=33CK6psrpblH2CgU9WWzzRrMa5nOu4Xr746XCaWV3tk=;
        b=WbheWRNZJwTy7aLCgdj5KEF1N9EcdLKgSsLmZzS55MKG9thbyMIMbbPBY7kSOPAKRN
         afuBuC0X9e0vGmogFsVrIuenBOwlo69EeLueIp2gnfiAMrfGM9cTcp9HTy2dNEsmGV4e
         /oqX1mvnVm9QhZaRgySw7B1pyAIW6d9ugS5YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609464; x=1742214264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33CK6psrpblH2CgU9WWzzRrMa5nOu4Xr746XCaWV3tk=;
        b=NqkNKYVfECkalvCGOrxD00BwtV7GAlHyWQpsM7djHCtL+zec9R5wX621o1YA6CU2rr
         JwJCEom03DrgzYfO9HRbS0kp2SgnMIKUazXNvz8Y09+MyKRk0YU3rNpa30iBgWFZNxXm
         uM2EE27nonfUYFdjH0p6902LOpH+/bn5I1VmvDfE3DILNaIM7mQoZ8CCQbcMk2UzeG3e
         wqeeYNPJmsgazGLloXsoSHxHWSBLcX0TuZdHDh9odKdLeyTI4UDdNdESNPQ+TQscDIGb
         mKAwbvb22SxdrBvbSrs+9/6E1DGR5HNSPImsCS2ja0y2o0IGJltUTelNXq8y8RMCUh7y
         BKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWyrFOCuej21aXSQx1slpSbxU9FbswX5LuIUbRW0WU5ZKJvblFvjupjwTkmcQX63axoPl8Ayn2ctyxAWLte1QjH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8BMgSD1Aqj1nBeWAionJNLdLCphGVd+QgfiVewmmd92ZmYcnF
	+oxe8a3uOd3U3JlJHmgwzEw5gzk712xWP7qQwOppgdAsmEx5/ZNAqvpviSGjcEk=
X-Gm-Gg: ASbGncte64kL5hKvjztM9islU840Nqbhw/BzhxPwkIXKYjD6OhWrVXtQ1X2bcRZZFaG
	rj7/PGLwtsRg4oAWDGA5PIkitivQ4Je43XwQmHPpr/IxZSMUntfDNg2K2WaEXd6O2HAdq2JK8H7
	NuMOrqbd8Ozg0SHtv3VK/6u/m31+RuF/5+y6n4cis3SuPkWLcPfna/qife20FLVFFM4J1i9mz2H
	PnLNFt54cp+SOYrKxKLa2phdA2zgyI22uRUN+s86flZePPSe0RLHuHYbUu/HQDD1NNAUbACom4z
	lZ5/IwCi/XOrkin0PTYPjVrE3n0FQivIbojsSfucMg9T91x/TX9QkBCTDpvY2Xg0+c6osiugELm
	L69rlczF/U9tIgw==
X-Google-Smtp-Source: AGHT+IFVCn4XgPQmS6e/eeO8AkfoYCUAhXlWOW9B7DhCMb0sWF1pzA0CXrrJ6W16xDN20EJF7h5N2A==
X-Received: by 2002:a17:907:9490:b0:ab7:c893:fc80 with SMTP id a640c23a62f3a-ac252b573bbmr1608210966b.24.1741609463722;
        Mon, 10 Mar 2025 05:24:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([213.208.157.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2817467f4sm361656366b.172.2025.03.10.05.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:24:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
Date: Mon, 10 Mar 2025 13:23:56 +0100
Message-ID: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052425_907825_8E59A84B 
X-CRM114-Status: GOOD (  12.56  )
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

Replace the number 2 with the appropriate numerical constant defined in
dt-bindings/interrupt-controller/irq.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

---

Changes in v2:
- Drop inclusion of dt-bindings/interrupt-controller/irq.h header
- Add Reviewed-by tag of Antonio Borneo

 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 5f9c0160a9c4..324f7bb988d1 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -67,7 +67,7 @@ &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";
 		reg = <0x38>;
-		interrupts = <2 2>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-- 
2.43.0


