Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201D0CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=; b=bCBMMyT36BmAYnh1Hbh+aLcIHH
	82qG3eiFQmX3RbllRx5Pe9m9kMpMnOSinkYKY7Dy6YAOPKmOO8JShOAfRiNTckbPAiMn/iZTaRHzQ
	Z1U5ZkPspMAXO8jOW1SaNspsyTi0XQDm8JI3CB7fu7AKRkyuBCNqXymp6smm4ON20UsnCZqdt/mF9
	WmKeE/vJCL26YecXCr2udqAXXQgBxJKdP2q2qDVkRkRUm79TVLZDVAbaOh1KRinrgYq4qPVwygdDM
	yDrrlTne1+OF0aKMv3FAA8EEi5Qol4k9Ic3H4Zjn0M3NQM4dSifNWRc6CGWT7RyXjtxusECM8bMEI
	u5uZ7PPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNy-00000002Ojr-0HUk;
	Mon, 29 Sep 2025 11:49:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNp-00000002OaG-0jqm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso28036185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146571; x=1759751371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=dTtyBIYp1IXbOsCXxA2ehtyzRdDXmVye1b0SmuC5HVkJYK1lHVjPhzP4OPs1Qo/JS/
         ejfZ0a5dK+qBw2S6WA65XlnTxuwEVA7eaeLw1saUFtadT/W1Joxit8vx+y3CBKu9GufQ
         q82kPkG22GM26OExWzeGm+bxtcbFAtJ7x16DVwecHnXKWGQu4AkR/zBQmn9HmbyHMiys
         fm1jfzn7xolKXPM8n83QgYhuHtuvjBh4PfDrpE3P5Zh50bYE5qoDfVejAN2KVX+Nxrx3
         JyLQ3XiUZ5jkVIOvCuNzYsUjAmITE+OweRsljdzgPiM+lRC9zTnDgwjfMAHssOWqoEc7
         vJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146571; x=1759751371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIsMYN876VGoFoSvGb+9plrH+kv/tFGDMPOel0bH+u0=;
        b=RJ7Bqzmq+/cbwCBShaEWT71gQ6k2SBJhtNObeN5MLfBeUzddCqvTiOThBnaxGxgQkb
         t7wX7vVCcJiMWKvnvwV7geCGOhsJaPiSfDTePF9ta+7mEq5uaDWHtnGzEaZc6unmuaon
         78O57wCcp5DFQVSWkP9gtKs2JbVwSga34zBVvrq5M+e9Qn4+ptCOh/cQHkaxvfa9nn4b
         waGjBinxi/SbSoEVhqIJ5TqvvqP2ZgleGrD6BdCyDTgCoARGe6TxdK2h3Noj8nMfssOz
         oWSOS0a+wvqH1mQZmu0kzLCbxe4ufwXeLocMZocL/Cd04zOzLvwGgSycqkbb9eIiJNhN
         SH+A==
X-Forwarded-Encrypted: i=1; AJvYcCW/kBWY1bamlWZYgKL10BHZ+cjYic2gMo/s+wQRF61gOPbJPg1gCieav7Aoy3a2H0ZIKw3rwLBW3/TRIu1JHtUJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrHYL8wJ8Zp8ND9gHfy0g3swjvqQlHzXU6NkPr0uhEZ4OdH/S
	HQc6b7ZlDlosUYdw/gysg+UBINsnkJSgku7Ns6cmVQszmPNcnTr31DBg
X-Gm-Gg: ASbGncvCCrskPUJPJy2cgw67rjDWzzA2/e5L2apv3lrvtK0DNzA5SLcbCWHoCVPW/w1
	6QNJqXiOlG+B2pOb7s5dSX7/+shYUhHac/Y2Jm/jjQyoXpseW3ySnw/TRJ75CJ3BnMoYG6SVe2t
	SpmuUTsVvYIepdYBoYiYjEehqoEXJwfcIZe9DnJz7wMrK+0O6sq/0hBUOAl+HQqtsK7c/T35Gdz
	TnbwXy7TmUFgKqdxnE9pEm7Q/G1eXw4zrPUaAypdpx3EalJzyA2DvfYUN7oL0Waj9YksugqHfiC
	hicGnYTSiwYc1d/TaUsnhU6dQ2lrhFBy339VQxVr0GBIMCcXMdlG3/zDtl+9xmnAFA3MWvBNI/p
	+eYlgp7ecNQIoW3FChcR+giUpD6miSoGOPRd5Z8cJjX7AQignpomYoeDqjDInzRQYQqkVPv8=
X-Google-Smtp-Source: AGHT+IHF2CwXyWBOC4BcrLBbsAVVrnt/gxj/QYgegqRmUtsThNiGS8+anT8fVSz00MWmGGHmAtEBwA==
X-Received: by 2002:a05:600c:4689:b0:46e:32f5:2d4b with SMTP id 5b1f17b1804b1-46e32f52ec4mr147677375e9.37.1759146571403;
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/4] dt-bindings: arm64: dts: airoha: Add AN7583 compatible
Date: Mon, 29 Sep 2025 13:49:14 +0200
Message-ID: <20250929114917.5501-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044933_233454_3183FB6A 
X-CRM114-Status: GOOD (  10.93  )
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

Add Airoha AN7583 compatible to the list of enum for Airoha Supported
SoCs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
index 7c38c08dbf3f..df897227b870 100644
--- a/Documentation/devicetree/bindings/arm/airoha.yaml
+++ b/Documentation/devicetree/bindings/arm/airoha.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - airoha,an7583-evb
+          - const: airoha,an7583
       - items:
           - enum:
               - airoha,en7523-evb
-- 
2.51.0


