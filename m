Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96749CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=; b=wp3ZaYJavvm8cP33RFjn7H7kXF
	W/QdYZino3QsD2qQS36/1L2gaMP0+IHyWh5pAHf6k4zRh/vtZqK7UQ00MjHXR9VFEh8f5UEhTwXlq
	8M9knApgG0xicQi028FLVdCXVvOjSdxkqLAqZlnhmcoj52zIC8jT8MdwLyh8yl1zCgXH0yXwYJVS4
	MEZfwqR9XUa91mb+XOLQvEUMjioSvspa0E3N509mu56kfUkcEAVShsZKhhmGnKcuEoZDiB0uGrsr5
	CEsOjchL0Dwg2NihNIXAxtw+onk/X8yCJQ6wWJNfF+wwAy0Y6qE06Oy1Esm39FG8m5FEWFrrPQHKQ
	BMbD8wWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyc-00000004wWq-0qAk;
	Thu, 08 Oct 2026 19:40:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyX-00000004wTU-3cLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so65008575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488420; x=1792093220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=U4+FUZHh2emqAF7XNGNPIM3o7CNKdCrm1vbTFvsX0n1KnlSYspfHbvVbJRUU3v68eR
         VpwAKCguUg+h1S59dS6qGq9iSsK+MC9IP9fEp3G5KSaAOyp9woOOau6rmuoL5xWkdJt6
         3THD6pL8dpE2p1SkuB8P5CPfP6brtyUhP5qzIUH7Or95RFjfe8t54HH2XXtszJ3YZUjq
         KGJgf+0dcRas/V1P4OgpvddVADbU3YuUDWyQhjL9XZqnPHSavo015vLTLIBkoq2JHyuC
         VC51/leBcl9ysOZt/4DZzdsNXVB7nCoRpBOwQmFYuGifLSgL7QJ88PDFQHKpFnCyduk9
         T21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488420; x=1792093220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23uKYxmoySlp6REJxlYJvE+Uk9Vl3V7y8fMNqG3cHos=;
        b=MvxMvXU+s6uljlbtB7vDbwbpYjgLhKZ/3CAGrQPeffDgu34GYIonBI9MMb7TY8FfYA
         KWc+jg/jeC0MNWykIr/KecAn9/m7NLYLvSy3xZ/S/pVMlgADTvIAXaeh6vW4y6WdwWlB
         C9EaveJ2PPVWkKA+H9s2U1qM9OKAwhOr4ehNbiYtxo5ogrNdoNrSrQg0bUHVItHCXhLM
         0pj0Ds67u+97Z48rPZHDALQ+C9o6LnhI7+H2Q+Bkm/fOL2+B4/XYay1NmCwjKrKgklKQ
         RfkhAuUZH1fza5jfs2PJagLje8u/XEcrZGa5YKQeJpu8TRZjJX08mkcu9ITCZKp4oNuL
         6Riw==
X-Forwarded-Encrypted: i=1; AKwUvBxNmTUeklVul4u6ymariXn81LZkTy1kMWnOCd81U0uH2PYIdcO7/Ov8FWC3H5qPZPF9uxr0E6Qm2ejTrZ1Jl8WQ@lists.infradead.org
X-Gm-Message-State: AFuF++k7xCwrnQ6QEbQ5UXIOJ0kV387NxnvzSb4ryvIJV54a6BpJb9A5
	NDiGRYx+F1bkHS03ZIh9rOnakN4DhoF3UD5GkXwXIhIfuhtM2d7Emuuv
X-Gm-Gg: AYBFou3YmtVtz8R7i29TlLFCjkWT4SoxImVrx01dONsBryHw5e3r3AKQlvb9CJqsZJN
	MSy8fncbZyL3Z+jYWERd1Pfhej745g3dv9dP4XDmReH9lrJ/3GsBJs7XBTPY4RWL4/Arspk1VOh
	7Y/RDAu/3UtO6ltQpiIeLDY688S45LOO/H+Db5OznqEvJgAo9GSRXrVtQIf7j6p3IMUkAE1lIo5
	Fws6SE7JwbzTtT/sFHYlhGBalSec8JPNvBlNcjONUT0fAlkYJMCdQSyW1HcNQUV8nGvLh2TdyUh
	cMugwI5ZWTZU5Rsy5t6xRky7YfSDnmMnzUxQDkVbSaKBn8BDKs1CAhxkpgkf1MSc/A8Bef2XfhP
	7N4+uN038mLoQjxAszVzILnxLPtc8sVT19mErIOYMV2D+xR8n2Yed4W56XjwMguP5DnUGyEsMxG
	0SGP6SxJ0w3SGQoZStpkEuaBFn4V8Iu8wp4rSODY7Vay6PbYJGLq9b6BKfjjQqKpzwQM69kwzv/
	NriGfebHN3mvjXW0aO8DBWbt4cczoCMYwNag76ZHgIWekYvlomk/MqdJc6AYl3kAjXEVi8Gubhl
	FeLAVL/3QRChkZ0EIOrhT8G+I8sxMm0JjQ==
X-Received: by 2002:a05:600c:609a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18031130emr114964675e9.12.1791488419663;
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Thu,  8 Oct 2026 21:37:43 +0200
Message-ID: <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124021_948476_6EE5885A 
X-CRM114-Status: GOOD (  11.59  )
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

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Put fsl,imx6ulz before the fsl,imx6ull fallback in the new Variscite
   entries. Leave the existing EVK and BSH compatible order unchanged.

v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ca6778b8777f..d75a08cc11cf 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -945,6 +945,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ulz
+          - const: fsl,imx6ull
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3


