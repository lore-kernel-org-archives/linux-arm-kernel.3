Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED9F43844
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6t2fD7bCNqhSP/SW6WWurr5c/l20RwLeUuX0nYgGUk=; b=kmZF8uWpu8x9RoDm5Znv8zTXK8
	TOXSvrTLSsTkJC4yHQIM/Ty7j/2zxKT3kAZJKDQBk90mOLktiBMx6lC041/lyYKZOciGNM4MXi82W
	dWTeee5CI74HBVweooqlVOkiHHC7s86NXwx5zbfX8AXMKdonMq1xVoZGA4B4nGW/hUNwxywgfxIM7
	XgpNExUCo34F7F1PGUv3bYVPkIdXT9aaiJzmI37qdUdWJpKFpQsW8IPwNh1HWiwmKRYMV1AjitLZX
	Yr3Z0MI4WkzBsACo4P3ioSAFu6qQZ//hr4MbQivIfip4VELjL3I6CcskbCSrbb4i+HenD1ZU/eEtC
	N51P7lvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1my-00000001HUM-1tj8;
	Wed, 15 Apr 2026 15:04:24 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1mv-00000001HS1-3OS9;
	Wed, 15 Apr 2026 15:04:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD1mk-000000002Nj-3q51;
	Wed, 15 Apr 2026 15:04:11 +0000
Date: Wed, 15 Apr 2026 16:04:08 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Junzhi Zhao <junzhi.zhao@mediatek.com>,
	Jie Qiu <jie.qiu@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/mediatek: hdmi: pulse audio clocks on bridge enable
Message-ID: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_080421_845834_79F83EE7 
X-CRM114-Status: GOOD (  12.90  )
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

The CLK_MM_HDMI_AUDIO and CLK_MM_HDMI_SPDIF mmsys gates feed the
HDMI TX internal audio measurement block which derives CTS values
for the ACR packets embedded in the TMDS stream. These clocks are
enabled once at driver probe time and then left untouched across
bridge atomic_enable / atomic_disable cycles.

On every observed stale-state event -- a blank/unblank cycle, or
a cold boot with the monitor off followed by a later hotplug --
the measurement block remains armed against the previous state
and fails to latch a valid CTS on the subsequent bridge enable.
Video recovers cleanly but the audio data islands never regain
lock and the HDMI sink sees no audio, even though the ASoC stack,
the AFE, and the HDMI TX audio packetizer are all programmed
correctly.

Debugging the issue of audio no longer working after vblank it was
found that an unbind+bind of the mediatek-drm-hdmi platform driver
recovers audio in all such scenarios without disturbing video.
The only audio-relevant side effect of that rebind is an off->on edge
on CLK_MM_HDMI_AUDIO / CLK_MM_HDMI_SPDIF via the probe path. Pulsing
those two clocks directly at the end of mtk_hdmi_bridge_atomic_enable
reproduces that recovery on every enable and doesn't hurt on the
first enable after boot.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea2598547800..9050d7785f109 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1065,6 +1065,22 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	phy_power_on(hdmi->phy);
 	mtk_hdmi_send_infoframe(hdmi, &hdmi->mode);
 
+	/*
+	 * Pulse the HDMI TX audio clocks off/on on every bridge enable.
+	 * The CLK_MM_HDMI_AUDIO and CLK_MM_HDMI_SPDIF mmsys gates feed
+	 * the HDMI TX internal audio measurement block that derives CTS
+	 * for the ACR packets embedded in the TMDS stream. Without an
+	 * off->on edge at bridge enable the block can stay armed against
+	 * stale state from a previous enable (e.g. after blank/unblank,
+	 * or after a monitor that was off at boot is plugged in later)
+	 * and fails to latch a valid CTS, leaving the audio path silent
+	 * even though video recovers. The pulse is what an unbind+bind
+	 * of the HDMI platform driver effectively does, and it recovers
+	 * audio in all observed stale-state scenarios.
+	 */
+	mtk_hdmi_clk_disable_audio(hdmi);
+	mtk_hdmi_clk_enable_audio(hdmi);
+
 	hdmi->enabled = true;
 }
 
-- 
2.53.0

