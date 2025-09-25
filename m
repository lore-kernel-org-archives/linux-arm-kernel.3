Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0216CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=di1Qn1dMYtgFxXZEmc2QHL5MDRrtBScA8er1ThtwkQ4=; b=Lj0xIqeQCeNJA9HfH0wHjmr4Mm
	j9/c9NhOnghvg1daSz+jeTcUxG1q2R5RWiXdbbzrGopYjpi0oz7SgYPD2vdXkW/+xJ8CIiotQ0DU0
	GmMxSSfB0Lm/XP6Ti5LjDEcnPpIHHPMAPkO1EX2Puu+tGMvAVeUMXMBbDPnswlmIIiknyVR35/TAG
	zR+L68+wn0s7I2uIWIzvWLgyC5Dj1sKgFVBpeqZ32oWDV6wRHmNsrogoZBu4heFEckXw6racTNY+y
	osYq3hyorj6T9fSzKlbXP38au8SISTaaUIyk8cpyRL0VfOpEd6eh+Mbu4GE1qzr/3QQpauG9euAf3
	p07ldL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sxC-0000000Cuqp-42s1;
	Thu, 25 Sep 2025 20:52:38 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sxA-0000000Cup5-2yBw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:52:38 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cXmBB564Wz9sl7;
	Thu, 25 Sep 2025 22:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758833554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=di1Qn1dMYtgFxXZEmc2QHL5MDRrtBScA8er1ThtwkQ4=;
	b=V3GEiR6KdOTRLLE8u/AJMBWOS7sgqcU4LX2iX/Bqy0WO846bXalIVU3pxWXwlcR9md+8tg
	X2kUQhrNkvuZILmQ7MfQmYdW1HtS8eol2qXZS1JKJJ37rISqiSIAdNZDu1zPxv8lGZWWEu
	w/RwW5lFr5nU2DjhdOzivXCD/mI07YyAht+Eg6p6rrwKZ8RKnclrt2E6b6J/2ORaOyl//w
	nWQWtk7ixcaSwsIhnK9oplPVpj9k2WVoQyhtCG80KZDBeU5AXyNG1omz2MuHOog2McqmiP
	+Z5RMNKIdn+NPxUEOgCPNdw3lTr2mut0oWJkT2YCdLjLipep1qBIGe6DwQNFCQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XH3baMCn;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758833552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=di1Qn1dMYtgFxXZEmc2QHL5MDRrtBScA8er1ThtwkQ4=;
	b=XH3baMCnljKn1CagYckEYHfmAAdIDrXTQLGILz/9UBAVajStTXC3RxtMksTd21PKpsE9j0
	adOeHyG9W15aUAE+R+qldBiVWS3rvkuYO/Z+9Zk54D9mXACI++FJHyu9yFaIaEzLMROkw7
	+UC/ZLjA3d0NwRio0M/2ugt3cNGa2trbasKfdI1C8dCyMA2soCSzUjnOfV6GEmhBJH4FUe
	MIZj2cI/xozEYq84EsGlLk2S28aMBTpT6ta+oP/R/LtUYbcwaA/FVnQCkrUEuddf1cGgxx
	wHHda7MDyNGHQC/ZHUKOI/5fX7kkhMCV4NLuq5W6D7vRlZd554V0E8Te9ys1gQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin Evaluation Kit (EVK)
Date: Thu, 25 Sep 2025 22:51:54 +0200
Message-ID: <20250925205211.171699-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jzfk9accpwdoyrj9oxc6athy3ng1m71p
X-MBO-RS-ID: c5eaf82e82a3ea441d2
X-Rspamd-Queue-Id: 4cXmBB564Wz9sl7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_135236_887186_6B6E316C 
X-CRM114-Status: UNSURE (   9.19  )
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

Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
used to be the Titan EVK.

Note that the SoM used in this EVK is a derivative SoM from Verdin
line of SoMs, an actual i.MX95 Verdin SoM is under development.

[1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Joao Goncalves <joao.goncalves@toradex.com>
Cc: Joao Goncalves <jpaulo.silvagoncalves@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Tim Harvey <tharvey@gateworks.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob, RB from Daniel and Francesco
V3: No change
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..b42240004d81c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1430,6 +1430,7 @@ properties:
           - enum:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
       - description: PHYTEC i.MX 95 FPSC based Boards
-- 
2.51.0


