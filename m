Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D18FC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFD6FKSmgk3jLQFpWqZllRzrzjFOnCiWATF9H9ooJ8g=; b=y4eEbuQc/8E4fYvrEsrtmE4WGm
	mwQ5gW/u8kjvLzQpJ6yRiIFFVVhBhArRg5DRHeLRErwu48ZPkleo83g36iemBRY7TbBNCPfuhwBsD
	RvdyBQiysFTqsumelTjD9VXPt/teRA44zhoIG/STXyDzozf9el9PCYH1BONRFj7KVvFI+NAOM5X0h
	w5towM2rXV1H0uSJ3GERUjdSw91U58GIWZo7EjKE/vEmNNeRbtUuap5Q5dLGyYr4PCb7erZX9/+Fq
	s8zmjXI7FvRjV6exBY0Zxk+YVQXmLPQpMUVBH2XqMJTAbDb8jxzuYNDumvfg4bUQ9oL4nO64Wf5QC
	LHPuxQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAi-00000005j84-20fj;
	Thu, 26 Feb 2026 08:56:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAJ-00000005ivj-0e5Y;
	Thu, 26 Feb 2026 08:56:16 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFD6FKSmgk3jLQFpWqZllRzrzjFOnCiWATF9H9ooJ8g=;
	b=Y5sK6CyDltzCGResbfII+m4kdyN3/pmxSBPf87QKtZx1DfZvXipLFtg/9PMs1x1a4lXFR6
	wSTpJ6NPLRnDeHn79b+3drDU60sckXxfxePZFOIFqe5vAe9Sr3EB00kUkLJSESjNlOV9V3
	bNAze6/52NmeWaXU08IMgIPa7zrWK+EIkZ4oK+9BQ4+eyS6qSpPya18k/TsjYF+IJz+4EN
	DvJgVkWsb1/L+nxJ26W4ifVzwZnhl1A5WcJr0C/Rb1bHDVviPB1plMg7zVLXX8je9nCBWx
	D+rv3Ai81sQzQznNoBJAZFKaGmxK5ptoS32PlaEi9eKCo2A5y9U9udPUDIPYLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vFD6FKSmgk3jLQFpWqZllRzrzjFOnCiWATF9H9ooJ8g=;
	b=/Mz9Lnc0sCftKzGloyOpSG1+oN1m66fgeI2Ich334+pRFU28RpcGZ5YjGBMqGc4/zNFBZ/
	D9XCMm1cm0baSMAw==
Date: Thu, 26 Feb 2026 09:55:58 +0100
Subject: [PATCH 5/6] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for
 pinctrl/pinctrl_aon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-5-60832d20ff04@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=1063;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=w3z827DNeO0A917F14eA+A+AUaCDldw+7e7KliQFsKM=;
 b=qWeapWZ/I1Z4vsMJd65W9yTlQAgBPuvKuGZnHBfFz2MKiggvyIj15aHLlWGYdJ3HPJwaHSUgI
 o0hmhsP2MgMCPXahw3KEHaDtjsnDo/TdOx1WD4xfpvy70S1ZPwEQ0Hc
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005611_342938_A4C69359 
X-CRM114-Status: UNSURE (   7.75  )
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

On the -d revision of the bcm2712 the pinctrl differs from the c0
revision. The driver already supports both and distinguishes the two
with the compatible string.

Update the compatible string and reg length to reflect the different
pinctrl.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 7de24d60bcd1a7273ecc4eb814694183bb41c624..cbfc82d884c8268624682e9a49bda1feae34cbed 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -35,3 +35,13 @@ &gio_aon {
 		"PMIC_SCL", // AON_SGPIO_04
 		"PMIC_SDA"; // AON_SGPIO_05
 };
+
+&pinctrl {
+	compatible = "brcm,bcm2712d0-pinctrl";
+	reg = <0x7d504100 0x20>;
+};
+
+&pinctrl_aon {
+	compatible = "brcm,bcm2712d0-aon-pinctrl";
+	reg = <0x7d510700 0x1c>;
+};

-- 
2.47.3


