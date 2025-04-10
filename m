Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD27C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4HnlhsMvzNAiFa0PEJuidCPKsgInquCp44rfLdFRIKY=; b=hjepdh++Z4ClmKIdg0dlZZ1b7B
	5SJFlFgEM2KRGLkyL/BnqNbqfAFzpemcfxqITyfZdBRs9oJTPHbBDOHpdUj7f7c4LwSAU4yambdvL
	WRC6ItXW0iE8HijePfZC8cMql8fHnpRU24Py3HSIq5j9W6vDftYCp4RV+DlHvJh5NW1UUXCgOh/B3
	LiTrZrYsDkuk3dNaKFeGDYTureUYE4e2UvlyTye//qNARkcIATDArl9f4x8sVeAl7YGzlyMP1F0RT
	8Qz5r4bcXVwSSlUZkhnYNUvxIDwIARSa+8ro4NNQTRDfbrleo4bn0o2TCgepBD9trd90vSsPgdtV+
	aTnun+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tNT-0000000Aw4A-1fWw;
	Thu, 10 Apr 2025 14:59:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4q-0000000AsT5-2jO2;
	Thu, 10 Apr 2025 14:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296023;
	bh=zjLdve0wYngdIB6TlmLYleobJZB6mp1H4Ri9xgypsOU=;
	h=From:To:Cc:Subject:Date:From;
	b=RJY4WSI7XaFd+bkFE9JNc7FvrcJuPXSVOUP4dj9ot1AUdgW6NDiLEwrCsYe19Jdqg
	 bVbIfwWdFt8beUq0SPA93tVCtCLuF06iV0h2L+d0HZfMOL7d2PL5O4bxw8RbFfQLeL
	 KAjr28/qsBVi/u/L/PL2mLB3fUdhaOnqKtegN9IK5tReiJZZtXeDpvTzwUeaNTp1Fu
	 5AGDOuCZJJ6vGrgsak4/hyyfl6/Efx9ny/4XShI0vSqw2MAWRHEnrDUrFJg3brdwXQ
	 UGUOoZBonZ4Tt6ovFgvGkQ8dAB2IWD58TM23BIgCT50yzOE4ee02uGYXxVjBbKrul0
	 8PjMysNdnSwzQ==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 195E217E0CA7;
	Thu, 10 Apr 2025 16:40:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/5] MediaTek Dimensity 1200 - Add DVFSRC support
Date: Thu, 10 Apr 2025 16:40:14 +0200
Message-ID: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074024_832975_132190C2 
X-CRM114-Status: UNSURE (   9.95  )
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

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the DVFSRC regulators
and prepares the DVFSRC driver to also set bandwidth limits for the
DVFSRC EMI Interconnect found in the MediaTek Dimensity 1200 (MT6893)
SoC.

The interconnect driver wasn't touched at all because the intended
change here was to enable support for the DVFSRC regulators but, as
those anyway required new platform data, laying the groundwork for
the interconnect came natural and would've been unreasonable to just
skip that as it anyway consists in one small struct and nothing else.

AngeloGioacchino Del Regno (5):
  dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
  dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
  regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
  soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
  soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893

 .../mediatek,mt6873-dvfsrc-regulator.yaml     |  1 +
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  1 +
 drivers/regulator/mtk-dvfsrc-regulator.c      | 19 +++++++
 drivers/soc/mediatek/mtk-dvfsrc.c             | 53 +++++++++++++++++--
 4 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.49.0


