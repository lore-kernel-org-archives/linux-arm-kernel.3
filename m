Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35004CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE3mNwMkl0heXCeX/MYGT/7s9ocLStDHCkHc+4mdlio=; b=unAPypdF3I0SdforNdvqI27waV
	nH5eXhNmv84EeC/008Ehp3SqCG27c0GQwuz09KMXTPxMX8m79Xb54nduckZuuuj5o6ogk6o2Jp4z9
	oaLcBIKS25Ei7A1IRNeIgY2pJft6BUkjbAMDdBhUG09CKrTmkrHMpFkb/+fXy/L+e15Uhgx0jBjjC
	WX8rovNVbmsw5J7tBCnt8mDNA2znQQwVO/uCQn0AsFS82H4xg85y1K1tIZJL6l1amgfPh0rs29MDX
	9nyfjqiwrbJQBprXlahQFcga9cmhr3mBI5tZdNT0bUeuTxdOTX5qL4bGzU5YSKsUkUShxcHeUDfk/
	+EBPCPqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8r-0000000HGpI-3VW8;
	Tue, 02 Sep 2025 12:29:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNQv-0000000GQ9f-0YQx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA2C2416DD;
	Tue,  2 Sep 2025 09:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACE7C4CEED;
	Tue,  2 Sep 2025 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805768;
	bh=3w3z8lC19xg6OG2x/DLWQZURfAZl1jOshuOlqNWDqoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tZjUkoPBsHQfTkIq6eRI5rqvSx6N9+NklFWRlayt7ieMtOoCtqA/EqOMfBmvMrL8F
	 sLEURqQXNb2PzUe1v8WDtJpbIWDx4y3+P+94rc+5bSENYOUdvoRP8DcALMI2qTgIe4
	 3aea/jKisb9vUXxXaWd+Je7Yk6BNsoOWnn0/QM+v3+5tyKz0IaMxhFEfFW36m/kOv+
	 xoGLU4CbXKAoQZl0vy7zCr4oQ136dTaEkNOz9B5RD2U15dljNaAdInsecMwhWgLSTS
	 I50FeP3AOkxeHzzE6Hx51p7xx5HzrrG85jUGvymhZMQBEobiMzl7nsl+UffiE1m63D
	 P+vfTIOHf1Mcg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:15 +0200
Subject: [PATCH v2 16/37] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-16-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3w3z8lC19xg6OG2x/DLWQZURfAZl1jOshuOlqNWDqoE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgVdtyneVRi669cH9l4T113P7vS6/74YXzVjyoEOy
 S+Py7ef7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATydrG2LBUpTW+yvH/ivjQ
 V9v7mZRXft+pceHKVO3loobru/kmR3w8u8TiruXGIKfvYvPnf5mzl5Wx3nVJYaZ3eeXLwH/sWxe
 tXZsftnhj+6/PO5WSsxpX24ebsVdlMKtMeMdw68nE5qiJOSySAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_023609_205534_EC4654F2 
X-CRM114-Status: GOOD (  12.63  )
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

The imx-dc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Liu Ying <victor.liu@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -104,11 +104,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 		dc_plane_dbg(plane, "no CRTC in plane state\n");
 		return -EINVAL;
 	}
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1


