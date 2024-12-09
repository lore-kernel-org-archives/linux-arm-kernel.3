Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FYwu3JoLexUk2zE01A1KXdKUzgFzdxQ+q2JuyReUm8=; b=nZJzzU9XJqYbkyZGmAjqTbAfmG
	GzQf3H3mIQ06YrtoNHTfo8leKOC32tESV56WqA6OnP5NfOru4VYEfnT0oOUdOlmSYBcWJSXsVSIDR
	KjoDgAxakVzNBSEYgTSqjxFRptuqH0lAMl5ZdAcNFTXXZqMpvftRNQRo40+9aPm+QI65xwdY97ePw
	rvkOA9fJ86n3fgCXtcgTouBTjWIfNVcgH3bQjsbT13oQV7XORLfucv9WbNKmoNdNyF6+X9BDWTRFQ
	Uk9dYrllLoz/dcijpXODXTw8+Hxq0ZAyGtP1nPRyvIhWcrgbyIxMk45QWs6CLTi+oSCyuWDxFXB9L
	qOemhS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd4r-00000007l65-0KTD;
	Mon, 09 Dec 2024 12:41:29 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcu8-00000007gn0-2Usk;
	Mon, 09 Dec 2024 12:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=3FYwu
	3JoLexUk2zE01A1KXdKUzgFzdxQ+q2JuyReUm8=; b=JHvJWkD3LUV1A8dAYCX5V
	FSr4lzXv7kpva+gort6Cpmy/YSh2ZAfXxS4J7cgZZQnAon317cABjRuQ3ZVPve77
	E9EDXEgAgHN7XpsuJWxUnEfjjBLY4gV8NxxAe059IZpS8WGQ+fhggteY56euAilv
	x/Y/gy+x/BZIOFA3R0pcO4=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S8;
	Mon, 09 Dec 2024 20:29:55 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 03/18] drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
Date: Mon,  9 Dec 2024 20:29:16 +0800
Message-ID: <20241209122943.2781431-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4rXr13WF4kZr45Gw1xZrb_yoWkKFg_C3
	4fWr1fGr1kGFn8Jw1jka1fGFZIyan2kF18Ga1DtFyjyFykZw1xta4rXryxX345CF1rAr9r
	G3W8XryrCFnxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0aYLDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQqwXmdW3c3WHAABsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043024_951299_1E6D56E7 
X-CRM114-Status: GOOD (  10.57  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The alpha setup should start from the second layer, the current calculation
starts incorrectly from the first layer, a negative offset will be obtained
in the following formula:

offset = (mixer_id + zpos - 1) * 0x10

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Tested-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d0b2b881ff07..1f0fa153c62e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2459,6 +2459,12 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
 		struct vop2_win *win = to_vop2_win(plane);
 		int zpos = plane->state->normalized_zpos;
 
+		/*
+		 * Need to configure alpha from second layer.
+		 */
+		if (zpos == 0)
+			continue;
+
 		if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 			premulti_en = 1;
 		else
-- 
2.34.1


