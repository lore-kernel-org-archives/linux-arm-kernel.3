Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C2AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiZAP5CE2Qg+2953jUYih6NAEp+heJ/HVnYd8DX8Ozo=; b=Xpzf6b8D8xj6pfFRZUrAuBivkW
	35TtsRh2YhTMaKPDdr6WOocCswmEeQ2liGz2SfAuJmEZAZuwXKsDdlH29PT1JnNPvQ1EzvgRhI9ET
	sg6pSdxNCuO5LiD7bFiD9zlmIFfXF1+Fkon53T+YjPSCXzoXIhkKBIkTBOX9yYkvCaeT2xwKxHVYE
	sk68cvT4NRIOtah7x119YxhfCBOKirjOwRdNapOAiPaEaGQbxBZ7zzOMoWuf32ObJZnrTZQoGfLX5
	ZqfPoYxHnxE++BCEPhGGDBRvHhRh3ioJTsMTmGKGyfl55ppdaBtgR3CGrrjMA9zfCiZNx311WGhLV
	Y0uUW+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hTc-0000000AqDk-2ffE;
	Thu, 24 Sep 2026 11:18:56 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hTa-0000000AqD5-0ZhQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:18:55 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1094186a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248733; x=1790853533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiZAP5CE2Qg+2953jUYih6NAEp+heJ/HVnYd8DX8Ozo=;
        b=aE1GSI/QOGOiwflLqOiKMlzeHtAPp/N64sSIKnEiPweoSRcz5ACOIIJ3IpeqXpm0je
         fuDw+6F0OWJXc4oaI3+p8eQyh0lAYxcOajrceFOzfrNoFeBZTdKjuLuVBYgOJHFGr2HA
         eABfBpMgYJCOi4I5DE5mX2iHd/dDQwojO1CvOT5wNVvxGUIXMOnMkTg3E2BXNT/ybm6x
         NURKNM+/O3Sk+EqEXd7MwW6PBqdkrS9hqc8/4Qn5FsXrwkmaibNfP7SUvCt9vfbZnUCq
         YfE8mPHUzY0uEdQLNQLZ13nke7GJ2Gixoasdpw3iciMABWJ5FQ93tewRWNncHK5mSUR6
         Ef0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248733; x=1790853533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiZAP5CE2Qg+2953jUYih6NAEp+heJ/HVnYd8DX8Ozo=;
        b=GBVBmdMhRCICZx597vS7AOYESYry6G7tX3SqdE/m7lt4+Qd3vgktuCGy1pSCKkVVJ4
         G6ic1fuuE7gq5D1/KQi0XmCeVlOQGmxVuPygEViPUEtaRd1KNk8gZNFGXeoRB07J08lN
         EtIBibYgvir4eQV4SJjVMALGXWmvnv5jsIPuFicBGD419C+HDVNhH1yNg4Tmv8TBHBKp
         ihfSpQQKaVxgRwk14JvDmvvoYdHAJl3lseDv+ijBU0n+v6MIyesww7SEZcVPEak3WSQI
         /GxGF7b64LHznKssHcpaANmTHwujYjUZdic3WgECzWsobuzJOb5pxXbGjBQcBGE/dnmW
         XAQg==
X-Forwarded-Encrypted: i=1; AKwUvBxXq/CzUp5G8fngddS/t/TH4okvQGz+Syl0SwqEZJdZqiVf/R3QOOH8DjsQzy8uigSkRTMLjQJhW9BGD17sue3p@lists.infradead.org
X-Gm-Message-State: AFuF++n8nmuZbbpiF8NGhh/5Ciol1QhdrlEcdqbQlqjXFLC/CcJIF4gD
	kY4DR5YVtNnfn7aWBXTnLIFh3vH1Qip03TQ4yRvOjf+BnLBU7cQO5fRB
X-Gm-Gg: AYBFou3aaR3+Y67+NuqFdt5YVEeAtYyTGssBaTid2EKGlJGplZgfUKwsbIyXiTFKsxs
	CqnvLWR0W0plwlwwdvX3Rl0fpFnQkXfGEzHWOejJXH/ubuAA3KLGmDlXvYnzsG6N03Z2KF+7vkw
	d0+nbM06+RR6Cg6Hx+xa/ruZ3HAaNCMer+xG+kTxACcH27M3RVGs1WFLo2v/bQiYOt6ByP9SjKe
	n/d/ualC75HZp/9I1FoGvf4kh1g9y6+c8enyKbJs/kfhvBQLy1fuGPZdsOZ44up3Eetz69iQfk7
	2Skxzko+U8gb630FHSLZ9YH0x9/AlpnKJZ95zpReJESHGzI9uo6OEG6iF/MHxjRZprMqTu7Ev7L
	wCfrsWw8BZMHDJoUVrX0orssGWsotl7+H+cZr7F8Qoiy91JBjgUd0Cucvw92EFoBMGtfCiI+0yc
	gMoHOpB18ywPKQxfZl/mfII+C0+HVdTc45uxzf2o8YRpPODsf7ly43acA8XeOktEE85UguYdWyY
	PDQCqF2HFhdTXDYEoxADc+FO1T0Vf+o
X-Received: by 2002:a17:90b:2dc5:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-3a09856fb98mr1677016a91.2.1790248733078;
        Thu, 24 Sep 2026 04:18:53 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972efa0bsm4314680a91.8.2026.09.24.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:18:52 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 19:18:42 +0800
Message-ID: <20260924111843.937649-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041854_224004_BF20BE5E 
X-CRM114-Status: GOOD (  14.05  )
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

The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
internal eDP port) has no separate PHY device and relies on its built-in
PHY, which is programmed directly through the GRF registers, so its DT
node carries no "phys"/"phy-names" property.

Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
-ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
misleading "no DP phy configured" error at probe time before falling back
to a NULL phy.

Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and otherwise behaves identically, and drop the manual -ENODEV/
-ENOSYS handling. This also removes the spurious error message.

Assisted-by: Claude:deepseek-v4-flash
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..a126c411b5cc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1427,21 +1427,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ERR_PTR(ret);
-		}
-	}
+	/*
+	 * RK3288/RK3399 use Analogix DP controller built-in PHY,
+	 * no extra PHY configuration is required.
+	 */
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.55.0


