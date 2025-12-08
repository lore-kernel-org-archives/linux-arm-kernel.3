Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1551D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKk0jIlTFaRyVGcrv1jQP3EltUclBvcqcyXba0ulPFE=; b=zNimbke3Rd7if67VUEfWeQl9FV
	D7dwDJH2wpidTztJT/UjA0U83d4fxN4Qz/tnwFgTEuv4+ZcN3QvQ22nLsZz1NDDTyzEBYSPD9BNCn
	IoZroVXWwEAlA8DePKimmvfHDMkECXLqqLfML/uyBZ4MLGAexLvIZNwcpww1drafe/p930WC/kFH8
	BFHgGCbSQUXF5L+3OSGFgmIuzVAVVixk+WAELgEZqabyRz2Q9/wYeZbGV3V74zAD7084suXsfNjGh
	NQV907rM9UTRPUM/E78jQ20eSj5NeayY2VYAQnJ4+uR4dOQf6nJZcT9Yp03PIfbecv2WciuDM+KCf
	qzNwIy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXv7-0000000Cuwm-1exS;
	Mon, 08 Dec 2025 09:52:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXv4-0000000Cuvh-2bW0;
	Mon, 08 Dec 2025 09:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765187555;
	bh=W3g/qjurLiwWMVQbIZdUXiIhPWSknKR4dp2Kd3ms36k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYCISWrPaBYGTPXrI3nmOaAIIodsirOfCW7Qs3hW62ZK6Qq1r4Kfz+X37xCV2wb73
	 1ru+lqsp65UUBHK2gpV+aFvOUghn2u/5sH4+JgBr0z5kNecx2UqoqmwZsXJUyapXL7
	 iIQ80RPDJ7qqljyc2Fc05ggfAWsNKbqwDlV7v0K2iNuIYBjv9Q/eAIyZXWBgKziUNY
	 0xWIm4PEgx7JQSApaCzbh1ApYeeKPsr9nJUDwoBacfFyuihuey1w2nNnIMsBYFoiM9
	 KJWxCaKW/WaZlD8tDe2uAOQuvL8Cv3yED1x13Xcq47bqjCEnl8Hny2atYN6GaJpVjB
	 JRzthSTi313Sw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:e493:1c28:b2b2:21dc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BC8617E1104;
	Mon,  8 Dec 2025 10:52:35 +0100 (CET)
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
Subject: [PATCH] media: verisilicon: AV1: Fix tx mode bit setting
Date: Mon,  8 Dec 2025 10:52:27 +0100
Message-ID: <20251208095227.19720-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
References: <20251208095227.19720-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_015238_855293_F2B22C76 
X-CRM114-Status: UNSURE (   8.23  )
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

If tx_mode field is non-zero then write it value + 2 else
write 0.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
---
 drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index f4f7cb45b1f1..fccdece51b1b 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2005,7 +2005,7 @@ static void rockchip_vpu981_av1_dec_set_parameters(struct hantro_ctx *ctx)
 			 !!(ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV));
 	hantro_reg_write(vpu, &av1_comp_pred_mode,
 			 (ctrls->frame->flags & V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT) ? 2 : 0);
-	hantro_reg_write(vpu, &av1_transform_mode, (ctrls->frame->tx_mode == 1) ? 3 : 4);
+	hantro_reg_write(vpu, &av1_transform_mode, ctrls->frame->tx_mode ? ctrls->frame->tx_mode + 2 : 0);
 	hantro_reg_write(vpu, &av1_max_cb_size,
 			 (ctrls->sequence->flags
 			  & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK) ? 7 : 6);
-- 
2.43.0


