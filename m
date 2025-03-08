Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=; b=2qHEB+DGYJOs2RvHpPnEa6YwKD
	HYgj/66jVSoyobu3ddntKlYCCksmplZV13HelwZYOWscJ1TFH6Ud7+/2SxUQ+IWBHWs31OEASwF8t
	abIsClB+DcaVBIe0sqDhF4dSjU+T5zwaECtTq/wLj+lKCGUfV4a1lIrXJL1N0vSPNjvg651oL3xmD
	zk+FN5MF78witIQK3/9D4xn0HYTB/rOt6UAYLTCuRkh/C6sudN1aBLQR9FVRZnUw6nSzGb0Q8Be85
	zycf8/55tzfv7xXFTHSAdJfQJWA+z23WRmSChWp7JNwvwnC6FpU8DEw5/M7vG25ksmpPaSp+aZDGB
	oBAqLrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzGM-0000000H3Wu-1utu;
	Sat, 08 Mar 2025 18:51:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0q-0000000H0HN-2nla
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaedd529ba1so361116666b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458903; x=1742063703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=fT7tk/zEBCAe06FocKWfmPyyNJAjMEuv4+0VlmxvKC//U8c2gmzkanA98lyi3NT1hF
         awVvTtOLrelOpBUY+XOyr3MVkwL4oWBwcBsn2GchhSOQKLQ1B8SpxEIoqhBGtcoCDTBB
         SWnRIU91FsURMmDdg8Nc6JNh937nRURnRHORXUYQfCRjSJ+WIFS2TCY4gwWgWzgjpx6C
         zuolLueavBDtpTdC98i5u2dYK6pr14oCddIC0exN02c0Ru5IyuDI4BS0+es3B7yy/lll
         0o22rbKVD026+ksEY9U8iy6EwswvepMS52bvLzNrq7TmLKY+TMEPSzrg1reIESpdt/VM
         KwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458903; x=1742063703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjrbihTdUtYGfD1XjXxp/0dpy7KX01NaPnhDGGHP5+A=;
        b=rxIbA+WF8/k5aczSLioGtQEVXFobBindPaw7lmt1YWhhUM5E6m0LQKqiJYpfZSyT5y
         eEnZWsi08RVJzZvr8lzQwIyTYMabOiMq4mIHo32SnwxgaLbsFPPWUbGO4QkdD6UTAUz2
         gKTOp0GyBvXAzYmY5k2gc2TeJZ1HWPBqxoNDzX6URCwRSWNmbfvtRTebjgC3SaHUlow1
         WYsV92Jr0GImOxPrnOpJBXALe5nMpSmiCVGWf6owfgJCh7lbrX4GQGY2GDXg3I8JYTM5
         OJO4qriCFfP6bG+/sFFZrtz2GAIloX4AbsFiG2mms0BKbg6amw9aB3+BWeIBgQZDUVca
         x/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxRsWMZHCqxz8NOVlQSqQVdnTjFLsWAU4juIVV8Je18dZn6ilxojKvMywarHk5+yjfkpnLnN68SGwpUGlDTKmC@lists.infradead.org
X-Gm-Message-State: AOJu0YxIu3FhmfWtdgQ9pwiiIxPtrZtq1ofB+g8HbCOiLtAT9HT5GjmR
	daLav/6j0cuZakN5ogsvz2j1IaCuL2OXs8F183V3k+Bp08Jh9cc1
X-Gm-Gg: ASbGncufPVd3j4sG806OSCDqQbijRUAtJdrYOTi7DHHbRYS2B2RTHD+HyIYQ+RewKUb
	kNsOJamMqpTLMYn19lPPuHC8mlWucUKzgYmMut2DXTkLBW8F/nxxWFQPHaCT6cDM+odigpTDKOn
	qY8b4DnRnL71/oPGUaJFYiAv/JHU2TfMaBOEBZif2gp3yZshu1bsc1wMk8BP+c+NCy4+QwYLlGz
	+sVt11xu06KznBXZamOxtIcixB8eAFPnPyE3s0S0jkQbzzewQ5xEr8s++RFmj89o7A2FI0/yTSo
	sFOmdRWW5TV7HRAaoh3BY4ViVBVirMoYMcz4zRnVD8o5z5rMu8NwKudjiFtQxKdi9hzK
X-Google-Smtp-Source: AGHT+IGwUeddAVefNrp/Ox4/s1rrU1bRHiJ+ldxf/aGAE6vsUOrAaQ/XHMxMfTJtL/YGjYojnUCfRw==
X-Received: by 2002:a05:6402:280d:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5e5e2468800mr19735826a12.23.1741458902826;
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:02 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 09/24] dt-bindings: media: i2c: max96714: make i2c-gate conditional on compatible
Date: Sat,  8 Mar 2025 20:33:38 +0200
Message-ID: <20250308183410.3013996-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103504_704594_F9B93786 
X-CRM114-Status: GOOD (  12.42  )
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

Devices to be added in following patches don't use I2C gate.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 2f453189338f..d0a2aaf7df9c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -84,14 +84,6 @@ properties:
     required:
       - port@1
 
-  i2c-gate:
-    $ref: /schemas/i2c/i2c-gate.yaml
-    unevaluatedProperties: false
-    description:
-      The MAX96714 will pass through and forward the I2C requests from the
-      incoming I2C bus over the GMSL2 link. Therefore it supports an i2c-gate
-      subnode to configure a serializer.
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
@@ -101,6 +93,19 @@ required:
   - ports
 
 additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max96714
+              - maxim,max96714f
+    then:
+      properties:
+        i2c-gate:
+          $ref: /schemas/i2c/i2c-gate.yaml
+          unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1


