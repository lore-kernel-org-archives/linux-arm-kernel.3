Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6810AC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=; b=Md3pGRa9oIdiRXDlCKRM11wik3
	3ni5P9FV6vmC3ALc+LTuj6Pyz6fHaKfSTBinV8KFaB9oaaD16YAg4U3oBi+VDU0tDJPbM/XbL51BI
	mIOzMaZVTiBVL0pvKmJWrHdzeyAugi/Ha1LPunzKJEAeWSQRvq9eAU28aD1McqTt+xwYqd9PLocHT
	iF5/UyBPZjnwozYX5g26q2326w4enbDo+plD/b7FM7VdgwM0RFTre+P+fB4ZNV5Qe/Atd1a+heyAn
	Y2YtPzu1AH8XpM3lK+Dh97lWHkcn7IVEXwU6ACQc9pnWGwUE0wOAoGH6+GOut8CjH1uXMDSY9ETl6
	EpTerO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtHis-0000000B0B1-1vFw;
	Mon, 10 Aug 2026 04:34:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtHip-0000000B0AJ-1mNh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 04:34:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caea3f742bso23591115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336486; x=1786941286; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=;
        b=Il3ool/+M5wyk9I+v+1AxaQ0Jr8BCnqCp+ttSttJdlEAET24Ov+1L29+Y55pkx02os
         fZ4QOaMB3Lv/kPO8hk/NNnOoDNS5iItXJAL0aaymOyMlzfGkSisYWP3LRV50jE03qgJJ
         JWVDHhXypc9OvqxGYNpBnGHvVfgO9S7BVNRTyqKJlWunF+VDvtyvDyyyA9rTxTJ2uAMC
         nKcZUoNJtVrbAKShvGNiUZQ004cF70IIDr1WbvGsfdK9zPV11c8mNiUYGXTNoy1dWkKZ
         fj8b4OzI6oAhJBGrtCE7u5chm4o3wtyj2d2ErU/TiMCk4hQAu6fddpvJgeY4VIEteQ5P
         xGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336486; x=1786941286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=;
        b=fjdNdkG0mMH16j3sWI5pPi8UKNkNJOOG3pVR0i1Hy0dAeqGVQXG/G7HSpV7ci5/W/0
         DjVfr+4lzkRbd0JJBC5IfgrrKz6ldQbERmbRLyWxdlq1dPF7ZaBMoR32lOF7T34K36c0
         Tn9K2EIFme10WQfqyYGUCSrpMdgVndToLXiIYp4xohXxaHmHwLfTtoBPLkKU5e2aKYqu
         p5NfJdM4vBDWrfkudNX47Vpfekcpm+/jFQRKHgT1XoODH99G8exOG8ribe/g7QEPmu6q
         FA56dJQDMZ7SSW/i8/UZo5c6TWuWOkrWdMVUzBW6R/4J+vu7/YRZ7q6a3MlByFqWbCIp
         nQTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Yo1cCjc9nDtC1eRtFV51rwSUXh4DFCU5trVcRv83wxM2mrk8Tb9WWKKefKcIkKdHqcVBEsF31De6YcSuaGKT@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9uJKLaMRAE9g04uxcz76iIXeCC1SsYs5knPeoiVOAP9flESb
	jYyJtIdYQ5VpBHQ9Tdbyb7pMC5oYfKhO31anNM+fM8yGy72wRGc55YHj
X-Gm-Gg: AR+sD13A5CH6c696hDcn7sPHAoWlyKSHbcCvIv4cgUg1uEiYeo2Lx9ZXQuljmB2XcLy
	7MW1TprLZvT0iXXXQwR+XDobjamz/JIMTP8Gbl2wIDxQKpXItJ+uh7CjpS6q16PxYdhLW/3mood
	GbmBkEYOkcQLXwmfkt8Qi9J4ZNfaNTvr0zt/HAovGTvjjPXCBnOxqa8QMRfla1QlGJkXHS4iTAJ
	Lr+EMb+A16/3zi8GvLlawbtykkOB2T9a/blz/Dk80ndoDM+RJuYjxakt3sbF5kDWfK2UKRljrj1
	vUAfMRjsdc70p75sfrEkAdJ72CgeroRpzhFgmQ9/AYTjvb4xI7kEcsg+F+fnvt1gEu0Wol0to33
	t325ARvVSuZwSDOIUw+lylmeqcD1xHa5qxaIfclu/R/Ndpdc3+jRCWA4qg57cDwnf5DCsAWq6Ef
	7jM1npzqt61oYYhF1AaENBVjOcE+X5q858kesTRoUO34lAfcNcCntuuspMjGJCOtzbST9ZiFnsn
	Z3kR0VyQSEY
X-Received: by 2002:a17:903:ac4:b0:2cf:a1c0:d4ca with SMTP id d9443c01a7336-2d0ca961ad6mr521823535ad.22.1786336486542;
        Sun, 09 Aug 2026 21:34:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c502bbdsm28714455ad.81.2026.08.09.21.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:34:46 -0700 (PDT)
Date: Sun, 9 Aug 2026 21:34:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <443b829d-67f1-4af0-9e07-021e1592bb0e@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_213447_464635_94FCC9FE 
X-CRM114-Status: GOOD (  10.92  )
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

On Fri, Aug 07, 2026 at 03:16:52PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter

