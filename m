Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7FC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8tIdTH9dMMSliB11KIjEPUFUVYnlEAo6G29fIu7OGM=; b=WPD4eRSCtgiql0
	wsxjoxsTzhriexK+S8VVuZYc4VVEBPV35FbH6bSTKJIW6OngnUB+fnMMeSI9WBy5zmzzyi0JsHK4u
	mypM80RClKkoDsF8gnSodeQNpM5uvQYO96fXrpL6sjnnVNgJ+wIAbncRQzpVnxSeuqiAeIgX2K2Cj
	TFD0Os3KP+nR9ydxdbhncGeSIZN0vj5YN+dEyQWPWwqiLvBTksIrIeL5YPzvCRc2jih7/eCGlu52S
	eBA9opHEHZlRbGrD3Xbej/fpGEbDg8XQ2CECEv0ubdr91G3uObu8iIN6XoTRgvU9skz6TfxU+iqTu
	8z29uP47M+EvHlzgvXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8TF-0000000Eftw-2HEI;
	Wed, 14 May 2025 09:32:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7LU-0000000EThY-3Smc;
	Wed, 14 May 2025 08:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210807;
	bh=spSxSPnHfT8j3gFUgdV4jcQ82RfiWdTdZwOzzqjDKeg=;
	h=From:Subject:Date:To:Cc:From;
	b=dIl+o/2LJx476ANV8IrjeCCWD5gmWhkmXByNl1ZaXGX7iv5Ek7uHcWZBy08D3fOpS
	 8o8jaZl2salMFyvcV8kVpKLbWZE4T5M2eBGtbpNf9dWk1/CzsCrPUDhd+MrjkK513Q
	 0N1xfv7ijxE1sK0zwOEdXYLADl0ab4QoxrtsA8eCoZ1Bmn/gaSDb8WabAMqwEG9QPQ
	 xaTJ4zolos/hom6r3iDofYV8Z5wqXMXJ6rYBBbf9zwrgs6YJRhnHx8y8Ny5l1hwfoo
	 FH1xuk/4lFddpbkWO1AR5mebbzcXUsZ+b6UXOw+rvM7mQy/WCbtg8aApIL45HDa18K
	 OIsM0V1FNximQ==
Received: from apertis-1.home (2a01cb0892F2D600c8F85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4A1817E05F0;
	Wed, 14 May 2025 10:20:05 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/3] mt8395/mt6359: Fix several dtb-check errors
Date: Wed, 14 May 2025 10:19:55 +0200
Message-Id: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtSJGgC/32NTQqDMBSEryJv3VeSNKJ21XsUF/mtATXyEqRFc
 vemHqDM6huYbw5IjoJLcG8OILeHFOJaQVwaMJNaXw6DrQyCiZbV4JL729CizRodUaSErJed94Y
 LLyXU3UbOh/fpfI6Vp5BypM95sfNf+8+2c2Q4GNlxaU2Nfpg4z0pHUlcTFxhLKV9EHxKwtgAAA
 A==
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
X-CRM114-CacheID: sfid-20250514_012009_015182_DBDF99CD 
X-CRM114-Status: GOOD (  10.30  )
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
- Allowing 5 interrupts in the MediaTek IOMMU binding to support MT8395 properly.
- Renaming the rtc node to match expected schema naming.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:
- Patch 1/3: Add ref to dai-common as suggested by Krzysztof
- Patch 2/3: Only accept 5 interrupts for mt8195 infra IOMMU
- Patch 3/3: Add missing S-o-B
- I did not include the 'Reviewed-by' from Angelo and Nicolas since the 1/3 and
2/3 changed from v1
- Link to v1: https://lore.kernel.org/r/20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com

---
Julien Massot (3):
      dt-bindings: mfd: mediatek: mt6397: Add #sound-dai-cells property
      dt-bindings: iommu: mediatek: Support 5 IRQs on MT8195 infra IOMMU
      arm64: dts: mt6359: Rename RTC node to match binding expectations

 .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 18 +++++++++++++++++-
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml       |  6 ++++++
 arch/arm64/boot/dts/mediatek/mt6359.dtsi               |  2 +-
 3 files changed, 24 insertions(+), 2 deletions(-)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250505-mt8395-dtb-errors-0847ffc12f44

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


