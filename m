Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D975E677F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=y1wLSM24+3PvyH7ej2g+4G+UpBE6rJoDJskNxC1aAWA=; b=XWJz6YJWa+Rm/a
	CYG8GXQJh7DFbAz7adCXZVKqjZq+lCVb5XL0XTmmkKb7iTScpwZ2Vk79qt8tzG2tTzvDWl4PdgwoK
	q/yV9813K16JZYp7fYhJwfGaHN2H81jmCYxirKOK0+Wrl4uze67JA7/fiknev6MYbnbAt4h1a3BhK
	zPrB1ATyG92SvDdpEiKv19tgZtlpaJA2eYVOw8Duynbf6L5xxhWgX32+pl3NOSNRQPqVzbMWy7IkT
	rmMn7YbpYPyK4EP8/irHG5hHJGIjhqOmO0cLBYFlyjlgKMR1NIzOYhornCnS2gy8p1cpQl7ETdj0v
	UI8swwkigx5jBvzUSTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79fa-00000009Jcx-1i1J;
	Sat, 02 Nov 2024 08:39:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79dN-00000009JPn-1o6M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:37:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2255162f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730536643; x=1731141443; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1wLSM24+3PvyH7ej2g+4G+UpBE6rJoDJskNxC1aAWA=;
        b=c5b+BhXGz3kldAyxQM/SBRdLJ/IELppqYe9hHmOwUCqb48B1UPKT83viiBKMDjPx6l
         RwvcSUp6juyN1oyKLD8lmkJkKn2YrE1Z6srFCGBbLkoBG3/LBs3aTXnVC+QD7CmrgxQ4
         7lH8TotXv5Bg3keg48wA7PcsXtitHFkZVSUCo6nXhd9kBuGYR14MLCHl+1oHotlcc1VJ
         4cdZbNvSGaSqet1sjhb1wqVqdOOcK1iifhuRF2FChaZ8sbWGpGRLuCIlJNDV2XmmA/QI
         7XnEGOYh9jR6hN8XtqsizpEo5e4Wj4XoFshgPPx9y36WzX/oc+73fJLpPCDKiNlHcbNX
         tY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730536643; x=1731141443;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1wLSM24+3PvyH7ej2g+4G+UpBE6rJoDJskNxC1aAWA=;
        b=OOR+K1jbn/9exPV2BcAXM92MpfwHV2QYQGszvnoyRhcjqgJos1xfY41NpZCcs5J8pV
         rgOT3s5C3TwSb6AnJzMfoff0mG2TNm06+MPTaixtqWV8gOBJJ4TCKeNEwn5FP0D/Dk2O
         go4e0zzsyeFjSgduqyn6vOGgkz0l+eHqL+tHO+eS1KfhrLm5jlgGUmBB0Ns3RUtgmJxY
         gI0ycl+6cTYfifqItyXIA1JlEpVreLnrRLeRXP9uAfRkr3t2icorPe1GpzIDI4CfUg30
         elXL/VWGsrfve+VJ42XJz7N1D41u8pXENi+N3UOaiVUKsBUbakrbq8uzLPR5YO/Ikqpo
         mEGA==
X-Forwarded-Encrypted: i=1; AJvYcCXQh62NgWBvoVleIPPKUBpDPupikhFP1Hd09DXMzKVR7wJrF6cQosw6Cu+Z1M4VKMMiaTNP8MwuIk0WS+LnqJet@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQcK5a/4Jdxr9iMRq5ow6XqDf9sLHO93bH5HPKgO1cajMHLh5
	M7keB+7fN6NtXTmZ94zwbSv6b4tlQ1Ux7DUDOhkkKkFCR+eHUro/6jHaZR1eqTE=
X-Google-Smtp-Source: AGHT+IH44ILAIvwuI9zYhtmAcV7RoQNrvn7NrERInPHKHUhKGWu6xeRArhlwj9NNXrDVF25LJw7gNw==
X-Received: by 2002:a05:6000:18a9:b0:367:8e57:8 with SMTP id ffacd0b85a97d-381c79e3b75mr5719372f8f.19.1730536642787;
        Sat, 02 Nov 2024 01:37:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5c65c7sm86574345e9.19.2024.11.02.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 01:37:22 -0700 (PDT)
Date: Sat, 2 Nov 2024 11:37:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <48498f47-1601-432b-bde5-f487668d1e85@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_013725_511543_FF1F6BC9 
X-CRM114-Status: GOOD (  11.74  )
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

Hi Andrei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
config: csky-randconfig-r072-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021431.282g2yZy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411021431.282g2yZy-lkp@intel.com/

smatch warnings:
drivers/mfd/nxp-siul2.c:311 nxp_siul2_init_regmap() error: uninitialized symbol 'ret'.

vim +/ret +311 drivers/mfd/nxp-siul2.c

5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  267  static int nxp_siul2_init_regmap(struct platform_device *pdev,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  268  				 void __iomem *base, int siul)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  269  {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  270  	struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  271  		[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  272  		[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  273  		[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  274  		[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  275  		[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  276  		[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  277  	};
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  278  	const struct nxp_siul2_reg_range_info *tmp_range;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  279  	struct regmap_config *tmp_conf;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  280  	struct nxp_siul2_info *info;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  281  	struct nxp_siul2_mfd *priv;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  282  	void __iomem *reg_start;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  283  	int i, ret;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  284  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  285  	priv = platform_get_drvdata(pdev);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  286  	info = &priv->siul2[siul];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  287  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  288  	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  289  		if (!s32g2_reg_ranges[siul][i].valid)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  290  			continue;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  291  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  292  		tmp_range = &s32g2_reg_ranges[siul][i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  293  		tmp_conf = &regmap_configs[i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  294  		tmp_conf->name = tmp_range->reg_name;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  295  		tmp_conf->max_register =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  296  			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  297  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  298  		if (tmp_conf->cache_type != REGCACHE_NONE)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  299  			tmp_conf->num_reg_defaults_raw =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  300  				tmp_conf->max_register / tmp_conf->reg_stride;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  301  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  302  		if (tmp_range->reg_access) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  303  			tmp_conf->wr_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  304  			tmp_conf->rd_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  305  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  306  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  307  		reg_start = base + tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  308  		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  309  							 tmp_conf);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  310  		if (IS_ERR(info->regmaps[i])) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01 @311  			dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  312  				ret);

Do this like: dev_err(&pdev->dev, "regmap %d init failed: %pe\n", i, info->regmaps[i]);

5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  313  			return PTR_ERR(info->regmaps[i]);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  314  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  315  	}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  316  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  317  	return 0;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  318  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


