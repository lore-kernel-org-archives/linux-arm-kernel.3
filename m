Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB4BD46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYZ9rfGW0tckzimm929FE5Fy0C24TkQSK2Yn9ZYCQGw=; b=W7OopJo+DXABv8GbDgVCCtx5/t
	iJmBF80SpGIH7hqoPRTwJp9GFgHdFWzz7/tvNGhBHYhfNRyw9NemM/Go587IF9bL8Vrhqjz8fTJjz
	Q6oTMfXmAzVyIWnGESb3L1PEovhfomV51FHBxpP3LBlPPek+Xp99nbuoUqeY7m41HkI7VJ6551DXI
	mhfopM5XqYoIjqU9WtVCtEOVdfWxliWcD2i3rZg3ydhw6Z78xkF9Hr40IOHMi5MPCJ1uqmYdxuSPF
	m1tIlslpXndzMeERE/j4yUnQGOeO0bQrVpJqjjI2bx9K8vrqi6VGgY5cxzifvTJuQSYdA6eFFHmfF
	o9EwAEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFq-0000000GmAR-2sKd;
	Wed, 28 Jan 2026 20:35:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFo-0000000Gm8U-0a4A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43591b55727so204694f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632506; x=1770237306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYZ9rfGW0tckzimm929FE5Fy0C24TkQSK2Yn9ZYCQGw=;
        b=VBfYMTVc0+zyd4zfkus3zs8ErlB0b2VYm+L9Rjwo986Z1vFlZNg76/8SCe+qZiLlEO
         rOSR9PFJu2vyFXJggcWfx/1E2yDALqOQUxD4dHQn0WvM/m/pbMD+4/mK8jkc+fkiAQV1
         NdleFCuQ37sT10FBZNHlHrPvxeaaGEsUxWOo8hanSVwfUty80TfH+u5/YOzJacUTaiIY
         9aMb5eUMaFR9Rc+siImC9nW604RU08ZRgI3Ak9i8N2dpIRYwnAEmTOWHcVOBXy4h4LtV
         PXLPySKIEc/1CA+xBjfLWcdqoEmnidX8EQBCOBNAOuda0CDfXlfglmbYnH6+iCQz0pCh
         o9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632506; x=1770237306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYZ9rfGW0tckzimm929FE5Fy0C24TkQSK2Yn9ZYCQGw=;
        b=r2l+OjsaXB/YnKc5SQ6iw0ocGokPu786JkzI6cOPPi6v7Zqch8Y/GtLIzTu5pjzbj7
         N70WRXHk/SQHzxGgXERvX7Hpu8ghi8WZHEVH2/R4bpd4Hqc4eH71DSFvoh0dqOdWOkkz
         pXsGlHipsaPyk12sO2pYT3PfP5TXwTUoyfiwrvYn/Zd7HUSEkIPhsVjMKShVifpCFhFE
         nl4UobTOk6jf7oDb/1p2+0ugaE1WVnNoudCVakIy+fF2Bq9z8Aucqtn7e3VNbwfvl6g9
         hhFfATokew9Wm+QIHmI6QCqTqJOHnRVpBiDjkJF2C3FMGA4hd5n++C1YuG0/Ud2SZZsd
         liiw==
X-Gm-Message-State: AOJu0YzxyYOR7AFq91xCnlz2cwdavF2hdo0pjV4cx02GMqCMg6k/NDWe
	nm4PmleB6QNF2ta/ppdk24v+wgN3kTINTvrENeswG2IdQeYXNtgEQDKSSUowVZLT
X-Gm-Gg: AZuq6aJPswYzwYMDnOqEVUy77iRzxlurHEW6PeXrGKxqatiGLQvbo3VSL8EhJXemPfF
	QgUXgsutlS6dUeFUOdhxNu6C0+3L0qq8B+mn5NiBjQKvT35Gb/YKzByYy37lVDXY8oy/PuHU71c
	bzjHi9XetAX3vydKQUmWTrUhVK/ptRd7WXT9s7A/x045keIf/z+zxOh/xqfuw8tNbmGPjgIemR2
	WLMxApoVQ/gZJAfXEmuNss4wiCHkbbv7rH2hzwzNr2hrImpRID7NrzBsZCF1wr4z7gfrpPrUjDO
	fXFW12ZIV9Yq9hs02Lhgke0OikL8MvHmfY1mSbIlr0nu2PYAQ5pyWx/VTBrLv0wLioThfS2EZV9
	vR87ZplgKdQAX7DpTBgyUJxtTCxumWYppO4HPL8KZyJgAkxeYUWMwG9d0VTGY0zlr4KYZxnPxZZ
	Ton/W4P34gwhXfq3G+YFx8Tk3V
X-Received: by 2002:a05:6000:288d:b0:435:930a:658e with SMTP id ffacd0b85a97d-435dd1c95cdmr9833119f8f.53.1769632506305;
        Wed, 28 Jan 2026 12:35:06 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:05 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 2/7] dt-bindings: arm: Add zx297520v3 board binding.
Date: Wed, 28 Jan 2026 23:34:50 +0300
Message-ID: <20260128203455.38569-3-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123508_184735_C2FEA32E 
X-CRM114-Status: GOOD (  13.70  )
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

Add a compatible for boards based on the ZTE zx297520v3 SoC.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../devicetree/bindings/arm/zx29.yaml         | 20 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml

diff --git a/Documentation/devicetree/bindings/arm/zx29.yaml b/Documentation/devicetree/bindings/arm/zx29.yaml
new file mode 100644
index 000000000000..717ca6413993
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zx29.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zx29.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 225392cf3b5b..0989b2c6c157 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28394,6 +28394,7 @@ K:	zstd
 
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zx29.yaml
 F:	arch/arm/mach-zte/
 
 ZSWAP COMPRESSED SWAP CACHING
-- 
2.52.0


