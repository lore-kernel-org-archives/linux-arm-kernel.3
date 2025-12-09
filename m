Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBDBD3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMy/grN+1/LkJQMEcXW1981hOioRXK/YdjcULSMoyfk=; b=XSeR2SQUuVKwy2fk1NzmSBWPI/
	z45050jxc++2CzfLbeW3FgfCRfLbD96hl9h9p4qykGoM7wMWLTb6bT9nSuS6rjZBtJSSj4W50msGA
	eW3w9me5gCdjj0ai58RlHgmsnxAzq5mQYxsKJm6T7xVSOD0K59JpvnXB9A5+kR8gokutvYrWoABMc
	kfeAzrQwBUnaUI71O69Nrsw+ewy47PMKu+kSh3TvDSE2P+H3UKfAGUnz1JlqClcsCDH45IMusw+mz
	TSaWawSjfO6ynqg8cxU9fXUMJ38NTbqxg512F+zPhQlOo2Y52Fhad57w7jCihZ28O97qYgBUVixB4
	HtxWuxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsu-0000000EFTH-3rWe;
	Tue, 09 Dec 2025 12:32:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwsp-0000000EFKI-2ro4;
	Tue, 09 Dec 2025 12:32:00 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53F63A30;
	Tue,  9 Dec 2025 13:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765283517;
	bh=uT+0UkAjXO177URXDBOJe4n6IOs5odTKgpgqrzkTy60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VWaHCQ/b99ZxsDrWxwWtGnomlXayB3t/iT+Dt9D14rTCdjVx0A6r+Eb0+jAYejmM3
	 37vg3Bl697mI9qdQzqz7r7z0Z1MRxpn0eoxp7kfMbWzy3EE+/bijEdloqTlGGE6sXW
	 BKwZ3DIkXSoKsMIfhuuJna++gfqFyqQ8adFXze30=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: dafna@fastmail.com
Cc: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [RFC PATCH 5/6] media: Propagate sink -> source format in YUV passthough
Date: Tue,  9 Dec 2025 12:31:35 +0000
Message-ID: <20251209123136.273938-6-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
References: <20251209123136.273938-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043159_874995_09FFF414 
X-CRM114-Status: GOOD (  10.12  )
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

If we are in bypass mode, we should propagate the sink format of the ISP
to the source format to ensure the pipeline is valid.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 716bd7f3c66d..c457593526c5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -630,6 +630,11 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	 */
 	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
+	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		format->code = sink_fmt->code;
+		dev_dbg(isp->rkisp1->dev, "ISP sink pad is YUV");
+	}
+
 	src_fmt->code = format->code;
 	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
 	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {
-- 
2.43.0


