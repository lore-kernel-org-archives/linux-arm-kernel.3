Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D7ACA9ED6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=; b=kCaYyzhoeWI9zYZ+iVUYsna/4a
	hoeN6bmWI74xy+whdpsiaQGLhfmSWsVXCx2jcXMWsErbOkMlNUkbiZeKD8ZL9+Dkynp1zZL/XQAoo
	g5uVXe4ZfFHabSz7c8IhzuDBjKevwajhZOiv7Gkpi+RG9wlyEUOFA/+HQl5fgqOl9tyTnZ+TSbCeb
	d9WpAIDmgBMArUu7PfCc9CxsaSRJhKyrDWntFGumb9s6Yqbve1aQwI8r96mG/ERFB6H0CPQ2Wx8Y9
	MJmcMbaz+LdzQ0/H2E+zwJVYHRC9UAl8meUHNkTgdUFn0LHzaoTLh8x4yJ9vSpCnnNDSUnjQOvcrQ
	qPplMWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZI-00000009jrI-0tZ7;
	Mon, 12 Oct 2026 06:31:28 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZD-00000009jnU-2fQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:31:27 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AB440200873;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=bsX3X1UugO7MVUGGjtlWOAo9WLj/IjNMRKkykNkzWEhnHxwuozekinpWsURNkOYFIRugW/
	g0IWKEGRErxzfocrKJR8B8kbAJcpfvKVZZEb462nEBsanfXz8u7R8L4DMJG+thRuv5MR7Q
	I7VPlskh6TYBrM9wm+K9V+zKH4Lu7W7TM4RwPV2fJ2/YaPuZ6zTXZbmaRyX8xxlnGsT+X+
	8zN9Ia3uDD4lOvdSvO4IGNDdT+8qd/ADHYPZD8rhD6IqBqx12/UeD9w8/LDdiRBgzbJNwr
	+FQQB1uHUMXXJfmLnux2vJd0NueAHeYRyAHBGxiYUXbTKW4W+yKKz3oKTfR0dw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786679; a=rsa-sha256;
	cv=none;
	b=VoBo1IQY9+CdR34kE0NM77gARDMyM+SpSbhUS+BOp0vxPlmCWxGJSn9NcYLTL6mednhMJM
	E+1+8cpDu4ENQGUu4vT0nvxXKSfCUA0Hcza41g67SUXqk8+uOaxVBR6VRiUwElw6MmWYvQ
	vdZyokFwNHdwHYJEAm4XVaL4ibkp2CVoWXP+38dTIGe73ZD+RKUMtDUNodkw8QDQO/K9M9
	73EK7DLv+s9NUPJ2CbZJp0IQ/rbQWvbyMPlLb4uJMHcuqyKQxzqkH93vqyfrKMN4TMaUcq
	fbyrtK8DZTnGr1Ogx7PGku1bRw8O8EhnuDPKwQL8hNGhQbFNPm40L/b2CqRTug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=eijU7suQCQNxtaZOHQfSxHuQmBv9nWsc7bHlsHP3INtAUPhk0TXqnrpP66CeRSVkLg5M6j
	TFZ6y/D2JVPiyyUI52l0RgN+f2jjY+1lW1r3Yaa4rxK5VTFYo4VwsbjlOcZl1Qdu7aP4O5
	v+lRtehUC3c1KOB9hpqQFnfbIdz1d3V8ZrCqTe4B2upbf9kxt2lcwN2FnX0deiFCnSMDOC
	M42sl7qFKyt95r2SbuN98DZaYJ5NaLgYukq2LFlUdw/x//cQg+WWdCwgVBjfuf8holEtRw
	uOTYBZ567YcRMIsamLtHlX0P7w1kmp9pf//vdXW9DfGKHlPRKeITL2Q+nUYKWg==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:31 +0200
Subject: [PATCH v10 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-2-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum3O3xj5458sVVu2z7731dxpe/ZdEN/p965I5pxl8
 vq29SviO0pZGMS4GGTFFFlUFlbwiXp88IycJsIFM4eVCWQIAxenAEzEspGR4etxhizF3S+LLkVl
 P5a4x5Nb/i/lsenTLXUWDfZFqxpZ5Rj+e7BEL/iXcuPGrOMC6v/Ml5daXO+Z63FDbEXL9AIJ876
 FjAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233124_111789_35890521 
X-CRM114-Status: UNSURE (   8.13  )
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

Add a compatible for all revC-based Skov boards with a touch panel.

Also, in preparation for adding a new device tree variant with a
different 7" panel than the already mainline ones, also describe that DT
compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805bc..3ff8cd69b0830 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1153,8 +1153,10 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0


