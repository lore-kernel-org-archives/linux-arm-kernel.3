Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C5FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=; b=YkTPC25wd2XHuyM8BpZbDeqrF2
	4hVnefVSD6j4kryMM4uDInsyz44+AWRXEiAIQomc2JiQ0F1FCH/7dxI+i2s8ir4WZP2RWJ/9Roknq
	wmodc377yQiwIHKsU35eTV6YY6sjrWcPJ54wTyiqvL9qk7PiGK3Q1PBgN0yanCVLijLaOxC9SjlAk
	xUb4jd0jfvzAVLzV7j/mI0VcqQC1NFHGnO1tYJL/HbiBlHT6Ce1wGYHVmX+Eub9u4yzA4bYltKkDo
	dfI74xn0NsrCCxvBIBf7zg2wRijppG2Vxr/mwsvnr73jGslwpJk7dzJ8mpJKTOA4ZzlB+RQFvvrqI
	1L+TYOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTteo-0000000ELvW-309x;
	Sat, 04 Jan 2025 02:12:54 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtYY-0000000ELFJ-0j0n;
	Sat, 04 Jan 2025 02:06:27 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71e36b27b53so6648051a34.1;
        Fri, 03 Jan 2025 18:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735956385; x=1736561185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=MNUGN/OFiesVmIRpk6ao4s0Wc8glNfbMb9xpJHvt4LL1t0JnLlEkgfTsqQ+J18DcSE
         fIpL0A02M3gqcGUKvdEZbtX8ZyxJxd1jRy0QKLoHwG+zZOoc9CTRB64JpMaLfyRCYhqN
         RquDjXjd0mESHIlPf8Pc0ttMCK5cC8afDuc0PcTWmS3uY0tJcEXKjQB3+JEybW4CEz97
         80Q0Uk0OjJhZA5NGGQxfJvDB+12m0fpwgdTS4d/ikNsmlYC5ee9zu8vtHOeh8Npoz34H
         RK/RP6cBsVdiR8h5jkUQjzfcCJ4GLYlSCTVBVVvYTAWZvZjYb5GebDOAXOXw5CkhRiDH
         Esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735956385; x=1736561185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhbPOgs5hdCM6+iNzYizeI0jRjlgIwhloeZJA197DFE=;
        b=Q47O1oamk5wxiLpeX/qvrk1v9V5xasB2O9sco+IqZs991MUf06B2RATh4EZZCs7tCD
         BnF3BkxoHaXMhPWQu8aa5lQWz9+QZUn6B/4PCsSXppaUnYOakPObN2/5IItGFvx/YHRz
         m87g1YB2nq5KFYEpAcE/X2rjfMcE0IN39qaJLkQZQmYxtZ4/kVOiCNbeTHU7RaYgmAIR
         SzQrCH0M8kr5Ng67qSxqd5RjD1ReD0OL1BUwCwna/LUGMK385t2qjwldLWuNvjTATvvk
         KWSJWBWByCeNz24gFTzxTLWXEKqJWZupmRz+F1L5yBhW3EB4T3FwSHecYWghf6sfPpi7
         aMLA==
X-Forwarded-Encrypted: i=1; AJvYcCWsVUcFGDHoCPfXnnYm5LUW03lAXepEI+daV4SIhM2qo8L+yhOOD2D/9G8xnGHNtubP/Mx2nYP+HbzKV7BIuiQ=@lists.infradead.org, AJvYcCXkSoB7sGKQRfl7rnzdZF6s21TwUJv6XJrF7gAt7VccSU+4Gt7KDlaG1sxlL/Pe8WULzjlrpuCzQrxrNzLIiCab@lists.infradead.org
X-Gm-Message-State: AOJu0YzTiaUGGX7dMnt1Uhhvydr3XedMKBaG+K7pFgMrQlM929/maUtd
	kUg8ZVR5cStI77vD6K04Ul1tdLQtyU8svZn4IiLSqdt5FdEafOUB
X-Gm-Gg: ASbGncvaEpqqUmzBhaE5eD643Fq7stVPcBvwNMnPgm2k1gDRlkM12QtOhSqZunYuiGz
	ExFJEybFqMENstsqKKDlmLksOjs1arcFeOF/ezr0HLsitRk/7O8vvHt0QZeT/QSSkEuBq8fNH6F
	d8qZUgbsJNNx6sOn0qDYr19FLwA5kK2D0463vA07ZnFmjIKEA3kU7eNQRoBxMB6BwR8+tpUltE2
	yTu9R3wcL8nNOx2LIcfTztYAXrp0koKCuHikJEodJ/UQeFZge1E82swEp8h+t/8Yg==
X-Google-Smtp-Source: AGHT+IFfJu0KWbafVRQ9nCVj07LtoEYzd1Pxn64GMymrVWa+4v/clLuGTdqdSOuoKn2k0AtwnI3T9Q==
X-Received: by 2002:a05:6830:700c:b0:71e:5a:f4f4 with SMTP id 46e09a7af769-720ff8ee854mr35955653a34.25.1735956385152;
        Fri, 03 Jan 2025 18:06:25 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:7057:8598:1940:24f4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc998ef6asm8406568a34.50.2025.01.03.18.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 18:06:24 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 4/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
Date: Fri,  3 Jan 2025 20:05:40 -0600
Message-ID: <20250104020544.6777-5-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104020544.6777-1-honyuenkwun@gmail.com>
References: <20250104020544.6777-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_180626_206866_23724A4D 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Enable the second HDMI output port on the Orange Pi 5 Max

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
index ce44549babf4..ecfbed2d0059 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -21,6 +21,17 @@ hdmi0_con_in: endpoint {
 			};
 		};
 	};
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
 };
 
 &hdmi0 {
@@ -39,10 +50,33 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
 
+&hdptxphy1 {
+	status = "okay";
+};
+
 &pinctrl {
 
 	usb {
@@ -58,3 +92,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		remote-endpoint = <&hdmi0_in_vp0>;
 	};
 };
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.47.1


