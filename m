Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2397CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=; b=XOkB+5Z8p0YNEH
	SjAV982+suz479V1f271qjLstTZ8v+Ohmu2bBrxXI3VIM0bbhQZMVw433PvhwCmDkmK8lTrS+g8jr
	LD1hJAMwDMMtdtTY8VHIVGlwJKCVTdPjS3kyF39nesvPjLwWtruRzSCaJM+hy89UzUwg6TDTG09a9
	tlh7J5Jl4/WPWEkdbo+L3OkMKaHF0v3h2+2SH1yAxItf9XZiSM9OAWgf8xb6OakwckXxmVqyQUqlh
	MR19TjdWxW9RPPjzOYG6o79ATTHKUtLFMT17eeQeASqrvTQ0mwB1Stqwv8LnRd/u7ea/QehJF/oqF
	8kZxPA4W039tGXWclvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhtD-0000000HM6H-02wZ;
	Fri, 17 Jan 2025 08:39:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhrv-0000000HLu7-3UCA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 08:38:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so11732075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 00:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737103098; x=1737707898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
        b=NCimhMNgdajhefldRoYvkft0pyqIsUYsFa+k8qdz3ity+5f/GReSV3BTQslOFuESj0
         Nlw9NzdJpIYyACMzZea2s7TdGRFYRXV+mQ9b5y/6BMUUOAJL151kNa3bgMetH9oFxz/c
         b98M55sMasAa/supbRnT+PotzMf1mKYn1/3txadefwL+x7PYGUB0peTvJltMJCLC95sy
         yYWnsAaIozGuTUNsktHws6/nrwDI4LIdrNp9kDdEDkOwMQwOLcl+AC62FVSnHwquMxOW
         cegN0KbKbt4soPd5xFtnxBLX40Sv17+aOXYaEDUJnflgt83AXW3efXtpaOIgCD1kdups
         DKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737103098; x=1737707898;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJ1ei5cf4bIYP2dhBSNsW7gRWvtxXhyGMsyM2uckNOk=;
        b=BOplCO1fG5eQSVOocPbA+yj9ynoehWRtUbQdOGUFMBBgrXwQL43eah8TFDE8KrnWtb
         ViAi33ZATH68uTZc3I8UYF85RUcTPwmR0LohtL19xhh+hc6i49MhLKw1wQuHv7nhYIaI
         t+m5lbWvKe8S+6A+KQfCGr+HIHWHffGhgi+aww9nv3umRKYSvYabz5gvbsG5NG8K4jQU
         9Xy2jBU6JZV0E/6rvblupITOeyH1vY7R+MGvf5lPu1CGvxvRTFDmp7N8OlnZUlJylv6P
         cK7HLuMWmJPRru27l0Ah/MMGRn5owULdTxnD9V3W+xpwLHTt8MZNH+BjbbdDpTDo1UgT
         7YCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxCzK8pLCfCVqF9jfgEx8Gscj7EIaDsbVUiYkVqUgoK9z0ogTINhZ1jNmKuymnZdZ4mrajlmbXSgs/ae+5ql8g@lists.infradead.org
X-Gm-Message-State: AOJu0YxAEL4G/J38ERcg6Uu/ogzLIiSvATS+O1M6l4yHvly+bOUjSZcv
	YVAagHvTMMT5a6ac4iCaZCL5s993hMMNTFSEVoqzmdaNWUJSADp9Op17dzj6img=
X-Gm-Gg: ASbGncuZOhlFHs9ikkY42JriiFJLiYMW7ySKa8KBC0BReB7bvivWFm10Avtmdk0Mn5i
	IayvEbcut1dHmyL4Aj11+9rP+j9x7+yR9y4MaM0MX4o8ANxWOWNcRrwbZRcQFBI02ok9xpHR48m
	zYy4xCdkupWcQQTJPwUihLvEsp2IMfy7a+xhPVgMeKwv1NQ9O1uZ6d3ptE5sTmmZNGjRe82+SMm
	Bm8PnuFCQaEoXCd1Tigtu+KY7YvVQ0nb7y0IUbnY7buAHF04M70p8IVahykcw==
X-Google-Smtp-Source: AGHT+IHHCRSsCNB3Pr//Zs9JSCQC5BMsN2QD0gja4Pnf4e3R/D/iBTCkc6sIgLA7rH4i2gWt+Va7zw==
X-Received: by 2002:a05:600c:138a:b0:434:9d62:aa23 with SMTP id 5b1f17b1804b1-4389142e88dmr14685205e9.20.1737103098043;
        Fri, 17 Jan 2025 00:38:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm81066365e9.0.2025.01.17.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:38:17 -0800 (PST)
Date: Fri, 17 Jan 2025 11:38:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
	kishon@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v2] phy: stm32: Optimize tuning values from DT.
Message-ID: <d40db5ae-5db8-4541-8d20-e7bacef4ecf2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113092001.1344151-1-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_003819_878510_63EDEE17 
X-CRM114-Status: UNSURE (   9.45  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250113-172435
base:   v6.13-rc7
patch link:    https://lore.kernel.org/r/20250113092001.1344151-1-christian.bruel%40foss.st.com
patch subject: [PATCH v2] phy: stm32: Optimize tuning values from DT.
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171619.0XDYDyBZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501171619.0XDYDyBZ-lkp@intel.com/

New smatch warnings:
drivers/phy/st/phy-stm32-combophy.c:147 stm32_impedance_tune() error: buffer overflow 'imp_lookup' 8 <= 8 (assuming for loop doesn't break)
drivers/phy/st/phy-stm32-combophy.c:564 stm32_combophy_probe() warn: passing zero to 'dev_err_probe'

vim +147 drivers/phy/st/phy-stm32-combophy.c

31219ca5436f01 Christian Bruel 2025-01-13  119  static void stm32_impedance_tune(struct stm32_combophy *combophy)
47e1bb6b4ba098 Christian Bruel 2024-09-30  120  {
47e1bb6b4ba098 Christian Bruel 2024-09-30  121  	u8 imp_of, vswing_of;
2de679ecd724b8 Arnd Bergmann   2024-11-11  122  	u32 regval;
47e1bb6b4ba098 Christian Bruel 2024-09-30  123  
31219ca5436f01 Christian Bruel 2025-01-13  124  	if (combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  125  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  126  		for (imp_of = 0; imp_of < ARRAY_SIZE(imp_lookup); imp_of++) {
31219ca5436f01 Christian Bruel 2025-01-13  127  			if (imp_lookup[imp_of].microohm <= combophy->microohm) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  128  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_OHM, imp_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  129  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  130  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  131  		}

If we don't hit the break sttaement above

47e1bb6b4ba098 Christian Bruel 2024-09-30  132  
47e1bb6b4ba098 Christian Bruel 2024-09-30  133  		dev_dbg(combophy->dev, "Set %u micro-ohms output impedance\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  134  			imp_lookup[imp_of].microohm);
                                                                                   ^^^^^^
Then this is an out of bounds access.

47e1bb6b4ba098 Christian Bruel 2024-09-30  135  
47e1bb6b4ba098 Christian Bruel 2024-09-30  136  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  137  				   STM32MP25_PCIEPRG_IMPCTRL_OHM,
2de679ecd724b8 Arnd Bergmann   2024-11-11  138  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  139  	} else {
31219ca5436f01 Christian Bruel 2025-01-13  140  		/* default is 50 ohm */
31219ca5436f01 Christian Bruel 2025-01-13  141  		imp_of = 3;
47e1bb6b4ba098 Christian Bruel 2024-09-30  142  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  143  
31219ca5436f01 Christian Bruel 2025-01-13  144  	if (combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  145  		regval = 0;
2de679ecd724b8 Arnd Bergmann   2024-11-11  146  		for (vswing_of = 0; vswing_of < ARRAY_SIZE(imp_lookup[imp_of].vswing); vswing_of++) {
31219ca5436f01 Christian Bruel 2025-01-13 @147  			if (imp_lookup[imp_of].vswing[vswing_of] >= combophy->microvolt) {
2de679ecd724b8 Arnd Bergmann   2024-11-11  148  				regval = FIELD_PREP(STM32MP25_PCIEPRG_IMPCTRL_VSWING, vswing_of);
47e1bb6b4ba098 Christian Bruel 2024-09-30  149  				break;
2de679ecd724b8 Arnd Bergmann   2024-11-11  150  			}
2de679ecd724b8 Arnd Bergmann   2024-11-11  151  		}
47e1bb6b4ba098 Christian Bruel 2024-09-30  152  
47e1bb6b4ba098 Christian Bruel 2024-09-30  153  		dev_dbg(combophy->dev, "Set %u microvolt swing\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  154  			 imp_lookup[imp_of].vswing[vswing_of]);
47e1bb6b4ba098 Christian Bruel 2024-09-30  155  
47e1bb6b4ba098 Christian Bruel 2024-09-30  156  		regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  157  				   STM32MP25_PCIEPRG_IMPCTRL_VSWING,
2de679ecd724b8 Arnd Bergmann   2024-11-11  158  				   regval);
47e1bb6b4ba098 Christian Bruel 2024-09-30  159  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  160  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


