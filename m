Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3FCC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpRMy1ZVBsoG1dstlnJwPXUYPRKsH6HHD2nNnOP7LSc=; b=vQ3qQufUvcqxcMB83m58zHHHYv
	OKa5xseWrzfcLy3ujzPBh+ARnm8d4MI427S7WHvJcZmW2D0E7pOZ/AD50A05TcCElucig6NUOyHg6
	ySyyuffgKNCUVJXUDzRO5tN6XqV3oHvXC6u/Eu8beD+lkA6t9Pgpv2wNWUfWOk5Nxis1oRd/HEXGB
	GnY6ZhXg2grzviFm21JvMR6ArkBjjAGpYP9u/0wppKlPGa5rIImgs+aHLN6+ctiety8ncKmuyC3y3
	XaopjB9oSNaXY/6GDiVVTPVlgHJLUEBA+3Ksy3KCmE7kjgLNaJG7BNaRLAv+qnjW6LIUEtwKscSJ4
	O0fXOU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklI-00000001inO-0U7u;
	Thu, 09 Jul 2026 09:09:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklG-00000001il4-02RG;
	Thu, 09 Jul 2026 09:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588173;
	bh=c8jG8dKuHKzZNHv5reXxu0tytMV65aXZ7vtITaZALMU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZGXZP0+9ha1Cms0Ij3L+Ocz5rsL26qRbEQdewRYk+M5utd2LnhM04Dju/kDNiZvvI
	 zlJY/Juxs+xXvjW8sNT8CS3gQGttOqk52szKRwOYOg6bKuA0PsksrSTENFe9xPZiqK
	 dMZkWjlIU1Gq4zH+2yBuQjxwka3f/XzCoIYfw4t9S472vFml4x5bpWrIKDYsmD+/sW
	 zQz4neVhhwqeGCZjzNiJiY8qDnD2dQ1/xUFmYrZW7J2CQQOO2iJTJ1WwmwkS4mBrOg
	 Fmvan/lhSu3Q/81wYNBlSK9Yxz+xMYAzOH6NtnaX8cSxAAlZ/3WsWsix9A8wqequqc
	 ejDhhA3LEykpA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E65C17E0564;
	Thu, 09 Jul 2026 11:09:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v3 0/7] Add and use UART AP_DMA controller on MTK SoCs
Date: Thu,  9 Jul 2026 11:09:17 +0200
Message-ID: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020938_508393_B1CAFCEF 
X-CRM114-Status: UNSURE (   9.89  )
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

Changes in v3:
 - MT8173: Removed first DMA as it clashes with the I2C4 DMA
 - MT8186: Fixed IRQ levels
 - MT8195: Reordered apdma node (same as mt8188)

Changes in v2:
 - Fixed node ordering in mt8188
 - Fixed interrupts in mt8173
 - Fixed interrupt cells and fallback compatible in mt8186

First of all: not all of them will use this and that's sure - but the
devicetree describes hardware, and this hardware was not described on
any of the SoCs that support the UART AP_DMA controller.

Besides, there is also driver support for this controller for all SoCs!

Let's add support for this IP in all of the SoCs that have it.

AngeloGioacchino Del Regno (7):
  arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
  arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller

 arch/arm64/boot/dts/mediatek/mt6795.dtsi |  4 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 7 files changed, 154 insertions(+), 3 deletions(-)

-- 
2.54.0


