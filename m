Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED5EC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcE4MP3DMzpQ02s3zmeid9c8qa5MwekrIFi5BEUqWKE=; b=z6IhJemHuEuykQqJ4l79PXsJzy
	rT6uaUSyzSiotDoxufbahW4PG4FATLN0vq0CS807U1pHCTFYmi+AjiKGnMOWYI/MeyA4mBi40w0/P
	mMvGq0MW+lQbYOb4jgtIW75wFpk92NJENnenzyhJRryWe/7vCfEXfMTpU6Q1UwaFayaeRjHlZfTvH
	S77Vx1yXmmCk9AhfsvpTxPIRTMDlWTAQLH/xgfe1nMhpxureW+ueTRKu46cXLAoFbO/pDRYYj8xKC
	vndNq+jAy4B21shvxGYzrlo4gahw7LdndpkFE9m5UyPamyEOYVEpLIpaxfwdTgrOYNVhTPtIQ/rAG
	IaU7bDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKUU-0000000HAFi-1d8N;
	Thu, 16 Jul 2026 11:42:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKUQ-0000000HAED-0yfB;
	Thu, 16 Jul 2026 11:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784202170;
	bh=mDnKGAlL+LyE5R2P+uLw2Xcb/nVKH7esWgNaCjxqEXE=;
	h=From:To:Cc:Subject:Date:From;
	b=H5luRTYKA8DwTVT/KRQElee5w8BfA74MIde6ben8ccwdFKeqAuzIkjhsu6yILAFI7
	 lInog16e69UDbCH1+uzEUBq2ujGgZF3REytxZwsvYFNbLP2bEoIFN9ZS6Uc3NY86Xj
	 6wzD11eUVHrlHgUKyyhmNMTg+mi6/uWkOOIf2bwkxpYF6LKW439pHQiznRFlhyccYK
	 J7rwET4l+FZoMhEpGZcd8jcxzaRZgoYDRbgPqz13YdAIUnfGDhWJGIKxItOsktrWgZ
	 quM/qj383iDR3/aKyv/gz6n2Ynb5yuAauOl3WxN75/cCuG8iLDbVnvXZ549KS11wPE
	 SHJlGJjQXT92Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAE7817E019E;
	Thu, 16 Jul 2026 13:42:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ulfh@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	irving-ch.lin@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] pmdomains: mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE
Date: Thu, 16 Jul 2026 13:42:47 +0200
Message-ID: <20260716114247.49685-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_044254_468404_8D71B5F9 
X-CRM114-Status: GOOD (  11.08  )
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

For the PCIE_PHY (also called PEXTP_PHY) type of RTFF hardware,
there is special handling setting CLK_DIS before performing the
NRESTORE sequence for resetting the RTFF and start sequencing
from a clean state.

That special handling, though, poses an issue in case the machine
specific bootchain (bootloader in particular) ends up booting the
kernel with both PCIe MAC and PHY enabled (not just power domains)
as doing so will partially corrupt the PCIe MAC/PHY registers in
an unpredictable manner, producing either an initialization fail
in the PCI-Express drivers, or even a hard lockup!

Resolve this by simply removing the special handling: in this case
the bootchain, or remote processors, setting is getting honored by
the later check for PWR_RTFF_SAVE_FLAG presence in the RTFF ctl
register.

Fixes: 9d02c94342b3 ("pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index f69cf69ba0f6..df8e93638e08 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -480,16 +480,8 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
 	if (ret < 0)
 		return ret;
 
-	if (pd->data->rtff_type == SCPSYS_RTFF_TYPE_PCIE_PHY)
-		regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTFF_CLK_DIS);
-
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
 	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
-
-	/* Wait for RTFF HW to sync buck isolation state if this is PCIe PHY RTFF */
-	if (pd->data->rtff_type == SCPSYS_RTFF_TYPE_PCIE_PHY)
-		udelay(5);
-
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
 
 	/*
-- 
2.54.0


