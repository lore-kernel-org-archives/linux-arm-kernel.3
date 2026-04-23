Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2263CFAD3FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 04:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldKzYRVzGfk7M04BaN4noHVbGeTb3XbIYu+RVxu/5hQ=; b=bmlYsiU8rELA7tUJbDJ9lY6/Fr
	5P8/mWfEcaKyvvolmb35xfYSGMpFlbD5d5J0Y5Rc2wcKz+y3o1KmnW70MJpxL9KsrVX97kjTuIOms
	7N13J5Pd45jROohI6l7PB8L2HJ+PGJp5pyEIJf5ZIBTK2GQ0tlG5TzYJcuayQKCAGsvmbVG6F+UHe
	lmN0SRD9ag3B8uZlyfzrqPZCrfoqn22Z7TMP02S6VW8EqhZ8Sq8iyR2eBCvdnGQtLDgp2yJxIbtyQ
	mN0WRj0HvugRd1sNNxadILQPJ0WdQ6q11YZFcP8XKi5FqDFY6buBtZF+9njxoRMxrHvPf+HxU2HNg
	NNYCWyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFlgX-0000000B1mx-1ZiC;
	Thu, 23 Apr 2026 04:29:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFlgU-0000000B1lo-3ANe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 04:29:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aaf43014d0so38243605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 21:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776918542; x=1777523342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldKzYRVzGfk7M04BaN4noHVbGeTb3XbIYu+RVxu/5hQ=;
        b=VLTL8xPHfROHzA5yh0Hk1woYWpYNHON+2sVLT4LdOBUGyJhy8hVhEnIS1cAxbd1ZtO
         0p3gOAI/3W5R1R3NnRGCCrE8gH1IepHiAea4/vS0Uc5gW9gYWckl1lELQLpGelL3UJVi
         WoaQS/gbFWnkr8wZRMFehO0Yhjix5qQLo0/GsbcOkuELC7zHCtAWXDNgEfI/qsCoZOpA
         vJaCuNUXXy4HoETj9C9Gf3rSZEt4RJ7mg5700zDxRaMNx2Pt2Nn/xWyTizWqCUVUYkR0
         7Z4Gx2si9E4fL0fN1WAATloETnLriCaGizXMFVYFD9DXSDHbh7s2HpLdsZ2apRW2sqvS
         cSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776918542; x=1777523342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ldKzYRVzGfk7M04BaN4noHVbGeTb3XbIYu+RVxu/5hQ=;
        b=rshRllETv7o0/ij2ti+GSu4RszMl57gdFf/Z7Qn20W84Vpued+lL0WztgHVSrp6ORJ
         cyBqCnHunuHASGj4+Ry3ncPiAsHIlUS23vYrORPll3gZa/+BIvTkxkT6xbv0KwVprUOq
         fGNp6nVdwS0Jkpe/E0+AmVemmSWoo3rD3XWH5NFR+DArLK+RsbFTmdd8YcBEzqXz+6Jj
         4NvLnLbPAxTM6OsGZpAtbeXXVllGu+IrcYq2D8NQB0dUI1FhyAUduyIPkz3WdUJFAh/I
         R1Q26lqho0Aionau+ifCVH2rio4SublFwJf0mnCcYKhiVRphM3yy8RmKrWEtbE5V7vZ+
         JjfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ql6Ov9d66lBIpzcH3bUSGoeiIKVsDijblI0b0zkX0nzL8/WGWmtVY4ynpo6+YTPuDil3HodztfLb4Mcn3ATL9@lists.infradead.org
X-Gm-Message-State: AOJu0YwzQHfA7ZBH+2TXy1B3YOKeSpgaFffwHtbgPNiz9E8W0NbOZetB
	0lqHNjVVMd5AkzNnMK9d4KkOma/tyDJyfvEAWnxxZyB+gN18teE0BcJ3
X-Gm-Gg: AeBDiesupMJLCeWMhGYk5yQI2QR3XOm7+qhR7onQvcqxKOJjGEGYnh1qkgK/P8ETEU5
	gt/4yzMtzUofXzWFU2MUz4/LOFpXyGqekxiU1Eg+8/zRLVU7bOhutzWwBfZ0DvN6DpOhVDe+2Vk
	YZ+GvbD0Im/hm7+WojVLcM05FSeOrn6J8qByR6efLW8E9U8Kc3ZtEauK34R4zE2twcQEVwruV62
	cwmnohbTkI8uV1XKm3VtB8jG3E8l1TqYKjFNfnE0hp6GskEVKMSAOM0BJO7YYVgt56/grhkIG3A
	vTopH2U28qXZTmgUBvSEsN5k4uXdMm5bRUD2tKju08FX8Sy1uEETGzPHd648ayEtQrAT1SYoeqQ
	97R75cZ8inF4bpjiQXRF93DYq8tFr7jNhNI78mmJBi1wsF/PbMwJUV8KK2BLfRMikpgpIiH041I
	q104whhMO9oHg39IXEkaiGiBNL+VGy0udEIHR6KAHVLfOZ4LdNpbcM+0ylrQ1WyQZrUgo9
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr282724315ad.32.1776918541770;
        Wed, 22 Apr 2026 21:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm165723755ad.77.2026.04.22.21.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 21:29:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
Date: Thu, 23 Apr 2026 11:28:31 +0700
Message-ID: <20260423042831.21114-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423042831.21114-1-phucduc.bui@gmail.com>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_212902_788596_69C02CE3 
X-CRM114-Status: GOOD (  11.87  )
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
schema. A number of sound binding files redundantly specify the
'type: boolean' and provide descriptions which only repeat the generic
meaning of the property.
Drop these redundant definitions and descriptions to clean up the binding
files and rely on the core schema instead.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 Documentation/devicetree/bindings/sound/dialog,da7219.yaml  | 5 +----
 Documentation/devicetree/bindings/sound/realtek,rt5514.yaml | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
index 19137abdba3e..fab37cd92e0d 100644
--- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
+++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
@@ -45,10 +45,7 @@ properties:
       - wakeup
       - irq
 
-  wakeup-source:
-    type: boolean
-    description:
-      Flag to indicate this device can wake system (suspend/resume).
+  wakeup-source: true
 
   "#clock-cells":
     const: 1
diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
index 7fbf7739c371..57e5c09c05c0 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5514.yaml
@@ -48,9 +48,7 @@ properties:
 
   spi-max-frequency: true
 
-  wakeup-source:
-    type: boolean
-    description: Flag to indicate this device can wake system (suspend/resume).
+  wakeup-source: true
 
 required:
   - compatible
-- 
2.43.0


