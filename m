Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9813EC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=; b=43ehTNjL00HpjGsQQOKIao9EXt
	4aVrXycthxk31e7zZ/k2nAkbC/p0aEEJR8COTWB+7e8u4TN6aOjlefgnzUnx4Km5RsfgSCMIBehx3
	kn9doTJ38VKXafBD7OsO9ArXleuLpczWQwg1awMXDc2vgLyat8Qejbzx+9tpTSJdHdpAcyuhYZld6
	wFFWxzd005d8tLru3TlP0vQ5PlnE3DlS3KtHFAQ0xa1vvvkfMtdCOcrLaZNBhp1xsdlPQiiCnVXCd
	2U3t5UnH3QaLuNUjGAoeF58KEp2JagfmweJ0lYBTfUPdgo6013W4qiw1EXV4YmwCH3VrdHXJ8JEEb
	B1TOtk8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRtB-0000000GObR-0za2;
	Mon, 24 Aug 2026 10:26:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyRt5-0000000GOYx-1HUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 10:26:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so5247501a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567201; x=1788172001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=tHRZfVUQv/h8ncqWc9rwfIMBe0V4VHMKZUD53zQAd0JNqQzIiiqLKcCDOjxAwmYQ2W
         m5n3zmGdw4PW7zen13KINa7sf9qoJ9ng69XcXk6ASURraixV7k9nJ2doCSu0pPb9arX5
         AflxZ8fyraTQn3sF8JwDL9Flnuibkp+66dWoBzBDiPPI7X8FbljHt735ekhpNZJO0OT1
         zHZOIOhzK8NTyiscF6+4Kvd7AxoPm6KWrdGXlON7uOEqbqBspfVkbIZppHZIpHqgqSf+
         Im+2xI9VKSu1uvXW4OCe5UiCsz5/KxlYbNny/Ge02AYiYY7Dvp4hCUuXiAH09s/uoC08
         as3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567201; x=1788172001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=EyA8aGrsvZVeS05u8O+aCp4sMA7+iYsv7ZvqAY63KOEBBOM5GIGDZH96cd6PgNNRBv
         mnAE7SJ21hzXP8cm36s4A5eA+ajxkkGjyJQKqpj1QipnbCEQ7VLs/YS5alCX00Js6JZg
         WDtVpIw+2JcEdCqmezNtzo3ekC8YfrwqdcvYk1QV3dYEUfV8BZQmQw8fpAf7x1cZKH6U
         9LRQyw64Z+vZCsTwUTWyppdaSQkzil1QzP16Rh9TI5nBqPMPqo7bJO98gISR3dT3u8AY
         5OfupaBog0eZdT28MIMnMTxDQlfqJma2np4YyR4T2Ji3LYM/a9HYsN/MQ1tD95NRztsU
         buSA==
X-Forwarded-Encrypted: i=1; AHgh+RqC+tLcGwUG3dWcsIuVyM/9UV5d2NT5+f7vUqQl/BuMQLAADPtXVVpDOMLE4SJwGBK4JU0plC2bJEjbBfmRy1RF@lists.infradead.org
X-Gm-Message-State: AFuF++mJ+VrqgxzYJO3DkygsLB4UZWFmRoUwSLZ56knoWWP3TbO4LHR+
	2IoXKi6XJXbl/sOB+q/Pu1Y6BMD/eCMjpmZeGIIhIy926s8rfu/cf9uY
X-Gm-Gg: AR+sD12ipUC74cZ/Bc7L+d7wTrsmSfBGkZKn3qqTI1WspkNGyspytERlOCSBAkvf0+B
	LReE1HHdTeSibEEiMpaUbKep0DHbA4+DBCppSHM6SLej9aGVgBLDkOQBW2VmAoCU5Pqb2Hv3vTs
	jRzGWXXxGzWIb2XSalVDz8ku89YW+RHYPe7xopXgYtEw8GSiKWSkwREc7FGbsyiPLGh7kmLzLkc
	xgL/5JcBHD1GD2GWXcz6UCDIoAKl0EZ2J8PNScM8BVhfyQwN9BGASoqnuAYy6cr0Oson22NzkcO
	FyB1VYIUD9i6FarTi3AFqF/o505ZCZ1AWfZKPOekQ97KU7CYuqNqdGoRMzZ6BEqhXdRJudCWCyx
	t84wEJuyjZZIC1IsssRKTmPHVGO9LN6naGbmZtsbZ2/AZAPgHjqqMbNQeMvBouTQ22WwJx1YG4F
	33Px6t+qARJVYV5JrCby70tRTPFyUUr2LjPlTnwPwvJ9fvciDxPXS40Ke6Yj2CTG2s3JQmqIi8U
	ee1iFB4hHnqHntG8lQZTRA3Ow==
X-Received: by 2002:a17:906:f58b:b0:c1f:8021:deef with SMTP id a640c23a62f3a-c246a390c73mr2638439666b.10.1787567201145;
        Mon, 24 Aug 2026 03:26:41 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:40 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 12:26:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787566980.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787566980.git.stefano.r@variscite.com>
References: <cover.1787566980.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_032643_372754_E677D711 
X-CRM114-Status: GOOD (  10.06  )
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


