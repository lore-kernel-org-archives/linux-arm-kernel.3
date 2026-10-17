Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A36CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=feAW8sNvX4y7Z/iBdWCH/eXYB2pXonRKpjrqViUaCfw=; b=ZmZHCw2rCyKUz+udEqxTMp9/m4
	hZaCWXpeuMyUqWW0ZJfXouAmKSQZ7LybfVSMAAQ+l+ThFCgw9gL+NxweAheATEv0EMvUflVt5b9Ck
	YoJoGSkhzk8w6ipNvH+ueYX3L/0PMzXDp4FWZo1A/m/ZWFLRLEmcg9iA23yHDq8li/ywTsDsfOPxn
	owS0HzNETN888r/jZ/H/64yn2xn7jMJva01obbLD7US7zNS0kglIAmN/s9skvEbi++/XDWjl/lR9F
	oN1PelS3SLpPctXDXJCHGf2RnN8I2opnwJMG0UQgbP8ql06e+H2vtJRSMULWm/ZP19x0UBf8QarRO
	FnlTbGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAJe-000000058Ys-3BNx;
	Sat, 17 Oct 2026 19:43:38 +0000
Received: from mx1.bren.win ([51.81.56.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAJc-000000058YK-08GW;
	Sat, 17 Oct 2026 19:43:37 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792266203; bh=feAW8sNvX4y7Z/iBdWCH/eX
	YB2pXonRKpjrqViUaCfw=; b=LIkwzP9V92PBqPzeHSEYssjkW1cD5WqMubuWZRTPQmweF6U2Dq
	NMSnzmDUeEOIHVblVLST0Pm29K0CRfxLHnBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=bren.win; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1792266203; bh=feAW8sNvX4y7Z/iBdWCH/eX
	YB2pXonRKpjrqViUaCfw=; b=r9yuZ0ALtiW9PXG2nnS3Y7Gd1cjrhjSP6xDouXjnw4K49c0pAC
	2/BEYj7HvE3+0Y+wq7cvmz2yCJS4AOd79L4FZcR24Zcvyt2/7FY/Tjklt9jJtEhG2LVLRTVq9Tf
	Wz5vA5XBtCsv1C2l1S23k4mz16XthaRcpqlNAQWnFVs2TkdlN2hPtxNWPIAK3Dlaj5G7Q9Fwd38
	yjfL1JDFNXYou9EdKxyRsd4vyaDxqtVInNnkRUTTcSqRIpjcsiu/Iq0Wv2FPnbm6+NDY0ysD77X
	XfRVOn8HdKTgmxBb1VR6KMZYDZJ5T9LEDzMmyLEqQ0qyCRejjY5x3z4CmO8VxBIKeMg==;
From: "Brendon C." <bren@bren.win>
To: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: mt7981: feed MSDC from emmc_208m, not emmc_400m
Date: Sat, 17 Oct 2026 14:43:08 -0500
Message-ID: <20261017194308.1541507-1-bren@bren.win>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124336_157569_C1EE3762 
X-CRM114-Status: GOOD (  13.02  )
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

The MT7981B datasheet specifies the storage interface as "eMMC v4.5 @52
MHz 3.3V", MediaTek's SDK kernel parents CLK_INFRA_MSDC_CK from
emmc_208m, and both the SDK and U-Boot device trees hand the controller
CK_TOP_EMMC_208M as its "source" clock with max-frequency 52 MHz (52 =
208/4). Mainline parents the gate from emmc_400m instead. mtk-sd derives
its divider, the reported actual_clock and its data timeouts from that
source rate, so with a device tree asking for 26 MHz it programs CKDIV=4
and believes the bus runs at 25 MHz while the real bus clock is 13 MHz,
and every clock-derived timeout is sized for a bus twice as fast as the
real one.

On a GL.iNet GL-X3000 (Samsung 8GTF4R eMMC, 8-bit, 3.3 V, HS) this shows
up as msdc_track_cmd_data write data errors (host->error=0x4) on
roughly every 40 MB written, escalating under sustained multi-segment
writes to exhausted retries, "I/O error, dev mmcblk0", lost page writes
and a stopped f2fs overlay. Raw direct reads top out at 11 MB/s where
the vendor kernel reaches 23 MB/s on the same card.

With the correct parent the same device tree yields a real 26 MHz bus,
23 MB/s reads, and four rounds of a 1.4 GB mixed direct/buffered write
stress complete with zero retries and zero I/O errors, matching the
vendor firmware.

Fixes: 813c3b53b55b ("clk: mediatek: add MT7981 clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Brendon C. <bren@bren.win>
---
v2: add Fixes: and Cc: stable tags so the fix reaches 6.12 and other
    stable series; no code change. v1:
    https://lore.kernel.org/all/20261017190729.1369302-1-bren@bren.win/

 drivers/clk/mediatek/clk-mt7981-infracfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
index 68a102d..3d98bff 100644
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -157,7 +157,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_INFRA1(CLK_INFRA_SPI1_HCK_CK, "infra_spi1_hck", "infra_66m_mck",
 		    14),
 	GATE_INFRA1(CLK_INFRA_FRTC_CK, "infra_frtc", "cb_rtc_32k", 15),
-	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_400m", 16),
+	GATE_INFRA1(CLK_INFRA_MSDC_CK, "infra_msdc", "emmc_208m", 16),
 	GATE_INFRA1(CLK_INFRA_MSDC_HCK_CK, "infra_msdc_hck", "emmc_208m", 17),
 	GATE_INFRA1(CLK_INFRA_MSDC_133M_CK, "infra_msdc_133m", "sysaxi", 18),
 	GATE_INFRA1(CLK_INFRA_MSDC_66M_CK, "infra_msdc_66m", "sysaxi", 19),

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


