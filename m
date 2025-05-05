Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D01C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=; b=2pbeYxK5BNFojcTb6d2LpGnQza
	JfyzhN1O/N6WReCQBLvb6BF5Bq4+OnFXTE9acc1Gn2sZmLoXk8qMDMumWUzM4l8uS6xrI5b6ab+M/
	sxj6XM6QjGaRaiCAX/HfoqHlssxcOSHOJFK3kuKaALG2HmRxhuzyyaEv/euuIfDvA0U1DFFrEDCPq
	9WMSaMsrMgLaf64U8PXFKbYnH6gM97XiGs3vHC3kNeugSBUQFyDwImbggG+/TmjOkP7651lqFdH/4
	V7w3yLevRNa9Y+CIv39mOpreTkuoPXpWboXc5k9wyeEYcTsphJRVyakxI9vuK4Z8IwBk87E0ZNcZU
	Q3E79kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBubr-00000007Fi9-3axO;
	Mon, 05 May 2025 12:07:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuT2-00000007Ejx-0yJv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:58:41 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-acb615228a4so1023156866b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746446318; x=1747051118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=O8sJb2bpaNZdi+CGRHUy1tvXWQXC5zvERK2T0wlDdthNZgAb7PdRuy6PeNAVQQQ8LP
         8oM9zGS1FpQClMhYjV4cEom/TVZYdhSKWh2uwgrkvcFIZlQZU1Fg/8KvwG4jjnsXq5rE
         80MqoXSqcbF4eXSzUfEJ91j6vLHiZwi3gdbCNbIv3XAOb8SB5nxnVDmEaECTkcgzvzcN
         8LPnZc4xDH21WB3yoOOHINCUIHEoMl0lyxR5DtNGuyparfDCKnFqiVl7QpKSXzWgIYg1
         ar6sS1kl1ctMx3rtL0HqVfGn59TThoNnHMnVYi+u13xE4qwuzGaNg/6quCUfEUo/OHGA
         8b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446318; x=1747051118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=oe1x0dRIIZ6E/S/K3O4wheraMP4MfAynkS4Zv/UDl+PzNxgI6c74SZ4G23h48SxRr4
         MxEBuJ8DEmTMcy9xL/EwAYcsSpyKHbabH6wQvtcUAnjHfFZtJ4nQ8P7PecSZ2QvHIR9H
         zPT/EZLbm+Tugza1nEpLSugALeUlNZ0xJVMxy4HfGmVbMI1va3DOZCZLfTp1CNSxuBgA
         w/NKTvCdJbxYesbe3vqx3XgmTg3ja6FlT/EgRbnTE0Ow8RNwhZjZC3Ol+7GCxaipBFHm
         vGtGyuceuQTm9/DbXOONuC/OdAv7UvZgF2fEhx8Td6aiDujLPLVpYc3vhqH4hQgWMZ/T
         6LCw==
X-Forwarded-Encrypted: i=1; AJvYcCUR7HtPomtd/wDXOLR5nGqllGZZm2A4v3ughLycYuYNkyJrL/0R/goefXYe/HanVuLlUyxwCQLckN1opx1IO6OA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2rWaKcphm5Ibr76p9Uz+iZAKdHnXn2YCP75WuYyf4UAjsEXf
	ojwsr6yzvswNGZu0z8MmLfNhpxG4WRPMKw1vVxDcLebmTI/E868A
X-Gm-Gg: ASbGncsWalAGcl//Yx3pd9eLhnvYIND8wb6cZg+c6m78xh99gbIEBamjyfNipjSoYOX
	O4WcQJw9Mt66Spp8V2AEjELgGjm491P9f3AQ8NUwV+ncnAOy/TVwjbIedsIne+L8iOECKMnrCEZ
	gzlznXHQosagpO/BmhfxhtZ/9Q8Os5oEgbjBg/bjc9esBltJfKywENfUUoCkU9J1ZdJXcoIG9Vi
	z59eDhyLn2Txc8pr4YYVmbXs7iw9TH0p+XzZLI9aGNzq8pH7Jif8ZnviZly7kMs+/hbXXkhFokD
	riUnaXR1Yt/1Qi9q9WKqBMXfJPRDxoTcmgpE6ixyqzsO46wriKApmLJNIXaCmMzM3ZnH8CPSP6j
	vVg==
X-Google-Smtp-Source: AGHT+IHumqO2HEtVZQqU6y21OIhwqmx6WMl1zZofroVgIP8P5LdpNm2LFNH9OFJLdEBy/IULZh6H/A==
X-Received: by 2002:a17:907:999a:b0:ace:51fa:be56 with SMTP id a640c23a62f3a-ad17af32ce4mr937803566b.19.1746446318015;
        Mon, 05 May 2025 04:58:38 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c53sm489568566b.56.2025.05.05.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:58:37 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Mon,  5 May 2025 13:58:23 +0200
Message-ID: <20250505115827.29593-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505115827.29593-1-goran.radni@gmail.com>
References: <20250505115827.29593-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_045840_271859_2BA77C07 
X-CRM114-Status: UNSURE (   9.36  )
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

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..65c4dcdbdf1d 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -184,6 +184,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ultratronik,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0


