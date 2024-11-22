Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BD6D75E21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=; b=EanVf8cabR1A69zPPZ8Fdt44UQ
	KnJNLjin++ERix25QUpvRKh2uz4wtuJjwNCDaaI9OwSjJXdmvzgqWpXfkR9Zvfm47CT3B/68r33R9
	0qV7JGQTF115J6Hh3rPFbPm3YxBgAonbpnqcjMV5HPbOiHI+q9/N1t60Y2MpmKkdVlDlvW6zyNg35
	dAsBXKwTHCAn+Zw28QLGLqTrcoZjPDJuqvv29pMG6KqCOqi9lnsZA/zy60MkIDc158YyCatIkCHQO
	pLOc/BQGxO2C7wE+ERyiNflcAB2fGLkDWkUJGcH6Is8rlRXYh1wAHB+nRfIz/dzDNQq+AlUdtfsCm
	AZa5yNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERGL-00000002HVp-2Hl0;
	Fri, 22 Nov 2024 10:51:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEREX-00000002HB6-2mlu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 10:49:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5cfabc686c8so2354378a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732272592; x=1732877392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=;
        b=E0zhwZWHlNjRVaxhTE8NVCYaQ1pmWoPEWLJZc1k1f7YEO4zrbANixcQnIv5T3IYIP0
         i5Q3UZIlOEBwJhGDC4Y5Tgb+0VMSWRdNqNW5aGdWDvLB+77nOsyV6nJrV4a//CJv2VYM
         SxWf5Bh+JxaIIbb3BCyLvhPpDTfj8jw0rOuDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272592; x=1732877392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrinVQn1Cbi8/ijEcpv1A5N1VQp4jJYPom9JnVjcWsM=;
        b=hoGCC1zB3OxKY6geUroH4wfUJLwXHDPdpS/zE4pcKv5MH4MeIoP+AEzwaaswqV91qF
         c8R9Uv+iVKPSG2jpy6cbNtCDqC9VfXDK8j486kFSeKezIfcsePYRHN4exA3q4IBUwVsQ
         y2AhClc9LmKu8GSAWjxf1/3rLrKQwJq7oHVIIUk0vozyxyErP+kjK66Sigbc0AjS+sa9
         xat85JJkFjXMVyaJYR50ew262EF7h0sswrsGLq+AG4ID3ZE2J71qXvrrERJnAcDadbYB
         DOt4Ipz+RxXN8PG+B3IRP7FErzOYxAhetgD1hSnDfTpvFaV5AD4EKSgmw4Nkv7F7pG92
         2+oA==
X-Forwarded-Encrypted: i=1; AJvYcCX/t7BGyqxp2Z0wBRCIEeJbJhHMxjM5inCyHHvgiJelPGZgXcFcjxXtWWTF06dTh5Mg8IuenkH/cDGQev8CPC9e@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8VlJx1lOO7sUEhQO0GwmX6ifd/IzvdNb3Jbtm15Vi5cf8Yi6Q
	M0Nnz9CjjrXw/VuqEREGnY/82PXSKltl3S9Bbo/tXxGxHKQ+HILG679PUoGnhA==
X-Gm-Gg: ASbGnct18themadRlQTFk2bVCiUlhY/QPlh4S+7MN6zg22fVzjbbkT46A2reoC/rrzT
	tsv2g6yvC8iPoa8KcyrP1WCctncKrA5oBpfwYiXqNEE9g9Vi/95JJHwmN6Vtkg50/8YkzJWG9j+
	nPYU6U4BVh8HyrVoisFbDlFgQFr/gG3jZzNijxl9X14Ru2iHz9IOLYgZo2iKyTC++dt8G+fSzlA
	1jeIYyp/U//+oBxfMRXTKxw7RLMu0LlY6YNowik8J4Jw288S/Bv/oh0GZou/IsndPLQV3L4eBBX
	anDqIQCm
X-Google-Smtp-Source: AGHT+IHZnZfKf7gehP3fB8C/hlSWOPVc1U3PpxHVeONSc0QcHH0SfvWm4T58Y60rMJ4GvxkG1gycAw==
X-Received: by 2002:a17:906:1daa:b0:aa5:73c:8d33 with SMTP id a640c23a62f3a-aa5099fc310mr200688966b.35.1732272592002;
        Fri, 22 Nov 2024 02:49:52 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa50b52fe87sm82614666b.117.2024.11.22.02.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:49:51 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v1 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Fri, 22 Nov 2024 10:49:37 +0000
Message-ID: <20241122104938.1437925-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241122104938.1437925-1-wmacek@chromium.org>
References: <20241122104938.1437925-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_024953_691799_DF4D9912 
X-CRM114-Status: GOOD (  10.01  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9..df38bcf7c1b61 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,14 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 Detachable)
+          - const: google,starmie-sku0
+          - const: google,starmie-sku1
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.371.ga323438b13-goog


