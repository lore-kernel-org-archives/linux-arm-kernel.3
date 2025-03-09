Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2512BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=; b=lX4Fa8eUe4dMsjSkeWvw7ZWSTV
	aY5n3tYmpKj1JYuoi07Oj/YvbAfLpEHT75fUgytiLOC3wbd+/NcGgo7EhWDtEC1Zyh1qhAFMSz/FT
	YfjgmIyM8IuKLO9foHUMg1GqHZyHlSRyQLY7O143PLlPV5FgUW5b5ZZqx5Sr5bLUzrNk5v4DjsRUy
	1WHkIsrTTdtM6NA0y6vewH1BUOfCf46nHgfBwkJ3oIGFfLoJYPqg3fcrc8YZUvgZc7HsoiXO+KPTN
	lONdUsYUFQNsYW6cB/3Pe8tTXmRzQqTC83kLTuT/YTfA1OhU/n2DM1Tenol0I08EwfJ/hgzH74KIn
	Jn4uUBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trCal-00000000Eck-2pg3;
	Sun, 09 Mar 2025 09:05:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trCL8-00000000CUL-27IO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 08:48:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-abf3d64849dso380928866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510133; x=1742114933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=gk7R6Mum4q/35jO8vAbcKTJbTbfxhcKxuZwURc6wlPBQGa5TFKnbRpvf0S8r6phLE9
         XQAykVOMtBkGEC7J/2oaINoFgCrBVcUFZo8Pwfa62r8cN1C/ZPxRi7tDiXDnHoGxu7W1
         0XeI0ShVLzMbQZhZFM/LkuWF8cpL+A0QComjW+KMe3RNIpfWfjsbarqglwqniHwQ0gmm
         fdMQkMc8h3QStLdlBCFH6hXqFeN7caMUrcTs9D5kEcS62hDLLwIg6f+ZX+CXz3pVZnxm
         cd3KT8J3FbOxovVgawpOzUJAOhUij2IsQBzNGIYgtygvLs10R+2SzyE1BrKncfWWXsu8
         l6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510133; x=1742114933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/XMiQrVzYH+TzZJLylgzzmMHkdleZU+slDLqGTb2MY=;
        b=QQc71da3pt1h6RO3iVldPf9OzNOOTiMVXV/mupLgv9ZgyrdBf2erfkuXzRX//7/4QB
         EmAPW08JxLasg0+LZQz++91S9lK8mig8MDfB3ntRjPnIkQOm18g2G6JzgExFayUfYlJA
         p07LM3mzgV/SIl/sV1pE3ovsNtStkzb8z2XNd+GfXWwpg7yJVD2x1TxoQItD/abMz6IJ
         n9B2y3eRdYiflc4nJltCpX+HY1gfHJPPpXzB1+ozMD53ff3HVGRN+7gPPrNPUDf6Swiz
         u9p+n2oqy8zsc6JImakl6+rk7nam55Ma122D/joL/6c4pvre4eDn7V744iw0isdmfHnr
         nSQA==
X-Forwarded-Encrypted: i=1; AJvYcCXRELLe073xComUnvrzkodg+LvIB+DhrHuiCwJYGrYRbzypc87OT5teSSu2b1Uc+/XKU6O70M5Mi0ltpnizkJfs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz43/faHUd3nFBVF/lzdiD8s/f7Yo3IdXMlM8M0DXay4lEeDOVW
	vJj8d+4Z722nDoRkL0OM/U/qJOOJx/dGh75UIdwskj0NZdSgRJAy
X-Gm-Gg: ASbGncuVn3QgPPTsJ1EyR0YAIM5Q9AlrgAAfGXNMAXXtna40Foc5oDuOvsPWAP6XFFD
	smwH0aU6iH6xpM/45gZZbwLYVhFVl3Lhfvvv7AqXS0FqrMeqord4ov5Z/6CcgMGYP3XFsr7zn5+
	dvgGwKK3TxP3NijqxwTQpBG+/bsOqaP+Kz79HEajbXDcPrZbeVvGNzJ7FkSzxzsNyiObWNf6o8v
	sg/VFHKEVaPCItInerpnU1UMOC5VBpLamkicHExkY0SfHdiUS09AQBicVim3BlkjGmLcfuxZQ3v
	UThzKoErVOG/JV6Nr2VnKjJYTvbQC4ueL3Siuq6POBJpQeIUCTfx5XrJtczWsmS5ct20
X-Google-Smtp-Source: AGHT+IEEWfGQxkuZd8tf5P3vShYuUP5N/11BTkYFYFiWpUuAwDxrOihccUqBS80lDlE4wNLi4HgKYA==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr24297960a12.23.1741510132648;
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:52 -0800 (PST)
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
Subject: [RFC PATCH v2 09/16] dt-bindings: media: i2c: max96712: add support for I2C MUX
Date: Sun,  9 Mar 2025 10:48:01 +0200
Message-ID: <20250309084814.3114794-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_004854_542345_1CFDAB0A 
X-CRM114-Status: GOOD (  11.68  )
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
address, causing conflicts unless the deserializer muxes the I2C
channels. Moreover, the serializers can have the same hardware attached
to their respective I2C bus.

The MAX96712 and MAX96724 suppot I2C channel muxing via the GMSL2 link
to facilitate communication to each of the connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index bf8c861c836b..9e27568e0105 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -37,6 +37,19 @@ properties:
 
   enable-gpios: true
 
+  i2c-mux:
+    $ref: /schemas/i2c/i2c-mux.yaml#
+    unevaluatedProperties: false
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
 
-- 
2.48.1


