Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD52C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 02:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=; b=ekfe10wvnKh7e1EutPOR3xLmjZ
	wVzzBVlcCOPd30ZiiuVLlyG+n24JK3MN6qjH5TjdL2mpCckpLWWfNM5rs7InAc2VcYlZM+NXbqQhT
	L4/Alt1CbvDoaPnoGO1tEsntm90nRGV8bYqLzDqWzS6hahU6smlRxdEAZqrrvR2GKwlj5H028S2EP
	18/b7aitYLJsV1FnegwhFvzDI3jokzOnDFhCRercUq5MUqIX/yx1z5uIlvuqb/ApSzzWb3F8Ulm3U
	3egBbiS7NYUpZxMySVYZH33JY1jqSv4ncmKMya3u6rxNkEXDLFw1ZSdM5Q82qf4bu+m7YndYvtqJA
	uUbs2Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yp7-00000009q2C-3h7Z;
	Thu, 24 Sep 2026 02:04:33 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Yp4-00000009q12-0Jqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 02:04:31 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c5so993347b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790215469; x=1790820269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=Q8QloAngvWmx5UzZZ29wqtS6n0AxzWrYS4sctEjYvU/5yFA2rrFbQNOx52FBZmBXG/
         2gXmdUkBezSFElT66oQ/CoMvmB3X8D0Z89ru44xPI+qGecmVft2+ydqqVRNzaHl1RycA
         78pYx00IGYPRdzVb018f0QLwG8rkOp1fLYWtFS5UNXX1fU8eww0MA0Hu3PvZTLKPLBuN
         i0adKu8unnIT3xZVajXCLFe2IkuZ0wlyWwvxbLj+ojkIAzR2XypW10NkE/HeDOMWrahX
         0rF/UxOUasLq8F5/hJMezZTntzmwxuQ/t/fgiHNPEH7AkelORygE0Sshy/AYwmnyUV4g
         ii1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790215469; x=1790820269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmWPw9HQP1XagMM9TGKgOpF0w9bX79g0MmpHkabvFyc=;
        b=dr3pLqV+jNzwyNAwytMaNKvQbVahrke7v0aqziPjRaal3cmbIzKQGSMej/DqxAeGsI
         o/0aCwv+NYZmZ2BUN2FTVTeF1+IQujAXN4MuhXrHQ2jt8cvCnNO7Ha0NqhaYzJknIc9X
         3aVL/IWNSBCz77ZrTLZGXm0nZpRYF7GcZeJ0VAgMCAsYGaiq2hi3PLZYTt24ntkwzeBF
         wXyhBGfqjnqcv8bVTPNDqdp5bIjLm0mPrXvfkLTjcB8Gt80wds0Q0IVd971rkpk5jDQx
         ZroCE7lApsTW3s75wDRi/XOtBCsWeTLNc/YgV6vyYg0qHNKEqrYjL9Bd7ikUEQwryWzl
         WC3g==
X-Forwarded-Encrypted: i=1; AKwUvBwA6piEMH3ObDMouR/D1UiNpLiikRTySxWx+7pTpVS+CpddelV3sZg5CKgfuGfHN3gcH62h5BtiXGlWQmx3KvO3@lists.infradead.org
X-Gm-Message-State: AFuF++llXvXWsrZ9kTxV6GWBo6lns1Dn58W0+DhmJpTKi0GgNUteBgzq
	mamXfkLtePAuC3T3NGPuS3P3svsG0nWM3zdr9QZqOvU7Nv1Uk+HVFsgF
X-Gm-Gg: AYBFou1BnZvliqYg/4Btj72NNi0mdgPj8BLcz4d8INdQfjS5E5PDRKJmJxTxZtxJ55T
	x8In6siDCK9PdDyLLvQZIGjp47XLcM+UVYCn1nDrsaJbVFmyoZVUFr97q9uKEJS3kj+BojsDmIE
	2SzTnhJqoYIkuamKzv/bRtU8YnUtTdQQAJV5GXNjLF+TewFDyOJUqkGSQIcFHqJ4yaESy+dCDac
	F44alCGsUrHAt/0LH9ZeiAeaN3QxswLA/ZYYAz0TIxKcCZIyygLsHm4Yv5cyato+cRrG/m8Br0X
	mGdSdJWGsoyG71537lg0h3/ZO7gZgden/2lZS+VPJkv5/AFYjCuUHq77aBu/tOQzjht9moh/QpX
	9eJ8nyj9QEFEmYhIft1Hqur+XwiZqC8Jit8BTQdvM3GNXP0VKoyjFtcti/Hx7DYmqcnjMyC1gJw
	bLIpI554R1XMNisX+OvbMKde9eNcmcqC93apgzYhjkDbCIJRK/AhdQkSv0877/3J5Rp3zcZX0/k
	nzCUr362aw5n84VM4NU3feZUXwVXE6g
X-Received: by 2002:a05:6a00:6088:b0:874:706d:856d with SMTP id d2e1a72fcca58-87e9b3ba37amr753328b3a.30.1790215468861;
        Wed, 23 Sep 2026 19:04:28 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1331sm2041625b3a.24.2026.09.23.19.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:04:28 -0700 (PDT)
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
Subject: [PATCH RSEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 10:04:16 +0800
Message-ID: <20260924020417.868588-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_190430_111005_2323C9C1 
X-CRM114-Status: GOOD (  13.84  )
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


