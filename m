Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109C1D1BDE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VCnqPhJAv91oFzV5RkUJqtr3PFZFRnM/qBGQTZCSK4=; b=1bwmnyMZuS8nDBQZTVKO44Z0Vc
	OA1ljmtDqhd0IPsIIzTHZvQEUjnmbVbJt+A1Bef7WDosMgTwR2F5IJHWsQ9uEMS8f1LgwOsC41M2p
	8TMJEBhoPhgYCwjFGtIon5DHKEJ8xAhTEBj7XgxyzYpolOKe2j9sxgtTAK8ziNpiMdI5g2lkJ8gOS
	t+KIAXNBVFkVf9w02ci9GJafJY7K4LwXRTi4/0oaeDu/jZZa8r6vRo910H2AWbNPl6i0BwbLmwBxO
	DGqGwMLiX2NMOwHLnULD8/2CUSYdsgeyYQ+aOWRgoF56JH0RG8UHrSRZyFYZGkS8ubbGEByYovWrx
	ULy5gM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHm-000000077UH-0NOc;
	Wed, 03 Dec 2025 21:21:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHi-000000077Qp-3epL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477770019e4so2135275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796873; x=1765401673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VCnqPhJAv91oFzV5RkUJqtr3PFZFRnM/qBGQTZCSK4=;
        b=TfmdZtZEE97Lnz4tCZoBTc1E8K9771++ZMangn3D0vF24xqXPFLRjk0jbZubICC0xd
         eb95iFYC5WERH15HD4+6rLtqT6TzmMIndsA/Xd4oXoEP9d3V3BPy/r3he9+MZC4QEp0M
         kepGZojeoXCknUOPr9LIBN1YMEYsN/+BKJLvRZWbedL0PLoCz+MMGHi3EU9DsQQMA+5Y
         SUR1ZqZeH2ea79fTyB62kA0XL8+OihpQIHY/xxobHkHq+ow3dteyM17dU5QSu0f1/1jR
         RDeAlmSSAcxl7tGCj7OkVWTbUTOLXMtD0SHoEBCl5vx1v+ZQMhedUk+ZX2fBkCSim1ib
         rrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796873; x=1765401673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VCnqPhJAv91oFzV5RkUJqtr3PFZFRnM/qBGQTZCSK4=;
        b=lX4QSdBf+ie3eD9h+N0aub1VN2UOtdDo0ua3ojaiN4wefDborLrSRYMt0PSlXD/Nfc
         M89vMIzOxjJzau1ke5Inh4xu5DTTOX+hUb2iWIUTFH+8zzO9uUr7cW61Y7URRrQ1BOdm
         PhuhEoruzIuZZrf2hOt+QYozXBK4TMC7KSFuoPwkBfPNnTOCv+REI4Oyigss7sC28DJ+
         DTR6qjUpaAIgoXvcRRgxXrAiD3ZrAWntKZg52syOi+GCMSNb4Y/eyYkAppX/58J42DUP
         RibAzRlPZjP6jYu5VRvm6rZutxLBc5+HhY2CgzhDJu2mGyrL5wovQp+7bWGnuR6kypE4
         yeDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwpRS7P9040nCvGzBGEXy+SaQFsu3ugu9SP9fcl0vPY+U8Tgzvo6s3RFLvs3ROqLFwwKxK7BvG1w2BfpFF03F/@lists.infradead.org
X-Gm-Message-State: AOJu0YzQgVvGcOBeCY+VxJ+YQ/4ENxcKDhbqYXPeex7s3NJY9e9lMFgd
	JLTl+pHXTMXCCCXf0Pq1meo+35vI72YDQxDqaSMBIzPdgBjB7xWDOacA
X-Gm-Gg: ASbGncuUm/ELNCqB51pAMEJene4d1jW91SN1SXGzPt/bQzOh95Pw8i3BjhG5TunvW5k
	tegnYmoFTcjGpMmiosKu2DJ2RWcgtXn8sRWp+NbKDa7mifEr+qR5dMxc+WtD1vVRqknIXvGL77E
	/LZaXWAmDYorox++BRSzktJ2bsV15pi/67hGbMK+QOy++a2co1aIVzWzagzQgXeVj0KZa5689sy
	8X/PWnu259hGk0MD+CITMOdpnDxPizXLtHRrmPffgQ8pIwWWz9ei6IJ6tlL4Tb6oOCdtsbNGGfc
	+yBofgAfWGh2S2z+/nbX21umGUL6qFHgWXMP/sSJnUFzLeu88VFn/jBGyYFiWfO9htDp4AwmiHr
	FBzpBkxf38kHjfNvIGj8NJ3M6AI5oqubAjhmsG8hNi4Z/fR+TIg3vZm+tNQHY45L1+lrCtOOvIg
	3gSJ4j5munlkZXdMNjJAumGA/WtA==
X-Google-Smtp-Source: AGHT+IEQb2k2djGAaaOrrubAL8cotaaXzpmwb9ywB3fXqMoQMIkGIZ7M8ouSlDgCOvzXCCNljCajAw==
X-Received: by 2002:a05:6000:2c13:b0:42b:3ad7:fdd3 with SMTP id ffacd0b85a97d-42f79800ecfmr412479f8f.18.1764796872870;
        Wed, 03 Dec 2025 13:21:12 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:12 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2025 22:20:37 +0100
Subject: [PATCH v5 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-review-v5-1-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=1097;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=7iOFyKXGUyWDuEZAjVc/M9a+gWMr/52/ubq0TALoCug=;
 b=EiXO0OVlGDQSkgB5iAR24vdHCk5tvHK4Sh+BbG9kE/1Vb7BXNxstMgDeSrK6FsTEZjHGxwPNP
 Oq1znoRWbzOAtvQwbCfnM1h7ByNlw5g15qlRF25OC/yBI7Dff0/uNI6
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132114_931520_8EE4D341 
X-CRM114-Status: GOOD (  10.39  )
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

Ezurio is the new name of Laird Connectivity after it acquired Boundary
Devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Changes in v2:
- None
Changes in v3:
- Added missing Acked-by from Krzysztof
Changes in v4:
- None
Changes in v5:
- None
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba..e76e6c5be726 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -547,6 +547,8 @@ patternProperties:
     description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
+  "^ezurio,.*":
+    description: Ezurio LLC
   "^facebook,.*":
     description: Facebook
   "^fairchild,.*":

-- 
2.43.0


