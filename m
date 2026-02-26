Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C653AFC5913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypsS5YQLZY/5JYTSDVjnRXjPKoJTJPPXgryl3kx9JEM=; b=o5ymrbQXmVm4LVLGV3apr2JvgA
	pwGnGKaCVWCo3LtYsJdAoAi/SPl5P51FWT/ic2cZZGshgrXvpelEvwiQ4kvRQt2j2vVPFmEYjCqeW
	ZSK3PI2GIjynCjq/nFOug9b1wBS7Z45fpbMWwz6CxhYa3+FSGEWmvt75amE5+Ur1h+mYD8KCwmRcl
	wr+todD+XMnSx5CDvm9SBuIKllhYTGWZskhbmK1qixW8QxHtKKTmg1grzUGnyY9dPdovmzJKko5VY
	Ua7z8vkSgYCT7wn360huufJpO0WtQ3ZKHiIXIANVWgZ62KzW2u55asltUFP66a3a1TjKohSocYcRN
	b4frvfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAM-00000005ixo-0ElJ;
	Thu, 26 Feb 2026 08:56:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAK-00000005iwA-02z9;
	Thu, 26 Feb 2026 08:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ypsS5YQLZY/5JYTSDVjnRXjPKoJTJPPXgryl3kx9JEM=; b=A1JIY+KzBN1fArZtbcOvy1lGdx
	vOqhfJ9ywWqLMNDaGrvY1/lzDZ3G5ZbccyVJOproEfjVK+6lJ360wlQP6+9Vu3o6yp/tagpolKvY8
	Ls+nYqYBgUrnPAB39jKMJQf0HpaKkNszz7ZqtkyN53gPCar9lahimqP/AlYb9BrvrH1S//4yLetvz
	uN3Cl1WMj8plc6hdAAFWFWQd9TsKbYAIZJQwfWy3AhyyAihQa4I/YRjl60oAXreWJg96mxZ1tjUpv
	v+7qJiA6LJnHm8Cq1MXGiv5+nepusemIllmCO14FTq6QVO19m4HxuxXUS6h57XpLVCZh8//fb9EHY
	LRa2btiA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAF-0000000AYYB-2S3U;
	Thu, 26 Feb 2026 08:56:10 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypsS5YQLZY/5JYTSDVjnRXjPKoJTJPPXgryl3kx9JEM=;
	b=P/QA84Vjcr8pwhflngD+Yt/+7a0ZRp4szxw4oZ2uMmeI8OyrNbSpW+fJZLKwitvSi1nrdv
	a6xUYOx0JvoavMJO/48G4wTpqhjMLXt8gLWgzEoxk5va7jitLe8Xp+OUhdJuieFzDms1o0
	3y9nRRKxS5ZFPN2EZ6w1thlq0ak8ESdCfVQTZEvz+SVTL2Bp837fPeD26TzQW3Mfc1mJSB
	37V9KS2+zN519Kt31BUzqtUJgGFUtk/0AL6VV/gpLgB/M6IRFpHNuJqL7xhe9aVmMjTpdq
	jVvUHC+pMN/vQZ3T34q4m717fviTcIs39gGKjqs+JY9gtMi/Bhmt0sQAOzRR8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypsS5YQLZY/5JYTSDVjnRXjPKoJTJPPXgryl3kx9JEM=;
	b=U0btQXxOQaApe+ROuLrfLSpXBMSEBZ8KcfDBvav/FE1YY4/YaGSuJsgKmyxE668p8Zps6T
	uHgAz3aqzTKdhMBA==
Date: Thu, 26 Feb 2026 09:55:55 +0100
Subject: [PATCH 2/6] arm64: dts: broadcom: rp1: add csi nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-2-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
In-Reply-To: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de>
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=1877;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=pYkciEG41xzZLCIwLbOSWDr5WyI8tnMGzQIKhTRCpkk=;
 b=YIQvt6lQvWi6p9XhrQSov/88hYcyjgxBtWvvQIkLzzJbaOrU5BA8/kezY5CFAH47xKD5D5eHw
 HX9ENZIKt1XCdNdFxmwJwskcjXWmYXESpBWrHjhemENCLVhPyeogbJO
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085607_870986_1A045919 
X-CRM114-Status: UNSURE (   7.26  )
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

The RaspberryPi 5 has 2 PiSP Camera front end controller on the RP1
chipset.

Add the relevant nodes to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 58179094e30e7e0eb6242de9edc460fd4a0b7685..16f5359395835f7a145aad75094d525e10dcd2ca 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -133,6 +133,34 @@ rp1_eth: ethernet@40100000 {
 		#size-cells = <0>;
 	};
 
+	rp1_csi0: csi@40110000 {
+		compatible = "raspberrypi,rp1-cfe";
+		reg = <0x0 0x40110000  0x0 0x100>, // CSI2 DMA address
+		      <0x0 0x40114000  0x0 0x100>, // PHY/CSI Host address
+		      <0x0 0x40120000  0x0 0x100>, // MIPI CFG address
+		      <0x0 0x40124000  0x0 0x1000>; // PiSP FE address
+		interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_MIPI0_CFG>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_MIPI0_CFG>;
+		assigned-clock-rates = <25000000>;
+
+		status = "disabled";
+	};
+
+	rp1_csi1: csi@40128000 {
+		compatible = "raspberrypi,rp1-cfe";
+		reg = <0x0 0x40128000  0x0 0x100>, // CSI2 DMA address
+		      <0x0 0x4012c000  0x0 0x100>, // PHY/CSI Host address
+		      <0x0 0x40138000  0x0 0x100>, // MIPI CFG address
+		      <0x0 0x4013c000  0x0 0x1000>; // PiSP FE address
+		interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_MIPI1_CFG>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_MIPI1_CFG>;
+		assigned-clock-rates = <25000000>;
+
+		status = "disabled";
+	};
+
 	rp1_usb0: usb@40200000 {
 		compatible = "snps,dwc3";
 		reg = <0x00 0x40200000  0x0 0x100000>;

-- 
2.47.3


