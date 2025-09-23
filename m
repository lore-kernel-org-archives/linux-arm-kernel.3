Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337A7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ebINn/Ex6peTjWVdcmsWh2BtgOfbHEuHXthkszx0uqg=; b=EBWG6TceO0DNGxVvYDA00tVIpC
	SuWp8ST3t9g24PjOEmU+teInd/IBD4YXCp60kXpzfcuXNd6IkUFxqsLygy/rYEWIDxi21GGiV1c85
	K1Zi9JQID/KalUV+1bvaGWc6SrV7gSuRwXCeorVrYkdENTewqyvcdY41gb+xveNs+revWNMYKisdk
	QBu/WGEmR8LdPJlOuKRAK07clOUZolR6TuP7krGZDwGk+4kAeyraw4QzC0jozAyXWEfYs0hcw0YfK
	KrD5252ocSXSwctOoM25VkUYBI+igA3fOPSyt+PaOtJkLQyIv66XXZomJJJaqd+AYEYCSFVH5NfNC
	qEjo87rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ylJ-0000000Cr1M-2Lma;
	Tue, 23 Sep 2025 08:52:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ylG-0000000Cqzu-0rrM;
	Tue, 23 Sep 2025 08:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758617550;
	bh=eQ3bgrFsPixYkoX5WF8vxszDEQywePDRPFRChX8eSyw=;
	h=From:Date:Subject:To:Cc:From;
	b=C/OJcW2wr0UlSy5iTPEpZ+d530Z8l5Wsiq0TXn6L8RJwC7pO4y0epp/5S2uleH32b
	 bTh98ZZqQ/MjqrpDjYrEMMTuyg2a0Pa7cTQLtBeoiUedwGxzshq6Jdn4dUrG7w/w59
	 7MTyHyHK0u0xvxjYzOoKpaUfKjxfB+XDQzo1aVFIW+T4CRSDqYS00Trb/HTxc8/Qj0
	 L6ZLyKZDg2h8/l5lrcITOa5cs+GfbWTbI8tp3OUL7eyil/OXsMdT184J4JqwizbiIG
	 g6fFxWcI74qHIjUMz88+PBU+GOdj7tkT2LbxvByV66mg+Ud8iY2m8u+nVNjUTLs8A4
	 gy3RQdZ9GqUtw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CFC617E0299;
	Tue, 23 Sep 2025 10:52:30 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 23 Sep 2025 10:52:12 +0200
Subject: [PATCH] pmdomain: mediatek: set default off flag for MT8195 AUDIO
 power domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8195-pmdomain-audio-fix-v1-1-782190385f46@collabora.com>
X-B4-Tracking: v=1; b=H4sIALtf0mgC/zWNQQrDIBBFryKz7kAUpEmuUrLQOKazUFM1IRBy9
 0pDl+/B/++EQpmpwChOyLRz4RQbyIeA+W3iQsiuMahO6W5QCkPt5aBxDS4FwxHN5jih5wP9k6x
 XxlupPbT9mqnp3/drujnTZ2uJekuwphDOKQSuo4h0VPxnYLquL3bFntucAAAA
X-Change-ID: 20250922-mt8195-pmdomain-audio-fix-f7ebf2afb15f
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758617550; l=1485;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=eQ3bgrFsPixYkoX5WF8vxszDEQywePDRPFRChX8eSyw=;
 b=lG8MR+Jilqa9YvJI4g5WNbwG6A6UqK+1dxOy1mukQ6zReDxsF9ZSp8MjJSLdz7dYlCjb+gHTw
 Ei7/kDTc2ZOCZjuWhIC+g/nPNVHDq3IGkwIKz2djC75wH2f9j8PQ85I
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_015234_440002_095E2127 
X-CRM114-Status: GOOD (  11.05  )
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

In MT8195 power domain data array, set the KEEP_DEFAULT_OFF and
ACTIVE_WAKEUP flags for the AUDIO power domain entry to avoid
having this domain being on during boot sequence when unneeded.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Patch tested on Mediatek Genio 1200-EVK board (based on MT8395 SoC)
with a kernel based on linux-next (tag: next-20250922).
---
 drivers/pmdomain/mediatek/mt8195-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/mediatek/mt8195-pm-domains.h b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
index 9405e8f62eaf07112d52a28e6545d26a4342c7c6..1d3ca195ac75806c458db71db4538940f37128a8 100644
--- a/drivers/pmdomain/mediatek/mt8195-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8195-pm-domains.h
@@ -126,6 +126,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 				    MT8195_TOP_AXI_PROT_EN_2_CLR,
 				    MT8195_TOP_AXI_PROT_EN_2_STA1),
 		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
 	},
 	[MT8195_POWER_DOMAIN_MFG0] = {
 		.name = "mfg0",

---
base-commit: fba389ea7aa6401d3539456123cbadfa1a87231e
change-id: 20250922-mt8195-pmdomain-audio-fix-f7ebf2afb15f

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


