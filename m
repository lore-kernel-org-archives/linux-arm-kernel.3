Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D017FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=; b=RggfrUZzwRTD7yXmwLE0JH7DQU
	juE8IDykp1Gr3NYaJzO5mlvrnCS3qpy65M2+EaVrWmqMCmKnbtIKMx93gy1rpOPwZyx89qfzlIVwE
	vDjxt5ROFjLyaaBAGFBAj79jx6qxn4Qo5tMoBy/9dzJ8GKbHsXF267m89vZi1rI30fkBC1xRvz2ns
	UalT5ANt/uvUDgjgFoGAxoYwoqzo+CFe8O1lEpJXbNbT2CxpSrH//4hqM+fByM0YFNnJukxqFjFK2
	B7VPS2fklP34+wFSVG0WXFKj4kH/slaP5womYXVW0G+GxZbSU/6UCP7+1NC6lMQ1E/xfnwtfBbdbm
	poqoz+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Dy-00000007mat-0EWD;
	Mon, 02 Jun 2025 15:37:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wM-00000007k2x-2Ml1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450caff6336so26706035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877545; x=1749482345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=TrD+ImTtZk+P44VVyeYBUnOOVrob3/r/nY3PeEUDem2l1qSnIc9SJHmtbBgItORS7f
         nmAlIcBwWMY6pTvks6zXzrJi+0ddvjt1TFSD2286NrqBqUfYViOUZVmEpfNqCWMvtkXm
         zB6YC8TOCKcQPZc/t5Od/gToHUydiw33/d6yNVf7XnhFw/JL9UAzAMOLvUDgdndf2d7m
         +CqXfzaYm+OSFMyIFmVIYvuieSRKXLNoGVNyBWR+Ms/H0xL02Pgf8Ma4ZBtiVjsrEeNS
         Pmm08Jy0izUd11FWf0OjRktCMHdag9KQQNAM73uHR7atqzne0nalJl655mZhdgFRfOrO
         vO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877545; x=1749482345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl3s+9qrNZSInC+4si9W3B7aYz8t+YyXNiXQyckQzoI=;
        b=LrgUoLsvN5qEgqIgAZtVX00nyUPCDcbw6domhRGtOOIFoK8eiJ3Cv1sjIi65uY6K56
         4vkTvvudBzglXiZBXeHHtmjMR7xwgl2xCVbCjr9x8Sr8nPIbgp/lW1tHYzbT7UsPfk5C
         4QbGzXwdeMLpbF2HCmBG6GZiTaQY6E3dPMPkXrHYlJ8X8m1wNAAw/9SgEwyl3QsCTz8e
         yaMdSrHBm2aavxt3rQM+bgR+ZWj06cOpO9P2rcLW+4SUAA0PGp8RhBGsb97Vw0i9XWcd
         mrv7iWTjvV0B+7iBNqU3uyB8gs//HT9BNk3br752Z+SzlxSYWQ7rJELW98zpjg3027ur
         qxRw==
X-Forwarded-Encrypted: i=1; AJvYcCUSyItvBbNpGtJmGVPPOaq3eV3ZllLCh0gtsqo1mbEXVZM6rjupGJC2yCOr5zSCupYkcLJz3A+aeZ0kEjd91PZ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3tnPlzhVIcXisoKEPt4k5Th/CIgBqkjz+wYDmdmfQrGx9p8VA
	KS5AGDl+GM3P+yp8O64gPvqmji0kryXb0quHy4tVNT2C8LUYZKPHhpBHsrzzP706YLc=
X-Gm-Gg: ASbGncshqj0dDewLoRPspgjCE0Hph4+yvF0xwhCWLVjivEaNo800eTLq2sgZKzUgnlS
	FY+6VteE6iQwm68lEe6Je5eHtSjS3LJDCI1jTLyE8aU99KFPNnnGl8s3UKDaAuptIS8lPjqk9sY
	bRdZyXWy0e6GMlHRfG4adtd1WpMOetF4g9P0yUMWgYQj23gbHy+FtVf8ZMWzy0sf76TWdK83CYR
	8OfMQ49U0vY3HcrOHp0vOj9yrD8FBcVLWpV8uF1JLujG9AGsD++Am/NUM8kL7Sg32cmrvBGibjP
	+UM6Wr4RxM5WC9gMGNJ/GKmiNSMmmpx89uy4CO0Q9veDHYNUjHIL/4rzcaLT5To9eO0teE9FiMB
	xxkVJAxBopqMb
X-Google-Smtp-Source: AGHT+IGtDDtI7FhuuIjfq30FaLggo6siUgKsnVHXy0In7YrLSlYbl67D9UVPet7StdoKw8HT/BY3WA==
X-Received: by 2002:a05:600c:3e06:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-450d888b0femr83074465e9.28.1748877544845;
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:04 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 6/7] clocksource/drivers/cs5535: Add module owner
Date: Mon,  2 Jun 2025 17:18:50 +0200
Message-ID: <20250602151853.1942521-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081906_606083_411F58A0 
X-CRM114-Status: GOOD (  13.24  )
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-cs5535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
index d47acfe848ae..8af666c39890 100644
--- a/drivers/clocksource/timer-cs5535.c
+++ b/drivers/clocksource/timer-cs5535.c
@@ -101,6 +101,7 @@ static struct clock_event_device cs5535_clockevent = {
 	.tick_resume = mfgpt_shutdown,
 	.set_next_event = mfgpt_next_event,
 	.rating = 250,
+	.owner = THIS_MODULE,
 };
 
 static irqreturn_t mfgpt_tick(int irq, void *dev_id)
-- 
2.43.0


