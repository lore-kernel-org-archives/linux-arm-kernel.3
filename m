Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC58CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=; b=wiFfLNIiX5bG5KoRMFuTD5/LeL
	nATrw0SU8YxI4LpfFxkndPw2tufEJtsWdv7qC068dUXeVOAASnRkA+OA3+WIH1N+3SwxgAyETjv+y
	2PBXoUeoYTfDDm7KEIL8AOLEd47Ldv7Hqp4HvtyWrlaLbqWEssrOmYW0XYDQDO96Lk1+wWhEX1/cy
	ObVHwrlnMYP6N8keErh8FJvJrDglAKQZKdL0LmGumMT4uV84RQvH44r4G1Civ7pNUAA/jR2h+FXI9
	xe3l/9NMPBv0VSN1Vq00UgYx2CIF7N+X+H1HTPZ9bSYq4QcXytg5ftCOWEIIoQadSBhandD1EY/c0
	IfkvydgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucnWQ-0000000D1r7-2Mon;
	Fri, 18 Jul 2025 16:01:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmxv-0000000CvuE-10WQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:25:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45617887276so15952305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852338; x=1753457138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=e2xtpxNw6wW/5dsHP2S6kcUpsmwqcjARC0WHHgLQLi/Gem0HZZJqJO8jrjArHgjZZ1
         X8Wv9MAHdS3BK+9Zb2ig3G5mW7/KyWDTk0cpQwSyYal3X/ykJ1Pt0YMOgyRJy6cWWxsy
         ROFbDuD3xRcEZ8Bb+7xJ3v/OmOLUXqseJRTGeM1Ja1e30LJZrdahgZ52fxVGDwSZFr79
         iz+EqLdLp/Se3ekJZH0Qka/8GHzlq5tZ3ShwFGk1TpzIxHRTtX76iBlr8FYHyS+/0fbm
         GCt3lA4RKw84ZtNBStIn0FbLl/yjsCmvSAg4HbSemwKXD9+PEtQ146v4pqTT1dXauGjq
         b9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852338; x=1753457138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=xLCUZDqlF+FngMYWtkkIDjzhHl6VPnhuYqPJNWl2cLBLjztV9pDftLB5usjsTXLG/e
         tbUpBm7m+KicKpO7BL9aUvDTke9MUdhJWgj6SEOwEaBrJrLymAqElJtQCsa44af8yPMg
         sggkglnoptHTHZwRDCrEpthHxwcUdlpoWBTPz+hFmFwpAydRXs3oTLqha7+04qdicY4y
         GXS5u7DZ29h0OTWkHQId+35Utb9UO/hc0PLbCZzbLPTXLzPtugNB7G702PWAJvwPHpwK
         BtB2lldVNwZ6Q700m53JRpts4kJTbZMrb/k7gHpI52jpPw4JbJzjW3Q4JXDF8Og9o0hy
         ptKA==
X-Forwarded-Encrypted: i=1; AJvYcCUMyOsarEAPzldSKdztegiPsxgJfuXW8LhR9FRznIy2RRCBX+CHKKtOGEljIiQkLIpmobWKUfUXfb3fMHEdpeCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwJljUyVogDmp0V7KZqRiBS/O1Jr01ngoUq3lxOg2l8gz/fu8Yl
	5dvH2DD6wCzngIXkmusibSEWbmGv70V0xZGyTrEXyzKQtk8hQDYzo4gk
X-Gm-Gg: ASbGnctBFl5U4CFJFxyWF5lYN+83/84d1JgD89Ca63rhlafaNvg/Y2F3RX9DPoTv+3K
	r7C4Cdp/9/8/mMEg5D3Lp+4Fl8RQnnzsYI+xL1sqhuiivu3QzCiWuZDDJKLTz+QEi3jrM8Pp6LB
	JIl6q7cEwWINyDLcsaPhUcLLzKy1FpcQc4tycp1hpoQNh13Aa9nCQa2KPMOhtN5OsRgsKGkwG/0
	lYJrIRxETWUCIpYFVYtsZ1Ab5Y/dgZ98dIOfaz1Z7Hgl3WtyqnnSg+RLxYEn38sbKyKjw8SiTXG
	KD5eCTOTtL4NQqerCnO1v/nLKjIM5BrYGvYQ/cFSv73J/7AaHIKWIR2xaDiCohAidgWLwioNMMj
	T4/crfF95PeVLD4lO6nB3T9n1E9jQ8uBGXfw=
X-Google-Smtp-Source: AGHT+IE5lNwdStL5/SrBlIf6tWKMBMLK5frkUlrfnmTrecW3oIUA3xfQTspp+f9g5Mw9xcEH4CSpJg==
X-Received: by 2002:a05:6000:230b:b0:3b6:cf8:64b3 with SMTP id ffacd0b85a97d-3b60e523d6bmr9233370f8f.34.1752852337475;
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:37 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Fri, 18 Jul 2025 18:24:47 +0300
Message-ID: <20250718152500.2656391-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_082539_271013_71B26A75 
X-CRM114-Status: GOOD (  10.62  )
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

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c3..5dcafd46344cc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.1


