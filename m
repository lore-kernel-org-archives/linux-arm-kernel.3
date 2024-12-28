Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zGjy0+pcVkOcyNsRikjnUlsDE+kBpL3hB1hR4GAE8IQ=; b=C0CNxWtI2r7dtAiSvHS8cFJ6Cm
	GgIFMhZ7UfK0j8dHsAc9kSM25OPiM55DgNY9nGBQV0vKengxLJUOAKo+HR6IoGqP0FJWKl+bapvkg
	bqBP/UA8OAsBX5Y9LckuWgona5tm+ufoi5DzghMlKY85mh4ccwwcoV0e12Da5wRupGxGImTwbx4aj
	0rAwl/TcWe5jl9Wu2RZIJgjH2gZcXiXs9AVHZzfV5cVyFVUP6wVyARqcZSzv9m78372Y+nYAGgvlS
	01py61zsyTrB/LMJQ0gFXW0LlmiJht9Tez7wms02MJObGLopdx+hjUPaAV53KwNJ14Ui7Hzm4lpSk
	qp78rGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYKJ-000000021uI-4Asw;
	Sat, 28 Dec 2024 15:02:03 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYJ7-000000021dy-0N8F
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 15:00:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1284053366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 07:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735398047; x=1736002847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGjy0+pcVkOcyNsRikjnUlsDE+kBpL3hB1hR4GAE8IQ=;
        b=U09rvsZY7WJOJX2SR/daOx6qDEbvxy4El0ub5MIKfCNY97lNV9/ezCTeuQjKG2c3v2
         B0UVGXr65yLqu79lfbiZfbzmgGBR26Trv+IRe2l1ujIROgnGIA+DSH9778KqoyhsdiZ2
         rYHQAbIerSOqja/9UkQ8yVFQciW5vWX5UxXCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735398047; x=1736002847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGjy0+pcVkOcyNsRikjnUlsDE+kBpL3hB1hR4GAE8IQ=;
        b=U14AIYkI8U+TQhtSGiGC2CFaaAEg38i052ZSanGKoYKcSh2hZ4LzRwpPn5ZtgZlJsf
         EOTAMvFRHYIA1Et3AhlgtRh+5YlhOmBEIYBmxgnDBo9tLyUOYF+yKVEBZrxLS0YychIj
         G9Rp7LMtyU9E1+awBvwMRKZCYPeKS5XW9Xnhmh6ONkfqFH4nnRxO3X4/AGT3YnFgl3hW
         6GCsk9heHjl4x4L2y+Hl+tfSRn7tBXp4+jzLS4sOLxV2fQV+gHgO5XZRPJ7q6V936VrB
         JEtvOZyt0Q1PHjSaiYBcmkntFihOvE4NYK4XCJl6tVhu6mwDcbQEBVAt4a1fuH6rLtgt
         ebrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWybqFs1Q/yjYY0zc7p/fegV+gNhY69WsAf9WjYfRfY1P+hDqAKPgadsmT1jfU6KC6Fl+GjFqcmY6XStSljVeml@lists.infradead.org
X-Gm-Message-State: AOJu0YzrLbIlJYUersNFkNMT92+aPxm5q0qo5J+v6gdt8X7oPXEhIkIQ
	w8JYfqttFOjjuTl48aywmPLNZrezHyyAnUOgEkpViJvWPzjlWbryv/RQSxVutSc=
X-Gm-Gg: ASbGncuZFSFa1XaeGYGsurDUnlmd+z4cvNcVysO7j9zcvrKnWHYLvYHsMF62TOH1pid
	COUztCXxRSi6bdODA4fL8cnDk+hhHQVN7aoSIdKl/2AQzMeTX9aDW3W/r9ejEgcZEB+0xK5R9nE
	b05Eq0H5cW8eFMq5PcsIlk4p2GynLlPjqCVtGjfZy9XZkj0MeEiukYsG/GdGuzDmXMlnD9a8Y1u
	ngxMAgnznqGDyZ2B5UuJ/WbRjeL1+K5/c2AZO7IV+yW/UYS3quQnUfBDD7yjAB3LlAly/i300Kf
	faU+3V0IO/KRGAQ9Aaxb9Q==
X-Google-Smtp-Source: AGHT+IGn+STomeh91UKdY7nI+qTGSbWPadCuY71lDdmY/fsFuuR1EUm5XjU/DazYxX+1lVKGryxiiw==
X-Received: by 2002:a17:907:9621:b0:aa6:6f92:74b1 with SMTP id a640c23a62f3a-aac2ad7fa01mr2850887066b.13.1735398046567;
        Sat, 28 Dec 2024 07:00:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e89514esm1258974666b.74.2024.12.28.07.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 07:00:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: can: st,stm32-bxcan: fix st,gcan property type
Date: Sat, 28 Dec 2024 16:00:30 +0100
Message-ID: <20241228150043.3926696-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_070049_181904_61642C44 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

The SRAM memory shared pointed to by the st,gcan property is unique, so
we don't need an array of phandles.

Fixes: e43250c0ac81 ("dt-bindings: net: can: add STM32 bxcan DT bindings")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
index de1d4298893b..c7510b00954a 100644
--- a/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
@@ -63,7 +63,7 @@ properties:
     maxItems: 1
 
   st,gcan:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       The phandle to the gcan node which allows to access the 512-bytes
       SRAM memory shared by the two bxCAN cells (CAN1 primary and CAN2
-- 
2.43.0


