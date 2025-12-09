Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E96D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=i3HS3UZvHWNoRI4tSC4tCLlGjmvQB2LsBSbcqGJUth8=; b=QMFZKpoEcuiAkn
	C3JuXzRdtP8aBVSv9SvE68Kl/X71XEUmPQJ8TelAu4w5QS6viBZp8K+QFdqei+SzJzDvuHUdoKBJO
	aWEkDNb5RZ/NNd6tQ8Hro87gMdnTKwfVCMAaVUu5HY29Z2KNCTc7Pv1c0520Kepagt8eaVygqzOnN
	EgtZJJfQAhTlp5DgrA5nQ4Nymu50q8K/rc5r+AHBu6sULABGVaY8EX1GYA72if1HRDDqLBMgkbXns
	0/dU00sMDFZxY2mbiPotdX4IxfrAErOoWvfAg64CSuotDpKQ7LhXktxs2TN3OI8jBuh769Pwp+8UV
	84LwJFByY5zC5AsFv+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSslZ-0000000DyUM-1SOn;
	Tue, 09 Dec 2025 08:08:13 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSslW-0000000DyU1-2B6f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:08:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477563e28a3so38121115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 00:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765267688; x=1765872488; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3HS3UZvHWNoRI4tSC4tCLlGjmvQB2LsBSbcqGJUth8=;
        b=KV3QqWSvrMFeUtBFHo9gvpaZdJvBJ0DUr+Wo35v6oGWpVQDJQlusA5a2hEIxnKf+bE
         Hk1niJybRXptNpsf42hbwdSmkqdRLd42kGDz5KxP83uUncygn3NbMIwVtGIW9SGOJ50U
         736qOlMW+9FMUBY77j3od/VZWeid4DRXzVK2JAmZ039+lvZGXPapurjwvXAVjLigzCl8
         vxJleVQL3vceTKybmOpTq8tRHubKSLarre7t7Ej5tPRiRS1gEuq0Dv/IwoEscSo0jscV
         TxBH52XuixKPPjBQuSSk1wbCnwzxvbkaOnbazSbrPuNRPltwS1+14G5zr9XSAQqXCiGk
         cs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765267688; x=1765872488;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3HS3UZvHWNoRI4tSC4tCLlGjmvQB2LsBSbcqGJUth8=;
        b=BGItSGkPXczuMnTMXBr0p8Jw9/Rxp+x6N2XRW/yDWgr0BGIEk2gfV0vZ8RrvuEeHLS
         hyTqJJCdo4JVOhcgjkRIWm3naYedDA6EzcWYU+ZZ5LBbiBazPuxccNAMQHrfdV2Wxp3x
         mUIbOfr5cFYpU2UlLPKqsMXo/iqplEPeJJ7V22exvBMC89awoHJEzHvcmANSL3lispTN
         lqn+LIc88lQgmgdU/7f/UIoAZHzCBCShd6TxAjPuXQXsjo/lG/6MtMaxawQWGY8Rm5W4
         7McVrZrFH3gibR5mBcvigthVXz61hQIjGlbAxPGpi4L6qkQOVkWwND5vFmpidBgI0gT/
         xq1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOBsegpcmTpdrX5kZpuN4VDCzTFP5Dig0urTQU/rviHQ7PAnYrSNT5HKonsoU3U9jV2u5ACzytl7FOSv+GTk+j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/mHm0wWyp0u84EHOPUq/q590pvwjblRXGwDAoiNdXUQwkPhz
	0oiVrZn9ZmM20AYwVtniSR8iSgIIZqKk/wZqwHVyjLluOAIznjtlNE/PG+FsSC+xMD8=
X-Gm-Gg: ASbGncsyQi7TQOm1p/QTrbf+kEb14zrKTrq1mRVx7EHqCDpnuzl87MTvcRW6W5Lp+MY
	RjKvOqa+fX1H4tEfVMJy/GFqlg8gj4pnD8EMcRIHqkcJGcltQU6EMC97UbKbcwz63DYWWVPDKPu
	opUZBszjUjusZ6+UtFjsYSk/2gqfPHkOGS6DE+3XQDmeaIZuCDfKjDE09UyZYrFteDNmvrOPnaH
	Bj0Q3J/lqxVXCTly/OJUHkPntvvl4Lo+6qcLcCjpKGJqgpW2HvBLc/gyvOj5ESHZFUY+Emf4fCZ
	ZvVcP+LW+iF6xTywsotTpwXrDQIx2qHGAbhZMTedsPVG8P7+PyCI3d7Jz97OdXBZ10mOHP0KxP2
	IO14o5n9vQqqEqaxHb7VYrC1BnxAwWH/H716E34/JHafvqCPNtoIUBniymc+8898KQtVdw5ktxT
	pVcVHRC+zWWZiJk6UA
X-Google-Smtp-Source: AGHT+IGscc+SJZEm/TRqQYoD0TdId9MDDNWX4FpzSAzC9aFu5AY3yWeeq7XQ4gq/1MUrF2INsOS4mA==
X-Received: by 2002:a05:600d:844f:10b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47a7f987e56mr5630745e9.0.1765267688376;
        Tue, 09 Dec 2025 00:08:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d397a2fsm12719515e9.5.2025.12.09.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:08:07 -0800 (PST)
Date: Tue, 9 Dec 2025 11:08:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pankaj Gupta <pankaj.gupta@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512091557.d5dOvFff-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_000810_591767_001F5FD2 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Pankaj,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251203-145202
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251203-imx-se-if-v20-3-a04a25c4255f%40nxp.com
patch subject: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: arm64-randconfig-r072-20251207 (https://download.01.org/0day-ci/archive/20251209/202512091557.d5dOvFff-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512091557.d5dOvFff-lkp@intel.com/

smatch warnings:
drivers/firmware/imx/ele_common.c:264 se_save_imem_state() warn: missing error code? 'ret'
drivers/firmware/imx/ele_common.c:302 se_restore_imem_state() warn: missing error code? 'ret'

vim +/ret +264 drivers/firmware/imx/ele_common.c

a9e23a74789346 Pankaj Gupta 2025-12-03  251  int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  252  {
a9e23a74789346 Pankaj Gupta 2025-12-03  253  	struct ele_dev_info s_info = {0};
a9e23a74789346 Pankaj Gupta 2025-12-03  254  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  255  
a9e23a74789346 Pankaj Gupta 2025-12-03  256  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  257  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  258  		dev_err(priv->dev, "Failed to get info from ELE.\n");
a9e23a74789346 Pankaj Gupta 2025-12-03  259  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  260  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  261  
a9e23a74789346 Pankaj Gupta 2025-12-03  262  	/* Do not save the IMEM buffer, if the current IMEM state is BAD. */
a9e23a74789346 Pankaj Gupta 2025-12-03  263  	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
a9e23a74789346 Pankaj Gupta 2025-12-03 @264  		return ret;

This returns success if the state is _BAD.

a9e23a74789346 Pankaj Gupta 2025-12-03  265  
a9e23a74789346 Pankaj Gupta 2025-12-03  266  	/*
a9e23a74789346 Pankaj Gupta 2025-12-03  267  	 * EXPORT command will save encrypted IMEM to given address,
a9e23a74789346 Pankaj Gupta 2025-12-03  268  	 * so later in resume, IMEM can be restored from the given
a9e23a74789346 Pankaj Gupta 2025-12-03  269  	 * address.
a9e23a74789346 Pankaj Gupta 2025-12-03  270  	 *
a9e23a74789346 Pankaj Gupta 2025-12-03  271  	 * Size must be at least 64 kB.
a9e23a74789346 Pankaj Gupta 2025-12-03  272  	 */
a9e23a74789346 Pankaj Gupta 2025-12-03  273  	ret = ele_service_swap(priv, imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
a9e23a74789346 Pankaj Gupta 2025-12-03  274  	if (ret < 0) {
a9e23a74789346 Pankaj Gupta 2025-12-03  275  		dev_err(priv->dev, "Failed to export IMEM.");
a9e23a74789346 Pankaj Gupta 2025-12-03  276  		imem->size = 0;
a9e23a74789346 Pankaj Gupta 2025-12-03  277  	} else {
a9e23a74789346 Pankaj Gupta 2025-12-03  278  		dev_dbg(priv->dev,
a9e23a74789346 Pankaj Gupta 2025-12-03  279  			"Exported %d bytes of encrypted IMEM.",
a9e23a74789346 Pankaj Gupta 2025-12-03  280  			ret);
a9e23a74789346 Pankaj Gupta 2025-12-03  281  		imem->size = ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  282  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  283  
a9e23a74789346 Pankaj Gupta 2025-12-03  284  	return ret > 0 ? 0 : ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  285  }
a9e23a74789346 Pankaj Gupta 2025-12-03  286  
a9e23a74789346 Pankaj Gupta 2025-12-03  287  int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
a9e23a74789346 Pankaj Gupta 2025-12-03  288  {
a9e23a74789346 Pankaj Gupta 2025-12-03  289  	struct ele_dev_info s_info;
a9e23a74789346 Pankaj Gupta 2025-12-03  290  	int ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  291  
a9e23a74789346 Pankaj Gupta 2025-12-03  292  	/* get info from ELE */
a9e23a74789346 Pankaj Gupta 2025-12-03  293  	ret = ele_get_info(priv, &s_info);
a9e23a74789346 Pankaj Gupta 2025-12-03  294  	if (ret) {
a9e23a74789346 Pankaj Gupta 2025-12-03  295  		dev_err(priv->dev, "Failed to get info from ELE.");
a9e23a74789346 Pankaj Gupta 2025-12-03  296  		return ret;
a9e23a74789346 Pankaj Gupta 2025-12-03  297  	}
a9e23a74789346 Pankaj Gupta 2025-12-03  298  	imem->state = s_info.d_addn_info.imem_state;
a9e23a74789346 Pankaj Gupta 2025-12-03  299  
a9e23a74789346 Pankaj Gupta 2025-12-03  300  	/* Get IMEM state, if 0xFE then import IMEM if imem size is non-zero. */

I really can't understand this comment at all.  :(

a9e23a74789346 Pankaj Gupta 2025-12-03  301  	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
a9e23a74789346 Pankaj Gupta 2025-12-03 @302  		return ret;

This feels like returning zero is intentional, but please return a
literal zero.  s/return ret;/return 0;/.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


