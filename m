Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91251E85367
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=; b=hSx+VQEnxXs2SCSAjFasuR6PWL
	zisDckwk/02EVyCu3ycBUuda2j5Hghtxp+d3Wm4JCAqZdmXWLKwXyixE1zCGjbtDjQXgBiaGd4w5O
	jS6TTJlo9wXWX/+OwAMos3aG0aZRgtfn4BSQJO0jWfzjC5OhCCL+/O1M1xY9s/+RH8wmAcdGA/OEK
	2mblg/iRTrSH6ovkSHUszM3DTlgJGI37Qmb1aN0DBfrPvkSfj2O7GMJ4Cj9ArDULJGYmlWKbZD1Uc
	NH/cTm3IwMXEX0iU2y+YbzMS9I3IZrbqcAaPRtAg7YBpK7UcirTF873q0kqjqbjBR3X5JOoL/P+oF
	enWKdqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWJ-000000028v3-2IHn;
	Fri, 03 Apr 2026 14:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWI-000000028th-2xDb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 14:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=; b=laTufLQBX9eHMUJuEA/n+AdLwt
	hSSaNECY6ueTbrM9GQ4RfkMQgC/LjQuHdSVmTG3Ng2x0ceGFTzotXRTY0mBtpIFXp2Jc7NMcdq3Ch
	eTzflZBZ7VukG0vl4foBD6aGYFo10YxTkuXGUu9qxq/HCBg/k8SAkWf9CdfWsWw7BxXjSB+sfLZMk
	6ks3QNl6Q7m/dz3pvhYZX/fiX1DwF1z0mj1q2461+B8PEO6JwKltE4R0Ib/ijwHqTCTe9qUsqVsWk
	o3b3TLvePr0AXbklOkjvFbZW27Vxbf1cR60T849stGOILfUARhivdUs93W+cbtjl5lKfHYLxgu6v6
	KjnvIYvg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fWC-00000004FoL-0Fdi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:29:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so19755935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775226541; x=1775831341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=;
        b=FTJgBoQIyhYy37+ZZ11wPH1X8ZYLjcq6HTSNxcO0n9fknCCnoUcIzzVDZv18Ep/SKL
         F4qAsxQrkW2Mb2WZFQx92eLlTJgkhdcLAOyTEY0xgv7IBVsY5u1OZuUcjevSsIIZAYbk
         imBkaUxibo7LJOzlogT19RMhMeChmt29+IWvnbXAhQfzBeSQfnv1dJs+bAw55c5EmhpC
         ZqVRugNpApiEVCZ6IldM0bwyXe93pSnXs9o4x3qvydmv7ijI93LAzuRo43gXtbwQxksf
         zO7nhYkqwD3pB+EFBqCWwAPIobQ1rQ5qaeEQD4Z6mijWvbZi7PjL3EMyN59z69jIa8x9
         sSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226541; x=1775831341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tgGNuvlVR75U6twtOQ2sB+iKcvPJAVB1mzayebN+L4=;
        b=q/IWC+LEj/2gT5rzZ3vv2e73zhtcj+0r530fURskWcwgFQr7YnvyK/vD+qzHOnefiG
         OQraNnivBXSRcB8B0repnJFZCqRJzBEMmiGT35qgZTrg9lAfyHIvs5J258/92WqDH3iH
         4nHrAQr7osQs+2pmOLfdrRGRvclCyvEaOQvd3rzWd2f2pccarDOBoQ2YJru+uTPVzgkg
         a5AGeW9vPjBsYz/5sEBy/HHM7wognklu8EVjGnB0wzWuPd311L+N/QfE/JfU9K8MWlMf
         ePmlbBndkQi/J4+VobN1eQPnB+aYVH6jTsrizKC6cfssBk05+Owf+3z78+jQutaMXNVB
         3guw==
X-Forwarded-Encrypted: i=1; AJvYcCU744QYEfq+taYwinqYViVL/LXAwE1wmu3SwUokD3IoXCOxR176xEmYfikMzkchS6dSWnFs4G3WepSshd0DcJGw@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg5pv+H95xESu23AXtH3OeHTA/PMAMFM2fXrmqnA7gPrm2jihz
	UJJS5fsDfSXZD9FSXDwAqif1t/ZMSEpZdK2IURdfhJxqcEXMOAhfCei7s7IYBmSH/6U=
X-Gm-Gg: ATEYQzzU/6gS6tdMrDLAN8gbR5lixkn8mSanL7r7MKnvbbzu87/rlj8hEG45M6UvOzP
	bL/iF2zCDDni/dEMgZWC9Jo4urxgWg6AQye4v51Iy0k5x+S7WCmk1KUCB+JkHqUjeVjHBTMHHd7
	oidHIO8qUMPpr7mNpfiIh1RGqV7BeGpsxAXkj3k67haaspibZO6dAZgA7bJvd58bEEMqTESz/WV
	/TIij4d8nzojCnxXXBbN0EhRCA0mit5bX3WTbjuX9Fd5NntbyXMITch1lpFXW2JnuCCCu1F45TN
	Q/K/wOfy+1u+9q9ib22VAID18zTmqbhVch4zcfbdi0f509IuRlF5PADpJc4pPfjXBXHbkg2B0UP
	yHsweqyemoxxHWWaiA3yLveLkzZQ/qmR1fbcM7529ER66LBzMnvu11VwWs+E+A/fdtUC0pTxf4O
	hRIhp4LfgjepP0lkwgHa+Wz8KZH+YhnA5o59+jXnQVzOHaLU+X9EWGx1moRdqzrChPoIi7y7Lkj
	kkmp4o=
X-Received: by 2002:a05:600c:1394:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488994a7a76mr49414895e9.13.1775226540607;
        Fri, 03 Apr 2026 07:29:00 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a72baa8sm142747135e9.15.2026.04.03.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:29:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 3/3] arm64: dts: broadcom: rp1: Add PWM node
Date: Fri,  3 Apr 2026 16:31:56 +0200
Message-ID: <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775223441.git.andrea.porta@suse.com>
References: <cover.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_152904_254851_F8D055D7 
X-CRM114-Status: GOOD (  11.35  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2856082814462..a4e5ba23bf536 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,12 +64,24 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
 };
 
+&rp1_pwm {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c3797945..7e78501e62b0c 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -56,6 +56,16 @@ rp1_eth: ethernet@40100000 {
 		#size-cells = <0>;
 	};
 
+	rp1_pwm: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	rp1_usb0: usb@40200000 {
 		compatible = "snps,dwc3";
 		reg = <0x00 0x40200000  0x0 0x100000>;
-- 
2.35.3


