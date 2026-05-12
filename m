Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BB0CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=; b=M1NE/D39D28m1nbGluvYVwlHy1
	YI15Fvr/FedTEcG0Ig5CKdAtoxyR1Hy2tvuDJXo7Eu0LYV/PtlXzrFbmKM7d5b8e0S8jdBdpr9ipg
	RLjOKhnriyJg4SsUUX1xbAsIbVz6PYPRW3vvOE3nK0zxKiNkzUx2skUsoeza4tyG7H7Vvhf9NcrNI
	QUkpPOViZEGMmL9q5lIaPrlmOR1IFm/mKrYw1R/pzWBvMNX2uMBi1MPTT2a7ylX9psE95BTRPseAt
	apzblAj8US0UGi4hHFZRjec3iV7AfJdHrhu/KyIYpReCu5OrQIPMGADQogy1wqfDAsr23zOCc+Ehr
	8cYhcR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFn-000000000A5-2x61;
	Tue, 12 May 2026 17:50:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFm-0000000008x-045P
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 17:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=; b=CosqVMxj/nt3ZmEXZwD54uJs7F
	RGWwiKtvCZXyERWycGzMpracBheN2kA6H8lJUOkusR/UqTbva4axM9w9IAARyEbjSwYuSoYJ/28qw
	BTy5egiUEnwbez+bzw1z7VQ1Pn4/kT285VYDjrEz9RSqy5V+7MYuXPM+eY32FtQFFdzGMmF2w+6Dk
	bwnU4QXGK/62i39juKSg+sOgVMRTDJZRkp9wSwUkSNN9MNISFVny3do1ZR/rAmVckAe88NHydd7QN
	EiN1V3gjrnpZIdKKAJcdfeLprcV1Q1JPFkJz6/uXiZBw2zOmFImasFRzd7SOUSu+dJAiER6utxV/0
	ysQ+9dUA==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMrFi-0000000FXzS-3NGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:50:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c70c112cb61so4526338a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608240; x=1779213040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=;
        b=mA+pd0+m8wP+ppDhrh8HG40/FLX40a4Ij6W8XGdsfFiC1i0KwwWqzOv1zWEJj84+pq
         s9saxWyQq+AjpFVONmNVUFfxunl3ujHRQYxE9S4RePOZrWu73FwThNy2e28Z51kj+/2L
         /KTtCGcgdPm8/8H1R+g4k3qEN78QzS+mhfbnaU+LdnwDmtj/kmcJ/3mCr6aGuFE1G/4o
         SlIok8PNuBXDrcS7iCl4Mg1mQQLtlkTCIcSvo5NxYvuxmbvANwe/r21Abcez0k1KGqsL
         gbp+RIBfg4k54xIFV0+efwqPbKv5urmau4s+endR2NUuBMy9Hq7uuZOkj+D66uIDAedL
         XY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608240; x=1779213040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=;
        b=oyLq9Nt/3DQZ/FWhjDg8lwAHnj8d7fhZUGGwOfzrkxOq1Brobq7MHmu6mY2haWxgMK
         sLYDAm0uaoKZNRfx2bbLRX16vMTPoUXu8Fov/KZbk9dLaNIkTpj1IK9aAiNilZSqNI6U
         0JVPYQB3fo0lXRLgB2ESTJ6liM5k1F/c/HYxkurV4uZfFdoJ9bf525xyhgTYcMldyemq
         870gUEIbssZnWB9x+G1O7m8c82mebZWKghuEXhEaN6fNToVRDpD/27N0EeUvuuAP45Ou
         iixlJVDkSl7zX68ri9Nf2UZrPEmCr3HZhYasFnGnhQIZEPBqL/BAJQ+TmL7zZTHKIot2
         PRuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OrcrwNo6Ot54r1vJ6OgQCR4wjoT5vUopbwJG8tsAlbMdXtim1IFS3gR1598EC5Fzl7OG7p9zef1BlFu+tWKGY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8hZWKP0UeQE+rb22ID5KAqIbITwfKp+M4Q80FSJAkMvfoV9Mf
	A+iZSWrbxYGjal9JeZBKqf8YRwyaFJQTgzGWwcPnNmcyYqVV7Bx6NWps
X-Gm-Gg: Acq92OFvBTHMNl19xzRhLQQcrU5+C3zJBDW+CTuaYx3EjJfVznrXL6/QBQinPNlNXUa
	sEkfvATA0TA4uHqnD8SWU+/5Qy361dZlNxwgAD+8mtGvjChr2irEDwzCJc2vJEbdt2sFMByMojR
	F48cOqt5wanEIIxUy3/2DEVSZbnMyz7+9xNPmo33K28S1kop4RP6vDuW5bGWZAWbEovbzWqibK8
	WG2AHTF0+/JuF3mlnxJfOmwq78QRnFavytvI9ANirVhPMrLekZmm7/ieiMZidF/A3+p3zSy59Cj
	DSQxyLe81uWlJJLlGMoI3/ZyJ2okDYMNfnOaZyyYLkp4WVwMm3cxrwxG7D7cwojL9x9edZ6JXe3
	Sq+np1BuuEAY2y1saZ6WMWDlyG1omzGxoRX4xJ4ufv/Kos/kD1XrhCsR0Kydi86TGGVrCKB4iWi
	NJaZDm0Tr3ZohYIcAW1vubkOQRATJZIN9SLi2HU3KP
X-Received: by 2002:a05:6a20:748a:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3aa5ab66e31mr33083918637.38.1778608240549;
        Tue, 12 May 2026 10:50:40 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:40 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 12 May 2026 23:20:19 +0530
Message-ID: <20260512175019.47548-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_185043_240978_893C941D 
X-CRM114-Status: GOOD (  14.26  )
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

Add initial device tree support for the ASRock Rack B650D4U BMC.
The B650D4U is a server motherboard utilizing the ASPEED AST2600
SoC for management.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b..124d4f8f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..d0b9c1e1f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h> // Recommended for GPIO mapping
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* SPI Flash Management */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+	};
+};
+
+/* Dedicated Management LAN */
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* I2C Bus for FRU/EEPROM Storage */
+&i2c7 {
+	status = "okay";
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3


