Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2252FCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx/J2P52kLP0yCIF1wj5lOCxnnqSCbBvXonHXSv4+gI=; b=Qsok4JotvNRSH5AOD3k+sWBVBy
	iMQbfRowJNLAhs7+2fWyHmpxOpJMybBt+T4qSCIL7w3DPvMFRDCfKeTe3FRwYVCODtlDh83Q9f5nU
	f6kmzlPsggf8G/lMkUnVC98/BburAL74puTwQvyotWwO1CQ4NlbjjPppbPAYnpmxGbMRuw9GZRwYK
	Cmo/4vswKBm4ehTJ317GWzHMGBiSKolk/qYWfD3MaR8ygCuYuq9VSYV6M9PjtPPP+UHo5WrVa5Xnd
	h32o3OUrGLygoGSFuejfvm+KsF6s1LRc3HsrDBUF0w455MI7xq4opnNFTvjiBuQccCXcYFkIpkbeq
	j9F8OqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lWI-0000000BGum-3I3W;
	Mon, 22 Sep 2025 18:44:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lWD-0000000BGnz-1vV6;
	Mon, 22 Sep 2025 18:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758566647;
	bh=8Ru1gA/+Xt6RT6Vd2L59iOnO4RdALnmEprB5wUxa7JY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=plp022LW59l2ZM+CsMjmROE9bdXKb/bIse+CNbTgtd7DRhWEnTaMc1cttDZtGNV7f
	 Czkp+yu3TzL6jGfzLnnoQVzNAbrupXQknXaPwF11Yifh+N2hFV2DKE4SWdvpji2A3P
	 YSRb4FwtPsRO5uORdfz0Vle2TK5eVgk/BueDOM+xi6VnZHYdNpoBPjydt1iAsqfAnX
	 mdYBjoaEjeQJOw4Ag/fMng6MFRbtMhdwqGhbFoilZkBwWRsThAa6HoBT1i8ACxQh+l
	 oE57Sd1EUzcrjDKzn/LY2dFKveX07dHzQCOY/VeK27iKTJxhksfCWjs+6Gql8seVS0
	 8iQWe7Yao5TDQ==
Received: from [192.168.13.179] (unknown [IPv6:2606:6d00:10:aee0::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 498E217E12E1;
	Mon, 22 Sep 2025 20:44:05 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 22 Sep 2025 14:43:39 -0400
Subject: [PATCH 2/2] media: verisilicon: Protect G2 HEVC decoder against
 invalid DPB index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-imx8mq-hantro-g2-hang-v1-2-67d00eb6a548@collabora.com>
References: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
In-Reply-To: <20250922-imx8mq-hantro-g2-hang-v1-0-67d00eb6a548@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Stable@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=nicolas.dufresne@collabora.com; h=from:subject:message-id;
 bh=8Ru1gA/+Xt6RT6Vd2L59iOnO4RdALnmEprB5wUxa7JY=;
 b=owGbwMvMwCV203FKoGZC0RfG02pJDBkXZ3z4se3tjlV9G+164/0/qry8wXJOXOFi5OrHIuUsk
 osXreqM6yhlYRDjYpAVU2R5zxvUKHrk8CEplnwhmDmsTCBDGLg4BWAiOy8y/E/duHUB650DBaku
 h9ju31k5vUa8YN9yydhdxjt58iuEPpxhZPjyYtLXhU+4tOyqP7u2vF14PO0ni8jeqKMt2/UP6Oj
 mHmQDAA==
X-Developer-Key: i=nicolas.dufresne@collabora.com; a=openpgp;
 fpr=EF0D528115C4C3C21A046F12D9419451296072F4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_114409_675979_0E39B488 
X-CRM114-Status: GOOD (  14.93  )
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

Fix the Hantro G2 HEVC decoder so that we use DPB index 0 whenever a
ninvalid index is received from user space. This protects the hardware
from doing faulty memory access which then leads to bus errors.

To be noted that when a reference is missing, userspace such as GStreamer
passes an invalid DPB index of 255. This issue was found by seeking to a
CRA picture using GStreamer. The framework is currently missing the code
to skip over RASL pictures placed after the CRA. This situation can also
occur while doing live streaming over lossy transport.

Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index f066636e56f98560d9b1c5036691e3c34dd13b1f..e8c2e83379def53ce7fd86d6929ed4f5e0db068e 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -283,6 +283,15 @@ static void set_params(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_apf_threshold, 8);
 }
 
+static u32 get_dpb_index(const struct v4l2_ctrl_hevc_decode_params *decode_params,
+			 const u32 index)
+{
+	if (index > decode_params->num_active_dpb_entries)
+		return 0;
+
+	return index;
+}
+
 static void set_ref_pic_list(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
@@ -355,8 +364,10 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
 		list1[j++] = list1[i++];
 
 	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
-		hantro_reg_write(vpu, &ref_pic_regs0[i], list0[i]);
-		hantro_reg_write(vpu, &ref_pic_regs1[i], list1[i]);
+		hantro_reg_write(vpu, &ref_pic_regs0[i],
+				 get_dpb_index(decode_params, list0[i]));
+		hantro_reg_write(vpu, &ref_pic_regs1[i],
+				 get_dpb_index(decode_params, list1[i]));
 	}
 }
 

-- 
2.51.0


