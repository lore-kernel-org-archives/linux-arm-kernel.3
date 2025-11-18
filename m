Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41F6CEDDA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=; b=E3UBUodc+F5KURk/mj4ootqzuQ
	uxBgOKrmLcUZPfmp41Fu4BWP8QBJw5pS3A9CptT4KvAlBzwTYFDLyDjXBrZ5unGi5OGNVR1KqdWbN
	5D2K8JT1nW921dXMkpRFy6HdEwMoM9u8kQ56Fcw2uEJeack4XYd37oBPE73eR9QL41hKkZRUo3RZg
	xFCDDMStY96iMKFbBVNRIfsIoHc9vDcT+o/YvCC/xMu3/3AcFboR5sVcW4x+4GH4/nxJvc1f2i3JD
	CcwnAIgT/AdUhn2SisEvgWb6Juk69nwO5kvLiPbfnChD5Mz8hbw0s+yVWHWvq42RNpwKKGe9YKfiI
	VKIS/lHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKW-00000000bWs-0AEt;
	Tue, 18 Nov 2025 15:09:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNKJ-00000000bOS-33rV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:09:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47118259fd8so42299435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763478542; x=1764083342; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=EAH/YV9pDEzT8UJIykv6k3GMp55vRJpXpqOnOYpFSKqIuxgRNnseQqO8aKzCKyWjFQ
         0GCVc89fHjWaqmFOSx2iIPciY9lQrqdTGtMxnlFNqDIOch8Ysbrf6XQV9TflEsXVB1M0
         Gp5HtOiplNylCrn6kRzkEh/mZ3AbU4tzTbJszO9YmK4PgfQiuW2Ae9UnRSNw6sN8XbLX
         2gKkqPZM8VDNdVr5Nsty7L21nTz4lZFx20yj1DJLPELCrO7pcfXmo5/qPvyQ0Gg4gRLU
         GpxPg7HAQIK7gFIXF2T0xE+WQz+EKhwfhvPaDvzi3CuNi5qLVaW1Tt6wJHaoKZUYcWFH
         ZeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478542; x=1764083342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=STPuB6MaaU+FXVddHax7H7lVz1Zb5Mcc+evUtm1u0h47CEq3tIsh/9MGfywJk7fKWa
         hQqSYAVCAwLeJfEoeg7z+N0XvNSEJH6EJoG48LAaUqdBgDi/9bDkTaQgM0sQOgUNWxTL
         CqQW0T+wXIRQtWTGag1MKNSATrL/SFzLJM0/B3U4hL0WeJSdk3h4URC1oTF0il5IaBpw
         JqKurjdV7cxkwQsi+UO4Lu29RiBoYOBiA6zCB/iHDAuPFSdL4c6qPEsWlI41kpJgKy/0
         xBj6u7vCp55y7nF1/Hc1toSwP4PLlj0Wg1KtOXlwyGokm2XQOMrx82gMS4QL3ktx+5Qv
         WAAA==
X-Forwarded-Encrypted: i=1; AJvYcCWJVQgxIQwGiB4x/PuYxxWSfYSwmDhCjMu/kZu901jnmImAkq530PLBs699TdN5ALiwX+ChdkpoRM9MhAK+EJJa@lists.infradead.org
X-Gm-Message-State: AOJu0Yza115ub2SrT2+nAH8hA65zll4Jfp48t7nvrBPFIn8cylmrbwXe
	ueZXoHs+pRLHzLDDDOXqs/zomQ4yLikror6M8FMd1KPGFQdSYSmQAOn5
X-Gm-Gg: ASbGncsOvMJKGnvYgL4EABEvClOwl/LICDcxmcDc8ueD/cFrveuVVIRCR1sPOcwpi/Q
	7ulR2qvr8NNBhlcg0HTNnF5b+MYqDWAflVT17pd9PqqAvaPG81ncab/84TFbw/RuZs15U8xd5jA
	cvNOHLRMM4tzRbMD3T6mbOeHq5+0Ozr28ATHmuNAQn39y9+0HAocF3PmU9Vm++E+Vabzoy8zQRI
	eFi7NQ/ehzohRvrzlpzjJPebBUA+H9Jq8U9F/cT3XtjV8DPsD8+1Ee72/tuD2AU1OsBjghnzPCO
	YqU19TwnETbuHZHW4gmN9wTHN8HtJ/95WQxT1J1k/t22M79hc740UU397OmTUYnTOo0xU6cbrr+
	oVGvsVpO0xMGJQfZWcI8ioe442L2QcX4jeKHOSiy5erb/FNC/4Oc/2EKwFewPdnNdDDlmXXPOfw
	y/7CqsGhFM8cH6wDdDVtozMum+DNH9KrBH6wZQtYFd/S3s06q5/SJqfQY2hL75RUT/CNWnHQNrs
	x06k/VegfXoL6zN
X-Google-Smtp-Source: AGHT+IE6GAJOdG/qDGqIS1mCpN488TDzi+QKoUUH1cFmR3miBBoO1+a2akA4/Hkj6YnfPYg9iHTXrw==
X-Received: by 2002:a05:600c:630c:b0:477:7a63:611f with SMTP id 5b1f17b1804b1-4778feba6demr143915445e9.36.1763478541562;
        Tue, 18 Nov 2025 07:09:01 -0800 (PST)
Received: from localhost (2a02-842a-9b20-0d01-432b-0dab-f195-2b25.rev.sfr.net. [2a02:842a:9b20:d01:432b:dab:f195:2b25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm206281725e9.13.2025.11.18.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:09:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 18 Nov 2025 16:08:01 +0100
Subject: [PATCH v9 5/7] dt-bindings: memory: SDRAM channel: standardise
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-b4-ddr-bindings-v9-5-a033ac5144da@gmail.com>
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
X-CRM114-CacheID: sfid-20251118_070903_785670_B04C9A99 
X-CRM114-Status: GOOD (  10.15  )
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

Add a pattern for sdram channel node name.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 866af40b654d..5cdd8ef45100 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Julius Werner <jwerner@chromium.org>
 
 properties:
+  $nodename:
+    pattern: "sdram-channel-[0-9]+$"
+
   compatible:
     enum:
       - jedec,ddr4-channel
@@ -118,7 +121,7 @@ additionalProperties: false
 
 examples:
   - |
-    lpddr-channel0 {
+    sdram-channel-0 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr3-channel";
@@ -133,7 +136,7 @@ examples:
       };
     };
 
-    lpddr-channel1 {
+    sdram-channel-1 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr4-channel";

-- 
2.43.0


