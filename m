Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A3FFC5902
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YO7JbDBqxD4DBw7ty3YGZqtipo2bF2AYeLLxY9iiX8=; b=mwcgTkzMtvSPfE63M9H38AhBZQ
	8UeJy8qrgPdPci0TQBNpLDGOMrMMN/h6bjxKz6vsjEZU532qgBhS9S0qUHn+N2K15xGtwfQS7/g+V
	Yeb3UIe1Lff3US7zLmbYTgYiMTcBaHubaQC70ubRiWwYCiWQk78YkEnPm9lCI2r+EIF08y9r6TK+2
	BvY8asL/FS386oQdOFaiI3lUCxxQXieLVaWqpO3honohwZxpPeaotNKpqUvQBZPIIpgCZqDEW3hRr
	pGlpde0FDD+OYlq1g/1uMpbtKWcyLsk3kbHhf3IJ31iWZ2rKjuR9wq4KtGYz7kqKvE2soozO6uOO2
	fRhUgmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfj-00000006NAP-41D9;
	Thu, 26 Feb 2026 14:48:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfg-00000006N73-3BQ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:48:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so10692255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117335; x=1772722135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YO7JbDBqxD4DBw7ty3YGZqtipo2bF2AYeLLxY9iiX8=;
        b=eJs6ZA8tdPdwlzfIaE8+qs6UNyPMNyNrDeSmCZTDCAPN78LUZduS+ctV+l883IqS9A
         eVR9plZRUpd/MAPTv/pxfzcATjtCraEQ8Od0Oo8bDTdCYui0KCWmYRCFloL9jBRUKcTD
         7v7c3epvEcWdGmDSk6oMdyuHyGSmJT4tJzabslMHkcV0WfYjBYJklJy+v8T/MsT9XEMJ
         7snlQjyAwpwsVcFaF9bSqBD02XENz0aM3WHpCQZ22rt1fXC60u2WtFWMp5lIZOdsc6+X
         gmY4ul4MvS1E0l4Rcf4J6HmnJyoEA3ZGfjMN13FLsbmXIINbBuCyp4JjdgEqXahE87To
         DEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117335; x=1772722135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5YO7JbDBqxD4DBw7ty3YGZqtipo2bF2AYeLLxY9iiX8=;
        b=rpgxsOIA8dlPBqklv8IVQy9BYUubJ6S1Zb/Q44gF6dyWHp75qmK5MpWd/ipMNdWdQk
         kK9m4iWj63VC34PkLQMvKN0//CEvnrGKQED3ONC7fzWxP2wYQgfGXmMdAh4wP/A81V+E
         ElBaqm2X5No/9+MIgodj6LxZG5NS39+FCAtSTPRp64P7kIrMLTw49we+9nJijxDD1oq5
         oduP5RTP4RrURbYRwcvDRmJfAsDi2mTCMX7s65ne/4S3y44Q5hkyNDi6s7u7pyXmGRS7
         NWWVegDLZ1gFvAc/3FfV4qkqrtORXB6ctWpSar4P4EEtjP01aQttoNKo6hPF9BDWF4cc
         kM5A==
X-Forwarded-Encrypted: i=1; AJvYcCUOozVPd5812C5KhuxZp9tOUELYlnmVsGQFqNrwNZx/bxH1Yp1FYG3ZqNCrTaCwXBUcny03zL3FK9qkN6+YD+T2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz15LlzIMaItb4hUtK7b7UyGO/ulIcLz1gHnMAabVmRP3YkTZp6
	fgm4nRIC7jm0mNa3641Vnlm08lr3aoKM0qoIUHZiZXh5ZE2faNMmzGsY
X-Gm-Gg: ATEYQzzhkSVbXfF73+iFoOzlfOhn/9SZpl0tw2dB0bB07/DF5q+fVmrpBoeQVYX8asd
	QXyDrV3uVPb3wZHTnPRL0i60mImtfp3Qv2JRVJJ2nt8PtSY5UVtgvGpaN/YYO1sGAXL3T2VOapA
	6AUOco5QlyynOXvQjo3JrEk6RbQL/YgNZQ//2Z/dNb9fGl2OZ5Rlbq0x8uvSd/1hNyyCrGl/sn0
	j7u6RDi9wqF1KM6EMRhao/YWFoqKNB80+/QVWNTheBanisCGDos7tknSk6qMj2GqME/hu3/Ammu
	hhA1f7HxerzdsJ2NquyRfpTVj02cOzcPaT8b92/n+28+ZHGVqP19vArm/pIT/3l7uqels/B4fJf
	2k4Ygozi5DmWqdxUe+exAoDBWl/H10c8Cv/736SRbwpFYzKAfQBcZr8BBW0Wx4PQfsyUqb0RtA4
	Nne4F1q81cD8rzgyulAGx1xGBbs4RhBIQqcibrx9SUtjG6G/x+Z1mIR0GJga1HH7hSYsLaHjyFQ
	HvIaPo=
X-Received: by 2002:a05:600c:a16:b0:483:7783:5363 with SMTP id 5b1f17b1804b1-483c3deb544mr34230505e9.26.1772117334537;
        Thu, 26 Feb 2026 06:48:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4766:6506:d16b:e2d5:7fdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm91497075e9.3.2026.02.26.06.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:54 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] ARM: dts: rockchip: rk3288-veyron: Fix the Bluetooth node name
Date: Thu, 26 Feb 2026 11:48:42 -0300
Message-Id: <20260226144842.2727107-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226144842.2727107-1-festevam@gmail.com>
References: <20260226144842.2727107-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064856_815313_84DD777C 
X-CRM114-Status: GOOD (  13.23  )
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

Node names should be generic, so use 'bluetooth' as the node name.

This fixes the following dt-schema warning:

'btmrvl@2' does not match '^bluetooth(@.*)?$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
index 6a0844e16279..26817848c154 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
@@ -177,7 +177,7 @@ &sdio0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupt-parent = <&gpio4>;
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
index 0d4c50e05558..cba2898f8b7d 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
@@ -48,7 +48,7 @@ &sdio0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupt-parent = <&gpio4>;
-- 
2.34.1


