Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2CEC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=; b=XkIirkwNYS1WhrrUv3NX7ah8Bm
	C3t1jEv8rctdM0smib59ZGhKKSGIEhC7yDTWs0WruFhaTZSB7M7oY/H08kLsrTFmKty89G55BIvVO
	nvINtjA3AR/Lmum18QYMTTh9WHvx+QztnTOr96Rt8q3TIhn0WQzIu362UcJC1ym74LpYfK00AlJ+d
	t9bNKn74+klfNuLWDB++KMPDuMRs8Xk06NakpqR8aqJf3DzKJOGUk0YarblesV6TDACJrK0VG9DSB
	ea7c0W4qTafqtZNX/hN5YT57mzDZwpaBOZ61JqoiBujosPVmsXUdrWt+PBOpOO8a0RhuujKX8pfD6
	F+33+vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uOE-00000004PKX-3SF6;
	Tue, 22 Sep 2026 06:54:06 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uOC-00000004PK1-2YQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:54:05 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so2858300a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060043; x=1790664843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=F4H+oJJd+jp8MJMfPR2Z7Vuvekxdaywchmj6cGoba5Wgf4xg8Xf/8Hwu5EjElL0gIq
         9JGZSYtHazT1b3uvOWdh/sODhqgEFGjeGat6muNbEgb25rDRZSOIqLIhLELtq/1RrgG+
         9me970o+8nfyO0nx/bxleZ9yw3+OL5smT6Loew2KEtyBGSD9gMRyrecnG9K2T0j48aFC
         x8lew9TGXh2W4mXhkzJhS8d+zAjRcO2zde0K+JhVveNqUYgRyysFL4wBzOxI+m7VJvwr
         B5qwkx3em1lp4GcJxO0MDTvHMv73enat/mFc17o6ngIsfWCW7cgw7drXpklwDC3GYuKT
         KLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060043; x=1790664843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=GtS4PcmNc3BhLjaGT2LI3NBG/muxoMs9YRmlJ3OzFiEfFwZuXbI8gW9cik8paqsF3i
         vkwgKp9ZtaFKXvc5uCAc1Tjt1EaRuunbXFTXR47yJTwAcqh3kVHwXaoasdaBfFolTRyK
         IZ6uMCXC2Z0wR7xLl7WtJ8sc9pEQAceE8k1q7m/mLlYiUR3edBc8EChob4VtS0yXP5Zv
         8ka7w0goiZH6ed1L6eJDeQcEGDLqDYsq7rxrBnUTLxVskfmsKKkGNRpKBrDz5oZhjrTm
         Zz9b9Ro1f6QKtK5umLN6Ds7i2ufJZn0ODAXs6KM2Re4h55AAp02Sk8JN4HHc7gUcFbIW
         nn+g==
X-Forwarded-Encrypted: i=1; AKwUvByzK23zCeLPb1If9OxusDdElgv3bTzXzajT8apWtWlVs8JoF9kUZc5XRdU3iG4tBKrHj+t8XuC9XN2os2KkFPhN@lists.infradead.org
X-Gm-Message-State: AFuF++nwGamzINalYumdpLXOMDcgkX2hCkDedKy5TIy/a7T+98TY29R/
	5gYIpnR1zB0FyDfRp2YMYMDXFzq5T+TabeA/fDXh0zl8ou1KwgkJl5Xy
X-Gm-Gg: AYBFou1sqSfBpC9ELVDNxMvO/6+TIKdstJ27d5lRU3BzGPQQBc5crXNguVzgx0vVAlb
	opm1U3G3LMI6BPv7cqdJM9MQyJjLePJnLQk3Nwq6jOsN6Spw3CTVf+R/GTZZ0DSon9lf12S+Zb4
	TFF96lc2nYxItZg+9X+sGnDw8U+tXhBScUv6hE18/o3y0obn8gh0Gr3D8JiWtL7+BLQzE6jZayF
	FduBxnmbJ5vcll1OcmKob1Gz+kOdorfEhM24zesgCyF+ISNnmXpbNnFy/UZy1Z/lfOxe5+Eq4pQ
	BPSjUy02Z5sbZKepgm35PiMgMSlqvSKwlDW1nyZ8NxBvydROkCO/twoI9fT3JCyAJoAQq2knQuG
	Tin1K1nByTS+sAP6FSWX3uRTGkFJeuOqYOdPGGCBEIm2DSZOMw7vix6fkHOjGOxoWbxB5SHLMAT
	nqMHkO6u1PxIv9yYo3I/nQxXWNsVhp5KBf0e3/S6oVS9JDGgTzBMEZ8XFi2AKsSJ868bceTZoBc
	V5q5CqVTjnIjL8MNEp1kPUgnlWt84d9Ymc7EZl2ycPXO9/j7dpDVb4=
X-Received: by 2002:a17:90b:17d2:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a0730d284dmr234403a91.13.1790060043143;
        Mon, 21 Sep 2026 23:54:03 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e70asm1952078a91.1.2026.09.21.23.54.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 23:54:02 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: lpc32xx_udc: Fix a race in lpc32xx_get_frame()
Date: Tue, 22 Sep 2026 14:53:57 +0800
Message-ID: <20260922065357.18103-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_235404_653375_20D054B6 
X-CRM114-Status: GOOD (  13.40  )
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

lpc32xx_get_frame() tests udc->clocked before it takes udc->lock, but
udc->clocked is cleared by udc_clk_set() with the lock held, for example from
lpc32xx_vbus_session() when the session is disconnected, which also gates the
UDC clock.

When the test passes on a stale value, udc_get_current_frame() then reads UDC
registers whose clock has already been turned off.  Check udc->clocked inside
the critical section so that the state can not change between the check and
the register access.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2403,10 +2403,12 @@ static int lpc32xx_get_frame(struct usb_gadget *gadget
 	unsigned long flags;
 	struct lpc32xx_udc *udc = to_udc(gadget);
 
-	if (!udc->clocked)
-		return -EINVAL;
+	spin_lock_irqsave(&udc->lock, flags);
 
-	spin_lock_irqsave(&udc->lock, flags);
+	if (!udc->clocked) {
+		spin_unlock_irqrestore(&udc->lock, flags);
+		return -EINVAL;
+	}
 
 	frame = (int) udc_get_current_frame(udc);
 
-- 
2.43.0


