Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82ABFC591D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxCyaKGbO7qKGmJUpdCDgIba5zwokOPKukSgwua31ww=; b=AKHC451KxYAppOnExo2tu5SSVt
	+a6LkZK+jp/Xnoy7KfWc3taoyApE39ez34waufevyjJs6DfzW3CcjGK/Rx4HAXmNIwsOKy2CCtUsx
	sq8sPfS8Upcm16KkIDhzNcXrXKi3A3N8BLTRY65HzqaNGoQdnoir/x+458g+yF1WYK3e+rooa/tTW
	a8e67lzhfCOH/nnKdmsXDV+mKfm6yYcnCkSuB+a019rUj/IyzAGL9xxI8B0+WCVjRjT14FPzy3ZLR
	5cKf0HjmE5PV437U+zATEBEjaU0GqT74oA3Reelm3jo/osZR2HOOiu+5x8xULUeI28L8a25KTyUsW
	Ophb1tHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAY-00000005j3w-340q;
	Thu, 26 Feb 2026 08:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAL-00000005ixN-1MQS;
	Thu, 26 Feb 2026 08:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QxCyaKGbO7qKGmJUpdCDgIba5zwokOPKukSgwua31ww=; b=o72Uumna5+LKd8xN0eStZYUD+2
	c9We3blW2AlTwEVmPUsyErjAIM8Eo3gaBMd2e4+z0mguR8TZkQujIHppQRJoXGhPnXsLwAO2/qBpu
	tDMNNAX/kMlOERu7LGtrZ9JC4oiQTzDQj6lFCekjOBWtdh/Om+q7AoiyL4F0LnJbjbDnnFSF8bis+
	1PG0wfmQcTrHZxOF6644LOgM75g8GR+hMUF8p2q9JpO5uP7SpSapf2MQuRw2Qgi+dwWE98lGfi6vv
	RqBxagU4U171vDuWxHXPQWC3a8gMHyIMpCaPHtA2x7iCftt15dI4pwlHp4XiuBmZ349svbOmJoT1m
	FU+/KRWg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXAI-0000000AYZU-1pBf;
	Thu, 26 Feb 2026 08:56:12 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxCyaKGbO7qKGmJUpdCDgIba5zwokOPKukSgwua31ww=;
	b=ygROqrKJGQKcq9todpeKR+v8pMsMa7fm6cCmSNXupi0PgOMzB+YYqgJiHCFRznHJ5mKu47
	05ABlyg5MiJWiClC/BuQXGTq+0V0MJrDh/g0cM8xUGlBLXN26H3DFBR0Ws3GyQiBr+LKEb
	WQm5Wy4gu6INWq9ZkfXUujBdXEfggcLF285ie+XlTInfhVMKefQ7VOmJ4m/0LgCVgIYR+N
	5R+9oJfYyp7hsCIjP0p4I4w6Ucb6JDZJhYbZ01kOqY4ZLHucWP4gXmUhuyc2l3TlvhmsMF
	ekCtMfZtZUYBumLizHh5aWJQdVMi+uSRfHKJbj5SXBBKdUGy65J/2yDHHTo1bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772096165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxCyaKGbO7qKGmJUpdCDgIba5zwokOPKukSgwua31ww=;
	b=7t7agoXRw7IGjJsRzH8WoDl3uLiRusEr9I4XOxaW284bLMGbayDgIiFaXQCA0MKvi1lWoV
	h+vwuAOqzTJlcCDA==
Date: Thu, 26 Feb 2026 09:55:59 +0100
Subject: [PATCH 6/6] arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10
 interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-raspi-dts-updates-v1-6-60832d20ff04@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096163; l=786;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=6tRqBxilIYg4wBv0Dwu6Hv/aJ7I7wHLa87Kpm5gGxDk=;
 b=74JDTvr7v5qK+i79D05BHwKGV5ms1OWuVl450PkUal/aTzJ4zrSNj2ZSVMIOzGaGK6APmCeQQ
 Md296gkG8riDNEpHFQDOsv2Sx/PWT5AIAFYAz1iWrqHnJDKQz8TYnax
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_085610_728582_CD41F534 
X-CRM114-Status: UNSURE (   7.01  )
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

On the -d revision of bcm2712 the uart interrupt is on 120. Update it
accordingly.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index cbfc82d884c8268624682e9a49bda1feae34cbed..127be0fc27c22e73b0cfdbfb89963cd3edf7594a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -45,3 +45,7 @@ &pinctrl_aon {
 	compatible = "brcm,bcm2712d0-aon-pinctrl";
 	reg = <0x7d510700 0x1c>;
 };
+
+&uart10 {
+	interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+};

-- 
2.47.3


