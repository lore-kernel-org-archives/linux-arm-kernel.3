Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3DDC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IuXk1SrFGJMTtnEAnwibUqheBYpfG8XrfKmWbN3cUM=; b=tdr10LdvZuin3U
	BaYOTdOj68YqBib9C1ECRRUkvM0tRPNBt6L7gpUShrLacRcBVSzWvPCo5IskFPtC2gWHn5PJ4l1Qh
	NqqDuVhwSMkfkysRfrsw8XTZzl086Ecn92o9O57v4AfxkaDkJzf7EA673z0hs3w1uViK+GGQxJnDF
	qA97xvJJzaPYUoeCwZ+xSULz3fIUgaynmjzycz6TpVbHaezcY5ZfNRiRJbXcUoAI6EDS+HAySD8pE
	dW/Gzfr4kguGwwrsM4lefQVXoW+/Pv3raNFQcPWUfSxD+ja7L89FypW55gJVagCMiAGgbpK+vGwFT
	g6Se6y6K4xnZ9m57BlTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvqs-00000007Uhh-47Fg;
	Mon, 05 May 2025 13:27:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvnW-00000007U1e-0mhm;
	Mon, 05 May 2025 13:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746451432;
	bh=QbkkmaHyuZnAj+y3SRqnQ7lx5DMjnVPYMxS1NGgHdQs=;
	h=From:Subject:Date:To:Cc:From;
	b=LKvNofMEwOWJfNjV8DSgo3WC7lqIRzc+emoZdyzefyZvjBPQs7q8EfbnQ4xsS26tY
	 rfYPeEMTYjDyV786Bfgmp4DoPpoutZP73w1DaZHxMQUNf8awO7oz4Q4N2ytYm3qLme
	 7ezsdHGfYjuC+/xD83kH38J4JJhtNCiyqgMeeXWbjnWyoIQVNqbkxwMSS9IUvySuL3
	 J49viIy3cBJEvpa5HE91d5dFVqronQyeBGDSt9sCfQ92R974VUQOzD7/LTMmFP1fuj
	 uGjlohK3cM6h5aEX+yiJVEyfzFu8DnGaCb6l9G5bNTbXe0ghvfsiAXK13j/xiDP1bG
	 WP9aKbXs3HKqA==
Received: from apertis-1.home (2a01cb0892F2D600C8f85CF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CCDF17E02BE;
	Mon,  5 May 2025 15:23:51 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/4] mt8395/mt6359: Fix several dtb-check errors
Date: Mon, 05 May 2025 15:23:36 +0200
Message-Id: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANi7GGgC/x2MuwqAMAwAf0UyG2hrxeqviIOPVDPYSioiiP9uk
 ZtuuHsgkTAl6IoHhC5OHEMWXRYwb2NYCXnJDkaZWmVwP13V1ricE5JIlITK2cb7WRtvLeTuEPJ
 8/89+eN8PmWY0omMAAAA=
X-Change-ID: 20250505-mt8395-dtb-errors-0847ffc12f44
To: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_062354_390957_89512433 
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

Hi,
This patch series addresses several dtb-check errors reported for the mt8395-genio-1200-evk.dtb and mt8395-radxa-nio-12l.dtb device trees.

The fixes include:
- Adding the missing #sound-dai-cells property in the mt6397 binding.
- Allowing up to 5 interrupts in the MediaTek IOMMU binding to support MT8395 properly.
- Defining the required compatible property in the regulators node of the mt6359.dtsi.
- Renaming the rtc node to match expected schema naming.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (4):
      dt-bindings: mfd: mediatek: mt6397: Add #sound-dai-cells property
      dt-bindings: iommu: mediatek: mt8195 Accept up to 5 interrupts
      arm64: dts: mt6359: Add missing 'compatible' property to regulators node
      arm64: dts: mt6359: Rename RTC node to match binding expectations

 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 3 ++-
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml  | 3 +++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                    | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
change-id: 20250505-mt8395-dtb-errors-0847ffc12f44

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


