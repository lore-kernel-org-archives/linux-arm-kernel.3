Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A41DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcH6Fai29XoWIOgIqxUZlnkcJHrLt32V6aiDfx7v0d4=; b=hP8zGdYXDLfQ68DHhcpCBnRXb5
	lz8dqhT0vS8unv8sHvfgabqfkvPi/FaDKMV9CHCT1y90DsWnel/tf9HVtv/gGfvbueNzxDYS4NsBj
	xC2TdvyMglihYGout9IrpXZC94AxRs7eLKXgs4tTn1/GcctFGg2uu90yU7FcIeJU9HDgP5wt5K2rR
	69vKxEnZ75NYcXmbxKqKrlcY3nhxDkTQOaKeGJiLB4nxJCcwVCEmuDfD5i59N2MuSzXiKXRa9Q0My
	KkOVOpzGXzjoL5SDo/yE2LABSFSKYbTJ+UO3QyOtxKMqVVa5vE9HD+j4Gf1U3ljQuHvKKCjsZUi3Z
	2hKFnNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uik4o-00000009R28-25LF;
	Mon, 04 Aug 2025 01:33:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijBc-00000009M2c-20u1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37BBF43B2C;
	Mon,  4 Aug 2025 00:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878C9C4CEEB;
	Mon,  4 Aug 2025 00:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267780;
	bh=HTCii5Oo+4Bro4IEOEsAfVVoexcXbMFm6hDvC+3p5/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVIL0uGBrlyUt8F+O4YzsBZXXw4pf9AO4QLqofbbXIjUOnr4CXso0sGwL+c0ncmBY
	 8Vv/BHNxOMfP2WH4lxxFDdUVhhVsM821ABYoA3K5qaW/BVeifSZ99drTZCqnXJY9HO
	 DcLbQqlf8iZN0VjjPIVTZvt/1JIsPqmZLodmqo3iWSOFzJYHZnnQ9TWatGtW1bThOT
	 WVEWhQz5Pm0ryJkNozlKd59HQ9UttmiY7Z4QYm9vDAXC/GODFjr3cf68jOrcxA5vQv
	 XpgvAt8jVIfv9+SkMah99jPob7NarX+MNnLl/sllY84f5t+kZ2ZslMx91w5jJyuP0Q
	 rraVgBdMtb7xg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	peng.fan@nxp.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 50/59] imx8m-blk-ctrl: set ISI panic write hurry level
Date: Sun,  3 Aug 2025 20:34:04 -0400
Message-Id: <20250804003413.3622950-50-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003413.3622950-1-sashal@kernel.org>
References: <20250804003413.3622950-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.101
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173620_558099_4C96A620 
X-CRM114-Status: GOOD (  14.30  )
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

From: Krzysztof Hałasa <khalasa@piap.pl>

[ Upstream commit c01fba0b4869cada5403fffff416cd1675dba078 ]

Apparently, ISI needs cache settings similar to LCDIF.
Otherwise we get artefacts in the image.
Tested on i.MX8MP.

Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
Link: https://lore.kernel.org/r/m3ldr69lsw.fsf@t19.piap.pl
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and the surrounding code:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real user-visible bug**: The commit fixes image artifacts
   in the ISI (Image Sensor Interface) on i.MX8MP. This is a functional
   bug that affects users of camera/image capture functionality.

2. **Small and contained change**: The fix adds only 10 lines of code
   that set ISI panic write hurry levels in the
   `imx8mp_media_power_notifier` function. It's a minimal change
   confined to the i.MX8MP media block controller.

3. **Follows established pattern**: The fix mirrors the existing LCDIF
   panic read hurry level fix (commit 06a9a229b159) that was already
   applied for display FIFO underflow issues. The ISI needs similar
   cache settings to prevent artifacts.

4. **Hardware-specific fix**: The change only affects i.MX8MP hardware
   and is guarded by the platform-specific power notifier function,
   minimizing risk to other platforms.

5. **Clear problem and solution**: The commit message clearly states the
   problem (image artifacts) and the solution (setting ISI panic write
   hurry levels similar to LCDIF), making it a straightforward hardware
   configuration fix.

6. **No architectural changes**: This is purely a hardware register
   configuration change during power-on sequences, not introducing new
   features or changing kernel architecture.

The fix addresses a hardware-specific issue where the ISI (Image Sensor
Interface) needs proper cache/priority settings to avoid image
artifacts, similar to how the LCDIF (display interface) needs such
settings to avoid display FIFO underflow. This is an important fix for
anyone using camera functionality on i.MX8MP platforms.

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index cc5ef6e2f0a8..0dfaf1d14035 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -664,6 +664,11 @@ static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 #define  LCDIF_1_RD_HURRY	GENMASK(15, 13)
 #define  LCDIF_0_RD_HURRY	GENMASK(12, 10)
 
+#define ISI_CACHE_CTRL		0x50
+#define  ISI_V_WR_HURRY		GENMASK(28, 26)
+#define  ISI_U_WR_HURRY		GENMASK(25, 23)
+#define  ISI_Y_WR_HURRY		GENMASK(22, 20)
+
 static int imx8mp_media_power_notifier(struct notifier_block *nb,
 				unsigned long action, void *data)
 {
@@ -693,6 +698,11 @@ static int imx8mp_media_power_notifier(struct notifier_block *nb,
 		regmap_set_bits(bc->regmap, LCDIF_ARCACHE_CTRL,
 				FIELD_PREP(LCDIF_1_RD_HURRY, 7) |
 				FIELD_PREP(LCDIF_0_RD_HURRY, 7));
+		/* Same here for ISI */
+		regmap_set_bits(bc->regmap, ISI_CACHE_CTRL,
+				FIELD_PREP(ISI_V_WR_HURRY, 7) |
+				FIELD_PREP(ISI_U_WR_HURRY, 7) |
+				FIELD_PREP(ISI_Y_WR_HURRY, 7));
 	}
 
 	return NOTIFY_OK;
-- 
2.39.5


