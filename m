Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFMwJAaeoRNdQ7wFB7oOxwf1IaEkyF3Nv5JGSL6B9MU=; b=HDFXwLxKPl7yCiGuwt3Si0oxUC
	aaP4ydqFDQnvaLfHii97vTqmJkvzRNmg4r7anM6H4s8uW2SRDN8r/u3t6bfPf9mCAf2ZWaFQB8fvD
	30Adc64nDH2WVKoXE3/sZ4/z/4P13zvoMMsmW9ZmnGQusjT0JKry+y+eb0sflGYnlSWiptFsUMG28
	S5Nngb/MU053m9DG7HNecY5jSwMJd8uXf3H0Jd8mgQmL0pZraltRa7dkUJRQNR3ep/nVSiUbershK
	FntYlHN85WZvPl+5JS5XCvxV5wR8/FPqRqXULlAP4mrei0fe0I8A3vWg8RDsjgsIbg64432kPbTW7
	shPpFV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsJi-0000000AJXU-0fES;
	Wed, 15 Jan 2025 01:35:34 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsBL-0000000AHu2-0SPn;
	Wed, 15 Jan 2025 01:26:57 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-46b1d40ac6bso3507761cf.0;
        Tue, 14 Jan 2025 17:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904414; x=1737509214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFMwJAaeoRNdQ7wFB7oOxwf1IaEkyF3Nv5JGSL6B9MU=;
        b=T7Wj2di/aPMiUmP4bdgIr92du6aqk0fMOm7N6XsaUM/tSFb4tfe/WQm8vs8zWW8rvY
         dtrf8Io6u0Z6sr33BtvrSAPYOL3iXSXbDC5z8TDwd+LJvFfuKQSaee0CyE4v7p80K2r6
         Ds+xMOFfG46MP1zAXkZGth5oYIrOObnKrvpzhQU7nLgAJIx3vKjqQEVfda6q9GU6ClVO
         HrAP+iptsWT/d5weoPDVNitjZ0YdCI/Z0j6lkWz7gkgfaMyL/FG6Xq8hzhUCr/nuUYvy
         R2lwxNgubFTnmNeGjD2mtfgN62Gs4sZdcxq2CKAJph+Sh0e8SKq5xLXITEedpXd9OaQn
         uhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904414; x=1737509214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFMwJAaeoRNdQ7wFB7oOxwf1IaEkyF3Nv5JGSL6B9MU=;
        b=r1DbBu6YcosncQZfWZXL0qXkFJwapXHcqwERBTTVJa8nmXSqSmfEPkScwXNe/8p2pR
         vQt/duly5Kqk3pwNtmErMhq/OrLOrGcyqxrOw0dzN/MKniE/W7kOOsnyF+No2D2FkRx6
         0wTG0/c1SdKGbOMWTD8PNe1VZ7GsJ4TnsPl/DZ/tnv7SrjxWmNO/2SMGxfKrTlOm4Si6
         VFzPw+52KtkujjcfhoTE+XXi6LAwyhpVvbZDfe2H08pilqhs4C2m5UahdqV9LofiPwIC
         Hcx2yR/d3Co0jbgG2VRVcNkXgkUCT6elFtTDxurF8hVC3fY+hp0/TLZOuR3d75wRGdf9
         yL/g==
X-Forwarded-Encrypted: i=1; AJvYcCUGa8gpc88XE4G4G8oM22uVrFG9TuE/k335CXBBgIU/D4rorRNCncOH51PWQFyzeZspVG9GeM0DM+pN7On+76c=@lists.infradead.org, AJvYcCUdLb1kjniMkDwlj2gAgdp5Gzn32/DcsXTzEZ5+2Y27iiq7gkoxpqHqDsRbn1RFp+TpzbwH43JXk7E288pGCTr/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXfNUt7zngDs8/ynKWSjLTqOZ3RzyU0LfrKKjbbuh/dk9UDjV1
	41gLr3MkTqkoiaFi+BcNwWdPy22HKqi9p5/1Epb/hS/bMDsUwHgE
X-Gm-Gg: ASbGncsjU2R7ppOsHbKkCe/MTN/XG5Bkiupfj1jeQJzMAJo5DAIuNHlKZVFW9kQb+gk
	3BdjO22ZeEc2gN2ba9awKYGIV8wkNFPMjsyWug+CDml0y//N8RwlMcWGzbYRVP76RJ2MW5lHTIh
	r8qJUfkziTvv31aTR4jSfbjDEBiI110SjqHInIJ1s4j+DcFHSK6510DXv5DjPe5eQHI31OttXWN
	ZG+Lo3igBNjUpe0yZr5cjTNPdDAk/naP8UQMufWAAbV3XlBPi2wxVTq3FFZtUIOYWMw
X-Google-Smtp-Source: AGHT+IFbToSOgBgyFlAAQb6WU2ckT5CIGlBK7iJrhnVXB8ROQS2yvhyIzkDE/m/9jLZTkhccFjgHlg==
X-Received: by 2002:a05:622a:344:b0:467:6654:3dda with SMTP id d75a77b69052e-46df56ad2d9mr20388131cf.12.1736904413930;
        Tue, 14 Jan 2025 17:26:53 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:52 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Trevor Woerner <twoerner@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 6/6] arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards
Date: Wed, 15 Jan 2025 01:26:27 +0000
Message-Id: <20250115012628.1035928-7-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172655_145634_159BEB3F 
X-CRM114-Status: GOOD (  10.07  )
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

Enable the new usb3 phy nodes on the remaining rk3328 boards. This is
done separately from the rk3328-roc boards due to lack of testing, in
case of regressions.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi   | 12 ++++++++++++
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi   | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts    | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts       | 12 ++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
index 1715d311e1f2..a4d880725a96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
@@ -385,6 +385,18 @@ rtl8153: device@2 {
 	};
 };
 
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
index 82021ffb0a49..f70d28e6da5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
@@ -349,6 +349,18 @@ rtl8153: device@2 {
 	};
 };
 
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
index 425de197ddb8..4ce6b16cf291 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
@@ -440,6 +440,18 @@ &usbdrd3 {
 	status = "okay";
 };
 
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 745d3e996418..2e366de96390 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -379,6 +379,18 @@ &usbdrd3 {
 	status = "okay";
 };
 
+&usb3phy {
+	status = "okay";
+};
+
+&usb3phy_utmi {
+	status = "okay";
+};
+
+&usb3phy_pipe {
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
-- 
2.39.5


