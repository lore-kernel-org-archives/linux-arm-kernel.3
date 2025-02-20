Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D59C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 04:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0Jk5DjPf8kGEkzOhcTQC9chMDKvl9vyAtJcg2idJsM=; b=JqsIEWwolUKRvCzjrb+H6BXCcu
	EyoZKNpoyCtu+9aaTD7APGBzOIle6rGF8K+e/QvLVFsZRtDiGIoz57UN3Mz/sHO3NMsiwr9CEzy1P
	LU3QyiEqLg5nUvHV8tIVQOBr4pFWyLwL1gudvHHN4XpI+f7X2U6ThDCfQG93h8VokhBBgAJU5q0Io
	McPELqWR2cVqrvmX2meVRxTeKAq3otl77piS/sWjYyIxUFZ9w3Cmj8KjKrDdzagdi25Yr/w4VaF8v
	6wnS5GJkLUZtuCOtoebddMf2m/XFe7LQHhRxbrMi+TDwq5hifWtNq/j6S01fWHYUjqe0frdA/sh3j
	yY4sy/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxzf-0000000Ggf6-3Lq0;
	Thu, 20 Feb 2025 04:16:59 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxtx-0000000Gfvr-3Ao8;
	Thu, 20 Feb 2025 04:11:06 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7273b01fe35so312293a34.2;
        Wed, 19 Feb 2025 20:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024665; x=1740629465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0Jk5DjPf8kGEkzOhcTQC9chMDKvl9vyAtJcg2idJsM=;
        b=fF51RLnSruOJKghsXP9pVbV4mFrT9J/pF8kY1DMqmk2MUmf/1F7nQjCjcTzewvqoDw
         qRQXZxfKregXtQfwr7ydCBKT8n6RhHo1s61ZeIXKKcn0fXmRSTLclBT+2cbaPfXJV5VX
         Xaq7izzIGz9JvprqiFtkw40j3OFPVEDFzTcB8Nwzw335+UDEHFCMHfJlNw8Euk10jbwj
         vTSvcBZWOfS69LwWw2ebc28af4TbifLga+pZDgVeohamrmlDZ0Ib4jAim4PXvypsbyaS
         SDiGDwbIvPjMM3eD0Ak1Uc6rjA9p2dDus+8gFrE9CHr6uQkETRu5eRfggyIYEUgIY1Qx
         SOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024665; x=1740629465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0Jk5DjPf8kGEkzOhcTQC9chMDKvl9vyAtJcg2idJsM=;
        b=D4yELv/CF/k9dKNoXAONu4k0jrxk9FaN/yCSJ0uEhqCIXvl3zpXn7kz2BqhlRr3yv6
         j5zwlDESInVIDvsrxaYCr2og2xZqALGhGXmDRy26ChkcabiW/d7xN93RnS9WelddFmVe
         T0OYOpoSDWZNgxlh3lFoaDNGDpn/LMSe+3wvvP04L+Z5sHA474Mo+ZuEhYs44ryM3VBq
         wX8MYfALOjnLjh3WgVhUycTiW92/tLHCWls71Qkya7D/UMC4j5/TF73gy2OQiJ3SNkyE
         nVqcB4Hz9PWgdnkEmdX1HZFAem1WEjt4w7S8TlelJjp74OW4wrqfapSvcPhYWjlKDPvI
         XXVg==
X-Forwarded-Encrypted: i=1; AJvYcCU/5MYZ349+LZwSKctTAfUq8DYCELWuroX4vyADhbOYO9CBxFbOuYvjfIOqS+P9Ub/Vd9SKEC2i4+jY3GCoFZqq@lists.infradead.org, AJvYcCVzxJ5qwL3cqemtTZxxgojGH3V0EFP21yw3/1agjnTfb7Tu3gFArtKqZPTTOyzkdiUtk4gBrLmn2AZ0tfPxZVw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVcUkaDHUv61KXc7TCvBxgn6cM/oRnFgoY9FRJVKA32JTu8l2r
	oFXIlK3hjJbEBcP7rlTg/nryoChWuQ/pwpocqLklGwsH5ED0VcUs
X-Gm-Gg: ASbGncvs8X7DzKxyRm5lGIZ/pIxBy0osCIjip0SpDKvKhTM1AbcR9DNbsOx8Q7bxPBI
	Uk8KGHpj2yJM6zHqcseB3YVFRyTd8ACO1L3Z3JZ6rN+o6t2r6R3Z8sStEjoqVxXkGB9QTnS2vD9
	YZ6IZ1Jwg+ntnGCouuRQ5ydyNR1bbLcPO6Zj0DwFCQnbzT8USUpjEpl2J54f9nbj8j7Jt4H+JTa
	bk3suWxbJI83Veh+ypRpxGc0Xv+2ZU8Kn7iZTQwSO6UPFCvRDAgFC8dpslwoAjofxhJv39LYfOQ
	nWBlCoOLKIb9d/3CN10nvrzh
X-Google-Smtp-Source: AGHT+IEDT3C8LK0nuarC7egRgKfpQfO4rWBdNfojWxtSEg3bpFiZsKlVvLy6hdQVmNMmvRwYmyp03A==
X-Received: by 2002:a05:6830:3897:b0:727:423c:95d1 with SMTP id 46e09a7af769-727423c9870mr1314462a34.1.1740024665010;
        Wed, 19 Feb 2025 20:11:05 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:20f3:777f:5ae9:b018])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm1025875a34.47.2025.02.19.20.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:11:03 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED v5 3/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Ultra
Date: Wed, 19 Feb 2025 22:10:09 -0600
Message-ID: <20250220041010.3801-4-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220041010.3801-1-honyuenkwun@gmail.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_201105_801219_DE973324 
X-CRM114-Status: GOOD (  10.42  )
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

Enable the only HDMI output port on the Orange Pi 5 Ultra

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../dts/rockchip/rk3588-orangepi-5-ultra.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index 93561b7a0938..5f673ad51686 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -4,11 +4,46 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588-orangepi-5-compact.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5 Ultra";
 	compatible = "xunlong,orangepi-5-ultra", "rockchip,rk3588";
+
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+};
+
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdptxphy1 {
+	status = "okay";
 };
 
 &pinctrl {
@@ -23,3 +58,10 @@ usb_otg_pwren: usb-otg-pwren {
 &vcc5v0_usb30_otg {
 	gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
 };
+
+&vp0 {
+	vp0_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp0>;
+	};
+};
-- 
2.48.1


