Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3EAC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oXyjcjL3bnTlnkKMFFgkBYIHbcZl4/hc7w/BVYgFeCU=; b=WG9W04AoCYMGVDf10Pt++RlKaP
	02vSHg+EMRtxfjK9I2eAhzRVJlY9jnjRAFXBLpKHv4LenikIS0qlKLrH+BgJEJbFmBmvl4ym44VFc
	mDVfqtTkPCDwW1ltRM++g/kN2lgrQ/qQFivAPWfWtHvxZYae/O3zpXwgm1bzaAZmnM8/2FlSmvLQ4
	OTYOtLbuClNsf+eHP9I89Mou6hhzfO6MADBOCfuk3zjomTDV4JHyohaD2KwEOx5J9ijRwUHua6jxO
	+ZL+T+mPtYYCM1zJzKWf1az8omfNrGVZuzbY7cOooS8h0SHPxD7JcNejjO3vdR+rZIjUsJIUyQEgF
	Ye7dUt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb85-00000009FyC-38pj;
	Wed, 19 Aug 2026 07:54:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwb83-00000009FxK-082b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:54:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493b966dd74so4548195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787126069; x=1787730869; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXyjcjL3bnTlnkKMFFgkBYIHbcZl4/hc7w/BVYgFeCU=;
        b=Btcsc1iBSeGXiMeF1DDCIrJ35NbKD3dfkV2zT1S0Ypgkqq+w3SlLnGRPBPMpAafWyd
         1/G1vWwpjHBwguua6SfT5X+mtc8igpKJjLu1I64BPoUGms3GlXJrUWXkqqu/anjjUz8X
         atBqzZTUTNGPhVL6Q2MMz4UFl6zjBBAlqzUeSB8GlIw0m3Vg4ziyeK2gMsJAiQjMfMav
         Ui2sSUnPJz7S2kQmdwtG123Qrf9R8YxUIlQe29ZCu9dUXavY5P7GK2yHz8NmAMunro2B
         nnWF7pyBuaRNvI/2E/kLG15y3dhIH/pGWoDSm5x9Uusgth3cWR88YroWMfilGQMq79Ry
         Ok1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126069; x=1787730869;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXyjcjL3bnTlnkKMFFgkBYIHbcZl4/hc7w/BVYgFeCU=;
        b=Ay3eWMx7XMXL8/ioq6+nVeFbygstiODH9TJ0mydAko3I4obCH4QcOQqQKWrPdjfEWP
         iXRudDDtA01rS1oXCvf82AtsSKZ+5R9jUK8zJITQ4DwUbNRUv12inNlJY2hsECTvBWi8
         1Uuep9b0mXwykCfHmvwweaTTLf2tR9Slpz2RCEVEt6h1jXcK479zkPkg55xEJfa5RKMV
         SudyNArI2IWavFIHVrwcs5LESJSeHt6v/G6hrUWOiLhKPs0QbKyrJ8CrNzmTGeQ8J9Zu
         rj3tJOuN4Qrbmw9e6V/1btUynGS4+K66VrX//0ZEYqHj5Y/cF75GPFMwnIXSWdu7UY2G
         og5w==
X-Forwarded-Encrypted: i=1; AHgh+Rr8QiNf7LaqmoSM1RoCLcyaIlpz3jDMRSA33+1kxHyetSLTptp31Aw28O/DyjAE4ZYvKxkKA94PfJmYhnfmClrs@lists.infradead.org
X-Gm-Message-State: AOJu0YxftKFu2qEPlOwCH89UFyYq5iApZs9CyOvl10I2/ryIZflWxuru
	jlSMegiYckdV0e8iHq7KMaPi0Qpwg46tbWR4Fa2LQq1QtLomiLm0KqDy
X-Gm-Gg: AR+sD115klniR9NEyv0q7DbQsJeUx09YteNKSuQezzmp0jptTbQzp9yHXDwfdbZOkbh
	AiIfHTSveBVWP6DQ6BPfRv7aLjQUlkleL6e23FwZQW+Jnth2tOFYwG3uc4zLg7JqQvRzH2r5Vdw
	/RDW4DyaLn2frK0Ck8p0+ryUAR5llM/GwVmCScC2epJC/kUFM4htxDqaf0/mSCsYaRWG011e1I1
	tXuCU6tBzpNo81DXTXlm9BubYN7H4fFVZ91LuJnYpeKvSrMox39vNpb9TQCnKnpW+IOC4tqik3Y
	3Qi2KBb3OnDnzsXs6engYUbZ7zduJ88Q5S9UWeQi9ePtvoM2F/fd4W2JwdyKdTEw4UDwfyGoxQY
	uCBABOql/9W4RiQ/lODiTuGS9FanXKpl7N2pPTDViHUIcOAHjLYu/J/kMYMu9LZ5hOjSkWXNCw/
	C1C6cavHk76diINsWhIGm2Pmj/K4zpeIyFa9WfGf2/qAzIN7HHxXB2+R1ocg==
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr44247205e9.10.1787126069040;
        Wed, 19 Aug 2026 00:54:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6964sm39163725e9.9.2026.08.19.00.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:54:28 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:54:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 200/200] drivers/mmc/host/sdhci-pxav2.c:318
 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null
 (see line 305)
Message-ID: <202608191405.jP6epa63-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_005431_210324_1C7B7DFB 
X-CRM114-Status: UNSURE (   9.36  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: c12d647b0229f4d75a2973c9b4e79f9b53406426 [200/200] remaining pdata removal
config: parisc-randconfig-r073-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191405.jP6epa63-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608191405.jP6epa63-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-pxav2.c:318 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null (see line 305)

vim +/variant +318 drivers/mmc/host/sdhci-pxav2.c

e41c48b4bcb3ce Doug Brown            2023-01-16  295  	clk_core = devm_clk_get_optional_enabled(dev, "core");
072f5e2c34a95b Binbin Zhou           2025-06-07  296  	if (IS_ERR(clk_core))
072f5e2c34a95b Binbin Zhou           2025-06-07  297  		return dev_err_probe(dev, PTR_ERR(clk_core),
072f5e2c34a95b Binbin Zhou           2025-06-07  298  				     "failed to enable core clock\n");
e41c48b4bcb3ce Doug Brown            2023-01-16  299  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  300  	host->quirks = SDHCI_QUIRK_BROKEN_ADMA
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  301  		| SDHCI_QUIRK_BROKEN_TIMEOUT_VAL
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  302  		| SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  303  
dfe9746aed2d12 Doug Brown            2023-01-16  304  	variant = of_device_get_match_data(dev);
dfe9746aed2d12 Doug Brown            2023-01-16 @305  	if (variant)

This assumes "variant" can be NULL.

b650352dd3df36 Chris Ball            2012-04-10  306  		pdata = pxav2_get_mmc_pdata(dev);
dfe9746aed2d12 Doug Brown            2023-01-16  307  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  308  	if (pdata->flags & PXA_FLAG_CARD_PERMANENT) {
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  309  		/* on-chip device */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  310  		host->quirks |= SDHCI_QUIRK_BROKEN_CARD_DETECTION;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  311  		host->mmc->caps |= MMC_CAP_NONREMOVABLE;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  312  	}
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  313  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  314  	/* If slot design supports 8 bit data, indicate this to MMC. */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  315  	if (pdata->flags & PXA_FLAG_SD_8_BIT_CAPABLE_SLOT)
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  316  		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  317  
dfe9746aed2d12 Doug Brown            2023-01-16 @318  	host->quirks |= variant->extra_quirks;
dfe9746aed2d12 Doug Brown            2023-01-16  319  	host->ops = variant->ops;

But later it's dereferenced without checking.

9f5d71e4a78a02 Zhangfei Gao          2011-06-08  320  
f35ca223882aa6 Doug Brown            2023-01-16  321  	/* Set up optional pinctrl for PXA168 SDIO IRQ fix */
f35ca223882aa6 Doug Brown            2023-01-16  322  	pxav2_host->pinctrl = devm_pinctrl_get(dev);
f35ca223882aa6 Doug Brown            2023-01-16  323  	if (!IS_ERR(pxav2_host->pinctrl)) {
f35ca223882aa6 Doug Brown            2023-01-16  324  		pxav2_host->pins_cmd_gpio = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6 Doug Brown            2023-01-16  325  								 "state_cmd_gpio");
f35ca223882aa6 Doug Brown            2023-01-16  326  		if (IS_ERR(pxav2_host->pins_cmd_gpio))
f35ca223882aa6 Doug Brown            2023-01-16  327  			pxav2_host->pins_cmd_gpio = NULL;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


