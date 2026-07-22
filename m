Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B25C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Eu1BsE+rTW0N75H/qUvuzJ34PWMjXXH1yhZ74i5vdw=; b=F4NNrKAr6Z/HQ7R1R6nWQVOUjT
	BRhisrlYQOEKMko0ochBoBJBwKZfF3XRgTJpkHP8wSwxuEO0Oo7gQP7dArqfIuCc2fVDerNBm4UKl
	uj08xlkfA+vj93dNXO7ZD+SS/TtMk/H3JOk23bY0oNMZfTVgwzPUACNm/Y1UzYIO2zjxy3dxHLBdz
	/ZdmF6oscEAHWGAWgJ+AH10sckL8bBQTDKwtU79RJEOjpG2BiF5ihBLGq+qS+D9m6Ow0QT5yAABaw
	yHue0jIKSqydrt6QizmXGBQOwwbCveTy/STXU85p6cs+SoPezbzzE98Bb2hWybd0oRxNOK35WwGEQ
	k6Lji/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWzm-0000000BuPE-0KDi;
	Wed, 22 Jul 2026 13:28:22 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWzj-0000000BuOK-3P4B;
	Wed, 22 Jul 2026 13:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784726897; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JsH11sfaEpvPdeSAnNZMv+HGKpSuWf+97/sRVY2CJCPYRUfuEyLNQj7wUYdoVRRoX18/aC2eHxmqVJfwsqi/o+2CZY+dkMBYYfTzwYomc2OWacm1wlcRh6jr1ZmKX9YwUQt6ptD9GuCe+coOJcIeIfKWsxQQCgfNivZ1lwA5jC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784726897; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6Eu1BsE+rTW0N75H/qUvuzJ34PWMjXXH1yhZ74i5vdw=; 
	b=MAF8QjXYBukouXwbLnSXoOi8aoiS3ZPq+F6ylyHxQ/b8Uu2yaR4apJwpo6M+lJAoukp/+nz++n5DwBVwLqJWhnmKkp3C/r1pNmx2Co7sihcOLEdxO7LV935bPd9mBbgWbJHlKRqSsGaD94+n/6wGb7/q/xn5TonOuDdqKRFfzqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784726897;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6Eu1BsE+rTW0N75H/qUvuzJ34PWMjXXH1yhZ74i5vdw=;
	b=JBWoBTorBSeVHxp5DLZcdf0RnZcYzV7gcspjiE/oUmFO3SLus+wmywiresnFmgfN
	xBkxYzODqPSmeNfWJHzOxdFwKLo7A+JKAZTjF38XXKlE9nV2TcjAb7ycUm7s56ogwyl
	oSTXzP7cPhVGnhGDg+u/BIxJL6EgrHlNVvP8nZu8=
Received: by mx.zohomail.com with SMTPS id 17847268956531017.741593921343;
	Wed, 22 Jul 2026 06:28:15 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
Date: Wed, 22 Jul 2026 16:27:29 +0300
Message-ID: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_062819_904634_C4DA49A9 
X-CRM114-Status: GOOD (  14.36  )
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

Depending on firmware, part of the MFG domains may be left ON at boot
leaving only some MFG cores powered, to let the ACP to prefetch the GPU
region when the display controller is brought up. This doesn't play well
with an eventual delay in probing Panfrost when the display controller is
fully set up, as that would make genpd's sync_state() to power off the
domain while ACP tries to prefetch: this is causing an AXI stall,
effectively freezing the AP indefinitely. In order to prevent this from
happening, the sync_state() functionality must be obliterated on all of
the MFG domains: while this guarantees a power leakage if the bootloader
boots the kernel with MFG PDs partially powered on, this is the only way
to ensure stable operation of the SoC during boot on devices with such
firmware because, of course, those will never officially receive a
firmware update.

Fixes Kappa Chromebook hanging during system boot.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/pmdomain/mediatek/mt8183-pm-domains.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
index 3742782a2702..5e33b8628e85 100644
--- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
@@ -47,7 +47,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
-		.caps = MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8183_POWER_DOMAIN_MFG] = {
 		.name = "mfg",
@@ -57,7 +57,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.caps = MTK_SCPD_DOMAIN_SUPPLY,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8183_POWER_DOMAIN_MFG_CORE0] = {
 		.name = "mfg_core0",
@@ -67,6 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8183_POWER_DOMAIN_MFG_CORE1] = {
 		.name = "mfg_core1",
@@ -76,6 +77,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8183_POWER_DOMAIN_MFG_2D] = {
 		.name = "mfg_2d",
@@ -85,6 +87,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 		.bp_cfg = {
 			BUS_PROT_WR(INFRA,
 				    MT8183_TOP_AXI_PROT_EN_1_MFG,
-- 
2.54.0


