Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7057D108B8F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=; b=1QnnNIrQmgsVxaX/QrjIHudxCs
	AZGq0BjATxeO5yyF2P6Txh8CigzyURhuLoC5NFSwtkd1qt+6snh5/OscFR19IAKfiTaaKUMZqaeRr
	RzwwgWtXngWssYYJazDPTqWJrL/H8mu9rTyNcuj/6Ge/e5YD+bYa2prSWbafhyBsWCO/8LDxQwG2c
	mCD4ezIyuiAktYKO9bPmtVn2kpi3OkpzGPUaTPIdua+IkKEDlcT5vD8AXKKhf4zQlNtDKkoCWBEEP
	6fB4GpNeyGskHikDd483VGvYVyrpiCTqAoIZIeX8HAwbt17/CujVjb57d2B/ucqsymsufCDIHMIr2
	tsqUNOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYu-0000000CeyN-2xaP;
	Fri, 20 Mar 2026 10:58:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYs-0000000CewY-2Elu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:58:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2addb31945aso11555405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774004318; x=1774609118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=;
        b=CTg6Rg8hOn+Az6rbC5ts+roy0HGq8RLIcALRXIjzlOFSRvzUppO33PPtpZ83aYJrm2
         cu7tyrE6U7zSocz1mlreO3alNU4x0zWgJC/9NRTMKqnZp6riMIFBupq9RpiZ9jF1ehBI
         6zPQfglQqVWzxJNypn2fuGYADOIzvai4BNV8/lKMKkY6F3jjSp+vEw7fMBIQDZUELmmB
         ALwdjo+7Hhhnvz+0GaZBX/oiW4L+iw5gPplVxVQa4D1eTcpYqnVwjgb4xhzH5Q7ySl6M
         z6laf6E2iHGKTZxxOg9wPWfwUjcaP3fRRn7B1oA0YXh33UkLZvRwxqDr+d4LKkoUO5Z5
         TGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004318; x=1774609118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8tFuqEw7uEaxrVCM0c2XUrmdxZJJpRpZ/5YMe+0gkds=;
        b=g10R4ROI5WoZXc/Oypefa8dGXWhAxgLm3UtCzYDiov7supv0RjLQe5TPbo1Icy9wtI
         CCzeTmoB00e1dPHOa8HympwUJp/RxW9yM2vpMg9ZghDSqnHaIpRN+Ao6eXu/vbfvzMg6
         EH4+vFSyhx8tE3l5irC0Qjyh+bS0aWlFMQZspCYc+l7MtJLR7nStjFPUS6IljJ79habA
         hrV1d4imnyp1iJNnLMAzWLGiAdT0K3gJ+vGvToKC1Qh59wAizxhmoNV+9hGGsrEUad0D
         Gpll76QD5UQp8hPIaYAgzP3hDYVZMWY/NcmwAitBzytf5EgrSpPaVi+a0XhQFCPGDf2N
         xinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi7GZnGEnftWf8ylbkGuNNwZIg3A79/3G+GI8vzN2T/sI5i5i+X/SKwgv1ry+cwOz6sKlgtDrXgU7VfeJ9LV0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+EwNf7SGi+mp3+CYLI15z5hlqm+Kh07ohH7zILoMKZhmubXl
	LQ+rz4pLdJOPZbUk77Zkx19G+fwH1e3hUkZB3k6bOsTdVk4fBRW6/1NQ
X-Gm-Gg: ATEYQzwGITT1aHsuCqirWHA+4hOKtGint67JTNwTPFILaVtZNWx9fp+u3P/jQY56dVd
	iZkAXNXjvygRTab56ZYxuXrZuLy4bchZV8O+8whEabny8d6q165JG1HVibk2h/yP7Oiyy8TbwUi
	lo/qb27cN3FKF69vJeHmhbx26KhC5iOUK70KNUFK8m5vMrPjj+Z9toK5ccVF3E61IppELF7mfYa
	zCI8qOYTvA3evcRhfos1171m8cO04cKEAkcTe8lDdV/fpJhw1t3/zzLLbgLLhYOlaHQjsgdKd8x
	OaTmfpmFAAoT3oA9kEIptHIX9yGtE1JiVsptM5MqwN5ZaOVkKV9SAhrXGRncwXkZuIYMnhvdyGw
	vyZabUT/zCiZra9p3QmdpSMwR9A0krOWsU8zIIHb+yRBbUS7hr77EsmdimMEdF46fddYsBEPOWn
	9J2wjv/FwRfTPWpYS7tcfIdN362/OIsw5rBKMlK3T8dB4MvZU976ok5ycJlXWbUOonRTnkbRYAS
	kDsplLFeYQZXWJ5mQ==
X-Received: by 2002:a17:903:244b:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0827e926bmr23836145ad.53.1774004317735;
        Fri, 20 Mar 2026 03:58:37 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm25636405ad.15.2026.03.20.03.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:58:37 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 10 (Wi-Fi)
Date: Fri, 20 Mar 2026 19:58:21 +0900
Message-ID: <20260320105822.447337-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320105822.447337-1-akkun11.open@gmail.com>
References: <20260320105822.447337-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_035838_571456_3D5299B4 
X-CRM114-Status: UNSURE (   9.66  )
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

Add an entry for Lenovo YOGA Tablet 10 (Wi-Fi) tablet board,
named b8000-f.

It belongs to Lenovo's "blade" product family, a codename found in the
stock Android "ro.product.board" property (e.g., "blade10_row_wifi" for
B8000-F and "blade8_row_3gdata" for B6000-H).

The "blade" family includes several variants with different screen sizes
and connectivity:

YOGA Tablet 8 (8-inch display)
B6000-F  : Wi-Fi
B6000-H  : Wi-Fi + 3G (Data only)
B6000-HV : Wi-Fi + 3G (Voice)

YOGA Tablet 10 (10-inch display)
B8000-F  : Wi-Fi
B8000-H  : Wi-Fi + 3G (Data only)

These devices feature 1GB of RAM and powered by MediaTek MT8125 or MT8389
SoC. Since these SoCs are tablet-oriented variants of MT6589,
they are grouped under the "mediatek,mt6589" compatible string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
No changes from v2, so added Acked-by received in v2.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..ab3c5b1152f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp1
+              - lenovo,b8000-f
               - mundoreader,bq-aquaris5
           - const: mediatek,mt6589
       - items:
-- 
2.53.0


