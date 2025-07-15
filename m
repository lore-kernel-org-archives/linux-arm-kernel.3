Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF1BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyE00LRDSnopmAT6DbY1MVSXV6x2jM07IWJn7TK+m7w=; b=xNKfhXAEJdj+plaSVEM2PdWQS5
	prx3AQjX+P7A1zaSBhzNjvythLTUT+XZviddNFHdEwPoYP+etYadKvDbeLInnSA5xl2kmz8CjoT+e
	gMl7JLTfzR7/rRoH1Z+78lLzW0tslegnVkNdDoGiimFx46jlCs8qm6C7ZND0jku31Z67+fHRw38Zn
	ldjzkA0lxGlrmfbf+EpmmcCeEEKckWmdB3mmPwAI3LHKadfzAWHOJx0CUrZPrItvK5xHH8G36pQVK
	7YbGnHkBRKjT1xsRKL3o/ALyYq7wjhDRMFCrYLoS9xbCCgCtlf3DfbSNHHUwAQ18LRE7KKmGV9gSl
	z9kt8slA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublCJ-000000062l6-1hT0;
	Tue, 15 Jul 2025 19:20:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkPo-00000005u8g-2GUz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 18:30:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so11927611a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604207; x=1753209007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyE00LRDSnopmAT6DbY1MVSXV6x2jM07IWJn7TK+m7w=;
        b=FFJy0vYBFwi62YyauM6NyOGQ2MBIr1BP20oD2t5DvuCGAPxiGbb8KnRQ3ItReLyX7x
         wUYp2EjnLd1W3yHbSFeWAUgPdwQ9/fVAsEUzIZF9lZNi604XSdIw7fpOmPs8O7P46Qs3
         1WgbMlvcldktbzk9zRWvr78ymVckKgvfkTnEzsMxobTp5V2JMYxj/dkoS0efEgVKD31n
         VumAoPkjnkR4RrsJ8dQROmtKSeogbrgkEuXbxpC65QJi45utX+UrjhkJBz+5LnqQIeai
         m8y3DtKax6b6t/z2BZ4OexrMP24BwBwersgvz049FAGMPIBD6KSGa61t+i/Ad5ZsXCcK
         Ld+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604207; x=1753209007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyE00LRDSnopmAT6DbY1MVSXV6x2jM07IWJn7TK+m7w=;
        b=fuYwug/RpxetLNtYK6OsqZgkAsR1gybelASuyEwaYDkQHrzAPNDkua8oRgcp6HVmCR
         rWJhml5p/Qcy0YFDf4GVDh9DLmBYbJxlPUlbJ0EFQqdFUpRcywFeXUMFOPEAC352Pg9W
         bF60wJ5BngUc+8SYpFyWAL6R323wEiwN0Orz27kcvNYdQocHXB+zv/tNgqD1F352mGAK
         +p/vqdZT7t3V4nLrt4322y8O4eoHtWgjj+7kyAh46USY3Z4H4amDrhhaBT6qcgKiMMt/
         TKLRGJ41PxZPfmvCdzHWdHtVBV2E80qxM95XZ4s4onTHn0E08wf5eQIWFAnDic6phbZ5
         0gPw==
X-Forwarded-Encrypted: i=1; AJvYcCUC3oAYRB9h2KxVTxI8ksH8TnI4YRUmQfRppEyjcjF43e82nqlzCxOlme/K+e3LjCf/b643FJA0dBLEvmuO0BoA@lists.infradead.org
X-Gm-Message-State: AOJu0YxYyzxwK5yEEa23nk+wgMSUREg3w4/pfxyYvoFX5xJzSnCThHyX
	IZe3QK7XtPPqeA4b9A7Hnox9TyR15huNzYYFsP/ShMbUqN5BYwOm36r4k2p0m9t3PsA=
X-Gm-Gg: ASbGncvvVYhJLH2jtUhFukCZN2ZFV0x9ZHSuo/W3tuu1hGJijMtVY0hm8FkxM2a6LTq
	19UDaVDCRe87jv1O8rVLzO64AQMCHQYFitSl/QU3FKqvgoC9zLcUVRhYZ94oZ5JPSm1zppxfx1q
	QFWM6FvSiRUBxfCEVAgP4sXqu4lzlULxYirzhciCSViYLjUoFoixV4I6P7SKxCCyPL+5JzxYqSL
	X7iuwqpokIMGjSQIt5MiZ/CEWyEng5zqO/ZnwR7E9MlYtGfm4ARZUVg9qnl+88fjnKWEmE/3gar
	ZdM4wL4Dlk8BvctP2lhm7T2sWP8zwv3T8fNQxWRf6CW5vNbmXAH8HerIK0rPLCwppykIPPfv6ys
	yMuWsN2SA84UcdOuAcJDElNwyHPlnBO5f1j2yHuLdzjbTnjcipG8ERuy57rJTmx8TkelT
X-Google-Smtp-Source: AGHT+IH8BPAZmSQAnB8HIlW3wviHuh+xRMGS1WzWK9BWVWaZHe7UESQucjX6BWQ4H+a002ZhuVk51g==
X-Received: by 2002:a17:907:3d06:b0:ae3:74e1:81a3 with SMTP id a640c23a62f3a-ae9c9987317mr44237766b.8.1752604206906;
        Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82e9341sm1044733566b.177.2025.07.15.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 3/7] arm64: dts: broadcom: bcm2712: Add pin controller nodes
Date: Tue, 15 Jul 2025 20:31:40 +0200
Message-ID: <9ecd874aa455db1f33a0c05f5e81c0c38baf2107.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_113008_585216_DF9BF8D2 
X-CRM114-Status: GOOD (  12.06  )
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

From: "Ivan T. Ivanov" <iivanov@suse.de>

Add pin-control devicetree nodes and used them to
explicitly define uSD card interface pin configuration.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is based on linux-next/master

 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts   | 18 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi      | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index 6ea3c102e0d6..6091a1ff365c 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -53,6 +53,21 @@ sd_vcc_reg: sd-vcc-reg {
 	};
 };
 
+&pinctrl {
+	emmc_sd_default: emmc-sd-default-state {
+		pins = "emmc_cmd", "emmc_dat0", "emmc_dat1", "emmc_dat2", "emmc_dat3";
+		bias-pull-up;
+	};
+};
+
+&pinctrl_aon {
+	emmc_aon_cd_default: emmc-aon-cd-default-state {
+		function = "sd_card_g";
+		pins = "aon_gpio5";
+		bias-pull-up;
+	};
+};
+
 /* The Debug UART, on Rpi5 it's on JST-SH 1.0mm 3-pin connector
  * labeled "UART", i.e. the interface with the system console.
  */
@@ -62,12 +77,15 @@ &uart10 {
 
 /* SDIO1 is used to drive the SD card */
 &sdio1 {
+	pinctrl-0 = <&emmc_sd_default>, <&emmc_aon_cd_default>;
+	pinctrl-names = "default";
 	vqmmc-supply = <&sd_io_1v8_reg>;
 	vmmc-supply = <&sd_vcc_reg>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
+	cd-gpios = <&gio_aon 5 GPIO_ACTIVE_LOW>;
 };
 
 &soc {
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f..8a517261841d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -243,6 +243,16 @@ uart10: serial@7d001000 {
 			status = "disabled";
 		};
 
+		pinctrl: pinctrl@7d504100 {
+			compatible = "brcm,bcm2712c0-pinctrl";
+			reg = <0x7d504100 0x30>;
+		};
+
+		pinctrl_aon: pinctrl@7d510700 {
+			compatible = "brcm,bcm2712c0-aon-pinctrl";
+			reg = <0x7d510700 0x20>;
+		};
+
 		interrupt-controller@7d517000 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d517000 0x10>;
-- 
2.35.3


