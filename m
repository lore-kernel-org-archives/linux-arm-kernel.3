Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30DEC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5IbHzR5ydv3vnzXXjrmjsbZQwgR25xql/9zuXqEIz04=; b=TTZQuhlq36MRsCHdFHunH44RbV
	5Ph0j5MMRTUG7obh5uabqZxhc72p5GpWStAxZvswIzc9H/ZO/7GAHPpmvvRmpqdJ6+bgnxJhMGrBA
	navCUTUlkEUaKtBYEVBRoYqip/8/h9ES9R+4CbJMMP16JNQkNVeHQl6RksxI7Xq+7rfFWWizTVoLP
	dwdOAmSJOmjOEOaAr3Gi0O4m8oO2eBSpJqsvf7rl1lw6qYcr8Umw+aZO/EnjBTHUMgckJx7q/TDPC
	K0w/+xzaaK2TmVcD40iLrobwnrU6+mlND6qFA+0Crw1Uxu3LG4dyjzupt8yu4/XFhwMtF7VWjHcgQ
	krjzynUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkP8-00000001Tue-08sO;
	Thu, 09 Jul 2026 08:46:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkP4-00000001TsZ-25R8;
	Thu, 09 Jul 2026 08:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783586800;
	bh=5cG0A2p0dlO1yjnfX1PXqAS5ejqeFnCrhtr+/kbgOJY=;
	h=From:To:Cc:Subject:Date:From;
	b=IzqBCxq0cEnlJD/CkMZb3Selaz3Cn4HEItsk9rO9IdOeRn/HEdOnzcU+0zNrwmxI9
	 2NFRvh4LOtEF8kYUkOus/py1+me5WVNfM2v40zT6q1RnjCzyH4ytPUDa9+LvDq6vMe
	 Z7uWmrkUlINDUHGmwdpqXAqyyZyrV+c53m44+Ljb3U2aVTSIfMeryXRBMldToz6UVi
	 YOaED1nqNy98OBwlKD4Z8xQ82u6oRWzXpoOszo1eeYuz6ce0jHdZvEJNejn0Xblkjx
	 3gDU2W0VypwzoHRn0X4xXOGeOU7oqpg8Ny6sHSgvr6Ha10umIV2vRVwC7ZDXFSunc1
	 2z1EE7hAYVjxQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85A4F17E0886;
	Thu, 09 Jul 2026 10:46:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	irving-ch.lin@mediatek.com,
	macpaul.lin@mediatek.com,
	aford173@gmail.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	justin.yeh@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v3 0/5] pmdomains: Fixes and add support for HFRP Direct
Date: Thu,  9 Jul 2026 10:46:30 +0200
Message-ID: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_014642_695016_69D1B062 
X-CRM114-Status: GOOD (  11.20  )
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
 - Added new Fixes commit for possible null pointer kp during cleanup
   of internal on-check
 - Added proper error state cleanup support for SIMPLE_PWRSEQ domains

Changes in v2:
 - Fixed return value checking in power off path

This series adds support for the DirectCTL HFRPSYS power domains found
on the MT8196 SoC (the ones without HW Voter support) and also adds a
fix to respect the power domain relationships during error cleanup,
which avoids HW lockups in case probe deferrals in the specific case
of "almost fully probed" power domains (where most of them probed and
got set up but a probe deferral happened almost at the end), behavior
seen on the MT8189 SoC during bringup (but honestly I have no idea how
are the current ones working fine without this fix...!).

This was tested on MT8173, MT8186, MT8188, MT8189, MT8192, MT8195 and
also on MT8196, over months of development, both manually and over CI,
with no regressions detected.


AngeloGioacchino Del Regno (5):
  dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
  pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
  pmdomain: mediatek: Respect PD relationships during error cleanup
  pmdomain: mediatek: Add support for Direct CTL simple power sequence
  pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

 .../power/mediatek,power-controller.yaml      |   1 +
 drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 +++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 184 ++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
 .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
 5 files changed, 184 insertions(+), 33 deletions(-)

-- 
2.54.0


