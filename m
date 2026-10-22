Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AAA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PR791aB8;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=EcTkj4Zg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6Mr2zeUEC2vgnMxDsc0lK+gzeSHU+oHhXXsC+EDQCg=; b=PR791aB8T3+965X8ACOPpdnp2y
	WVI4KJ+8t5eo6XDrM8yeiJlnmwFie8FSkU34sm+KHAkWAZ9LZlNsBxD59JPnT17Ae+E0n796nYEFL
	rpXK7wkWfPF6RA3N9wq+KimFO/cAV5Rsr3TP5xH/bAWPQCMgEOHfkBfqsxxAOSn8P+uXcteDKfzaD
	lmMREETLAkERrdYMlVS94+CjxeIZqVwPhGPCnvUPCfbuOuK9p97FmSLrL3yiZq+pnEZNiFxolEjPK
	JIZF1D8zPudQBgxrwoT87sbadhPCT7jSIUG21+7ZTNk/q0GOrVRFdgg+zostOMeNutaYUeKTj2zy3
	7lE0WYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJn5J-0000000DYIg-35CF;
	Thu, 22 Oct 2026 07:19:33 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJn5H-0000000DYCQ-16t2;
	Thu, 22 Oct 2026 07:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792653499;
	bh=B6Mr2zeUEC2vgnMxDsc0lK+gzeSHU+oHhXXsC+EDQCg=;
	h=From:To:Subject:Date:Message-Id;
	b=EcTkj4Zgfd9kWchDZ1MX0wxUGykVGPaYDRsXRdiPzmmrwJYkHXFB64S75sM2u2MiH
	 UydhTwdKqG4bj0M5AWX9V9O0HBlRMppDYsawE86LAK1ndM/zvu9xxDg2q4TRPlQQd5
	 epjlRmcUQsKezOftm9rz0KPZXF/C0rXYG9o2XX3E=
X-QQ-mid: esmtpgz10t1792653492ta104827c
X-QQ-Originating-IP: ZCwMVggbhxksKaYJi2SD6aPvDovFtD5NqMcNITo2/mU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Oct 2026 15:18:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6992850712652161128
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
Subject: [PATCH 1/3] drm/rockchip: vop2: Use drm_format_info_min_pitch() for plane offsets
Date: Thu, 22 Oct 2026 15:17:35 +0800
Message-Id: <20261022071737.508-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261022071737.508-1-kernel@airkyi.com>
References: <20261022071737.508-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MCk7GSmjSGXyJoQ8J8QJW4mNcKy6UUKftkpIU5sMqXCUiejKUB+N2CgV
	6/9upJi9+HQ5/hqwwsHgfP9gK+1AvUPJiV9SvJQarkEZs8SqM6LPFxLM0rwqaZKkUYzkFgc
	Fr4gC8hGWIawsTtym4Zl90OEWriXwL4ttDImaMm1Yrm63XeJinazvweon90xPScuU1X7MUC
	/lzr5xXVG+YOJUKMwM/zMg5vP8/WF4nGlgPQ+Aai2gB+nJdfh3kvq+LjYvEWdrrQeVay9ng
	tiubNHqcRdnwhcGYjIAT6/vHNVEUsmU2fCt2Obw6PJEZe715zi/FuC40XCpKqGY4LuMj3tD
	ltR1WUVlEOsfrjbQ1kN4ykOVfReY9PQ38TIcsR5/JAoBDI/BDUeBZ8wBOsfzRhs98AfEOpz
	qAwwkLAe7fSaDp7YPjGZFkIro9TblF41zihrcNpI35jSXBWW7qFPqjUBn1ZX5ubOoOjYiRl
	Jy8CWl2wyGwv55uFTILJ6m8KkUzws78Yvq+M/857wzCgk5qVTMFTpRF7XmbMNEdHaBJlFJl
	EwBSeM7pcHKG7LjzBbfT6TBHhINWR+4p4PjI5SNM3/FZZcKH648P2K4E8zOhQiwQUgYSW3t
	sMFvygDsNA7OemS5/SPR0kwcXed8QdqXjzk1Uls0xQxbkwHs+wKvsc6MkTEsRNmtvypwWNi
	s9IAnRTh8yD2ruTy6bFfepjocWJ8puUFdpjtcWPO5NYoIkyzD9JIzdvZqscBnc4ejmewr4S
	kQxnLBeGsuzLkCSukmy/3JTfGXiW9epNnIFlPRMUXsSfB5KwwytlI8EwwB7NRM8O2DDsE19
	/Ff/pwIT0AHf+2FjfC6GQx/uRr7aEGq7LEayqJI7mnOTKM1jWQlg8ia8sYe/IUM5X0oEUH1
	PW/ox82XHXB72DwHbvSkuHqKosUnDCgitges3xdqabWhmva8N3cekB+37xbjDDoU+Z0ErZo
	6WguNIzkuLVamy7G41Ri7Bp51m446UpA31CCtGFTBbzofKyPS2+HzIwcDui1vFcjq6EVtfL
	zJZEI1SiDdS1SZ+QjuBLIjX625AGc5NtihSOqWDMZn+inQP5J/1c+V20hV08L0J7oUHzxDJ
	Q==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_001931_854995_9F7380D0 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Use the block aware helper instead of cpp[], the latter aliases
char_per_block and is wrong for packed 10-bit formats like NV15,
NV20 and NV30.

Tested with modetest[0]:

```
	modetest -s 86:3840x2160 -P \
	59@83:3940x2160~96,0,3840,2160+0+0@NV20 -a
```

fb size (3940x2160), src at (96, 0) with size (3840x2160),
dst at (0, 0) with size (3840x2160)

[0]: https://github.com/windowsair/libdrm/tree/src-pos-support

Assisted-by: LLM
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4cce3e336f5b..480aa8c8a8d2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1290,7 +1290,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	afbc_en = drm_is_afbc(fb->modifier);
 
-	offset = (src->x1 >> 16) * fb->format->cpp[0];
+	offset = drm_format_info_min_pitch(fb->format, 0, src->x1 >> 16);
 
 	/*
 	 * AFBC HDR_PTR must set to the zero offset of the framebuffer.
@@ -1309,6 +1309,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		int hsub = fb->format->hsub;
 		int vsub = fb->format->vsub;
 
+		offset = drm_format_info_min_pitch(fb->format, 1, src->x1 >> 16) / hsub;
 		offset = (src->x1 >> 16) * fb->format->cpp[1] / hsub;
 		offset += (src->y1 >> 16) * fb->pitches[1] / vsub;
 
-- 
2.53.0


