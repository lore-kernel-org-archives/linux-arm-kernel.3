Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B1D1038E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2I/3Lu6OBvOC4tuDnDafL3hhaN2i1Q4Fcz+C2/JdxM=; b=Jv4fS8RYulmTVwZEpTeUNLs8cP
	6C57etDEbgSGg4yK+62VpjFwVeqtwjR9WG03Vm/U83DQNNeiKcdwk5gfdqrSjlCnFM9qUFtDw06uq
	wOWa4x6VE8oZSBpt3wowATmBHkpgYftKSVF6o+wDv+2tYmVOr9k07II+qWQJmKYrmaIOgpov+vOo2
	egvwpwYH7jo6tw8pozC/oEm3S8mZiC6cgHBE2JGPGq3nWHFo7itKQkVjktSO4VVND7HQLq+arYXk7
	yVXGBwvWrMKyHmSYfN8JSx8gFGh3Cd8jzFbi4aTL4PN3QESjV0dv1Q1J7D78ct083wjAhWhcyIwg8
	BloQ2weA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48tp-00000002990-1xSp;
	Fri, 25 Oct 2024 01:13:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48pU-000000028LF-2Q5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:09:30 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7163489149eso1039168a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 18:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818567; x=1730423367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2I/3Lu6OBvOC4tuDnDafL3hhaN2i1Q4Fcz+C2/JdxM=;
        b=ScQh8chL5TWuDSwjj3TNCWz/lo6oWQbE73qCAYiiZI6jUBHFFEshu+d1Bx6JeEEVOv
         Artx7y2OhYDzRpr5ZyCvc1dxbVbSZmxEYTCNvCEM7fU2jE4J8HLzM8D+KPrYp4tIen9k
         LWNnLPlwOybKMp0oIFrKug3fzDr4pkWMCSz3iVff4CFiUrv9B+PhrUGBKvqA45+xYWlD
         c3AKwbHlT5Ll8kMqCAPeRUJnd4xPwiBYjmzx03ZzxqNN6bmY0dYC468PtPLK+9tsdvE/
         QtsAd42e1Hx14QmgozD9jFwZOgqvyM6fV8TV/U/xdT2O03W8sAOF7TLEFHj39ltimzHI
         oUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818567; x=1730423367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2I/3Lu6OBvOC4tuDnDafL3hhaN2i1Q4Fcz+C2/JdxM=;
        b=h3EWKxZkkCPcAxEk0bcUOfQ3d/y9QAZcUHKoAl2JECHWbXzpMRh6WNpJJ0rrVz5ES1
         h0FBQnpm1YxIYR2CKWV/+ISiAWOAX5U9oFT+Rc/xuicw3741j6a1gp0/mBICE5w8imyP
         Drac0udnm6msNuFOhi4R4Y6mXHGyD0VtiZn0XKbRHyaJHklz7fjZ/ONe9FhJkCbsnzHK
         R6yrMOgqkUDv0Uv/c1TFx9HX79hWXbtc1BiPdYkRs2tKGWunv1wM7oOxYyghOjGHMhaf
         j2FA7SkEBSHki4ZuiCZy1lsGrdhVYnv4hOijKVwDk5aaUI8vmmbOcGT53Sm0JesUc0gV
         GWng==
X-Forwarded-Encrypted: i=1; AJvYcCWmAiL5jxX1ZoMGKdTcHh3lIzay9LfygoC5McagFeMnVuxj+rIiurO71o0hHbrKEbuejVQpV2anpxVPHQoe4rzu@lists.infradead.org
X-Gm-Message-State: AOJu0YzMi9sWQNy3YC7mIzd6QejZdhYldpvHBPtuHoU2NScR7h3/Vv9G
	6WDPl4KVPI+xR/xHBp/4pF5ueTDlX9I67EGy14wrf6px51y6/vA0lvKLNQ==
X-Google-Smtp-Source: AGHT+IG0dZYus0dKlZXhILQCNo4QWnAtvU9O1prTfWjP1IqAIAetcVP41UgZHVHhX+1lDBk4WUiuGA==
X-Received: by 2002:a05:6a20:c997:b0:1d9:1dcd:b22c with SMTP id adf61e73a8af0-1d978bd014amr9387766637.47.1729818567100;
        Thu, 24 Oct 2024 18:09:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ARM: dts: imx6sx: Fix tempmon description
Date: Thu, 24 Oct 2024 22:08:54 -0300
Message-Id: <20241025010855.1593365-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025010855.1593365-1-festevam@gmail.com>
References: <20241025010855.1593365-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_180928_637669_73BFEC1C 
X-CRM114-Status: GOOD (  11.28  )
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

From: Fabio Estevam <festevam@denx.de>

According to imx-thermal.yaml, the valid compatible string
for i.MX6SX is just: compatible = "fsl,imx6sx-tempmon".

Also pass #thermal-sensor-cells = <0> as it is a required property.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..a4abaee771eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -715,13 +715,14 @@ reg_soc: regulator-vddsoc {
 				};
 
 				tempmon: tempmon {
-					compatible = "fsl,imx6sx-tempmon", "fsl,imx6q-tempmon";
+					compatible = "fsl,imx6sx-tempmon";
 					interrupt-parent = <&gpc>;
 					interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 					fsl,tempmon = <&anatop>;
 					nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
 					nvmem-cell-names = "calib", "temp_grade";
 					clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+					#thermal-sensor-cells = <0>;
 				};
 			};
 
-- 
2.34.1


