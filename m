Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580CAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTEktTiHYW7+Tdn5y54ehrrNgsnN/rsQeRiANrKwqEE=; b=gjYIF7Dg5cvCF9Ty65liOlOhfL
	CGXKTB4vhmX6P6DLMuFMcwoQNYK7r5U0pJn4TMCS3Ni8fzp6U3p/W8I9PgspIysWpmlZtxDKG0QO1
	uZV2JM+EanFhhzEHmZuGwDiqm6rjfh0ug77bPuMSz1eILwfXY95QbkQImsRX/nWw/VuzjUBPYxGNd
	cYkoOCkep9LIzFXgZEYrkW5Gl+MANicuH6c5auxWmkVz4o6kvGJV7fgAzMNljq/kAqE29DXVIh65m
	eFXIwPpeZvzQnP2A+4A92voFJk2VRQhFRbsBbXRk3jNI6YtvhehNcQjaG7drfS4yj4jOqGTlwherH
	uSFdQH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTj-0000000DVhn-1sMv;
	Mon, 06 Jul 2026 19:59:43 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTZ-0000000DVRq-2IvY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:37 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso773622a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367972; x=1783972772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTEktTiHYW7+Tdn5y54ehrrNgsnN/rsQeRiANrKwqEE=;
        b=lJZASyqDD9IaVqFSM14rTbd1hBo6rlcN0IpvBtAcIxnYi6u3j9iujnHWxRhgaKPXV/
         J5Xjflw513u6PspUdUFe/vi/TYB/ozrIrdwz9RWFuGMpBmFyVt2j8YIHod4lnUuaHGrl
         UX5EVqak7jAXOdkPdIoLx1Rl4EXuEB9KjxbAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367972; x=1783972772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HTEktTiHYW7+Tdn5y54ehrrNgsnN/rsQeRiANrKwqEE=;
        b=UtR8ESqZwGo7ojxyqLxZetYs2V7j+W6j2RCH0ug5qXmer52BKGs4x523OxCMNoG11W
         Xm5uQCoOY5dYrhAFTdeml/AP3BCRSVzipC8VXX31ziLxBHYlYUt1hvnmbATcPAMGJkey
         yrpVlMdn3UJZTZdMZHJAQhWKXZljZQIx+Qk1IB3Sptj4Vtq0yT8kmunUkzNpElViKk+z
         A34bWcCLM5gW5jvXmaHPwekGDYb4JkfGk2KIZHEXSoq7s+9wex+rcAyt8mQplVuiDe/T
         a099iJ0wx108XfWbutIk5Y4/pv9JWwy2b4w3y2bs6t8c4BPOXHl92vWWAQQw751H/jJt
         OCxA==
X-Forwarded-Encrypted: i=1; AFNElJ9Cq2Xv7dcGE4Fl3UQSTApidAuG/IqEWAS2QwPqIwNuNskXkZdHpYzfwj9GlPOobFDZbIXk8twc6QlhR1lRu8pk@lists.infradead.org
X-Gm-Message-State: AOJu0YxpSBVnMv13GoEdF6XUsxFCGQ6E1SeGbTMeiAUJq9a0K8hmFtIG
	YvWtfIHXNeS2BkKzeZIm9lz6VVULnrDyxJppdqSAH0WBZLastA/Gma1H32gpHGKo1w==
X-Gm-Gg: AfdE7cloedlqlyCF427ZUJHaZIioyBQLxPRg74lsDbQebLQOYoNsXQBL5z7E5cIcCu6
	L3S1IGlEx3h9TledLYnP7QPArgmB51lT8YYSiQ2QZVVJeHq88vi6q4vW+xtgDA5Dr/DnGDYDbcs
	q7g78kZh6yzKGdnNcIR7EBaHVZd5+W6OkGmOXQ50hRDR8MEQl9C7+HxJl/G1+T6FPFI4bPSJq3k
	E/w/G3YphkmpJSCljgll/OAKsZxu71D3pu8sYVvYmay5YFEN2JUSHcXnUCbnvSESVTLFiFFN2cf
	yJDcT1pMOPPL//jOvn/K1fydOOHlqzUZb0r0LfUv420t1wixHjRQ7kCREK1WSqnEaHVjZoEAJmU
	30PAGwEfJPRJtXE5gVq6RO2O7arCqtch355wKmm1J0Q9k89ylrG+MpmGKqt0M9yOyuGoXiVEt+O
	1z07knSTah/yBPU6gU3A==
X-Received: by 2002:a05:6830:2588:b0:7e9:2d33:87eb with SMTP id 46e09a7af769-7ebb22625bfmr1361922a34.12.1783367972711;
        Mon, 06 Jul 2026 12:59:32 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:31 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:58:05 -0600
Message-ID: <20260706195818.3906949-10-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125933_599179_991BB53B 
X-CRM114-Status: GOOD (  10.31  )
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

Add the compatible for the SARADC of the Rockchip RV1106, which is
compatible with the RK3588 variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index 6769d679c907..c3bb03dc4853 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: rockchip,rk3576-saradc
           - const: rockchip,rk3588-saradc
+      - items:
+          - const: rockchip,rv1106-saradc
+          - const: rockchip,rk3588-saradc
       - items:
           - enum:
               - rockchip,px30-saradc
-- 
2.43.0


