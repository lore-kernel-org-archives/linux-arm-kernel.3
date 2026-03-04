Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3005BEDEC1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=; b=VNjOzb9zK4r/YQb7FHyiEK/5Ma
	j+zfcljzSn3oJSwvvXB0Wb0i4YG4lS6u8WeymPsg0lSJBCkuS2Rq4XSxYITubyWccLGlnUMtnPm+J
	b2D7DkmboLDyv1kBDHdaXPIgKOIq6GILhJY6brblbA99JcnGCDUi7ceBeCS4NXRKFN82cHTOBthr6
	e77k47RUZDOlwdXpU+oFcdIGCW4UgFhkLlnbAq7eMmWgVaxj3wXNOZ4x9LibrLiAT3ru3bIJmgYWC
	URB3b1nRa8uLrXSoObMnQXUU2JJWVaIBKMAiwRNzFfn8isJVcncvgk6pE9pYoCgrgm4mWjnKIPsrB
	ehsLPSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgku-0000000GbZn-0W9S;
	Wed, 04 Mar 2026 07:34:52 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgkq-0000000GbXN-2W9w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:34:50 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5759493eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609688; x=1773214488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=UH4LVTQr2sc9atTWNwP/PilniHsG5+aqPf+I7n1VIQ4vOAGXkTvw/PREtdXEZlzoRA
         isJYtOS49AOK+pzqaZnJgMfyoS+8plXv0r/UITj66+Y4TZKE2mbj2oqgVQv/LWkCIbHb
         zKmHsHwjzojtpFBdeZSyuR6b8DMmu7GGPvT9jNwIVBsGKYo9Rl61VQYD0iU7sCJv5mrI
         mZcKteZQ+PpRTvqQSiYpWcadBbAhZB1QSStR2WcNjDbqQtyCZso6PRokjXY+EMFWVtXR
         HxRDeueR5Zd6E41QvsExh2yNv1iOpF6wOcUN5/Cx5JhX9b/HuzNYv22+9yfNozt2tn6o
         v4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609688; x=1773214488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=o1ljqfdm74tZm8cNMSWz/8xp/qTVaHAo4ciIZMxhE7N0wPxU/MUKoLQ9gDFPGyMAC/
         eIWubnw4f8ODp1EsJst7kO4hzGf93YODg9bAgt/tmJhIXiucJh/Uie16D1m9AwlPv8CB
         R7BoYj2cRTa5a1nv1wJ3sVtua6E01Dk3k0ajrKlFdt7Pf1L6jRvwUp1cgCzUx0n6X09m
         P9B910m3Mh6VYyHe8IqI+mzqkzB+MSWo53KvtNiX5EAQ4e4xU8CqrCs4VKV4/8ZLQAWx
         jWvt0D8RjfFDB1+nityEJwbqvH9Z4hR7lzqwKuNlAfk0DxRmlEjX6b0JEQ9DmKNgktMA
         E4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVGn+A7yh0iGusL+JmnPhxAM7g+YZ3pzlVI+LCYMJknIk3oUCQ74nJ8uU2KaSlGK6+Avr+beTrE09JQP3lEJVsD@lists.infradead.org
X-Gm-Message-State: AOJu0YyznBgch5fe8u7+A1ccWGTMmAvZNyFV3XyHZ4J0opb46XOCa3qy
	l/GYcLIuwJ0n+yrqjpOxcwB4RS6600BGRSJuDwyBDYUGZgF6t2klaxKJ
X-Gm-Gg: ATEYQzy+2+uRMnqxuONpp6nDN5VzEi7ddChTE46PUt9viDMeeXX8qihK4jzZ+rABkh2
	UjTk9rBi1Nn43VHRihHqVWU0XWXBEJPsXZntDmufCO3TBDzwS/htZFlbPH/HZk6DozNY1EfZNzQ
	4AWaFegbIBIOxp2X7Duy7c1rUpPiq58OVcVjwi3bTNqPgH06uS18dehqy6gxNzPRRpVAWXvJFTu
	4sw8viblHknwMXZxJ6BCoJNf7wz4D5yJEZsS4X2bLuuYuTW9eG8cUM4zDQfb2d/Nqm/xGWHYbI+
	zhpeaDkF4nvMB/Z6bweDYTU1gMNUnaBGh514JSZJqn3MZqV++/S4UGrLr+DvFl45gXn1y9+iBNS
	gc+B5oSbJQzYvZxD2Dp26z54SDJ1iQGdQlVTV5QYb8VvXJSt4pvXG/vMLbxB23JAV74Cx/SGFGy
	67P4nK3g0zMZ5estWRuNDQ
X-Received: by 2002:a05:7301:1004:b0:2bd:cfce:4c4b with SMTP id 5a478bee46e88-2be30fa615amr465643eec.2.1772609687731;
        Tue, 03 Mar 2026 23:34:47 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:46 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Wed,  4 Mar 2026 15:34:29 +0800
Message-ID: <20260304073430.438835-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304073430.438835-1-jerrysteve1101@gmail.com>
References: <20260304073430.438835-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_233448_636969_DD45AE20 
X-CRM114-Status: UNSURE (   9.65  )
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

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..e6443c266fa1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: ultrapower,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0


