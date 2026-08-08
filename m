Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF54DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VegdV0CGVtEAsdoGYq2fWs6TLBlXPmk2Egy9/veY9KE=; b=efixjVaJz5jD6676nqP0VBs6R9
	GwAuFD6azJVdeZBeIYcPLNm6N96aUW5i+hbxNiq5SLnd8T2fmdsuvLxIUAPagUZmoPXNwDocDNcfL
	UdpMYkNNRtUowaob/yzL4BkBZHJwF/ZqeawCM+D+uotb84dvgga0mJTbPruUx5DaQjkD5RCuwpFtV
	8aabyxLoy8cMrsB5qnTDrnUZtI+LVqGPI5YATkyG4BT/MZP9XOZaP6gLhi3Ghcwwu/8vJXyzKo0Ls
	Hb00PFFjkL4Xjm0lERERmNJTYgx3zBxZaNMWtbFdSDsSVSHfjQqwF+PE5z4hs4xY8mjKT77nhnoPI
	YGYHoxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf3M-00000009IyI-1q0v;
	Sat, 08 Aug 2026 11:17:24 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsf3J-00000009Ixp-1BFy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 11:17:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so249177a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786187840; x=1786792640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VegdV0CGVtEAsdoGYq2fWs6TLBlXPmk2Egy9/veY9KE=;
        b=ZVQ0cvVPKHmXzD7n+g6HVM1YKVZmZ0lH6XG//0XZZeN6rAOSQE6S9pIKdBRX1BuFnk
         tLWYdH6ZExb56yTwn8FhCHlMzXNGF5nVNlKGc/3p2vgIibnKYHrqJ9LLM6rNDpLtO3Kl
         /uZiPuK8XDdoAhIFPpI2F0jhUQhplNypmXoqFpWD8pPT6rNRxeHVn6h6EHvW3PAguL8F
         UMVEcVqkwFiTQodhYzLr7F3y7ysEhOPglOz1jz15Y0kUlb0yvr/nCathpB55JbH5ehED
         KSGh6NVQxW8N14ZoB7sNWgdpWx2X0D0+6vnj4fg9JKMFu30ryT5uqykhKlE6CvyC/DYJ
         GGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786187840; x=1786792640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VegdV0CGVtEAsdoGYq2fWs6TLBlXPmk2Egy9/veY9KE=;
        b=K+L/iX64Z7zEpY4St129nywivuBMAbZtTTHHC2Casrb0B0yN4X9gYX5vjWlXplw1q6
         BKYAnx+xTRf/3Y1BQoT9Xk2UJq3CWl68IyMCKi9pyqNGhADG5Cz2KFx9WAF2zoHDdklp
         +NTauCp5aMqBfWh3smAu6NMlInZ7Lr7RCw/AFRXyAwuiR8SvPNAH2fschDILHdlb9UOq
         ySfVs7nEmkmsvfQS+mpQcfr/KBYBOpXkZ/ZDNXiH29tucUOiINapsL+3GvNPuBdVGDPR
         MrAon6T8havd0muvCCa4uwbiKr13S9X4bnVDFmX3i0AEWVgD5O0KUI+RGHTKx4ds3PiA
         swmA==
X-Forwarded-Encrypted: i=1; AHgh+RpU8fGbhsaReF7RBpCodazGJ8UldujSsukXaak4AIy5dvrm48NFmK/GvlJRZFlhjjnnThLx+2XODDi+nWnNmfJi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4tYQEIbsv0Jkcbdp1M4yiPatdyecbLBXNIK8DIa4lDqisPv1L
	H7fvSDN/SLGNlZ2vxI7PzW8TDegyvF7OEkPK3gxaFx1wXn4Qk6YBLObq
X-Gm-Gg: AR+sD11kyN+QHEr5wLofgmF7faWAByoby47m3vxfzlOpW7zc46vIzp4N0GaOCKI+QbY
	LGnXkp/7vusxaHpPh4BQesVrn0bOlHqrILauCgbV7w+2qduh7LegFzDKL7n4l4/9KoOPSkFaOSc
	YAut3dPZSdHdpLonbkhC7GXY2jLaD65u1CwHvp2/qNREhTCPmFGt+92z0rcyrlsNMs9qVLMI4uy
	KwblFdjzEn6Km794vI0V2Hf8T78QuGqE6upLFyAeyt5315XQJnr790TT+4yuUCpyAjCMufeogzR
	iQSMh5WG4Wi5D/qAYJ1jVtPPdn4/lFO2loiGMgRW9SMvsztoFhhgLPcx51qfsSxu9dsSrhpkrU+
	NZN7Je6MKjvFnahBedRK8u/3v9EHE3+pHZb8OeigEd7eZTXVixLpdU/5JrSe2BZVpizT0b1j07q
	EuVADtRHe8TqAIdKWCT6ZSc4lwgCPDnpqZsO3e6BYsiikc7cWXaKEtUZ9HGpdscXbXSJPeynKtr
	Rvy6Q==
X-Received: by 2002:a05:6300:141:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3cbd3ac3fbemr6024104637.11.1786187840297;
        Sat, 08 Aug 2026 04:17:20 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebdf796sm17179976eec.22.2026.08.08.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:17:19 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 2/3] media: sun4i-csi: disable interrupts when stopping streaming
Date: Sat,  8 Aug 2026 18:17:09 +0700
Message-Id: <f0f044148ec5c160d76e6e38d1f53393ec56578a.1786184456.git.congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_041721_322155_DCBEB100 
X-CRM114-Status: GOOD (  14.88  )
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

Clear CSI_INT_EN_REG and call synchronize_irq() in stop_streaming(), before
returning the active buffers and freeing the scratch buffer, so no handler
can run past this point. Store the IRQ number in struct sun4i_csi so it is
available here.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |  1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

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
index e911c7f7acc5..da697f39f2bc 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -354,6 +354,16 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
 	sun4i_csi_capture_stop(csi);
 
+	/*
+	 * Disable the frame done interrupt and wait for the handler to
+	 * finish. A frame may complete right as capture is stopped, so an
+	 * interrupt can still be pending here; without this the handler could
+	 * run after the device is powered down (pm_runtime_put() on release)
+	 * and access registers on a gated block.
+	 */
+	writel(0, csi->regs + CSI_INT_EN_REG);
+	synchronize_irq(csi->irq);
+
 	/* Release all active buffers */
 	spin_lock_irqsave(&csi->qlock, flags);
 	return_all_buffers(csi, VB2_BUF_STATE_ERROR);
@@ -438,6 +448,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 		dev_err(csi->dev, "Couldn't register our interrupt\n");
 		goto err_unregister_device;
 	}
+	csi->irq = irq;
 
 	return 0;
 
-- 
2.25.1


