Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A397CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=; b=lWYcSl1PLtJ81q
	uGXyjdvMZ91R97HXvVzSL8jQL5XZUzDX0hQG3Y/G4WEiMauzLzzo4KdRWWOth8sjW7M9IHlpvVAPQ
	igigbSsNpv6LhLiHwA0mkjgTTVbXhow2nCpo2qMAvBa8SY02qfDMTn9IzkeolcLtMFOVdn2ESU+Ae
	8BvewqyAIIshVgkWtumly04PAWEBQ1FjilAdBZptO5sgb+353SHoL8S3bUqVR3frpf4LfWL9eMT+9
	jjjdXf/RTUdkQTcb0hlD+nrcHNAI4U7ElMUUvmTJsj8J3E67i3/ehorFWvf41MYhAJlaWquVTNiCJ
	At/NKo3VKBEcP7V7yQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unEEt-00000004TbU-2mNy;
	Sat, 16 Aug 2025 10:34:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unECM-00000004TVL-2WL6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 10:31:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a25ce7978so2261365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340301; x=1755945101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
        b=LI5DxhYXngGLInjzwOY53Vc6qiz/1S+ltK4wpwt+Gh/A++ofQVr3BikewOW0EFAuo4
         gk/qYScC9mlbBllM/BzjLroAcwemjF7Dj09SwWwog1bstzdOEVRaRiTU/b1LlzYDmjkI
         NtGruvwWEW+cCz68Y/eh6APNJTbO9TpGamLsRoetD+Sj/Dye9ueFmhpBdqiCYUm/e0iP
         waR1aKbEmaaMtqceK3Sq7guxYuyYIzks3RPmZzBK1NmDVCG3LaDasn6FA/GtouwIoxfD
         J8lRXk85SOm8lwctBx3RBEevTq/3wglj+GG8DDdTTYg+lhUqoc6cW7MjDIXgbwQdgXp/
         oeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340301; x=1755945101;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8x7+nGgNL/S9BgtpwRdqXmLHGlwLdc6y+hYTmxtYuY=;
        b=pFIOSxv/p0oGpWiXAdUE5/x8zMMwPROs27CBRmjuPA4K2jvj+8GRuwBPf2nO8Mt8oH
         W5vWOJPvWxKwwDtjUKuGzae9YbmcYraGcIWVHU/of9a4hnaGMwmzi0MDTxsJ+ADI0M/x
         Kx1XbG0Gxqavujw23plfuDbI6AmIp8HYoEM3UJhT74ZTduMssvH/JhX6Eje37VZQJpZo
         zYQaSpSpf+pMkO4uqGbrQiZcCynmgfHr2Bn4C0ogGlP2I1BM5/3lkhyIRUupPilrU2lW
         Dk7fimqCjf1maQfc4X/NfKESuu+egdOMnhQ8ttGVVjQMOoR5U9nLHBNGWdpRKlAUh9Ge
         DLVg==
X-Forwarded-Encrypted: i=1; AJvYcCV2JKVbE8aHixUT2LrZfyIWZAhEmo+KZhIdY434tiyzJ83SSbtPFAhDSgdo09wgsdpRLv4Q671bhkQGfu+lcIB0@lists.infradead.org
X-Gm-Message-State: AOJu0YyZU44/HY2qoIOSsLRb4mP+zO0yHDkt07Mu2rsXdcI8BCrkNsJb
	7ojIxVLyMQaF605RkZW2Swat3Y829uAifm11pFKM0uULru3PNfFoIm/BnwDgNAouFmg=
X-Gm-Gg: ASbGncsEdxqW7wn0IHxOTexb/aR/7rEcg4NG9Yyxn8F3VM1SrXsUOa8YVYXVIO5yAUZ
	EnMA/yAl9YAkCD3OZB26W+GNWAQVOsMdz9CrNsw4p6XwrpzKD96FvwPbCbgosu9/uvcExnoFYX6
	QZ497NQoEJUtWTTqjaYdiQiZ3CdSr2GF0GZScxuFZzSMlOhISg9RLIry0sV6fzoFm5LQ4THFDH0
	CvGuWvkXyU/MaSvden/PmZ1hHY6Y2LVsjikg+VMIBUF2UEOd9s+pNvmHlo/xG7fCN5TelZrTwYR
	uh+Xbp/P+EKyutXz05dbSICwQZQf8r3Rr4N3uBvhAceE72/l/4/ctGrEZmCdW+3xLi/DFAVZC/T
	MV/L3Wo+4pRoIXgnGvVLAMDcFLkRtDBkmir/um1xHL9w=
X-Google-Smtp-Source: AGHT+IGVWDeZL9smLLF1o3RVvY86c9i6C0MTi35gNvuamk+XUR6fXJiX36W4beKN48vGdOJoWRLrlA==
X-Received: by 2002:a05:600c:1c20:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-45a217fbe65mr38114945e9.9.1755340300623;
        Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1cc22739sm96669115e9.27.2025.08.16.03.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:31:40 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:31:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Damon Ding <damon.ding@rock-chips.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
	alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
	andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <202508161345.sfsLHzY7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814104753.195255-14-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_033142_652422_FF1CF4E2 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi Damon,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/drm-bridge-analogix_dp-Formalize-the-struct-analogix_dp_device/20250814-185009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250814104753.195255-14-damon.ding%40rock-chips.com
patch subject: [PATCH v4 13/13] drm/bridge: analogix_dp: Apply panel_bridge helper
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508161345.sfsLHzY7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508161345.sfsLHzY7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1595 analogix_dp_bind() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1595 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

152cce0006abf7e Marek Szyprowski 2020-03-10  1560  int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
152cce0006abf7e Marek Szyprowski 2020-03-10  1561  {
41dc71b87962d41 Damon Ding       2025-08-14  1562  	struct drm_bridge *bridge = &dp->bridge;
152cce0006abf7e Marek Szyprowski 2020-03-10  1563  	int ret;
152cce0006abf7e Marek Szyprowski 2020-03-10  1564  
3424e3a4f844c0a Yakir Yang       2016-03-29  1565  	dp->drm_dev = drm_dev;
3424e3a4f844c0a Yakir Yang       2016-03-29  1566  	dp->encoder = dp->plat_data->encoder;
3424e3a4f844c0a Yakir Yang       2016-03-29  1567  
6cba3fe433415b2 Lyude Paul       2021-04-23  1568  	dp->aux.drm_dev = drm_dev;
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1569  
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1570  	ret = drm_dp_aux_register(&dp->aux);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1571  	if (ret) {
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1572  		DRM_ERROR("failed to register AUX (%d)\n", ret);
c71db051142a74b Damon Ding       2025-03-10  1573  		return ret;
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1574  	}
0d97ad03f4220ca Tomeu Vizoso     2016-08-24  1575  
41dc71b87962d41 Damon Ding       2025-08-14  1576  	bridge->ops = DRM_BRIDGE_OP_DETECT |
41dc71b87962d41 Damon Ding       2025-08-14  1577  		      DRM_BRIDGE_OP_EDID |
41dc71b87962d41 Damon Ding       2025-08-14  1578  		      DRM_BRIDGE_OP_MODES;
41dc71b87962d41 Damon Ding       2025-08-14  1579  	bridge->of_node = dp->dev->of_node;
41dc71b87962d41 Damon Ding       2025-08-14  1580  	bridge->type = DRM_MODE_CONNECTOR_eDP;
41dc71b87962d41 Damon Ding       2025-08-14  1581  	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
41dc71b87962d41 Damon Ding       2025-08-14  1582  	if (ret)
41dc71b87962d41 Damon Ding       2025-08-14  1583  		goto err_unregister_aux;
41dc71b87962d41 Damon Ding       2025-08-14  1584  
41dc71b87962d41 Damon Ding       2025-08-14  1585  	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
3424e3a4f844c0a Yakir Yang       2016-03-29  1586  	if (ret) {
3424e3a4f844c0a Yakir Yang       2016-03-29  1587  		DRM_ERROR("failed to create bridge (%d)\n", ret);
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1588  		goto err_unregister_aux;
3424e3a4f844c0a Yakir Yang       2016-03-29  1589  	}
3424e3a4f844c0a Yakir Yang       2016-03-29  1590  
dbd8040a6d0dedc Damon Ding       2025-08-14  1591  	if (dp->plat_data->panel) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1592  		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
dbd8040a6d0dedc Damon Ding       2025-08-14  1593  								       dp->plat_data->panel);
dbd8040a6d0dedc Damon Ding       2025-08-14  1594  		if (IS_ERR(dp->plat_data->next_bridge)) {
dbd8040a6d0dedc Damon Ding       2025-08-14 @1595  			ret = PTR_ERR(bridge);

Wrong variable.  s/bridge/dp->plat_data->next_bridge/.

dbd8040a6d0dedc Damon Ding       2025-08-14  1596  			goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1597  		}
dbd8040a6d0dedc Damon Ding       2025-08-14  1598  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1599  
dbd8040a6d0dedc Damon Ding       2025-08-14  1600  	ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
dbd8040a6d0dedc Damon Ding       2025-08-14  1601  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
dbd8040a6d0dedc Damon Ding       2025-08-14  1602  	if (ret) {
dbd8040a6d0dedc Damon Ding       2025-08-14  1603  		dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
dbd8040a6d0dedc Damon Ding       2025-08-14  1604  		goto err_unregister_aux;
dbd8040a6d0dedc Damon Ding       2025-08-14  1605  	}
dbd8040a6d0dedc Damon Ding       2025-08-14  1606  
152cce0006abf7e Marek Szyprowski 2020-03-10  1607  	return 0;
3424e3a4f844c0a Yakir Yang       2016-03-29  1608  
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1609  err_unregister_aux:
2d192f4a3acc1c6 Lucas Stach      2024-06-19  1610  	drm_dp_aux_unregister(&dp->aux);
f0a8b49c03d22a5 Marek Szyprowski 2016-12-30  1611  
152cce0006abf7e Marek Szyprowski 2020-03-10  1612  	return ret;
3424e3a4f844c0a Yakir Yang       2016-03-29  1613  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


