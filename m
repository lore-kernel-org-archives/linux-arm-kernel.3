Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A735D0C84F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=euFxQVDZlfrTAPvkYa897BEh7PvEJHuAdv5+jpKwrfY=; b=Bn/d7NS/TlMW1S1s4TRw4HROjx
	5ZXTdlwFyWWzWNP6G6rBmjrmSJUdAspZh1SmoGczr11a1RKiqBcjiPLVsBZ30K97SFX0cjh1eYm/d
	5NQoq524BdPvm42Rc1QE5tZ4H1NfwH+Nt5977yQWRZm/KM5AaONLt2btNsYkiK4x6lyh6XWk9K+hu
	vpk5aWBJQJnN+KdLzQCd/55Dbzc1Z24UDUOmZBCHz2PYAkxyKStywimIHOxBfCrSRwF10SrfMDLz1
	yzIeFFEMDGSgrwHMk9HciqKoh8o+uVuDt+9pSey0rm0dgUVqngjJBJzXaIzwUY78IwrNtnY/Gm2OD
	D5PhVyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8e-00000006xOs-08wy;
	Tue, 13 Jan 2026 11:00:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8H-00000006x3h-1rfJ;
	Tue, 13 Jan 2026 11:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302014;
	bh=zucZeLDjTuMkSGcuXiR7OU6C7Qz5H4JCwJizqZNqjEA=;
	h=From:To:Cc:Subject:Date:From;
	b=O+sTOvcXNxPfmpbEaUCfSIkpcIboG/hK/pHBnTLDnMjrCRYwhOzXk9JFBLAKTS/2n
	 od4OD8fnSwgWsSGuY8McAzh8OAVFMAdwSV/rx87RfWa+z776Jcf2ma+6+QvAKbvXrq
	 8vqhSL42zsr7LyzrjvT2WzkNOIhH1YUzplvZyLZMC8f29r7KALtwSkryrIkg310d7C
	 wEe/wc8sBlCwPkgh4KDjcoGBETY96EivwrVUuO1C3d9G672pU1FRbi9s5Z7pw4h/B0
	 lSc7BNLFEiqeUQ0GcYIT1JoT1Ui7CcLhuItFJVlLJyt3fLHRB93vH8xJi2wkZoPVoN
	 P5tbTz7gTHN5Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0786317E1523;
	Tue, 13 Jan 2026 12:00:13 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/5] Fix dtbs_check warnings for MediaTek MT7622 platform
Date: Tue, 13 Jan 2026 12:00:07 +0100
Message-ID: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030019_846746_4414F9F9 
X-CRM114-Status: UNSURE (   7.52  )
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

This series fixes various dtbs_check warnings happening on the MediaTek
MT7622 Home Router platforms devicetrees.

Depending on correctness, either the bindings or the devicetree was
changed as a dtbs_check warning fix.

AngeloGioacchino Del Regno (5):
  dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
  dt-bindings: power: mt7622-power: Add MT7622_POWER_DOMAIN_AUDIO
  pmdomain: mediatek: scpsys: Add MT7622 Audio power domain to legacy
    driver
  arm64: dts: mediatek: mt7622: Add missing clock to audio-controller
  arm64: dts: mediatek: mt7622: Add missing power domain to afe

 .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
 arch/arm64/boot/dts/mediatek/mt7622.dtsi               |  7 +++++--
 drivers/pmdomain/mediatek/mtk-scpsys.c                 | 10 ++++++++++
 include/dt-bindings/power/mt7622-power.h               |  1 +
 4 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.52.0


