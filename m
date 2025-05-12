Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF14C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=; b=fUerR8MUIAqblyxODEP46jUPNv
	nPzmqQsecoHF58NBazFv0BfToTotKJb2LuSj0zc8OtAvyASVp0SQvnDe++kgADNpl6PhKd2265C63
	xnDQ1+SU47din+3H/g5iNe8EPhVTJ/KrHLZpS90svE9ckyPgTRIoADH60pyNGMJPh5Sgk0Z2DRWWW
	BQ4HG4PMP2M1nWEhyFN7NkXTfAxuO1KpPa87bjCXV68tLkfgtm9WhRSKMn2Hniprw9dqFEsj9Kv7j
	CSOg03j8PwmkRoIiXurU4mi4qkgAJKPFqpkgQvQ5ksuAXHU76c2Oh9fhrh3WNfYDwSmwoBEQMaBk9
	Rez5bMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEazV-0000000Aljl-3WRl;
	Mon, 12 May 2025 21:47:17 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahz-0000000AilV-27IS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5fc9c49c8adso4923115a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085350; x=1747690150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=L8dO6G6ySHTwXyiGQKJ98FFq8iEOdezYRl9aN0rxZ9t/UhrqI01TjFoXccfUGWHsiJ
         3ByD9Us1hkDW0gFmxwJrI+kZeKLKYauZf6jbjL7zeS8o2jU+GlKW66Wtf4ZqhJRk53CH
         wvxBVrf4Q8HJig6pY3zT0BUbTIcx8bJ34onDClzEYWp0M/HIIldqsunRhUwIOgPctlDS
         Gsiopg8YP9NYTrEkmP7I83iUQmHcDDqZu5DOZqweXTa8dM4W7DxBwc48SazVYm+GMbu2
         Y1FQtyyOLNy3/jXivFMZNsr55YMnkDU2d4+XHBnxe1cfD+TfmFPYbuIYamctOvH5QkYw
         qBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085350; x=1747690150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwu29EMYbHZnZ2ingPRlXQV8GOHy8olFZlFGRco0m+E=;
        b=QDYmSZUbA6lYCaDDwMI+MY5971ayPpNKE30onEHEOGsXWJkRbUTPy+hx9nVD5ogxoM
         UgfeoKKPruiZbC5WM5/FaIcVzgKdgxrUlh08IZsK1CriNNruLtI9+scH7Eu+w7BD0DO5
         hWE8RH2i5vb3J0pI3dof/LQf7mMbCbye8gi/AaNzfv2YgtqrifglJB/RBwimYql14WhF
         kRoeajEScyxwwldJoAcXPLHxNczt752ECyqy+xpqMIHo2M2A8/rEiQXYg5FdTMfcJEh3
         P/o8Gjrsz2aplZR7ZwGra/g63ZBX5IUsqCtfiXkH8nao/dm51LfDUgUGFdWzsyoSzEuM
         wksw==
X-Forwarded-Encrypted: i=1; AJvYcCUqv8t2h1dKq3amjDg/Iscxd1AGhh+6poulLsRUJ/P8vuOnWeO8uo0SZGqRDn6WUYaXA2u0pUUOPu+F1F+RT3lC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHjKIhSWEMDbMSzKl8xG505C2Ficl/3Va4Tas+FTnf1D2O4k7G
	87ymd9Twzz1H9+JHmrlwfBIzJ7gdhiSiN4q3W0rPBJROJNbfpRMm
X-Gm-Gg: ASbGncs9eN6DjnDbX13ZuAmcStxxtXHM7oHOs1pTe5GScLsCo1WVTiZfngJjL5smnVX
	Voa/2HfoP4zWl1uAezUjcJzwRav2W0+OAcf9i9SgeEJ9AwOYNsO9xJVOAWAxPTCCG2a1c9z7fRC
	3pEoUnPKQghovGqyxJJLkd1phtW8W3RH5cndrY6JJgF2icgOrO4NdB7jQYs0K5nBuH49ZZfitVX
	BMdYJ1PeaeOXA2XjTbpzfdkShVVKfwM2RAujo47xCzbJguTz0guunn+OChcF/eERMKNDcdOEknj
	WdH5iN7hecF+Qd9rAidV7SH14M7uDFkX6jImF42IxvXuEXIACNLJvFNndy+7A5k=
X-Google-Smtp-Source: AGHT+IFh9UpWB73Gif9/RG0hEasXz8yA7Q30IuXmnkfuwvL7LMAjJqRJGSW/yg1R6sWeJzfxK/H2Rg==
X-Received: by 2002:a17:907:1c17:b0:ad2:455e:6ec0 with SMTP id a640c23a62f3a-ad2455e72bdmr811477866b.20.1747085349950;
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:09 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 08/19] dt-bindings: media: i2c: max96712: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:17 +0300
Message-ID: <20250512212832.3674722-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142911_539970_178F40EA 
X-CRM114-Status: GOOD (  12.60  )
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

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index f712d7cfc35f..758c0223977d 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -79,6 +103,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0


