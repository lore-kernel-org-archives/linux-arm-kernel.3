Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ED4109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=; b=p1imGITOPwdZ/vodfUV3bcc3bd
	79gDbiS7OoHRAF/XaL5X7aDpPlaKOvLoYNORK3rP0+TqSAkETQHQydrUlTcg9EbSVpvRS1Lwb8Epw
	qCXeZF0r1MbdzG5+ijWdWARhV1HFKU7RmqRGV5gDWmOc1vxeGVzE2udRe+EUEUzRKn0/7fte4sA0Z
	3yf3lsY1mKrg+bg8DdIsAilaSoqZnQC26DVhLq+WXwvj7+epDL/J0X2FH1B1iGgb/2SWUTvqru11j
	J78s6sJ9CvugOcchvHfS88q6GoUHPD6f9JSBVfDrL+/0SQw23kUtCJtiL9x1qqplmNpM7E6jbKvtX
	k4nQIXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVF-00000003ePF-0sCG;
	Wed, 25 Mar 2026 14:46:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PVC-00000003eNh-0Erw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:46:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4868674f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774449992; x=1775054792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=JVZ/9s4rCVNflizEU4q0RbRxqlCqBJ6BliopkYuMtSuC1z9wJz1YL8DHruHaAfNrdV
         rJSpNxDDfDC7YdJBgmCGVEBdgDBzUcDGYIV5t8J8ct0JFuQ2zEnW+7e8bqv5TAHwttse
         9GEBKi2MjAS1OuUMGho2wcEa/Lz3+e9nBMnEgRrJx1+G/Uz6YEFClL4a8Po8zztFcnJR
         Vf5d74jdGM7JNPpFpxC5VUjmkce01fy15e8G5MM4qTgO8Rp0Y3CZNortkvBC+FbgpHOo
         clbniRW/fpkJqtyRjIAwTS2BOA2jR6/gI0oeGpPHvJo7SWyekrxfpulW6oEWsKwc5Iit
         Ngbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449992; x=1775054792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQww7rYHgSiW8MzkVP4frc74sj8xqXnVytlTkph1S4Y=;
        b=E/s6fVHoynfdnrOVlfKTYc4+FayfqMCrL1oWobR3RmeHdbJ2u+RKI8eRvaEMId0zXP
         o6Jz/CDFYuzohqTAdOV4RzCTyYqHXMU+sdPTADkW8RjgB6XfEwIv4VxGgR4KJ8Jfr8Er
         bXUpfHyQqlG9O/XO2ewRH7MAbJHiBT+/Ky9ShtNqNcDTOyETFKdyQTyO41S/cXAiovGP
         L0wt9A70bZhxd7nXB7g2U3jrF/+4UfolcCHimZRIgrLcBnmLWxwJ7419INefiJOmJbdP
         tGSWM1PMUBTlca7Dy815xXQajv6LXjST7jthWJMb1X9Pq98mOtJBnNPrjgXhA3y50svi
         y1zA==
X-Forwarded-Encrypted: i=1; AJvYcCXRkam2FvQaqIIoayF+3dIaWo2TtU9fuvD4c5mzYx3teMOtnqjIAdvgwZ86bscQHjN5UpLBrMrOODhq2LgVRcrk@lists.infradead.org
X-Gm-Message-State: AOJu0YwLewFui8C/UInrGrZnJotuKp/KAe6kAGX/BljMBwmKN3Mlu/lV
	xG9tMYCnfAtB9CdiuEydfR5qs22Qd8XThuzc9Qx/CynxeLAsRaFV9w2/
X-Gm-Gg: ATEYQzzfTOJbS5Gj8qHDI/chJ0MFQawjE663+TNGh4xeQt3vfB2oInyi9ae1AL1TDeY
	+zOIY5NagbTOrsfG/0hWYQRTMLUKEger3XJ6d94yrdF9R0iKucbgc4M14SC7NIJrSpAPUpKLuIW
	53Fb71jjaA2PsQb2DV93A5H48GKwNnN2XgIfX5hwUsuycXKevrtR6gimBjM70awGG5y3YoRA4pG
	7cCTZo3B8EQL5RPXWOOyCR/oaqHLGG8FzbZvc4L9OPYKV5+7fCWN6O9TPc8yUNGrwHPEmqkZW99
	D9iL0EH2J/taqVjVC3oo/q33qUGaWxww6qPVytHsQzJoqhmI4Dtp5Bdsxvtobmy4khjPA5pBR+h
	UFsIoPiTdJQDBCjeAIql6tS4r6/czLru21No+4JccSGZ+l5dL7jeRSQasFKc/RLnfISeO8LPxXU
	rXwRc+D0nFf0nR6V5ApGpMMhxO0/5h698lxS8+m7YcmEo3bGneYXT40TIfvbG/P/uD5ZTAU7CZg
	OBeEf2M9h79AjxZZjb4Rbh8aSI=
X-Received: by 2002:a05:6000:2502:b0:439:b744:c5fe with SMTP id ffacd0b85a97d-43b88a39af3mr5165742f8f.52.1774449992180;
        Wed, 25 Mar 2026 07:46:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e305sm304592f8f.8.2026.03.25.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:46:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 25 Mar 2026 15:46:02 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: add Verdin iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-verdin-imx95-upstream-frank-li-base-v3-1-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_074634_118325_5CEF5E35 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v3: no changes
v2: Added Krzysztof's reviewed-by
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0


