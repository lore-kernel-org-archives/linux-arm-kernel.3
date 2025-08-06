Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378BDC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9tF7LI6280Rqv7Cfa6VisATQ2AWLBgyuKrf+KPfB4A=; b=dNsiIJBmGl+E1q0h2sdYi6isF8
	5FwHsXbx8YqsrsWhNBHJrL9oM+VwrsM0FXXLy1Po304FHN6veU+EyD8wpUVEA23rZL3jrza6A0ykc
	vkZgTmNWwAVh84meo60NEd9/7e8NtpWPhsCfvWqQobUSrFK/0vlDKu2pcpk6t1ma+hwQnnosrQXxV
	1gkxwQZppYV8Mnv61JKOj3wgFZDqn9ytMiLAC703PMt4HO+noGuM6MtfGeE8Vs7bVjALv9NYNDlba
	IEPpyxkU114chNQbboGFpaG1snZeQSmCPzDDbyzGkGnn/38IOxhbRkpOaRizpf5bejVHl3kBgJXUA
	pYm0l28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj5o-0000000G6SM-2Il1;
	Wed, 06 Aug 2025 18:42:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiue-0000000G4mH-1Xpr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:30:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-458b885d6eeso1393355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754505055; x=1755109855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9tF7LI6280Rqv7Cfa6VisATQ2AWLBgyuKrf+KPfB4A=;
        b=lIcaOmx/ZShlca909DavvaO6ZpZooHWK4MN+pXf5x5NLe2v3fOwhJyAkoj9aTnksld
         BqgEhEWECPT+AZTuHEV9JUQV9Av8TtFKTBXcl57YKiZtqjzVLNmUqq2t1lxITq8fqV4j
         LGMZQl4iQkw+V7Wxp0aSMyVgOrpL/S76J1a+FrYpXWdi8wx8cjtcJtMttZdf5LtgtV99
         IaLCvh62AHLShPydYVywj1J9gZOA1aohJTbKN89JkASLGPz22zPIeby3Hmhp2gkQAfjX
         QDHoChTBDfoN29lZzPzUmAm21XTbyk7ldv9eHB7fL3YjFhqhOotMICRU/HIh/10yncuI
         qGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754505055; x=1755109855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9tF7LI6280Rqv7Cfa6VisATQ2AWLBgyuKrf+KPfB4A=;
        b=ERop0Ona1NCm9fWzDSgDgQBCeo6ly4SUeGoahF4NyNnKTwYPmdEZ3qV2Jx3ZpH1CRW
         AYlCIV5CtToJs+tFVeWjz6B0/CgVdVHeX6YALZ2kc4f3Bkeb4Ma05MInY3uvzOEJjycs
         pGfKpuboYd/+8gvXBROS77kw0YbMu35LEKYnrjte8q2cWYLbpJAxxHF03N5ImIkthsqJ
         CxydNsfGBBQSGz4edWSe0W8uWkEIPdOddBW9hL4tnMVYBGqUxJsiliDWvlxRuykoYUWq
         7aY/Fr7CS5jzdPfqNcKVvczbnRq27IqLyZnQ6unlPwUbOBPmyEryGlv/FD/O6J889q/e
         1jcw==
X-Forwarded-Encrypted: i=1; AJvYcCVqLZ5Qz1WzbCji9vbtSRK4RLq+cZoREa2bbwOR8Wfe7ETs1aquWpmsUK1phXtFdgR+kJD4d5tn2d3R6Z8Wqnq6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+KujZFFT/6aABV0ftqspxrbwIEtfIYmpd4rA8xGG9ygcRP5we
	av9cHYMK22/O3X/kbtu+BdpwMC989QyhTyEbbpT/9Yr+xVjb8EGAiESjF5eG6ifzx2qiaxh3
X-Gm-Gg: ASbGncuRggJ55eqwgGLuCuzTgjNwtfYbMja1bkuDYnW/6Bf3f2vmC48FDuanRVfg8dR
	d1q0XJ15UvacJB/Kwz2r4GvDEfXEekyYI4qiNYQ8j/mbPukfTSYvfdjwzCd/eT+gvwxHcOTBZZA
	L2st2flte2TXnKidsSzDKxI6OcS5gw0c+cY2jE8bha3ktDc/AphWK0u42WoY7I1Ic7+st7/xfwy
	e1HgCWGe2Qd0aLRu50lBSiRVcLwvJN22APKtory3/zKOjDEwMVBG+OlUA1tzFPHILXTOYu5RhB0
	97MJO7sdhO6R8sBmYGeVU9LAN9fNxl0fricgip5QddE3xYfaVJLQDYj4YyY29GMqjpIMWQZoOX7
	H6jMvRwucZ72AaViZLfiHpMlrXRC7bMapTAtxtBN+zVUcLAw4Aa1H54p1Ey1JVzNsoH0UbSug7/
	o=
X-Google-Smtp-Source: AGHT+IH6HaHyzrxaoLtYAvA1b+HYXwJxcd00pdb2pcxvIAdn4XhD1N71vIwvp/Bn4tXqtLYoNd2ieA==
X-Received: by 2002:a05:600c:6610:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-459e70797ddmr32849155e9.6.1754505054523;
        Wed, 06 Aug 2025 11:30:54 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed07fsm156104065e9.22.2025.08.06.11.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 11:30:54 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Cc: skhan@linuxfoundation.com,
	Eslam Khafagy <eslam.medhat1993@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] drm: atmel-hlcdc: replace dev_* print funtions with drm_*
Date: Wed,  6 Aug 2025 21:30:40 +0300
Message-ID: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_113056_407503_8719D758 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

Hi, this patch is to replace dev_* print function for the atmel_hlcdc
driver with more prefered drm_* variant [1].

It's eventualy up to you the mainterner to chose to apply this patch.
but since i am a starter to the kernel i'd appreciate it if you do.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

v1->v2
change dev_dbg to drm_dbg in atmel_hlcdc_place.c

Eslam Khafagy (1):
  drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


