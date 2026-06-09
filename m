Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5517FCD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=; b=mquYVDuybsxvFH9IwxoxOsILE8
	eSNdlBILD2A+en8l5NTxloiIvTiKeiCfzA3LW0GTX5E0G/wHZvPI9nVpXSCu1kyLly6fJuvo1pPS3
	i9MxOTVOPf7MepR3w6+j1jwxHIv7IjFIEVMjQtjv/EsymsrhWGLe/cHuMjIaAocDKAyZuGbxU0ZO4
	20aj8o4Pcnf+aSD4sQuehVGdokW07q1IIbvVbHGzle1xS/kO41GKmBVkZFXo14ui8Yeoa7ZE5vt/a
	hCNyMt4FBVwsJhmYjtA6HzIIbmp/edA0k3jsjrHvhSOKBPheBicLQbR1AdhnJbcST+pj1GUMmt9WJ
	OpzM0rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsO8-000000058ow-2ZZK;
	Tue, 09 Jun 2026 09:04:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsO5-000000058n6-1SCG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:04:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4602e2a0372so3770455f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995883; x=1781600683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=E4ygCLoo4JYJzQhntg/xFOsZvxKmFLtr89q5uEximiHI2cc7QzKIbxsF4l58yu1JeJ
         zCoEQMvzAFb7oz7Fxc0PcvdqNadxyPNz5tPg8t0seuREuxMal8Le41Z1Pgn4EGsYUCM8
         OMxSuUvZivOftFLy8NmzA8/l/U4UVSI8e0jPpECTXh71vHjAtk3FV97riDedikkjqtLo
         fNKo5oRhRV7mQISyPEaeY1sudn9unQE/bbvV+Pr6/zwxgT8WkNSuOYnyp0VoShl/xHCq
         2fkbdXJdrHNwt3RD/3/V5g9sWXUQbJG6f5DAlJOtqRItc8X08DGBT8KM1bdkBgkYsEzS
         74sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995883; x=1781600683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=Vs/hK9HO6kTezrmGnr5pTKD6HlaACbtPaxUBszozE3kSHR70gUCgEeei1ZBL0SVUND
         oL0MHtscJ/Vf9hEo+8J3Z6giDqQlYpeIXWIMarS06HXetz9ivri3FYz+z5cxNbCCdfxG
         qP91go7AYe1R/WqsxAsaXzFdBuFivfk0dRLB1WFUS5fSCsHs2ig7O63xDjUNn82Iy2IY
         edPmu2ybIHV9fuSvAwUjQzAslG4Kg9EoW5KPNIvFypE23v8fjOaW4BOLnVQS6tt57H6f
         QG65FB6R49kp1DOnQfEpNg6TcBqn459Tne8JjKcXk3xzLIJsYgw2ZyEvES32n/dJl9kU
         iQuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wT/v0Cb2nQIt5LZzioyjewL8Up07C6RoNt/cgSVHda9BmJyf7FKURDIXPCtNTp36nwdkdKNeUvyIFGNIW1RIW@lists.infradead.org
X-Gm-Message-State: AOJu0YxisMLRs4MDf8t0sTe95lrV+mnFq80M49wlCQTtzY+7fJqclbg2
	WNqzgP0IwDGSOv9JWaQ9YEkpOmHWNa3K66Oauni5UQsmzW5k6nuXFivq
X-Gm-Gg: Acq92OFnrNvyg6SapGKyDrW+EBsKeiZ7tRQ9WwRW8obERBLcaW6QvO9+bZwC4wYc6Ll
	JHMpjpB0HouoMmhnMl8VYjD1aPAXwkwADqvMUEt4+3s7we/AIktEvENhot0N49XXleQ66gpF3HB
	C5lT50MTgHwVB+hvV3Xa1RPPtsd+SIieksvZzVcRDhKmfifoDEX5HquLUmZya2uEl5RHdXoAEdZ
	1v6cw9wV1KCivZgJyT/TwV4Vg8TYivWN9WTZLtsAMplLTeEl2yzqFBcSWZdO5D8vFZCbIGV91Hq
	37ViqX+zV/oat9i9y94Mi9f4U91lwFnzG+HOSJvsY0YTW6rpz50ivudu7Bpw3+rMnmrOTNq7BBd
	9OJboBO7nbGfH4cnIzrd8/9vkVfvXLzGB4d8nLQfOW+dWTsewT6fuY1Rag7aLcqGRshnLkr8Zn2
	xg7KmUgOwEpggHTeaPdVZj/A+rKz5+/sY6N3zUGf/BBha4OiBM4YYU5U1mI3keKPtTKjIGPjJqc
	97zG40wMDWIzlTF2q3f7o5eNs774ArSJ5VzHqi9uz/4gET6
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr24408982f8f.8.1780995883449;
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:04:36 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995737.git.stefano.r@variscite.com>
References: <cover.1780995737.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020445_399408_409DD7F4 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


