Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21033CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=; b=Qe/+AOsYxfNFrrRG/cQkSRSiqB
	WrYzc1CqbCdj7A2NDWg8lwTELxovcXiuW9v2EQ3Hxph02gSS8zC1WiEJV8O4ZaTM+jpX80sflOKp+
	Kvjz87BNruIib8+lP+CX3XcTjfhsptxDFpmRNlq2nGpjImyL0Gj0w4xEgvhMI78bjf3SsTK7LzgnJ
	J9A+aQgCzwfMIUs9GKyf3qPpfCmqNrRBhkQNg2p+2pXEOSfT3WNuJb5QQKPHHxyYXP3BiyBMPG5Zv
	N5PW2yOLWIlN5lM1oCnX89wRSQ3VvQwh86tMX++THfBZygZyfSxtpIOFRGhVArMPP/2JzGj+LK1Vz
	i065xCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59y-0000000BQsz-060c;
	Mon, 01 Jun 2026 16:06:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU59v-0000000BQr2-1Sr8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:06:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so1957489a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780329994; x=1780934794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=RUNzJ0lwaol0kpMjoh+0Yv2jUGD8SSFsH7AwGzAzngy2DOb9AQZgC+YwDQKVDndUWb
         Pt3SBBAuVukdOtYFwrPN2QWfP2oHfcnie0U2u9UYz0KxRvKKAhrrb4lr217AVJZX+mj/
         UkqwqRguctbBhcRM/Zpi0cgP2iSDrLqIdFcCiID75emxRGShLHxBlEYX4i4N/7MxGKJf
         crM3k+p/nOxpFPw9yyw7/XbIhrwld5nC53oohImdjVNjBQ1K7nk6khNTB1439xZ63Dt1
         Dr6ORS5enWS36eixOmh4+zyd1BPugextfYPShoWQoObZPFScs2/ANpy8VnVM/i+nsH25
         rZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329994; x=1780934794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=bdsd6qkNGJvyCUzO84DwgJ0JDD2Tu0Yh9CBbDzgnKtH1Q7dnLb3GvjwQ61WZ4zMafH
         Lpjnmhf7fS5ypWlXGAAARsm45Zc3NNWjQifbMg7kqnp0/2LXCFQ5Kpx9uj5uBaIRwDCs
         +iXxYFpIncqe1gcF9S8OyzYVOkIybl4hGNvAwNdrGLTrJysUBedyaKj4C3jfRjrCq1Qc
         eS5OrgddDvNOAXzA9nRKs++JMrUZUADxhCRhg66SCDz0/EDdrjQSu7XROWx7UQXVWiX+
         KEO1pFq8FGGbNPB5FXn/kxs/vhlbKggYOKtLbj3ClNuUWy7MOjDGwHzKBy/b79aU659v
         zhMw==
X-Forwarded-Encrypted: i=1; AFNElJ/cJWWVBVGudTfBe+YMLnd3afJIYFjfm1Rh0Y5eYa/iv6sSnk2E81VnaSU+dgEozZXGW171fle07OA+iP+BbsE5@lists.infradead.org
X-Gm-Message-State: AOJu0YxiWENs8pSm0NE2UJEqaswW9JxFAedK0veYad7flVOXsjvLzN6Y
	+JKhJDJlCAeOd6KIb5HMlAHF6g92j2dSp/hFj3UL9xHXX5gcgCoC/YAZ
X-Gm-Gg: Acq92OH3JmySCD/ArLWS6p0hLUniRzsXJy6Qx40gdP75mYgo3ViviSpu7F9L/TQbSbF
	uzMV1ZDVx8/oPaqB+ndm6Vp7qLrB61g+4lTDXGwnLYHD5FH2EDhANMONTH7aSKemab3c6YGnl4n
	bfavOqMOWR715Kb6zHYbGMo0wAI2yS/YNHpBBzlFyyNoeQ5KNASYfRnmsR3d7qRv3xrErQBazM5
	CFj8r1f3IXwuBWq3gqDFU8Rb4J98hphimFukHalAtQZusEEMNKZpMh6FgN4kLbi8vNoyD/H1pfd
	MNE/IGZB2lX67hVT1kmb62TjJ7N2Wa044t1CsXj0uBo4BMqxyRAdPhIIKVNa9xtohjepLOjfO19
	zrWkZB7b9oV8LG6B5TjJzDhQ0zymSBL3rg8gh5K7IOZCwHmjx+wIsvadKfkek896KgzQvjNSvqW
	DfokQJmq3r3M5v4CkBPK9LDEyfltqEqRIQLH6Y7i2e
X-Received: by 2002:a17:90b:3c92:b0:365:a5f6:4a5c with SMTP id 98e67ed59e1d1-36c4ff2c8c0mr10880173a91.1.1780329994484;
        Mon, 01 Jun 2026 09:06:34 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9205ddasm64218a91.14.2026.06.01.09.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:06:33 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v5 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 21:36:02 +0530
Message-ID: <20260601160603.167706-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601160603.167706-1-hrushirajg23@gmail.com>
References: <20260601160603.167706-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_090635_380556_D47EFD19 
X-CRM114-Status: UNSURE (   9.88  )
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

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3


