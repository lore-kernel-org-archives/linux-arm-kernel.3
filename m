Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D3BEC1106
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=; b=TbvXP7T6hCPRgYv1t4sANC1vwd
	OSOPMyC+fk3JoTq3Wtb3fY8jotbVRwvfTuT95vyeuYytftdErk7JJ++Fiz16uo9fthp/kcK2guVgW
	6tVTdaXbf7LQ/dElY66v0wFx7RUbtCrMMGGXzFNLJnZ2o1EjSNPaSAnyXnyBXVAbdpHgk3ESnb/e5
	1lOlPh8VXGjHLZDRgxPsTMq30KUsCQ0l/HXEvyVWJkiQnA1+4XfiX1WFlgYx1SIRX7XVcEmRuUqiZ
	1BQoycgZRr8To2dNUMgECgxPSBd0udnVqtg+IQceRu1wpfHrw2R+MV1fD9t7szmDBRtAFYZBCTQfO
	eH592Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYll-00000000ftp-0tbs;
	Mon, 23 Feb 2026 16:26:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlh-00000000fq6-2nUf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=; b=XdXCMfqZDbVcctFe54/jgbjBAF
	X3nMasA/oE1PyOmKZoZj0fFX8rGDng2/bTN9qsW+V8TGJXAdHY18l7jFSSsH/CHaYs0bomSUvwyov
	urEgOc5xfV66AA9Y4U5KbmqgG3U226GKbJP/5ZNJpyfpH/0Vf/Rne3NYBYXtvLfHNs2X9CRD3cmpI
	psntsQt+pvQLrtLIo38rm3dTF2panw2DbBOthbMP8OKUXeilmrWT25XsEIYakfPowdS+JlDUwqzGw
	UqeB0fo5vIOoMOoMexEfcBseuohjKsSTMnZw29bb7mzkbU8qdyhFEAjlADtHjDQ17wX5pxnMzQhj4
	cQn6v+sw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYle-00000005T8V-38Uk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3435905f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864001; x=1772468801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=;
        b=ihDIAxiOO9nI+uM9lyJcPG9SYKKB/7tM2eOjwgFP6pal6MzPi3ulYiBIqZ3m+lrJGh
         qAIZHa3qBDJgYC859wDtp8JKirBaXNojkRDBBVkkZGVn/uw8fKLaU0PnfCnJDDNCu6bF
         2a/cHB8k6RXIjncbKaCcexL3pPCnXY/erDuWKg3m8EdSM11zKmVgPJBfo4NST7Bbmx78
         7opDOdrm44JUeikJhlxK/YfrL+i1MIQrIvvIxRDH60rI9oX1kN5uP5zDJHpclk8QCvKS
         jj6yUK6cEXl9e/ziZ2+RIhxOaJ8WOCZVY42lWCcZ3nqxKdymCz1faFy2r1g4p8bSBj3q
         3aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864001; x=1772468801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qf/+YOrO2BrvqafNFjJO+GVFFHfE339w5tpogT6PGGo=;
        b=HyXauKRnPcIWsg+YBUIG+s3Vc/mCE5w3j7rbUwdXmG3aGNHM76PLO61ciDcjF4IEGW
         oWTV5FzPq7gqENgXUc7xvCSk9v4xi20KV4NjrwZobjVbTQ5IVtI3Qew8cEBlVsBQmDlI
         NBladhXN69gskOAepbyo3DhkhwZCL/asWOYQli5e5vod5jvQ9aw4lyDjo5C9XeYXjyjy
         gOg+DUEkBdN+3T8rqAPWu9UK49R92PTyUYDQf1t6EJjvQo6Rjl98yDXeXGKZ9AbQgr3K
         O7ZTXFzcE6Vj922/CzHuJVXES7r9ufdFblRmda70h3GhGZxrtb+i74RYD4UfLq98lieQ
         KsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXXO9AtEkrGpZWcpZmo14nDMF6UVks97jTRipRvEqN1nEcH58LfZyh3P8kyJCffSKjkXK6x0JNFEk/KQ7N7Zqx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqr4m8V3xu49W8/6CIhh2da9OwxY5YB+bmxPCL25Ln/AYsbpLQ
	jxSoPzt4CYBm0OC4NJllh1KBgSxin07KeP0GzI/zzI7ieDvY6o2djl6I
X-Gm-Gg: AZuq6aL/czfIQWJw0ezEiHkKSgptTihj7kfqRVOTry3RypyLav2dhXIW60ga8sy+ttX
	6UHpecqBQGDPZ9mhDzPxZWPK7A2YB+o4b5foLaTAA5mfAEvFc3xT256EqMY+HneXtd0Yb6P1q3y
	Uqd+SEHzm2922a84LfTMAgVmEp3ksm2bw03AQMdnQWhYQ39GO1obMfn+Okb/paawCCTwNAKgBN4
	UI6MRLjVXCIiP9mnO6gaKjvVT2pl+jFXBu65VB68GdV3elzhu/r2cPOjFYWcFcdHDGJdh1pib/l
	GQOeysgJufe+VgXpOiHUdjcJa3Fx4IlOaPu3gLZuHArqYM7qKmZaEte9K9tWJ/OHPnkdLZn+nqr
	VPcwqVSXLuOy7Mtsvb/lNXiLw1PSvHhPviJcyNxaxRxzn21kz7zwJE09GdvXb9eZwEwjEhZo1d8
	FlcDndc2n1HYibErGs5wc=
X-Received: by 2002:a05:600c:154b:b0:483:7ae2:1737 with SMTP id 5b1f17b1804b1-483a962e486mr129723295e9.17.1771864001041;
        Mon, 23 Feb 2026 08:26:41 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:40 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
Date: Mon, 23 Feb 2026 16:22:47 +0000
Message-ID: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162643_074624_82A12663 
X-CRM114-Status: GOOD (  10.75  )
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

Add support for the MediaTek mt8167 SoC: the DSI PHY found
in this chip is fully compatible with the one found in the mt2701 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index acdbce937b0a..c6d0bbdbe0e2 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt7623-mipi-tx
+              - mediatek,mt8167-mipi-tx
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
-- 
2.43.0


