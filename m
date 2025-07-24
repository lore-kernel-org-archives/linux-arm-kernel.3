Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB70C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tya8198c6y5rCjUglNzcQUyG1Q0GYdplJmKHDjoJPmk=; b=csKJz8vs/k+iXb1b/KSGLrVXed
	EvlEhKvIZZBg7/Q/Y2vm2OionW3rkebtUFPiQxzCSzIk3tezeQvBzsMzE4IXH1f/0tmrnA8GBHpDM
	tSUhnjBuL60FqZnbmwi8M/kAq/Wb/3uH0pTZcVx59tIrY4LXHFhI5HGaQeZ1aozUa+CLU1d28q3o/
	wZP2oxpwvC42SNjQAWWBvFAL0IViLjDw7MGEkprsO0WNpFnf0Dt0WoiNV7sn8AuGcnl81cpydL7QK
	4VEpsyisxUcYJNnx3hpvT2aTgCwaA+sjqkr83rSMYooytj2qzEbdrzNG2aOR1J5eT+8onylkjIdcq
	I50ee89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uemCP-00000006Ncu-20Qo;
	Thu, 24 Jul 2025 03:00:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uem8Z-00000006NP1-0mRW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 02:56:52 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7e29d5f7672so52859185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 19:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753325810; x=1753930610; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tya8198c6y5rCjUglNzcQUyG1Q0GYdplJmKHDjoJPmk=;
        b=cmJLx3E9PKqXHS7uzUSxNMExP623/P0cJH3R8sHcHvF1/+78zl9vfz2NKSLUIB4arh
         AaewScaeCjUDu/4Iqn6Tpm8pPJMeicAH8dGB6d36j7kKAZZPiq7+vwd9alDcGrtKvtfe
         dH1OfXb7MfSR4T+ZrGnCnMFCoZG6ND7H9jcCVmBFel8UNDSUdJIxsjXQDd/yOcwVzBZk
         CdAr81Ii/HBrj24hHgLbNlhFtDohXbGHJiM5AAUdMauPn950NTuPmIp4WfsbXQilk+ui
         HLknVOMyAn800XjferwrmyqIuAwJCyLx/tid1au0nHnO3klPW38AZNw+YzQJ2mHjfu0h
         l8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753325810; x=1753930610;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tya8198c6y5rCjUglNzcQUyG1Q0GYdplJmKHDjoJPmk=;
        b=lluyqdgLrd9rSfxlS4rfX/s6nv8WEOSjdFmGig3G/u7vtCFgS8iHsQQDdWwu4cdgjO
         nwny9O97CsxVlGY9yEklu+TCs6af2Oqr1HY+ZmhpvG81jnph2B6bFxRmPD4TrAwdyQsO
         3aUtvKpZsJouZoEaENRB1lKWupDlllQH7hpd4XFfvxdC9dibNXrJ5H816uE56L5NLT2Q
         ONoy8BujelNN5rX1Rl5+5sg7PScrGk8eQpBelvHaPGQXPn6Gt/NZYvVzPkTS0WDEJiSf
         xfsNihq5PX25+YFwxB27oGwM2GNg+TO0zMp7vn6sXA7RDtwsmF+b623FSlNZQAaHUtoA
         x+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWudQpDQMteUIF+u5WJfxtWRGV6Ig6mCqod6WmfBvJJnekOBuPrrTIiKuWrpKBDMdYEozg4CyeSESzXM6V102h5@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJ3ssUp7cn1dCfMtYCb6D0qXBzHrWc+o60018Ccx3yfOXuOsE
	dF3smc8UB1qiTkzetDrYyQMNz5dEuUYeYi/8BoaF8o5EImjAGwJyyPoZDIV9q4Zs
X-Gm-Gg: ASbGnctyGtIYGn6aHalROS7TD3HIT3FZ8IJC5294f3ldtQiw4i6SSFOHTNqsSyG8yH1
	c6qMgKTQMfjAPL/ysTm+Zy4aEyEH0slpKPCZmaZ3Jz4nhAukroMNWTQlvaJida17eH3+facnOSI
	nali/CZaBZREQzM9aYv/isg5al0xph3szRkAD4DoFlOspdmcRybncBOzXMO+VY5oKXh9e3lgLEi
	5nioYL5TOcWZAgqIBosrS/t9NrM5eK/dtw/7e5OWj8itgrXKS5zqCVVlYY0n/76RZvVi35LCrXa
	3ORCcdwHoP3CFdpg+tT1JOdAWEmZaNUG5lHRSx2HpqSq+mymuSpnJk7MkfpXJl7HmflPlhuCLmG
	cAoHe/0HY3g==
X-Google-Smtp-Source: AGHT+IE520yI5+0BPKLPxQW3nyViV/NFLkZpgJ6MunrUBo0qqOXFxpUrTpHAPcr4S00JME2ig8XXiQ==
X-Received: by 2002:a05:620a:3bcc:b0:7d3:fb3a:675b with SMTP id af79cd13be357-7e62a1573d5mr588472885a.35.1753325809726;
        Wed, 23 Jul 2025 19:56:49 -0700 (PDT)
Received: from pc ([165.51.88.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632d6413csm50641385a.29.2025.07.23.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 19:56:49 -0700 (PDT)
Date: Thu, 24 Jul 2025 03:56:45 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] fbdev: atmel_lcdfb: Fix potential NULL dereference
Message-ID: <aIGg7erPjz1qJQ1F@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_195651_223996_22F3957D 
X-CRM114-Status: GOOD (  13.35  )
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

of_match_device() returns NULL in case of failure, so check its return
value before casting and accessing to data field in order to prevent NULL
dereference.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 9dfbc5310210..b1017ac9c73b 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -922,6 +922,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	struct device *dev = &sinfo->pdev->dev;
 	struct device_node *np =dev->of_node;
 	struct device_node *display_np;
+	const struct of_device_id *match;
 	struct atmel_lcdfb_power_ctrl_gpio *og;
 	bool is_gpio_power = false;
 	struct fb_videomode fb_vm;
@@ -930,8 +931,11 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
 	int ret;
 	int i;
 
-	sinfo->config = (struct atmel_lcdfb_config*)
-		of_match_device(atmel_lcdfb_dt_ids, dev)->data;
+	match = of_match_device(atmel_lcdfb_dt_ids, dev);
+	if (!match)
+		return -ENODEV;
+
+	sinfo->config = (struct atmel_lcdfb_config *)match->data;
 
 	display_np = of_parse_phandle(np, "display", 0);
 	if (!display_np) {
-- 
2.43.0


