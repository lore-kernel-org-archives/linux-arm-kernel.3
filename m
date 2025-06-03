Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B56C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2WNeHWGKI9roALR2lWxhNA2hHvIsfJxDyoD0/1ONqw=; b=Lv+tEHYEiRWGCqpuCWD2Meplkg
	SSDkp4BO8OMOHQs5sGIeZCbw8udYzBn666JOe3yelp7k4f3fGuazyjkHxaiIXbYMgMG7HOj1h4SXi
	h0yI95FLQeBgZ8nrdrH7WKoNkvCulRniiJUetWzfuLfJ3CbPFPPpdhkrkABFc8bOZBV9NQ2miRrRj
	gvX1mNTqt5SLBLeYw++ElrjmvxCk3eaSz/Br8y6A06lNN7vaMK8wWGNbkVDZsGp6gO2B989/kZnh6
	aEto6IMMHc1xOrIdNy3BiO0zJy3Im2vFr3RGf9WVqS7wEOxJQNgQyE58cPmnsnMTAt5b+uv8Z0LKq
	l/wBmqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVBj-0000000BSTB-1jMm;
	Tue, 03 Jun 2025 17:12:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV11-0000000BR2Q-3xts;
	Tue, 03 Jun 2025 17:01:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1466471f8f.2;
        Tue, 03 Jun 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970090; x=1749574890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2WNeHWGKI9roALR2lWxhNA2hHvIsfJxDyoD0/1ONqw=;
        b=HsM1Zquo8cSTcoJBu4F4AoTDfabY891YEzYKWXRRb3xn6mOUZTG74Bo6gIRkloDVYD
         JP/bd0VGhPJLRlU+eGSivV1NzwytYSAJOj88oYh3vXzzhVRqL8T28jABFnDCOi+UuNnS
         kH6VdElCVobI78Q1MBMQG05V/qG/1v/X7KmkDF3+gs4++Y7byKY3H8/oGdFFcGThmjDT
         ksnT5YjB/le67J4N6tMol4DGcLGYp1VnlZYN1J3kz/Oq0vUG3n17xjI5wsNxomj7ZZI+
         oH568zhOCOKj8gX5VjgjsXBBwMXtj6oiGcmh8UqQO+LXCk23KaRz0+6qS8CvO1vhUQBR
         J1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970090; x=1749574890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2WNeHWGKI9roALR2lWxhNA2hHvIsfJxDyoD0/1ONqw=;
        b=VBLPbtla8RUk+WRF/l7h12t/loDdN3A8D5iHTkUQBtHnEmffrv1P0EO6YXvynFY3md
         NRFAHuUFjJmWSi3zZXSPgQ0UsEX+22UWInj3CDIRccnTU65P725ykjxEg0oeYGvkCJ+E
         q9tB2H5K/8FB8Es7l4Y59S9Qm7XU/8y4G1GVPxxulyf1KjG1zOGgpCPRj2pF171jICs/
         mB2WtvwMTX4frCvWM907DmaVC7sdJRIPr9+gwQQHeuCR3E6xtCuVJBBh9LLNyn/lWqoV
         lfHbkObskgevnD02ic2hxyPohgLGcgPMy5+nwLOTZI/VceXrLHySPhTfgIx+AaZQsjHg
         TuWw==
X-Forwarded-Encrypted: i=1; AJvYcCUpmxD9EVnAnLGlzIc0puFDQCFDcV59tX2+pa43IXbBYyArUmLTXE6cKE7/U+fLXiguFQlzIiGD07O9sopOTY4=@lists.infradead.org, AJvYcCXMHupZcaho/7BmB4qjH+UcRR0qXoJwkD9VWCsOyLhw8JUXNLCpln8CJRackeypSFGWfRcjiEXM2NpGLheLoKt5@lists.infradead.org
X-Gm-Message-State: AOJu0YwBE4Y/ptkYVxpsXaxBtnLF6Zf/L4ws3F5rc7/s/EOT4B3k23on
	LA3rPjzNcgqafxUDxUl4p5pLKbcdmDQ9ZrzOsXbxDtKtWlOJwn1D1qqZ
X-Gm-Gg: ASbGnctdgX9GxDCSqqKEKjXfaWaRhb1VKBde9HBURj8s5sH2OtTdgWFtHxqutY1WMfq
	b+1Iv0imwpbVxm2kP0AMBT3otU3MMbvjVQW8e7WNFw1/4d4a+Q/+0+JeoYRPgNHn4s8ntQtb53D
	/JMjYAQoajxrY1fbFgwM0WgDdcqlCZj4sNdxiabgSwNrsnR94wNyp+VegpYjp2nximzYjIIbFX8
	6JZr1R5Y9L1J6nGbrUkLBaH8y0dcW0T9K6IO8npPmyR37crSz+xlNoJQApYr74inxvQxxKJZ/Q0
	emQ0oIrrXvaK3lEV5G2jJNZPGHeHtXFaAZgDJCUUHmOLrhH5P3AqvdlUCFvCT4mGTATqzgidm+u
	0ihmAhUt+ndSIZYkC51R9TzjHHtpEKRIQkd+B
X-Google-Smtp-Source: AGHT+IE6GEEXLj+uCTG7+WFHFtMo05gc7+06c+MEmNE8u8Ku+jPfH+KoYhCAkxPaUNl4r/V43bwYZg==
X-Received: by 2002:a05:6000:4023:b0:3a4:edce:b2a6 with SMTP id ffacd0b85a97d-3a4f7aafdd0mr15910447f8f.53.1748970089947;
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:16 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-4-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1967;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=MRpcTnOmrGZKKzMf/zKdzcRdfMSKeKmyduo0AYU5qjI=;
 b=smst/OKPkZEHmFa2lIItgsGCj0ToD3bQtjChD6j/TxtKlzH7pmVS/qHpQJMmNH4dOT3XXqCu+
 GBz4ySF7afoAA32zIGNcWjDPMygusyjS9VBK4SMPL9H0LMXQyONjVPu
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_100131_991048_C87C0540 
X-CRM114-Status: UNSURE (   9.63  )
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

ArmSoM Sige5 uses a soldered-on UART connected Bluetooth controller.
Namely, board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a
Broadcom based BW3752-50B1.

Add required device tree nodes to enable the Broadcom based module.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index dcd033859398312f7693bebb7f080ee4f2ecaa32..46e5d6e30898a0f937283e986f188947e10250ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -791,6 +791,20 @@ usb_host_pwren: usb-host-pwren {
 		};
 	};
 
+	wireless-bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
 	wireless-wlan {
 		wifi_wake_host: wifi-wake-host {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
@@ -872,6 +886,25 @@ &uart0 {
 	status = "okay";
 };
 
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&bt_reg_on>, <&bt_wake_host>, <&host_wake_bt>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";

-- 
2.49.0


