Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E693CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fixvt2Mw6vhDKtMnEAVLX/jGtrbQZGd7/A1Ja+swRk4=; b=AGTyRoMzFgAG2HEC65+AmvYZRZ
	Ar6dQF5vcS7jTQSMXspugzMrI0YGU7cjPnFCR0Fw0rM3Exkr7rFhPukRHuvbpPuJ2o6JsWp/qrhA1
	11+qb8VTjmnh5A5EvZFIM4Vc+qmPbNd3tq6U2HJg3x14muXZz8v/twBaR+To527z8rsn7/zsTuMyo
	p/YfX2EXJS4oI/NW+ylH6/H6yCCqV8pSzyxSII0pwasKt8N6H7QmOQuRwcWM7XPFG1B6ezDiXnhH5
	aLBs1YHhP362hqH8JFuEwus7D8TsIVtK0eEKalLk7MEHZ5j08wwuS+olLENW66eqXaEQNbjlMn2Ol
	cj2s22lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDil7-0000000GXL4-0opN;
	Mon, 05 Oct 2026 13:29:37 +0000
Received: from mail.haxxors.com ([85.14.200.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDil4-0000000GXJT-0vAa;
	Mon, 05 Oct 2026 13:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791206367; bh=cUk6hleFdTXonVJwfenNDEbW9WoUZ0doBHdHP/ROhaY=;
	h=From:To:Cc:Subject:Date:From;
	b=bLS5NlJ/bi+nBz0Mv1zcrkBKhij34z6FyPnn3o66uBgwOTuacYzijng67QjPCd47t
	 vBTffegyWKV+f5QOLBSJagL4JnX9SkCVrxZkcPxRkLHGQ4MKSZLapC07mMG0EpZ5c3
	 sKbgPQBM6dP+w0TdZZAv3+KETUYBmqrySc3XtthA=
Received: from localhost (localhost [127.0.0.1])
	by mail.haxxors.com (Postfix) with ESMTP id 71647515F0;
	Mon, 05 Oct 2026 15:19:27 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mail.haxxors.com
Received: from mail.haxxors.com ([127.0.0.1])
 by localhost (mail.haxxors.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_R2qTLR8hRm; Mon,  5 Oct 2026 15:19:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791206365; bh=cUk6hleFdTXonVJwfenNDEbW9WoUZ0doBHdHP/ROhaY=;
	h=From:To:Cc:Subject:Date:From;
	b=dnxVhqSidQ3/E788YaD5mDIaQPJcROYgs7/t9niKEEiPSWZ3kt5pPZ2V3V7leoC9H
	 q5IQJBx5zSoJVApF9A6oA8g2Aea/PqTFqcv4WISFCz6dkBhaEhuvUM0Guj/UfV7nx8
	 06rraQQkPrXU9RsOpYwTz91J8wblqvKRLS4+vHXY=
Received: from esports.myloc.de (p200300ee8f09a300264bfefffe4ffb4b.dip0.t-ipconnect.de [IPv6:2003:ee:8f09:a300:264b:feff:fe4f:fb4b])
	(Authenticated sender: nils@buechner.me)
	by mail.haxxors.com (Postfix) with ESMTPSA id 8178A51670;
	Mon, 05 Oct 2026 15:19:25 +0200 (CEST)
From: =?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>,
	stable@vger.kernel.org
Subject: [PATCH] pmdomain: mediatek: mt8183: Fix silent audio from premature sync_state
Date: Mon,  5 Oct 2026 15:19:23 +0200
Message-ID: <20261005131923.291619-1-nils@buechner.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_062934_532650_392CC6DF 
X-CRM114-Status: GOOD (  13.55  )
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

Commit 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until
sync_state") made genpd trust that a power domain already on at probe
time is correctly, fully initialized, and stopped forcing a real
power-off/power-on cycle for it until the devicetree provider's
sync_state() callback fires.

On the Juniper board (Acer Chromebook Spin 311, MT8183), the firmware
leaves the audio power domain in exactly this misleading state: genpd
reports it as on, so this new behavior never runs the real hardware
sequencing in scpsys_power_on() that clears the domain's AXI bus
protection. Register access to the AFE block over APB keeps working
normally, giving no obvious sign anything is wrong, but the memif DMA
engine's own bus transactions silently never complete: its current-
position register stays frozen at the value it was reset to, the
period-elapsed interrupt is never raised, and ALSA playback fails with
-EIO. The net effect is silent internal speakers on every boot.

This is the same class of problem already fixed for the MFG/GPU
domains in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183 hang on
boot"), which does not cover the audio domain. Apply the identical,
already-reviewed fix here: MTK_SCPD_KEEP_DEFAULT_OFF makes genpd start
the domain in GENPD_STATE_OFF instead of trusting the bootloader's
"on" state, so the AFE driver's own first pm_runtime resume triggers a
genuine power-on transition and actually runs the bus-protection
clear.

Root-caused with a git bisect across released kernel versions on real
Juniper hardware (audio works on v6.6, fails from v6.16 onward),
narrowing the regression down to this exact commit, and confirmed
fixed with speaker-test playback after applying this change.

Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Cc: stable@vger.kernel.org
Signed-off-by: Nils Büchner <nils@buechner.me>
---
 drivers/pmdomain/mediatek/mt8183-pm-domains.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
index 5e33b8628..8e29e5117 100644
--- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
@@ -22,6 +22,15 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
+		/*
+		 * Depending on firmware, the audio domain may be left
+		 * partially on at boot, with genpd detecting it as on when
+		 * it isn't fully initialized. Force a real off/on cycle
+		 * instead of trusting that state, same as the MFG domains
+		 * in commit 818d56ac1d ("pmdomain: mediatek: Fix mt8183
+		 * hang on boot").
+		 */
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
 	},
 	[MT8183_POWER_DOMAIN_CONN] = {
 		.name = "conn",
-- 
2.53.0


