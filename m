Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C2ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/ucc97rappAXfofoT6AtjICBO6VsnKvFYY8oOP6sCw=; b=NMK/DN2YiNz7AWv29cuYv1G/Ho
	MzeaNCMWBo//svA2HzWuxEKCLppWRyEc/Mu5xBReeMaKOdRdbIZ8pvLHFkPqgdZ9vbiKo4HwiDo+k
	qt5QUrWdlUALutLMivLfbTXBlMLGlqKCE5mnAx81EKHL3GL7G1JIfGNObr6sbR+kgqoSgCfce0VXo
	o0HiN1IPPMA+lYPd4bM8V+5f+0RIh/Am3BBBwWBVKiXndLb0wdRSqjo5ZgOf4HfyHdN3iFfx7F+/a
	tE5VaZ/cJaFLqratRc0aUm+FQ6H8+5tI21DonncMpUcJiTeOEDDJNS5kqs5x3e02MkmJMUWsxpti/
	Wi6MowDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf8Z-00000004SKz-0WWZ;
	Wed, 20 May 2026 11:30:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf8S-00000004SI4-2sAB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:30:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso57153475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276647; x=1779881447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/ucc97rappAXfofoT6AtjICBO6VsnKvFYY8oOP6sCw=;
        b=pjdZ6Z5qjm+9howa9pmf9bXp27P0gdp3QDxyhFEwjxINYO8xxOoFDSWIE8l5nM98al
         FtVuZMlEBpSG1jkKh5JYjDmZqiYMvEWHTtttaA6b0HFqvonEgh/mKT3PNubuxWYhiONF
         xMyrB9zvl6HePBUFUcfNkwxnob836nhjwcAnn3e/iGOKUKDJvihdDihexhJY1iDh6vjt
         K3x9rbYiXSvyj2DGyj5kQ83AgI1f35zcyHD30xkgejgHXRYLvH/dyb271rOfp1e3zrcM
         i5Tqyyr99LS9h3HqLP53iSAdT08F+GlWbkYWeuw2YJjvVa1vjbErgoLYnt74U1DRUfXs
         VLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276647; x=1779881447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m/ucc97rappAXfofoT6AtjICBO6VsnKvFYY8oOP6sCw=;
        b=IF3wCpSk7HjwdDI44hdivtqDLtae1BNSpXe+Jo2H9ySAtzBJJvr9phHazOLb++M3k7
         yBe6qydAgZTgXtWt2eNfnZeuqZsyiywp6iWyIRcdEL53YRQxzxKN20jdOgJKcSxoLWfA
         IfXJoKI6pRconYJ86k+iHMl9U/pY3YrGgv/ANQdmJapJfn8Y8fn+Qi+hG6MmBL0GCEhv
         uIDKm1E0w4ZRsKkvWOGWbS/FZmWkKGEjJS9MIyy0JWBbBQBO4FyBa+AVxyXt39ohd9jz
         5KZQ+TmsH3W2E49RlB9QOaLfF4wCDzD3FwhNPwb0gcf6HMoVT5sPOLC9dWZsVc2L/vaX
         t8fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZELH+A4CZVHt96aMmaPYBN9wRhKEJ+Cu2TkfBBugj36pqc5FQypJ44szLk/MSeUabs08TeUpv+aKhp39tWnCJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEnBlbv3qcoqqvu5Wl8pLO82V0QPotAlykVACVENG9GQgCim0b
	fhi/4wbh4vkmIuYmmeXB+Ikpwa+tnWl1XxKMO816fUrW7Cp9xbzNsaj/
X-Gm-Gg: Acq92OG8YpKl3XIir2iZhhYr7Nmij/u69050AH5drzEn4JtDLewvIDUUK+Tm6kv5Foo
	cHSz6ZpwGQuQyJ0lRMTXgL6OE8hWSYcU2i/KpymPuH2ElTRL/SOCGvaW88+ObG8Orgg3DhJmjun
	e9B+G3nRulSwQwrmMDsYhWWf8OMZvseq0XvdaAN7USNfYRdGG7kui+g2JLS1I71ZvBI/4VTpr2S
	G/aVvW4/gcR2s3z/+HqU7BXy5RFPvfC35kZfY50RVrrd303X1XeixSu4OfqLbQ51aKVrwY/SyFa
	hyq3T6GOPqp7xd1PWyfqyICp2J++YZbvuImgpLobaRhu3y+ITzWPbAtrnNYvWFosRNVQvmBIQxd
	yGB1gsE+qy+Da1s8Uu8eT5jPBU8mBG7jSzLfuzDf80YiunrQQBI2eDSDyPxrN1cfv1ujbQis7Mf
	CyCPyeYx4rm0LOzoWB8/p6hm0o/JL1fl7YVBix1ZVgUPg4iRUa+eWUmvNTQvs/nhbEoGKbTt0pH
	ByYhQKbCV4qEllLH+tkLlgGgQ6BSQk9hVyFQ4aInpwUGyn2dYJOeK4VYjTyCD/+Zv5wGSXhAN3j
	hA==
X-Received: by 2002:a05:600c:a11c:b0:48f:81ea:ebbb with SMTP id 5b1f17b1804b1-48fe60e4ddfmr269535155e9.6.1779276646522;
        Wed, 20 May 2026 04:30:46 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:46 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 20 May 2026 13:30:32 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Aquila iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add-aquila-imx95-v2-1-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
In-Reply-To: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_043048_746251_11E0DB64 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0


