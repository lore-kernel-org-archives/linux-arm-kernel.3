Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C391D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OeHJ5VmorUPFsKfp3L5ZEPCj51aQDOtY3qfB7PKLqU=; b=Q2zZM8jIhiJoaLARF39qPTWpmM
	apEqi7Rh5gpzOnmKHg9mLj1oRbZd8uhCwjYqZmo1X2UBaemudEhWn0vfzV026YuHMwDgtktfJK9Va
	AmdsagZCgOD9EkR9wyvW4HKuDT7jl/PhElf06u8DdhjEyIb9FWEiY8M0dv1v36alkeJyEG8+aOUx/
	lGELMZKu76KXRp3gbI9BmsWb7OGYE3kPytp6XGZeYi9a95tcCbjfIeyGv6alWSI14isgHdjqo3dW8
	FcS5/kE0jjveplGnEAqUt5Maqq7Gv4buCXl5Rzg9bxzh6FKeIFhkHQGfcQWMnyq7vqy+KpDelpCwh
	MHaRulvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG8L-0000000D02a-2fDm;
	Wed, 27 Nov 2024 11:23:01 +0000
Received: from mail-wm1-x361.google.com ([2a00:1450:4864:20::361])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG0x-0000000CyIm-2E2j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:15:25 +0000
Received: by mail-wm1-x361.google.com with SMTP id 5b1f17b1804b1-432d86a3085so60344625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706122; x=1733310922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OeHJ5VmorUPFsKfp3L5ZEPCj51aQDOtY3qfB7PKLqU=;
        b=GeXEyZ3n4K9aFQ2M63IyPLAeEQ6qJx4Cyc/ptZHwYzOkWwkiH2TK1mzk/Hbw8EGYLZ
         w7E95QU2pxGW4AZPr4VPadeiVxtWAjR85X7rNGJyo+Pu/3TPxQG7uVufmhuBJGnCqS9X
         J8/YsP7OIKMYgKlsVHNzU0CRQ/zNBuVF+Li3AoHYJBAkzCcfFOf6S2JycTGPLU0H+ySv
         BsC/YTM/n3hUwQLROaS+kqkBrwx2HP1JDlTL7YGACwtveD5BX/r6qLa6eGR+aHECbW47
         t8FJkyxiNqK1nGIt8Wz3cuwVFBBQ2JeNVaUz6toGHQBBwNsCEJFdvHhWrDoSiPxxDbOK
         WOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706122; x=1733310922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OeHJ5VmorUPFsKfp3L5ZEPCj51aQDOtY3qfB7PKLqU=;
        b=fZoYnVmxHbgGg6qDeTJ59VUhKde7SETTRuNujBmV0HoUuyw4SPILLar29kxesVosd+
         4IKoiR4DamVETaixjCTjtNxf/MXdGZaeOgB0gZxHeTTgXZDb0faA+6biGJbzcag4r/v6
         Z5cv61KgNhBqMvyNaPAEIdcYQ2P+TwY/K+zG+BoW0Pv7Np0HeQVeXLAXjxD1aDJ47lPM
         6/dqXPrYyjBL+Tbvb5tRK5e7oHTICOfhsRvH3AXk0MywZ7uBKliQ95aKHUXk5t1AIMwG
         VVaILm+TBguSsHv45f+zULgHRAOxVnTVkzRcZgAuSfld0wL812lJebPoRhpYAxp5Hq77
         O0mA==
X-Forwarded-Encrypted: i=1; AJvYcCXO8rk6b9Q4ha0Kd985QNh9IsoXPdwFuLNMvpm0bt85Kp04P8iMstlUJU/L+JPo8/EQAMR0nCDM7vEvlin/d0us@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZWwWFFyKHz9SKPxi8QkW+UWJCGm2UnQbu/BnpgIWmDmv1FKf
	MMQ0Ygkbyn74tWeHLptUKIu7pBB3PgJpMdWh79QhIcVaXbYRjvxcgI77ciPMczXfr1zdXcZjvfW
	UfF0wAD6so70oQSEhgaGM0dIhMeVNI2N6
X-Gm-Gg: ASbGncsOXEjWTXKltI+8HaQNM3JjykXr2HenwIroSF/e8Eg6mL4Zkcp+POQbws2Hg/y
	vS88xqL7f8QY4pfTuHkUTg2aaG+t5kKZaBep65h8cDhnSA7Hj78SPZZtqdHWQAhXM/ZCb86nysJ
	fomE/apGqyQ8Qy5f9Vj4hTQ3C9ROPh6kuW55r9Q88pf9ultXU8aHFjMKydVav7bujinN5bCsjPE
	6KljtLAS5zLbr4hsW9upAYmdRBzoK5JeBBqZ63lkX7FhcqVxrWSXjcdnWyaLBzMBw==
X-Google-Smtp-Source: AGHT+IG8NIxF+WfvLMMyexhQ4F78Jja+ecK4xzKxkdy9lOD0O56mEG25LOMSGylsAkrpJskIxuI6TCXFkAK1
X-Received: by 2002:a5d:47a4:0:b0:382:5066:326f with SMTP id ffacd0b85a97d-385c6eb72bamr1917091f8f.17.1732706121697;
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fae4853sm441870f8f.4.2024.11.27.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
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
Subject: [PATCH v2 4/4] drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun
Date: Wed, 27 Nov 2024 11:15:15 +0000
Message-Id: <20241127111515.565992-5-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031523_575059_774D49A5 
X-CRM114-Status: GOOD (  14.93  )
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


