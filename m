Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918BF8E49E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 02:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=; b=V1uc8UBiEXxSo6ZHtyZQn4RPbX
	dbg+R/kBmUyWcTaJ6oxmk40bfPpLUjadhMLNIHkpOgDXwPyx9NBBQAGsEFsqzPgQ4Z121uJbs+Jzj
	vQehQOS4XI5CNLgfqnF8qMvQ6YCifAh/B5XKFxH2VYimoTFLnUGYODovD39BO9ZurDMrFgldjvPea
	+CX6MjfiUXz0M7mejpxj0LOCNFc6fG009211PKF/gej0zwBzIevPqZctOj7nAmSDPU0cwHUflG6mX
	1FzLyDXc1khNToktkiIe45jsg7wYu4dtt7pZGcEU43R3G5e/PQ9Tvx9MrgjyYXVa0imbEr1PWIiQb
	bLUPkw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYng-00000003K1R-29Pz;
	Fri, 17 Apr 2026 02:19:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDYne-00000003K0s-0fv9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 02:19:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so606673a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 19:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776392357; x=1776997157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=cq0EAnMf4kANnqjylPufZiddTQ7BBboPMMMtSyPZg0wqteVbxhgByVHBW69YPKWLei
         BlnUNf4B6ZXaTp6mGRpzQ5P9iP9RsrEtNUvGqELu0Ai2xeY8yYqU0LwGa7jHpq4nXZpz
         TuglfyCwNvy4cdmpapTkQHpZ9uTLfwEmjJKALOO+FcVk8cXwCNiyQtz6RlV3GF43ZGhN
         hWwpIeNHmLU5uapZ8HAuovCNAnDzcrJB+S8QTGI7yBn2Au8qr1hckOZQxvNVQ4a+4aO7
         FruAoYPO2UJ9eDyBsQzc6vPrfX9DtyRF3vG9PuaG4x4zDnvjx+r1CVGpBBtzTUibiLkO
         ql/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776392357; x=1776997157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG8pXz+YVfOJAlLhN292spUHd5vpocuDHEllV74RzpA=;
        b=GlRIxZwd3xWut/D9eJeMN71DUbyrpFjDzraexYu6JEbujoHchOIkQ3BKfAVna2QAq+
         C9iFa6Jkia5OJOUfdhR4QAJRzExsGHU2sS4lbHHVp9ahX+6QOCgA4E2hP2+TGqlEYRsL
         jszmMoEy1DQMZ0+IZ6sYglj6NcLxkEotfDE2SnGGj9W4tfoW6Leu8mf/chieCljJOFbV
         +BPDoaHYzTsW/HuNvfbm7WNBW7xlkNNayFFStUOQGWqGuQxcUdoMxSwHEKzdU6rTyS4i
         2u+Ym4jYsii75qCdIF07AYA5ByW5hEnOZySB7iGuHTht8RUYUgBHsX9v9Rb6ndVzYLKC
         VBmg==
X-Forwarded-Encrypted: i=1; AFNElJ9Np+8Aysjag0WwkNhBusLPXAqC54CYAwAcraxtQlN91qInSnA7mgCAgmsOlEev7CvphpOOFLD+Ae3cvrzZhj65@lists.infradead.org
X-Gm-Message-State: AOJu0YxzKb7VvADHr2r4UQhqSNGqWj7G3y4fsoLzGvMBRo6Om3J21BgZ
	0Rd8Szax3zbk/YeshI8xqEtXn4PURXf61N6t03mwL8i+mkX/xY+4HKt5
X-Gm-Gg: AeBDietYvQr4FLZJZA1o/uTaUksQBArBRmAradTtN6xb6svMfvTiwq9WeXBFy9MC1B+
	i4EQcGVmWB4O9NVHwsa4JEmuZWRZGQWRzDWNrxv1dLPCadxRj2hiAbvYI6RIqpYdIeqL2PnTZXf
	7nKoSFNvhjkHoye6yzUQiC8dkBzuR4Ctw2XA9rlq1Szh8aPoiZXzS9C6VjmnASYIJB6wfwwXcWA
	tzPhhla6dNr59m7Uiqppj6zxhNe3zKCyfa/MH7iKRRBhKWQijWHXdlCE4eRQ5064aEi46CeL6HI
	KPQO/i9EG5le4uRl+qtOV3mt2hWEwetEGLnNgubbuRuqfO+aQiFKlxRQ/xvcVoZnXTkszNmXF39
	uvb56lGWEQ5Mg8vcalXP4tWseOku+ehBLCErGgRUMpxdZp9BrpImazv4hnbsVUHIsRg1MoA8Pnm
	j3U3QJEp8PrOLRv78CODCIEpXfbSEMFx2kerFXcuUhh2V8ruC2XZd6qW737CPsRu56o3CL
X-Received: by 2002:a17:902:bb96:b0:2b2:5168:2f82 with SMTP id d9443c01a7336-2b5f9ed4d0cmr4664685ad.24.1776392356836;
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm2755845ad.36.2026.04.16.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:19:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	lee@kernel.org,
	heiko@sntech.de,
	gregkh@linuxfoundation.org,
	linusw@kernel.org,
	zyw@rock-chips.com,
	zhangqing@rock-chips.com,
	gene_chen@richtek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
Date: Fri, 17 Apr 2026 09:18:58 +0700
Message-ID: <20260417021858.6582-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_191918_228394_7A6AA40B 
X-CRM114-Status: GOOD (  10.23  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The 'wakeup-source' property already has its type defined in the core
schema. Remove the redundant 'type: boolean' from the binding file to
clean up the binding files.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 +--
 Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml   | 3 +--
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml  | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 9bf07acea599..26ea78df27c4 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -88,8 +88,7 @@ properties:
       - 2 # ATMEL_MXT_WAKEUP_GPIO
     default: 0
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index 0676890f101e..a58d9455a1a5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,8 +44,7 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   vcc1-supply:
     description:
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..ec0d83220527 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -33,8 +33,7 @@ properties:
   vbus-supply:
     description: VBUS power supply
 
-  wakeup-source:
-    type: boolean
+  wakeup-source: true
 
   connector:
     type: object
-- 
2.43.0


