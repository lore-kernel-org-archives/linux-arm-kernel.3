Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3952DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=; b=ravFywZgXTZEV94IL1zZuxX0Uj
	G9O4sSAMW5K5AF1vELcdCtar5I69W1WdJ9F0Im3jng1y4dbsw4b0lLjUoanVWn2nRY32urvWvic/t
	JdWiXmgZZ7giCOD2YYkx8C1phxNJH+Bh7f59yBKVNzgRoRh0AeOUO1LewRJWPss+QZgeR5lv6wxVW
	Lv+usgRUU5kNeJnYHB20OtZlXGatmZhwtzj3t/+xuPugtfV2GVUkrhf+y+EzltZ3bJtpRPA83Ioqc
	mItioXpcEAP5SNwt44QE89qZXLwZ1xp2EY8JKfOd+qVWzn1ms5WEb1DIg96Q3mvz+V6+m3khbq9rI
	Ek/rIizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRI-00000007oyH-3pc4;
	Fri, 15 May 2026 09:02:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRB-00000007opC-02zw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:30 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-369576666d5so249202a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835748; x=1779440548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=d85x2wnd2+w1uW9roM+P8EuRDpWiSFCI1gkqegiyyyziB6rjqEEXbw27ltr5haaHbb
         IHGiHtYm/o1rR8a2SCvbpt4mAkEj9DoGGDykAxIJEEzKSmd178kiX+Rjb2ocyGuuvfiF
         XLjEcuGfJAgH+EsrIVO9JPbsDk13180Q+CfA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835748; x=1779440548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmC0iPkEpdT0NyKzeBxGsIEHmhfQRvHGa186Cj4Bsl0=;
        b=AP521tXJFCE5oAtFb5lHUDNJWVWtXvMI48gSwRuSGN8HfeqtkPfyAFvjg9WlS+D5zV
         KxsC73hHEBQQPYYFZ4Euoxw0tdoPGzsI4O24Q6wOA0W1EthJSOxEpJuV9mslfmJ1F2+N
         /ts3c4mLzAN0eA4aXtunRnpvAW+pTPIfYYUsaaCXTOVOE3316w8dA8wrGzZs3XUi1cqa
         VH7ETbPTdrk8F3jz3gXTvJP/fxdSIFhADSqBoyF5gqQKOlYDtETrocY28C6jHULfzc4H
         EqBFxBxvRI/q2A8FlbH9mJV0Dn4uK5zS+UlKF4viuV+70H9S75BpnqfTnFM1KfD6tYdA
         xuSg==
X-Forwarded-Encrypted: i=1; AFNElJ/TwOcRvsVpONUECtWW0JNamjKM/zqDTpLMsTntQw52Zf2fZLTaHc2QjIG28jkOlFhCxA817cqhqdlD2u5wUvaM@lists.infradead.org
X-Gm-Message-State: AOJu0YzH06STWzMe6U5Q4xl1JVWWMkO6XDGgPx/sTakPA5zan1w4mUMp
	O7nX/F4naQzMAWkPE8NqgqVZQECTXRZJmtm/Vgvm2pVyRbJaDCqYQh2WXN0CwumlAGndtopkgNk
	m8Gk=
X-Gm-Gg: Acq92OGGkSMLFOzuxnfvs4mPPSVFFB/uq9FT4qctZlyfyav8H2yML2quYrSxHIJUIz9
	vi5Wp/vrnLek7sY9/90xd1v9KHfIqC8WRlQcJXdYywzPKva2bitX8IzRJ0UTFq/nDL3KHiIZ0qK
	Ye6KNKt74AKhUX9i2Opy2b3MDsghdK/vGFZrmHIpUBsZtUz6f8Su2HR6CMXqpPGK1+lrK72crk3
	ke2FuDC7Vpme/hOgp9E57KzouI1KWq8LAHYDmC9MAhQaS6jgF24pcRCV5lwjRF4McjsS50CVYrg
	RWBXVIGUY/0Gh0NSESWm2cxtiVvCOoDgFRSWH3LJfbmPPvycrUO1Od4oKBSYCzM33QVPEh+zfhs
	IwXUHhY/dEfFTQqrqXy7xgxeRMKCLUuIKO4ilN7QYp6Jxw2r69S66uQGYE0hO+ZHvldIT8xQOGd
	86doLRc/jLm/HbF8lWnRddM5juTKClRetRA3N37L179MHvPy8KyJ2GohZgUl0PHfpcxL6e/TGG/
	MytlkLMRQPgXvNU5a0=
X-Received: by 2002:a17:90b:1c82:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36951c9fad8mr3137430a91.20.1778835748348;
        Fri, 15 May 2026 02:02:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 06/12] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Fri, 15 May 2026 17:01:42 +0800
Message-ID: <20260515090149.3169406-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020229_368291_F14BC4BC 
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
-- 
2.54.0.563.g4f69b47b94-goog


