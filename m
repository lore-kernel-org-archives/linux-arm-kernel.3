Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DD4FCA19E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3FB9PxYLglauAJeExvi/YQHsazHpOfV3fK1W0xFt8M=; b=AVDav1eq5xzaF+gOXxGnzORRm/
	jntNbwxMA3d6BZBwI/y/Z2DdJlvS4Bp7m8yiqw6uLXSkMXs04kI3I0sRRIJWcXgK05YGrhjFQEY9v
	nXMiKgmpjuUMtJVxO0VRsJ4QlRtxldLuVc4s2Ufxij9SVmGOques8TBCJQpHghocn1NMh2/0fnn6K
	NO6bi1cE7b1dME/6HuuCz0A3CDlvtC2uknzfgtG48wf7giW4y9z3bWKtTn99HHOLD2FJxw9SG4ytM
	mGVt68OHIiYI2HXBYxG52vK8STh64+FzNz7c3Em23FGj6PhwKnmR3Uwy30hIfGiut8N3jP2jNF1yv
	RmRa0sCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjLK-00000008FFt-0GXu;
	Mon, 09 Mar 2026 22:44:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjL9-00000008F1H-37R7;
	Mon, 09 Mar 2026 22:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773096281;
	bh=js3wV5z5S67zy6eAdYjU4FSDvTWxhLq5Wlg/JpSyxbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hX2Kp8DhyhPRCcKiJzDzrIyyf2lMlUIsKinKqG4ZfHf445gkpBhg/sY5GCsC85979
	 7UsCibJY8NwgcBnBKkHDBdVB7tSIMnfUrMyPZ3ZyFGqkIroloydspd7+dtMm7PxUk7
	 uzHTdooz/oBOIYJyG53N5nz4JlXRVXrQNP7Jq4K82U49VkSrVX5AEpwhcJ2B7XX8X2
	 9BOr7JvLMcJOovHaJGEHeOL+tgX6biLxo4Kw8EY5MOgBSPQ0SKed051Erm8SQFn3pQ
	 gjGp98/wi8Eq4KzpezAeObRY7k0XcZ09lxG6yF/nHF+/BPiedWi34IYJdjAkakKhju
	 ymG8qzUxY+Lxw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EFB717E13F9;
	Mon,  9 Mar 2026 23:44:41 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Mar 2026 00:44:36 +0200
Subject: [PATCH v2 8/8] drm/bridge: synopsys: dw-dp: Drop useless memory
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-rk-fixes-v2-8-645ecfb43f49@collabora.com>
References: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
In-Reply-To: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_154444_013085_7FEB886E 
X-CRM114-Status: GOOD (  10.14  )
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

The bridge gets allocated and initialized implicitly via the
devm_drm_bridge_alloc() helper in dw_dp_bind().  However, this is
preceded by an explicit allocation for the same dw_dp struct, which is
never used anywhere as the return from devm_kzalloc() gets immediately
overwritten by the aforementioned helper.

Get rid of the unnecessary and confusing memory allocation.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 8d02f047693a..9e7ace6be3a0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1977,10 +1977,6 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	void __iomem *res;
 	int ret;
 
-	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
-
 	dp = devm_drm_bridge_alloc(dev, struct dw_dp, bridge, &dw_dp_bridge_funcs);
 	if (IS_ERR(dp))
 		return ERR_CAST(dp);

-- 
2.52.0


