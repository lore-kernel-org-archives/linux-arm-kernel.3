Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012C7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvI5XrhZFZI6TMOTvbNxHG6jHvhhtOJVngky48pbbec=; b=LCWT1l3qmFBUecR7fFs0y+ovp1
	CfmRcdXd9pvXclyo4Rf+IUmpzMmBM6VJwt1FHY5CcfrwqvCcxqnBirq/BgdIR/pzIt+/d7NQLXuAx
	1KSdvnybIQ+0/YXaP8IC2uzlSo2HLc1rFL4bh0V/Ak3AF1xYnKpOP9X80REt9rLRnn+HZnBvOCcMe
	ke2IFwhQwP565PzbrDY3t+WXlDVbppzy5+bffVNOHZ4luFNmia4swU9cwH0/1xWyvJyUlcnwabTSO
	vy1QJ9JHp3hIMSbT/y1xlJEPzokUDhfjJzNhCi6vZLf0cl1zCrQZC7XTvvCZ6Ljqm21Lq0hh3kIXV
	E9+vD0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9O-00000006nwt-0z0b;
	Wed, 10 Jun 2026 05:06:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB9M-00000006nwS-1w9G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 05:06:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0aa420401so48949645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781068007; x=1781672807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvI5XrhZFZI6TMOTvbNxHG6jHvhhtOJVngky48pbbec=;
        b=jUjNnPWlbR+D5wURsdJKfO7aSPFbUXdC3ZZKPvvKxcmCIE+bEd82zy3QqKPH/zZTi0
         lTDtCAYDwCne9xXsCTU53pqNiO+aXCIYcJPeG0F5yt/z2TKrPU5b/NgkO97AZeNbQsM5
         z2UZWiJqcXbwDPazH2uOsrLCvwTnmyeOwx5qu7Wpx2mNWNX9J7HJXt8t5bao3OEOKUKN
         EOFdRlqX4Kobl6kKEhgW7Hn5dB2I5rs5Bl5QkKb7PBV8UxqY3qqXTkfXTUUXer0Q19po
         l2/DVsjtpMH0qnj/ez+Uw/lt8ffF4jLV/xC9UAdLKruddGhI1nNAnmD37ljcjbAChosc
         dJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781068007; x=1781672807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HvI5XrhZFZI6TMOTvbNxHG6jHvhhtOJVngky48pbbec=;
        b=Dz89DJVzSd98uOOgFPIGVB+ZjgIlG1WSwFuzcFsr2Xu1i6Qegfx+U6xgumRaMHvIRi
         kfvLzS3DC9+/5aUZnc66YdS7/lZVRYvGlGM1UpOliUHw8NJYOVZwiaJNS92DegL552ST
         6JD5hObgB0VY5WyrWAK9+zv60yymgSScVRtvK+d6InzymR1z8Osg+z4P1Qnc3iNy4dc2
         dxnT1TFq/JgkpqKJEHHxTfifKDVsBbZv8XxeErY55TFdUnmEugxP2Ms7ZwrcQrZXLOr+
         9u/n+UkJmEjXc4OEwn+1mckncjzS4ms+JHl+rfK7+cE06PWH2ho6UkFP3QauF4joH5/D
         8gDg==
X-Forwarded-Encrypted: i=1; AFNElJ+XTiZfFi7xHbDvgApeukMI83x9Xq4KcZtsRRV1oK7TXBMH/InaohMp127Cyrah2aw1Y6dyUwNOsEZ/8RWbj1Hg@lists.infradead.org
X-Gm-Message-State: AOJu0YyhKHDNuDzlFfdWNSvr19WSHGq7oHPBRTbH4DiQVK/umlhTZDse
	3J1ZEIBetgH+5AQyjWIGO9ccr04AbqFfntRJPJKrr9x3bYv3MccS3iZw
X-Gm-Gg: Acq92OEoq4IY3YoTE6+5XN5RaI90X+vbjT4y49K9PSnyVU0e1WYBrNtmV1Guw6C2AF1
	v8KijKETa1mB+JL5jE7xFKgJFjct6n6LT1ouQdC8J/1Lf2TWTNmxb7Fe/a0ivYGj5kj53qrasVL
	jgOnmqgQCOoyu7d6S6e02q7Lon8p+vYi9Ult/Ple28Hqn4zEUNSWTLfLr3Ynih0KRBLRlBqZ6ef
	3A5YqRRuujcJJcCPp6IMRyxhMMCdtvt1vZ6DZqk2ZQTkEr3jf9CnGH3Z5mZoc4GygckWPg2W+Ye
	chsf+tXSi+kXVw8EWnLHi+HghPNuD6O04VXXj/bWgy9BDGViQo06x88xTW98+oONmjoKAQ8o1/u
	+mVAbu5NyviVbzqgouLpbkdydoS672xHfZ47OUlMXfjvmutZwc0LaZkXwwnis5P7xNrRHzXXUpT
	HaV3RpOPhVBrHsZz0BC26yT+O6aMhcyRBW790e6xknSRjGKaOYJyZmxMVCjy0GI+UMwP0R0sk1H
	ijt/t80R+Fiv6qkqKIrqr40oChYFAVmsOzm+4eyvByKPsy8Cs1C1A==
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr200649235ad.29.1781068007320;
        Tue, 09 Jun 2026 22:06:47 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm245342055ad.5.2026.06.09.22.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:06:46 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 1/2] ARM: imx: fix device_node refcount leak in imx_src_init()
Date: Wed, 10 Jun 2026 15:06:24 +1000
Message-ID: <20260610050625.2229221-2-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
References: <20260610050625.2229221-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_220648_527984_9EA33515 
X-CRM114-Status: GOOD (  12.05  )
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

imx_src_init() obtains a device_node reference via
of_find_compatible_node() matching "fsl,imx51-src" and uses it only to
call of_iomap(). It never releases that reference: on the success path
the function returns at the end without of_node_put(np), leaking one
device_node refcount on every boot of an i.MX5/6 platform.

Release the reference right after of_iomap(). of_iomap() maps the
node's registers but does not retain a reference to the device_node, so
the node can be put once the mapping is done. The early return on a NULL
np needs no put.

Found by static analysis tool CodeQL.

Fixes: bd3d924d71a4 ("ARM i.MX5: Add System Reset Controller (SRC) support for i.MX51 and i.MX53")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 arch/arm/mach-imx/src.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/src.c b/arch/arm/mach-imx/src.c
index 59a8e8cc44693..f28bfb653a88f 100644
--- a/arch/arm/mach-imx/src.c
+++ b/arch/arm/mach-imx/src.c
@@ -171,6 +171,7 @@ void __init imx_src_init(void)
 	if (!np)
 		return;
 	src_base = of_iomap(np, 0);
+	of_node_put(np);
 	WARN_ON(!src_base);
 
 	/*
-- 
2.43.0


