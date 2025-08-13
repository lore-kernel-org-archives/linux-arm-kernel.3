Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB62CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=; b=rCFc7Z4U28oEQ8gkaQ2N7GWZsf
	ca5Lh6eTinP3T/HLZo3ScB8ZYsuHYq4zF0JLLFl7twvVD8FLi/UYuoIS6lrrdqthWhvIBeMqswhhT
	wMOkpBmFqdwLEAbMb116FdgbUOuUJxSYzoAv96KQJZMn1fM8dD5WEp4By/oE0mjgdjaKUeCLfyoc7
	rUPxwEV2dclFDAvMRYltuY01vMFYrvFI28ldKK2wIXTC0LPVdeApLonA/3Vw0FaS0iSUyP+YISK7j
	UQKiHMKZyjdDiy6TBqr9nrt1z//yBxymZjEAaRgeZheheNgVEsxek6mvgdtvhbVOExkkztiawm0TI
	CjLnMSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1yQ-0000000CV4b-278A;
	Wed, 13 Aug 2025 03:16:22 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1vq-0000000CUkO-2NlU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 03:13:44 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e40ac40940so2728465ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755054821; x=1755659621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=PnMnonRbSACDqRAuvGpnYXYwd09bd90Qy4lgJVxoihZgqRj6f6r2JqBgNbOL8AXMQ+
         Sq5M2DZ/xzOEcerc2kYbAhdcgnpZozII872m19JyfBZlWlC4et2q7RDgHr241USUPTTz
         KGod6QvCtfXHvFX9k9gyVO+CyS7BZ7CUvErDqzQ/7UFqkLcAz2mgdM0dcDTXvG7NDI+6
         cORjCOl1gwywiGibGkxHq+oB7T4Dt6eYJfeogmfgLJk4b6RoBFYXeayrrJtTrkIcUGQ3
         5Cy2CN5DJQgb/XMco/gIsGuAAr5e9xufOXBLzKegY/vFSLk8NyIjmN9Bfkp2dsjlEPMd
         ITLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755054821; x=1755659621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=cvYYJhba6prJzuvxpBkqkwsKbRy7zJxPq71wyCP9ZcarBPZS+qDaDGiguKXNOd9OgB
         uSaWp2UD1c/ffKwCuaUYfYxj/7vj5lI24I9gpItVv4Gb+fAK3ag8f9Ep9jGV1qomDKeU
         ml+NgQeSmDeU5MxQr41dqjlkGl55lscQHOIU8nK3xqlM89tmz9Na5iOjlz4+7UFL/QC/
         8KjFzqSbYXBAVced2aomqAZAUpxMP4MJL5cyxduYsOdQrQWKFckRbNNMo9lkTwGNTUGm
         vE1Pdzs9AmpERipt79aKwpcYACZgbVenuQd1qXb+lc9dIvhje4vx3j+ISK8PMbr9zs0Y
         1fvg==
X-Forwarded-Encrypted: i=1; AJvYcCUyMsL9r0LiXo0kW1kTwyRNX57MmduX0HlI8VYm8TD5qbgAn6F43zVgBiK2Hclf05FIFKzurFgZdWJSbqZXTz9h@lists.infradead.org
X-Gm-Message-State: AOJu0YyzZKQ9Dwg0YR2MANvpYs74OpzpGaL1hYso6NC8yQS+fb1271x4
	J+NIs/E5L5lmqIAET96gsJH7zURrred6l59g/xXglx3MAwFIbrVHaJZzXwORadOqGZ0=
X-Gm-Gg: ASbGncu0O5BmvGKnvurOCjL4Wgbj2WRDB80xW6T4U+Q9OCk+iVBCXAqPb2CBaFbNySZ
	9phf2zPRdITn/TaCjdVi3cvo9Q6ObM0bvOC++UDCZ7mII0t2FBC9vlE0kSYbQoa4gG4oBiKNQSR
	NLEPLwiQgDJlT9qKC62v+8lJrJQ+ZjM6r6FNPVpxbAe5KIPmIB5TFwfCaNfX7scI7SF2ObZmEtR
	pEp/THsrymyeZBkiamYxWYXL09HjAq0vX3HAlJ65kw4TnvJKRwv/+ewKoAgrXcLWjo7FxJzi61m
	A74wkctRPr0wyQ67s080Eiu87HYI6GBZogimnjtPQL1mMlduFzITxLeMEApjZiG5WtO7M496nCG
	kRlZbSiDx6GZUM1CJy8gMgqcVkLimB4+lfOEEQKr0vyWDIY82e2crvmcn4jsHgDDNxQ==
X-Google-Smtp-Source: AGHT+IHJ3cV6K51nVGXbggkk4n0mggTrNvjqK58YjsUKI/uGamOMw1V+7ccv0fj3Is/jMTtEld3VjA==
X-Received: by 2002:a92:ca07:0:b0:3e5:55b7:1eb5 with SMTP id e9e14a558f8ab-3e5685ab4f6mr13673995ab.11.1755054821496;
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfecbsm3616330173.62.2025.08.12.20.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Tue, 12 Aug 2025 22:13:35 -0500
Message-ID: <20250813031338.2328392-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_201342_606909_D1F61FBF 
X-CRM114-Status: GOOD (  13.52  )
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

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart"), Frank Li added the
restriction that two named clocks be used for the NXP platform
mentioned above.

Change that logic, so that an additional condition for (only) the
SpacemiT platform similarly restricts the two clocks to have the
names "core" and "bus".

Finally, add "main" and "uart" as allowed names when a single clock is
specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..0a05a1647b5cc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -60,7 +60,12 @@ allOf:
           items:
             - const: uartclk
             - const: reg
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-uart
+    then:
       properties:
         clock-names:
           items:
@@ -162,6 +167,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1


