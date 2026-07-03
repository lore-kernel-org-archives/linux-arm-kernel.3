Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=; b=zEflHW6rvWd/QHOFAsOGO+l9em
	HBfP0VrT4irV3a1yC50kyX6DvfoUSqB+k82Raf8YYDcScXJwKOKrFbrBz/LajJFXB6Hiyw04lOC8Q
	exKWtWbngOJ1oDj4xQpqyZvY2xQujpR1pNMGjyxPi7d85XmfgTZRAmFQolptbGK5HhQ+fjJVtWn2I
	K4bWrWY9cJdb/v68uWGOiwlve+pjdahUfRJyQ1iNpMe8jeMz7jIvGGPLItJlowuDgFM4yRQLU+/a3
	XNmweRMSn+E3QHmxRE4I+zeDcl5qSCIrskEN+DuKXauI6k4H+rVQfPV7gtCGNQEFvZEoeF0pHWIDr
	pLxMeDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffDY-00000007Jpb-2oqk;
	Fri, 03 Jul 2026 14:50:12 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffDW-00000007Jon-1efS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:50:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47488efcf30so436518f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783090208; x=1783695008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=JncYAhhiSDZbx5zMfX65BtxE/rUOelYXZix20BwHh79sKUb7z5AEZjaupvuJfS9gxx
         +XcwIJiGfINVupFa/DtvAxMKe5Mj9awutpsMvzv2bqEiFGuts7V/6owXZTmN8oKk1ZiW
         eAfXLReQWG/3YVsq5ob5Xu1XPLyMmTeNpR0skOnjKj27qEx2piomBcBw5o2puNUb4rN2
         Q5rSqMylRpD6VZFy58T6kSOb7HMvNqS39WFCKDVJe85vgYazNNWFFf6H11sO1NVbLRCO
         Am6ZvHjRxIsCNiERVpMaJ40vOuFcvBjTP28OyqBrKRYFyJyLX0cLHTrYmaJwfeyLb0oh
         npyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090208; x=1783695008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv5c3aAX22MotkI1huu0Usc8fAYg0ktXennCOkB+608=;
        b=XureS0kV5Q3YJua5WYVw7oAL3Kn1tLO1+edhn3a5C5+DZapix7fcsBeJn3ZUDGgY55
         y249ug0CDi9pJBdrH3RYcL3IqvrqCqR7xgQPPVU1qtWA4g1gSJwwVsdLm14Ry5xfJzRe
         PHx4fxlqPqjLva22UhR3ctlmP4LAXYjGPTj5cb6klKNhfsLI5DmLFFnIVpc5EOHCiUE9
         SoYMnzo72LuvKieDK/bKYYSDgTXCu7+kiCorwOCX7CcTYwgV/ECV+qf9B7xxaNtkf/Iy
         MSKJx/925G6NUozsfSElPI85EBc0ByElH9wAvxn12YNmDamRGs4+/9wpB/2ICAlCDpJc
         89iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAYT3FuCICz1BHaLiKAXSSY5Ka77r+MGUfvBYUxsKLYunkVTcrGH7sYAOfKwdJxIcRJ0dcA7362M0ly9GgHQ3J@lists.infradead.org
X-Gm-Message-State: AOJu0YyKl2tT90MKIoe+hEeQLrvqRbhbaBvzj0UfWOfZhMpNa+5oufZo
	CGMuLG0eJcarqVwa+oaMlReLHJfkB/BQXkTfRknnlNKSeOKnveeUKkQD
X-Gm-Gg: AfdE7cm7AfVLF7p57uRTP8U2c7sMxMHq71CH3LedvoNKtJTVn6jeF+MHc1xkhW06ajS
	dxQZ9wBVAf7izn6ArdLHnki69C5oROOqU++YFd28xTRuBEBd3QOzD87YXO3HQ2lWJA2i5BbIU0f
	B5jG6G9iQ8HYZn0FQea9JfGS9xgKw2aqcXRzYvCgQnY4ebGiAAbuXOeENZbsOg/9jjJZMLq1tSA
	/Am5hh/A2awSYMejOqbzmYgFt1OYHLP7rNdXUYZL8ZM2gXfLx3KyJ4Ll+vp8c4T02/puzGy0mLv
	ZQS5sQSH28lGbiz5yZfEi/wsEbhXM6IRyXY2TwulrBPICUzao7/BRD0X8iBLDB2QW1WJFj7LKI9
	e/OyhdgCeqXCWYdzz6j8/LV/rDktVH/c1l3sVz+kSCewB8hn3R9N/Woqvijv9T+bvO++xN42yIj
	z33HlesL5OqadakEuwaRHNQ81dy5lIKevCnfj68s8g/uleI9FNYJAsVJTHDN/1Jebl8WOpI61Aa
	PGyfRveBSGMnleddNMSB1L9e/I=
X-Received: by 2002:a5d:5f42:0:b0:46b:cab9:f697 with SMTP id ffacd0b85a97d-47758bca818mr13901139f8f.24.1783090208322;
        Fri, 03 Jul 2026 07:50:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4ad4sm20087616f8f.11.2026.07.03.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:50:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 16:49:22 +0200
Message-ID: <20260703144922.231608-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_075010_460783_DEE3DDDB 
X-CRM114-Status: GOOD (  10.28  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC block control node on the DART-MX95 SoM.

This is required for the NETC Ethernet ports to be enabled and used.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..174ded589d6f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
-- 
2.47.3


