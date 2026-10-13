Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA2BCC6B14
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OEd55JoJOoDV13ld4fQoCE8domEIQzBBmawfYivXwdA=; b=a+aflprNH/jlYuFUi7g2pfM0Ep
	FEaEfT1UrcmVRWJSoN4lRg/ZbW4g5lUVEPrv8lPDgEV5u2cy5iQJIeyLTBi3Ar/Dc2+wzE/7xHWZd
	ggXBM+H4cx1jkTJyVe1uW/dlcKlNhiJX9ER1NnxVr4iOdEf8bNcOMzK0drjBrJmAO/ayZb81A59ah
	GBf4ZVONl7eL9bfBIqqwU4zr3ZaabsKy/QBylduffxsGGI6oWkVJCqyPWrUp9jFEsc6MUa1WPBesh
	j8j6p0AZiqXO6C4iRITNnK1azNSA3mUBlfei/DKwQ5QhoIdfqYZhbxVojf7a7PtFkJL2/oiQevFHD
	1OwL5BLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcqa-0000000CzzH-0Jwc;
	Tue, 13 Oct 2026 13:47:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcqX-0000000CzyQ-0MhS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:47:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so776936b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791899232; x=1792504032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEd55JoJOoDV13ld4fQoCE8domEIQzBBmawfYivXwdA=;
        b=ZxI5fOtEHFfBw5hX92gnslOEIEBeAf5S+/OsukkRj8EcihFZbj+JGYzMiaYkcFHkzD
         t09yO7nWB47SyYjn+SZfXFJQqMC+NuNltfPrs+lZimKVeeOJpwzzVNjI52qPeWyi7cmd
         U713gqDU+mCjwx2VoRwab1YLQeUzb4OvSJMmbL9vOB7D3uyvUO0yGZoU5pepMd+8NQOS
         KCFkYqTsQZLL7xZRGvVk3f8Xsob0ZeqwLU6SqF9ZMOFhQLD98qDFzvqeaRSvMUqlyZQu
         q13VRlxNvnpoWvjuiyxUoidrDZkJVLPleVu2Zkjw7r4vXTXI+1wY/2LyWyA/iikECdd5
         Oygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899232; x=1792504032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEd55JoJOoDV13ld4fQoCE8domEIQzBBmawfYivXwdA=;
        b=o9VjcBZZFgizyc/IjpBty3e1tUwuwouf/jaaQnw8TUT14n9fWcyQNBBG3yykL5npEE
         5XpGCOXnodOoKyeVJHJHMRhrsPHmYJxQXTEXqqXZxWNzhcAx5TpJSJqZPIi0KqzvqNVd
         VeTXF6JiowG3T7n6bZrC6XSYElaFJYdL76P0qKs26Sg2H9eyZpO2Mp9Xe0vwwi4NOQKS
         MfJfWEXSYl+WhFCYCixS0J2eIIMvpwWKWcBUWBVNdyZK2193wvAAZs5HUSrhrn/28PFN
         qTCYn63WQHBvljuO32iv6qcJEhr+Tpb6qDzer3ds9RdcTQd4i5MG2BbB6JBJLeNYJaf7
         oksA==
X-Forwarded-Encrypted: i=1; AKwUvBxx22KNdlwAMJrbYlkhPLIug1BWJd+ewJf60fOX90ih9nkXRjDnYnvjn1nb6LWTjSud303oGKvyAPg9o8q197mQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/BiNK44e5CLPQWoN7YJDAZ1nSe0Of1P4X/11DiTB2RfH3Z0+j
	bgDBgMgN79KgWX+yPWiDOEVUpdw9iURmmT+KTESZ//ODn40rQhmAtYHs
X-Gm-Gg: AYBFou22OVFkg70SWxt/XFQtslgU+aXoYw7YQAh1Mvas3LGExApvuInOhCsO8W3zq9z
	QITyZbWq66cbkZql4xv9AUW6HHqfTip6KkT9YyjfI3XbauLrAig8wSC8b//7VudlwWV57NkKHa9
	NbeMQ1bXhmjwxKsyRlndfhEnxiLQHNFae3xkWF8bRBsIQpTfTiqPzlBwYLgiAYhvyUkWocAOrq0
	izOoJ1IGEkBtKg41quXCcrlBq+tMgATDC8noDsbe5bqyOcOmaUXkpg0BgugvUWjVcfbg+y1GSSw
	RMOufOsKDMToOIrGmyuHRU0vgnFwi8+BFi6yqna9YjCUYOF6Rd1PuNfVW64Kns/9iaUEKDy2uKN
	eZq8irhslnuQQooCtLLTUDqIO01k/msoI8m0B8L8RRmTkyqmavAdrLaREXZx8wyKHOBHP7wToEP
	OPFhBzAJgzqbgcUWQ8Vx4Bw60dleFKPEio7bIdG7Gc2px9xZD3W6dWGkDTtSqzCNCQszNjaH6kF
	pbf4+XI6A==
X-Received: by 2002:a05:6a00:b50:b0:882:626a:709f with SMTP id d2e1a72fcca58-897c3ff5155mr10872889b3a.3.1791899231770;
        Tue, 13 Oct 2026 06:47:11 -0700 (PDT)
Received: from arch.localdomain ([161.118.199.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3cc80b0sm5044853b3a.29.2026.10.13.06.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:47:11 -0700 (PDT)
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
Subject: [PATCH v2 RESEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Tue, 13 Oct 2026 21:46:57 +0800
Message-ID: <20261013134659.335829-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064713_125055_D254F342 
X-CRM114-Status: GOOD (  14.24  )
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
index 6df6963740d2..637b1bff0f6c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
2.56.0


