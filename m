Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0BACD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL4Y31r8dtXqoPXz/W9R/fk3pvn98vrw1YoAz+z4buw=; b=N81G2O1EWFlZv8Gstd2gdgzMSF
	jZ0uwZh4DOB2RhOL0EvoUm7QiwJR3JQ99U3O0lh+qjqCZf1qQ/3rDb+E2um7BejmJL8naTG+l4yxx
	JTz1WLDbL+AYDYJyQIhTuYut+beDNXqiB7Geocoqe5qNR6pTKNMTjTL6Byg3yg8honKWBBo7yOGKY
	9VnDvXFVnHUBh5n6iQ3Z8O9UVC3sZQH9xaYWYWp4N2H8WS4gOBrWhtuBBzviyzxmCbVVPy2bO50cQ
	K1Ibf1nVlkkIHD7VNT5ludrHhehlbh8plH4oAIYwGfOKewkR/pJEgSNQ49l22/g4tOVf9kJemhJiU
	oe58qFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgw-00000000Cui-3HVB;
	Fri, 05 Jun 2026 07:10:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOgs-00000000Crm-46zU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:10:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so1172669f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643401; x=1781248201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL4Y31r8dtXqoPXz/W9R/fk3pvn98vrw1YoAz+z4buw=;
        b=A4T3/D1NWqiQyAB1AZiMdWdM6kaXk1VkJvwGRLp10DK7jzlLubXg4Wa/jVlJ2lTcDz
         /guj4zAOEVdseAZIJC8mqOxjecf6UB4oXWe2lLlMWKPcQb4+gcgTx5rblXBWfV9boYvS
         ExhtRCKbeOjhQGkPvEx9pYfuQbzyROX+NfeNzC6sqTD9UR7clIle7Hg/sHf38FaU+LmQ
         71wSLJOqFzyMDsbW7vdO9qNyY0MbE31gGdfTwiJkwzq7kHNWx3NbL5AK+GUOT/7ADU2Y
         /wonuhT5FfVSvkq5w3nhjMZLHeSnQPHryIAf3SQLDHVyvo78hyzMxOdgvzJf4640GrIC
         eqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643401; x=1781248201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oL4Y31r8dtXqoPXz/W9R/fk3pvn98vrw1YoAz+z4buw=;
        b=jK6xv1hn2Nzgjo3+GdPE5pPQNg13PNx8k90B7QHVKOBmYtf6O0leO5e+0qJEfN2ZD2
         gEUJ171JDzvVp+WwZ4F5dJQ9p9KFBNd6lbd/FQUGF4D47gyrOOTHUc8N72c92/JFijdH
         wMkQ1WWEI9bFUCzSK9KfGxyLRzdd+jgkxl9pwqBmaJaW0K19FcCc2QxmpauSx/QQyFp/
         NKq+g1p7eVdG+oe/5jigaAr3jJp5+R4sZtNL3qGECpOwUGtivUP5MCFusak5vqELwdxY
         nctAqSagaHq6ahRSnIKEnygemFbGe1xpR25FnjmK8R2VKXlfQzgh8d3pqOau7Uhzy7xg
         ZSVg==
X-Gm-Message-State: AOJu0YwR15tXFXoSrd/ALEyVKlRbcgSNasG+oRMnvILJXbPES0KkUa1/
	wIarrSUzj+yaidZt2kahkZ3Kj7KxSN4U6hJ03GjywIRRoioGJlyIIlHTasOMsSee2W4=
X-Gm-Gg: Acq92OFnVeuxhzS/eEuivC/x4vapEuRpVEN8ieryRqAJ8PGRLHS9z7F+fa0g0aN+jHH
	FxEWj/T1KKv8AgtxNf07DkFZdLObHUwThuUpttZzKEgRdt/+SdfyzTSSDsedCWj28O1rpd8X7gI
	Glh1JM1uz4wcl0VGRKPIi4bBxOIaDSKwIVdCqLgZKe4H+Kwao/f5BG32ZnWgA5id0g/r1xj2L4K
	/ckzk0hMtTStlADLkwg5cCl7BkXmUh9Tq9skDkr/iwxpUCrErBGuoxlFcF/llVvdvZdkeSLrH5c
	SjD6rdc7CxbK8EV8SlZA8IuwVRXOII4K/2P/obbIc+3n2/xnppryqzcKI7t8wXjlcYdbEkuOBG5
	LsRlfPUtLZvaMYeICWHtHECBU71ZqzM2anDY+ypt3AAj/th7Vzluus3jVr7Bysp1bMHGBe6N4bD
	w2pJ0mssjqEiJEAFHekRDUfhb15P2NmpT2yVYsDRhA5A6cECx0cdndFs6twxsxdXwfYgi+vFh1n
	yxAHdnXF1Jd9uo8gWzRJ5dNh+Sq524Q
X-Received: by 2002:a05:6000:178e:b0:460:3234:293d with SMTP id ffacd0b85a97d-46032342a62mr2372600f8f.40.1780643400949;
        Fri, 05 Jun 2026 00:10:00 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:10:00 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/7] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Fri,  5 Jun 2026 09:09:17 +0200
Message-ID: <20260605070923.3045073-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_001003_054805_A9FBCA72 
X-CRM114-Status: GOOD (  10.47  )
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

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..82dd58b95f8a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie A133 HelperBoard
+        items:
+          - const: baijie,helperboard-a133
+          - const: baijie,helperboard-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0


