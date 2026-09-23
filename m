Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=; b=rOZiXkyCT/eU93qd4FBVIIMjTr
	sEZmPWT7F1sEnxcnHQfIiajLjN+M8l5gzxElfl00uO3e8hbTuupFMDJQY1U4vspGtQY2pMyAXYDaF
	Ch8G9iMRWJkEzn4jJg2tWZxBvRNicVe3+WaAQTngG8Lgktms0Cd8wANQjvRXJMpmn+YKjAjZ9ZiOP
	KWOOIKmRq9iWQfVL7yZgLtAtsHOyan/RcFQvLaiPRKYEgNVTCZhed49ylPvYQfipS0lxGrF69xXOg
	ADEo9kefxIQA8rnODO7lErYBzfzfrsx3d5SEkaJsJneZE7YzXO2QllaP+Oi4n31qo8R+Ovz9T0hI1
	dUsLROlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OzZ-00000008kc0-3wGy;
	Wed, 23 Sep 2026 15:34:41 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OzW-00000008kah-3cYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:34:40 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so566214a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177677; x=1790782477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=ML7KaoHugJtPwtdoh7QBF+Sbfuqm1FQJqZbyms1Q73PfHIk4vfdgtJhUftQ3an51X9
         ah0L4O1KXjAEKF2zry6u3c6ENiXqbn+riYn+EkxkOhxn0X/PpOqJLMG29kdAPmri3otQ
         jmZHT6Gg3EyJ6QTsCLdNwvJSwnkERRjp8bHekkW0rbAXWqvAiGi8917uPi+YgAKHm3T7
         PKjpxsvAWQQz6WNdMlPy34KX83UPlB/uxZD5VRgyg7RcN48mOUywfsSsautEg7XLbhAv
         UhmDvmvX8wk87dSoS/CkHK1G4tcXt1TieorCGTEMUrLNY5tDa+dE3Dgr36d66T8MaNwR
         Iz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177677; x=1790782477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=Kp3OA3vYx5ugzxYAei2fE1tjbZ8YhFLKTa40jUsGm7vioY7SP5UPmDEipsBR2Eb0Kd
         TL2j1SH/C6PFgIQoP8rBHyR+MsIrNhIlY06HfA9C5fHZ5DBVkVfAzUYdMjAvuLyXRSNw
         xrRZCOPOI+o3rXHGs8xbq1Whc6yAbR21c+M7/+bfSMs+6E79TPv1yJx+hRDXpiJGLjp1
         LHPFV8Hz32FakRuxfmoM0buBeXrIIpzx2gEbkqAMITFDSuO9XSAHFyqH8rLLmIdHDHGE
         RdwAOCf93jnjyHabu+xDMgo3a0ZhdEISNNkELKaocasKlfZ+hUPHoVZ9fdrBBwWG2uRz
         e8Tw==
X-Forwarded-Encrypted: i=1; AKwUvByISJ+OmoobRMbU+iVvbQT0VapANTzLR5Ogi3gc4lx2pEyXUYmIddsDwH5hEHV5WBESzW1O6r7+6HMLejt+jn9D@lists.infradead.org
X-Gm-Message-State: AFuF++kMCvmuPnIakwS1ZozM7O8RspevUFFjpeeDpaSuY7Hcs31iB9ur
	/9VQW5T465TuVIZOFTl3u2CCwL0fArm8eL1sufIkEFwbNtZ2nnkHhM8q
X-Gm-Gg: AYBFou1JteMk1TxkE3aQCGubTyXAxHYXq4xCGczzn2E40j8sX2K8jxaOy0EmJtDAgr7
	tZTq1Y1jbv3CrAAeNdQFE6ZXGawVM5o9NaRxm3KRu624Ih2UAiubtta3V7WkF1+AZl+kQUlEE/z
	DY6DR64FSzJTAjuGYodWGtukZ5LpioAz9dHgUv57nkMGTSTX9O8HICXcvabKPGDz/+1eE/XOStr
	z7u0sbqBKd3HREwj/R3z54kQ7TfYiEJnkYFQyyYLdRCh2p1ee5zY+aB5kKuExezBDWBjV1ncmfe
	QOYOgoNaBx87IeZFkZwQshj7toPvXtqnfaZYS84DHJpOVWPIfEP1mNPsfzEszS/liZ38wsNva2e
	JO0MJYNIWpyqan1NbCa0lEresol1OCBn4OxTqFfrRmU4dd133XpVWbhnjzN7KinVFZJEutu25iM
	fX+BxYJYv8FjbrOb6lcmAVEEBH9XVu28KODYXF00bpOidbV67h2QtmjepWqHRZh52KgM2jh+can
	CV/uDeEIXgNl0G6qW+i0XSD1h6B2EyTk7n2/XNH45s=
X-Received: by 2002:a05:6a20:c70e:b0:3dd:a197:7360 with SMTP id adf61e73a8af0-3ddf8296639mr2981172637.57.1790177676973;
        Wed, 23 Sep 2026 08:34:36 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f5e79sm1318844a12.25.2026.09.23.08.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:34:36 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Wed, 23 Sep 2026 23:34:22 +0800
Message-ID: <20260923153423.804759-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083438_950361_124AFA02 
X-CRM114-Status: GOOD (  13.79  )
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
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 18e76d1e78e1..28eb668d3e3f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
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
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.55.0


