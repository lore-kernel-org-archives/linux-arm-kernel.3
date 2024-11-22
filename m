Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCBEE65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3SPKEgnk0/CKlGg8ZlQK9CMOXwXblPgVAtkOWHzh5A=; b=flSGOW+EfT7XKZkxS7eOjlmvCC
	4ngBktXXjhxU/5JgeK6qjizalFlyridHDnthBuH/FjEX/CB0Pf4u+ImhceisLZLUlKCxEJH96RrUU
	mV4LVbmNGOQVaEMYOKmzxE99Qb7o5l7J58KVaZNbiQUBeGPL3yw9R3feUQw5C8L30WZ8c7aX46UFC
	WCrBPtaMZ8ErRrsxfjyZHQBbWME6Q1Ugp8HPsulO+uQQ1zfYte/vlP0VFeGwP8HILoqQ0ms/durxX
	8U73NL2sRrzmpgF0l483RwcLsg6vPNj9SVkdpRqWZYm/Gv6ARuH1MBluS71KpuXSGOFw6HDZ7xwCL
	3SevdYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPKD-00000001yLy-1829;
	Fri, 22 Nov 2024 08:47:37 +0000
Received: from mail-wr1-x462.google.com ([2a00:1450:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPEt-00000001x4N-1usJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:42:10 +0000
Received: by mail-wr1-x462.google.com with SMTP id ffacd0b85a97d-3824446d2bcso1579209f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 00:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264926; x=1732869726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3SPKEgnk0/CKlGg8ZlQK9CMOXwXblPgVAtkOWHzh5A=;
        b=qK3SnXtEBkeJ4necz+v+QPW5ftOIoYtwGBq6UEeXIgl07z90sYFdvZL3YJNGwz7u/g
         D7SHOH9iEQOgYLWduX5V4YYwxgBzBfv92a1aFZPj1/zYxPbqVjeOct1Hkxbju7EaTj0F
         FwEl/f8KnE6Rz9D3afQnUdit9GdKXVQXGaYTo0SYn48XdlKI5sn6BeKUqgtlVPsD4Pvv
         MvslzdN/HNOnhFMc3MGFpq8GScA/MYinKBUfj+Hxt6whdBQx7JcFuRSxmNp5WV5iyvzb
         VE25W5TZlx2XGL9eCIRgALR+udu9nJ8oELbEtM7qnfW4d1TbC3AoliAfR+eMFNlSahtG
         Z7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264926; x=1732869726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3SPKEgnk0/CKlGg8ZlQK9CMOXwXblPgVAtkOWHzh5A=;
        b=ZGFij1HyWSPEEsny2vhx7svzD2BIJ6SyAqCVnHMLDtv0tsWWDwT0thaIRGZacQk004
         XBft4uOm6SRaRTjorImuPWv/1/OEoda4aZwPg/guhjuqKeGYo3yhTfjW6xIT07SLf4tc
         2SxZPA5mV0K72N+SkJ0Oh3JGqby26vCFGPVWWYQV5yThPpuGGxVDbMRcvEgKaMer1ckS
         mboXw5khkmrw0295DNgP2dxPzD6hStnMMf3bI/MYT3h8fYkYCpaHqQwlWDK72fFBDtdI
         8pqN0AHRdLrQDAMKShA46P7Hs5N1YfE4GZ2JCagpxT5eagK9QraFkJCDydkYG8h4mEMI
         /pBw==
X-Forwarded-Encrypted: i=1; AJvYcCUJKhPvmjGf5D7RF/DKc/v+tn/E2ys+WFe6QDOE4oYT81nRwDo3YiEXw0xfJ5euuXFwK9zzPS0AbVhDrspqn+5g@lists.infradead.org
X-Gm-Message-State: AOJu0YyspTUNSVwNWZLdcpTFSIWEuJ46O48/DpFhd9PxO+Z92I1uIlXe
	W2EXGRO6dIarLwCkHNjwV0q8T/asGVxPsBQ7SB2YXzgPEUtl/M+IH6DDzO3ywu1bPG4fmKg99bj
	xlB1hVXEpxjDfeohxvXj3i1yz7F9qv/u3
X-Gm-Gg: ASbGncvP9effA9+y7rpsGR7wRmi58oRogIyl5f/a4WRj50a2u4v9iku8sv8soDeqo3s
	PuvLPPZesGx1STGrfgiv199XpfjkUuw/RmFXjoDDkW10PPlYiPmrP8cuQTe/6mU11kDrseYFvBH
	CgrJtd/QVBA0Ech0UVIgNBarjMcw99AMb2ARxBcWeU/Cwg4pUQ9wUXTxm8Wy0VZoo5jTPqnEI36
	EsmA9rmH4KuKwb1M56Qs4ACmbBN66/0VlZ3zaLmsA0h0r3h81b8I6ycHPHwfLZOrg==
X-Google-Smtp-Source: AGHT+IHmji/NlhW6PAvhLcBhuxCxYDetKytLXU6htY+yIaqQpm+gV+XdE8J9vax0xtcHo5/qC5bhqV9GxA4x
X-Received: by 2002:a05:6000:4189:b0:382:40ad:44b2 with SMTP id ffacd0b85a97d-38260b8b4a4mr1324154f8f.34.1732264925767;
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433cde98a88sm1124745e9.36.2024.11.22.00.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:05 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 4/5] drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun
Date: Fri, 22 Nov 2024 08:41:51 +0000
Message-Id: <20241122084152.1841419-5-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_004207_566184_B08B74D2 
X-CRM114-Status: GOOD (  14.65  )
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

The Unicam hardware has been observed to cause a buffer overrun when
using the dummy buffer as a circular buffer. The conditions that cause
the overrun are not fully known, but it seems to occur when the memory
bus is heavily loaded.

To avoid the overrun, program the hardware with a buffer size of 0 when
using the dummy buffer. This will cause overrun into the allocated dummy
buffer, but avoid out of bounds writes.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 550eb1b064f1..f10064107d54 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
 static void unicam_wr_dma_addr(struct unicam_node *node,
 			       struct unicam_buffer *buf)
 {
-	dma_addr_t endaddr = buf->dma_addr + buf->size;
+	/*
+	 * Due to a HW bug causing buffer overruns in circular buffer mode under
+	 * certain (not yet fully known) conditions, the dummy buffer allocation
+	 * is set to a a single page size, but the hardware gets programmed with
+	 * a buffer size of 0.
+	 */
+	dma_addr_t endaddr = buf->dma_addr +
+			     (buf != &node->dummy_buf ? buf->size : 0);
 
 	if (node->id == UNICAM_IMAGE_NODE) {
 		unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
-- 
2.34.1


