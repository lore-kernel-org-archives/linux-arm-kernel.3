Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9864DE8FDA2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=; b=wUTB8ZWsqMv7Hy
	/bpy2DkVXFTjYEtPGLTZRz3gTjomFHZeaGeRbv/lHTetx6Qvx4JZBg3mCmJlrsRnqg8b+KQUOi8J0
	CZzJHpCACC/677ctHlFfhZkUnTN5oZaTuTkI5HYcPXNFMhvC+J+h2UH0kCGI9d0KNrnebbOcEttDK
	l5/+P84n11oqVQ4+LXVXkVph74g+wlTJqEP4a/ddMWtlqJiOvbCnmvwsZCdL5yoN1luVwEGeMnywc
	1z+pXfdIIVVt3sX7P1HPAxX3qTTARQF2aUn0OjLV5o7MJXPHo+lPa9OOy0TlZQS97otoYXXqNeIWZ
	JgYzSSxZPGyS4v3Rom/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7h6-00000001CmS-2D7D;
	Fri, 26 Dec 2025 13:17:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ7h2-00000001Clx-0wiY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 13:17:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-477aa218f20so43703945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766755037; x=1767359837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=cw6nqVwqX6A6I7t2/QQ1KgJKi9vIeI+kvcEdwr2zA9yycEi6jFG5KFtgtEZsu8rIyx
         pZJ/S9Hs1qPeSaCqEqOJHda1ZNQBVdrZKjl43U/yCmsaLmxrRcpIM2ByzAMPIJzLVP/U
         hv01XpIX4jx9aMU4ZREd9hY+LrIaeET7/sEe80mPZ1bdKLDPub9O/6yuXwkgsrXdT/MP
         S+kq4es9afndqk7smdS1ILhJJpiE4KV4nC6Y9EcyFH72Vrlewah4r6tPfIzvSndDLH6E
         TJ/Q/wbfBg0MHD34NwLBKbt6Ju8hffW/3PUDI03mQuu/EqcaYOtgGZh/RJ2o5ux1+Q5i
         DiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766755037; x=1767359837;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=OgCovSS8XrZKCt58IHZmtTg4G/u5YWojb9Y7p+pjgQuVkmhBUU+h11k9VdcC8MBhHy
         pc38/mEvEGCZk5KuoeXpX80chrTLh24mp8oEZkEwMMHJNoJx7T6Uqf/u6sQbjeBoksdv
         s5SdUVzfyEr7ok7FqB+U2ud+0B9IadlbM9yNH57Z0cjZtCwIkVraYvUTUFWg+apxFaUp
         swSAz63Woi09KxulJq5pWxu9PQYtIfYizo3GML43HpWoCbRobRrygyDZBAOAd3UE0rgG
         CPjmV5YaAl/WDd/UAkz/a6lUUWnaquUIua3os7tpPRtWEYG8toETLCofiENEVpulhMLV
         B3qA==
X-Forwarded-Encrypted: i=1; AJvYcCUHqe+1boIcQGAcPR9DmoManKJG1t/7t2UDQXgw4i2vXNPXE8R3N3AVP1HLe+smdOx6g3AFlrcCXUOswhxUHn0j@lists.infradead.org
X-Gm-Message-State: AOJu0YwjHajHB2yBBMowWEGYJGk7ifcwgsqmaJtXnDn9mNTE3uUUogH5
	B5/JssSQWxuhTE5jscNyj8h7PXUPVaersP68fArFUAWoOLpkV9AOx1LLGIx/yrUU8xI=
X-Gm-Gg: AY/fxX4i0Q4Q8RoplsRa2pbQLtAFHVU6Vk6bBJofiau378pvZefSaoQYFB2m9awF3HH
	ydp9JfT5cZGXtP/x0ySv88lg6aMEhC3fsINMnsXMRXLqieZuXJ5hHMAjbsKv5P96JPSriBkekZ6
	YCFeABRrDyE7VXhiZD/yMc/qpvOJTzOFb0XWYsafqOD+y/1Z4nt8zqhr8OommXSSQVu7Trw32II
	SZDaVrEUtMxdSW3SdT9Fb0ny8ESPJRCQWz0sCRpUQqTJqhQyivryGorNKreYiiZZgYgZUls1OIO
	yyS+KmTWHP/yGwIOp+0kTXp798Ylo4g1i3Snu+aWBfZTX3TnranQnKF8XX924pzo64VUS7U1xgD
	7WFKkKkXcI3ZEFs+cCSXZVgFgmdikG7VHMiVszIoulGtL4KPmgnrCeLITiS+swvuGWfq2djZbtH
	LrYw41ACExfUjLerSm
X-Google-Smtp-Source: AGHT+IGemvX5W+7cNu+/fYMuzoT9IV7eJMQ9HN7J6El6QbJ0mh0x3X7WIlEDnhHX9DTKeesGfgSayQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d19532f48mr217783085e9.5.1766755037373;
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm434235755e9.4.2025.12.26.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Date: Fri, 26 Dec 2025 16:17:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202512251923.GDSbVal1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_051720_391770_E4E6E302 
X-CRM114-Status: GOOD (  10.72  )
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

Hi Jie,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/

smatch warnings:
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'

vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c

34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
34af91eeb7e78e Jie Gan 2025-12-24  1960  {
34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
34af91eeb7e78e Jie Gan 2025-12-24  1964  
34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
34af91eeb7e78e Jie Gan 2025-12-24  1968  
34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1975  
34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
34af91eeb7e78e Jie Gan 2025-12-24  1981  
34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
34af91eeb7e78e Jie Gan 2025-12-24  1988  
34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);

s/new_node/sysfs_buf/

34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
34af91eeb7e78e Jie Gan 2025-12-24  1995  
34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
34af91eeb7e78e Jie Gan 2025-12-24  2002  
34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
34af91eeb7e78e Jie Gan 2025-12-24  2007  
34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
34af91eeb7e78e Jie Gan 2025-12-24  2011  
34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
34af91eeb7e78e Jie Gan 2025-12-24  2013  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


