Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C28FC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=; b=MX48vKrNxPRVpJ0yzfrfA9mH+q
	B8xeStoxNTr7+LhR8AoV6Qol5tvo3yWOKBxBBC44z9q09KSLCfKwKJtoh003PK7YuN1xW0szDmQIh
	QCtxKS9l9eu42QYsPdCHFdNaNXOAH4/Y+FVSRqYsy36yBEC28gokPvd5ECU9fO3aMSOXwUlGOyQh+
	aAQ1ZVZ7XEEQTZVm0nlKzQ1wHb/vJ3XqhxfZ2U8DbDmscTPD0SakhiGPaldZ27ylz8W+tSrWtJIQl
	YqPW9j5T/vIwPR+CJy73OOI5RNkSe9DGA1oszjE7xJ3O7FQE8hdHhTTgpo5a+iBAjw5tLzuUNVIGv
	clswM/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64y0-00000003GhG-3RTP;
	Mon, 14 Sep 2026 11:35:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64xr-00000003GY2-0SBd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:35:16 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843378fb37so850472f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385709; x=1789990509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=OkzGvAKaxRBi8D8nTG8xlney8rkV1W/ZwTa6lstIGDdCzox7YlKLKyn9f1Ek9yMA/1
         s/2d8V/aQ/pZlwoAPRj3bAMq2UZK/2C2cGNDRXJGJSAhpfBAgo9RT6atMmIZQF4eNKbS
         JG2Q/eRXM1w81KRDA6jF6alpkT1Ey3fZ+OaMsjvY/xBtxygb+XIH5J8tLSQsRBJCXLgT
         8snzsuwN3WKbKFO2jdqdOWqgZr+/8NwAdu8/Q+Sh7YeSNLIm4TJtzuABvqT6LFy4GXel
         bJ8DBD598ssBKnWbNfnd3WbNX6azgn4Qqy5wkWY26YCiKIm9zzvp9bo5CjccWWsKLdbM
         D/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385709; x=1789990509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=beQKBY+qvhcFXrnuvQ0YD0cqnZUHw7KNxcTHy9EPm3srVlrhqCkONsHuY572tlRYmK
         ri/TExqz+M5wkH45QyUojRmfRU2bhCYlWY/6xrkJyDdcG1/IW93vVFBXrdgkpzurFSA5
         umDnUFE46oF0PJOYph1qEmOsgZpGDwetPBv8XHcN89q5mAIe9bl2NDFylXbWZGiFt6xb
         Jp5goWjST+sIbRxda76266BRjJN5QEsULmLve9+FIKlUgP3mZxe+Hyj9zKV21JoZJzgv
         ul7a9QB/9bx6AjVl4t50B3pvITk8QzvCuy2jjcCIF/gaZzO6tpL9/TBsS7YghMha/agi
         gSew==
X-Forwarded-Encrypted: i=1; AKwUvBzcJNHfptgHRU7e+rKFWvsP7xaTahv5Sw9erWFBY6Aqs5QkIxnOItxS66JE3m0Ob6fmfk3WGXgTakOYUcyY1CNR@lists.infradead.org
X-Gm-Message-State: AFuF++llKPwTLZRM+8tJuw0o9fSzIAetX3+F4V5iE38dm0MYxKUi4DPI
	OZ/iLRtgsVqySc/myG/dv8Kgo93zj5tktEy4VWX6NNVrfMvdAKM2eiDM
X-Gm-Gg: AYBFou3JHUaaH51sUpuNLT2KGQiQKHFqLeGWWTmljr8IeBlJol8DRKv9iUJsodrwZuJ
	qUi0WYgNz8lqEig4tZIII4uXBfktQ+awq08od9woGG6fmxbknJQZGVaMA0gVQ3JCkSgLW4U9V6i
	A6jXZHJ/6HBq1fu+7t2G75lc3jE8jBxaFoKBMCGjdc/zXAhK+pIdAi6GHfmOD+fRRUI7mNIq3B1
	aZ+1uJpc1NZqc/MCBB10M1IjJ5MSgeIULk26qJSvw3Y66bjwkcEtlsCDnyANR23ICLBzSaECUUr
	a8zBgFxcFVzRIlJUgjGisFIV37nFCIjQghuZi+qi9K9v11q+uTQkDr1m7wRkAu3pK101sZzQbpI
	ESddLE/VnsibmCBBpbL3VQXp3U6jEJKy60aacGEsswCgmyTXmlzYIAzCyVGpEPaAkjcmEw+/VGN
	qFPC9dRIemIEvQBvFXOMOfM6NNdedB8M+eppjQpQ5aR4KuQ+LKlHNlWiyhMi0QDZ80IDjkyeIkO
	W/+sBgdo6o5AC3KRXCA5eCT6Q==
X-Received: by 2002:a05:6000:2891:b0:486:f780:9be7 with SMTP id ffacd0b85a97d-48702ae4dd3mr2401139f8f.3.1789385709124;
        Mon, 14 Sep 2026 04:35:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Mon, 14 Sep 2026 04:30:09 -0700
Message-ID: <20260914113010.988-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_043513_990803_01736543 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0


