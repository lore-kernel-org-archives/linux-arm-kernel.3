Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C737CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3ImoaESr7T31Kj+mDsWEqXwVEK1MWqSyne71ANfJz8=; b=fErmR6HRtyegNY5NAnq6Pmjg7r
	NrNFMKe5vaj/hsib0w4Zl60B3b85g2U8Yyr+FHCy+mtkYmC8+37oj+vXRiFsemHm4PheeOlcYIWQ4
	MfO/RWsuixmAWHZDOX2YXb/mW5ucZV+J+hn/lFkT5TY4MhOEvypyt5st379n1COQOFgayhPk7fOSE
	GsEXNhffecB65fUyikP1jsC8sroXBhsOZ9VksS9otgBUEbtZ2Ydj88HdpoVXoBmsc6gsrFu9DoXXo
	MURU6eB4HgSJnx8VsUSCa3ldXU3ZBgJ6KHJ28LI4r1UHdHXUp5aIaVbYKB+DKEOLtaOov7nAOwTXv
	qZk/pZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3a-00000006Y6A-0hxb;
	Fri, 31 Oct 2025 17:36:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3V-00000006Y3K-3wKH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:36:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12DF3B5;
	Fri, 31 Oct 2025 18:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931607;
	bh=L2jskCFzVI8vu/VxoOiuw8oJHvcjhXC0BGW7Tik0EZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ecJtDpaWBSsdWbqTB9WfO0ZAgCfK6oPUBQFzr4ywkc8ILhY7PBrk287JgiwN8iYgX
	 +aJOUevbMNbzDVzfQyifE/oRFZIc6qgbo/i5RrWT/GEL48whOkLQLKJX/jjrxAydkU
	 mKQ+vN2+hTsI/y1wDef537z7BWF5pDJFHCizyLCc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:26 +0530
Subject: [PATCH 06/13] platform/raspberrypi: vchiq-mmal: Update video
 parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-6-0dd5c0ec3f5c@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=chq8KEMAdpSsSzxQiDjebF7K761kG8qgjKO6tzXXFxo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGZeNUdnT5uwGciICWjn0Bs341CwEpZvzpCw
 F6gnxeQh7aJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxmQAKCRBD3pH5JJpx
 RXzsD/0UKwNYQXhWfszp1SLk0j7aatmNyK4ciO8eqrV2Qq+TfuYyP79JDN7/nwMKwndxEV4MiBO
 3oOMK8DR9kt+OiAfIxR7I5Ccb637XMmOVj6EHcZUUA9HsmOYpZfERK9isM44t/2L4lB1Pv9MjDe
 OdXSxrQqw1qWGMvZyX+v1tSWF8K5MKeNlqN7sqtHXKKAS4BIaD7ZwWQbsN6PzkfLFUkFu4oKRsC
 pyCXm3wbRD2P3OBdZOJBq1UXrlO7jVRoavxU32hce80+2OYnOsB5Rvj1a2Wuak3BALVtIB6+gNy
 TCjsskoEsQL2T/6u3bB9QXSCBevOPjFeOBgNXV9hfzEUB7nNIfg7LNfuTMkCg4ph9cYx5GS7F47
 kkgmpcbzruKOkI1eszELBykdlzJuXLAIga6PayDg/sdq4Hj6D7XsI6A8k2vA0TCJY+Zv1qLArlp
 sZccIkJ63nylB49Q8QY4eD5CEMDQ0OxVQMuoFR0rFUzZjvrGOYWKYJRM9FuxjsM2pJp7onoOkUF
 FQyYhsCNjSfvOpifwJNQMzndAUTu24n1zu56tSLZIH2ZV1AGwGxsBE/4zJoznSZ7/tb1W6SrRiu
 /2iQqDdYzpp7a1tvyV0JGfFLJJpVilUifHmLefxy7w8GIBQneVXnALlOw6KNLxvRbADnN2Dk9gS
 7CLz6YS2tXlKTtw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103654_121335_55EAEEC9 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

mmal_parameters.h hasn't been updated to reflect additions made
over the last few years. Update it to reflect the currently
supported parameters.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
index a0cdd28101f2dd67fd6b64ce1c95c0cbbfe15fc4..0a4fc9252b1798d883047e22bbfca050017f938e 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
@@ -577,7 +577,43 @@ enum mmal_parameter_video_type {
 	MMAL_PARAMETER_VIDEO_ENCODE_H264_LOW_DELAY_HRD_FLAG,
 
 	/**< @ref MMAL_PARAMETER_BOOLEAN_T */
-	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_HEADER,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEI_ENABLE,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T. */
+	MMAL_PARAMETER_VIDEO_ENCODE_INLINE_VECTORS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_RENDER_STATS_T. */
+	MMAL_PARAMETER_VIDEO_RENDER_STATS,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_INTERLACE_TYPE_T. */
+	MMAL_PARAMETER_VIDEO_INTERLACE_TYPE,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_INTERPOLATE_TIMESTAMPS,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SPS_TIMING,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_MAX_NUM_CALLBACKS,
+
+	/**< Takes a @ref MMAL_PARAMETER_SOURCE_PATTERN_T */
+	MMAL_PARAMETER_VIDEO_SOURCE_PATTERN,
+
+	/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_SEPARATE_NAL_BUFS,
+
+	/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_VIDEO_DROPPABLE_PFRAME_LENGTH,
+
+	/**< Take a @ref MMAL_PARAMETER_VIDEO_STALL_T */
+	MMAL_PARAMETER_VIDEO_STALL_THRESHOLD,
+
+	/**< Take a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_ENCODE_HEADERS_WITH_FRAME,
 };
 
 /** Valid mirror modes */

-- 
2.51.0


