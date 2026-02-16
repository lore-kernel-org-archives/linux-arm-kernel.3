Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D030E81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=; b=dhbSKRD/zbxbSqzat4BNK1LtiR
	Zph98O0x1RLZwUlPn0mHWI3BrghkruYz5vxKAAqtraPKRnXHSPf9p6l9XzIhpsQ/68/PKf5kjEHLp
	dCTo4Zb6DlgY+0Sb2hnE3aS+rUR27NoZHXZEaHFqQA1ZSbcnJyRe7s4Mw/6FpmhVeyXnyRgClMAGe
	N263FeK4sMxgILZfKIJgpGIv+VbcxGZX23NGHtnWbv53fB59XzQznzfvNZaolhqI9qCrlN5IfiNT3
	Arr57ubMdHJ3iUwSRGhWSA2UN83awGAgR8Acyyq8KFbn/hANzAL2KZXyduL4s0od+MvfsASx/d/1r
	StFFXKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PF-00000007107-3CGb;
	Mon, 16 Feb 2026 16:25:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PA-000000070sY-3JBc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:25:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43767807cf3so2506565f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259099; x=1771863899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
        b=OhIJGbCwnwz9AvhqZ01DESKOHI7Htwznf+TlHs1UNrlK+sK3/Af72t78olcpQ9jiT6
         P6byLHms66PxHCxwLHNAZzGfSOuskSBTY+sn4aj7ACDc6089AOpiBRjryYKwXkAOfvSH
         AhPD5qnEWIJKIkAd88EuYwzF+d+Dh0LdG7O6g51horushPDVo3rWeAcgVsRu/LGKexw9
         gwuguR4sg19GsSamg8CQG/cQz9A71U85IulXrOmLM0Znu9bbiZnDnpEIWhpvr8j5EMWv
         pXMC6GG6+2Yv4BUO0KRXDXlvozTX75VGAN1Jupo5u6eX/oxKSEy0bU3SXv9njh6/E1Hr
         WEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259099; x=1771863899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EP/NkuwHIXZWXD+wl8EaORZCaWZmz1qMdyG8O5pYtJ0=;
        b=l363Jvak/tVskWb9oJ4+VDYauWfOqtPzJ0ywBvKe5Os5WwVR7w32dg0TtDVwnuYeFg
         1DdI8qF0IwuVpVfXr/NuXkQGsmfc+mn55a/W7qwdV4gSq2BQ99MY1MbXLLQnyMvGlFIy
         Lj/0c6sLfEV9MniZvC7DW+MBWhOsqe0B6B3K4GqovZZbL0xRipq+dLWUE1wTydeUIbv5
         pS+KS5vo8YRTpY4MnPH4RIIQcfAAMhsGiS+ppJTyCby5KjZVKCM3Af1OM25jwJNJD2Pa
         r+1w49YrYwVIT1y6A1zDI6z1nNhdkIYy8On7gwyS9aKrgyNrOyG5h70GKjJceUw3uQYc
         XZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVecdmseAx5upCMTYj7ct9ovMGoo4GJD//jIevbAFDUgSw+AkZkQy8e0daFIOTB2CkGzws6tLiFMMJzUqJ3zkD0@lists.infradead.org
X-Gm-Message-State: AOJu0YzA+h0ICrZ4UMBfUY2EZXgsPeAEBFILAUDQ/RNlGWS0yEmWdmm/
	+E0Vdc3/NnNIUpqDePhctnAHgPxzg2KOwuNcQp7ksPmtYISDcIHXEkjF
X-Gm-Gg: AZuq6aLH7YLB5nSdxBkrNs2Dtkv3xGXF6LJJ2r4knkdySW1Vfo1A+JravpBTD4jp9F9
	B7SwUsojl+2KRnRPdk0btEXs6XeMh4r6TQRLrgU6tGPjgE7wMIsLSA2qgxM5wv0EVShAWZYoim7
	+DAZFBMNex2IW7OLxlKuWSy6wUqFo/fXnq7BZwQ8sgwfy+yZMctwMtXLn2TJM3/bY8BJSejahH7
	FVynRllnHuApzar44aXqx/ldQlHJSn9gRWshNxOukEzDNcrlfKd07DjRfPFPf/iyHMZQx1NYEn2
	8wLK9FEya2UzO9LCEYxn7MlvI94vySVNNRpKxCPGeXb/gk/A+hqCRn/ZQOdFuVirHPkhUDISofa
	wQX5T/CSlvfuGgwam76ag2bt2xGC0srbviDV7khT9BHVZYZsfssg78m4zGEd1xXqgUcK69m4cfi
	2T+g9C8bn2Py8Ys5f898l5EhWFWYJzFg==
X-Received: by 2002:a05:6000:4010:b0:436:1b1:6cbd with SMTP id ffacd0b85a97d-4379db25b60mr13014530f8f.6.1771259099036;
        Mon, 16 Feb 2026 08:24:59 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:58 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 4/6] dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
Date: Mon, 16 Feb 2026 16:22:15 +0000
Message-ID: <66fbd5dd3604ffc4fda45022c1db68e4e0be6714.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082500_844101_501C3D2A 
X-CRM114-Status: GOOD (  10.41  )
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


