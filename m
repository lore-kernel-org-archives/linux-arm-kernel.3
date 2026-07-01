Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771D0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ML6K8fvh5HehRwpusoeb1p/s8HNb8zIUF7ESiNL6LkU=; b=qtca+2AE/bVkFygpT2KORDPD5q
	mMHks4DA4OqfS63L3GK15FH/Dje9hQjvN06CRZwRrHDmofpmbpfmAC71Wyg5vGi5Zuuu42oEFd1IV
	dsv8FpwdRu+WggL90p05uj6Ef7zNytKAxwr86Ah2m1if8ap/RBhFB8IEQOkx6NTjfWFutVi3y2V6H
	gyYZWa1++YAuJc+JAmk+w+3tOFtI45okabigWptTQfow8Jws9nbYaMuwuRq5ijlshyo84RVPtaf8I
	UOFm7HEPEdQr1CxamUOKST365itnC6bv/HadRnkgD+ks/v3a/WyzCmPGIKiKza0fLVq4gGK7JDHdA
	2nVXHbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetub-00000001p0U-1M2T;
	Wed, 01 Jul 2026 12:19:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuY-00000001oxe-2BuN;
	Wed, 01 Jul 2026 12:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908363;
	bh=RIGHToQ86+80dzU39WU9it8zdhmzP6nEWWQjnFhwEXU=;
	h=From:To:Cc:Subject:Date:From;
	b=SLOOeJbwtD22khwDQNSCEIXb2djNF8mPJ225Fxb0j2ZXY8SEJJO92p6+bQqCzsezh
	 1/viTRmV6/yR+CyoDSt52XoWDvHOYZr8XHE7I94fBo7wgN2yDTmTfWR3F4yMQD3GTe
	 rvo6g34jnhqocWbpq3W6Hewb3+WqdR8T+h4Gr3TN2Z/Ir8GoDfbal9lje7Njw3qwLa
	 qlYluFXthnKidoLpxu8zkA6+RwRGlY2+UBrwqUuLXwFEtPZcD7ZvLXGW2asJq3NIWr
	 R6VnCG6CrzclJa7IcoPwYk7k2hMrgPK4QypVgO3RazmTPYujnGKmvHvYiiW2VWj1kH
	 WOA1ZujbOgcbg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 257A017E0909;
	Wed,  1 Jul 2026 14:19:23 +0200 (CEST)
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
Subject: [PATCH 0/4] pmdomains: Fixes and add support for HFRP Direct
Date: Wed,  1 Jul 2026 14:19:16 +0200
Message-ID: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051926_717886_ED824062 
X-CRM114-Status: GOOD (  10.83  )
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

AngeloGioacchino Del Regno (4):
  dt-bindings: power: mediatek: Add support for MT8196 direct HFRP
  pmdomain: mediatek: Respect PD relationships during error cleanup
  pmdomain: mediatek: Add support for Direct CTL simple power sequence
  pmdomain: mediatek: Add support for MT8196 HFRP DirectCTL domains

 .../power/mediatek,power-controller.yaml      |   1 +
 drivers/pmdomain/mediatek/mt8196-pm-domains.h |  27 ++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 134 ++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |   1 +
 .../dt-bindings/power/mediatek,mt8196-power.h |   4 +
 5 files changed, 141 insertions(+), 26 deletions(-)

-- 
2.54.0


