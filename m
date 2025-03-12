Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=; b=mDlH9JJvhLRKrO82AmL1Ydn4gI
	kHMXHfBTtulwiEMyhheo4k+uepPChfXTjXno5zMynoFVmi0BMxeM7piPDSrsvxHisa50XJ/3if49q
	bIsgTc9je8ZOafH2xrwv/1Vxn2fDqzFoqiY8leCgJ+ZX7bjkfi4k19KWOArgq91UJZPPF2m1ei6aw
	CMLWRiNKQqHItbCVP3e91GlOA9AOz0cafXGMse6959CegAmzyyCgLrTqgTm6+nu59aa7OS/chPB7D
	Iibap7N115ByUlf7znNye6344C9JgzqYYPzps7Y9IcXK3QKnPNq49+QyXrO2pFBLb0He7ztXaKqIG
	KCJgD/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJrb-00000008CVq-1Fcd;
	Wed, 12 Mar 2025 11:03:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZC-000000088i9-1Ft6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:03 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso1318674a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776241; x=1742381041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=Eu5ajO95WMUDPf9L0BlqmBC2c/lJ8HiwthivDLX1Y798tK+2L2dvJpk6yAjv4XTQV+
         masCNyddVguZiVA3vQQ9ZXGB3gA1GwWOZETatxZkNoO/zezZKqjwmFFDhyQbo+GRnyws
         ZQQpJ1elcNeO/tyxJfH799eoSNhqlugq56fmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776241; x=1742381041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxzmWWsaWRiq45r0L/zxKeyJjU9fd3lt4WjlEGIOB28=;
        b=WgQDhUT2XRgcUMUx09TkIwPusyLrpWe3OwrkNx9RXTDsHZgdTWtg4F3CtSSHal85eZ
         oApC96qckcb/OVVUiIe+9aiS30TwEiCCZS1uC3VlV0LqxL96zIP6o03DekS1NeA9b4T+
         IQdPuIN/JIx9fuO2BnT7hEw2efKkj4kU4T/UEERKtC+e3SeFy4SFwISjaLL3Gh9x9Ogg
         0v7PyMPUcTJOLAQ0ezDPXW+QQddXk+5FcOq/+dE2IHtI+UyPxqOSIodLOtTpAvqSPgix
         w2VM1UuqRW9QJNMP6ikkmKKmAp8n4NO8umPAfF5VZhQxwsDh2qACzH7zCCKVJfi4X2Ly
         SXIA==
X-Forwarded-Encrypted: i=1; AJvYcCWGU3WQ7tmE/o2yBCUBJVR3ogM+IZm9kRbGe/BsxXdX+od3Mx0VfIC1Wshb7GwM9aoWsqJU6TrmMlatkPaUQ1gq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa/xFp5OX865OyRKIpOSm96UaNlbZSipVSx/W9CqgWYD0Mbd8O
	L36Bl9LdOn0PnJ0WmgKfAuoQKwM+xTZRxL7uxsaVADxGnimtEYA1VCW1Uuw7Fw==
X-Gm-Gg: ASbGncvZ/kjJaB4LY2iKwPQwXXpHeWYtCys7Dp7O76KUiV1+n8iYhTkXM4xW3baloi7
	HuQT5Zwz6c085VFI/brTFV1sHIbNDJMFVLI0OlRP+lnOYIE7OCi0Q3M0HgRsFzujkN7x7ZikGGI
	9Dcupl7mPJsp2RcZMmvC7lpPjWUVwZCWw9cI1rn4WHJAO2Yh64ltH/8DViFfUtWVcT0rglPILgW
	pZbukHh3FYYtF5k9sjiW8B0Mro/ABjOQZVfdrfNRtr09gROQ6jSUcuk5RHVNNJWQ2+uksMQl4LS
	gDlpa087nPz68+cGuUT1evY17Ds4LpyegfI12aZyOnYInnFYrVyYFgPHFhsJUiE=
X-Google-Smtp-Source: AGHT+IFVcVkyWzasFzgLcXK9na9pqX5Q0hBXH6KQUhneK1y88uS9e76oMaG5HptT/l+HGn/E0FP3lQ==
X-Received: by 2002:a17:90b:384a:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-30100546828mr9403835a91.12.1741776241373;
        Wed, 12 Mar 2025 03:44:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:00 -0700 (PDT)
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
Subject: [PATCH 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Wed, 12 Mar 2025 18:43:37 +0800
Message-ID: <20250312104344.3084425-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034402_337013_80A4C5D1 
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
2.49.0.rc0.332.g42c0ae87b1-goog


