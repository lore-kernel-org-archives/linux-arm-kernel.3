Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0277DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ521Stz+Up5mgvMvg3s7RqhbHnNd/nrGhr76yRoN94=; b=WwOJFLZP9FQrmnAhbxdW7fZBPM
	Dtqj9hbd88cknYA+hNFRpC6ucsRMAWKC8fsW8tRKhUU+UoS7rw84bpFnkpureBaEpoy2JjOkOarQS
	fAQmAyvSn4GhhdmGfZ8me7aIoL5L1s4iVkQzd1R+AQjQ5/V9JMRwfB8ZX8ajc8hSRwm9FMaHPHN9Y
	++D3B21225MzN2WX2Kpt4oL6gaOhoXQQG6Xk7DJRHDGc4vy9u+4uUfdiEVJjWqCxebgSjnUQVOxQM
	fzGLgXOD0tOyfnX/t5XXJYG3Qzc22iEZOSFZ/bqDpiAiIAG3XYb4kjZOlbc36ZIcfsZFT5CmOK0d6
	USmd81bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijbK-00000009OI4-3Ov1;
	Mon, 04 Aug 2025 01:02:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij6N-00000009LQC-3YUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF2BB5C59AE;
	Mon,  4 Aug 2025 00:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3F0C4CEEB;
	Mon,  4 Aug 2025 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267454;
	bh=/VnKxqTsZUjp0oPsOCnFP3YENWBFTjPtLvT3Noo6Qqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPcKqEOtdPDAb66zuQs/t7h3arckbaSAuy2B/LGlyHJkEMqSKaTpevikYwt1uNtny
	 rpd7n11b98YF0opBxLYNkbWjozMIocZVEHgES4XsZl+LHrNkz5t5Vp9qlCfdKrxzGi
	 4UpHlpvdj8hfYZBPkhqwtHvGXj1Fy81wRi7UaRS+Kt91H6IkMcIqf3q1S0wDX+pp+S
	 jpBh0xjoComIzU5f29TO4PZky4MnuKNNEHb0uMuV8wvHoJcXu3OAuA46oSiHwG+eVS
	 fbcyueisC137VWCGBuvriEjSiXxytEobSR88HonEFEDHcAP7N07e9B6BRUNunAD+3N
	 CU02DZYZA+6+A==
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
Subject: [PATCH AUTOSEL 6.15 71/80] imx8m-blk-ctrl: set ISI panic write hurry level
Date: Sun,  3 Aug 2025 20:27:38 -0400
Message-Id: <20250804002747.3617039-71-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002747.3617039-1-sashal@kernel.org>
References: <20250804002747.3617039-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173056_048770_450269AA 
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
index 912802b5215b..5c83e5599f1e 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -665,6 +665,11 @@ static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
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
@@ -694,6 +699,11 @@ static int imx8mp_media_power_notifier(struct notifier_block *nb,
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


