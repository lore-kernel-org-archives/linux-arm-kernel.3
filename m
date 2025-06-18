Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B01C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=; b=lF7irgngl6eq6JtTgmaQVz6AnI
	Myuav6KSe4i2+gToz7/3o7NKWzWHfYgF+JwBJ8bTNhOOadZgJ6ydas3RCfm6tXy8N3WnkP0R6LI8K
	JvwUdw2wIsQU2AY38++D919G7X36KXBkAtP/d/+VASwZjI75Oai7+TX7h/m9+YAri9nvEY8almIcK
	xP6LDyWh48betVB54zRXkQkc9EwoQSXGY6dyb6zrtq1tprjL6vpOOgVdEturel3F3ay2SVGFOQxAv
	NQ8lMh0RHnzYxRPuoIABOMr21+EvGYIGIufp1xgkgG+xgCNeRKxzxttUWhuO4iduM3z8uudsIzDdp
	ZNw9tp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq4c-00000009nPq-1FJ5;
	Wed, 18 Jun 2025 10:31:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpa7-00000009gXR-2u5Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso11729290a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240786; x=1750845586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=ShJxwSa70a33w0MgV2n4fZjDML4R3NtV2106MkDNijrHNgUUzxd9hBN/eQ+4x1dC39
         n7du6d049Yydxud5Ugh8QM2OWEnw0q6tclKSuLfXMIAmCxYB7rAU0FNxOMLQcBfFrMCR
         5il8gmqK9jSQUFwStztm7sDfHQa75Q5Byl5U87X/pd/pHT+rRQfcqhVl41F+KMiyjWql
         i6wZ86ui4KYfMVRWKo2ERHLnVk0jr4EGeM+boVzNZD3+2sukoMFSKbsLNc4fPdCtBMqO
         RwTyrZHnoRRfPMGHHhbFwzWa2p8E46Q5x7u3Ql122K6lMBPJZ4FC2c5rLbdkTs8+TbcD
         CxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240786; x=1750845586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zlxe0FWKSlX6ZpjYCnKa20yGhgX4GJOUiHsNsl82fo=;
        b=NRMLlQ1EE88Wb0rtBidNbo/RhjDViurPb+ZxmvbvZ+ISHrjGwboebMwQHSZCTykVmW
         NIo2BVs0V6ahyX/PwFau5ICMVDq8PEVRl6I0fzlX9SEuR217I4HeTu0duWINHj4fEq/Q
         Q4Dg9ghIFD+KOLsNtcA6zoXHQm4sBn2IY+5U2W8pyBSsLKBL837DxRGk1RwMrQGmT6yT
         PQvFEl3y1+8yhe196TV8eVQtNvb9vFUnz7+jWwZ9ZSa/xTrHGetGxBwWXEhc9qGiES9z
         DEEiqdPUIPLktIFZ9AIrICK0c75NNpuqAh3+vfB9S+btmu5URVJC6yGoP2FG09/ES6rY
         A0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpz3I2fBTjZ78CK2GgmwlHFXp6PbQX4vGaOB8TtpUvdJ38iqpl4ZXHz9X5UObNbda3VsUXJfIFkV6qnQdrIYDa@lists.infradead.org
X-Gm-Message-State: AOJu0YzdvS8sabYNKN9Y3ci0jPgLqSnjxaZIsrzcNPLsvJtE/Jf2jp4X
	Ud1f2wkzr2h8iUYkVlmHQiDYx2//rQWxytgn5bWnL9S7LUW8sFRLw+xj
X-Gm-Gg: ASbGnctYcUVKfcEg+W38eZWRIfkmWvsU3FtocO4LWnJRhlJxoOmZujXmn+T6AZDATI4
	3O1SxhmQFWsOfruKV3HCxe3TUAbtOSf5WG6duTgaf4lBbh3M3ey1dU5qU4kCuYxIhQXpNV7V/Yi
	Yz1hp5n02qFiSqTBBNhmdoWm71haZO9NY0KGHDudTr/DuYURUzuTcCpkOmMwfgVzljYttzGUbgK
	g4fjiVIC0B0bU6TitXM+cInuyRlrqQLnaG59/740c+yLeOOAxXB7xyUUQOtA6nEMHug55yZGwQO
	APMbhzhma2VJmgUm0JyTVXdudMXKA4m00uAvYceJqDY/1JY6EUaepGDDxcDcV7D9A33A5ZCu+5o
	=
X-Google-Smtp-Source: AGHT+IG9penIGaVwsHptDJX0KM1UF66PREWfOai3W+uhZxrAvJnSPfX131I0r9nwPgeEttHzQcYPTg==
X-Received: by 2002:a05:6402:34d4:b0:601:ad95:ca6d with SMTP id 4fb4d7f45d1cf-608d08616b3mr14849444a12.8.1750240786236;
        Wed, 18 Jun 2025 02:59:46 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:45 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 10/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 18 Jun 2025 12:58:46 +0300
Message-ID: <20250618095858.2145209-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025947_740978_C3A241FE 
X-CRM114-Status: GOOD (  10.36  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0


