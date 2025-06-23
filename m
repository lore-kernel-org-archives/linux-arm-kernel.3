Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696A4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/tooEH/UVxXiEu9MgF6HR3SC4IpSWLoHgm8CBeobAk=; b=NRn2Y+ha4M5jn7xC/FeCdWOgq3
	WlCdMrm39ygRvzw/TTPtkGAhUVEezVBWWTcKHiumCauB5WafYYlZyT/pYRXZ7KdpP7A5Grk2lcWSn
	e9ivSiD/RCzriNQc0pL8dThQk0YEEeUusv4Q5yWLV5ZeBP+XNpV4TxmfznxrzvcO1J18liyz8gblT
	7Wm3xJYv4PLl+gFjCeTMDuXKdVOROP20Zy7JZp9zGvnJicMZKp/EHJUTfjUyqaLMZ7+kGnp3tmFzm
	Lbz0Tn//kpawI1u+Uzx1WjC22oqqccoMXk82LQ785+O36IRknX5i+QhpyqzogtpukBMfyfu1QRxY5
	GBPlFQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiPt-000000036Ex-0uAn;
	Mon, 23 Jun 2025 14:45:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfry-00000002b7U-33fI;
	Mon, 23 Jun 2025 12:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680109;
	bh=YIGrVZxLhyBBB2bhjM5wCiH2IvtXz0uJ3k9n6G/Zu2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=orNKuMbywOTu4Ixkiys9qdBo5vnLhEA+GFbvOTmErNFIZ2sgUJbo9A3Vh72W+geLY
	 5DpUmXHfBkHsd8xC6KXFbaOMaI47V+Nf5T0NEGycg9WO+PFkn9nB9WWY6t7MygLsPf
	 F6gwMZKOr8LeYG5mTAnGsnDLLsk95dyHxPBlvAD2mjQAR2Z3JDSOYa9Ht6TxLSi6ol
	 iXc00Dspb3Lw0Epi3AFBAaD9JlppFe70Adkuzd2iO9W7IuW6Q+QhnhLxJn8qFp0nT+
	 dBmHw4r02aQIOStDUy2ngV1smbzUt37CQoxMCrNkVXLsTfhjs6EAdIhCq858s1elMA
	 kzPDNIx0wZnNg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B254217E090E;
	Mon, 23 Jun 2025 14:01:48 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/4] regulator: dvfsrc: Add support for MT8196 and MT6893
Date: Mon, 23 Jun 2025 14:01:40 +0200
Message-ID: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050150_911436_D0EBFBB0 
X-CRM114-Status: UNSURE (   6.54  )
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

This series adds support for the DVFSRC regulators found on the MediaTek
MT8196 Chromebook SoC and the (unrelated) MT6893 Dimensity 1200.

AngeloGioacchino Del Regno (4):
  dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
  regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
  dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
  regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC

 .../mediatek,mt6873-dvfsrc-regulator.yaml     |  2 +
 drivers/regulator/mtk-dvfsrc-regulator.c      | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.49.0


