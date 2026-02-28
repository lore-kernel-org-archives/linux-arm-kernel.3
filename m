Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775EC1048927
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 01:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ypXMFVhzt8vhHA0jPR3q8crLwJ28xwCmkdh+GFTjYb0=; b=UnCjKAkAchhL8pkUu7mxcSKoAc
	a/9OLQpVES0tAU9JwCvGulbc8tbpPiwtXvSDveDKZRqriVcEl+jNBApd+PfSHb8BnfONcVLfQp1Ud
	cWs8Lyo8UJk5T3HGyg5twCvDZEBcor7Ep23RasB18Yg3UelJxG+3VltR6SVdXKega3vY8cnwr8ta2
	2XqdckV6F2ota7v09nTjymNSZIjnisLx0qrU/9KGeW5NmRrC94iXQJFQlx0iiWH0GjiyW+kDUVdBz
	LDRnWLDx4QZqGVmIMbjRjbugboHj+/LPhYZz1M6C1tRYw5VMHZl73fawepKtjXS/0Gz6Tcs3uBts0
	im44C93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Cg-00000009OUc-0l3c;
	Sat, 28 Feb 2026 01:33:10 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw9Ce-00000009OTv-04JL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 01:33:09 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-56a91535e5bso1021978e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 17:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772242386; x=1772847186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypXMFVhzt8vhHA0jPR3q8crLwJ28xwCmkdh+GFTjYb0=;
        b=ZI3MIlIiQfCNgv93iou30TYCshej//yYkDu1YIRTAFOKFp8mMIFdWTgIBdkoMEewHv
         Cbyb5/9meKy8Fay7qI16dqWvSbaQStu9YoLJ8dZBWmwbVOs2MLO0jW9ef14Ya2AXWSms
         bT1Ly/MkJbrZM68HGL/NBeVTocMJ1co5vX4fQbTQz2UU8rTW1RZU+cdtD/snUw7cxOIH
         k2+V7jytXnH3SMgDzPWef0T6mBbuBiR3aLFlU/Uprhp6iViYT1nO8zO5GvAJ+NG+V2Cb
         49HXwNXfR+ZMoS8fI3GYPzDK/ckhatxSNVwpu/gw+U7GNg2f/YxmVZD4kxQJRdIgdpE3
         MHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772242386; x=1772847186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypXMFVhzt8vhHA0jPR3q8crLwJ28xwCmkdh+GFTjYb0=;
        b=EwBFH2f+DrXQiMNWSJeg2VHvJM8sLReP/5HppRs80FTewFailzE4f5q96dqbzmReX6
         75HWlprrmkE/gLDOFnr2tgDmoj/03h23UYSMyty2uhrOS8KXoLuRkAna5JhzMV/3TCEy
         /RG6f1p6js2BacYycNMFWKgjfLoRj/uSm7dxLAGEImgjRTp3G03+6GsdbAEjNhu/R6pj
         HBYEpqMe/vm7tXyA3PGL/lg/MrDpEL1IwL5dgba/mhWy0N/XZXTY/foM2uIpYdcW00J9
         ctFVuXUGb9hn5+xX5lvsdIjxP02/GxNZuAFXlShR39w6e2TeFHxgCCdXBvr/SbfBy3qH
         dGjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3DVUnzCHy0kTTeHhqrBjcvArIP8aqG79DPGDiifs3rFLz9pahuXUxnVz2RgLmqaTJJdQVZur5mSawzJXN8ahw@lists.infradead.org
X-Gm-Message-State: AOJu0YzfPlN3qpY0KHOpMAT3a9DLg4OCin8CYJ2MaI98gyWRWDdZXppK
	/41nCch8vgJoqgFCdq4X4nLeCkQHfCntHBQbXv/A3zgnkaA6uZq0bTev
X-Gm-Gg: ATEYQzzeDnM1H3j0EXbVgDdGgJjakdgd97VsfNqVgygoPNoEOLO8mIrWI8Cea7OMupa
	HTp3TCR+qXmLxzr34JRDJjf9xaomVOnLLGte4HXim4xdeS8o8P071Gf65gqSBs+GRnDQqeR1H9X
	yfgKLRp5OnDdDClNwa2YzEL7qEfDr7yb7k//zk06/UIDbnZ6PPG0VZb9pzsUURSW7Sb7fACkful
	nW8/Esar5aogXQAJGquzeUeu81IbHZMRVOvoLSSFzZ+1Ki3ka3XQRLKa4OgfZQ6JIuRkiyJlmSj
	NbwN66SO70sRFmoI3xpSbXO8eXnoMvTEtCcPEezHAxXEr9xZcKfgpFq7euK7DcH5RMuCeDhrr2g
	HJiJTjXty+sXEJoR92J7xaVreyn4usxh1kg5TU/MBqrCI3KCqCx811JVBl43hsg8sRkN+XbnlPO
	mnr022c1c9tRmKIhEYRX+vBGb4LitNumS6zjXAHs0tFM/LtnU+pHSKrltgvHHvFZEbIWcf
X-Received: by 2002:a05:6122:e145:b0:563:702b:e2a7 with SMTP id 71dfb90a1353d-56aa0ab1c3bmr2230694e0c.19.1772242386359;
        Fri, 27 Feb 2026 17:33:06 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:2e2b:437e:ccf6:b644])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7a8sm8950597e0c.4.2026.02.27.17.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:33:05 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to ethernet-phy node
Date: Fri, 27 Feb 2026 22:32:56 -0300
Message-Id: <20260228013257.256973-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_173308_076297_93228DF4 
X-CRM114-Status: GOOD (  12.71  )
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

According to rockchip,emac.yaml, 'phy-reset-duration' and 'phy-reset-gpios'
are not valid properties.

Use the valid 'reset-gpios' and 'reset-assert-us' properties under
the etherne-phy node.

This fixes the following dt-schema warning:

Unevaluated properties are not allowed ('phy-reset-duration',
'phy-reset-gpios' were unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3036-evb.dts   | 4 ++--
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036-evb.dts b/arch/arm/boot/dts/rockchip/rk3036-evb.dts
index becdc0b664bf..c8100dc4c7ce 100644
--- a/arch/arm/boot/dts/rockchip/rk3036-evb.dts
+++ b/arch/arm/boot/dts/rockchip/rk3036-evb.dts
@@ -16,8 +16,6 @@ memory@60000000 {
 
 &emac {
 	phy = <&phy0>;
-	phy-reset-duration = <10>; /* millisecond */
-	phy-reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_xfer>, <&emac_mdio>;
 	status = "okay";
@@ -28,6 +26,8 @@ mdio {
 
 		phy0: ethernet-phy@0 {
 			reg = <0>;
+			reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
index ae2f84a4e922..bc6e6468fcc4 100644
--- a/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rockchip/rk3036-kylin.dts
@@ -102,8 +102,6 @@ &acodec {
 
 &emac {
 	phy = <&phy0>;
-	phy-reset-duration = <10>; /* millisecond */
-	phy-reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>; /* PHY_RST */
 	pinctrl-names = "default";
 	pinctrl-0 = <&emac_xfer>, <&emac_mdio>;
 	status = "okay";
@@ -114,6 +112,8 @@ mdio {
 
 		phy0: ethernet-phy@0 {
 			reg = <0>;
+			reset-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
 		};
 	};
 };
-- 
2.34.1


