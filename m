Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBEC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=; b=WXrRY31exI3hh27EbMM1cR9gSl
	wnvSJsfQqyACry+2wAU/9lbUQYL72nqWj7Jd/98XIPAN3mjIFX9dQpCaaKWbfbhR9oUg5EHoNFH9Q
	+cMCn5zdrHTw7CTcPrXzdcDzA5YVUa4yrke9FoIOkzh/8Wt8PoBjxZLf1PwLUup3nvFra8vtPtQ4D
	4+LwY9XYl8wnEW6fHKSHCaqwS90qFHXvVRdE/FjBd47xIkFebhsiiKe4FHuShfjBs7doKN+6jQwqB
	bp49Xd47o2j7Du8mhCK3TSuxUBMCNuthAPBAO9/krkJnwA3tDsxZucGg2mv0NDd0vvhKLGYeOAeGq
	9rB49uxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8FH-0000000EdVL-0eMZ;
	Wed, 14 May 2025 09:17:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QX-0000000EUeX-15U4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-441c99459e9so44108605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211120; x=1747815920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=Ch7fo6VdTX0dTdNaO/qh+a0khjrTyvZVeZFXyKH/ePRWEkzu7DrN6pXPqU/XGvnhs3
         3jQ5nKGF4oOy6pLa9z1m4GnZvTXaSYkz7Iby5QRHS5NWTQLpC9RGih/gn1GbsgeW5Q6p
         UQj6tAWPZRJ9w0A4+HZ+e4FZe5gUwU3IGiGX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211120; x=1747815920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=tYl2jt7YdXI2eX14lQoO0ffVYf+rQWGKD48VX3PH6D5Lqt/i4z3a2A/oq7zPD6rnxQ
         L8J+6P20wNOGSR/+dO/U0A4WzDjrZf2qpc3aOVX+53qTc5Tsm0ep9Xe3qd1X5Ve0i96E
         YrX7BXruq1HQ3IRKX2hMBO7GanLNZq5nnbXiOomDHesYKDh+e01We0IFX48mvjSxp5Ba
         9BcaB/Mi40Gdh4A1lb3ZmnGB/kOTC/jlXf2Kt6bLZQC2U9FDgD+fhu7zbnHElQLX3n3B
         Ix1uUoQmvroBfwlqET81fmeJe8gDxycHCe6dx7cVS521b8IRR2I+C1Ucj4SeMVGlcJyd
         E3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXCAEHKMLS0MhNma0nFjbQAekic1tT+VSosCZvc56Of7EAtQrBQu0+wYXzoeu/xCNlTLK4TwzyEiBxZ++gv07XN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jPHiEtDS7ppg8SfpZ1q999TsO0Hu6DiIg6OMZFDmSioLsEHm
	NWoNogUIGdVqs7ro25Yrjc5KtP/QqUwa8fCc3ImavSXNSfM90IE8YYiGfmEcYNM=
X-Gm-Gg: ASbGnctGUg3WHVHySJsVyjlxNqrJ44j+qtHWbFj/iofLiSALjJ288G92pcimD4vUUe4
	fRjmjJoYh7LOxO7fLwKtlcZ7jvyDva4gtdrP2ZXJVr2JZv4T7sjJSPWLYVFYmrKfI4iGti8UELs
	EcyTP2Hw+Hh1cXhntL7h++cEN7Vxog35ZRFZxM0ORZQPSrnExws1XiqdG8qhWT+Bmnz/65ldOff
	VLjFLkSjiT/8O5wdrWgiQfPu963stqI88WuVpy+sJJTQTiSNej8a40DWn1FQCHwK4utFtJ+Ndqo
	2gkHdJhxK3ZTQ3+4UuxBMBnG8NMpJ1Ea5SGZgi+7rbxQlBIbPukN4WHpXKtpsgY+g+xusYn+5QF
	FqiyeIZ/E5xvbRzDmNaOv5RmeqMB7S0myTxo+TuH4d1c=
X-Google-Smtp-Source: AGHT+IHcoj4ReIr/iS8EBigcY3fpcStHE6rMJeIJaxLW28FmlfG9AFQQiTloWrHrTZYCmAs4sAUIcA==
X-Received: by 2002:a05:600c:1e2a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-442f21696fdmr16799435e9.22.1747211119909;
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_DRAM_VPU_GPU
Date: Wed, 14 May 2025 10:25:00 +0200
Message-ID: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012521_297420_5B0474B1 
X-CRM114-Status: GOOD (  12.81  )
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
0.55...1.35V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index fd12b97525d1..81fa0a8767e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
 			buck3_reg: BUCK3 {
 				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
 				regulator-name = "buck3";
-				regulator-min-microvolt = <700000>;
+				regulator-min-microvolt = <550000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0


