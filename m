Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=; b=tX/9lyLOK51D7aVjQY9nPq57Rd
	uRonm0MgSuxBa3uqtySCVdcdgokKAyibxfvzJNJxVoMc1QoCAD9hJfO362pc+9f5PsLDUAc76+PtU
	qMH+EGmME/qhnHp+myUMoOmO2ynwyg2Pq08NAUKKSJ6XlxqZxBZrUqz3m1Fgf2Vk5DPsj4dBnqZeD
	45PxkWG257+2amPqktOXrG59jMSfE4A1vWFFgFgnjLl5MFm56vtec/WxYPnCe3gbxwNE+FQzEFCpy
	/fZKcrlWhxx1vsDJYw9O/E/1NoSoRgJwjKGNih9xU1WH9e49RaKQSHrZ8syaDnfAyhMl342HBLKHK
	T7N84Rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY61d-0000000COj8-2YND;
	Wed, 15 Jan 2025 16:13:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5z7-0000000CO8q-06lT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:11:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso12077746a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957471; x=1737562271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=MJn1MC2Mdu4Au5iLiEPmpnr76BzmXtGxP/lCFziA3sB4wVhD0JP4bvz3rsKUNDUNbt
         plww8mGsBdH8r6uq5ijzCCImuCqLsZU2Dv8ONDwteVodxx187qb9yQXN9qRmeAf3jS83
         7bhDIfnskUueD/47lD4oTbg2Xd3qNilAZfVIs8yLTOBroFt0A8XB/25ahxCA/SUBxA8H
         AsqzfumZ9vJiQjSOAxA+oHv9gLkCUL1vj+TzcRibx2Fao13RLkLoe4/4RRQmK0g8/iXe
         3mYCsq3ZZqUFufSH3viVqJQEYDlVReaulLXSCiqEvBWxWjVCJmXIEzt71nolmRdZF3Gg
         R+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957471; x=1737562271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWj3M8A+8QkmZTCPt7r4bM5zsk4erApcDBVhUj+B4N8=;
        b=FUhjZFFLy3JN5bGn6z/kwfn6EHZ8e5Wt2Lh7R5z9U8o9LoCkvR21WiH8sygEQueETh
         +mbD9ATc88gwsBS80oI5iHO4xsa4OtHzQu3rfT7oE7OwS6r9AZEUwaREIOHvoQb2JphU
         PKuwJiXMRDIKM8QmqQI9Rat/2i+I7K8g6tZqr4lzBbagjyp6ED5PYBVGyeI1gO9jyvSQ
         JpyE+K5e71dMGarNw4G2NnleiGfO2KOuTMQtk27fRas4Ftf+jzYbhW7MkcytRQl6ZtM1
         q+4eb74uaKtV96hIYPvwpW6W37d5HAPtuz9cVy1HC29rHylF9e7Ttgr4wDby+llWX/UJ
         v6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVJr8EMaCVTKkv2u7kjFSHQ14FVU6dMmRpJ0ScD88Qk5Ls4IDrHI5WuYjshDmclDeCsT/nrneInSNoB5F0pny79@lists.infradead.org
X-Gm-Message-State: AOJu0YzEeJixFvjezLPx51WbUP7mfta+p6HsyNZoK9C+BpEXNScuDN3w
	+esPNusfimeAveAM/P6Vd0w4B0leuMltZlh8PTOsgiGTG3mGxt4ntUB9TgxMm30=
X-Gm-Gg: ASbGncsX+bdGuTNy5pvw5pQqz9fly6Iv4eZERO6yUG4KrSh4WPjckAIiVXogpkEmYQq
	WgRRIAAXteLnwSKaBIzYwOsM29zbhqAgd9zUIntBDAxXK+MvCcsoEcVBn+dFD4zI14k1/JDH3Df
	01+a4Jz/Mt5XDaKIUisFjR9Q+eA3uQo/u77f0j6KhYz4V2X5BLaVRXz41ReU/SQiTjhJKta+25C
	LvChMxFErMNOLuRIUWAL/ibondR5dinorqzi1HDvor/WD0phnW0mIZrpjBMV3xeqXvt9TWcEbSV
	ILuMSFia6RE7zN+y6PrU7VhrC6ap7vHgdFKDwxxI
X-Google-Smtp-Source: AGHT+IFGVlW2mK15C3vwD83ymqly7SGDcdZjGDfxtGUMODDwfwmSvKBHDe930bRBFlKZrwP2V54i3A==
X-Received: by 2002:a05:6402:13ce:b0:5d9:f0d8:22e1 with SMTP id 4fb4d7f45d1cf-5d9f0d825d6mr625838a12.9.1736957471141;
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:10 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:09 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: google: add gs101-raven
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-1-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_081113_062028_2737EBFC 
X-CRM114-Status: GOOD (  10.34  )
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

Raven is Google's code name for Pixel 6 Pro. Since there are
differences compared to Pixel 6 (Oriole), we need to add a separate
compatible for it.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/arm/google.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index e20b5c9b16bc..99961e5282e5 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -34,10 +34,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: Google Pixel 6 / Oriole
+      - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
               - google,gs101-oriole
+              - google,gs101-raven
           - const: google,gs101
 
   # Bootloader requires empty ect node to be present

-- 
2.48.0.rc2.279.g1de40edade-goog


