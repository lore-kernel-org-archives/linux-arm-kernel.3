Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C267ED3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8XyqVKtCre9okZYfJ1sV/QgXiVloFUYlk1Q5NzgYkwc=; b=vZ9JP1Q9jVmEFVlvqScPF8a0qn
	1NJb/LgxBX3Ye3BcFnVRlPDb+ATRoU7q9yLSjgc3ZWR8+sxboSNspsaCr7HZWyoLWEa7C7EwTMZ4b
	4VTFIug1LAQ5UDLgQ6mB6h7xVXAc1VaHh3N/nO3ODmsUmSBzt1TUDM2Oevbip5Fd3o9+HR/qKIEzN
	/AUs6bZrObVrM4ucjFaWsdfYKX+J2El6FRtbdVRVLn2u2nx8x98Q3GRLR9Qx3WYfHd14Lv1NA41iO
	jDzxJGmdHqRgNrZ6129YvNTqAWmn6ZE4FZEpop1DC/U1XkheV9ERV7hBjPOGsX0g1xVYqQoL1LOS+
	enpIaznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXv6-0000000CuwQ-392j;
	Mon, 08 Dec 2025 09:52:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXv4-0000000Cuvg-0OrA;
	Mon, 08 Dec 2025 09:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765187555;
	bh=bA+q+Yi8Osgb3E8rTTeSZMrghpJv7Hc1ZPkVJR6ZoG4=;
	h=From:To:Cc:Subject:Date:From;
	b=MrLOPValK8BZHH9ppnq4ze3WD+B/pEBdXvmySMreAB1HExjKACxyUVWH6DHuajtUJ
	 ab4zNuKw2gMQTIzK4/PibHBoT8bSvcUeaEF1pLHnAl9eLjB6UXNqC9u2+ZxpJEKFut
	 Cgz3zHhMS/HLpS5rgeVDL85hJD0p92KtqXeSFuNM54JX0PProUwV5ne/qBWWvlxeTB
	 HG3MyzzLVoti3O0WFQl8EYM3D7MB1i36nYih5Vhk8AMwAQgw7eE/G2Qk56N8sf4nFM
	 1f9ebGzpA+xfRgnc436+5YrvpgHKVI3fW92REXLx1ijkSWGluaNA+U4bc+9B71hCdG
	 moSdqe9/gI4Og==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:e493:1c28:b2b2:21dc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC31A17E0EFA;
	Mon,  8 Dec 2025 10:52:34 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Fix enable cdef computation
Date: Mon,  8 Dec 2025 10:52:26 +0100
Message-ID: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_015238_331094_DC762AAE 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Testing V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF flag isn't enough
to know if cdef bit has to be set.
If any of the used cdef fields isn't zero then we must enable
cdef feature on the hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4703bb6be7c..f4f7cb45b1f1 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -1396,8 +1396,16 @@ static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
 	u16 luma_sec_strength = 0;
 	u32 chroma_pri_strength = 0;
 	u16 chroma_sec_strength = 0;
+	bool enable_cdef;
 	int i;
 
+	enable_cdef = !(cdef->bits == 0 &&
+			cdef->damping_minus_3 == 0 &&
+			cdef->y_pri_strength[0] == 0 &&
+			cdef->y_sec_strength[0] == 0 &&
+			cdef->uv_pri_strength[0] == 0 &&
+			cdef->uv_sec_strength[0] == 0);
+	hantro_reg_write(vpu, &av1_enable_cdef, enable_cdef);
 	hantro_reg_write(vpu, &av1_cdef_bits, cdef->bits);
 	hantro_reg_write(vpu, &av1_cdef_damping, cdef->damping_minus_3);
 
@@ -1953,8 +1961,6 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_SHOW_FRAME));
 	hantro_reg_write(vpu, &av1_switchable_motion_mode,
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE));
-	hantro_reg_write(vpu, &av1_enable_cdef,
-			 !!(ctrls->sequence->flags & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF));
 	hantro_reg_write(vpu, &av1_allow_masked_compound,
 			 !!(ctrls->sequence->flags
 			    & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND));
-- 
2.43.0


