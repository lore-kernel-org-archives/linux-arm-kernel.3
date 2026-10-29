Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79481606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fntf96T7;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=OSvvtPfw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=coo6LudP7+MXTGLkixUJjnU6L9CG0CO+uQUYKmWvOsg=; b=Fntf96T7Atk0Sk6jZMowaB4fAA
	Vw3/h9F65DYxWGWIsnZLlYQCF8P1dQsXd1md0m6hFCxJC2oEyYRjlc3IV/eNgcLr60S0L/MfXPlvM
	mpx3V8lBZphw7TokiyiBjV9m+045bpxshncMzbYu488GZnfgFhCf6wV+o4bUfnSFztc1/4Evm7dhP
	09MbZXZrTIi4h8fr3lsgJg+VGSvERBkf0YBzF8F8M2Niz7quJOy28Egv+tcK2A/vmxu3tFkj54nZy
	UpHdxqi5XRxDyIvCOq8eixcupnsOAUJfaIiHE4ng6cZh+lsAF1mPqHZL5o5NKNtTZKD3HIfsRJNJy
	q/iSBQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLP6-00000008hmE-1zAS;
	Thu, 29 Oct 2026 08:22:32 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLOu-00000008hb1-3bHB;
	Thu, 29 Oct 2026 08:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1793262078;
	bh=coo6LudP7+MXTGLkixUJjnU6L9CG0CO+uQUYKmWvOsg=;
	h=From:To:Subject:Date:Message-Id;
	b=OSvvtPfw+h4lOKsAusHHZKDswfmjkuTr4TJ1WTYHPtF/m7MAOs/gwcMeWCLbyB1fM
	 ZjPcSMadUVQrmXeNSDB5U2mKyl/Zx7wDQmhgZU5vIs8NrjVSV51+9XbwfzUGI4FOu4
	 EUfiJ0j9n4NzFv9QldWCEpVPxfDPE8uwEHxu7BTQ=
X-QQ-mid: esmtpsz17t1793262071t26810925
X-QQ-Originating-IP: MU1nVtS0U94iEE4PP6y+/7HGqBqj4VURMar9zqctctA=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 16:21:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 958842394236650097
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 2/3] drm/rockchip: vop2: Skip UV plane setup for packed YUV formats
Date: Thu, 29 Oct 2026 16:14:28 +0800
Message-Id: <20261029081429.862-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261029081429.862-1-kernel@airkyi.com>
References: <20261029081429.862-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M28vnsO5i7WerhWXTeUdJ/F/QgSJMZl7PxbA++NNSFfTm+7t1rMomUq5
	9l1YNm1hh1YaKQ3msM+cXSQz5WEBdMHAs7/49UEXAfDW9j9GjBrIcZ8L8z0NEHQ+M8acDDX
	YJWHclbKSv5RWleZ16dgdsUidbQNyG+mLTaLoos6TN/HHjG7ZRCfZgYanAIh6heqO6lqUqr
	2OhXcyYjzdcTQhghNMtLWtAiRJN3E7LNGPnU3RhONiEmtzS94m9K9wGxlCx0x+OG/KSPFY9
	dA9z9iDu1nqtKZ14BnO2ta6gKSAvn9JQZyt8OsgoVdmqBNaXjzed7d5ZpXjPrUDmWvwkU5p
	Ou0S1IxRLM2gMM03VYYeB+inxiBc6xBaw9VQg4PM8SE6xgKSC10zxHxZarGTnpWOn6P3fkd
	+JBdtjBXD0MXk/SfOtm6NTcO4R5Jt7g3BW+PM6h0ePqjb8nBRT5So5QFEdW4bgZhWPzoVO1
	4Xg6slsO34TcZU352GAeRZLMN+nHGCZRUuRZmeeDZ4Oy+G5sp/9g1XaROT3ghIwzdrDrCa2
	d6YMUtb6QMZy7z8sx01wzXS4YqvOrog4Epe8zMTxvXh3vgMW3opdO7q3QEik+AiGbBVBsbM
	eVyDbR0OVi7ldvV+I41OOj8UoGYYKm+g6R5kxoF5QKZhUdCWjtB8Gu6EgZa3FtNZR3hEBHB
	+ACJedrM2um7AVxfdEWszlK5AeixexpjHmL0VyXY0Gq3f87FVxNqXIjtj6DJdpZzxJhxD0Y
	RncW+MWtXWFuxfGedo4Y2dsrDvXuWJlLnR+UK1PfJQpQBfwtww5Ezxt1o0lG81nCKEkIY6k
	Y8t3bfOfgLiJ5B2vTQudVc0sRW3AhLs7tnt55063cnq2IVcjmqNWQZvX3xbctkhPeP06vD7
	Thls03U7cW3dTIst+hJzqXYRnzYzFUmgX3xxJIdd7yzxVviRp0+QV8T5alrTNOXIKlxjxRB
	EsDSh3jhXxBGx3OdK5kOQZCiKqgP79/RPOsUQm8I/JYjFrPCmSwYeR4PiA2rdRgrAfjpj/u
	boHhytAOKcHKZpBFI8
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_012221_419140_57EECFB4 
X-CRM114-Status: GOOD (  11.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Packed YUV formats store chroma interleaved with luma in the same plane,
so they have no plane 1 that the UV address registers could point at.

Restrict both the plane 1 offset calculation and the UV register writes
to formats with more than one plane.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
(no changes since v1)
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b38a32d623b5..06291a13320d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1305,7 +1305,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	rk_obj = to_rockchip_obj(fb->obj[0]);
 
 	yrgb_mst = rk_obj->dma_addr + offset + fb->offsets[0];
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
@@ -1460,7 +1460,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	uv_swap = vop2_win_uv_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
-	if (fb->format->is_yuv) {
+	if (fb->format->is_yuv && fb->format->num_planes > 1) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
 		vop2_win_write(win, VOP2_WIN_UV_MST, uv_mst);
 	}
-- 
2.53.0


