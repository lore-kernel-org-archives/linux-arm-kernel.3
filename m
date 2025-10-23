Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DFCCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yY00MRaGZJKQVqmTEqvL4/4Frt/VqsFNgh9CjLnUkm0=; b=wHrdchtVarfi38
	fn45eZT6i5VZttvy+fbxUFTRyGUgAdy0Vg1PlfbSYSM6G2nCngzP/Uz2BhdYc3cp/yYGdkAym6J/8
	fcUKdWICu0ySUYKhyr7rgcMSQI0IlKPI797TOQQMyrOV0wlSM4OEvlXloVW6JX9AiDCkL25EtyePv
	/TaCcWG7cyvIFl7b/NkuKD+pppcivwZVuQsKgPOglSdMkeO93K/n1vU9Ra/quewZ3bZ0RMeslfl3e
	BtzFmzfEr13nK6nuQo+6MgJ2SuMMXmm8v5Zk1k35TEmUD8Wgesg0UIJDYNWGKhuHnDWkvAEpyTGbD
	eiAgxuLBAj0DKmZzuaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1KV-00000007PVl-161l;
	Thu, 23 Oct 2025 19:50:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1KS-00000007PUb-040V;
	Thu, 23 Oct 2025 19:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ho87PT3dCkvouPFOWzH7THguM+jZR1FMkLFJkno6XwXP3pukEl/ZXpJzpMwh3hEOr2V5gBZdNlpGjTU5/EOk05fsyXqnzTsJ/UIO2SnD8xQ6vutp0FdHCiUmpeD/Wkx0GfQI5lkJ/+qxU8gI4SZ5UDPL2+CjISH545EPQmN5fkc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249014; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yY00MRaGZJKQVqmTEqvL4/4Frt/VqsFNgh9CjLnUkm0=; 
	b=KqcIGg5CwaXsSyl1bHxTQ4eRDXJJF/+hnDAKOp5DBUycTor9AYjJSW3PQnbx3ctm+Qc9ijWkvX938hYPH4v54dTVdEvJg9r9dUxlwiN6lR+O8tXQ5LOZypG9vq1vSENKgK1Pz8kqNNtgWometnds1PwjHHNqE3QS9QkDC0GBxcs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249014;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=yY00MRaGZJKQVqmTEqvL4/4Frt/VqsFNgh9CjLnUkm0=;
	b=aoKIIAIlhmSiUXEFb1gMK6i8Ip+292MyRBivKosdtoE/4Zrp4jFmzCVomkenbnzi
	Ow7nsJzBKOrz3CJa4rwZgct2JbA5mLNfXGzgaWXX5MZCgrR5a9azK1fmsBGKbCsCidf
	4R+yqVpSegsKD3eJ2mzylW0zvVcAjnv19/y4uz6A=
Received: by mx.zohomail.com with SMTPS id 1761249012363518.5992664462382;
	Thu, 23 Oct 2025 12:50:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 00/24] MediaTek UFS Cleanup and MT8196 Enablement
Date: Thu, 23 Oct 2025 21:49:18 +0200
Message-Id: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6G+mgC/23OTQ7CIBCG4as0rMUU6P/KexgXMJ1aElsUaFPT9
 O4i3ahx+ZE877ASh1ajI02yEouzdtqMYYhDQqCX4xWpbsMmPOU5S1lGB1+xuqBT5yggZKqWdYm
 5IAHcLXZ6ibHzZd8WH1No+v2RKOmQghkG7ZtkxMXTvcsFeYNeO2/sM35mZlH8uzszmlJW5y2gq
 oSC6gTmdpPKWHkM8Zia+ScvvjgPHEQpKpFBhqX85du2vQADStefGAEAAA==
X-Change-ID: 20251014-mt8196-ufs-cec4b9a97e53
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_125032_110246_80BC3854 
X-CRM114-Status: GOOD (  17.63  )
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

In this series, the existing MediaTek UFS binding is expanded and
completed to correctly describe not just the existing compatibles, but
also to introduce a new compatible in the from of the MT8196 SoC.

The resets, which until now were completely absent from both the UFS
host controller binding and the UFS PHY binding, are introduced to both.
This also means the driver's undocumented and, in mainline, unused reset
logic is reworked. In particular, the PHY reset is no longer a reset of
the host controller node, but of the PHY node.

This means the host controller can reset the PHY through the common PHY
framework.

The resets remain optional.

Additionally, a massive number of driver cleanups are introduced. These
were prompted by me inspecting the driver more closely as I was
adjusting it to correspond to the binding.

The driver still implements vendor properties that are undocumented in
the binding. I did not touch most of those, as I neither want to
convince the bindings maintainers that they are needed without knowing
precisely what they're for, nor do I want to argue with the driver
authors when removing them.

Due to the "Marie Kondo with a chainsaw" nature of the driver cleanup
patches, I humbly request that reviewers do not comment on displeasing
code they see in the context portion of a patch before they've read the
whole patch series, as that displeasing code may in fact be reworked in
a subsequent patch of this series. Please keep comments focused on the
changed lines of the diff; I know there's more that can be done, but it
doesn't necessarily need to be part of this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v3:
- Split mediatek,ufs bindings change into two patches, one for
  completing the existing binding, one for the MT8196
- Add over a dozen driver cleanup patches
- Add explicit support for the MT8196 compatible to the driver
- Note: next-20251023, on which I based this, currently has a broken
  build due to an unrelated OPP core change that was merged with no
  build testing. I can't use next-20251022 either, as that lacks the
  recent mediatek UFS changes. It is what it is.
- Link to v2: https://lore.kernel.org/r/20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com

Changes in v2:
- Reorder define in mtk_sip_svc.h
- Use bulk reset APIs in UFS host driver
- Link to v1: https://lore.kernel.org/r/20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com

---
Nicolas Frattaroli (24):
      dt-bindings: phy: Add mediatek,mt8196-ufsphy variant
      dt-bindings: ufs: mediatek,ufs: Complete the binding
      dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
      scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to mtk_sip_svc.h
      phy: mediatek: ufs: Add support for resets
      scsi: ufs: mediatek: Rework resets
      scsi: ufs: mediatek: Rework 0.9V regulator
      scsi: ufs: mediatek: Rework init function
      scsi: ufs: mediatek: Rework the crypt-boost stuff
      scsi: ufs: mediatek: Rework probe function
      scsi: ufs: mediatek: Remove vendor kernel quirks cruft
      scsi: ufs: mediatek: Use the common PHY framework
      scsi: ufs: mediatek: Switch to newer PM ops helpers
      scsi: ufs: mediatek: Remove mediatek,ufs-broken-rtc property
      scsi: ufs: mediatek: Rework _ufs_mtk_clk_scale error paths
      scsi: ufs: mediatek: Add vendor prefix to clk-scale-up-vcore-min
      scsi: ufs: mediatek: Clean up logging prints
      scsi: ufs: mediatek: Rework ufs_mtk_wait_idle_state
      scsi: ufs: mediatek: Don't acquire dvfsrc-vcore twice
      scsi: ufs: mediatek: Rework hardware version reading
      scsi: ufs: mediatek: Back up idle timer in per-instance struct
      scsi: ufs: mediatek: Make scale_us in setup_clk_gating const
      scsi: ufs: mediatek: Remove ret local from link_startup_notify
      scsi: ufs: mediatek: Add MT8196 compatible, update copyright

 .../devicetree/bindings/phy/mediatek,ufs-phy.yaml  |  16 +
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 196 ++++-
 drivers/phy/mediatek/phy-mtk-ufs.c                 |  71 ++
 drivers/ufs/host/ufs-mediatek-sip.h                |   9 -
 drivers/ufs/host/ufs-mediatek.c                    | 935 +++++++++------------
 drivers/ufs/host/ufs-mediatek.h                    |  17 +-
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 7 files changed, 650 insertions(+), 597 deletions(-)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20251014-mt8196-ufs-cec4b9a97e53

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


