Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA95C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=; b=SdnMft/DxAhjdc7XUAKPI7Yti/
	6g5aXODjpD33LJA8N9ncIsTQkfXc6bLVidbSKcSESeW485Ms2twbZUSWP1TTAYtxBhQkEh8GS9K2y
	8K6M6HPDtVJZYC/ZoMgyOQ3fVWF1IbK/A6bsz9K7BCxfkOma+GWdw1oUpyqY0YuoaT+IhXHvedvMN
	NiSuUS47onO3HUzqa9YjqbYO+fCDp48M19Myy1adIbIAw1gY8ua0/Mu1fGh5zzWpC5hnLjZOKIQEf
	c0dLFi864a6O1CoFlSxK/Ox5NfsVvNh9vgIVvwaP0jTbDKlHrPm8m7p9oOnBOb6Byl3rq1zAHPf28
	IyTOf4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF85J-0000000EcDN-0iq3;
	Wed, 14 May 2025 09:07:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QQ-0000000EUcr-18Z3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ede096d73so44978925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211113; x=1747815913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=FqzFlftEkECAhn70f9E3lVNE2XYkXrLrwY9Zhgci3kajc5712nTumBidPxorGKv1Xo
         F+99Q5abJUI9C4Itn7r4Whgpp8uPWXs7/jO8uPxxToIx6g9US2Gn3h7kRc9Ijjr9mFbJ
         oV4K5S4flOK8AqCW6lrmVfWiJTsh6XD+Y3w3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211113; x=1747815913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APXOpnkKR2dL3UO348/Gsh5gr4ZIHC6LxJe7czOv/OQ=;
        b=CpmTQ4iX2+BVfFLznulMXaf+nDlrgrWrcsnH2rE73XdY07AltgflBb7vAKvij8ShAe
         X7+udN6a3j1+nWhpTpGxC4mpYKdkXgufl8fOCgV1CMKt8B4EstQfqLE3qklq+tlHW5fQ
         SEurB3Hu80e2FooUIY2fwdJnrI/6X0E0k5UYILwxe0ov1BuOyTjgL2p4lurjPn+H0uKy
         U3+vZGk1eerDamRF02fTrLiLbYkZzERHgFk91OyXdXFPurGJgWY/ggP1HeC9TMsF6lFz
         y3KWUDRtf9v3SMsW66aikVL5Cttm6mL3zaTKSyn++Qy0M6csi976QVzcfjF3W4mWvYif
         vovQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVt7c9Wu+HsWSQR89scdCl056+5z8umMioXjpMPkXvVrTLgadv3ZPLCm9oBbug3eOVWC01EYHf5jT6pzISiR96@lists.infradead.org
X-Gm-Message-State: AOJu0YxszQhWloUtK6EunooEaIZ/yQ301YLcclSZS+KI9iH7i9TNdpiw
	rAlbT4bv2xM07hI9K6Uh6TN8JUv8cfM9RwujXCzyNO7thlYZIXaxN8GijcVXYQs=
X-Gm-Gg: ASbGncsMDPciT+q2p12GfBK7voW5JTNDs14d747OVNI0ysT+m8t7KOcaY+YNnQP8kAZ
	9kdlEh2XL5Feng8bo3UaoxORsAYVEvBP+YC9Fkn4ymx9WDR6tc8sGocgRcVgfLRsDbU4/94Pxur
	naKnDeQiQOsGxVAWaZEOIHumPziGiKWmSRQaBbg3+dONQxlwppZxc5LNCTB/96q0nc9kngp+S6o
	TSgBa3F5juVKZ2Y6PNxowVcg8tBy6Qk1rU3kBobeGRt0CrpxBn3WhyG9Jd1Gh5Wd1XJ38ToVwiu
	c4CWWm1Y6j0SsPNBi6Ya9sSJHbaY4m66NL1yne9OZ8YO/KrgnWFtUe8A6nakg2XDh+PGpljScr9
	zbltDTsmZ41zP3pQYeOkBSEGE/ggkY+soE8s5eqc/pnU=
X-Google-Smtp-Source: AGHT+IFPJ0BA1CsQj8STL33YJFdXEivrOIUNuDI5cLI9H+T44prBBCXb/RtByLVzJ5qOgclAySopgQ==
X-Received: by 2002:a05:600c:a378:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-442f20d9d37mr19135815e9.11.1747211112873;
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:12 -0700 (PDT)
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
Subject: [PATCH 1/9] arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
Date: Wed, 14 May 2025 10:24:55 +0200
Message-ID: <20250514082507.1983849-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012514_308446_3F366334 
X-CRM114-Status: GOOD (  10.20  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Voltage threshold should be adjust according to the worst case.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9..5a1ec2f6a552 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -105,6 +105,12 @@ buck1_reg: BUCK1 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-idle-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <850000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck2_reg: BUCK2 {
@@ -115,6 +121,11 @@ buck2_reg: BUCK2 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <1250>;
+
+				/* enable autosuspend threshold */
+				rohm,dvs-run-voltage = <960000>;
+				rohm,dvs-idle-voltage = <860000>;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck3_reg: BUCK3 {
-- 
2.43.0


