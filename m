Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA95BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1xS4Y6iDbMRGz2VqCrGr1IDJyincVKJTk6nAhL7QGfw=; b=K3oSAZIcCDYrM6
	ASBgAg2YxwDW+7ExYRfjbM4qpIjdvbpJryQ8O/dfYXA3E/S2YW+AhpMERhXfqlTr6sLgX9HvFcxh8
	aEFn18aN1CzF4h1FbjnQNizHK4K8lEBub3flleQg0endffSggLBoOJoA22N2MkmgTXjxME+7j5fSO
	bmgWfV0h3xy+HrCpIIC5fFgQSEHY8vpsDIJKPwGqC7OJnk5541iLeNLz/uNCOh8f4UnE56cuoozpl
	FFkWUzNviOsQXIETuPiGOGRgNybPswPIQYQ6Kksju82jd2W4rr4qP6g840JZrikl+Bb498DWFCPvl
	yATPKL5wsOoBD3FvRlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4dTU-0000000C5mB-3yuJ;
	Fri, 03 Oct 2025 10:57:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4dTR-0000000C5lF-3pOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 10:57:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso26703935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759489036; x=1760093836; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xS4Y6iDbMRGz2VqCrGr1IDJyincVKJTk6nAhL7QGfw=;
        b=iQIZY7WOhNne0qDMKqpQpN9XyY1xKBcWZkGbR+fCyRH7yq+a8gwpk9n6OC05xL5Zf5
         TS153kOqCRfrE4DA4dlvsrmHUkcvx8o5n7jUXDwVY/oFk2cTco023LMg87NTnsCaDTD3
         HgFNb8mJ2cVeZkjJi7UdcWNxIwx9FhGf/aQ8Sh5yJdaayUfuAXIGTAwOKi0dklumgqQi
         +oU2UUfqrCKa3hFNRkQPNJ/2DrA1S612cmtceWhqYORwS5KwDQTEP4+ajW1OWaWJ4LrX
         6g+eP2sSH0tRIqEPRtH4xNmYoQMXTcd3wNbp3MqPw2sOsLBSaeAd57OcWprO8/06VSpg
         pZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759489036; x=1760093836;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xS4Y6iDbMRGz2VqCrGr1IDJyincVKJTk6nAhL7QGfw=;
        b=lGkz/V0PWULQZtmeu0a3hPCZlGCSgGQOtYZBhKf3X6rVwtkZ7jBLnYGHWbTiShK76d
         gRRBvh7K9ki6lW9dLnjBS/mvJQVWkhPAc9XIH/pNofymWgs4VkNw1EmIpzdQ2JU+XXqB
         yOA3u/0oVD8qE2i4UwGRezVZ2kuOV4dXybyvq0lc9nSVYl4Y84+wKEUFzhW5um182g8G
         yCrjUKg03H+HW5ikcv4KMW6YlfxMcWs/5po65zPidFnVQ2izJ2t9rkYLUPODq6mRdfSJ
         aN1aj1JXlGZCrRMYSbRvtVsmen0ljqa7Rt7UEk2LMutuMt3oPUf1mORTM592FhdtpYqj
         F3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVIPFq44gwWnVT7yxIdduxTO7+ysqCGxqkINKL1O0LcyQHqBOOIXA5D1P1zVEEuZog1uKKG1cnwiPlBI69UseUE@lists.infradead.org
X-Gm-Message-State: AOJu0YzGR4kxPXbOPjBLX3DHHHU6pamjDtcQroUqiTishkpt3LDF79nI
	3eI1FwcAtg8FoGPgr68wqSeMAlPV6ABf0Jc45JsmPDh7xwpxtSONwldTrveJ2TPNG1U=
X-Gm-Gg: ASbGncuCrOps639ayS+HcITkfk/4o2O10MbtnLowNarTi+d/GUCP4escGrMnp2ij/cC
	4LazxZvLajJhdB7LyQUyC5cOZaydBNG8Gd73VxQQBETivF38T3lT1KiwhLfmz0tyXXGP078StLp
	/tLJhKxVI8ekZINdTjq4NyFMWmOT/UjD0SyIb/gczn9AyDNl78UKyE7fDJD0e3AlK685qZXZ3eJ
	ZnW7eIzWiGY9CMXR2aJptxaBfg/oG3Hkrap5YXdsh0zu3tsVPm9St6wsje+3uREmfUExuQAtR6T
	eAbZ0xyF8ox1NFxlmJah9YnybUZTtCn7q++1wtmghbXudrhKIE4pTkWlqkWRy7BVICCNqgB6o2O
	IkLdqgD++GHzAFM5Qopnq7cLu+gJzv70xu3aPrVfKzXXfFyEo0IjhaHiQWnIoOTMUon8=
X-Google-Smtp-Source: AGHT+IG9rqI6j+T0wl0gQkLZ5/cQkIbFJyOMyYF7rO18hBvllbU4djIfXDdxUGYlPS4BODhKDsCSpg==
X-Received: by 2002:a05:600c:8b83:b0:45b:8adf:cf2b with SMTP id 5b1f17b1804b1-46e71142e6fmr15133295e9.21.1759489035661;
        Fri, 03 Oct 2025 03:57:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619b7e37sm121671965e9.1.2025.10.03.03.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:57:15 -0700 (PDT)
Date: Fri, 3 Oct 2025 13:57:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v2 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <202510031735.TE7FVj0R-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-i2c-mux-v2-2-b698564cd956@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_035718_163996_7AE05893 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Marcus,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/i2c-core-add-callback-to-change-bus-frequency/20251002-224414
base:   22f20375f5b71f30c0d6896583b93b6e4bba7279
patch link:    https://lore.kernel.org/r/20251002-i2c-mux-v2-2-b698564cd956%40gmail.com
patch subject: [PATCH v2 2/5] i2c: mux: add support for per channel bus frequency
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251003/202510031735.TE7FVj0R-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510031735.TE7FVj0R-lkp@intel.com/

smatch warnings:
drivers/i2c/i2c-mux.c:506 i2c_mux_add_adapter() error: uninitialized symbol 'ret'.

vim +/ret +506 drivers/i2c/i2c-mux.c

a7ab72390b7706 Peter Rosin        2016-04-20  336  int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
fec1982d70721c Heiner Kallweit    2024-04-18  337  			u32 force_nr, u32 chan_id)
a7ab72390b7706 Peter Rosin        2016-04-20  338  {
a7ab72390b7706 Peter Rosin        2016-04-20  339  	struct i2c_adapter *parent = muxc->parent;
0826374bff5741 Michael Lawnick    2010-08-11  340  	struct i2c_mux_priv *priv;
c9449affad2ae0 Gerlando Falauto   2014-11-13  341  	char symlink_name[20];
0826374bff5741 Michael Lawnick    2010-08-11  342  	int ret;
0826374bff5741 Michael Lawnick    2010-08-11  343  
a7ab72390b7706 Peter Rosin        2016-04-20  344  	if (muxc->num_adapters >= muxc->max_adapters) {
a7ab72390b7706 Peter Rosin        2016-04-20  345  		dev_err(muxc->dev, "No room for more i2c-mux adapters\n");
a7ab72390b7706 Peter Rosin        2016-04-20  346  		return -EINVAL;
a7ab72390b7706 Peter Rosin        2016-04-20  347  	}
a7ab72390b7706 Peter Rosin        2016-04-20  348  
a7ab72390b7706 Peter Rosin        2016-04-20  349  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
0826374bff5741 Michael Lawnick    2010-08-11  350  	if (!priv)
a7ab72390b7706 Peter Rosin        2016-04-20  351  		return -ENOMEM;
0826374bff5741 Michael Lawnick    2010-08-11  352  
0826374bff5741 Michael Lawnick    2010-08-11  353  	/* Set up private adapter data */
a7ab72390b7706 Peter Rosin        2016-04-20  354  	priv->muxc = muxc;
0826374bff5741 Michael Lawnick    2010-08-11  355  	priv->chan_id = chan_id;
0826374bff5741 Michael Lawnick    2010-08-11  356  
0826374bff5741 Michael Lawnick    2010-08-11  357  	/* Need to do algo dynamically because we don't know ahead
0826374bff5741 Michael Lawnick    2010-08-11  358  	 * of time what sort of physical adapter we'll be dealing with.
0826374bff5741 Michael Lawnick    2010-08-11  359  	 */
6ef91fcca8a8ba Peter Rosin        2016-05-04  360  	if (parent->algo->master_xfer) {
6ef91fcca8a8ba Peter Rosin        2016-05-04  361  		if (muxc->mux_locked)
614b1c3cbfb0ec Wolfram Sang       2025-06-12  362  			priv->algo.xfer = i2c_mux_master_xfer;
6ef91fcca8a8ba Peter Rosin        2016-05-04  363  		else
614b1c3cbfb0ec Wolfram Sang       2025-06-12  364  			priv->algo.xfer = __i2c_mux_master_xfer;
6ef91fcca8a8ba Peter Rosin        2016-05-04  365  	}
7168bff2cfd710 Wolfram Sang       2019-04-03  366  	if (parent->algo->master_xfer_atomic)
614b1c3cbfb0ec Wolfram Sang       2025-06-12  367  		priv->algo.xfer_atomic = priv->algo.master_xfer;
7168bff2cfd710 Wolfram Sang       2019-04-03  368  
6ef91fcca8a8ba Peter Rosin        2016-05-04  369  	if (parent->algo->smbus_xfer) {
6ef91fcca8a8ba Peter Rosin        2016-05-04  370  		if (muxc->mux_locked)
0826374bff5741 Michael Lawnick    2010-08-11  371  			priv->algo.smbus_xfer = i2c_mux_smbus_xfer;
6ef91fcca8a8ba Peter Rosin        2016-05-04  372  		else
6ef91fcca8a8ba Peter Rosin        2016-05-04  373  			priv->algo.smbus_xfer = __i2c_mux_smbus_xfer;
6ef91fcca8a8ba Peter Rosin        2016-05-04  374  	}
7168bff2cfd710 Wolfram Sang       2019-04-03  375  	if (parent->algo->smbus_xfer_atomic)
7168bff2cfd710 Wolfram Sang       2019-04-03  376  		priv->algo.smbus_xfer_atomic = priv->algo.smbus_xfer;
7168bff2cfd710 Wolfram Sang       2019-04-03  377  
0826374bff5741 Michael Lawnick    2010-08-11  378  	priv->algo.functionality = i2c_mux_functionality;
0826374bff5741 Michael Lawnick    2010-08-11  379  
0826374bff5741 Michael Lawnick    2010-08-11  380  	/* Now fill out new adapter structure */
0826374bff5741 Michael Lawnick    2010-08-11  381  	snprintf(priv->adap.name, sizeof(priv->adap.name),
0826374bff5741 Michael Lawnick    2010-08-11  382  		 "i2c-%d-mux (chan_id %d)", i2c_adapter_id(parent), chan_id);
0826374bff5741 Michael Lawnick    2010-08-11  383  	priv->adap.owner = THIS_MODULE;
0826374bff5741 Michael Lawnick    2010-08-11  384  	priv->adap.algo = &priv->algo;
0826374bff5741 Michael Lawnick    2010-08-11  385  	priv->adap.algo_data = priv;
0826374bff5741 Michael Lawnick    2010-08-11  386  	priv->adap.dev.parent = &parent->dev;
2212a8529eb06c Elie De Brauwer    2013-12-09  387  	priv->adap.retries = parent->retries;
2212a8529eb06c Elie De Brauwer    2013-12-09  388  	priv->adap.timeout = parent->timeout;
dc362d50ba94ea Alexander Sverdlin 2015-06-12  389  	priv->adap.quirks = parent->quirks;
d1ed7985b9a6b8 Peter Rosin        2016-08-25  390  	if (muxc->mux_locked)
d1ed7985b9a6b8 Peter Rosin        2016-08-25  391  		priv->adap.lock_ops = &i2c_mux_lock_ops;
d1ed7985b9a6b8 Peter Rosin        2016-08-25  392  	else
d1ed7985b9a6b8 Peter Rosin        2016-08-25  393  		priv->adap.lock_ops = &i2c_parent_lock_ops;
0826374bff5741 Michael Lawnick    2010-08-11  394  
bc45449b144461 David Daney        2012-04-12  395  	/*
bc45449b144461 David Daney        2012-04-12  396  	 * Try to populate the mux adapter's of_node, expands to
bc45449b144461 David Daney        2012-04-12  397  	 * nothing if !CONFIG_OF.
bc45449b144461 David Daney        2012-04-12  398  	 */
a7ab72390b7706 Peter Rosin        2016-04-20  399  	if (muxc->dev->of_node) {
b2d57b56047b99 Peter Rosin        2016-07-09  400  		struct device_node *dev_node = muxc->dev->of_node;
b2d57b56047b99 Peter Rosin        2016-07-09  401  		struct device_node *mux_node, *child = NULL;
bc45449b144461 David Daney        2012-04-12  402  		u32 reg;
bc45449b144461 David Daney        2012-04-12  403  
b2d57b56047b99 Peter Rosin        2016-07-09  404  		if (muxc->arbitrator)
b2d57b56047b99 Peter Rosin        2016-07-09  405  			mux_node = of_get_child_by_name(dev_node, "i2c-arb");
b2d57b56047b99 Peter Rosin        2016-07-09  406  		else if (muxc->gate)
b2d57b56047b99 Peter Rosin        2016-07-09  407  			mux_node = of_get_child_by_name(dev_node, "i2c-gate");
b2d57b56047b99 Peter Rosin        2016-07-09  408  		else
b2d57b56047b99 Peter Rosin        2016-07-09  409  			mux_node = of_get_child_by_name(dev_node, "i2c-mux");
b2d57b56047b99 Peter Rosin        2016-07-09  410  
b2d57b56047b99 Peter Rosin        2016-07-09  411  		if (mux_node) {
b2d57b56047b99 Peter Rosin        2016-07-09  412  			/* A "reg" property indicates an old-style DT entry */
b2d57b56047b99 Peter Rosin        2016-07-09  413  			if (!of_property_read_u32(mux_node, "reg", &reg)) {
b2d57b56047b99 Peter Rosin        2016-07-09  414  				of_node_put(mux_node);
b2d57b56047b99 Peter Rosin        2016-07-09  415  				mux_node = NULL;
b2d57b56047b99 Peter Rosin        2016-07-09  416  			}
b2d57b56047b99 Peter Rosin        2016-07-09  417  		}
b2d57b56047b99 Peter Rosin        2016-07-09  418  
b2d57b56047b99 Peter Rosin        2016-07-09  419  		if (!mux_node)
b2d57b56047b99 Peter Rosin        2016-07-09  420  			mux_node = of_node_get(dev_node);
b2d57b56047b99 Peter Rosin        2016-07-09  421  		else if (muxc->arbitrator || muxc->gate)
b2d57b56047b99 Peter Rosin        2016-07-09  422  			child = of_node_get(mux_node);
b2d57b56047b99 Peter Rosin        2016-07-09  423  
b2d57b56047b99 Peter Rosin        2016-07-09  424  		if (!child) {
b2d57b56047b99 Peter Rosin        2016-07-09  425  			for_each_child_of_node(mux_node, child) {
bc45449b144461 David Daney        2012-04-12  426  				ret = of_property_read_u32(child, "reg", &reg);
bc45449b144461 David Daney        2012-04-12  427  				if (ret)
bc45449b144461 David Daney        2012-04-12  428  					continue;
b2d57b56047b99 Peter Rosin        2016-07-09  429  				if (chan_id == reg)
bc45449b144461 David Daney        2012-04-12  430  					break;
bc45449b144461 David Daney        2012-04-12  431  			}
64f0150a54ef60 Marcus Folkesson   2025-10-02  432  		}
64f0150a54ef60 Marcus Folkesson   2025-10-02  433  
64f0150a54ef60 Marcus Folkesson   2025-10-02  434  		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
64f0150a54ef60 Marcus Folkesson   2025-10-02  435  
64f0150a54ef60 Marcus Folkesson   2025-10-02  436  		/*
64f0150a54ef60 Marcus Folkesson   2025-10-02  437  		 * Warn if the mux adapter is not parent-locked as
64f0150a54ef60 Marcus Folkesson   2025-10-02  438  		 * this may cause issues for some hardware topologies.
64f0150a54ef60 Marcus Folkesson   2025-10-02  439  		 */
64f0150a54ef60 Marcus Folkesson   2025-10-02  440  		if ((priv->adap.clock_hz < parent->clock_hz) && muxc->mux_locked)
64f0150a54ef60 Marcus Folkesson   2025-10-02  441  			dev_warn(muxc->dev,
64f0150a54ef60 Marcus Folkesson   2025-10-02  442  				 "channel %u is slower than parent on a non parent-locked mux\n",
64f0150a54ef60 Marcus Folkesson   2025-10-02  443  				 chan_id);
64f0150a54ef60 Marcus Folkesson   2025-10-02  444  
64f0150a54ef60 Marcus Folkesson   2025-10-02  445  		/* If the mux adapter has no clock-frequency property, inherit from parent */
64f0150a54ef60 Marcus Folkesson   2025-10-02  446  		if (!priv->adap.clock_hz)
64f0150a54ef60 Marcus Folkesson   2025-10-02  447  			priv->adap.clock_hz = parent->clock_hz;
64f0150a54ef60 Marcus Folkesson   2025-10-02  448  
64f0150a54ef60 Marcus Folkesson   2025-10-02  449  		/* We don't support mux adapters faster than their parent */
64f0150a54ef60 Marcus Folkesson   2025-10-02  450  		if (priv->adap.clock_hz > parent->clock_hz) {
64f0150a54ef60 Marcus Folkesson   2025-10-02  451  			dev_err(muxc->dev,
64f0150a54ef60 Marcus Folkesson   2025-10-02  452  				"channel (%u) is faster (%u) than parent (%u)\n",
64f0150a54ef60 Marcus Folkesson   2025-10-02  453  				chan_id, priv->adap.clock_hz, parent->clock_hz);
64f0150a54ef60 Marcus Folkesson   2025-10-02  454  
64f0150a54ef60 Marcus Folkesson   2025-10-02  455  			of_node_put(mux_node);
64f0150a54ef60 Marcus Folkesson   2025-10-02  456  			goto err_free_priv;

ret = -EINVAL;

bc45449b144461 David Daney        2012-04-12  457  		}
b2d57b56047b99 Peter Rosin        2016-07-09  458  
b2d57b56047b99 Peter Rosin        2016-07-09  459  		priv->adap.dev.of_node = child;
b2d57b56047b99 Peter Rosin        2016-07-09  460  		of_node_put(mux_node);
bc45449b144461 David Daney        2012-04-12  461  	}
bc45449b144461 David Daney        2012-04-12  462  
8eb5c87a92c065 Dustin Byford      2015-10-23  463  	/*
8eb5c87a92c065 Dustin Byford      2015-10-23  464  	 * Associate the mux channel with an ACPI node.
8eb5c87a92c065 Dustin Byford      2015-10-23  465  	 */
a7ab72390b7706 Peter Rosin        2016-04-20  466  	if (has_acpi_companion(muxc->dev))
a7ab72390b7706 Peter Rosin        2016-04-20  467  		acpi_preset_companion(&priv->adap.dev,
a7ab72390b7706 Peter Rosin        2016-04-20  468  				      ACPI_COMPANION(muxc->dev),
8eb5c87a92c065 Dustin Byford      2015-10-23  469  				      chan_id);
8eb5c87a92c065 Dustin Byford      2015-10-23  470  
0826374bff5741 Michael Lawnick    2010-08-11  471  	if (force_nr) {
0826374bff5741 Michael Lawnick    2010-08-11  472  		priv->adap.nr = force_nr;
0826374bff5741 Michael Lawnick    2010-08-11  473  		ret = i2c_add_numbered_adapter(&priv->adap);
9fce894d03a98e Peter Rosin        2017-05-15  474  		if (ret < 0) {
8d4d159f25a79b Peter Rosin        2017-04-03  475  			dev_err(&parent->dev,
8d4d159f25a79b Peter Rosin        2017-04-03  476  				"failed to add mux-adapter %u as bus %u (error=%d)\n",
8d4d159f25a79b Peter Rosin        2017-04-03  477  				chan_id, force_nr, ret);
9fce894d03a98e Peter Rosin        2017-05-15  478  			goto err_free_priv;
9fce894d03a98e Peter Rosin        2017-05-15  479  		}
0826374bff5741 Michael Lawnick    2010-08-11  480  	} else {
0826374bff5741 Michael Lawnick    2010-08-11  481  		ret = i2c_add_adapter(&priv->adap);
9fce894d03a98e Peter Rosin        2017-05-15  482  		if (ret < 0) {
8d4d159f25a79b Peter Rosin        2017-04-03  483  			dev_err(&parent->dev,
8d4d159f25a79b Peter Rosin        2017-04-03  484  				"failed to add mux-adapter %u (error=%d)\n",
8d4d159f25a79b Peter Rosin        2017-04-03  485  				chan_id, ret);
9fce894d03a98e Peter Rosin        2017-05-15  486  			goto err_free_priv;
0826374bff5741 Michael Lawnick    2010-08-11  487  		}
0826374bff5741 Michael Lawnick    2010-08-11  488  	}
0826374bff5741 Michael Lawnick    2010-08-11  489  
a7ab72390b7706 Peter Rosin        2016-04-20  490  	WARN(sysfs_create_link(&priv->adap.dev.kobj, &muxc->dev->kobj,
a7ab72390b7706 Peter Rosin        2016-04-20  491  			       "mux_device"),
51cf3b0e2a72bb Wolfram Sang       2014-11-13  492  	     "can't create symlink to mux device\n");
51cf3b0e2a72bb Wolfram Sang       2014-11-13  493  
c9449affad2ae0 Gerlando Falauto   2014-11-13  494  	snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
a7ab72390b7706 Peter Rosin        2016-04-20  495  	WARN(sysfs_create_link(&muxc->dev->kobj, &priv->adap.dev.kobj,
a7ab72390b7706 Peter Rosin        2016-04-20  496  			       symlink_name),
f657c9fe268882 Wolfram Sang       2018-05-21  497  	     "can't create symlink to channel %u\n", chan_id);
0826374bff5741 Michael Lawnick    2010-08-11  498  	dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
0826374bff5741 Michael Lawnick    2010-08-11  499  		 i2c_adapter_id(&priv->adap));
0826374bff5741 Michael Lawnick    2010-08-11  500  
a7ab72390b7706 Peter Rosin        2016-04-20  501  	muxc->adapter[muxc->num_adapters++] = &priv->adap;
a7ab72390b7706 Peter Rosin        2016-04-20  502  	return 0;
9fce894d03a98e Peter Rosin        2017-05-15  503  
9fce894d03a98e Peter Rosin        2017-05-15  504  err_free_priv:
9fce894d03a98e Peter Rosin        2017-05-15  505  	kfree(priv);
9fce894d03a98e Peter Rosin        2017-05-15 @506  	return ret;
0826374bff5741 Michael Lawnick    2010-08-11  507  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


