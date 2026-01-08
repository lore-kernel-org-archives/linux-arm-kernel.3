Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABA2D185F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JF2KX5qn5UagctlZYWCeoUykeAPlMkAzR1cuXy/5z4M=; b=r2xnV5tuzYUIn6jh3/IVRLhGHH
	BVMW667Js6XvK/IgY3uA+9ctLEeYxGGdCPppS6jVYeMiuZFqokbf2AZ6+6ziqu+wIy7601JSbycms
	KVzC6vs0Rhaiv3LYldT8lRjDfVG4CtQ838EKNCA7MB8i6OmXkk63PB0xeuNzppYa00ORQMnTMIozV
	2aPeYh9YKRo8Ir5dNzjTNWc6QXS0m0vAy+xWgeFNZEPpPfUiUWrHsmhKvixDaooDmuCd32ZA/TZEj
	JvJNpkaDJjj5Kt/s/c9HAMU4yH+MTwg95dYAlm9OMSfHSwz1KEYFmvNA+CWGkt0Fa7h4j4MXLNs3d
	bBZ02zwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq5O-0000000HAJg-02DF;
	Thu, 08 Jan 2026 13:29:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq5L-0000000HAIZ-2AZu;
	Thu, 08 Jan 2026 13:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767878991;
	bh=sIlDWrOUP2JFRN9/cVJwfUTM671Pu56/TH4sEK7QQsI=;
	h=From:To:Cc:Subject:Date:From;
	b=aTnFmhZ0lSs1xmPq401SxkkAYGNmeLx0XA7Dwma72H/04axAzuApv70rFYE6IeyTL
	 hctJxmdxCIhurkVDaneGBSdYWiBTB0m177T4vwZ0csGZccXdjlp17XYsvly5q53aK7
	 H7R19w5yIkLQf26oNRd/yqEbpatxVYinEcl/VD41AMLvuS9LKtK7WR59a69Wa2/inN
	 UavydTX76RcsGvPp18Juddycr6zEx4DQtQr+/F2L87G9EG96xaeLDcT6T53Q0y0eqN
	 vIb4qf6sA/J3BBZHfQgxYB6J6E0Jpp78uX6uvoibnxsmp6wotO5nfJ2S9W1g0o22DH
	 VrJyg7tQH4/Kg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:5c27:a8a7:cb3e:bb4f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74A4B17E0DB7;
	Thu,  8 Jan 2026 14:29:51 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH] media: verisilicon: AV1: Set IDR flag for intra_only frame type
Date: Thu,  8 Jan 2026 14:29:46 +0100
Message-ID: <20260108132946.74853-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_052955_743157_B07A8A55 
X-CRM114-Status: UNSURE (   8.98  )
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

Intra_only frame could be considered as a key frame so Instantaneous
Decoding Refresh (IDR) flag must be set of the both case and not only
for key frames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reported-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 1605cfd55d36..3a8123bbe144 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2047,7 +2047,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->quantization.flags
 			    & V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT));
 
-	hantro_reg_write(vpu, &av1_idr_pic_e, !ctrls->frame->frame_type);
+	hantro_reg_write(vpu, &av1_idr_pic_e, IS_INTRA(ctrls->frame->frame_type));
 	hantro_reg_write(vpu, &av1_quant_base_qindex, ctrls->frame->quantization.base_q_idx);
 	hantro_reg_write(vpu, &av1_bit_depth_y_minus8, ctx->bit_depth - 8);
 	hantro_reg_write(vpu, &av1_bit_depth_c_minus8, ctx->bit_depth - 8);
-- 
2.43.0


