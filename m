Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9BFFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaxA1KOQqFLnJwD8i8nhUbyHPWKOXYrj9ZYYoAP/kX0=; b=WyIQYyPcDcNkp26UWalhYdw8r1
	bFUKBX+f35WS+1+HUePX/06ZeFiBFp5TKIvpLBtAZfJlEA84vkM9mkcWqkKXORka/ZPLop1ljDenm
	T8Ue0VAut2fwVO5pfOo0D+DpWMx6PC2KyLUb7DPD0WjupQ1wJkErcX+iTVHrIFP7h++v14b0evU4G
	eo7KsSr779yTF6lUXqbkyRBiICiWgCnttFHSksP9+GY7TxpHQBjkroUk/fFpcFmgxo9fz5tlRJt2C
	Jlj3qv3UlfgbbePhOlRZ9bEtOslvrmhrl1FwhmahCEesJiXkOA2OEwk8TvTlo6eECiqr5ng5PDt5Q
	M8Qy6g/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAyj-00000004AG7-0cW6;
	Wed, 29 Apr 2026 19:53:49 +0000
Received: from web04.chillydomains.com ([193.19.92.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAyX-00000004A7X-2i7J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=web04.chillydomains.com; s=dkim; h=From:To:Cc:Subject:Date:
	Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=OaxA1KOQqFLnJwD8i8nhUbyHPWKOXYrj9Z
	YYoAP/kX0=; b=nGSlbyXYUKfQkPQwkan4V4FLTl1ALcyBc3+tUwIgRQWWxv/h2n
	pesTI414bf4N64kRjBeEU7tiq8EUc8Lt3K2VyQKx7gi/uE4xPiUZHDrY7kp9b/F4
	oHJit6O9XlrqQYW4MFIBZkv9UdCHcSUMc/OMHRIvBSZtRhCECuv3o9eU3XyLpG9V
	TmJpMAYX7743WkMFHRFlvFATt01iFwwFinKlU6eewGwo3VYsymZlNMdFiI2mRIYh
	3iMb+uUxr9SNY/mp3eHMABzA11kKqFvixLvby1WpBK3B2ddPiE27Vcc8VDeuGFsT
	ba9CvK9bEPNHt4W5Utk1BeuDJEL0QbRF4MgA==
Received: (qmail 2740071 invoked by uid 7799); 29 Apr 2026 21:53:35 +0200
Received: by simscan 1.4.0 ppid: 2740007, pid: 2740026, t: 0.6149s
         scanners: clamav: 0.103.9/m:62/d:27778
Received: from 31.29.52.71.dynamic-pppoe.dt.ipv4.wtnet.de (HELO localhost) (automation@reauktion.de@31.29.52.71) by web04.chillydomains.com with SMTP [64183]; 29 Apr 2026 21:53:35 +0200
From: Markus Fritsche <mfritsche@reauktion.de>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC 3/3] media: rockchip-rga: attach dma_resv release fence at buf_queue
Date: Wed, 29 Apr 2026 19:53:06 +0000
Message-ID: <20260429195306.239666-4-mfritsche@reauktion.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429195306.239666-1-mfritsche@reauktion.de>
References: <20260429195306.239666-1-mfritsche@reauktion.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_125338_028955_726D6E2C 
X-CRM114-Status: GOOD (  11.32  )
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

Opt the Rockchip RGA driver into the new vb2 release-fence helper.

Same shape as the hantro patch: rga_buf_queue enqueues the buffer
in the driver's m2m queue via v4l2_m2m_buf_queue and additionally
attaches a release fence to each plane's dmabuf->resv via
vb2_buffer_attach_release_fence(). vb2_buffer_done signals the
fence when RGA completes the M2M operation.

Userspace consumers of RGA-produced dmabufs (image-processing
pipelines, screen-rotation servers, gstreamer flows on Rockchip
boards) get spec-clean implicit-sync semantics, matching what
hantro now does in the same patch series.

Signed-off-by: Markus Fritsche <mfritsche@reauktion.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 70808049d..5557ca632 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -153,6 +153,16 @@ static void rga_buf_queue(struct vb2_buffer *vb)
 	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+
+	/*
+	 * Opt in to vb2's dma_resv release-fence path so userspace
+	 * consumers of RGA-produced dmabufs get a real producer fence
+	 * to wait on instead of the dma_buf core's stub fence. See
+	 * the leading patch in this series for rationale. Best-effort:
+	 * fence-allocation failure means we lose implicit-sync
+	 * precision but the m2m operation itself proceeds normally.
+	 */
+	(void)vb2_buffer_attach_release_fence(vb);
 }
 
 static void rga_buf_cleanup(struct vb2_buffer *vb)
-- 
2.47.3


