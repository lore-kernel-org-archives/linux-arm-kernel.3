Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10508C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvEqes4NdgOxZCx38Tk73pXW92hJ2PH2vmX21EFIoHY=; b=ET6nc9yic23F2Ob52lCm0o1WJP
	+f+aJ4cS4PH5Mk1sX/UeawVyvuok1vzJVRL/i91mA5/6pncHMSH9YiNVc88lzHmc83L7sr7Rlb4hi
	2/ZGQWsHi+iBCYTZsXVzSZmUd3UIvwC4JQtkTFimgpLseue0z+PyCntCzaf1qctE/dGYoK05ItnrN
	Atg/V6KHsaQKvgrpi9XSmFwaJl2Son50vDnumMKGiz8uEjkB2gZa7V8Fqm3DIBMTZLSIqfLr+wR+Q
	shc0OVKDLUe3V3z4b34jzxSb9sqXfzmtgo8CP/7mu5k4kqOIx2Pk71ZsUw4mdp5suLihyfh70fUU7
	uDIGBSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3t8-00000007zxI-2uJf;
	Wed, 29 Jul 2026 12:59:58 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3t6-00000007zwn-0uLT;
	Wed, 29 Jul 2026 12:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785329993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KMfjNvZaPSsDTSeI5ElKx2CGM/NNHnIA19uE8iIc0wqICEY1Z5TV2LJ88Ebmxp75s4Rqm3Le8ha4tSr8oxzQElDksKvRTNhqQWKMrpkpWWx5DWeOkMRwPDWJ4L/SVvLOfIcqpOrA70VchM8sRh9IwkH5+ifJkcFBb5Igr6Lw75o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785329993; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BvEqes4NdgOxZCx38Tk73pXW92hJ2PH2vmX21EFIoHY=; 
	b=NrufYqB7xwTWKK5vNi6n6M7PBMbtk7RXrldP5oHoPRB48KKZyPKI7+m09d+3KvT+0tfRSlykHuPGgew7uLtSRB54AB1KEgVF8rkkBBkSGjZPpZfdl5gYkQVpVt1zkcF6u3fSjmbB0sO77jkaP3jW1bcaH7zQlLoTcMEfeRWl+mM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785329993;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BvEqes4NdgOxZCx38Tk73pXW92hJ2PH2vmX21EFIoHY=;
	b=E2fKs9dkQMRSeaukPrzN5B5vCnSqtJgHcbA+pVSk79GEg9S2FnUip6tbGF3UlKLT
	aDA8N2kiJbwEoXXREjMY+0eJzVTZ+7g+p8Zm8cP//haR4LfkmJPxpggWmxExdYzePDa
	Oqz3Hs4nJSrqhQQ+hox6ynsfqiZiGg85qoxfMHIU=
Received: by mx.zohomail.com with SMTPS id 1785329990701506.12633956111597;
	Wed, 29 Jul 2026 05:59:50 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] pmdomain: mediatek: Fix mt8183 hang on boot
Date: Wed, 29 Jul 2026 15:59:07 +0300
Message-ID: <20260729125907.830090-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_055956_301056_F5595DA2 
X-CRM114-Status: GOOD (  15.63  )
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

Depending on firmware, part of the MFG domains may be partially left ON
at boot time with kernel detecting PD as ON, while it's OFF.

Some of MFG cores may be left powered after bootloader, to let the ACP to
prefetch the GPU region when the display controller is brought up for a
continuous splash animation performed by downstream stack.

This doesn't play well with an eventual delay in probing upstream Panfrost
driver when the display controller is fully set up, as that would make
genpd's sync_state() to power off the domain while ACP tries to prefetch:
this is causing an AXI stall, effectively freezing the AP indefinitely.

In order to prevent trouble from happening, the sync_state() functionality
must be obliterated on all of the MFG domains: while this guarantees a
power leakage if the bootloader boots the kernel with MFG PDs partially
powered on, this is the only way to ensure stable operation of the SoC
during boot on devices with such firmware because, of course, those will
never officially receive a firmware update.

Fixes Kappa Chromebook hanging during system boot.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

v2 - Expanded commit message with more clarification about kernel wrongly
     detecting PD state left after bootloader.

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


