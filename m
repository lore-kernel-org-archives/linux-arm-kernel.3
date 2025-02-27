Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C16C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y43PPM+oMSIzMLyGLzsdgJ9FDK//KK7Oq64maWgOQQ0=; b=JuVo1Gc0x9UUShFgnIVyqiYJbC
	8odeCSHXJul1oTlcr18wUUzbvXbp7xkEpU5jvvrjstk7XG2V20HkPp6Czd/6KTHTWItS8FfdocqTy
	BEaB6vGjsN2l11KJOHwakdNdYNs2ugTqTulc8KCB577qWyG8NTHlEeKPRD1ROzzIIM7PD/Tj2WhKZ
	G3uA45ZB558FB40hvHKFVvlchzCM91wBP+SH7xqI6h7EsAia08YyjqwQNoaZ8Zj5MdEGXP4/s/GO2
	6sUrG2n0yg+HRxZmJKc20b2cSgYGCrB4i+d3+n84ZHTXLLICfrKlIdvfFk1/meR5CS78GmFevPkk8
	wIORCp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncqM-00000007Kjr-21vI;
	Thu, 27 Feb 2025 12:18:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncMS-00000007EXK-2KO9;
	Thu, 27 Feb 2025 11:47:29 +0000
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 219757F5;
	Thu, 27 Feb 2025 12:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656759;
	bh=ZMtBQPd4FzhfOHdAq6GWMwplFQzrNJIKsTRatQkysMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WrfOY8eAN6//OTBhu3YmHBaQHHnd6K7fP80Uf5lGh1eAnoiNPebMw8JPai2n30yuf
	 dx3Rpz0+2sNYuDtO573n4+1SnwYUhqdCK19mm6UtYt8vnImVAhHN+UfoC52qwnaG/s
	 cqlHsK8BNx8+TlJNCDyjBIV9gQiy6zZ0qCuVk+38=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: rkisp1: Fix the quantization settings of CPROC
Date: Thu, 27 Feb 2025 12:45:00 +0100
Message-ID: <20250227114558.3097101-3-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034728_737543_F753AA21 
X-CRM114-Status: GOOD (  12.68  )
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

On the imx8mp the Image Effect module is not supported. In my case the
effect variable had an uninitialized default value of 0x700 leading to
limited YUV range in all cases (effects were never touched from user
space). The effects configuration is as far is I understand completely
independent of CPROC. Completely remove that check. This fixes full
range mode on imx8mp and possibly others.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..8d61e21ad475 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -764,11 +764,6 @@ static void rkisp1_aec_config_v12(struct rkisp1_params *params,
 static void rkisp1_cproc_config(struct rkisp1_params *params,
 				const struct rkisp1_cif_isp_cproc_config *arg)
 {
-	struct rkisp1_cif_isp_isp_other_cfg *cur_other_cfg =
-		container_of(arg, struct rkisp1_cif_isp_isp_other_cfg, cproc_config);
-	struct rkisp1_cif_isp_ie_config *cur_ie_config =
-						&cur_other_cfg->ie_config;
-	u32 effect = cur_ie_config->effect;
 	u32 quantization = params->quantization;
 
 	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_CONTRAST,
@@ -778,8 +773,7 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_BRIGHTNESS,
 		     arg->brightness);
 
-	if (quantization != V4L2_QUANTIZATION_FULL_RANGE ||
-	    effect != V4L2_COLORFX_NONE) {
+	if (quantization != V4L2_QUANTIZATION_FULL_RANGE) {
 		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
 					RKISP1_CIF_C_PROC_YOUT_FULL |
 					RKISP1_CIF_C_PROC_YIN_FULL |
-- 
2.43.0


