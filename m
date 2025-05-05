Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80BCC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSY4eYQI5SkwzK+AlSj5/GgDA0GuMvNX7Eh5a2deTiU=; b=iXmazFlAl3rV4PC1+7qjDF4gSB
	mVshMOMwwDWdDHALllr5LZIf5Z8raQ2zeebVKMhalAzkZGg7gNPnV3Qpt0Yq+B+mNRB8N1AkvRf5C
	h5DYhjjt+e2+Kd76+44ILmpYEkdMz2vZR4Q+iT1q6nGl2cOKm7XgF26bHDhqz84bN/l2LNbZIqasg
	l6cgdCLH2T6FCvBDEgWZGJAHYkNk2T3ITo36yYudPKtm2/PHyI7mu63itNn+QSec38873NnNrm7jw
	8YHA7VqZwGXWvA+1n7p5PzbyLt8f4VMOMVWctyWrQSg7t7oQ+iGHHShg0R+1fqGrJPOcLMhFnJKFq
	188TLsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC796-00000009Wng-2jFA;
	Tue, 06 May 2025 01:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4aS-00000008rP7-2kVz;
	Mon, 05 May 2025 22:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5F405C0687;
	Mon,  5 May 2025 22:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A59C4CEEF;
	Mon,  5 May 2025 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485219;
	bh=xUeYcQ19WA4YDx8LAq/eonv8hTGDCBs6kyGHFjgYn2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SVC1focnSfOqZWvnrLY1O0YZC8D4IY1SU8ksD8H684bbhCRyy5IPBMpeg2C38QAAh
	 IZLjkYtagQ0ocTV0ALnJCy15ic8tw+BMmN4ScNYrHRmXngoZvCg4vZtQduOxf3+fmK
	 JAE8cM5/pxAH5HyPs4MP1ChzKOPxL0/utJwucl0OaBzv+XAAx71v9yKqGCCWvmR++l
	 hH4COtgQDvclWYJBLFSgnQlcwFlZ7Mn1Q4zIQtiLFtoZJgOFDi5F4rr0RL/a+dLOcX
	 6iRlAOUaQ0nxrVFH939r1iEv0DwRXfbi/vZYDcZ3Ln01RNiNW1Qgd1pfITBCqwB8vr
	 EiIUF794Belyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sasha Levin <sashal@kernel.org>,
	hjc@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 217/486] drm/rockchip: vop2: Add uv swap for cluster window
Date: Mon,  5 May 2025 18:34:53 -0400
Message-Id: <20250505223922.2682012-217-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154700_736658_4ACC16DD 
X-CRM114-Status: GOOD (  10.63  )
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

[ Upstream commit e7aae9f6d762139f8d2b86db03793ae0ab3dd802 ]

The Cluster windows of upcoming VOP on rk3576 also support
linear YUV support, we need to set uv swap bit for it.

As the VOP2_WIN_UV_SWA register defined on rk3568/rk3588 is
0xffffffff, so this register will not be touched on these
two platforms.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20250303034436.192400-4-andyshrk@163.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 5880d87fe6b3a..2aab2a0956788 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1432,10 +1432,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	rb_swap = vop2_win_rb_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_RB_SWAP, rb_swap);
-	if (!vop2_cluster_window(win)) {
-		uv_swap = vop2_win_uv_swap(fb->format->format);
-		vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
-	}
+	uv_swap = vop2_win_uv_swap(fb->format->format);
+	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
 	if (fb->format->is_yuv) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
-- 
2.39.5


