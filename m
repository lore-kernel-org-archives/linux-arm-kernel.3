Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E10E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyuiOWHUod2sqfzhej2zdZRrKrw1CUBKcQwVtOUV0E8=; b=lTprPf8q9l4AjBjACe+jnIR3VA
	o6W06atEHv2cmYYigOda5FJB/a4l2Qwk8NKBPHd4QmEZrOW3WsbJEdmWizltSSPIIl+vDiETcLho1
	VPlX+jt2jANR/Vhkk2FO2gHRSoOTXr/IlH0/Y0jvpu2+tcDuttUUIUvilXmiNxUl68hPTXKfHuTQa
	7KT+onBiLWoGxOSS4iFEYCjJx2nmfgLl/KVoT4eyyrv2t+3EGDxv/OmvpUBcy4tc1PgM+HufWFe2u
	6EsmIdiFEDbIpHmqdlYMsaEXvyuDNoZY7X6ZtB0KFH6zKLIxzYnHvWdYx9W14u+wo6GOzJ9YDsZ7n
	TtHCKh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsHE-0000000AJBi-0iHG;
	Wed, 15 Jan 2025 01:33:00 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsBF-0000000AHrc-2kin;
	Wed, 15 Jan 2025 01:26:51 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467a3f1e667so41608631cf.0;
        Tue, 14 Jan 2025 17:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904409; x=1737509209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyuiOWHUod2sqfzhej2zdZRrKrw1CUBKcQwVtOUV0E8=;
        b=QQw+LX0Cdl0Uo/hvVEQdwT9Urxfe3ZvIHc87ViSmqHgHck/vxFrx83hc61AwD0YFi8
         2AQrEIitW27RtqhjXTJzydQ6Fr4/bxUutqBiLpcoXwTF+/ORx7QcIk7C0xaiXzoNsWE8
         ULNiPGiZmJR3N18KM0uNQP0qFFaL+ecNRFZMD3afDHsSD6OJ6zrKz4YOFfE9cHtjjEUp
         kNi5s9VKNJMUdz8x3k88Yi1+jje1slcLJmgkE3IKoeWb4JoABK94YtD24RnDq8R8YCkC
         QMu0AdI8GYEPZvoSPMcIsqtJljCGvcKDHIdQ5a2a6WY1G5Hv1AP6fDhIEUXXgMLSKRAA
         XhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904409; x=1737509209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyuiOWHUod2sqfzhej2zdZRrKrw1CUBKcQwVtOUV0E8=;
        b=SOsZA3taUrvpUan3oMBvm5T8IiTKS2lQZd09ZHqduxXhlY0njO0zQmDcot7KgcefJc
         vKKmZgfkiK3VXh1wsbXKq0w4XjC1SGCoFZgPpquw8r+oM7BIJymqXq1srt3UvzD5u1Ce
         IfzzOO1PzCLFqTGDJWyO7D+Y55yscN9Uu7AEv+g+0m0w8/ZrWuftQeHqblSMJI08GLyJ
         dZSwYrsutvdqt8u/66/0x2S0NbJYfKG3Gzj0GFSolivMtpc6QCvDoYw0b/Qw7c0QQFyC
         WM0Ttj59hvE6Xpp/OXO2hjWzSqObjaU1gyhHw9Z3VxTrycbKpuuuqpiKpzc7L2NQcHOo
         mL+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwvXdnUDpqdXuNWFhNhkbJe95fOo8y3lFI1tAk9ltCmEANt/aOZC47tFAZ5EmPzA8BSFq60ORssOESoZatd2w=@lists.infradead.org, AJvYcCXtS+Q3xnA6ADNhCa1NeHo9TyPPLoRe6vr++bErRDIzGSumKuvucLMst1s6+j6+Zzx4Qxc69KEanxOMM0FrhOmy@lists.infradead.org
X-Gm-Message-State: AOJu0YzGy2V2tTBtaREW3KlnZjkmrj6u1j0OJbhps7lhymLJxkKU9Gq3
	MvmMLWNVd0YKaVM4SuJe09+WVFcWqLBlegq64wc948qlSxbY6nnO
X-Gm-Gg: ASbGnctBKcCb3uOd7Tah3/g1NQikamfAaZAJdYmDO1jc6nBHSWsK6nQ6jrwDB6omWhI
	WhtyG/imtaO7dE1GTU1Ze+ou693O5q317Ww/US0qa7ukvjI/2EnOCs4zz0XtNT9RHQZwhrG8RYG
	7JuIGZRisAxAsK+s6WXqgF9K7VJXCykUgyjnnELKXh2x1PW8ezLCOzJL4rWVF5YzmUj8mAZh+B9
	2PZp5NQmGXNjQ3l+DQGOC3MpDMIomQoILct0juY2ROuR9TX2Hlx1GLNZzmRUDNiZEzD
X-Google-Smtp-Source: AGHT+IGVwN2rLclQGuxl2u8LG0fj7kqMeY5ZEai4kqHocjNfKR80vQhAtoz97g9hIjYX7GdkJYOSuQ==
X-Received: by 2002:ac8:5916:0:b0:467:706f:14b7 with SMTP id d75a77b69052e-46c710a98ebmr466909541cf.30.1736904408728;
        Tue, 14 Jan 2025 17:26:48 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:47 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 4/6] arm64: dts: rockchip: add rk3328 usb3 phy node
Date: Wed, 15 Jan 2025 01:26:25 +0000
Message-Id: <20250115012628.1035928-5-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172649_691018_D2BAE516 
X-CRM114-Status: GOOD (  10.56  )
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

Add the node for the rk3328 usb3 phy. This node provides a combined usb2
and usb3 phy which are permenantly tied to the dwc3 usb3 controller.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..181a900d41f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -903,6 +903,43 @@ u2phy_host: host-port {
 		};
 	};
 
+	usb3phy: usb3-phy@ff460000 {
+		compatible = "rockchip,rk3328-usb3phy";
+		reg = <0x0 0xff460000 0x0 0x10000>;
+		clocks = <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
+		clock-names = "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";
+		interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "bvalid", "id", "linestate", "rxdet";
+		resets = <&cru SRST_USB3PHY_U2>,
+			 <&cru SRST_USB3PHY_U3>,
+			 <&cru SRST_USB3PHY_PIPE>,
+			 <&cru SRST_USB3OTG_UTMI>,
+			 <&cru SRST_USB3PHY_OTG_P>,
+			 <&cru SRST_USB3PHY_PIPE_P>;
+		reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
+			      "usb3phy-pipe-mac", "usb3phy-utmi-mac",
+			      "usb3phy-utmi-apb", "usb3phy-pipe-apb";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		usb3phy_utmi: utmi-port@ff470000 {
+			compatible = "rockchip,rk3328-usb3phy-utmi";
+			reg = <0x0 0xff470000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3phy_pipe: pipe-port@ff478000 {
+			compatible = "rockchip,rk3328-usb3phy-pipe";
+			reg = <0x0 0xff478000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	sdmmc: mmc@ff500000 {
 		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xff500000 0x0 0x4000>;
@@ -1067,6 +1104,8 @@ usbdrd3: usb@ff600000 {
 		clock-names = "ref_clk", "suspend_clk",
 			      "bus_clk";
 		dr_mode = "otg";
+		phys = <&usb3phy_utmi>, <&usb3phy_pipe>;
+		phy-names = "usb2-phy", "usb3-phy";
 		phy_type = "utmi_wide";
 		snps,dis-del-phy-power-chg-quirk;
 		snps,dis_enblslpm_quirk;
-- 
2.39.5


