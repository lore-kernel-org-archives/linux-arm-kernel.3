Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02638606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GWjYvn9U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=huomXK9SMndISLTL5gBVcSuerv7DR74V+Dr7Q6zCtnc=; b=GWjYvn9UWod18JrUaZCR0jjcZV
	j2NCZI2IlHLkiH7IR+qC+PVtZXWH4GRfAgEiuRtxWxriaDGUliujHX75M2AjmZMcwxFDVH4DFBm3Y
	ajC8TnWJUToSRV6PhcZpADpPIbWHGqj7gOLXGg6a5GlUNuaQL0oEXcEVMrrynycWtE6tmN8MRxZB+
	aH8XXBR+XmN1iZjilv6AmbStr7dwp5DFRMY+JPJrAAae2ae35ET2Y/spx1KN13k6UnPda9qYIB16R
	H4y3zsDK0qKmqqKccPFVe18qXaWzngmqnSeHPuJhvV8q7df/xLXlt8ju9EfNcmbQ8DS9zweLv8Joa
	SXlrAFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1M-0000000241I-25jX;
	Tue, 03 Nov 2026 10:45:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1K-000000023yZ-3dMu;
	Tue, 03 Nov 2026 10:45:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1E-0000000031r-0auF;
	Tue, 03 Nov 2026 10:45:32 +0000
Date: Tue, 3 Nov 2026 10:45:29 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] media: rockchip: rkcif: fix the MIPI stop path locking
Message-ID: <744eeec346f96d580a9215c657951f5a737e734e.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024538_909222_883B5FCE 
X-CRM114-Status: GOOD (  17.44  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rkcif_mipi_stop_streaming() takes the subdev state mutex, and the
interrupt handler calls it at the frame end that completes a stop. A
mutex taken in hard interrupt context sleeps when it is contended, and
CONFIG_DEBUG_ATOMIC_SLEEP reports the call on every stream stop. The
state itself is not read on either path; the lock serialises the
read-modify-write of the interrupt enable and status registers, which
the streams of a MIPI block share.

Guard those registers with a spinlock per interface, taken with
interrupts disabled, so that the handler and the process context paths
exclude each other, and leave the subdev state alone.

Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 24 +++++++------------
 .../platform/rockchip/rkcif/rkcif-common.h    |  3 +++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 686b995525b9b..53cfd37bf02bd 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -721,17 +721,14 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	struct rkcif_interface *interface = stream->interface;
 	const struct rkcif_output_fmt *active_out_fmt;
 	const struct rkcif_mipi_match_data *match_data;
-	struct v4l2_subdev_state *state;
 	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
+	unsigned long flags;
 	u16 height, width;
-	int ret = -EINVAL;
-
-	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
 
 	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
 						      stream->pix.pixelformat);
 	if (!active_out_fmt)
-		goto out;
+		return -EINVAL;
 
 	height = stream->pix.height;
 	width = stream->pix.width;
@@ -746,6 +743,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 
+	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
 	int_temp |= int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
@@ -753,6 +751,7 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+	spin_unlock_irqrestore(&interface->irq_lock, flags);
 
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
@@ -769,26 +768,21 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	 */
 	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);
 
-	ret = 0;
-
-out:
-	v4l2_subdev_unlock_state(state);
-	return ret;
+	return 0;
 }
 
 static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 {
 	struct rkcif_interface *interface = stream->interface;
-	struct v4l2_subdev_state *state;
 	u32 int_temp = 0, int_mask = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+	unsigned long flags;
 
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
 
+	spin_lock_irqsave(&interface->irq_lock, flags);
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
@@ -796,10 +790,9 @@ static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
 	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 	int_temp &= ~int_mask;
 	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+	spin_unlock_irqrestore(&interface->irq_lock, flags);
 
 	stream->stopping = false;
-
-	v4l2_subdev_unlock_state(state);
 }
 
 static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
@@ -881,6 +874,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
 		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
 		interface->set_crop = rkcif_mipi_set_crop;
 		interface->streams_num = 0;
+		spin_lock_init(&interface->irq_lock);
 		ret = rkcif_interface_register(rkcif, interface);
 		if (ret)
 			continue;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda8..16a5ecb25c2fb 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -198,6 +198,9 @@ struct rkcif_interface {
 		struct rkcif_dvp dvp;
 	};
 
+	/* interrupt enable and status are shared by the streams of a block */
+	spinlock_t irq_lock;
+
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
-- 
2.56.0

