Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B3CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=; b=y88p9kynz++KlV
	OfjPRW08jFZligaGkholEHnD7ArDY3gUctPrZBNaPdVSRa145yPva5QaxHpgdzueZexu6zQSHiS0D
	pLB2/b4KkS+ia/VGDl/I9KGRn7KyyDX2qvpodAxVBA+BmCED2P4pAeljB7QFOO+sKw1ldnVjoxVc8
	ytKvDIwQl2Dea13pwlaixkL3a0Hn8fe+2ES88rftfNkU9RwL3bpo13OQPBaxfTkFEZTRjAEm3Ly+s
	+hkL5nUsUEzxf6uYeWR1fYZ92tnUBzFd7XNpTl4MYTuMvYmMyuIAZA0sm/0JlarrXn9B7lCYV1IC/
	TNH13GDPjCNNz8crIp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bGv-0000000BshM-392t;
	Fri, 03 Oct 2025 08:36:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bGs-0000000BsgT-1s3H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 08:36:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e5980471eso9435355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759480568; x=1760085368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=Is/Idv4oFGsfzRFcoho1k3qFEDMT8Gq2BITz9mNxasxGEkCoi7y09njYkq4ImQNycC
         jJtOxjqtjj7yp+aFefvcAapemonZKJczxxB7Nbhsrk3KPXF0CZwDQgcSCxEW91RHxI9D
         1vhcYhx63w2NYW8aygzcol82H+qBwOr8pzp/4vh5TXygXt79Jtg7jctxaSzTPPabhzyw
         awTMFjLySlopx16iaUQcAqevzgLEixdXzCnOdqBwviFf9Bs/DAqw8VEGFqaPf+Quhopv
         S4w6vDfwfmJz3x4YadYLJQguIofGN1fNLkp6gy8IXOZvFlYy1FfzBczutR/EymERsToC
         4yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759480568; x=1760085368;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=MEX/Vyca7wtrWVG8L3c3J5yg990+eDxSO5XO3AnvYGXTKXGX230N8DYkJNoQ78Ipo0
         DquP/ZF7EvlL20F6OunDLb5/icauHNquawBPsS8WbSz6vJEdeK08qCF8ZutXxPHgdZbW
         klJ+5Jn+3Njlh6JRuu8SErRSjOx5GxXa7r3NWUoEagHz8NukCKInaPeac6Qk5+tDB0nM
         Rl2XKDo383wBTrAuDUrmTB/v646ZUkT43RNQwM6eJhCTdUaet12ttdfUtia+hvMrTo8g
         PBuLnYz3yk/IIG+pn6DZffTu0Z/5J2OXtQnamwd7OwxnbOXNzn+1+wes1C8FVGjVQ9Qk
         dmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhfn/hE65t5wROtizRljhGw/Ep9xZ8DeT5eBdeW9UEL704rYxdvAQFq1UaCYziqheCBfu6sWdZmkEPdkzCCoaV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Y8rES5sz361eGi7ttTQp3p9JqTHyr3sLreX0SI0uh1Ni2/yh
	pKy5EiB4nhds5zn456Jq8f1Mo/cWaZ3OB8s59btypbFoaWvhpdg8/bpe/N39cr90HZw=
X-Gm-Gg: ASbGnctYzX3e1SBF7NErKeTD7bS87+5d3kZWSppnWuzY33c17msY+yr/KjMtas3B+LJ
	UIZja3iBiwU3avDvW7IKSBCzWEMKOSRZjicwNHZ6pVDOg6w2J1T0SvogygvsCIyyFrGbh3lJNC9
	0I/kuvG3GU4xRUEVR8AtcBfwMIoBUH0+XxMZC67LqaNpT28KUDUQrMlQhS7uBFAc7OYOIMs0TP8
	f5yEFTb+BBrB1jzdSbcUjwIuKzzB4IlaUTKBiRdVIe3plu/uBs2q+vyFetorq5wiqcAe0i7zZ8E
	MTaqAhp9Vzrzb83f9Jnx3Q1lzEFoGWktD4K+0FcCH7kXpr0hAqUzaa0JF350pMB2n/6vV1/uZs/
	Mt9tDAopalXrnMBu7S139PNe1aJV0+ARYWA3P1ZAlwz+g0oizfihdZ9Qj
X-Google-Smtp-Source: AGHT+IE76AssVOnYZ6flrpm/T7LxOGT/eMAoKYwNOlcK4L0ObcJKZqXObYnm2Ncd1mks7lx/eY9Deg==
X-Received: by 2002:a05:6000:2887:b0:3ee:126a:7aab with SMTP id ffacd0b85a97d-425671c3abemr1117681f8f.57.1759480567855;
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8abf0bsm6826213f8f.17.2025.10.03.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Date: Fri, 3 Oct 2025 11:36:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <202510030902.aQS5rL8n-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002090028.1796462-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_013610_509717_336C18E4 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251002-170532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251002090028.1796462-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
config: arm-randconfig-r071-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030902.aQS5rL8n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510030902.aQS5rL8n-lkp@intel.com/

smatch warnings:
drivers/regulator/mt6373-regulator.c:664 mt6373_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +664 drivers/regulator/mt6373-regulator.c

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  645  static int mt6373_regulator_probe(struct platform_device *pdev)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  646  {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  647  	struct irq_fwspec fwspec = {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  648  		.param_count = 2,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  649  		.param = { 0, IRQ_TYPE_LEVEL_HIGH },
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  650  	};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  651  	struct device_node *interrupt_parent;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  652  	struct regulator_config config = {};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  653  	struct mt6373_regulator_info *info;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  654  	struct device *dev = &pdev->dev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  655  	struct regulator_dev *rdev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  656  	struct irq_domain *domain;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  657  	bool is_vbuck4_hw_ctrl;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  658  	bool is_cw_variant;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  659  	int i, ret;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  660  	u32 val;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  661  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  662  	config.regmap = mt6373_spmi_register_regmap(dev);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  663  	if (!config.regmap)

This should be if (IS_ERR(config.regmap)) ...

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02 @664  		return dev_err_probe(dev, PTR_ERR(config.regmap)i,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  665  				     "Cannot get regmap\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  666  	config.dev = dev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


