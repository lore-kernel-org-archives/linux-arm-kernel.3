Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B9E9538B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFBdZMrsbsvxj62G1iZLzSX7M8exwLOhwTNTrQPOpQM=; b=2PROU4ITfn3dMZVAmsGYhplGSP
	qXRR3dzqtcTzYLNE7eZYstOvo92ZHuHkrmusWpf0mB93g8E4ZgXSeIG5RYWjyQw7ndrmR+rL9DQUl
	3vyVdqm5CK16ad5ZSnY3lZweccp6zwx10kaORelkiQCKnYpLS7h7bdA+0zaTSl7evr4bsCycbKa6A
	H1Jv3L2xYCG+x5vhsZd7gpuRy5VPRa0INM8qM5t/WIK3q0JJOlbweDPXenvt2IQg6xZyaSQCYIolx
	2xXq7r4+eU2S7a7Uol8BsuZdOw2XvqffJsVjsWe7bgLy+bIZo7sPe3F7Vu5TUrOmEBHbRlZsKQg2m
	/5WH63RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0c-00000008M3j-1jGa;
	Wed, 04 Feb 2026 11:25:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnb0Y-00000008Lzw-3OL4;
	Wed, 04 Feb 2026 11:25:20 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF2691379;
	Wed,  4 Feb 2026 12:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770204275;
	bh=5tT1QreBElhmzJ9xX6zFvlJg6hRkmTy0drDHUcyVEf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWCmWHFsKSdLFUC99b55o6TBcg1js9Z0ptZTLF1wD4SsuIJmw05tyU6+PH6oNNkcF
	 lY6SaLchuk8oWonZGq9ld/hxJupjI/ReyJYh56UjZIDAwi838NALD0YVex54u9Psbn
	 EkD05WdwsiKxplbpy24nQfUAbn1qDpZopLMYz5do=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v1 4/6] media: rkisp1-isp: Propagate sink -> source format in YUV passthough
Date: Wed,  4 Feb 2026 11:25:04 +0000
Message-ID: <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_032519_003325_54D4C930 
X-CRM114-Status: GOOD (  10.97  )
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
to the source format to ensure the pipeline is valid. Ensure the source
pad format of the ISP is configured to the same format as the sink pad.

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


