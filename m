Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60DBCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1b3fH4o8OJvZQbR6/b2d2fVBNfnTiWTkHKndA/5KtUY=; b=IicsBK4I42DKgImEiooCAhacRj
	C4hCwp07cn4hfhKqWblRmYLc3O8B2FOQapIkXXLnA8nJkOLFgzgsUldhuZ2UGIczVWvgrpIiR6KOy
	w6mfhk3rL+JTzheViqE1o5EHjXMBc3TX/X6mJNnEnMPI5qVTCvKo86Ow9/Shp/coR9C6psDEq47qU
	IF7gxu5Vb/hYcCjYGW/PdPLMU257D6FI41pMpXaE+abExK2nqZpm5LckFJsHcpESMlySncFsAcJ5e
	AxKW0UDvE+1xxYiB3bykM8xwXxBKP4If5qRAohWYhPwbupv9rYwt+e4AUdT2wS+Bu3Kg7bHQEVDk3
	wl5jifPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3c-00000006Y81-2gng;
	Fri, 31 Oct 2025 17:37:00 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3X-00000006Y4E-0vnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:36:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9769C1690;
	Fri, 31 Oct 2025 18:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931640;
	bh=IHdpFNsikDjuT9BvG//eWRR5pi+hu/fq3ze+TMixXdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XnWPCe5/ePQcLPPtLmqvNtYKtS1yFi7KM5if6ekUiH0zYHDG1BHjOmYeCN6U6RvXg
	 bXAsDFBb7TmeqHkzPsql+i+t+ATN41F3MHHAwcRKCOHTSsjpcTjGR3oGjnupgQ5DcG
	 D1rfTObJzlDn8130tRh4QrPiSKVVXv1gCtu94ONQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:32 +0530
Subject: [PATCH 12/13] platform/raspberrypi: vchiq-mmal: Add defines for
 mmal_es_format flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-12-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=LKyLKcaXyAoycbYitlV+AZbBL6EJIX9O3KqfvKd+VMo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGfPbO6xE5RAvpayH40riclLISxDRq+Kjii6
 LATbX19oEKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxnwAKCRBD3pH5JJpx
 RaCyD/9e+AS8wk5pcH9fFNkvLtraQMxN7/XsU/IhBDzTjJJkN8ZUdt7lWtLWb6NyeAFgEvEwcCR
 xaNkMTcJ3czi7F5z8R+H5dK1UrgsIsisx1zRcx9cIRIUO4lm857yz9clw4H6s/DgoIVA4bJ568x
 NzmcF3tE/eglgMG8LZF4MpTkDXkPFr5e3OAhMc/fAsC4+/tRuj3KhonaYXQQ+FGay+aC+HnX1Az
 fbbXGhAzsOhehsCbBjS/UQVlXfEYByWRlIemSgh3YOyymFU8wii/yMynGdWAVr1O7LGmKbrGT2i
 PrMm30SyLp29PvqTXfUZhIfGBJZfRT3LkTt/jpIm+ofi/AFaNImefRAaeLO6iH2ekMdFfMMVeYk
 VaYJAt0NBWzEvEqQUo+tGhaTK//YfPZjMTWz2A7z2FyVg+OqdsRYtrThAvlR+PXlAjmMFQNOE9N
 k/nGSBESspsT9pSsW9ZhsoTuibI90rU6CaSz6mRfWZ1t6kTpsGw3us+S+e7lIIxZfKOlwL3i4Sy
 BPBwRAdJeDwG6qG2ovQRbx8hkrL2GhrhYT7GhEYnrF6uHkhvGSjKdhS2D7X9J76S9iH4AhFlviy
 yfrZN9KDFqiz0orS4WFQzJcK6CZHx75dCk1AYBhCsVql85DV5y/Gi58N9G100BeRq+dfLgqhT42
 vZqStSqkLzxfDCA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103655_432371_3A6159E7 
X-CRM114-Status: GOOD (  10.61  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There is a flags field in struct mmal_es_format, but the defines
for what the bits meant weren't included in the headers.
For V4L2_PIX_FMT_NV12_COL128 support we need them, so add them in.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
index 5569876d8c7d60477893c17f00c2e501b49d364a..e8f5ca85a7c4184320b33996967a7a83e938d79b 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
@@ -53,6 +53,16 @@ union mmal_es_specific_format {
 	struct mmal_subpicture_format subpicture;
 };
 
+/* The elementary stream will already be framed */
+#define MMAL_ES_FORMAT_FLAG_FRAMED				BIT(0)
+/*
+ * For column formats we ideally want to pass in the column stride. This hasn't
+ * been the past behaviour, so require a new flag to be set should
+ * es->video.width be the column stride (in lines) instead of an ignored width
+ * value.
+ */
+#define MMAL_ES_FORMAT_FLAG_COL_FMTS_WIDTH_IS_COL_STRIDE	BIT(1)
+
 /* Definition of an elementary stream format (MMAL_ES_FORMAT_T) */
 struct mmal_es_format_local {
 	u32 type;	/* enum mmal_es_type */

-- 
2.51.0


