Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA995E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOmq4oIh50CVOlYgICncz5bv3GLxzZaAhwh07HpubHg=; b=SMS1kRfj+IgEx4uFxHkkz1/36t
	9fika92B7jDu+voLpJRngPuvYu1lhkoY6jNLRRPOm8/DhMElZqFXOY25b+ulfnEWLNWN0ZM5egbdJ
	E93vyW4UWSsNxuQEkHC5h87E/ITkliGDSNVRJ+hJEEcHXKacN9G/IVcCtOcZi0WaWnKVF4goUqCEy
	G0C+Dh21+AhgigVpuZiijwNdoExFPwYAb3VpWgsQA+sBHgVc9CgphHx+8GyIVsQdKER9us1+lcmzJ
	nouDABiDEJ+XmE/bCZUtZtx6vGl9THJ4/wmjri89yhU71YUm8tn6HhXYSejoKir5iequfLA+YLxqH
	zN5qiXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYe-00000009sDH-1u22;
	Wed, 18 Feb 2026 13:25:36 +0000
Received: from mail.fris.de ([116.203.77.234] helo=mail2.fris.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshYX-00000009s7E-04vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:25:30 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771421127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOmq4oIh50CVOlYgICncz5bv3GLxzZaAhwh07HpubHg=;
	b=Ud6sNglDE/M4quzvkVUl9ctLNQQRyC3b0bqyX1JCEJ5NbvOUOehiskILyFIUaOWIQ3TZTg
	GUjlqfdQicx5qhIkCpfvzTqtw6wlkPNae2hUYzPKCufT6q2xTN/IyWzQOrRYdKZ7EdlDPF
	m8lhc/VASPWqlC5ArDnvPus7ZjXEk+zCr029tGYn9DEj2cJ2mgH7GivDq+l9fc9zJUAqzi
	kUSQ4h7ITbfUAG6/o39r9rA2a8XvF8EZwNroagMVM0SR+jvjzdBKTJpRdgZmkfIk4aqs0y
	2WoVxLn8D6kFyMgtgRblRQngADzf8sM9JbfvP3HkC5uT1wX7ZwgAj7o3XgoAzg==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
Date: Wed, 18 Feb 2026 14:25:07 +0100
Message-ID: <20260218132519.74570-4-frieder@fris.de>
In-Reply-To: <20260218132519.74570-1-frieder@fris.de>
References: <20260218132519.74570-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052529_213649_B7953F5A 
X-CRM114-Status: GOOD (  11.80  )
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

From: Annette Kobou <annette.kobou@kontron.de>

The PMIC provides a level-shifter for the I2C lines to the RTC.
As the level shifter needs to be enabled before the RTC can be
accessed, we need to make sure that the PMIC driver is probed
first.

As the PMIC also provides the supply voltage for the RTC through
the 3.3V regulator, we can simply express this in the DT to
create the required dependency.

This fixes sporadic boot hangs that occurred when the RTC was
accessed before the level-shifter was enabled.

Fixes: 946ab10e3f40f ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Annette Kobou <annette.kobou@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index b97bfeb1c30f8..bc1a261bb000e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -330,6 +330,12 @@ rv3028: rtc@52 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_rtc>;
 		interrupts-extended = <&gpio3 24 IRQ_TYPE_LEVEL_LOW>;
+		/*
+		 * While specifying the vdd-supply is normally not strictly necessary,
+		 * here it also makes sure that the PMIC driver enables the level-
+		 * shifter for the RTC before the RTC is probed.
+		 */
+		vdd-supply = <&reg_vdd_3v3>;
 	};
 };
 
-- 
2.52.0


