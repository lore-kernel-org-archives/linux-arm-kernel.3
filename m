Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920FEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=; b=lyzxdL0/2evuunqFLwjuUqtYGa
	NZdxlbxdqvxDt/Nt/j2uTV8+BnxyOewDmmP8KrMrgqnR0Gzv5UHstlWm1nvA9pSNdTH2gtyYGpv7I
	MxfvkJf996qtM3ofgiOzyO4URvPxQMHY2OGrMSKxtO3a2dJo49Qxh+yLkaSdZQXSUtiM+n5SQIxCl
	i58k3AOgpG7muRIaAQUwoKpmohdXhJ7F//t4e83os/RQeu+JtcWy+rXDBEr35QMWdOwdtKkUb1ZD2
	sjGANbXIUnCdwqoMYlQMD1PBhc+pShl/YID/yuEKj5yLaNMA2QkWtDNiIyd8DssoiSh5RhLxYKWiW
	A31SqjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oGa-0000000453C-1yPf;
	Mon, 21 Apr 2025 10:20:44 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9L-0000000446i-1A0K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:16 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223fd89d036so46038865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230395; x=1745835195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=MOkq6fTZzYwuTlHW5vfVdeE5r6bDnFQ8HreY8FLdAX7vMePmth+xjVLGoVC2OhCOV/
         x0MWGnWDq0hy0Rwmiizu9h6Gh9yvVqznvGsueY7tYOoshmxymloC6dx4IMt6gBge412t
         eoEPBnynAXdzmXCI2Rzl+SDiq3DNm1nRlQxWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230395; x=1745835195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=iKjWl33ehP/OxmpeVQ6hWF5MfHylhLLv1J2SWvE1yCE8NBILuiDM90OkHKUP0nt5sY
         +vq41v7hsr5lhkysr2CmMGfvEp1piPe2yu6BFU4Y0XNLJWsT6d4FzLWnvm/LWBBkNzzZ
         kXetDzJ/viNh68GbMZGR8f3nJRtrHkCjniF4cAUl0BwjqFt32JW9UA7bHIiNRwJ+B10d
         fwljPcIwm3Zn+OqgLnqFwfiAkbr+TNbhV0UAZnDPQtcrUL+70T1fTw58kpVWIZQ1xMmV
         WhcFNp2akOyhgv84FOZnQI5QXAsK6wVDDzuhVSMKgONwkXAemRbsC6tBRX5TypLf7O4t
         w6dw==
X-Forwarded-Encrypted: i=1; AJvYcCV+3UOa5rHfi4cvwNdr3qOY/m5n2Z/iBz4HuVookjiooiLVU0xjx2L4E2hDbo/dNnwzH+zEtGXMchaO4kPQypGn@lists.infradead.org
X-Gm-Message-State: AOJu0YwIcCqOdjSG5Rs3by2ZP+kvYLXR240eSMy9ncbi3i0bYCKMkHGn
	8YVv3P7PD42rPV4mM3mi/CjvDEoEVIc3IHah7OTG6N+mxSgZjzoqa45NcGNAqw==
X-Gm-Gg: ASbGncupoNJ7xubgQbAO+fvcD+SSyeS49zcSU/YK2YLglE0lLmeIHaKfGro0Jx1WDFM
	gI9Ci1mdRou7piyFL6fKYBkFBWqVXFE02SZFAXlnhLlGYZJq6mAczNtJ3bJynr6XdVrvw5uiM4h
	pq4T748jtTrI93EUnhuP5fblcpxZRVXytGBHEK39p+0y88Kv/7fm5ZnUOPwWJC+A8FvSqll8B78
	c4nSgC0+WVtPRvQhZ0yJ5Jf5xpzWEamc20zidVil84o7oXNdcdm4tTqKrG97cbO7Iv5Hr+DY2+q
	Cw2BvJ4h1G224kK86vuQDAqPIutHQ+KS/hiQOZaUUFSTWGn5z3b/cW3MnnA=
X-Google-Smtp-Source: AGHT+IF+AnZFOOLJPlbiAxkDb/YuGPI7JP89xIJch2irCDOD6BFYAkiFyfLLQWgKCePZd7wiHYd+Wg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr173618945ad.25.1745230394801;
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:41 +0800
Message-ID: <20250421101248.426929-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031315_317992_1C79693B 
X-CRM114-Status: GOOD (  11.08  )
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 49ddc504c160..f0b4ccd81c4d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -291,6 +291,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.49.0.805.g082f7c87e0-goog


