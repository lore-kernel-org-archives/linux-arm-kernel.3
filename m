Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B99C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MrkL1EzynOEYQjnCeAURIHzh4kwI++Df9MFvfdWTjOg=; b=JSwSZ9yePav3xe
	oBkGk8UyooX3bquMW/iJgT/euQKTsFznIzuF3EcfMQTQpbv0AoJ63HtOAznDQUGltugm0j5MvqifI
	KxxQqhU2H3YnoPQF0StBdySRfn7T7u9TBgbx6vMPuKZprcnZl4shpBWC4NpVIafxmS2zxlYbd7T7h
	IebA7bBe1Ebd1BMRRediCWqdlC5wOy0HWYIoGoOhoyba6w+aq3doFb3UpM/gBHhaMGLoQ1UoVcerl
	5eggo1F15am6KWrN0fV6bkMZlwgVLqHks/EjSHXn5vuf3OUl1nPnyS0Q38u4R3Now+oXPDtEsVBSb
	D5uFOxzwkzGxzwdhnjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeSH-0000000BE76-3t3e;
	Wed, 19 Feb 2025 07:25:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeQn-0000000BDmO-3Zvr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 07:23:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1301773466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 23:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739949820; x=1740554620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrkL1EzynOEYQjnCeAURIHzh4kwI++Df9MFvfdWTjOg=;
        b=DDexjJrW99Ec0MchI3ka0a+E62+3MdAFUf3ou0OPrv+d/xzF5QXRAEq9k092Ll0s5a
         KPvSOUb02OccjghV7qCaEWq0xD1nPeG6hpDQEfLFjTLDx5oxw2WKm9oPDQI2Ml+57NDt
         HZE5wd+iHdGk1wjZIPqlrUy4xVW8Lv1lTZlqoH1fy2WNuQhIL0cv+gL891tjyOv1UNve
         2R4Te7k2aEKsegjmVwDTZgS0IczuHgAtPx//9Ae7F/Y1paArze5HyCDmrW/d3dNmrTod
         BpFAWGDT6pZWdPafkvBod06ZRM2DbB5iii5ZoVJj2adX8hLGz4JbIWTyzwkQpX9ebd4X
         n2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739949820; x=1740554620;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrkL1EzynOEYQjnCeAURIHzh4kwI++Df9MFvfdWTjOg=;
        b=TPS+Sh+R4Oiwf9w2a+aguyEtS+TfTLMSC3ASKdAKVhP414mp6HnYTkcnAza/JwO81R
         2zjQgspf6JLaN+2xZ2sKNwzmgrg0ZKu9hIBi5IHeUcweCP4whWle6qlovlG2iZ9RYooZ
         CdCkYJDh83FjaNEx5UfMVwACVS34TOlbaXlfsHClzFoUDyX4IzIdfzetdbhjeb5+MJoV
         MTOJleHx9CRC1tnxJHxNzwhk1epIWNWwZdsp5OWIpfBu96fdD60zMAxAmgID5ZHYWtXy
         8v/RnI6SsVp3hJVXtd3AFlSLvH+yGa/c7uRZfELeVKHdBr3wzCQaX/+tRc8d8exfvclu
         FnBg==
X-Forwarded-Encrypted: i=1; AJvYcCX37WJyvilaoXulvMwK64AxB5QdjfrRF+JkfdQkb0sk+DtRH2zncCgrvMPHE0Ig0nvBWR/fZMGr50bTciAWID/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Fgja6o4HVZQ3T4Fa7A640fR5Wa/DG9yzNSCNr9z2/5UjDS/0
	ooRqYUQaueP4UmAN7GS5nnlARv3hZLrJj1RG/Fv15+ThVYuCSCtNU5G4FNlOVto=
X-Gm-Gg: ASbGncuPD75Mpt3sgyqQMq7fMKY54kFT2kL6MyniNK46hiAFT7aI9KyYIhHGIT/jFI9
	IHmLwVdDWQR1lZg7s/pArbRDZb700XXl/bRWXIp54gnzgeZiGiJYqc17gFnqWPD4jr+ZefHzs5f
	/otSR7MevCXXT0v1LSvONRs2M8nY0zs5pSCkVL5CDnK333/G01ZICaWn4p+j05NFOu4O4J7i2u8
	yiiTcvgC1zkhWv/9HYGXx0LWMQw3iokc0K6M3ueboKUydSC49JvkYSzjWsIMOAAzqwqcPqmdEd3
	qwBfxURP9EmbF2td8Ttn
X-Google-Smtp-Source: AGHT+IHZWXCuEpvT3xvdDN/MFE3D6j40MB5FYWQcEZO+pokW/icP1OWkegX28oeygqnpWf0djqcvPg==
X-Received: by 2002:a17:907:3e82:b0:abb:db78:a25c with SMTP id a640c23a62f3a-abbdb78ac9amr70624766b.46.1739949820011;
        Tue, 18 Feb 2025 23:23:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb837378e7sm729086166b.52.2025.02.18.23.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:23:39 -0800 (PST)
Date: Wed, 19 Feb 2025 10:23:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mark Tseng <chun-jen.tseng@mediatek.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	chun-jen.tseng@mediatek.com
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <23e24631-aee4-43cc-8f85-29ec58241c03@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_232341_904552_4071F552 
X-CRM114-Status: GOOD (  11.38  )
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

Hi Mark,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Tseng/cpufreq-mediatek-using-global-lock-avoid-race-condition/20250214-154521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250214074353.1169864-2-chun-jen.tseng%40mediatek.com
patch subject: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
config: sparc-randconfig-r071-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190807.fz6fs2jz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502190807.fz6fs2jz-lkp@intel.com/

smatch warnings:
drivers/cpufreq/mediatek-cpufreq.c:367 mtk_cpufreq_opp_notifier() warn: inconsistent returns 'global &mtk_policy_lock'.

vim +367 drivers/cpufreq/mediatek-cpufreq.c

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  317  static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  318  				    unsigned long event, void *data)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  319  {
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  320  	struct dev_pm_opp *opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  321  	struct dev_pm_opp *new_opp;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  322  	struct mtk_cpu_dvfs_info *info;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  323  	unsigned long freq, volt;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  324  	struct cpufreq_policy *policy;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  325  	int ret = 0;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  326  
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  327  	mutex_lock(&mtk_policy_lock);
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  328  	opp = data;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  329  	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  330  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  331  	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  332  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  333  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  334  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  335  			volt = dev_pm_opp_get_voltage(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  336  			ret = mtk_cpufreq_set_voltage(info, volt);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  337  			if (ret)
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  338  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  339  					"failed to scale voltage: %d\n", ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  340  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  341  	} else if (event == OPP_EVENT_DISABLE) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  342  		freq = dev_pm_opp_get_freq(opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  343  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  344  		/* case of current opp item is disabled */
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  345  		if (info->current_freq == freq) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  346  			freq = 1;
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  347  			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  348  							    &freq);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  349  			if (IS_ERR(new_opp)) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  350  				dev_err(info->cpu_dev,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  351  					"all opp items are disabled\n");
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  352  				ret = PTR_ERR(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  353  				return notifier_from_errno(ret);

mutex_unlock(&mtk_policy_lock) before returning.

c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  354  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  355  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  356  			dev_pm_opp_put(new_opp);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  357  			policy = cpufreq_cpu_get(info->opp_cpu);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  358  			if (policy) {
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  359  				cpufreq_driver_target(policy, freq / 1000,
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  360  						      CPUFREQ_RELATION_L);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  361  				cpufreq_cpu_put(policy);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  362  			}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  363  		}
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  364  	}
5f81d7eeae239d drivers/cpufreq/mediatek-cpufreq.c Mark Tseng    2025-02-14  365  	mutex_unlock(&mtk_policy_lock);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  366  
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05 @367  	return notifier_from_errno(ret);
c210063b40acab drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen   2022-05-05  368  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


