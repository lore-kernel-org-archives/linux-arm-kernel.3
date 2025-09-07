Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89607CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=aAYNdsBKYi67Oem/jYjGQylTcJt/iir5KzfK7uZa2Os=; b=pYZ5KOEr4sHGsi
	UN9Os4Ln24eHbab6dbDSM7U3ApnLpKialzOyCr57tNF/8T5sh8UhSJcOOcVnzcCq5GhCFqZhsVbYo
	ZKLdt0+8tnHuHsJb0RqHXYnSoacfkH7WvickWto4I8VmLaCyPW0nRnrNK3h4lBXCqdALRHjyp2H15
	FyWqV55k/CVcZQT0e1AuLYJhoqUitj17gZMu5vntv6CRPm7MThvlol265RXSs/Xrfkwyi5htaPINq
	ifpV0X4Zj+PREhUGoxQ4Oe4Iq06tJ3U2rb26Hv9EuDMTPyukBzsPSrVCTyDbDIOgSUPlfuoqbOBnS
	Qz7M0+9Rw1LMElyC6fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDbH-0000000Aqm2-1Bfx;
	Sun, 07 Sep 2025 11:30:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDXS-0000000Apy8-0emJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 11:26:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso2629175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757244388; x=1757849188; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aAYNdsBKYi67Oem/jYjGQylTcJt/iir5KzfK7uZa2Os=;
        b=VKvy089AeNKC6DUaJmzHPNdhiApkWSUw/ZKnN6W1sUNL3wKMq/zreF+DxWqr2iSEda
         hhyCp7XYK4HtqUW9Okp5/h6NOXUp4JVDzDKeOaiXTToxi6rwHmGpoX66ZN4pIBQ9l9Xw
         gmmvgClYkOs1C6kq5bGciBfG4SPEYek3eRijudYqYuoMfHHEDgsI/rgAzpvjaQcEDjrQ
         y0lRkH7QM0friErCVZngGTjvYydR6Tb06lY7oS8wSN0SHakaLXgXwBATmlNlyYoZldIz
         K/IeduqQoAXqJS/sp7eIMaM/DQdSOgETRUZT1SNFO4Sq7C+meqnvTPweXsst075eSAAC
         iEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244388; x=1757849188;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAYNdsBKYi67Oem/jYjGQylTcJt/iir5KzfK7uZa2Os=;
        b=SUCoBSj03iGssOxxTfC+31FxVgLs33rKPq4c+j2JeQSVDXbyn5NGXcrpJD5hglxA+5
         cSE5tFEKvyArLKsrYeZRs2YPwgN6wmyESuFpV35BfJBCHp9jcNk0N7aK0T5q65VXa5NP
         9+OJVUC7cjDe8u8IU+fC+O9r9Tr29H8EN8lO7leJtL2uyaNUBDDlB2tRK5p/qa63Ed47
         1BMWiqFRpSbccjEReX7uiJq742VuSLnsvIjAaloN0bn0NQszrs4knkOT+eT9gXQUxBMI
         qpWImIhjKsQR1MjUkFhG7O/Qdg1XSun7AeROeD8anRrEFon1x4zmgc46fF1MZ0PnlGPY
         EbRg==
X-Forwarded-Encrypted: i=1; AJvYcCVMRZpFPZH5/CFICuF8N4Uo28HGGTZGaEI5toCzo8ZCHP3NuI+pJMbNtGsgwE09FaDW7ViaD0RRrdqnetpiz6CF@lists.infradead.org
X-Gm-Message-State: AOJu0YyYv6lBvAgf07Qk92XrH6vIkkO8XcWU6l6yj7uVNf8EbZON1ijE
	3hhDBpNbP6D09xhexbar2gum4gQzyAFrdeyuv0CsHRD5S6XZpF9plOhnag6uHgwTL+8=
X-Gm-Gg: ASbGncuJpzDGXGUHiatXlg/uaekAmdW+jM0jEKOHzKOj7UuBTnQ6Y6HqYw3kle+x5vM
	CL6j/Lg9sQs5TSa8KWPL+3ma/Zq+yiWgloHKBwlBWvD0JBritvUkIOh3PT/BD96D00IqK8/ySsX
	AkDTEd4XiJNbL2iSXnXiZNq2OjDFi+N0vnUFwJ9gQ8s91I6FX9kec7I2S3x+VWTORkLB6k/giGC
	SUvZ7O2/doYharwD0tDl0sGpo/opxdjJLR/huHnulxRXIIZGj64c3yhuKH3xPeym/bAzPk6fX63
	syRz2/dXKKe15Tlj4j9Cyw4KzOgGnDRzo5lnPcci/eshWg+TwCbcAJm/eFI7rlRugmmPqhzRIov
	9yJEpwklwQqDWmBSvCwchlCGRHNFKEG2mDg3A7g==
X-Google-Smtp-Source: AGHT+IGH6H0mBFkDQVDcAbYMsb+ulzbOrfFiUgLrXxCyJBe2kwF4x8+y+psKdMwtQ84ERtsBks0g8g==
X-Received: by 2002:a5d:5847:0:b0:3e5:190b:b04e with SMTP id ffacd0b85a97d-3e64317fdd0mr2511246f8f.37.1757244388066;
        Sun, 07 Sep 2025 04:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e74893acecsm319047f8f.36.2025.09.07.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:26:27 -0700 (PDT)
Date: Sun, 7 Sep 2025 14:26:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <akemnade@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Andreas Kemnade <akemnade@kernel.org>
Subject: Re: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
Message-ID: <202509071141.TSai6ltk-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-sy7636-rsrc-v1-3-e2886a9763a7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_042630_201291_5CD46B18 
X-CRM114-Status: GOOD (  11.06  )
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

Hi Andreas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-mfd-sy7636a-Add-missing-gpio-pins-and-supply/20250906-171133
base:   1b237f190eb3d36f52dffe07a40b5eb210280e00
patch link:    https://lore.kernel.org/r/20250906-sy7636-rsrc-v1-3-e2886a9763a7%40kernel.org
patch subject: [PATCH 3/4] regulator: sy7636a: add gpios and input regulator
config: x86_64-randconfig-161-20250907 (https://download.01.org/0day-ci/archive/20250907/202509071141.TSai6ltk-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509071141.TSai6ltk-lkp@intel.com/

smatch warnings:
drivers/regulator/sy7636a-regulator.c:121 sy7636a_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/regulator/sy7636a-regulator.c

8c485bedfb7852 Alistair Francis 2021-06-15   77  static int sy7636a_regulator_probe(struct platform_device *pdev)
8c485bedfb7852 Alistair Francis 2021-06-15   78  {
cb17820ef71ed7 Alistair Francis 2021-10-15   79  	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
8c485bedfb7852 Alistair Francis 2021-06-15   80  	struct regulator_config config = { };
8c485bedfb7852 Alistair Francis 2021-06-15   81  	struct regulator_dev *rdev;
8c485bedfb7852 Alistair Francis 2021-06-15   82  	struct gpio_desc *gdp;
d38d49b140043b Alistair Francis 2021-08-03   83  	struct sy7636a_data *data;
8c485bedfb7852 Alistair Francis 2021-06-15   84  	int ret;
8c485bedfb7852 Alistair Francis 2021-06-15   85  
27fdd3bbb7a138 Alistair Francis 2021-08-06   86  	if (!regmap)
8c485bedfb7852 Alistair Francis 2021-06-15   87  		return -EPROBE_DEFER;
8c485bedfb7852 Alistair Francis 2021-06-15   88  
07678e530d8eab Andreas Kemnade  2025-09-06   89  	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
07678e530d8eab Andreas Kemnade  2025-09-06   90  
07678e530d8eab Andreas Kemnade  2025-09-06   91  	gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
8c485bedfb7852 Alistair Francis 2021-06-15   92  	if (IS_ERR(gdp)) {
07678e530d8eab Andreas Kemnade  2025-09-06   93  		dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
8c485bedfb7852 Alistair Francis 2021-06-15   94  		return PTR_ERR(gdp);
8c485bedfb7852 Alistair Francis 2021-06-15   95  	}
8c485bedfb7852 Alistair Francis 2021-06-15   96  
d38d49b140043b Alistair Francis 2021-08-03   97  	data = devm_kzalloc(&pdev->dev, sizeof(struct sy7636a_data), GFP_KERNEL);
d38d49b140043b Alistair Francis 2021-08-03   98  	if (!data)
d38d49b140043b Alistair Francis 2021-08-03   99  		return -ENOMEM;
d38d49b140043b Alistair Francis 2021-08-03  100  
27fdd3bbb7a138 Alistair Francis 2021-08-06  101  	data->regmap = regmap;
d38d49b140043b Alistair Francis 2021-08-03  102  	data->pgood_gpio = gdp;
d38d49b140043b Alistair Francis 2021-08-03  103  
327603c2e83590 Andreas Kemnade  2025-09-06  104  	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
327603c2e83590 Andreas Kemnade  2025-09-06  105  	if (ret)
327603c2e83590 Andreas Kemnade  2025-09-06  106  		return dev_err_probe(&pdev->dev, ret,
327603c2e83590 Andreas Kemnade  2025-09-06  107  				     "failed to get vin regulator\n");
327603c2e83590 Andreas Kemnade  2025-09-06  108  
327603c2e83590 Andreas Kemnade  2025-09-06  109  	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "en",
327603c2e83590 Andreas Kemnade  2025-09-06  110  						GPIOD_OUT_HIGH);
327603c2e83590 Andreas Kemnade  2025-09-06  111  	if (IS_ERR(data->en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  112  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  113  				     PTR_ERR(data->en_gpio),
327603c2e83590 Andreas Kemnade  2025-09-06  114  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  115  
327603c2e83590 Andreas Kemnade  2025-09-06  116  	/* Let VCOM just follow the default power on sequence */
327603c2e83590 Andreas Kemnade  2025-09-06  117  	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06  118  						     "vcom-en", GPIOD_OUT_LOW);
327603c2e83590 Andreas Kemnade  2025-09-06  119  	if (IS_ERR(data->vcom_en_gpio))
327603c2e83590 Andreas Kemnade  2025-09-06  120  		return dev_err_probe(&pdev->dev,
327603c2e83590 Andreas Kemnade  2025-09-06 @121  				     PTR_ERR(data->en_gpio),
                                                                                             ^^^^^^^^^^^^^
s/data->en_gpio/data->vcom_en_gpio/

327603c2e83590 Andreas Kemnade  2025-09-06  122  				     "failed to get en gpio\n");
327603c2e83590 Andreas Kemnade  2025-09-06  123  
327603c2e83590 Andreas Kemnade  2025-09-06  124  	if (data->en_gpio)
327603c2e83590 Andreas Kemnade  2025-09-06  125  		usleep_range(2500, 4000);
327603c2e83590 Andreas Kemnade  2025-09-06  126  
d38d49b140043b Alistair Francis 2021-08-03  127  	platform_set_drvdata(pdev, data);
8c485bedfb7852 Alistair Francis 2021-06-15  128  
27fdd3bbb7a138 Alistair Francis 2021-08-06  129  	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);
8c485bedfb7852 Alistair Francis 2021-06-15  130  	if (ret) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  131  		dev_err(pdev->dev.parent, "Failed to initialize regulator: %d\n", ret);
8c485bedfb7852 Alistair Francis 2021-06-15  132  		return ret;
8c485bedfb7852 Alistair Francis 2021-06-15  133  	}
8c485bedfb7852 Alistair Francis 2021-06-15  134  
8c485bedfb7852 Alistair Francis 2021-06-15  135  	config.dev = &pdev->dev;
27fdd3bbb7a138 Alistair Francis 2021-08-06  136  	config.regmap = regmap;
8c485bedfb7852 Alistair Francis 2021-06-15  137  
8c485bedfb7852 Alistair Francis 2021-06-15  138  	rdev = devm_regulator_register(&pdev->dev, &desc, &config);
8c485bedfb7852 Alistair Francis 2021-06-15  139  	if (IS_ERR(rdev)) {
4cafe1aeb5fb4e Alistair Francis 2021-08-03  140  		dev_err(pdev->dev.parent, "Failed to register %s regulator\n",
8c485bedfb7852 Alistair Francis 2021-06-15  141  			pdev->name);
8c485bedfb7852 Alistair Francis 2021-06-15  142  		return PTR_ERR(rdev);
8c485bedfb7852 Alistair Francis 2021-06-15  143  	}
8c485bedfb7852 Alistair Francis 2021-06-15  144  
8c485bedfb7852 Alistair Francis 2021-06-15  145  	return 0;
8c485bedfb7852 Alistair Francis 2021-06-15  146  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


