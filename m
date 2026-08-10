Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC73C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=; b=f0MtJaAwRsWiZXeZ8v5eEYL0NF
	RdgeTUNJh7VNXhDDFkDfOk0MNnSw1v3A5AhyDurjr0URC/YmbV5WJKIwaLYmglsxa/6DhHckXZ9Pb
	Xvv595iyVSuzjgbN6b5md8XeAy/xo7cbWrphEyXq+a5oQgtM4NFHb9wic6JnQbXqoO2U+sRGQT5da
	bu52zoaTlbb9xsCqgsbgmcjUdUCYiMPhIRVJL6+PhbL9MWegQ328OnqyJ6u0Mr/hsBxt4Vyad7rnx
	w3cRL4Nu9c5Ie9qi2Z+8oX83ypfrrHswkGDIAGF7iNdzxsjrbmyGV/6VwW5yDI/k7JBsKkDrVI9C0
	E8aRUeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJS9-0000000B5Nv-1MPp;
	Mon, 10 Aug 2026 06:25:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJS7-0000000B5N1-1NhF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:25:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cf452def93so30779155ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343138; x=1786947938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=XEv8bicZipENMfu/66VjNWtywTJyOLZ5orf4YunIpKMfpb0wbS3Mti3FoOjHMVtbMt
         0XFVfMGI9jnjVs7l89tnwc+oC1ZDSeaNYcd5cUyxAU03QkLmTyk9CvmwBldWcpvXhn8b
         0IEs6KepI45PSBS/yRVaBHQBJVeYyXhzK83j4L9MAnTgY+WF6YArx3qvT8xKdFjcUEnI
         ZZml3TEqCCZ9EX5HH/TEA2L/fcv0rREH9HpKEf5ozxjiYJplAk5ZBPQWQ62G1NcdGV8b
         MZrsB9dGq85LQkSFx75vQUxDykFEfeEAILdmqU1U48/GfIevVnfZriBC427jsGL/u7DP
         4qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343138; x=1786947938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=p1oapaIXjyCdZNHgvi5uQvEGsSpynGxzNhNv4UjUz84HL03CLfMH8iq1DYESAZ/W6j
         cPZkQK0dZ3C/NhAAStfolxNPmv96Gk1tMrWx/imKjYGiDzs9lIHxolgUEjy2znc6vG0u
         Z+RteTpl7fKYq4nBMEANu71wK7U+SAJ8zFrKgaxbEoUYO3Jdm0wPG1x9vWkpVmkAwli/
         eAGqut0U8EmqgsLFI2j9mnfS8V3YaJv4OXsvL+y6zMkjv1Gfodb8ZKJEx5+LxIo4A1mK
         FtXRnaJ8UG1ZzlimlH1/Hm7VPermCyErZNipPEmQGcU+rgjRoUzq2kkCKppRnKR+iIrH
         rvFw==
X-Forwarded-Encrypted: i=1; AHgh+RqkHqOFlIW6W2CL96gtgdbUF/jMapRFbtyJrT93xrIUiiM6iMH5HECFQU1Ozx0F5ObiyBrbTzRCHVLfXaNVMOAB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/286BAujoERJJMXji3XRUgH5IivPo1xi2Z5R2qhXSADZ1ksqV
	dhZEaCircfRQ87t6Wd1GcyKyc1FrkberdIm02OwOQMiPBuFYbGtTffQa
X-Gm-Gg: AR+sD11u5Upbg/cghPq6m7ICYk9XsRUO+4G0BPvkwU6yXLfUqiBKo4ZTrDD9GAT3R9D
	IzeAdD3eF7c5n7C98og5ZyWrvDdylHQ+hGzDN2Pknm9yWxa0Uta8w9qEgkFM3IFt6J2wIt/qET2
	8w/Ax14P8HDoy2fbZ1nBHjwgu083K5sFLnWSrrngJWMDtdaFtU4UMw60Givw4yBFUAH3QSO+73Q
	IE9EbEBEo/MNZjj7tElUaynqzOAAXcsxfzDEpue3N5m9P7jL0/WfUm8sqAqFmtXrfTAbX8XEDVl
	dnctTknqUZk6cgkOOj/nf/ZX87bmdbgDnt9HlhLlKGqRoXtRefZ2CdMfJ3rGbxqlWOambAKcN/X
	aWARYwQLQ2+syqjmjnDffPzCr1Q3tGA1BjD5D5ZNjoVOv1RajmQmkNNxI6Qt+vaJFRnK8rFTM7M
	9oqEn0iCk5we8bBxZeyZQRf/gtSusJAGqNCyzVPODBPNVQR0TS5zIe6DE9Lh6lbH3q4grZY1+Aa
	BpGFZiczjtPQLs2
X-Received: by 2002:a17:903:37cc:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d2b2e1b741mr165459175ad.8.1786343138312;
        Sun, 09 Aug 2026 23:25:38 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: sun4i-csi: disable interrupts when stopping streaming
Date: Mon, 10 Aug 2026 13:25:20 +0700
Message-Id: <20260810062521.1709379-3-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_232539_383184_3D40CA86 
X-CRM114-Status: GOOD (  19.09  )
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

sun4i_csi_start_streaming() enables the frame-done interrupt in
CSI_INT_EN_REG, but sun4i_csi_stop_streaming() only stops the capture
engine (CSI_CPT_CTRL_REG) via sun4i_csi_capture_stop(). It never disables
the interrupt source nor synchronizes with the handler.

Capture stops at the end of the current frame, so a frame-done interrupt
can still fire shortly after stop_streaming() returns. If userspace then
closes the device, sun4i_csi_release() calls pm_runtime_put() and the CSI
block is powered down (clocks gated, reset asserted). A delayed interrupt
handler would then read/write CSI registers on the gated block, which can
hang or crash the system.

Add a helper that clears CSI_INT_EN_REG, reads it back to flush the posted
write, and calls synchronize_irq(), so no handler can run past that point.
Call it from stop_streaming() before returning the active buffers and
freeing the scratch buffer.

The start_streaming() error path (err_disable_device) has the same
problem: the frame-done interrupt is enabled and capture is started
before the s_stream call that can fail, so a handler can run while the
error path frees the scratch buffer and returns the queued buffers.
Apply the same teardown there. Store the IRQ number in struct sun4i_csi
so it is available in both paths.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 4e0c2df45d4d..51173faea871 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -112,6 +112,7 @@ struct sun4i_csi {
 	const struct sun4i_csi_traits	*traits;
 
 	void __iomem			*regs;
+	int				irq;
 	struct clk			*bus_clk;
 	struct clk			*isp_clk;
 	struct clk			*ram_clk;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..fd83dbd1a3ff 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -43,6 +43,23 @@ static void sun4i_csi_capture_stop(struct sun4i_csi *csi)
 	writel(0, csi->regs + CSI_CPT_CTRL_REG);
 }
 
+static void sun4i_csi_disable_irq(struct sun4i_csi *csi)
+{
+	/*
+	 * Disable the frame done interrupt and wait for the handler to
+	 * finish. A frame may complete right as capture is stopped, so an
+	 * interrupt can still be pending here; without this the handler could
+	 * run after the device is powered down (pm_runtime_put() on release)
+	 * and access registers on a gated block.
+	 *
+	 * Read the register back to flush the posted write so the disable has
+	 * reached the device before synchronize_irq() waits for the handler.
+	 */
+	writel(0, csi->regs + CSI_INT_EN_REG);
+	readl(csi->regs + CSI_INT_EN_REG);
+	synchronize_irq(csi->irq);
+}
+
 static int sun4i_csi_queue_setup(struct vb2_queue *vq,
 				 unsigned int *nbuffers,
 				 unsigned int *nplanes,
@@ -328,6 +345,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_disable_device:
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 err_disable_pipeline:
 	video_device_pipeline_stop(&csi->vdev);
@@ -353,6 +371,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 
 	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&csi->qlock, flags);
@@ -438,6 +457,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 		dev_err(csi->dev, "Couldn't register our interrupt\n");
 		goto err_unregister_device;
 	}
+	csi->irq = irq;
 
 	return 0;
 
-- 
2.25.1


