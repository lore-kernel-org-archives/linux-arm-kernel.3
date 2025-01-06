Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XPxusyoqlnRrNJq7+ups8OMfqGNcbuHMUJVymBouBjo=; b=opxKMY/DV6Kj7d
	jc7DD8XC+ccK3AE5aWjDadw8M0nCp3FEjAQWcmiibhPDVe5fIfDywda7delq0AIHNmMWycRE0ZZQ8
	mYUEQHH+4Yzl6D06qt7+8KyCAY+Q5MhsbYngBBXx+OlIKiaR9Qyj4YgYyB+i+DXGg1IcntYaZM9Au
	wJgAwbW/yfekqX4GeNeKnOJx81OOcSWPUxSUO3onD/GaDZ1UyywGsl/LDeuNm749XDXN9RO7g160+
	zY+3g8Kld5sOEqjXufHdvVK10YvP1NlPEAbpcrPcOiZ+oU+nlJE+PjPi5QBHpUTY2AKXnTdsdxJvL
	0mr1CnHClP31uZkBWiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjrZ-00000000lTI-1QuH;
	Mon, 06 Jan 2025 09:57:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjqB-00000000lBC-49QP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:56:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so7787000f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 01:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736157366; x=1736762166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPxusyoqlnRrNJq7+ups8OMfqGNcbuHMUJVymBouBjo=;
        b=pj6F9eMRN1WyHBnQ6NELgRE8AfkjTn2+A8D/ytlBipOyOa8hyUvdKEequm0afpS408
         obz6WTCKA5xTXhQ5UQM7/sFav/qg0eztZowy675+d0E9Bhcxt5SatrDFpQwVDSizkeYF
         yUXYjCke6HB/ki2EQdG/qKXWuFVyzKTWil5SUlYfw14fkb6iEzUuh3q3J2hMwRX8MVRm
         yx8obOOKAK7vXfGeb/GLukrv2XCZurwOdjk8Nv9W9l0jaDpmuQT2atshMxRmAtABgdY/
         LJ6IJ2cdL/5v3TQwb53E38ywUspZXdA6ejA2KwjMddoAjy5QTC8JC+I+gkZioqBTjLVk
         ewow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157366; x=1736762166;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPxusyoqlnRrNJq7+ups8OMfqGNcbuHMUJVymBouBjo=;
        b=IEd9HjliITk6xVW27K84j5AdX3RnrB+Oz1QoYVyJ8FrW/XZHh/exqrDa+TTkMEBTdI
         vL3HuPV3jXSLCmMc5hu91OMd2lAvSVr3UcY4CpBxVpccG7RpCHHazgN/UEuv3PIPwU9b
         X9MrA1QHeK+hg5mWX1QwCNSQIpI11GkhC0TLPF14eCZ1OxYLwSfjPvfT8y4UI85skRuI
         +fMvhJaHobPWKp8SmJKXNq9vZtZd08GrKJLlhfUnc36Kv814QigvQ3Q3P5GSle+YsHs7
         giDncmjLIba1ZjOYPp3pnZQvPX+ZDG5pC9L/HqRk6/YnFqiVJedLY8VtblXcPG7H3OS1
         RvLg==
X-Forwarded-Encrypted: i=1; AJvYcCVHnHbiD4aK63x4uwwnftbT1WHwKknlDzunTBkXkRoav6Naczdd0Nmukn5VRq0Y2ydjW6ksNibcKrgQVV0+s4ET@lists.infradead.org
X-Gm-Message-State: AOJu0YyZGj0BVnnZIcR/npkUC/yPLRvPKXWbbeuRm2PUS6pLABd1udX9
	Ff1rKTUVfsNBbaomPGuyFRf/xOtBSznnXyB896mFofYAGDeI1ovlKobP5wloAFqY1GIU/ZUC+6k
	c
X-Gm-Gg: ASbGncspsgi6f9PGlzGkf0xzqW17rrz6SZbOCEhVldCmTytUCOwuOg7HQe8P3XBXvOg
	SkDVptqMvdXpqHuuYfetDqAQclrVZtxn2T9/bxYQ54g0vuhnQVwJbGUuujhVpdAfJLKKe71kLRx
	Cbq040tg6yP45Al8Z4hcw0Q6ZA14GD1x4WqPeEaQlmsf+1cdZCZG3/CK535PsSnGdmkFpX9g3QD
	0BYIvCewJbVA9zXoY5SvxoKWtO0QneIFZ/QhzbPQiywifM0KISQxCYJ37w7sA==
X-Google-Smtp-Source: AGHT+IGhWRISLmROsfexY/7S1VN3olm0rXAnp4XlnaP5acP2aBFiZteVn7JIK9wCL3+4yp5Vobvaww==
X-Received: by 2002:a5d:6484:0:b0:388:da10:ea7e with SMTP id ffacd0b85a97d-38a221faea2mr45331915f8f.24.1736157366234;
        Mon, 06 Jan 2025 01:56:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a08sm568953115e9.25.2025.01.06.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:56:05 -0800 (PST)
Date: Mon, 6 Jan 2025 12:56:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peter Geis <pgwipeout@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Peter Geis <pgwipeout@gmail.com>, Caesar Wang <wxt@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Hilman <khilman@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error
 handling
Message-ID: <e3a5c27e-cab1-409d-b118-7dc96962db36@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210013010.81257-2-pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_015608_059415_A8632B19 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Peter,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Geis/pmdomain-rockchip-fix-rockchip_pd_power-error-handling/20241210-093424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241210013010.81257-2-pgwipeout%40gmail.com
patch subject: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error handling
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240015.MfjYhpNz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412240015.MfjYhpNz-lkp@intel.com/

smatch warnings:
drivers/pmdomain/rockchip/pm-domains.c:614 rockchip_pd_power() warn: inconsistent returns '&pmu->mutex'.

vim +614 drivers/pmdomain/rockchip/pm-domains.c

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  572  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  573  {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  574  	struct rockchip_pmu *pmu = pd->pmu;
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  575  	int ret;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  576  
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  577  	mutex_lock(&pmu->mutex);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  578  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  579  	if (rockchip_pmu_domain_is_on(pd) != power_on) {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  580  		ret = clk_bulk_enable(pd->num_clks, pd->clks);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  581  		if (ret < 0) {
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  582  			dev_err(pmu->dev, "failed to enable clocks\n");
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  583  			mutex_unlock(&pmu->mutex);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  584  			return ret;
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  585  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  586  
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  587  		rockchip_pmu_ungate_clk(pd, true);
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  588  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  589  		if (!power_on) {
074c6a422d86ff drivers/soc/rockchip/pm_domains.c      Elaine Zhang    2016-04-14  590  			rockchip_pmu_save_qos(pd);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  591  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  592  			/* if powering down, idle request to NIU first */
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  593  			ret = rockchip_pmu_set_idle_request(pd, true);
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  594  			if (ret < 0)
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  595  				return ret;

mutex_unlock(&pmu->mutex);

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  596  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  597  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  598  		rockchip_do_pmu_set_power_domain(pd, power_on);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  599  
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  600  		if (power_on) {
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  601  			/* if powering up, leave idle mode */
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  602  			ret = rockchip_pmu_set_idle_request(pd, false);
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  603  			if (ret < 0)
a15817772c0ae6 drivers/pmdomain/rockchip/pm-domains.c Peter Geis      2024-12-10  604  				return ret;

mutex_unlock(&pmu->mutex);

7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  605  
074c6a422d86ff drivers/soc/rockchip/pm_domains.c      Elaine Zhang    2016-04-14  606  			rockchip_pmu_restore_qos(pd);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  607  		}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  608  
8b579881de295d drivers/pmdomain/rockchip/pm-domains.c Detlev Casanova 2024-08-29  609  		rockchip_pmu_ungate_clk(pd, false);
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  610  		clk_bulk_disable(pd->num_clks, pd->clks);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  611  	}
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  612  
d909072d0521a8 drivers/soc/rockchip/pm_domains.c      Jeffy Chen      2018-02-28  613  	mutex_unlock(&pmu->mutex);
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08 @614  	return 0;
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  615  }
7c696693a4f54d drivers/soc/rockchip/pm_domains.c      Caesar Wang     2015-09-08  616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


