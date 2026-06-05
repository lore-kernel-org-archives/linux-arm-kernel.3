Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE880CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=; b=2JGRlJFGb2FINqBdxAyMV9NxHk
	5oPPnFPvFVCVCFboi78WVE5fYR5tNUnygaRiFwKAbWW2ywYBcgHrabjSPfJTDOIlYZZhx/6/K/o89
	fXEw8xGhqjg2papeH5NjXUtlw5Zs1bAlyEjH2O1mj+7GImVzRgsBD6gDgO/ZbrYl7w4l6c4GQf6WO
	1khdnQA3IFP/79ju5ueod0XzTkphyDVx6v5NidNvERMvm1PvIXMsxkqKmi69sh2+RaR/65mpgSJoQ
	TlaQbVKhFPX6K3RoP72mOghVkrgmObKtG1mJKWEPh7Q5aMaxKbid0G7Ais9D54JjO4c7M84wyw4bN
	lAmi7I0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIw4-0000000HUD7-0gw8;
	Fri, 05 Jun 2026 01:01:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvx-0000000HU4F-0HCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:01:14 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4854166e1efso1259993b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621272; x=1781226072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=TZ+tY7at9TvlFqI/sZzm/Wteuk3cqVIFmYa/YSyDZIjZil41+k+WPdsdpdqpNJyMhi
         fkgJ/DtEl8U0R9Esc93rEFcy0q+jd37HxVE7BTaMQjlKL1cILavBWr8UdajHU6zyZViC
         WNf6OGl0akgcaQWMdomFhwE5RXPz3NZy7QAzOHVP9zZGiK/5f24YLMNWwE9Y0/dGwGYC
         ak8bpfeSalWNWwfI9sY+dhbheo2+5RWFr19QgFUyaqGZeNdt3Fn/nlGrmUoWxAw5PMwv
         6UAVXLJgalUuDouU5Kxk/PNnVQl7ID3P1FwIY2hPEjN+YFezY2ADfo2aGyVGCZV94E9R
         b8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621272; x=1781226072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47bS3KYOz0HXJEWz/g//BdjKiICUn63lin6d0JHBcp8=;
        b=R51sEaGvVkkBDRgBLWBf5aIjqZYTf+lB1kln5FX6x0L8zBXAatNCIB25cr2aE+sSRH
         iEcLgBQrSODn233HxKpcAduh0b9iMnJ2Pi+S2rs9yUwG0ez7Lup0ybQfPV+TnMDZGDci
         oD4MvTVCZGD3M45+gA//dkKgjQgdRhvLQhoZ2MPCwdE+6NLhJMK0SoLc7GZ6OB6LqcO3
         o/T1aChC7LU+Kghc1lbofK9mB0nbwZxATCMUDJaQees71hHrezLyvxu9ipQD0ZOMZn6c
         sV01JHyhJb3CHGgCSMHlRHZ4g+IxdHKeXaNPpNPoxmskloDdwvzXtSkKdMqnj50oJkz4
         w8/A==
X-Forwarded-Encrypted: i=1; AFNElJ/5U2ifQUyaKv6tWHjqZCRtiLGKHuSIJvd2A04YXn17C5Y4R0EqAJ25rsQq03xMkoflXbOMfYDX5MBevACeVxA7@lists.infradead.org
X-Gm-Message-State: AOJu0YztSluERb+DnVWW8tErRpCvBx9MgYeOvPXoAtdG08Af09z13XLi
	sN7JopTXBfjUjHgIl6knpxIupMlRFrn5T+mJ4rrqAqVIgjHPhkWncGmRo13ph4Accb0=
X-Gm-Gg: Acq92OHY5PW1/q+TrieW/YwTU2JI09E7Dmo/cdNENX8IsX+9qW6EPp2UeoB88Nsl58t
	COFCzkERYTXP4gYkrelc/9uxwF5/9S8iYDlxETcPinbAC845YrmANUZKITVmcvru89KBCvXKMNE
	wi6f2hko1T3x6TJ6NUtAMwc0/ciArnWYcsAN21uPt3Mhje1Hy7yIJvuLAioB9D7P6PRWQ8T52Cz
	uCfB8X4GsQjbP1GQrJMHE8oEQMJT3Pc2TG1FNfXrk3pTne0jA/PBUqgJw+413rSqwYS11g8ppWE
	8V10D8njrQtPf5CYMP1h1xswJcUke90pQn2AOrC8pEUbjHghZf4xEx0lXww/VFdzfK33yvvVxQ1
	7Rh4aVHgYgjHVM1CiGHyI2KH/BHHUh6wG6MG761+GIMUKMdxHQ7P49T4Nl88yx9kAE1OKFXGcmX
	YMWI/hl3Dy9AkAxsnVOVM3qeZWqulZU9JLKLAJPw==
X-Received: by 2002:a05:6808:1804:b0:467:27d2:96a7 with SMTP id 5614622812f47-4868dd0463amr865195b6e.15.1780621271933;
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:01:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 14/14] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9564 with a single QCA8081 phy
Date: Thu,  4 Jun 2026 20:00:21 -0500
Message-ID: <20260605010022.968612-15-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180113_174815_A097A5EE 
X-CRM114-Status: GOOD (  12.64  )
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

From: Daniel Thompson <daniel@riscstar.com>

The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.

Downstream PCIe switch port 3 has an embedded PCIe endpoint, which
includes two functions.  The GPIO controller embedded within the
TC9564 is accessed via memory-mapped I/O through the first PCIe
function's BAR4.

Both embedded PCIe functions have an attached Synopsys XGMAC, but
not all RB3gen2 builds include PHYs on both ports.  All versions
include a TC9564 combined with a single QCA8081 attached to eMAC1.

Add properties to the existing PCI nodes to describe how the TC9564 and
QCA8081 are connected to each other (and to the host SoC).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
Checkpatch notes:
  - pci1179 is not a recognized vendor ID
  - Some lines are longer than recommented

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884af..1d83b07360a33 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -308,6 +308,15 @@ vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
 		regulator-enable-ramp-delay = <10000>;
 	};
 
+	qep_1p8: regulator-qep-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "qep_1p8";
+		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -938,19 +947,51 @@ pcie@3,0 {
 			bus-range = <0x5 0xff>;
 
 			pci@0,0 {
+				compatible = "pci1179,0220";
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				tc9564_gpio0: gpio {
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
 			};
 
 			pci@0,1 {
+				compatible = "pci1179,0220";
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				device_type = "pci";
 				ranges;
+
+				ethernet {
+					phy-mode = "sgmii";
+					phy-handle = <&tc9564_emac1_phy>;
+
+					mdio {
+						compatible = "snps,dwmac-mdio";
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						tc9564_emac1_phy: ethernet-phy@1c {
+							compatible = "ethernet-phy-id004d.d101";
+							reg = <0x1c>;
+							snps,reset = <&tc9564_gpio0 1 GPIO_ACTIVE_LOW>;
+							reset-assert-us = <11000>;
+							reset-deassert-us = <70000>;
+
+							vdd18-supply = <&qep_1p8>;
+
+							pinctrl-names = "default";
+							pinctrl-0 = <&qep_irq_pin>;
+							interrupts-extended = <&tlmm 101 IRQ_TYPE_LEVEL_LOW>;
+						};
+					};
+				};
 			};
 		};
 	};
@@ -1524,6 +1565,13 @@ usb_hub_reset_state: usb-hub-reset-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	qep_irq_pin: qep-irq-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &lpass_audiocc {
-- 
2.51.0


