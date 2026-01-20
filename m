Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1173AD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=; b=XkTvauXex9bsOJVEEvSvomO69G
	FkMj9YbeBn5/YlQTMSV1UGYLpFu1+06A0z4r8A1O5vDYYvaqsTd3N0tC1J8wYQ2sv9pc61t+y4x89
	d4qoabGLty21GujgMxTpo+bqtZZIyJquQjpBIJBhxpQwixfzoU02SVE1pGh8qaTeT5EOcVhoMnf25
	1fNxYKBPDmrtXfKW7YA/J8eI8wpYVH7sv2Aw2tDWvTC9xtTWLv2yCH+PTNjYE2jFIT/qbk497ImsU
	Gy2z0175ms8TOozPeM+cpu+o0KklONZLiaWbLcPWtJGfbaYmssJgZLjqoXiJGeN/7ZSYfpV2suEFf
	3MeaQS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHl-000000042ym-0Bea;
	Tue, 20 Jan 2026 15:04:49 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDHi-000000042wi-05Uz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:04:48 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6536e4d25e1so8161964a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 07:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768921484; x=1769526284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=R8hDdIt/rGH+1HjKG2R5/EyAk8QBzCWfBeJRcBfknW/1EAY3JkhIrK8VjoO5PAM4LV
         me8rgDBxLUB0JQSjaSgRZ0294+QY4bsJiBltdlO3XUA2UEKELCiAgMFkfb0/m8qbW3X0
         6WKwvXRokw9ANgtKge+8ukK5TnBlAp4Dk9vhqMgPNn/L00KGAJu/fq/X6fQcl1PSRDAJ
         OOV1zhDxUG6IpxBzZFasggI4A2K2Vdsi++E7ja0EOhtHW3XTtm4RljglYlJVot8GPpj+
         rX8l7bvm+nes8lP434QVCZnlS9AD4mSh3dLef/J5RAfIe+w5zppSiOcP5wVrNE2GuXtd
         O3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768921484; x=1769526284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFAMYMKzgnEnW6TLRC0+6joDsFGQeQJB21ZVnbyiHcQ=;
        b=fmGma8pJu5WxUmVikt8wShMOoyCsJ3pX09Ec6aAKhCMS1D/VCMSFHHLVMQ/jbvGJY2
         hEeHxeBVvsz1lIK9CFwNTLfUN+X/2px8HwfsWBA+RPA3BpwrAHMKo8TEP1nmL+6vITYB
         VLBjVozNLYQ/N+Thjd2B9MbppzTTnaal9eUv/eLRkANmFS2J992RG/v2BlYUdSH5KNXy
         abDEeK3Ndp8oAJ1q5XxtSd7oXgtroP+6iZRZHuCCWCxD62ZTMefQx9HBJNQAkPlbwbPf
         BI5udKJ7C5w+G3g+MSFpnvh5lTouwPXAzGVIgscYLot9bvTDvsG5H4pQOWPH7VygbgsY
         GjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyBSQOCM+kkQ88u7i1f2CZJkkzjCBCWWJCxXxmiHMmLl6AIXO5wUKC3GOdn5Xz4/DgejP+5EGjW7xsJsy4baEL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4okutafO+48MFbfxia8HawxtxPC7twty0dG+xX6plhOfIH2oC
	CMLvaD/LFBvUNAo4JAOSveN11LR55Uuh4jGOXLCYE5Al4QZJKyHxrR/q
X-Gm-Gg: AZuq6aJBw9eatoYOXRRjcOgJ2vPPV69PDvbxAdTJ6z9pM1f0TZG9NbEGjyRi+5IzJDs
	7aEfFciK9eHXMFvoBioMLAZOuTZZKFmsODUFFV3dOwY2sOwd1/YKdab++bNGnBB2noYp5NOo8jG
	/QTH1/5FN3jUVH63AIk2vYos94PvoD2rlJUV44K8S9nDu5L/NBNVzBve+qZ4wFHIgY8xmlUUDuf
	b9MboLZ6tY2RKAyIZtLtYonQoigE+Rw8NT80jzkW7bk/1n9pb+yArLQ6r+9tx7a64jKcBUAnHmp
	7r89a+pRGfeu0yjRHzG+Mje6ZMtNs4Vy0GnRvw9mvpzE3pJ4xUAfxgKM5CJhRq4GJdYejVTW8oy
	LIsy9j+pItFritqgv89skd17waddH5DrYME4rjhE4bwOmiKRoNiTaZDcPNwDniuRTzqYONmwvXj
	rIBFUtATlOCmqHaQcx2M3Fah1cpLeGABSq6E83yxCTsvKzFj4=
X-Received: by 2002:a17:907:8692:b0:b73:6d78:9b79 with SMTP id a640c23a62f3a-b8800261c34mr210659966b.20.1768921483413;
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm1427045966b.60.2026.01.20.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 07:04:43 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Tue, 20 Jan 2026 07:03:28 -0800
Message-ID: <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_070446_081571_8D558F6E 
X-CRM114-Status: GOOD (  11.33  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, the programming model needs no handle to the
GPR node. Make it optional.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 1415247c92c8..bcc265a742c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -63,6 +63,16 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-mqs
+              - fsl,imx93-mqs
+    then:
+      required:
+        - gpr
   - if:
       properties:
         compatible:
@@ -91,8 +101,6 @@ allOf:
         clock-names:
           items:
             - const: mclk
-      required:
-        - gpr
 
 unevaluatedProperties: false
 
-- 
2.43.0


