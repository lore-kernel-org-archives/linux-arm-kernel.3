Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=; b=v8UcAuqQVCp62rG3Us1n+y3xGj
	WWbjMorBck4RAVrCGEjGwkS6MjVaAwtevnCM9pZ8x7sSMEd08WuNaAXXhorXkuJ/Nn0eXoaAs/HMU
	5f9WH/4lv+2tVtq+oicwLIX9prcG6A+UI2RzrzhVRnjF1qozzPiypmolFUlbNv1w9bGpiPVB9EzFy
	y9q3G1FFnbzTuQRQPfsxDA/87vg1eqVXjzvfU7nXi8KYybowQNVlCwHiwGDrOtCucHChwr9CATAlf
	6I6UI1PQ6+3Nac2oCBxL1QidHP9tZs982rsErbNanBu0NjA8A5vlCaQrpQ5kmd2CiOePTYeRAmNOu
	31m6JSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJpy-00000008CKA-2hqV;
	Wed, 12 Mar 2025 11:01:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZ9-000000088gi-0b2Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2243803b776so121726315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776238; x=1742381038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=d0NfefxDy5x4FIGOzFp0S2vQWleNSAEFgGTa4hG2+9SMxhS8USNySCekEMm8fSWK5B
         CXlV0elRCpu2t60Fm1Sp68erZT2bTLTq6cNhV77LS9fl2AUkPB+bR1SGlOMPwUdDMHkP
         UyrdJxXM0OcabV4oenwC6hD8uWeSqXor/yr8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776238; x=1742381038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq9hWTh28AULQZLwRWR4IEZNtznQ77t9F1aproSHTVY=;
        b=T9LDTUUdrgdr7m7TVbS0DunHb04edx52T41i3kxwxUwBpTJhui4VajijdNf58nrwoh
         1SbeBhXabcSgiBFY4yP8SjrEiepULnKrYPjqhdBsEiOjXl+ldtCap8NRqFB1Qs6mcoWW
         sAlBmjXAAygwYRKlKwItGGwuNW1rLGE0EPIJOHjviZnjNT+7kRpkRLLdZ8Ceix0kPPlF
         bqGyBQVFigANCmJafLW8EL4aQRzrAB9aWscwH+kfFIIe/a1qQFj9esCZbAHPTQr6UA9/
         EtKb9ArxryuPvmLqyIVyOZHmcAivWQ6aLCD6zz5yR8tOW8riOf01cmR+zW/racrrEuJ5
         w/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCULl8m4vECGLXh7SeCHvIWCYRhv8wLcTA9HIjsMJpmXG6K4HNQBdnVFEtpRjLDxEQGhe90o5LQlEYYKDnC7z0yd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxon05rxCac+/fWuSn/OAoCk0PrlKCaBLlqwqgTuH6EDGtN8PFH
	BNtPVKknIqN003LTZbKgDndJoy+7aEk0K2RiSKNOUdp1HBWQ5o3/T2YwqzHk+Q==
X-Gm-Gg: ASbGncvvhbVPLo6d+kImEW9zxktK0ulJ7x8XrI9TpRjiqviye6teXlGiQNWk/IIanjL
	VOYwHPiBiPwe826lfZ939hoEvYQ0E90lrH4+qb9XWscDgqVwJzwvl1jFM9gkt3al9fp4YNQhqia
	cGSg9k6yVUBHBfJl4yC10sNZaY1gE4vrcZmk7pfEPIdNeXKPSwHs/SObPws6wLJYiUMTOAaw6FW
	PJayvHEZ0kix2u1L3nAW/m0leAhHasQDPdZE0CVClejXgQjycURtnz6Nu2N3uFS6ySjkt95RCnn
	VsQpvcIg8GhaZDONHdAetBvPWQ0LPTIFZNyVD1YtrYoi2OWBvIy8t4K5T6kLY1o=
X-Google-Smtp-Source: AGHT+IEi3t/oRgH4tgJIjV7dZt0tXAW1XWislifFGuRCmj9fEunpdxZYOlzBA/knNfUOTDyGKEKM4w==
X-Received: by 2002:a17:903:2445:b0:21f:52e:939e with SMTP id d9443c01a7336-2242899465emr387459965ad.28.1741776238354;
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Wed, 12 Mar 2025 18:43:36 +0800
Message-ID: <20250312104344.3084425-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034359_184037_9D81A86C 
X-CRM114-Status: GOOD (  10.95  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..49ddc504c160 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -339,9 +339,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


