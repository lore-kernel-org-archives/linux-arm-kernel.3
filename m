Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D292BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOba3rwldqT4ekrWrmJJM/1PQTTHrfeL6/EAdwWXgg0=; b=JcaOH0C/oKpiYLfj7Ct4lOl1xd
	U/ReMbbN5UNVmt7/E4VFRVOJcol0ixGnaUWw3y+22UlLzHjIO5somt+OQ0FLKHskRNFkes7sWzPN9
	ypD4hLdXOIiqfAA7Wos2jf28kZInipYY4xJ3iVkJX9fjbGnjy0UZA4F/lRIv32iu68I4PnI1OgS92
	KfocgBR4tU4QbDxOMc4igo9q/IwXoeNpPMx9Vyr7qbyCilcHzdau6SQGUbBzHpmcPrdU/5UFwsDKJ
	c0ee0pbUnS5sx0HtDslXXLdqznFuqp6216xPDfinIclqr/TVaRwOS2VP6PZWVWb2tQlBKYmkGfmFv
	/Uta6vuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4F4-00000000PTo-1CnY;
	Thu, 20 Feb 2025 10:57:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl4DZ-00000000P20-1Y87;
	Thu, 20 Feb 2025 10:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740048943;
	bh=Fe1NU5MSplDv5eB2zljQeoAX6aX1MK7BwDK75afdqts=;
	h=From:To:Cc:Subject:Date:From;
	b=RVTbQNmYR35edytVQKzTBRi1sUJrKyaEktH+KwNhGZ+AK4KZlu6hY+BQbxbGivrzm
	 xvw6OpD9jjSBlvANTwspWE1cOEKRkyV+1JLwjhVUAzC/kqQ2OtVjgkYHjdxaQDOvVC
	 3THwTjqaIWerXQmtWVf4B0h6ozPF8zIF+zR/4scZ4Om6STX9DCo6a00Gw7woAk4GdG
	 G2oSe+9Z/e+VAIkZ1gZLZuAhdQnGomYI6gZ6PAkel12n2ld2DCz9kyiHoOrTib9utD
	 b9wyGz0zAF2FMwgxijai0uZUCIXac5lRQfzyxejMnpLGQmvTlG/G6qYoBfHKZ6EAIc
	 NguSqriMxKbDw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7D0517E0CD1;
	Thu, 20 Feb 2025 11:55:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v3 0/3] MediaTek MT8188 MTU3 USB and Genio 510/700 TypeC
Date: Thu, 20 Feb 2025 11:55:11 +0100
Message-ID: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_025545_580008_888CD003 
X-CRM114-Status: UNSURE (   7.53  )
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

This series adds MTU3 nodes to the MT8188 base devicetree, fixes the
Geralt Chromebooks to use it, and adds support for all of the USB
ports, including TypeC Power Delivery, Alternate Modes, etc, found
on the MediaTek Genio 510 and Genio 700 Evaluation Kits.

This also adds the missing SuperSpeed port to the mtk-xhci binding.

AngeloGioacchino Del Regno (3):
  dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
  arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe
    USB
  arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX

 .../bindings/usb/mediatek,mtk-xhci.yaml       |   4 +
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 +++++++++-----
 .../dts/mediatek/mt8390-genio-common.dtsi     | 151 +++++++++++++++++-
 4 files changed, 251 insertions(+), 43 deletions(-)

-- 
2.48.1


