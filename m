Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=; b=KoW0SI9pDoDaWZFxnZepNTgd8N
	t9AsNED05ISWCTyV+l9QXY8PxAwC8osKla5qXsUGi2OCYHJAumWl7XP8SHBZRjgv8Ui1toN/E5hGR
	yx6peARHs0y2t37vkDISsfFeEOqQOLWUXmaA2jSxGuhkDNU1FDDklHZkbs5Ay/E22hDmLgSa6i34y
	ncYPD8pxqaNJl8sMCSPFcMboU5RFPETpuakxDkD9FlowXOj6k36dB+mhLiT8uAXxl0cpgYGw78uP2
	rxjw1XnAtrymX2UdJKGnIz8KW9OFfVstbr50fzWVivChgYIafYKg+mwO8KOtIlb9elaX5LUA9slqC
	rQRM04XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6c-000000034tn-38Ng;
	Thu, 09 Jul 2026 17:00:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6W-000000034pn-1vbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so365325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 10:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616402; x=1784221202; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=e/pleJtpXRBbHSs0Pv1djVDCCsShIgDucaZRON4xBkiUyz5orb9XRWssNA1YyCaPYj
         Ww9ETQJsGXl4JPomCkC9hgpZ0685Y5iu1UtT0bQtAHQY0K6fD1N2mqrQmrVwcE8z+NfD
         D3ZuMRgPTl9bkZMlXnapog3kK+V6ysFMWS97d8zy1ol+1u7y5uzU4GtA0hwe+EZCTPM6
         SKNDCfzlwVhZI5vuIb1zkzjYJKq+8YerVPGSkeAupHe2ym1BjhG7vSEeY8MYsrFM0xIj
         jVnxUrdpJOHJT6Fg7asfZSDMkK/yLMGq1IrbqUww8242Mxtm2e/SLidQJa2rrmXozkwD
         ExOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616402; x=1784221202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=NPfomQP/uqQEkNIQZVXgku2X5lPl6JtbqTZufYSmFcscxImRPMV3A/FZvT/M2eR4GH
         7x2S4mrCTEuGwLdO9jG0fouTwhxc9VLo5cKZzMZkQ8gGxb+U7hw6fPYNyELec3Jg/kxB
         WuPK2L5Ad2qeU/+Apl7vUI4QQAQhIlwsVUjVNpazD+sZ3wZsyAhe+v1BcUlCB7xJMGj4
         jYrwnLzZ2mw9jc20KOZ3BXWXSzJfbW3FxdZyBbfHBk0cXfEjdiUTQC5LpNkPuhCGZhjV
         ozz1FD6dLHt4ysqtBnLxtJprXaruCJwqKyo0GEpTdGsQDFiA8otyX/wYv/XoLyaJxOC8
         5gng==
X-Forwarded-Encrypted: i=1; AHgh+RoEJzUQC+2qyzIkbzTaGKhO3kX5Be0wbhnOo/UCdMcI9AZjCQHaXT09s4wrM0hU3IF2TYTP16/p/IJDIECC5cDo@lists.infradead.org
X-Gm-Message-State: AOJu0YyLYBMmkKHu2vJrHn+UIOGqqd1eAn6OTCPnaF+TX5s8ptU9TGvU
	B0PtFhDjnK+R6pI807Z8j2t8ftKb0VcGYoFLfgGInBSEV5FZ+SzsCcD/u5f2diAVDEI=
X-Gm-Gg: AfdE7cl9L8nU/yC5y4W6Ah7eQdtfL5cWtnf+bz9QIwFWZRXxceTfHZZe7r6qqcmUpoL
	CEjoZtMFUjVkRpiMqY4RVkClANODVZ48cs0VG/r4wUABz7ocxTH0WP3P1Ut75Ki8GvpfRjD6IsS
	xXHxXYmYxcpnn/tavzIt2UZnGzvMp+URrQhHNNUDXJKzXy1ua71R1zaclOC9mmF2UTu3kTMwZnb
	70gLnOd4GrnuXrCT1fBnaZIxzH2eCIj/tQHceYeLxAW6edL2vdrUzaHIg0sTuSc+1elHWqEls8P
	DjWV/mUWtG2Vlr9ZQXvP7OjCmwfJ0i4Z/l7EtvBliI9InVoXtQuMSic8HMKTJKFzHi2VjOI9ZL8
	IEBGwNwTdphfZgn/XLfb3iUo/BgIINu+8A5GWSnAnLx9O17WFvklo3OW2LRSPIDeDI1NZcuBgKj
	8HsQgQdAVu8VgjXhj/HKWO2/hj92v03lEi+mZeKgBU5sbvpjVD61sZeq1gC/fk4YZHvma2Xh+gF
	3lp
X-Received: by 2002:a05:600c:4ece:b0:493:e81c:fc9 with SMTP id 5b1f17b1804b1-493e81c1017mr66554695e9.15.1783616402515;
        Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6e0e5asm77915675e9.9.2026.07.09.10.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/23] mfd: bcm2835-pm: Drop unused header
Date: Thu,  9 Jul 2026 18:58:21 +0200
Message-ID: <5d3ff1a1732708946761d3356eac278b1d8e82c9.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y6bzc6MD9XYtivBeXD3/6d3MOE75jA0rDhyJdTneG cL//K1BJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQAT2fuP/Z+yUCbnxxq2dG4u jzuh7nE+KW++Xa4J/taUvErt44tO+RNJrgcEdj7g2mKb93GC5Nky4+Y0m83bmzLK7zJLzb3NzrA 3fofsdNMt3+oCMw6ZzdWs68pK+Mfic/J3r5e20ys+i/Oz9Hk5VK59uiSVbKXVZi8qf3h/7dNjLz X2Jf3+fiP56Zm9yq2Hmabf7/diZY0LWN1z+snSPw1bHhq+avzmJyP5LT+q4lXL8m95ghbSx2LOe Dw3zF2TdHGGxwPeR64bfNYc1BOc0VEjPP3VHv6nzGZGoa91sl8qJHSvNDS57VEiLJ3u/aXUadkc /XW/zViiyjOUK86qnxQssVk8X9L57LW2FuMit/rua59kAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100004_513786_6423B3FC 
X-CRM114-Status: GOOD (  10.75  )
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

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.55.0.11.g153666a7d9bb


