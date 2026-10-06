Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817A3CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnA79/yMUobrP+H+M+1462+fcHHeEWmkC7DmTbPe43Y=; b=2q5IjvbDyZH6YVlBa8ZjuBpBkv
	VMNyZrP7vTXh88w5f3WZbYRiXTQ/1U7ys8hfOVqsPH0xH4Om8pd0DaPZyfGBnn/h3+McHDagI44qD
	LEyFJZ/QTj8UNTuMj9VIP8RJZxQ0IMp03gS6VLlceY9fP8yCsK5sOCvcGWVPtjUCMc5vixaAxAM/g
	7S4677j5J5vqvSr4vApAUcky+JxF+JVKhq+Ru8v04R48J60QSeUYlGpDKF0ER8vkRbHz1ofy9Xqg/
	rq39DEtGNYFSmq0cvrB3y6aJg+vg9iIUVSr6wYJ1OPT/C9TP+v3bwljse9yyJoiQWr361Qh4DuHs5
	p6kv60dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJQ-0000000HWgP-0OJY;
	Tue, 06 Oct 2026 02:53:52 +0000
Received: from mail.haxxors.com ([85.14.200.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJM-0000000HWfa-148x;
	Tue, 06 Oct 2026 02:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255225; bh=n6BEXt7OYkjTFNdfwFEm8H3uUmWyU4uREug1p7Xp2Ig=;
	h=From:To:Cc:Subject:Date:From;
	b=IpbGy6nT9XalwC+s4hIvwnobAp+w3EdPb4RYSf8pVolG/uQ3Y4h1BEQGBeEE5i2hT
	 KVJUkNJagXZMYOz76g3NPi40FZItps/P1Xbd2Evh0DCZCQEy+STqopbsY8ebU7jSVh
	 H7jjoP7/sYeZF1Iw389C76T/LfdTxr/Il6X6j3SM=
Received: from localhost (localhost [127.0.0.1])
	by mail.haxxors.com (Postfix) with ESMTP id 37FF953061;
	Tue, 06 Oct 2026 04:53:45 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mail.haxxors.com
Received: from mail.haxxors.com ([127.0.0.1])
 by localhost (mail.haxxors.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vRzOVYAH2xc; Tue,  6 Oct 2026 04:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255223; bh=n6BEXt7OYkjTFNdfwFEm8H3uUmWyU4uREug1p7Xp2Ig=;
	h=From:To:Cc:Subject:Date:From;
	b=Lh7MOB+DA/gLdxJT+fsE/Tpoh0SiKYi3MW+Oz+rxHNh0/JQpsmAAmRb3hrxqI7/JE
	 GHpydLHOFqIoyhiiW8BsUcPggeNhqJlc4YcljDds4X5rLQwM/qaq5DzWKcxtm1+g2u
	 PWzOqcKcT7IVgVOeRCaSgbzaEa9kuIy+cisFpFgQ=
Received: from esports.myloc.de (p200300ee8f09a300264bfefffe4ffb4b.dip0.t-ipconnect.de [IPv6:2003:ee:8f09:a300:264b:feff:fe4f:fb4b])
	(Authenticated sender: nils@buechner.me)
	by mail.haxxors.com (Postfix) with ESMTPSA id 3C5A0530B1;
	Tue, 06 Oct 2026 04:53:43 +0200 (CEST)
From: =?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
Subject: [PATCH] pmdomain: mediatek: Don't power off default-off domains in probe cleanup
Date: Tue,  6 Oct 2026 04:53:18 +0200
Message-ID: <20261006025318.503422-1-nils@buechner.me>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_195348_647077_56FCE651 
X-CRM114-Status: GOOD (  17.08  )
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

scpsys_remove_one_domain() runs the power-off sequence for every domain
that reads back as on. Domains with MTK_SCPD_KEEP_DEFAULT_OFF are
registered with genpd as off and are never powered on by the driver
before the provider is added, so their clocks are not enabled. When the
bootloader left such a domain on and scpsys_probe() fails (typically
-EPROBE_DEFER) after it was added, the cleanup disables those clocks
anyway, triggering "already disabled"/"already unprepared" warnings from
the clock core.

Seen on MT8183 Juniper once the audio domain is KEEP_DEFAULT_OFF: six
clk_core_disable/unprepare WARNs with backtraces on every boot.

Skip the power-off sequence for these domains; only drop the clock
references.

Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
7.0-based kernel (the hardware is not set up to boot mainline);
build-tested on mainline with W=1. On the device with the audio
domain marked MTK_SCPD_KEEP_DEFAULT_OFF: the six clk core warnings on
the deferred first probe are gone and audio still works.

The change and this changelog were drafted with an AI coding assistant
during a debugging session on the hardware; they were reviewed and
tested by the submitter.

Fixes: c1f3163d8ff3 ("soc: mediatek: pm-domains: Add default power off flag")
Assisted-by: Claude Opus 5.5
Signed-off-by: Nils Büchner <nils@buechner.me>
---

This is a follow-up to "pmdomain: mediatek: mt8183: Fix silent audio
from premature sync_state" (sent 2026-10-05), which marks the MT8183
audio domain MTK_SCPD_KEEP_DEFAULT_OFF. With that applied, the firmware
leaves the audio domain on at boot, so a deferred first probe of
scpsys runs into this cleanup path on every boot. The fix itself is
independent and applies on its own.

 drivers/pmdomain/mediatek/mtk-pm-domains.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index f0fa79e01..2b41bb8ed 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1100,6 +1100,16 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
+	/*
+	 * Domains with MTK_SCPD_KEEP_DEFAULT_OFF are registered as off and were
+	 * never powered on by this driver (nothing can use them before the
+	 * provider is added), so their clocks were never enabled. If the
+	 * bootloader left one on, running the power-off sequence here would
+	 * disable clocks that are not enabled.
+	 */
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+		goto put_clocks;
+
 	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER) {
 		if (scpsys_hwv_domain_is_enable_done(pd))
 			scpsys_hwv_power_off_internal(pd);
@@ -1108,6 +1118,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			scpsys_power_off_internal(pd);
 	}
 
+put_clocks:
 	clk_bulk_put(pd->num_clks, pd->clks);
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
-- 
2.53.0


