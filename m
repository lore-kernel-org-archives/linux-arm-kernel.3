Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBC8CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=; b=aFAP1Z7gQLW0gaqYJhpSd++nVm
	n3m9onvBvvuzFx7t237Y1EtL4ipMKujPo9RSqx/W9pPGT9oi0ZI9jF/l5gJf+ruRSGjHuMbQVDfYf
	W9zg3XpqpIO27hThbUHkUHutEArXmsYHdAIYDpU6Ew1+H0oXDxzsb8Am9oupng3PNKdzT9awOQRUW
	UAo6k2pn9rl7dL+MrHUZdEcNPuNjA6ExfHDzKrycYicP5O9ZpY8x0mDxHnYgbGICU4CLgn5xj92E1
	T754BDAuVyS+lPBDNI/8eeRSnH9IXFEusN8CWg+3jEW8tbvgUzVeXlFc8JKvcAPnpj5lfxNgIRs4W
	4f/x0+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzu-00000002xxV-0gn9;
	Tue, 19 May 2026 22:33:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzs-00000002xvz-11l3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:33:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso41052645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229986; x=1779834786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=PaglNPmeSvsif/5jGfFP3PZi/b5ryuWZ2RGZOHuwHffxuGnbrSQXt69z9qqyyeovKr
         278FDBYzaBC2JZ6BtqqsXLdXJRgrV/C9iJAOddfp79LGYjgGQUqubdyjtRaz2plusTQJ
         FwYkYPQASf6u19aMZNRGWlsTiyK0R76guTTncjQi0URDmZIBsGJ2MZO/s4V90udJQpWy
         AnEFteBHx8vytWJ62QcztjHQf3X8WSJO2Tnx60d5BpctmbJqxTg2TX8pZ5IVdogXkmNC
         GVVs8RrzavhntJN6E/TfLwpOjBaf4CPSE+++JtstTbRC47w9ShPP+L1532N6vZEn858s
         mUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229986; x=1779834786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqcbLvgzPg/aacFxA3Sf3HYOKcvPcXokYWVGRv6DhFQ=;
        b=sm5ZecVNF4fJoJ5bM97g0NY9Twztxad+ZCeHcemotn2rgvxkEe3QFl71eDrirTOVjX
         yH2T79ZjFAAj28M1V7Wg5m0GNejBS+FkT1/5PiFqy4PsP/PYnU4Yp+/d8He5M6dZYa/D
         53McJuKysr61AeCyXwQZ/Wh6OGxRZIOvIRjSxRBXUoB8jOLgDONusgrxFmf6NizqBU1X
         /V+AGelu/wJKu9RaqfsdRv2FjjUtnasMSAy3YwlrLLev1kTexQxw4nI3oXZiY9gMNpr+
         lX5HuUe3D2ZG+UTJm3XEGpDeoCebzXe60IFRKwR3vPllYR0r97iAlgE/mOUdrd98NlQC
         BYXg==
X-Forwarded-Encrypted: i=1; AFNElJ8voD2/7ldXM6NzwGVV3tH9kb4jnBVVmdk+TSWwOV8Vy+IZVS7lLhaI2vLBkP3Qne4vyvDOLUWxZs1RWlryeSl9@lists.infradead.org
X-Gm-Message-State: AOJu0YxEiNwKbNdKJ/WifidQah/6rckVJ+ttA6qRrLlj4m0yR6sEyCZp
	LqBvoBHhy3nv38553JOKXC3jcTjNU0sjJfNV2OHczxjz0qaz179vE95n
X-Gm-Gg: Acq92OEW5uyBkUzNZ5cEW9ADiXIUHbL4hN/S9A6lraqe8i5g2tnylbYIivyKv7wDxpY
	Nqx8Vr/k/pKEgIoQ/8ZG9rF313gx99F5+bsBTBLe0LJhmZt3pJULeOxM2jLx3oUoKAoZ7WtJh3O
	sbGEl8iiJ6h+FjskCXW1WQjF+2drl04jH1KTnt2aHlQbhi8o9aNwdIleCPNaCzdmHV4z3CNOGy3
	eIqBZTOZs7LzVNUy/dYuEnUsy579z+gnXTxYBiXzP1AK9oF3SxioTXvhGnlIOdF6ELevzK0iaU5
	ORj85LTsHx2GvhoDz245y4XIq9UkTg9/gXTEaugFqJhHGnPxmPwdOhFvXI71ngohMK0Aeycuexs
	vXgd4tGKrznzvmuO6NmuWQjjuHauie+jC4dnJ0I9Nn5E7Kaqv0m77bnHQXw5MJNArAgM7iRvxFg
	/lESQYDXjdah7Ts1Bgmejr3gLlCv/HZowFgzpVHf2BLilqDGnJ4dO3n1qbrpCBxLOCoCOclAA=
X-Received: by 2002:a05:600c:4e47:b0:48f:d835:e0ff with SMTP id 5b1f17b1804b1-48fe63265a1mr361523155e9.17.1779229986180;
        Tue, 19 May 2026 15:33:06 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:05 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 0/5] i2c: mt7621: improve support for Airoha
Date: Wed, 20 May 2026 00:32:42 +0200
Message-ID: <20260519223253.1093-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153308_289883_4A6B980E 
X-CRM114-Status: GOOD (  10.84  )
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

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Changes v3:
- Rebase on top of linux-next
Changes v2:
- Fix compatible order for schema patch

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 70 +++++++++++++------
 2 files changed, 62 insertions(+), 22 deletions(-)

-- 
2.53.0


