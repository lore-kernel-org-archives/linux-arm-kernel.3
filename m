Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41286C79FB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=; b=L4ciSU+XslbIFfyVAgp4O//zKF
	X/Wp4aLeRtgsM1WukWPTWgVdmZEP4EJQbgSoU0tB3DSrWqWwmMb2UFetTaR8436cnyAWN63eFHtiO
	S3cgKpZJuzvOH9zHv0SO3PC2qs22pc0AMvFb1pyhBTwv62iAPhC+BNZsfF1eJSRTcLu6aZw+g57cQ
	kuaqo40uPVdlT40AG4ElhhACv4D0vDWNytfobBCjtRtX8fLj41otcG32FnGHwscXF8yyzK51bS2kX
	aDuEwbM8eAy+75MHtkWL7i35bxRWipaF36DsY8+lSZDbjRbZhqR7HrJY6mEFoRDFw6HCwbCzPjtNP
	UbJwYUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGH-00000009Bdn-3hzV;
	Tue, 08 Sep 2026 13:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3wGC-00000009Baz-0vxY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=; b=ZH8WuJSKhrPYso1PstgucETWWg
	2Vs+QQcvCimq3Im/B2qy55g8DlFxdAREOFzCzHwoY9YAgb7Z7SdqLZuf/iGtX7gzQFGX0lZqjzYxw
	Zd9DEqlQom3RFneOCR5/LMtovuuZQiV1jhRPvb+OksoULa2frSJjOtl3FX67TihcIXxOxdGirR+B2
	qt08bEeQHYPKXeafkUkwdxYdLeymzkBWAxzhk4jX1PltD/YMqy6cKSKQnmxsJxX6fWTg5BtnXxrwh
	YLnQSzxlauvb6uORwMw9a+cSsbTP9NxcVgzBB/+JEZE0txH9VXABxvhzPvVbL8HrgP2qa+Y+0STCU
	Dl2qEh8w==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3wG8-0000000HUeI-07yX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:53:15 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1788875589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6S6dPizeTTA5G9J/3AscJ1/w+xNcAj+7ZW10z8lG2o=;
	b=woFMSLeAghhxAzZ6H71b75YnVKqS6FHDCQYI9AjrOOloWvDolEzuufaXfTySFCNYUd/Bdu
	uCZjCJRGqhrXBg1wrqovDZegUuUHajFlH23pzbUAcVJBorwBSWLlVCFq3WwKJrpP1fQ9uf
	Sk1cAKoJPHhDj4ir2Q8yvDFumDHrHU1VR/ik655D1m3rUGo+7fTtoIQaxUV90cODrizlVK
	0iLxS28peLIOtPjb7PYZHUZ0IW3EFp58suLUS4GEYIZJ3HRNftO2PbdonneVwtDNhgWxuE
	MvPETE+jo40AhsoIPD1vmdDdNY5IsBSe0pfmNGTQWpk+xMK+bU+N9s9dh4fb+A==
Date: Tue, 08 Sep 2026 15:51:50 +0200
Subject: [PATCH 3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID
 pin configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-3-4d0e8a75db79@kontron.de>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Oualid Derouiche <oualid.derouiche@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=iCuZlno55Yjn0MkpffeLuEkr+4wHGhog/vQ/6EFeyBM=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWuBsFOl8dqEt1/mTc+6FBC4OljVTXHnkymXRG8/Tm3r+
 JyVevtTRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETcjBgZ7rGpqvXytFdeOPjz
 r/eqKm61R57fmn21jTRncMy5U/frOcNvlu/vPBdVidvnLHBNvGSxcWHhueUil8/z7DhTuXzXmkP
 8XAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_145312_304352_B9E149A3 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Oualid Derouiche <oualid.derouiche@kontron.de>

Add the missing MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID pinmux entry so
the USB OTG ID pin is correctly routed and OTG can be used.

Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 65c5f4450c36..0658584c9f11 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -357,6 +357,7 @@ MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 
 	pinctrl_usbotg1: usbotg1grp {
 		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
 			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0x1b0b0
 		>;
 	};

-- 
2.55.0


