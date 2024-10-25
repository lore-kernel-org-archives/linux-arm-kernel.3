Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7658D1038E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3glZN7tdnxqEr7AALFevER6kTHzPF//GTHKC2fD5T4=; b=ac1Fi7VOECuF9tTv04+6VNPM39
	8pwvNfjlHthFFMnFyrbvGhgLA8ILgQ3rtVqFCIYE2KOyYcRvJaX8Wm4UlLiJl28Y3BD2W0KGrQ/9z
	IyRiVKSlfiMRBmrw66h9Qpdi4P4iQ5o9zET4Ow1veuAZ3twkFHWUZo+70mAs4X2cs9gLhm2txWnih
	wuUc8IR7tE2JMi4pliULkyJ36GSHGWtx0uc/L4jBQohvLn/tB2HBjlUKc8k2OfVG1Hwe/74pZGzQ6
	1QBOXfBBed6oQvBfGzJVhY4O8zrZ5r6IiOBIEvoycGt5D/zhqxMHk6cAZEVvxXg5SnubGUEtERsed
	sPY49BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48S9-000000027EM-1hy1;
	Fri, 25 Oct 2024 00:45:21 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48P6-000000026j7-2BYY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 00:42:13 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3e601b6a33aso941960b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729816931; x=1730421731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3glZN7tdnxqEr7AALFevER6kTHzPF//GTHKC2fD5T4=;
        b=HNupDc64cI4bQKb8ZgsAEeSwonP2bb/wYh2rrhXsZdefeswWiRcBXPJrRatEFXMMKF
         DJ6JAIwFvFerIv2z+eNxOrdWj0XZnGRfBEfmad+WYjzvDuWvjcZdS7rDYwa2/axiqBN2
         WGPoZkVkroaFz4azM39qpEy01dFp9vpXX6dfO3XVckPkK5a6Y4nYpSWfxtC8FCQbFRJu
         kjcDnf4+PARFmWi6+DOqy0uhu+KcfGyfB5k6xWnpSudGPgl+4EPeQ8HA1lPaRI4+Z4PK
         LStHSd3dxts35wgMlM99+QL/dgxkjPrBLDE0gmYP/WirAqBytBzbc292lj6Oy2/PC7os
         Wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729816931; x=1730421731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3glZN7tdnxqEr7AALFevER6kTHzPF//GTHKC2fD5T4=;
        b=Sixbl3PXa6LA+YOo86mIPatJqJQOGil4gKmZ8M+yIjI6vlkxNKdpss9BS1Cqw/Zsy9
         FC3J2ti8DadwHxzz3agkkpx8U6hD7C9uNjEadNZLz1UZd8YZeTziJLSBmif/gKLFSkKV
         n3h7KR3o5FU1kLUR2QvIaT+IdhRCn5hDeP+p10AhONamNqoesuXGkLXXTi8liJIMEQZa
         NEiU5AQsisHcX0lChia9OXYsEB1JBsRETosN+f02yx6DgMDYDwtMz8XvaVy7auxomW3A
         CYdSzkcMuJ7g4KK41frhSUxmBteI57Z2UscV9Dx4/KIy+hFcvzATiIaOYh3nbMQfzMxO
         e7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXisQq6IGbPI/JzDyMDGD+CJnApY8y6ReCXk3WFEWZJ94j+lMe3IMF3yX0khB4pnRYKFGXR/Djwevn7TeBKSc9O@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZvXGHjIG5dbH2dqRuDxZayMuYj4e4RP4X5PJNnc3YzCOE5yp
	UhIdi1qFBBRynLOGqoLu+hubt0OsVhq485Vt31GNE4qU+rGfQkDM
X-Google-Smtp-Source: AGHT+IH/yxaa5bTSEO6mVFg+zirKexUg+7iL8/DIbuhJOrW61wjJMRXPmsWuAZESLfEU0XQz2w5jgw==
X-Received: by 2002:a05:6808:200b:b0:3e2:a1fe:f0c6 with SMTP id 5614622812f47-3e62450114amr7198590b6e.6.1729816931078;
        Thu, 24 Oct 2024 17:42:11 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3d2easm27289a12.85.2024.10.24.17.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:42:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: soc: imx: fsl,imx-anatop: Add additional regulators
Date: Thu, 24 Oct 2024 21:41:59 -0300
Message-Id: <20241025004159.1571782-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
References: <20241025004159.1571782-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_174212_583731_A631C75B 
X-CRM114-Status: GOOD (  11.35  )
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

From: Fabio Estevam <festevam@denx.de>

i.MX7 has the following anatop regulators: vdd1p0d and vdd1p2.

i.MX6SX has the following anatop regulators: vddpcie.

Add them to the allowed patternProperties.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
index ae708a658d52..f40c157908aa 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
@@ -44,7 +44,7 @@ properties:
     $ref: /schemas/thermal/imx-thermal.yaml
 
 patternProperties:
-  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
+  "regulator-((1p1)|(2p5)|(3p0)|(vdd1p0d)|(vdd1p2)|(vddcore)|(vddpcie)|(vddpu)|(vddsoc))$":
     type: object
     unevaluatedProperties: false
     $ref: /schemas/regulator/anatop-regulator.yaml
-- 
2.34.1


