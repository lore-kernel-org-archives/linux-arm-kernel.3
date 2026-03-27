Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCBF10BA458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=; b=Fc9s5IAMi9klao1kwECH4pIt6F
	aAKU8yIvTCy3Ep8glnj2CH0THx9EzYzzkz1Stlfaufk11ySm5vGVN8tYW/Jkzey+X30eCC4Ygx7+O
	vecPGB44CejO0N3ENSu9u5J5cSve12U2E12Bv59V4qEHWhtZZmTznc1hl+x/w86OdlPIdwdjBTQVx
	esBIfzrw6APxw4zv1NhJXgAQzVHiKlBxaADZwxwxLZvxoD6SM916Eg3H2WTETDNs4R+zc2j8sedLK
	t+Z9lXlzkVtxZ33TV3c6iGNKfTY9lpq7SzItL2rhSGKKk9yq13LtpfukfwxxrWWe6WNYRVXGgulxw
	ByVs/iDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Ed-0000000733A-2TGf;
	Fri, 27 Mar 2026 09:12:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Ec-0000000732i-2hVL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=; b=Yj1Ia3WDc6fSui5YSf/T8L74Cn
	zX+bqzJRggV6x/EaF0bjz3zKrbXHnxylP02gke+G4WNzJHWGNkGnL27vk8dARxeCi5IKbkp5jHC02
	6rJnOdvah/95AyM8Yq8VeG2WufGlp5ejaFd6HwQsnrTVxdUbERYcWZWOgL1akJ6EJL1sp29RIyxPw
	Twd8ZqswUx22/Rj6YfNGJ4wc1W9/c1RkHWcwQ4njjHeKZyRubAhPsYSZnLPBgFx4cZRh89Uj/C4iQ
	T8L4avFee30SqOG2n9d7uoXoU4P+x4rxlB0lCJJSZRBO7fdQVmeP8CvZ1c0CGWBoORjAFjEOgz2lE
	WfNqU6Mg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63EZ-0000000A2lx-1R32
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:12:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-439c6fc2910so1237998f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602721; x=1775207521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=;
        b=dwTyD/Li0vHNCFXL17dh1qQkESHe3jJNHIsyVt+cqPK09Xo6jj/W2L5Chj0TOpS1Oq
         P6jcOGFs4Z5TS1QFwojfS2Ih90r84jj/h9R7uudUkc7WwieVgU8kDs/xBA7lwmli3JYC
         LDHVhQ2iY5RsF35CYQOxD/WvfbgOPYFBVqiFQ3NFTKy7ibyKngqSUv5CCaPiEIvSd+eF
         9hOXmxEyaq01WprW5sy5NYg0PSgkKM/6ax0dP7EGn5+CMrSD+mB6Ah6H6c+3+k/+VFFq
         yY19EbeN66BynOUqN+iQsOkZj0v/IGKOX8w5m3L589359iXqmReL5uocwYjAHit9RIL3
         jdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602721; x=1775207521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=;
        b=K6iYF9opr57y3BRQiW22e5kp4lQcAThbmEphcsu8XAtDmzL7aQHQWidUU8QE+bEU/R
         wRwCaxJsiPN502/uJP9f9NGPsrw/ycfnAXNyRjAb715NXWz0NZ/PYpCcA5eZXFpmFa3Z
         ZFDVVYFcNAlcFqS39Q6ietK4LkFHIu8X4riYhNFPDBdi9nWOpChNwJWBoji/4Fz0iHds
         /adVinUcysujeuX73aJy3O0vGskYTqoV93wcorf0kLpiKdTAUmuk8OOAtq/7GJ4KB0CF
         kQEdM4JbgNOd+LQ/93H1Tf6RK7dh+Z+RNtQhRhfZSiL/5ApwNzQpPkXhH4oPzXqk1Uvt
         Kaag==
X-Forwarded-Encrypted: i=1; AJvYcCUdvDV3oJrWV3o9+hZ4MS5+hYccV4EiXtpa/pNnIum22vHvwmpeWK8AaBiSyl/XviK9N9cNy+YlfgXMGtSHuMzt@lists.infradead.org
X-Gm-Message-State: AOJu0YwQZCsIxCrnTp53bbLbxhn1nw20nr+UNBwD8sZktP3jAEjVXECB
	Ttm5oBzGQzkVpQLdOYkYw9FdfAkCanaWTIqJeVTU9rYNXWGhl/yNSBlB
X-Gm-Gg: ATEYQzzY1FgCRDuA7XfaMGj4yst6g9Wo6n3FJIc4aZZ6kCKB4r5S1s5Q6bG1QlhhC5N
	BWzMtBY0cCaiPy0fx1tBFD7iQCD7ca3Rmu/ucJ4HiBJ5/zJ6mHa+sOrB7gl7aipjMVrwkIGz8bt
	86aaui5Uysn9I+7n7F4PFTjvklyW6UPEaOc/nXdkoHmYLD2FSQkjjINHw2i41QvQfZbos251fQY
	5a+xkiYb0fk2T7RfhN8EqIuCTk+0+xpVinbqcJgWIpKn+2fkLm84IzHd5/oy0DnCBRKsrSUCcp9
	IBfnF69T6rpqW1wzneANZ2jUEStEc/s6N2s7tcJdHeNPR2WbDW43/EnAJq1jNpUgPcJPtBxeLeQ
	i3o0tXvrh4qWY9y6AmFwtZ0jzkwTSrCeCZTcwnWQ+ccvlVLKieokq8aPjFR2Jr9aV/aNDq15iPp
	trmkoFktqgKn6KAHOvDb19nNBkx8n3rbINd4m6trY=
X-Received: by 2002:a05:6000:2dc3:b0:43b:4489:d456 with SMTP id ffacd0b85a97d-43b9ea10799mr2329230f8f.47.1774602721312;
        Fri, 27 Mar 2026 02:12:01 -0700 (PDT)
Received: from rock-3b.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm14001409f8f.17.2026.03.27.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:12:00 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v6] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
Date: Fri, 27 Mar 2026 10:11:28 +0100
Message-Id: <20260327091128.2458-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_091203_469218_795F0C71 
X-CRM114-Status: GOOD (  14.74  )
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

From: Midgy BALON <midgy971@gmail.com>

The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
This chip is currently modeled only as a fixed regulator
(vcc3v3_pi6c_03), with no clock output representation.

The PI6C20100 is a clock generator, not a power supply. Model it
properly as a gated-fixed-clock, following the pattern established
for the Rock 5 ITX and other boards with similar PCIe clock buffer
chips.

The gated-fixed-clock node references the regulator as its vdd-supply,
allowing the regulator to be enabled on demand. Remove the
regulator-always-on and regulator-boot-on properties from vcc3v3_pi6c_03
since the clock framework will manage the regulator lifecycle via
vdd-supply. The pcie3x2 node is updated to include the pipe and
reference clocks, matching the approach used in rk3588-rock-5-itx.dts.

Assisted-by: Claude:claude-3-opus
Signed-off-by: Midgy BALON <midgy971@gmail.com>
---

Changes since v5:
 - Drop "(100MHz)" from clock node comment, already in clock-frequency (Jonas)
 - Drop redundant comment before vcc3v3_pi6c_03 (Jonas)
 - Remove regulator-always-on and regulator-boot-on from vcc3v3_pi6c_03 (Jonas)
 - Drop Reviewed-by (patch has functional changes since v3 review)

Changes since v4:
 - Fix From: line to match Signed-off-by (Heiko)

Changes since v3 [1]:
 - Add Reviewed-by from Shawn Lin

Changes since v2 [2]:
 - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)
 - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
   override (Shawn, referencing David's patch [3])

Changes since v1 [4]:
 - Drop phy-supply approach entirely (Jonas, Shawn)
 - Model PI6C20100 as gated-fixed-clock instead
 - Wire reference clock to pcie3x2 controller
 - Follow pattern from rk3588-rock-5-itx.dts

[1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
[2] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
[3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
[4] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971@gmail.com/

 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfa..d7d85b090 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -56,7 +56,15 @@ led-0 {
 		};
 	};

-	/* pi6c pcie clock generator */
+	/* PI6C20100 PCIe reference clock buffer */
+	pcie30_refclk: pcie-clock-generator {
+		compatible = "gated-fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "pcie30_refclk";
+		vdd-supply = <&vcc3v3_pi6c_03>;
+	};
+
 	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -64,8 +72,6 @@ vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwren_h>;
 		regulator-name = "vcc3v3_pi6c_03";
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <10000>;
@@ -545,6 +551,14 @@ &pcie30phy {
 };

 &pcie3x2 {
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,
+		 <&pcie30_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie30x2m1_pins>;
 	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
--
2.30.2


