Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252FEFC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPfFKKkj3YOAaBSKHb2Ab/ppYbBhY88LbwcF5UbxktE=; b=pjBrYuDJJbOtZq+qcq1tqdlzEU
	dduuk0ZWWiicUI1Z3CuzjL76irra3vEZp7mIBj0+QHXN/0nnPiBVhwT8iaeCgGZ5vuXkGTvVtjrOM
	3+iMr/IgyZV1vMvD2ScF2nUJoDbg8/EgMda7zVhKqyu9gwegEmvOgYOPDkfDrT/MpBov8jF/011vG
	SFdWfHJ+IL0krBc3tQYjh58OTu1qDATL74nvPttDHEvnbfzIXfsT0/9M2sIqbkfoMuOufT5kLemTq
	lhBD8ggI3ImC0+P/JLcIZB30fQ+DZFnaO7r1QGFUOw//p+FNkibMi9Fu+qK5bzWo2pphXlSwaVF07
	W5sSjdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAV-00000005j21-2BxE;
	Thu, 26 Feb 2026 08:56:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAK-00000005iw9-01II;
	Thu, 26 Feb 2026 08:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KPfFKKkj3YOAaBSKHb2Ab/ppYbBhY88LbwcF5UbxktE=; b=JjMx1L0X7phZ7Q7YQnFAOh2dSq
	5Udsvoth1Zhkgzqeoo2JTFBfAfjmhxXfc8WS+o5FCNwRcm7/nmYoRc8eldJE2XomhjA1jMD1tOSxJ
	wff7/fLdTWTUBL5qf84H2MYRW8nglzxJnXiwWch0ovDHwjEzXd9C2Nx+LhAhCAPWp3QPWmem3ArkF
	T6i+kiRcF/0zRiHghI/AfpagRBywrJo9EfohWA5HYcXGcbPHIpQfp3Cmr3GHvBuLk40wivhDdN1GN
	VW5JSW2YGPWNiVK6OqrLYWUqzNxrt5rtkm3Ng9RwMkB6sjkzu4n+JC3MsCqJiUn9QlrZnW1qCnfuO
	+9G2Dd3g==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAF-0000000AYYC-2RwY;
	Thu, 26 Feb 2026 08:56:10 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPfFKKkj3YOAaBSKHb2Ab/ppYbBhY88LbwcF5UbxktE=;
	b=CMm93px6MeyvpxXxn6MiXNzbHXLxgtwTJVs+PsCYAgdkuy6692oxCGXPjKRjBwIOR2SdDM
	H7h43Bq9VESAgzTepv8Yl/FG2ouup1r+x29RhXj3OuGyFbOzg1K9qOpo11MioAFnK9PSQ5
	dEQZaJLhvQEUHSpJ5Fm7Y5HdG/iGrtNIryx24Ukjg9DTta9fR8vdNg+CxxObRm+Mpea++I
	XLNb6Ayf56OMkaeAa8y5z/PTYo9cjbUvaD+NozC+nEy+BXevA1LPpM4xje+Vaqezu+iVU6
	Dzr6osMI8lG3RMuYUC++qftOSp2Ln1OnSyTKFPM936yGKIM9xwvjqqzCJxWYsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPfFKKkj3YOAaBSKHb2Ab/ppYbBhY88LbwcF5UbxktE=;
	b=HYovLJj6kU4MIDiM1pWrzvqmOKjnPiIYEocTWpx2Tc759CHcuz9P8YmxlOMQMtVN/Y3rWu
	BNn2ZYzgJF6NhNCA==
Date: Thu, 26 Feb 2026 09:55:54 +0100
Subject: [PATCH 1/6] arm64: dts: broadcom: rp1: add i2c controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-1-60832d20ff04@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=2946;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=8sPr9sS7Z52G4r4n/tMNe6voegA02R3QGH/9h37K1Yg=;
 b=SmiytRlfzaHgZJ7ahKgR3JJmchil3lCKHOQzEQMDXBp1Tk0ImjNneWVguYJNC5WDJ+SwQ2Fp/
 1NyKNFJctLzDtpUP/tzg8tedoLWz79lfFrYCqDNFc7bmOBr5VPZx3cK
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085607_866992_1944EEF9 
X-CRM114-Status: UNSURE (   7.13  )
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

The RaspberryPi 5 has 7 designware-i2c I2C controller on the RP1
chipset.

Add the relevant nodes to the devicetree.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 77 ++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c379794524de542a62e7b157fbefe4b4b59..58179094e30e7e0eb6242de9edc460fd4a0b7685 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,83 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_i2c0: i2c@40070000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40070000  0x0 0x1000>;
+		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c1: i2c@40074000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40074000  0x0 0x1000>;
+		interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c2: i2c@40078000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40078000  0x0 0x1000>;
+		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c3: i2c@4007c000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x4007c000  0x0 0x1000>;
+		interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c4: i2c@40080000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40080000  0x0 0x1000>;
+		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c5: i2c@40084000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40084000  0x0 0x1000>;
+		interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
+	rp1_i2c6: i2c@40088000 {
+		compatible = "snps,designware-i2c";
+		reg = <0x0 0x40088000  0x0 0x1000>;
+		interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&rp1_clocks RP1_CLK_SYS>;
+		i2c-scl-rising-time-ns = <65>;
+		i2c-scl-falling-time-ns = <100>;
+
+		status = "disabled";
+	};
+
 	rp1_gpio: pinctrl@400d0000 {
 		compatible = "raspberrypi,rp1-gpio";
 		reg = <0x00 0x400d0000  0x0 0xc000>,

-- 
2.47.3


