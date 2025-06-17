Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DDFC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=; b=tAArtDhavb7rmy8y1JO260vslR
	wXM8+jgCQKtEFJJZjOveX+6jnH6CZMSkMWcwt4sHLNsG6z8t67msPiYA12bZ8ptW8ZaY90Y990KoQ
	zOlL8NGQ8DOmF26rhaoKn0PNM4tL2rdfNqvjL/5Dg+nxih3DXzTitwcMfTV2nHE/n45nJUHzHbsIp
	By5XWsUtvgcLHrRQnhEEcBHPH9ks35aEkoYCquC6QWCcpy61zf5o7ZNxFYxKv6kjNWSx1O7SobSYX
	SSLkRez83GJE/K6lljP/48jkVtsUhOVY44ozdT8AAC5gD0XVkPM6UdDbQ+V+V3cm7Gbnx4gscFrMX
	aOKJz63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRlq-00000006c4t-2VGk;
	Tue, 17 Jun 2025 08:34:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYW-00000006a1a-3DRa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=; b=gwLo5Qxy17T2F1eg0oO4F8wwtl
	uRHI3eKV/WCtogMF5ciUhPyD/B25tjPT3kkVoBh5gFUX6rxfSd1cyQfWCNuKBRc7sWxN2wEh+PvnB
	0RyfDSZ6VKYOtC8ru4nlU0bPKR0ioELnX7nNZgv2gZWeIacn+mD187QGKYlfSN8fx49Qjw2NwRRGF
	KhdJxZyjsTioCq2kmRKtOmL9F3CcbykHOpjB2xklysA4OWfyaJBC0/XARojFbu3rUghcqsVsttxaw
	h9q+EQdCLbOLk9f36HzhOv0uAQVXadmxr2+S9Do26Cc7B3kIk+qVP2Flx0P7ia+reWT6dpKnok1DW
	6mgBub9g==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYN-00000003k5U-15oE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso2982058a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148412; x=1750753212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=CVXvHnngawOMl0X0jp8KakFgokNc1f3IUHRtbVV62v0/cRP63bE74o8MXhYXQPBplz
         o6vrySTbpFy2ddocIjATi6M95iYdDv2PXWiz12rgUe0i0vFNSlFG9QIt+3eYzSQuqnc4
         tK6SwWRmb+Q2Jq4O/zGBbrcOe5rxslWmin5bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148412; x=1750753212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=LGsCoZJUr+ZS3d43Ic+47i2F/RXoqczNeQIiHztK2/AKNHkprlClqDXOrb3f0G/GU1
         Pi+bAMa0UDy57tGgo7qiEidWmtl61xBZu4IAR31H/a/pldYcsSuJ5iY7v5yS88aAzsSZ
         RbqEb/0I1h2PBSqzO6E+vzY2WtdP/NdShMq9R4m9jRGCuj+xJk9xp3HdjtYw439NIZ+u
         Irb4Cfr7WiyptOg1n4T9fQl94DYGmRHS4v9mZJ1GXHBOYrNQhLiuOC5pogCJYQ9LodGe
         3nYSmmtxMbSyvV69Qt3vVle+5Sj4bfH147aJoZi1JFsadXMnhBm6vHZxrV3KhFpSNrsg
         m+tA==
X-Forwarded-Encrypted: i=1; AJvYcCVC232fMOLcCB01XOJXtNiPjLcinl0+licQQ1eORh/Vg+a9oweobAeBvmYwAJhxFQup7KfYYA49dzsKCPGkUAws@lists.infradead.org
X-Gm-Message-State: AOJu0YwRxNgT+bQt5QOQnhmLLg9DWul2VisSWpEB4C0kroZ0Gfrt4rDQ
	y0zzaA6CWrJ5KeTk9Tv6aNWtNcxZtIo+7qZ34SwXS6QI6GwCLIRZeCN3rqOO6fr4kw==
X-Gm-Gg: ASbGncvAlVKZ75TuzbL18Q+Z5zc8Y9TVmX/rQ2SV9WXKEWL0pE/qR5CKzOMPWvvhDBy
	o9vqFL479JaiT4RLLNEPQXkuC74aC5tC3U1jys2jvtrpK4jvD6pzEyhJHcVczGBj3S8AWPCGjLs
	327FH6cGv9QcsugBoi3mhuoJyFCvaIeT/u2egz9YKpCdrOltxwE3scbLJpXb7i3PDG/lgJnVUwx
	XhuUM9M6vg86xxcM6dqaHt1oS0TTJU+lBkY7/vlalfSALGryiFYm/wQX9VDo1T9jHKaDXiSeQeP
	KgYeQuKXpvUupvD4V9bCg2u1ELVNNS7iwQT56z0580HFQesNOhXx7TNSOjQ2XFzIxxSeI675ME2
	vKZ9x
X-Google-Smtp-Source: AGHT+IG3KNV6ixPiJvUtBGaYxn8qmkk4lCQcaXYtEk6THCxE8V+YIcx+EzSCVTlQvmABQC9D1Nc91Q==
X-Received: by 2002:a17:90b:4e84:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-313f1dd74acmr15712251a91.34.1750148411484;
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Tue, 17 Jun 2025 16:19:58 +0800
Message-ID: <20250617082004.1653492-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092023_490576_6DF2957A 
X-CRM114-Status: GOOD (  14.58  )
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.50.0.rc2.692.g299adb8693-goog


