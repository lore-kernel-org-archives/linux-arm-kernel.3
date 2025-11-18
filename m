Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A125CEDDA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=; b=anA9l/BjhSkvG1y6c62h0Hm5Xs
	FGOBJNaFhlBRuw+thznWfhqah4AM/MecXXKoa9Cp8BSaFOs13VvXRoCHW7JZuQkeO30SGQt8dyclR
	vtVLaq5WbvHNiiU4f9xfPy336tB8EMFRfc6VEMTC+xHw+YgzNRyBNszz/8KoGt5GxNvf+ezRu6v2D
	yKt136J1g/oKh4GRT+FzeemuS2Xjr1TLzhST+m+ib/X18IMNqejgTkfp0ISYpwnbVHMQixV2ccnkx
	S7iddhe628miLZcz0CTLRmFJ0SjrPXZ/ofzikSoB8bca4wwxv2d/kfP86XzrTklGVrdBVzCz6f2qr
	Oi+wyJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKL-00000000bR1-3gLA;
	Tue, 18 Nov 2025 15:09:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKH-00000000bNF-1pxP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47118259fd8so42298995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478540; x=1764083340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=W/OiFfUeuYohQ4DtyF/8h0tVR1LovT/XV5eDD7dAJefauF+8qtS7TVzX3Xb0+bM+aS
         NPtmZE4j9bHLCpsaSgoNrz3tDpoz2ywT0uI0vfwjTCOWOdgSDqJDJjKk268uxt1cNhZY
         K4s8XC1amUAr4jbL7S/Z5X/T6tnMC1/JT5bGfJRWfC0BJLF5HY05vBzk5RVDGME2aTT3
         4JW5GSss6g5gvgVe2OSqMBBq5gXqbnUeD6E+t9qpgeNnsnRHyQrZsZ7SqDp0joOZDaR0
         9xVdSfe2G7L/R+BwcZMfp+mlqQdND6UhDWBp/leqwcfELnVQcomWc1BF3Hzw469R7Xxc
         LiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478540; x=1764083340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PFM4fgZANGXRwrvQV4wSC81b8D8h+yUyMHAkucbMQWo=;
        b=U+VjDkXA7l2GkupALSB37nN+gHuMmcMhliwATLtvQ5l0VocA2jh+UyVXI5kCTMI/Wq
         WcOr9l0OXZUksQNbI/IrZo11pXaNJfdizB2uSKZdZ++UEkWKXBw17CTnfwhAdZHI0Wgo
         CoPhOwWhR9SFdmw0cr946SaSrtmo51ji/D6FSCLjAUs/FGi8q83/aXTUvMb1OPlqXqIA
         5fYGuElJ6c8edl7pSRGw/nSJx278E7UzeJD1xSZKO9BC4R0tR+vBrcohIFBX+YsIn7tg
         pVtMIqo6P8PRUa3mv+Uj5olHwe9/ZLmsQBzqnBW35yhH3Sm87if4JQ785H1m4HXDC8Y3
         ZwQA==
X-Forwarded-Encrypted: i=1; AJvYcCWsqbWRQI0TgYJX1BO4bG1wJKfzau4kOy+ARao9+9eRPRiBrBPX+sY1op7weLvEQT31KNwnpeDuyPrxal0zPx81@lists.infradead.org
X-Gm-Message-State: AOJu0YxjrN2oCnjNTUXIU15kYKjweLU5pxL2oU4FECUolPEAoggeRxdZ
	oy73Q15hZsMCJv/0XQPHPtZLzrOXrukL40lYsADbXsj9XSBSXwi5p5M4
X-Gm-Gg: ASbGncuK1wn/FIChRebL5dgc2P0CMzL2aB+4F5ZCn2eWTpztnBy5jx4aqN5P/83SS1i
	Xlmaa/SwDdqclE0y2T3pz0QQ9Efirv+KB+/mGw9eI+K+nV1jt731UA8csbNtcld9s3sy52kHlzU
	xp8NBqyT5nOSWhhAjP7N+vFeUK3QCdP0up4VjD/RzRPmKpo0K2xTCgscAdNTpzBh57fpbXGnbqg
	Y0CELFzQUmD63NiAdfyXQznlvIaSoaYCI38XFAHXaav1UXPavigbRLDMtfVVkSq0ArKXdT4LCxV
	4j90IDSRupBdD2RtJdWs+exSS2aJAsaDo8BaiDTz0LZQa6xJdp+9O2Vd5qBBdSvc3hIvWgvDzxq
	Lm3ZmeOo48LYNlZvH8kMYnAaY4xU3jAeyIJV9wlue3WEpJu+4RKwqd5p+smOlrY00N6UDIZTrXv
	65I3jbrLknhnxWA3X5L7Y4+JSDS+7pFqDwmkeBMN41BZzuQ4mms/aTjaXYzJwta8NltHUM2rpSR
	nnq14UiL7yfHe6Q
X-Google-Smtp-Source: AGHT+IFLl4dTul/hQUjz6znuPzdhl9FsYr/3lANR6xEisIy2fBHrkJclICxFWj3/Vuc18YtPkkQIbw==
X-Received: by 2002:a05:600c:8b4c:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-4778fe67aeamr162299715e9.10.1763478539426;
        Tue, 18 Nov 2025 07:08:59 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e442c2sm382320455e9.7.2025.11.18.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:08:59 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:07:59 +0100
Subject: [PATCH v9 3/7] dt-bindings: memory: factorise LPDDR channel
 binding into SDRAM channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-3-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-86b30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_070901_515588_9B49CD9B 
X-CRM114-Status: GOOD (  14.11  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

LPDDR, DDR and so SDRAM channels exist and share the same properties, they
have a compatible, ranks, and an io-width.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 34b5bd153f63..9892da520fe4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -1,16 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,sdram-channel.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: LPDDR channel with chip/rank topology description
+title: SDRAM channel with chip/rank topology description
 
 description:
-  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
-  CK, etc.) that connect one or more LPDDR chips to a host system. The main
-  purpose of this node is to overall LPDDR topology of the system, including the
-  amount of individual LPDDR chips and the ranks per chip.
+  A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is a completely
+  independent set of pins (DQ, CA, CS, CK, etc.) that connect one or more memory
+  chips to a host system. The main purpose of this node is to overall memory
+  topology of the system, including the amount of individual memory chips and
+  the ranks per chip.
 
 maintainers:
   - Julius Werner <jwerner@chromium.org>
@@ -26,14 +27,14 @@ properties:
   io-width:
     description:
       The number of DQ pins in the channel. If this number is different
-      from (a multiple of) the io-width of the LPDDR chip, that means that
+      from (a multiple of) the io-width of the SDRAM chip, that means that
       multiple instances of that type of chip are wired in parallel on this
       channel (with the channel's DQ pins split up between the different
       chips, and the CA, CS, etc. pins of the different chips all shorted
       together).  This means that the total physical memory controlled by a
       channel is equal to the sum of the densities of each rank on the
-      connected LPDDR chip, times the io-width of the channel divided by
-      the io-width of the LPDDR chip.
+      connected SDRAM chip, times the io-width of the channel divided by
+      the io-width of the SDRAM chip.
     enum:
       - 8
       - 16
@@ -51,8 +52,8 @@ patternProperties:
   "^rank@[0-9]+$":
     type: object
     description:
-      Each physical LPDDR chip may have one or more ranks. Ranks are
-      internal but fully independent sub-units of the chip. Each LPDDR bus
+      Each physical SDRAM chip may have one or more ranks. Ranks are
+      internal but fully independent sub-units of the chip. Each SDRAM bus
       transaction on the channel targets exactly one rank, based on the
       state of the CS pins. Different ranks may have different densities and
       timing requirements.

-- 
2.43.0


