Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4073D79773
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sVSIbao0S7N2+ApNZzv364LLiL6KFRy4sHA0aE5O/xE=; b=heGs6ktO6QUp2XNJFmWrZdo9zP
	ClzIk1Yw1SHotFX+6zfbNfOnoVHtFPbdl5pkpXsDFCqmTvpQXcX6e70XunDsoyhp3fq/hvu+OJM/L
	ACDdF9ssjyoYNeh2lzP2s4t8pBy1TEtCE0aorZnMF8aw1sSnnJ9KT1FJiKYdR8OF15kZQa4WLxxIm
	XnNsImY8KbjvHnb4Uv8zX85iDbqr8VkGkbKRqpR2CAwUw0LHzUjoJLIe5mNABmA78VyMtKQXFAlGW
	LGZ9ZOCsvQyMBQcxsEv72KE8Fvh7KCJ/745OeSYaYrPZNg1Sa6rQRsq++j0UXXHmjmHD8C1jX+OMZ
	4sr1SBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmC53-00000002i9l-2MjI;
	Sat, 31 Jan 2026 14:36:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmC4x-00000002i9P-1hf6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:36:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43590777e22so1874753f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769870161; x=1770474961; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sVSIbao0S7N2+ApNZzv364LLiL6KFRy4sHA0aE5O/xE=;
        b=gbrR7Y360yE45Z06Zv7Hg2XUZX4qRl9ZFopQowoeWguyvSqM17xfQwQU2vPslchJmd
         mwWDFYsdi0lBxGDRAz/zgEbhR9Kv1YtjpT1UICG948jKGQV00Pxb9rc+YlC5ONQiW+x0
         nVfZTU/ldONXZZVlNjrbhy/vT03cPQCob/Ya3bj8sfppDWmznYOlJbiTUWfevuKEGpzb
         ItzFJtk04yMFCdAQr34rp9twnxzoVXrlSiIQIIb7QqsvQ1ypwVlULD69ElZ6IAUTwY0I
         L8LGatgL3T62hlYyFOegnYHvsjWs5mV33dQNf2QVByibtolvYuej4dOkpz1Jbb0i6gOY
         kSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769870161; x=1770474961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVSIbao0S7N2+ApNZzv364LLiL6KFRy4sHA0aE5O/xE=;
        b=fOo9kaJqF7pUCa7rFWzYUgJ49FLX0lQOgt6XJl6dLgeFp6PHTopKRKqJwqxA7VN2D6
         jLCdComZ1YWRRepz9pO5NWaGLWPcNfS+cQWteRMCfTvyuxYCN3d7pbVsKAVBwlDS31uL
         3Y0bzoD35EmX4GbEjebMDaYs7wfsGHw16ZvDttSkX5UXn3KjG3/8l4oT1y/l1GzAtv9o
         aqAkzUvCBJPXzHBYA7gtn88kEhmGcOp1jBwv4r3t3MfPur8NGyU3N15Y862JFOe31Pnj
         XItYeuE/riquQCKuEr6+0idXO25iZ03HlBjjySmehLydclEYn68E7fDTt/rzTaqJRsC4
         S5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXhybs21eHSC5Rlq068QnXAnR3ea09UzEnibO3dVWKCH6aLbs62t7YqF/B4FzjqT++arAb9/jNYKBEM0GZvwdfE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa5VOrUBr1RpCVauaqc87mpBn0AS6LOob8jke2LJ4v5aqQBY7d
	W0YVcj4T4s2UGTMIqq+y0/F85l57VBgzGkW0uPkcgEue7cgLONB53gvaqCVzTl7KsX8=
X-Gm-Gg: AZuq6aL+Yki+wOeqOIMvAK0oy0wxrMLg6HhHqwgFD86KR++eJnP2eZ7Duiddmmml7n+
	e+cucsUzpdgFfuer3/bx5WVO19tWFB1h+VMLKTYbcq823Ab4pDUSRWO3DMNcFQBkUJrvX3TIN4z
	kWUlnoIOcjXYg4UD+fT3WtfZOjUORFoBmJrhJCeBnlHGJk8r4HUhBx3aOdjOMXOWnB20i30BlgX
	7QGLY1NfCTiNghzDei4Hx1+Uy2zzCBCpQEUIlOrHWdNwRq6e7qc/GXTAJzMRbIRSP8LjxWlUnFr
	/ie7NsH4BBkAqA9zhMfKZAOxsOYXsWYSGDY6JOAGrjQU9X9moZ0Xj237txDldhCJelK443FOJh3
	GzAK27dVAv388ekwlZplJ+tTkUnFT17d8QO78LS4jGugiDoUfsFJGb4ITF8SzIVc0xB9QH8j9+U
	rT5cZUQT0gDUqvoTP9
X-Received: by 2002:a05:6000:4382:b0:435:99d5:9d8f with SMTP id ffacd0b85a97d-435f3a742f4mr9016413f8f.19.1769870160665;
        Sat, 31 Jan 2026 06:36:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm29840712f8f.11.2026.01.31.06.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:36:00 -0800 (PST)
Date: Sat, 31 Jan 2026 17:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
Message-ID: <202601311615.10yziOui-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129-i2c-xiic-v7-5-727e434897ef@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_063603_498961_9D265F04 
X-CRM114-Status: UNSURE (   8.98  )
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

Hi Abdurrahman,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130-054653
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434897ef%40nexthop.ai
patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_get_sync() also returns 1 on success

vim +1539 drivers/i2c/busses/i2c-xiic.c

e190a0c389e601 Uwe Kleine-König    2023-05-08  1529  static void xiic_i2c_remove(struct platform_device *pdev)
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1530  {
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531  	struct device *dev = &pdev->dev;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1532  	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533  	int ret;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1534  
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1535  	/* remove adapter & data */
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1536  	i2c_del_adapter(&i2c->adap);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1537  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538  	ret = pm_runtime_get_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539  	if (ret)
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
810199f7315604 Uwe Kleine-König    2022-10-19  1541  			 ERR_PTR(ret));


pm_runtime_get_sync() can return 1 on success.  Perhaps use
pm_runtime_resume_and_get()?

810199f7315604 Uwe Kleine-König    2022-10-19  1542  	else
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1543  		xiic_deinit(i2c);
810199f7315604 Uwe Kleine-König    2022-10-19  1544  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545  	pm_runtime_put_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546  	pm_runtime_dont_use_autosuspend(dev);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1547  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


