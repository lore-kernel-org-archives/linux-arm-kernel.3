Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD77C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=; b=h+ApSwzVkbnc0wOgnQ1j1yLYdI
	LKQhwbFle+2jjj+6oMKO+J6ODUu2afqYWue5vAMoeHpMsSay0q+UlxSQeP0/pvjJuVKePy3F6yt19
	uRDWn5jvdA18iluAFbpwWQA86atBtlHyyT6804FWiM0oaFysSIqfjIoM+m9TLvSgMNCeUkOMTtPCs
	4M6kNRuHE1LYGMDypaUgYqL8GDPLV4n3WYaSAZHUWBLWXqSExnT0F4dBsoHosqYJOUb0IhKxDBYwZ
	L6cBk04GWwn9KRhYRAyYvI3sHHGN6et2HkDmkwUcwrWCFA7ZbWKEUUEFU6PXQ8N3E2/4YQr2b8zG7
	1qa9a1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCZ9-00000000ERr-4BHP;
	Sun, 09 Mar 2025 09:03:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCL4-00000000CSp-3gGD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5e7fd051bso2574007a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510129; x=1742114929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=FxQ/J/a5p+Pfov/Z5wzcS87y7qMtJAPW2iWHKiwBIPiLUXPWWLMa1ARYi75Xjt9dXt
         kCE8x+U//WUN/H1j6MqtzXw3bFozxedDAmBdQ+gATYd5wkdGf5EgaQ/Em/WrGFJIm2Jk
         QG3Zvdkf95C5Ro7MwIJVxjtYZ+/IV6iHQ8zaEpAt+ntBCbgPrwoCvw31yDHAzrs4MYyy
         8OYDCPMxVW0HDwYFI5xkpcGBMCKLtjfZBOtKMEYGjgknHX/lq5h6BIME4JZvZCIWGOfg
         0UY/GH1rV8NvaDX4DGOPMIKehh6clgEHf1y1UDf+OuH/+8YqUxDKDFMVebhZQtOwyTBV
         iVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510129; x=1742114929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRFND54pfWCeCgjcI3QhzMAI2iu+uBF4oELfUtwbQW4=;
        b=E+1+9pSotAoI/1PDhdX1HyYpgwYUr5vKlSydI+6GaZTjLB4QtPUUHQr45XOhsf2a6p
         9FrE9marWFF2zikjf7XDRpeCBlwMWCulPiI7Ksxy1LzX2xNYvyfpNm1y5I+SickBgkzA
         JXO5uuzUtYvJG9+LwFx9yqNkXL0EKz0nWCz+jooudvK/enQFFbRZG4NB1D36O6eEkm4O
         7bk4EfjHAjODMyzM+0mQU3SLaBQycrtEjwNTrj/cE7M8r0muAk0xKyhv0Tvqmb+HxHWM
         oypEZyQF7pDVHZnTZoUe0qIOy1bIk93md/4a48oIb2KbXKo6LgP+cRC9+EIzkGchDsiZ
         f/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBV4Jht5Ksml/sgSgNsDJzA+aj4kafEQCTd1um1SYYyTwcJYHIDcpHgR1B5Nt/nc2xSvyLZjmxXZaixSqnHiSD@lists.infradead.org
X-Gm-Message-State: AOJu0YxCJMlgOBD592O5WtAmIMCE6cx9xbg191Rsx419luLGoM3d/BgD
	6kK9Jt+SVEwuxAS4H3xPgiTY08oKHwCKTWG5wJXk+iUrkl7FwqMI
X-Gm-Gg: ASbGncujCKi6QdQDdyCltdot9xNoSH+emE9Ehq3Bw7ScDW1M0UiVpGAuiH8zbYDYSiW
	/jTaw/g4Py6SQvx+4eITDEfm46TDwzIkbxNZ+pG1Kle3oB1oNN1vmY0Be0Q2MJQc4nH2ynkacOQ
	4mWYLhL+VMDtm/4ZEmxozRUYoiyNzMsxJlCOIuOq6GnRWZKRyNO352QU0EK7/0ucBY/orSl2oU3
	UfcekGeXv/vrsFpmZSt0K2Jr/x5prFi5hj2Ei4jHc1KvrE+XLwAVh9l0kHBYg813nw/NrLHOQJC
	91OyRHqOf+ur6k6vjE7AqSefvSqrD8/h0w/hexVf8coFa1kKmc7DNQ0TmQ==
X-Google-Smtp-Source: AGHT+IEQtmKUVV88EQYf1nXCbrxWnIHZsl/uXnzZPIJH7g+3jAJsdmu+BnkfQ0xHlYuHu8xDJYCjTQ==
X-Received: by 2002:a17:907:3f1b:b0:ac2:7bd9:b2f with SMTP id a640c23a62f3a-ac27bd90f23mr491776566b.9.1741510129117;
        Sun, 09 Mar 2025 00:48:49 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 08/16] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Sun,  9 Mar 2025 10:48:00 +0200
Message-ID: <20250309084814.3114794-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004850_918990_3403D77F 
X-CRM114-Status: GOOD (  11.75  )
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..bf8c861c836b 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input port
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.48.1


