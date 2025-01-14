Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A31C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31yd2A2KrJRKEjfaLLciJjaOBpVAtnMtVG3HpORbCUU=; b=EvGD17Mk7GZJj2nD80ZRB6FDgg
	zohCkl45xwzBB85QwBY6Z4+eqpOPMYxBRxKY9xuZ5Q4kdjbPTv5s/y1zM9in08LOCs20x9OR2B+8y
	KwJRa628et2EUO7zJRWgDE9cNC0xUJyjmxgKk4fVF0O3VjHmouaGml/rX726MotMcttD4KzuD5TIx
	XeoiPgCNd0BsJy38HWt++z3uuf2//cvM6gMlyaWrHZVdBxUNAqwLjJqsxFG5eYeyIARgm5C6f8NPR
	0S2TQ+AUSaPtZWsjJkP2pmEMdE8zz0IVmb6FuhfF1zSVlYau8rPxKjjGFtWKMICNCZ9Gu2JNxx6Dv
	PlDtqCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXph3-00000009ycL-1SBY;
	Tue, 14 Jan 2025 22:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXofu-00000009q39-0GJD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 21:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=31yd2A2KrJRKEjfaLLciJjaOBpVAtnMtVG3HpORbCUU=; b=AOS1TS1ZGMOsMdswyOGFQ9BIOG
	vijfujAumlI2SgmiumOkmogB+sq8cfBmzRaDkLMixtd7dFruKxduj+sDSZ95ogqJKJGObyP0WLppG
	aS86RBTOI1Qj72d0p7M23vpqdyXX4sEF3G5smrPCgNkHe8kUAZIz1jPeGUHs9a6caN4Osy/3lF0Gg
	0+vUmEoThtxxEDPUOiLeIvuFb7r9kjZxrOopWEJKFK90OcSlFjQ69TLoaLaC+cxGxhkcHFV9vHSuY
	VbYdUvRAF/2+9NqYgsP6JkhBn6sKXX053PQJnZh2bi8DD//dI9KaTZ2uE2jRmxcETjoR9HkURja6k
	4jOkTpcQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXocs-0000000AeGu-2VI6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 21:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1E105A41CE3;
	Tue, 14 Jan 2025 21:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15302C4CEE4;
	Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736890739;
	bh=y7I3ysTNSviVxSY83s+mUanX/HzCwqOMU6EU00x1sxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EFLZhVaeJT6CDmekEYZuOeQdu0U6SclgGrQ+LrZp1Pd5+iNlq2pM2Hd3HOlDln8v/
	 KFRle1OMq40FGmOJl8doCss2A06D4Du+WY0Uk5D+/yi6n+/Q2dLEGONjRFfX2ij3f1
	 p7mZrZz8MVu0mi+uxfCTVx/3qAKyQFCJJAIrSONk2htTkmakQOVi7HjYN4dOUh90w0
	 kE4mupetrAfF5KVOvrMKUhMWu7Yy4jI4qV1F00l8lySWM2AeiZuHGx+MUyFUIPQRna
	 IcecO1m8wQ+UzWxU1Z5ZKQea1liZoVAfLdWwMVOoDm9Xs7TlobH72DRhfNvq53FhUK
	 kkLq51OgRjAtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E5C02183;
	Tue, 14 Jan 2025 21:38:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Tue, 14 Jan 2025 22:38:56 +0100
Subject: [PATCH v4 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-adpdrm-v4-5-e9b5260a39f1@gmail.com>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
In-Reply-To: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736890736; l=1377;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=KEf80SVHicxgRXKAdu52Cd2dNEz+kgXSg0wZwqOZ7j0=;
 b=tIjqWyPizwmuQ4MvM1PbsbAt5UwiHuHH2S/xckQkz+poI3Wc1LrropTswbyz0A+KoDSg0qqp3
 rsdSKCfGiq0BCan/6ZNOoqZuNhkkvYcx+c4DdO1OV0ee1JEVHHyD+mw
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_214040_030222_8ADA9A57 
X-CRM114-Status: UNSURE (   9.39  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261535dcb14a24a7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.48.0



