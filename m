Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB5DC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 12:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=; b=L08uWndbLB0Lqffsx3JiXvc90f
	12RV9PgO7AjcXS83ktBfLnIKhVZipvgJLsc6d+4q+aMQ6oHLSA99eGQguCBxlJnlpTM+Lv5lYSbzX
	/t0l7Dg2l4J7u+z0hQ09h/qtZzG2tMibH7S8hDa5BO/l1kJYS3WKmaK7YKy7VecgBKd8afzkDfrEg
	jibC0rUz9rGHEB/IfvNy03RRJtvftmr+ltxdQ6qsO4CaJVf55nN0gW/PRDfFSsYUUqIZR6gVfE45J
	RJxhqRrc9ZIoHlSEtzGWmIQ3zSYuX9Oo7oYW0tHaBH97RoX5U8n+zQkMCE8cHQxn25ulm048XAbUg
	ucWP4gIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIY-000000036Gw-38zC;
	Mon, 24 Mar 2025 12:52:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhGq-000000035X7-0sdc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 12:51:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso270477f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820670; x=1743425470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=qHWvlM1gtcMeZJfnrLRkWn5wYqJez3GppSyIjCA3j1pBxyh9qto9ZySHZ33dA8GGhM
         /nZJDE2QiTP7wWAKQtRMbvVr4TJXcS/g91G/wAI9n/pvZnMrRNVttfjUmtFYM4FPei4F
         faGTcXNmn18AejuG+ew/I1vrLrwHeiy5C2ym9tU04Cx63EDqSNzwhoTTekyghXqR9TB8
         PtSArYi/Nno9PZy59pom4rKRhpKeqsLdsZ0hgg/H3cB2WLXErWGIMFtahY/Q8eNWpb3P
         doVlDQecw0xp8zPwaZdIJVH9zmEfyU4WvQ5SQWW1H6dYGA84MQCnfUXFQWpbXVBAQ6Jd
         uZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820670; x=1743425470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNkO323fCDGziIQ+TCe0Bh3YOcfzf6+FAg8ZnvrxNgo=;
        b=iSUprfQaeu5J6m8kiN1RFkR/mHiZ/ViGDnlopv5mU3nmV4r/g3zfGi5WpPQ1u5UXrx
         F3WQ1LGV2cAMrkFn2MiXKRbO3te9WDz9Qr3D/mIMHvmiiz6C/zVdGOsyloKSjOvK31Py
         v4zn+tC0y+mznNhDchY2pimZWj374C6mCdGNoG6ho/8r2Hr/ZA6Y1cMgkTB+ChMYumY5
         0RKU7kne3d5nKYqdnXAnR58G5Uxc9jlBXM0fjBbwnwkWCqBQLucqOBNPGlMOxU+y9oun
         Kqs+nyyCAosGauLdPjLkwBZXsyna07G3yOzHFlYQh5m6Gi9RNo1mVA9xNPu39crLuPWu
         3PhA==
X-Forwarded-Encrypted: i=1; AJvYcCV4iyoo4n9ZpL2E9uNhk+wToTNwY8w0R+3lgYiOYU/8q60cfuxTPu75Uj3Ecqfki/BOzI9w3RE8W6cQfZ5Q/bb6@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+NN8QkNhRp5IEEYBH2Q7fPRiLRzXVQ44fisZxsQ5VrdpF1m/
	G7jpCMvZqzrtyZSaeUL2p4U0oxq36NGdn7KWYSu3hERcWNxmzSvFPve14rEODZo=
X-Gm-Gg: ASbGncuKm6WiRdS2hos7xyllzCcc9qc31xvE9NR1M85BteHm9ww6GsWjEmWmzHM0HwE
	/vLxIYdgnb2X+joOMZPY7Nrolv7t0H2X6GcGQSdVB6RVgiSfqTTZ5NaZQyhf+S752a5EUTjTyK6
	0N1xJst3X/3O4vN2q0YPcFW/jHDHl93y4V+wN5kEyjmrmhQep3U+KRMnRi1tk2cRmkG/eKVpOw8
	6wM/s2V/q7VCYxlGwRM2dmYQc0jYcNzFnBxrFjNM8alOLg8W/HSVG4W14bWihyMsgG2glWkuXeK
	GRCuHFLezcuhXXF020e9vjcYdLjpVzU+aA8Z+jUC1C1jwvx9OOdngtsPuA==
X-Google-Smtp-Source: AGHT+IEQndIp5eFpgd1dTDP4lH7gXczSBzoAyRnBiPmFPk1TMdz1z67MW7mzStpV92IOyZshhOAyYg==
X-Received: by 2002:a05:6000:1a87:b0:38e:48a6:280f with SMTP id ffacd0b85a97d-3997f9406bamr4947758f8f.9.1742820669984;
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b517csm11117180f8f.51.2025.03.24.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes from DTS example
Date: Mon, 24 Mar 2025 13:51:04 +0100
Message-ID: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055112_257639_1CB83A4E 
X-CRM114-Status: UNSURE (   9.41  )
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

Binding example should not contain other nodes, e.g. consumers of
pinctrl of, because this is completely redundant and adds unnecessary
bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      | 10 ----------
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  5 -----
 2 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index bccff08a5ba3..5f2808212f39 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -136,16 +136,6 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        syscfg_pctl_a: syscfg-pctl-a@10005000 {
-          compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
-          reg = <0 0x10005000 0 0x1000>;
-        };
-
-        syscfg_pctl_b: syscfg-pctl-b@1020c020 {
-          compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
-          reg = <0 0x1020C020 0 0x1000>;
-        };
-
         pinctrl@1c20800 {
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 3bbc00df5548..f4bab7a132d3 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -245,9 +245,4 @@ examples:
                 };
             };
         };
-
-        mmc0 {
-           pinctrl-0 = <&mmc0_pins_default>;
-           pinctrl-names = "default";
-        };
     };
-- 
2.43.0


