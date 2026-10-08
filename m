Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D398CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=; b=PKokubHMIV9L5IQ8R8iYHbupqW
	UqNnjumeIzjpd/BlsoyyHQF3+esNI04cThBDPhjhY8Iw6hXdhf9z5g3zc1Oo99ss/RxRJJtRox6mE
	nQP9HZCabGv1y5GDdPE56cWrQbKWz/Ag+nrzJAapycLdTT7E0QkB59OWmc3T5NlEToZuMlrkpITvm
	NB3UNeot5WbeYDisXCa3lm+8g3y+5NRg3QZrG3KHzNjNrU5hGjuwvu3TsJ/62e4NGO5NB7Hl1DPz/
	iW0XYlAQc6MFpiYSXM/MxFb663LPiuveE/brJtzNv96eRPLwI9U9ZRWkEy35+KViBj00ul8AuRvb2
	CL7vRSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyX-00000004wTq-3Zzc;
	Thu, 08 Oct 2026 19:40:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyU-00000004wST-0XlU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso51394455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488416; x=1792093216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=fqKxgJzZTco3EKLSLPTGCXPYyBBT6Xy0AK7aKK86qJIOavcLeYjKUWQEomcaQGum4i
         t3CRaExe12xkMXVO7unmKVp8hXvVaEHJEoM26KGtpYFjKH4vJnXtoCgNtLNFuxNQS4Vb
         Zla24EPlramM7nJqLIvWNCEa7ob2cffil3+8VVoOSNI910XG8gd4BGxpq9P4mCgoaQJt
         5YvYa/rWdSG0nwHsr13yhPYZu2UBnGtWoNcdjewJduzmW7DAUyo0Ub6hF2SCbyFH0ebY
         /I67vHzVUMdezoUg+lRtYP278z4+aPDAc5MZkE2c3RR8h3mgHQOQF9yfZXcTmllW6Jxl
         YGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488416; x=1792093216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=YDkim4RzBKCcDNDd16UF7iHCIhZk8cO94mnjW9bg4/OQnxW1UzI64qoew9ErSlrzf6
         vvkF4WAASvCGLx6dejTR8Z7lZ0XluaOSmT7i1+WMOTXoVtHFsyGCBWXZSs39V6MDu61P
         +OEUwH0e6Y+lzGWHooqbfyNNzAQFYUffm3YPoiT0RiiaTMzd8VpyjRqB++mnfV/cAbiV
         59ZTUcNCv8xnRMnWtXDOW8KSohVTxEQ5hhxm8kpApcAGEXNO6uh+jOI31x0kzCDF4HXe
         W5XN9hZZmdusvDt80nI7D3CcGymkVZBUqRICqvkk1fhMymWTNFAPZiDLJJdcTnjxAuBG
         iz0A==
X-Forwarded-Encrypted: i=1; AKwUvBw5VrnyE49nk2bug25Sn+NbbyjHKR9lnBjC8Q8OYSIADO7ZQbB7E7OUxSCsJ0ezieDTjvvxsz8xgLQmWaotTc2R@lists.infradead.org
X-Gm-Message-State: AFuF++nbIdKCD8k62rtO/feoVxC70+2+i/1NIL2zAy/t8KTMVsrtcLyK
	T2Ftc8qiyH7x5F+sHgBYolDhPlm3U15oQz4m+/FT/Q8rwcUOZlrBNZRl
X-Gm-Gg: AYBFou2lyYgTZ5rPmRRbZETJrHHP/rsCeL0hascdc6XahZzewFVVz6oQPzhmCDb8yUl
	zqQFxAryPnMu2AUKLNpZvbWAPAkLKzQKFOdakrUOlUF33W8rllD7CpufVD+0MNX6zpZd8vcOVC0
	VaL6iT+VbMSCzME+pBQvy7XWNTMeu3L1zjrT0IDbnZfA7S7K1kEJX0iRnqN0vCeJlNeGJX6kkf+
	urF5/ZPIVy7rigBMVsbnbbW8ddAmY8Zswz0LMEBL08piPH8yeXRn0y9fbF5lQZy98r/JEed7C5m
	MiR1cbxGADYNmGYwSkliQTEF6C6pcnz9yhzgAvwj4GVLt0+tg4QuFNYyKeN4vH/3DvgaUTD9wgk
	UjkDGpELbBo3EMlZwoHN6YwrfO5/jAQ+gS0mICFrY95LRbq1IThMygYPc2bNo95g/hZnUPeO4pn
	xfjwBRRoFt2n94L3qE5VxTSGcwJaYrGJF01FXYDZox+0RCd7qc8I+hHLfQVgadOrHIwGC3HQ/8E
	qnaIKkuak72lhxLN8UaqzNPwMkFT5ccM00x36RDlKqZbzO8YU57AmT0ZrFskZLtba+7kEW3AbKY
	vhPtnuPXK8T9Kbf+OPVyuQ==
X-Received: by 2002:a05:600c:8b09:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a180682d24mr123505435e9.34.1791488415898;
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
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
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Thu,  8 Oct 2026 21:37:41 +0200
Message-ID: <4ea26fb755799e279e195b3f8b8669c394a7f7b1.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124018_203768_AAB1BA8D 
X-CRM114-Status: GOOD (  11.38  )
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..f044f6fce51f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -689,9 +689,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3


