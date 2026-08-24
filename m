Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E7C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=; b=nDGgix+dJuL78u5t6PUX31WzH/
	ppMoq6y9BSL3rFFcW4YWjPPp50Pe3ijUO1pPe+jKTPHZqxRc76bXCTRnvqzVaxoWli1u4tMFuy4I7
	UG/jfsD7O8BK/4oXf84HEw24rXBpam90RcRg3AmZRv4ShAzAoHSGEokUxUX7hg7QuB9YsxLoDW7Z+
	dR/UTnGZdX0GuFG3O5BdrvbBtMD6ck+v1SDdxWCXjKWW+63T5ID0itJKHP15Pp0beZXWVmnAcBucH
	favZzOTZ0pgjWFfCovj5QzRODI0foodwJim2YGV/+mwa4r6D7lo50JjGxu4M3/KPrcnDrlfBQmWSv
	+SrU8KZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWI5-0000000Gs04-39BG;
	Mon, 24 Aug 2026 15:08:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWI1-0000000Gry8-0n6Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 15:08:47 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c15e592da74so501358466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584123; x=1788188923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=bVx1ccaoMKcavj8RTTRzIWlqIpeDcp8uIoWmk94AQX/bzF+OnKtaCs9DOBqnSrDiGE
         eyFPksoQ8lbfO6aAjNYPizJTdbdT8ITLauN06dk+VwBymOLmGX9OfznNda+3O/8okML+
         haw8fy3d8csVcj8QLMSKIbrHsctlsFWYddpznRI2T5JphT6zl3eQarD/khp/8JUoX3eX
         lqbKZpAuJOO6Q3Y68kAzq+izsOkFnjWchcq20v8Z6mmcHDskbsFco307TB/hudfuAlh6
         dAa1RdDo/mvzmMaevzpKlsl4unUpUM+BzBsY+bu2DEWOccQL9zMhPUT7ztrJ5sIC/HXv
         9KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584123; x=1788188923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ik5aO5/nHcby7+rYjiLPtw+6IFCuHvPcelwFb5FW4U=;
        b=MOfg096cBEwo7bV5rPgf1Izb1qiIRuW1OE8YBQ0lQxwKAAutyeGwedO9QsIEDeFilk
         hAWco4mkPVBSofbm1h3tZotCjDcvBKpbHZw/bio7/bhn/CBbY4dNcUki6n6mESonJ0m1
         dbPYdI30YILNGp79ra+OPf538yvabBODMIuK5GVruj06v6oesyZVOXMpAnrlUmimDXyQ
         eRzsYfx0ZIMmFbe6RnyIlvuk47rW/cEPIuOStRE7mVE39y6sqzU5QVvlUNt6nkIlLimm
         LEr0pkIifb2Vs8ngm9qThxtLyfkWc1EeXkDFL42+t5w1bdiZ0RihMcgUEcWnpyGbngpM
         sU3w==
X-Forwarded-Encrypted: i=1; AHgh+RqixEMkFPwb6Aj7GSHqf0xwX1axwcugYnr3DC7RP1s3aJDKX9hZGVtVtUjt7VIb31wMtys4eJd5dtGsdtiC6tfa@lists.infradead.org
X-Gm-Message-State: AFuF++lGPQqHk33Gx2Ph4M+2CxpEoBIx4Y4YNlxrVUaPftzmAM4gB+iJ
	oPIZyLc/XAv3fEMNNCWHklvZvprPw+FhkHxSoUkpcna79BHojwjn89QZ
X-Gm-Gg: AR+sD132IRtG6BXyUrXV/Uim+KyQEHkDC8nHVoLCFsi4M6h/t1zn9ADkx1qlgLvTtci
	o13mETQjociT6C2a/mqlxN24CjKxKfdWqGxETMEwUY8kbI03Xey830jkl0gkj+rEpOEnK4JUygw
	zUq0zkO8YKZowjV2atNVAGBr/bl3e9XLeFURyq4Ru9L8JvzabOdO/xn68hQuzqZdBn+6nWmKB5V
	oXm2PjK9kbOf2vJpMGcqRShMrtVW//hKHzHBQlWf4rsILge066EQAc1TZLfLh5gR21E9PrRl+qJ
	0U3vfRGrQIUQKS//SdyoLJtVLdcKbqO5Uiyu1G0fxTqL6yVSM2hLn2vFUN8MfDHZ7bOwnqt+F5c
	/6gjJXL1lTUGfNhiKospvOcRHifX4Burkpca+QeMAMewGDHDjYJE6O/jRTIGLIf1wcO/8UgB++g
	zALFT6NubiMkzf/qBytIvQMx4/ZGTChXDq3YaR3SwtsT9RR181eqvDFSw+twkFq01qj8H/lpToB
	uhAwseRgRUzmVw1478bCZFYng==
X-Received: by 2002:a17:906:f59b:b0:c20:7cb1:9046 with SMTP id a640c23a62f3a-c24924b7508mr2126766866b.8.1787584123091;
        Mon, 24 Aug 2026 08:08:43 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 17:08:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787583584.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787583584.git.stefano.r@variscite.com>
References: <cover.1787583584.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_080846_432925_E19DCEC5 
X-CRM114-Status: GOOD (  10.15  )
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

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3


