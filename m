Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE63CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=; b=ddX4iBjQelXQf0
	nV2JfDmKOZCx57t3wCLeAlhJKhObUDzrOO4gXfYBMS0MWIrVDdYjxwXpAX3y+zLfZGQqhTKcaszia
	LL/xjKaVQQClGEuyIf/wnob8Za+OVVVFjCpKHBegNGNPPR3lyjZrTn5xAe4apFHoFSGgcfeNs5nR/
	hgJx8Ue+Wpujj+bb3la+yfifbJEKejhPYw7UBonnGIkHAm+/8UzlJpiHpVF88fHcx43I7Eq5lPPz9
	BEPnvSRJo/iYsgCIJxZFLiqGLUJvjq6qcfXoXmxLpusq/aY368TF/FZlfZbzhTkKBMwF5MjI97/Er
	9j5cehTWOMvqnoDt0xGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSZa-00000007Io7-3oZu;
	Mon, 25 Aug 2025 08:29:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRjg-00000007BaG-0akF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:35:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so21470235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756107322; x=1756712122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
        b=vsMsDI288Jw3ALioOvqgTo439MgUgG5s99H/y2/fqLJQjtgc0ayxKRwR9ZOBC9Q6fH
         xhkVvF3447qPF4ICoHS8KJo6nvvOHAgUIySq8236kMN1E2IcVOHmqzMcx97HjXqD+ebX
         4xofl2bMxuTTxmqfgcfBFfNI1K8d4EoIUPOk17wU9G4uvLkon/jerShOhAEyo/h0iyEl
         njJhbv1hKIwgYDAriBAX+GLquqkNwJekQk2/KNgiJ4mHBvvjA96ZRagr9w08D30cEDPg
         rxzE5g3K7hd+Y4Dprrf8oYbyg9PJy4KKZCbjAnHvTmFmu4I17dAH4JjPGLM85N/4xHz1
         XGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107322; x=1756712122;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
        b=CfIdXegxlFsgDhNvmkvsiIAt0GwqnT9VmcLPbBMg8Q7XYSpaO1b81B3nUbW1sJCQ4G
         gf8CjpML7Ipy/Gm741KELRseaoZjM2qnjlU7WVOP9e6xVAIoCqod+DD4TL1IZZw4H5K3
         JnvUkkEqFlsKbLLPhtpOoDRUDzDcTlZPxsvsUNqa5pDmETTOpS6qIxTzG3+ipntj6Q0D
         2xTihpUcY4T1pCj2CYYZFktclC6Tl1P0oeN7MHkLpqXIh5fyZRKq1T0ORZCqqGrUe6gw
         ErrlJ8cyGSGnn63Z8SHTQz5q+t8aq3DgcnQ39rfzdT5cTCUhoLLxNYUbUCtf+iINGjn7
         iMBg==
X-Forwarded-Encrypted: i=1; AJvYcCVeWwx2D2FZ5DJdibTHrQ6uODXv29tDFM35341G5ce5ObGCIWV8AJ2/FEWPYAFNJfNTIDX/0sh/2hccpS1Qrf4H@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpe5HNjPqkYZ71LtfCWNrm+bJ1QNQj243ZE1/XI664u7VAhsMd
	/aycfdfW8qxDRemAkVbWrZsj99xGOVZ/Cg/5GMeDERTaVAjPoGA5GdLtXYU45ceFqpQ=
X-Gm-Gg: ASbGncu5fJsXQ4qUfDQdfHePgN52JgGmGgjlNXj2iKETSGOiDuNu01F45nCJMQWLlz2
	FzylfPSc2IuR1j3auRfTIfJFvpGz2pziQFJg4Ap1a8ZWoa/4P2TvzRslQuMRDZORWqEjXMr0Ilq
	mFLAZW+UCDoltqaeJUE84H/BsDKK/ZfR1E6oSDiyoJuVNlFT9EQvexzou6CNk6A4bhvv44eQvW/
	gmq+/Y1A4x7fuVnbfP6iYY0zfgPzJXLv5JpN6x49sW593v8ObXl8K/bH/s/6upSGF29lOzdAvUc
	YU/V5loHBcfkptFoUyeNMEBW5rCgNdMclxx7i1KmJvDMU2N3rHtKLdXn2ZPsHa3yQGt428cqQ+D
	FB7QjK5NnOo2CPwwgfMnt5XfRvnc=
X-Google-Smtp-Source: AGHT+IErURa0Xlnp2EqAvu9MT0KYK+YicwHUY5MOLIbTG3b7xCaO3SGy7MLRfklR+AK/4jewEFfrgw==
X-Received: by 2002:a05:600c:3155:b0:456:21d2:c6f7 with SMTP id 5b1f17b1804b1-45b517b99ecmr101326305e9.23.1756107321591;
        Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5748e743sm99362065e9.17.2025.08.25.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: ltdc: unify log system
Message-ID: <202508250637.nLxtkS26-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_003524_180507_E1DF52EC 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Raphael,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/drm-stm-ltdc-unify-log-system/20250821-210930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou%40foss.st.com
patch subject: [PATCH] drm/stm: ltdc: unify log system
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250637.nLxtkS26-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250637.nLxtkS26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1150 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1148)
drivers/gpu/drm/stm/ltdc.c:1174 ltdc_crtc_verify_crc_source() warn: variable dereferenced before check 'crtc' (see line 1172)

vim +/crtc +1150 drivers/gpu/drm/stm/ltdc.c

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1143  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1144  {
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1145  	struct ltdc_device *ldev;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1146  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1147  
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1148  	drm_dbg_driver(crtc->dev, "\n");
                                                                       ^^^^^^^^^
Dereference.  A lot of the time people would suggest to delete these
types of printks and use ftrace instead.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1149  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1150  	if (!crtc)
                                                            ^^^^^
Checked too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1151  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1152  
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1153  	ldev = crtc_to_ltdc(crtc);
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1154  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1155  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1156  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1157  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1158  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1159  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1160  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1161  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1162  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1163  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1164  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1165  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1166  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1167  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1168  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1169  static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1170  				       const char *source, size_t *values_cnt)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1171  {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1172  	drm_dbg_driver(crtc->dev, "\n");
                                                                        ^^^^^^^^
Dereference

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1173  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1174  	if (!crtc)
                                                            ^^^^^
Too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1175  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1176  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1177  	if (source && strcmp(source, "auto") != 0) {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21  1178  		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1179  			       source, crtc->name);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1180  		return -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1181  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1182  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1183  	*values_cnt = 1;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1184  	return 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


