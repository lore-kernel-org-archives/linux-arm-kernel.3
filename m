Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04AFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=; b=HFQX+z9nOauYmvr88TBaOPX7Oz
	I5fra/BOQq83GUrYyg3/us3yI1OiCn8xu0beckg6ZfP0pdW5wKHYrrWvqIppc4PAlUeJETea/O8R/
	SmlvB/5N7d6/5fbR0ZP7k+XSliS0qpVbUBxXtidlIb5I/Z70kW0TxZJ/XOdmqEnDvwACNYzS54ZX7
	cT9WWtDDvjWHSTdRGs5H8EVbJBp0K78UAn8wA+jaY4OePMrsQPoJcU9BQsIaJfazpQsGkhwVp8aOT
	bzuSHMnSLmx76CmChpab2hQFapc6/8wI4E5qGdaKjqjQCV7jErwV9x/1TdvxAOpUnisO3WKGiXs1i
	0VgRfS6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWy3i-00000008ZCz-1s0R;
	Wed, 02 Jul 2025 14:03:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxPC-00000008Qwz-3xtE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 13:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=; b=Zy1TICRfuI/r/sFoGnzX/4fD2N
	nSMAYZ7YoM1+eRmDG4byzbmAfC/xVlf0Fi8sx/7Et3yfbrxaDC0P4T2nSjtNJGlFe+bm2FYW5ITqN
	D6RflFikUT4iSzk/XZH/wj3sSNfRiBcxP56pbDWCLXA3WzlOSDHXAc4Owvi7IXKGZYNDWWWNHn4Yp
	2ELvoXdEoMVLF+oEwAGcrdD0PHFtO8KObA+xBabHrqh6vMwk7TFWXoKioDwFbwC4COeDsKZATe9dM
	UnM88PSRXk5svN78jtwn9ZFC1Sfh7HqsDmpH0oualKaCV29Lv7JcgZCR3Q1DgzPpMNQiWxsFgYezn
	9KntoJew==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP9-00000007PHJ-2vtI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so1191751566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462498; x=1752067298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=g10BXDks388TfbjHa/h5qy1swQSa7bnAv13idP+YVkT9T4u93vcpUXqDDfRwjs3DKn
         HAwiycgvff+B2LMwvsuLSZB006nUmy8OfJZeqCTMl9aZ0wcb5VVMZj+j7tSrGOhlM0NY
         U8Jsrf7XKLhcxgtN5HNCbIaQjatcFptymRLVyuPrQHpV5EmmDjOm7TQJr1T2h6oXWFf+
         s8xqyocK0YlSGevfQpjPpedc1G4y/7Z7L69iItmldIJ1G6kCr+tbpNGyc/nlUH11VGdv
         xcX1MiNEbHYn8U4s9iIKT45e50V8BTLphhLM6yDRPwh3Dlp3bsZymDdac9OPAFdtqYiO
         uv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462498; x=1752067298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFetkJ8v62nDUZ4qivoqFltXa9e9lgHI4HWafIdFbA8=;
        b=l1U8h18ffapMQfdFmf6DOGAJKl8ss8PgU+dDmj+U0QEbE0QtgOzryeU4CrOq7DJla4
         YBhIezGMtl75dZ2s6KhTOmGuv0u5yr3IeJLchbKUiPZS6PiXMELV9/FqVY4okAzgwaBn
         4jFH040Fo63UzG5HGPs9WMua+QAmxDWL5F8wfN9g65c1axck6tduqLA4ybR+d+h2xMV+
         clfYAJs/16VeDf9neIyfW6p/dtEs8i8/4SY2Ue5oknsw93kZN88EHCKiVi4jwe3R9nSU
         eRNrogE0wat8xd3nDa0F1Ol9zXGfFe3F4AY34pwuf14kLiB2Nipgf9yZLZtU1d9U6SMZ
         Nt0g==
X-Forwarded-Encrypted: i=1; AJvYcCV/898mCMVfX5oGWjB4GN0kCW1fUX69BsfJcFBt+f11sA1ITMjDVO3RSWY84Dep1uY3DsrhX+XLog7LWeX7gdx/@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBeDMk6/JR8fI3Ift/rFV9RghwUG809n1ynsihBQ0nyF0UsQL
	lPsNtTLq42/oa7S+y+8dd8cpTbeu2YmC5+sqZ6cdlXPFcXN7xCPzw0V+
X-Gm-Gg: ASbGncufkKHrNGCHLNrPCKBl0c8JWl3YB6LDny6HG/Pfcj9xl4uMdn9Tkk2u3ewJwIB
	plPeCDNY3wTqeIr+G3jpg2/OFv2EC+DCvTkI+Fwc4QoBmwtXSvDJO1Ah5KIuX9tiI/tuJGjHxC0
	yrwCTJj2vanZiHB2b5+DTFlLsKOw5M1gyhFP8nxlpiF4+4nZX5LOtSEs7qZTFsbxQFxBjkfcuyU
	cVWkYctUJ7cXMrTYOx/nqHlJPDd/jE/NH6Xe7ZJtvOtrZQMp9TrwAS9UBTDSGOrCe1Ih+wk7uqX
	CmHAc71FZkfBQidpzpPs4psNEOaw8m3ktQkiN/d7Pcwp9KcriOfGw7LkVtJUaUIbRPecuYd06sM
	=
X-Google-Smtp-Source: AGHT+IHI//NlJkyO0mAJLjERVp3Si571/ndIJ883TF/dcmn6gSg4Dwn/0R3LyLHWa3KrwYYCeLuPyw==
X-Received: by 2002:a17:907:3d8b:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-ae3c2d7fa07mr318636466b.40.1751462497763;
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:37 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 12/24] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Wed,  2 Jul 2025 16:20:38 +0300
Message-ID: <20250702132104.1537926-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_142139_867580_BC54DFC7 
X-CRM114-Status: GOOD (  12.70  )
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

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a89cbb2d14a..2fd3edef879f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14736,6 +14736,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.50.0


