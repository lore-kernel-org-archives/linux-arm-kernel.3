Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9F0CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 01:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=; b=wFnUXtZ3HqghCNY/Ec14kYLmvm
	h0V5lh0knWC7YoFg4aYkELktr/d1MWqpfNAzI7py/XrT4HxVY8742KPSPnJK6EILEvSD5j3v4D2dx
	iIsGdhL7+Fzv2zg8tVB00XcxtwzhTx77IqVu5zhK5ZOW0MTVTZHTMZiSY+VkGJuECR2cFYgXHBuix
	GeDVfknQGLMsq5RLakg1j/QytuV2fHArquyc6wSPcXkxO4jNiOOPOcYDNq2qZ3qVnpD7K0Ib3ukTX
	ZxZimNXMRT/9psBsU7fZV761VQqogK7y9ZJ4E3ZMH+BnY6LaQb+/vDAhb4d5cqD9biktGkdT4Won4
	Ojjq+sBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWcL-00000001gTX-3uWP;
	Fri, 16 Oct 2026 01:20:17 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHWcK-00000001gT5-0N7k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 01:20:17 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93f1e5d7450so2258285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 18:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792113615; x=1792718415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=TJIr5wVhdCy7nkXDLiAL7uNg0b44EG/3GD8RTIX2ij2UnML4LY4YeKLX6adnr4z16H
         1zXkdHdrH1MbMmOZ3ZQXkXaWZqZCYJnNoGaNRBA1jqa005i51pc9KNpPSNRcI9SyoqVK
         CdlsqptZb0DotMTx2XfVGE9J+6d2O5sLlycrtJLrCKatli7jdyyHUHUSaWyVO7zRgImd
         4pJbYENAlmVSzLa+lGoeUAcoVtMEACy5nY701ylMX0RI2KHEkNCaA1y6UnMgq0NWpbhj
         YCr8jPicKVc093GFrFVheZ0BO5bvbzYkK6bLsWgrcd++8Zp3/V9KmF3hKFH0Ysj5vpus
         djnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113615; x=1792718415;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtpsWlwRVaneZFjF+7ofxpGp4s57Txr3eN6Q7YNC+/E=;
        b=DXBDsPZ4mfvKxtoi6MP+yT2uuN5D2AZ0YBufW1X8lKvk/M2qJYh43H60DNQuz3bkxU
         761cIpSn4qLJVjrh1OB33fLWM1vDOwPffCbaSSctCYc+YaMnGc/f5Dagu5+1U6ZwHvMg
         wzzdB3JU5upK4EUqfhKxks+igrORbalIkMVK8hMqSGi479awyDpZKvx7gOtIod9Ho2Rq
         v8ZIugwxFlEOfchdMRSHVkjXjBiMcNOdXZBToTSwlq7xuqb+Qdt7WDYrKeLVrp8CF83Q
         KEW1Pg3vIzq/e1jR4WUIU9vYr0jvobpYF/6OUMsieRsicUYGnp8FoQKtsf4AVfpDF73X
         pQBg==
X-Forwarded-Encrypted: i=1; AKwUvBw/VWxyzrYwi2iDQzT0A0Trl1nb53hS9HXZ+7jf1S+4+onB3UFTJDgX7SAHFaAhg1ha//aiuklDkJYRTaPrLg4h@lists.infradead.org
X-Gm-Message-State: AFq9FYIwMuONzzxkVHna9cOJU8njv14sWzU84sNOxaioe0aBTAwkRNHa
	Tfs9ZfRicKvt32EtlcGQf+7IEKYZ/dG5GyhmNRAb9Q0nMFtuU2xbjjQM2O7kVLE2FA==
X-Gm-Gg: AYBFou2BCDkrHVh30uX/ZLq8Friu+j+q8o8CoyXyZ7CwIct/9ADaDoHc1XW46ZJbCCO
	yLeSX91qTZD1XEkvmvXbzlOVlTw373RDUnOCHvIR+6/Nv7KKqCtjKzR4kk/ZT8AQiGC9jbgtahH
	/DBJJt09vG5SOr92opP6tuwrOJazNjjSe83UgG2+sBZh2p8apx6yy9dlppmYJyY2yOngzExiAk8
	Xk965P3DN+I6lajuhbSJZpgTH+0z/eGeKWGpmM5xiCbDnmOtVjrCP7K+TIYOPrcbRtRViobVYEp
	v3CvUa6bwjHY8+Upg9ga0NmXBgoilG5lkd+T508j7oZ3vQ0OBUkehXA41vq4tX5JhR/AiMYfjD2
	uO+wMFI9O6eJDroNvY041nTmlMCQmFWoVXYbvyZ2GY3MwrEo02bYSIsXTgfL2AXzfULswsyq/T+
	MWWO4hilDL1n5Nw6GrL1yJJ6Zx8/gn+lpN7zUpKypzjSBlPvAHPSOVgyNj0ArtORHwYjIjzO1tl
	yKTONkq8Y6OrKaJt4J0EPsSFtUgy5o8d1dNlhJmnlT7ri/CDg7yx4BYlG8YXSWJKSnNrQr4DJIO
	6ae/IJutDxT8VMg3F0o/IdyHB420
X-Received: by 2002:a05:620a:6c01:b0:93c:23e4:359e with SMTP id af79cd13be357-93f1891428amr288853885a.50.1792113614608;
        Thu, 15 Oct 2026 18:20:14 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1a990fsm76619985a.35.2026.10.15.18.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 18:20:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
Date: Thu, 15 Oct 2026 21:20:08 -0400
Message-ID: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_182016_145383_AB798601 
X-CRM114-Status: GOOD (  13.67  )
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

The threaded IRQ uses the reset and clock resources, but it is
registered before those managed handles are acquired. Reverse devres
cleanup can release the handles before the IRQ action has been removed
and joined.

On a resolution-change interrupt, aspeed_video_irq() calls
aspeed_video_irq_res_change(), which invokes aspeed_video_reset() and
accesses video->reset through reset_control_assert() and
reset_control_deassert().

Request the IRQ after reset, clock and JPEG-table initialization so
managed IRQ release precedes release of those handles. Add rollback for
the JPEG allocation, reserved-memory association and prepared clocks if
the later IRQ request fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
This fixes managed handle lifetime only.

Compile-tested with Clang 22.1.2, W=1. No runtime or hardware testing.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 drivers/media/platform/aspeed/aspeed-video.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..234001a93ad4 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2232,14 +2232,6 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return -ENODEV;
 	}
 
-	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
-	if (rc < 0) {
-		dev_err(dev, "Unable to request IRQ %d\n", irq);
-		return rc;
-	}
-	dev_info(video->dev, "irq %d\n", irq);
-
 	video->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(dev, "Unable to get reset\n");
@@ -2286,8 +2278,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	/* Release the IRQ before the reset and clock handles on devres unwind. */
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_release_reserved_mem:
 	of_reserved_mem_device_release(dev);
 	clk_unprepare(video->vclk);

