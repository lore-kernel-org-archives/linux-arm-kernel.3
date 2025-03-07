Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB29C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gbhsOaksWfSrIW8u1uBJdU7SRRrY2hqIxanWZ0O00C8=; b=Bwidxpk3oCrvy+
	AVlR3R43qyI/FUqMJn/uY2zWSUERRBqF8t2I4KEqe85YXDTSG2SeBZPpKFQvJsNapFRApFWdwUjY8
	cxZlnarNKR79gaoJSi4MEb6ALLDOe+KtnVVAxQVv5Gm1TMgYPvQ1TtrNTKpzJ2Z+jK7IC5QC2H5dH
	QhOHJorZq0T7ROpr+WwkaN8YaSi4IX30cotk8prB3g9/04+wgk9TEtc6yzfw8eDJJ0otr+J0f34vx
	nwAayTb7cYJJnRCj+EGXXX0R/xsTgpTmZIXkaHDUNGcVegu3kZpt7SJCm+3ReGpcTM/7Ovnr1io2R
	krjoEkfKdKXsciah/Ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqc8e-0000000FAnE-31ol;
	Fri, 07 Mar 2025 18:09:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbew-0000000F4cC-1fGp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:38:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so12702185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 09:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741369132; x=1741973932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbhsOaksWfSrIW8u1uBJdU7SRRrY2hqIxanWZ0O00C8=;
        b=XRG0qs7uYFRfbQ9Zui9NvGFbsJEduDcS/JMfNX+/cv5lT5S0NbdVP0M13DcJA1gdTJ
         NcJFNh5Au+AGsKIM+x0r4UjALurziv1/Nj0qgAg/eeX5vKkhyMomYiVEe6sv+tYGSso2
         yo19P/vIJH9Xc4V1Yk7ij5WWbaWsBwZHBpU4YjvhL6Ax6ieXmTyhob7a2XeMGhH9YJvu
         VRf3dy7/Gi6tEES1q0sj3eK07DXDNE8urjTb1LSKMa3lHSSvoVbN55LHgoEkrC4/9ytB
         fBVL4NeROaj6ljU8hOCyIY5QINjT/CPgvZGrD/ZsxbX3nlmVIzmg/Tudho/fjvg83F82
         KYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369132; x=1741973932;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbhsOaksWfSrIW8u1uBJdU7SRRrY2hqIxanWZ0O00C8=;
        b=eyvq8K4J7Z+tPAV97jE167Mrqc/xkzfIUYdHkyH9OVzhmnOlTbx7VZOAvXsvbXrTWG
         Cz+iA8eIUCZA7/vTqwBu7KlW6GRS6p5K040oSsFZvrzqt9ttvuhIss3cv/AdyAHc789v
         WyzTQbgTcwCzNtvI9uv6Z5jjtV8CwxOU40/xmju9jjF8ugWHOQ1KlJ2fzJ89FNTtATfl
         /VF64/31cKGaZpGwjP3bUra6+xo0KexgHdH+5xkOMaJZokJYg9PggHkicLqal9ldEeGg
         ElSEbInc9a4hBBrF5p/9zUPg0dMSROiOeISaoFItYevy1ZpuLwS9iFbjd4luGotbkjhV
         QCEg==
X-Forwarded-Encrypted: i=1; AJvYcCXxjz62+4OpmF3Ex6PtiW/xujFXWqpSx/S+7uh1q0YyHNEaos6GkMrixCPPpfBYU1BIkFWmdNC3Ij7q8uAt325J@lists.infradead.org
X-Gm-Message-State: AOJu0YxUNuA2UH1jlHDgz38T4hS1GZ07TshkYADWf5PkzsGXH7ckEKj6
	qETvKnLMNVwLm/6EDMkc7L95uPUuf672sDK1cdN0QpAarjN0fLguT3eu7wuwPZk=
X-Gm-Gg: ASbGncvLjLQ3lxEIT2O+S6EmMQHyhd2T/w/IevBkdccUZ/aS3bh7ZSEJkalJ/W+dRom
	9VUziQ+98hre5G8AdPL67AbhGUk3EYruPnwp0c8cq+rXd0yhefi2LewQ9rBLnTEnOB0d/xAGSDb
	k+V+SHTK8Zeej69fQYVR9w7ZA+gtnjVEKfp9ydiizsvDzYBKWBICAqAfrf3YCO+jEFZqjPWghpm
	ugHvNMakeZJxs5eDSYgGfME2tXUAFyNkZUbM+x/EfMA56Oh2Ch6rK6OB7sdcNt9uaFGcsS5OPf4
	+f654v8GX/N5X9CUY/j1wOrFIKxFZWq0VpH5gpmmFD/P+CRAzg==
X-Google-Smtp-Source: AGHT+IGjlugzKmmxYS6YdwzXxtlXE4bzioPLgN5lZda7k+mvVXrIjN3iK1ETSrhFkaR7AXVaN1i8cA==
X-Received: by 2002:a05:600c:4f11:b0:439:9f97:7d67 with SMTP id 5b1f17b1804b1-43c601e1173mr37208455e9.16.1741369132091;
        Fri, 07 Mar 2025 09:38:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd42c6203sm87520795e9.24.2025.03.07.09.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:38:51 -0800 (PST)
Date: Fri, 7 Mar 2025 20:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor
 sub-directory
Message-ID: <551a7b8d-1f2d-429f-b7fd-c8ea1afdcf25@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093854_445459_093B10FA 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Ivaylo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-phy-rename-qcom-snps-eusb2-phy-binding-to-snps-eusb2-phy/20250223-202709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223122227.725233-5-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072305.Osodtcnk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503072305.Osodtcnk-lkp@intel.com/

smatch warnings:
drivers/phy/phy-snps-eusb2.c:452 snps_eusb2_hsphy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +452 drivers/phy/phy-snps-eusb2.c

15a1981f608b0f Ivaylo Ivanov 2025-02-23  399  static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  400  {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  401  	struct device *dev = &pdev->dev;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  402  	struct device_node *np = dev->of_node;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  403  	struct snps_eusb2_hsphy *phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  404  	struct phy_provider *phy_provider;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  405  	struct phy *generic_phy;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  406  	const struct snps_eusb2_phy_drvdata *drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  407  	int ret, i;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  408  	int num;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  409  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  410  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  411  	if (!phy)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  412  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  413  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  414  	drv_data = of_device_get_match_data(dev);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  415  	if (!drv_data)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  416  		return -EINVAL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  417  	phy->data = drv_data;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  418  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  419  	phy->base = devm_platform_ioremap_resource(pdev, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  420  	if (IS_ERR(phy->base))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  421  		return PTR_ERR(phy->base);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  422  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  423  	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  424  	if (IS_ERR(phy->phy_reset))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  425  		return PTR_ERR(phy->phy_reset);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  426  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  427  	phy->clks = devm_kcalloc(dev,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  428  				 phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  429  				 sizeof(*phy->clks),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  430  				 GFP_KERNEL);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  431  	if (!phy->clks)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  432  		return -ENOMEM;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  433  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  434  	for (int i = 0; i < phy->data->num_clks; ++i)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  435  		phy->clks[i].id = phy->data->clk_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  436  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  437  	ret = devm_clk_bulk_get(dev, phy->data->num_clks,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  438  				phy->clks);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  439  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  440  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  441  				     "failed to get phy clock(s)\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  442  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  443  	phy->ref_clk = NULL;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  444  	for (int i = 0; i < phy->data->num_clks; ++i) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  445  		if (!strcmp(phy->clks[i].id, "ref")) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  446  			phy->ref_clk = phy->clks[i].clk;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  447  			break;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  448  		}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  449  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  450  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  451  	if (IS_ERR_OR_NULL(phy->ref_clk))
15a1981f608b0f Ivaylo Ivanov 2025-02-23 @452  		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),

PTR_ERR(phy->ref_clk) is success.

15a1981f608b0f Ivaylo Ivanov 2025-02-23  453  				     "failed to get ref clk\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  454  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  455  	num = ARRAY_SIZE(phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  456  	for (i = 0; i < num; i++)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  457  		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
15a1981f608b0f Ivaylo Ivanov 2025-02-23  458  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  459  	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  460  	if (ret)
15a1981f608b0f Ivaylo Ivanov 2025-02-23  461  		return dev_err_probe(dev, ret,
15a1981f608b0f Ivaylo Ivanov 2025-02-23  462  				     "failed to get regulator supplies\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  463  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  464  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  465  	if (IS_ERR(phy->repeater))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  466  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
15a1981f608b0f Ivaylo Ivanov 2025-02-23  467  				     "failed to get repeater\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  468  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  469  	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  470  	if (IS_ERR(generic_phy)) {
15a1981f608b0f Ivaylo Ivanov 2025-02-23  471  		dev_err(dev, "failed to create phy %d\n", ret);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  472  		return PTR_ERR(generic_phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  473  	}
15a1981f608b0f Ivaylo Ivanov 2025-02-23  474  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  475  	dev_set_drvdata(dev, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  476  	phy_set_drvdata(generic_phy, phy);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  477  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  478  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  479  	if (IS_ERR(phy_provider))
15a1981f608b0f Ivaylo Ivanov 2025-02-23  480  		return PTR_ERR(phy_provider);
15a1981f608b0f Ivaylo Ivanov 2025-02-23  481  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  482  	dev_info(dev, "Registered Snps-eUSB2 phy\n");
15a1981f608b0f Ivaylo Ivanov 2025-02-23  483  
15a1981f608b0f Ivaylo Ivanov 2025-02-23  484  	return 0;
15a1981f608b0f Ivaylo Ivanov 2025-02-23  485  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


