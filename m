Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BABC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=; b=4vQpj9tZDS2S7J0U+47KHn5fI8
	aKqFyftGbZW9cQZw71NCYnTVXKstnanoiVWV4JNTDbTFZq4Ov+srXE7qwxR4NR7wCNp633gVwAOmQ
	Twu9+lIi+0WeqpSXSJz4BXokqxyetj/dVXEpM2RONKoPTlWLYicX2ou0ZtToPjtmituLfb1zTUy8L
	aCL2JO2uNgPPlEsCbCOoL5Nm6bWGSPsgvbjBu8UyHeWLzIyIGF5u+e711/zyC5T2lEmIAymVdDa5f
	6unIa4cdCsYLuFkJz/KNbiaawadOBbe+ug60P+Cnutba1cxPWwLWXyKqtS4SUTpkfgpp6oX1l9VxU
	Irram7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb9Y-0000000Amyf-2L8m;
	Mon, 12 May 2025 21:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEai9-0000000Aipd-3TAC
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 May 2025 21:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=; b=E/7dozFRs1OigRVQ8GtOgX0P14
	aMRq1soVhNtAvpEtF4S3smYcC0sAcPrJQcF7jJnlqh8vJW/4OFMHKv+uPq1Bq7hozuKGl1Rx3+1J0
	XnCpOlvU5Lu+4tVcesQHQOI12dJhCPH+MyzKSR6Us37o9bXZbbZwAgiH7ptbc+6TuKTFPgfY168N2
	v+F5bnqxgXfxAK5BUK2W/kgb3Zhu6Nq27DAYlrXKVbr6nS03BfGBxg9GalIHJ0wtZLUXyK3XC1cFx
	TbBrcwNbOArZSyAolDLCT4LgBZq4uu48lPGIlq1q1u0F2qW7r43JyEFFF86F+IylzmywavUj/sByk
	ujS5jf3w==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEahy-0000000GqB6-3VnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:20 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso7961349a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085347; x=1747690147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=;
        b=A06tcAneeediiD4/Mb8owPtfHr8kUZ2WvyL+jYkKZ9nwNZnjgPjd9KiImu3JnIAm6V
         rESCDqxTh6HXmHLslPBaDjwj3m4RR2CJ/us3BO/f7wMKjjTKiSLu03v4TwTcgqcrS1c0
         MSSx1akmig7JtEVWG6E23E+Xe6MDIMEae0Lq4kfapQIqrr3E3pVMIadFhynEKvVOI1Bq
         YWdIMVZ7fvHZuu7b3QYNCE9skjMmPHFN1JjlmQVffNlLDpXLmravaNK2SeSe6PLwJPzA
         MgLuNl7jFJNRrEov62yINNn6XKHG6YIcO8YRBJKCZnY6hKJmHW+cHxXvPDWETLbczNDD
         GL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085347; x=1747690147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I23kxN5qMcMgOaWczE+uWwEzlOhWFb9/1I34ITja72Y=;
        b=jnXPKd0ec0y6Ri0/oun87nhBQ851fWxyQeAVMc+Z6JZpuSDrpIZsB3dSyl0O6eHGmS
         2J4MdOzJURu/jozzjy4jQGvPqFF2v8P03JmjisQ2fjUGTaKR/lhSY9LbybeQCI+HGPEN
         vAyKMe6MCEm2dHdRRvW5OhDvvmWqR0uvUXNadRzOZ+amL29A1tEZsQ8T6t5HUEsRktYR
         dnrjM0nBJRdrFf+fAPRSchu43bvapCuACYIj+EOByxgmVkQK1gBYsm7shzjq60GLALpg
         lnqirisYbWpT1apiBohDBg1xKuLKTY02xZIWELYYo1ZWwwPkq4Xr3mldQR9DuBpXEenR
         +rPw==
X-Forwarded-Encrypted: i=1; AJvYcCW71l01xaArlzkYJnRCTiQrPabBtAlb40Ua9rJL0PEkKYv5oy5JMgTrBUXF3Uv+uw1RYvshn8dNRZUgdQOTuUTm@lists.infradead.org
X-Gm-Message-State: AOJu0YxlvuhgKIJB59tHFVZRjHS9h0oSta6tA6Tq6U4Z+CZoqTPenPpg
	+gbCaYmOKpurQ1gSfYGqNDXZ8vx6knXvNP3Q4ofrMz/1I/ey4aOk
X-Gm-Gg: ASbGncsFC71+9jzOWU53sDIg2sVHrhdzd2ldJKp4lDWYWmrDFWioGt/m+qtZYhPCbIb
	QHxkYj2jBMWF1gIXnhXIdeB5TL8c3mG8D/wnpAfpAw3oj7zMxK4wFxFF5EdHL9H7EWmeavGFLaO
	+9mOoWU6gRp8bhWIkTgapINRYoDmnRPWljVG+FnOvzXh9vwtD2N8YMPNYi284LfdwA57UE4Nj0v
	GfMxjv5L+fQkCY5wcgtVb6Pzp6S/Ds3Zj02JLYPMb4/70pSywtqQLmLdl5+cwRLxHsYSCU97ZGy
	6TTnDBkK0JS0MnKraA/5x2wnLk78McQoLGyzJb5g1D8AQnQOjvXMXhWIGdmo05I=
X-Google-Smtp-Source: AGHT+IE42f4BLApmux3jOg1v9yOr9Bg+zkJz218wqM9qOgB/ayDgOa+VoGiZd+V7j3Z0CtpmoqMeiQ==
X-Received: by 2002:a17:906:4796:b0:acb:5583:6fe4 with SMTP id a640c23a62f3a-ad218e4b962mr1475270466b.6.1747085347019;
        Mon, 12 May 2025 14:29:07 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:06 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 07/19] dt-bindings: media: i2c: max96712: use pattern properties for ports
Date: Tue, 13 May 2025 00:28:16 +0300
Message-ID: <20250512212832.3674722-8-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_222913_709611_DE395357 
X-CRM114-Status: GOOD (  11.49  )
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

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index efdece2b33b9..f712d7cfc35f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -40,27 +40,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -78,8 +66,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible
-- 
2.49.0


