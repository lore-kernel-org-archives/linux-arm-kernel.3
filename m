Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87345C021A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13HhyQSKe9R/ysYBmBYlN/OC3FOpvN6dJIQ+dDqvrXY=; b=oGHfLx2eWmggLcVy+gACAlJPc0
	WYqSaTVJuiQzHvrcs27PDnzXd2etewxIQg9mBJB6NXiBho/fSYmrgcAbOpZFB6HkDIFTtM0r1SGTB
	U5JHitqQQGXxFx6sxT9hOXToLdowPZ1GMMmtcrecqaL3v1V5x1UTK2EdMIFVa8pGFsQzrLgyha++v
	rYshy6IGkMmmGRsGk/bH7vlcuELQY5vJq6w+Gz7GkhdVeCVsKxnfqK6fU2YqSkL/zFFwhaOMGf2LY
	x3wgQzLU5P+37HVql+EYk7fF8lkD1ywVq+f6oFbl/32Sc/UkYZYVeEgs9yvF8LsMGDp9K72aB0twM
	/dlZ7eww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdOV-00000001sc0-3LdF;
	Mon, 10 Feb 2025 23:40:51 +0000
Received: from mail-wm1-x363.google.com ([2a00:1450:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc4Y-00000001cXF-1t4K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:16:11 +0000
Received: by mail-wm1-x363.google.com with SMTP id 5b1f17b1804b1-43934d6b155so14088735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 14:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739225769; x=1739830569; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13HhyQSKe9R/ysYBmBYlN/OC3FOpvN6dJIQ+dDqvrXY=;
        b=gvTD7XoA6iSbDukOAPeAMTdHzyGeyZsqrWwNDpTZQwXjeHbijCe8ia+T0cwFFVfxHn
         lOiQ3Q5z4AbqsT+Kzw6/lyXFLyh/WYOywubJehlZ1lixAaTJfMM/CuxH/c7okEVsMmOa
         z1R6pJ2lsy9FLHJcQcMoT48xS81FxlslM2dHpy1qatujQuseejjAhrucCueH92gJnpx0
         mrdP2Ms0Ds+y/48fd3VnwxLD70yrD3dq1R6gYjNWUw3Lwqa7ipC767VkhXXNvNA9OHSj
         pyxEmy7Bhp+/KSzYJ3WnRr5Y2iOOJY/bexr6sxXullSAMLE4UKBZTvOLvfkHQMLQ575Q
         4f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225769; x=1739830569;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13HhyQSKe9R/ysYBmBYlN/OC3FOpvN6dJIQ+dDqvrXY=;
        b=jwtXpWvN9gdx5gGnR0pvelWye5Vmemq4MK1tEybL1rGLbss/OEwqYfM6C7NIuLjVVh
         prEQiZRrICYssM34+s2VMMFf4cawVBfhsOavFfFGWE0WUM4T3MUNaY5G9s8sh4vHcKyH
         k0ecBWxVNsYC0QixtJaApRjNV0yw+1K8ifHOQdj3LbtIc68g2GK80FckSPomlGISu6Ac
         YhGGQPh5SsR79ksM+NEoumhR1StMLhoXMhvpmr6p/geCK9gIFVa3R5Qwhh31dUbVzq5O
         DtkX3zdqG54AfQA7QQMSK1AXZ8UJUFMnTkrHnap/y+gppXHEvWsVLO747c03at8qKoHb
         iKBQ==
X-Gm-Message-State: AOJu0YxkakAfwKB/aVothFMaUUEa3pj5/mf+773TB5wBe06/CUq1kCH8
	9sMEaRTU5ofAAgwZ3ZuPAEIRVD144dgXEZWZhdSVP7Bv11vmRmK7qfa79+7c3B26C3lbKlo5QR2
	oiIiHusfZfYofZzh6Bzu178Ky4l/VgVpB
X-Gm-Gg: ASbGnctgPcye80MC8LKnEqW7OT/Gu1lbcCLTmu77V6TzpPNq93L5/MD6Dq7alQUVu/o
	sovJ2HORIzGQoiYm5xCJ9eg8t54ouY4UjBOER/zZ9r4EbL4u8gsR/mv/8PilO0/etQm1EXVoi2P
	BoioCpqXJBNdkPGurEf/fQ4TwtmGCY4PsCUdd0NHpakW/b4kRzgr135bImjMxr+1aurix/gLH+i
	ANAIqiPL/idN9D1pFmeeWhfwkiEWTIfm0kQHRvLTK0+cbxgHWkBhyb9HGqyzVI1CJmF8hCDk/5L
	5lLH32SQcT+8fpWIuTLzoOo6itQQ9Yhi
X-Google-Smtp-Source: AGHT+IGIpesWPH995t5ObgCbest3RPXsMCOOqvkk8OX3wG7izUgYYfXIQA1gziN/MFCY0sX5NzInpnZxX2s1
X-Received: by 2002:a05:600c:2d0c:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-4394cebd10emr8852015e9.9.1739225768451;
        Mon, 10 Feb 2025 14:16:08 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-439324eedf7sm5407785e9.40.2025.02.10.14.16.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Feb 2025 14:16:08 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Mon, 10 Feb 2025 23:16:05 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Message-ID: <Z6p6pdoLwvXYxkCK@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141610_485398_9D37063E 
X-CRM114-Status: UNSURE (   9.46  )
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

Document board compatible bindings.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v2:
- No changes, apart from Acked-by

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..bc995db8cbfe 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -710,6 +710,11 @@ properties:
           - const: mqmaker,miqi
           - const: rockchip,rk3288
 
+      - description: MNT Reform2 (RCORE)
+        items:
+          - const: mntre,reform2-rcore
+          - const: rockchip,rk3588
+
       - description: Neardi LBA3368
         items:
           - const: neardi,lba3368
-- 
2.48.1


