Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF3DD637B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=; b=U5m6P4i43td0iJaAPzttdU8bK8
	vj5A1dwSL6cuOtIaCu5BCVyjFfHedPivE8JCbqKL+5pOVo1j3irew7hfeGlJoj4LW2+KzwQRm/wpj
	iae3DRkeTehoja0OC8lCNZ1r/rHxh14mMKbwXP0S5BaFli7y9u4VSY8LseIfrNvJGOgQQD0bomAzE
	ksGLaqT/CtmqlxWSjN707EI4EAjZQYrgZgCxWkjLt5dLAy9Jo8oAePsm/zAwbqMWYeggRmcwF2gi4
	rNn5ClNf7a2X8e+3/A3zmjDq3/yaWKioh0nvPpxhaL7XMr0q8fCR0bqwur/8vTDScItK5VT7hFVtK
	NZqHB9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJXr-00000007u0e-0Ovf;
	Wed, 13 Nov 2024 20:00:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJQc-00000007smo-1tea
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:53:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so5335449f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527604; x=1732132404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=Tth7Gqjkg14BWCIkvD5WSZOjKy6YdWF7v3bKHXgsO01RRCT/pEuyFjyv+FN4CeV0ZD
         qmG2GLFvTOtvJi8qzd9d/QPhwAI0y8huU/5c2IFyoujpB9AcEZRfHNqXhpuOaOBx/Qzo
         VJNDs29oxvG42mS3WEYF5gLh4BYYkZvObJwN+OgwAE772kXGXhWUa6i2GSmM1ENOFa3f
         PIbyfUNUzBI+FaumfrNSyH6Bh3TtRq2seKTRaxVNU4puTKzv/OywLD0Nn5/E8FjSFYsB
         x/LqRb2Y0GpOOAYFeqjaSOSe/xGv7jxl4IrvbiJYjRgBv5faBVMKNUq6Nv/BZKKMSwWr
         tzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527604; x=1732132404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=okFrVtkxF5m0ieDSqWgxFryVGPCjLo+N34TsMLthQi1Eh/+Ro9cE30kJMe/T9sJskR
         08DeJjfln42v2SyYoGvJnVYBhX9rrJIDFyfJxj4C3UsOQQ9Ven4U/WRdOXOjFBtie0bP
         m9zbAuBMiRbObY9nENAzfoNlkaU6pI/g5r7kCHJcKKG6XKDeWoy9XFDhylcTuEL+kuEj
         58gwO0oQ70CaQP7CCmeMiNDOke+T5kWy6yUsmX6Gw1ITRkG5lG+3kBI9shHbLkABCVQ3
         uJM6p3HzTJ8YGFUielBPaDHg8t9YkckXZOKgZ7pM0BLsaSKiXPPVlFYRj7vhkBp/eX2X
         RAIg==
X-Gm-Message-State: AOJu0YxO9tYgOTsKVC6PcdgCWA8bPg5ExLI1Ap9hnp7/74UOiYmbTAsf
	os3BzDXY48f5qBbJm63QIH9S7Y1BdHKYZk1jP0VFx+PnZmJ3HVXN
X-Google-Smtp-Source: AGHT+IEANOLGqOrMck5zuaV/awm4uDnLiNsDYeECS1iqXbhkM7NIIObAN6edW4LT/VwwrIADcKG8Jg==
X-Received: by 2002:a5d:5849:0:b0:381:f596:392a with SMTP id ffacd0b85a97d-3820df8884cmr3387252f8f.43.1731527604134;
        Wed, 13 Nov 2024 11:53:24 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:23 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Wed, 13 Nov 2024 14:52:38 -0500
Message-Id: <20241113195240.3699-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_115326_523892_C649795B 
X-CRM114-Status: GOOD (  10.08  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1


