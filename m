Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28389CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=; b=oHZA4uJTKRj7vu
	p7K5rAkBALJbGcnbkiu+feFv/stjOyJRnwF1oi1S1ZFz2LaNB9a70Vh0Qyn0uHmfavyya9ih92VNw
	/3gB9xKfdJ2bxANx3c5nYa6t6lc5rs2nao/Qk1gtqm22UPAUG8vzLh0CcThMPZmk/AfgHnYXgTxNS
	pQMtfnzmmgTspqLvGx22SYpeU4cVuqtvJ2sP9EFQfJHAv2Uds0tHAm7d+IomPaO1Yu4DNYCyJqQkn
	GfxY6dYNgQ+lTz7bAzF3P6/wI6Wn13SlKhLL3UAbQ5KrbFwF5HG+6g7Ux6ztdx/F7y7VUY8DbGNEN
	qZKJikIpjW/9f+oS1rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aZS-0000000FdvR-0Yk3;
	Tue, 14 Oct 2025 08:39:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aZP-0000000Fdv5-3Q9o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:39:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so3658478f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760431186; x=1761035986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
        b=OmxAJKzxmTLtIQGhd5Fk/H6te2wASiTFJK0JERo/xYIFp2RUJ/TpUtIIadrY9TOWb9
         MxLHPD3e3/EpLV2kjn52xT0qC/Mb5J/9xv2DIO41XmG689SXMw7Nb86ITfrFTuthAL0m
         2K7EsMw1aYwFZrwKdeFIQy3HqSwR6RZ+ue4D1chRlDxXB6HMXVp7bvz71ypT57EJ+/ZY
         YfRDsm5YRFtgYjRkguazjwegwyQ54S/4wCNA0jDJ5mKSu68qviKAJUXsO3BcQPZlSEpc
         yxGznqII24dZLBgd6noWtnHnxR2OCgdgJHMuAqO6TY/bHrjkT9V0pmoGsVVEcJhe0MQ8
         /jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760431186; x=1761035986;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFWOuvnUfMwybXOtMoOd4svMVvGqzTx63g0iMz9e+aA=;
        b=U6w4xQXgFWw0RB5CDMMZUdgPvUCljeCdwrDCe56/xmoubd6QSFP8uPF5zQXSaF8zLU
         oArRN4gdbQmGeUfdEmit1cn9GZdDdYkNAtUb6Kd7JcXJ2iuwim5Wk5r87okRccDtDbNQ
         KFGxtKTzNnGYXYvFo+XJsVRT/8FAizPyWivfQx4PcEfUVOsht/VSvQn/jiSorBePzTcV
         umgw7ygJNJkhRYFb+GgmkdnptLyYg+aP7l+H5i8rJCeFaQrPT9d/H+j/6dNv48Cn/zyM
         /CFN5qv+CLXw+xfeejiJoZHdythNd345FeleAnQcwZPg0RlCnw9OYyThNzZVQCg/ACe3
         d+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUr1po/1qs7YrBj/6VThOgkQDlxOY/p+SC2RI090zKM59vsEOfY0bo+dflLkIIdX+uZ54r+/uSRJ2ZdfRpWxemQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzgJUL5+m+ZIqrHrbKUAVa2/ziUzP/WtxF+sVLEleNl14HsAIkc
	ToihGqKtXV4qAmxbLU7lV9YwKozlM9aJWOE+RHdt2v9Psi39IIEu/dTBjOJzd74AMZw=
X-Gm-Gg: ASbGncuHUMLE6gwqRNjG57YJDFCs4BsfaLl/XdV2JNVUbtpP9Qlm9U2dEU4fyU50vMi
	0SSk/C4A/Lx4PjQp0yWYg6+qIlJ+86bPx+z7pVx0Gq0Oi0vF4QmzSUSBT968RcouSWdU0XK68Km
	gDTlKXL69xPCnbwu1oe3bD5W2EZYFHqatSKsz9auSv2gG8rVE1dQZdX2e3pq1MS1Sp2hMlsoj9Z
	RxpPO2dwObO/Sy4hIWhBAXia7Wg9EcvAFC7nvIsLBk9S0ig8TY6qqJzbW3LTyrfR2U7L5DgFX8H
	XkxusM53Xr7TorpWEJ3d4EpCB17wmvqNt+hVSxIdmXOI4o3cXmsHAI/vJgiFowXYDt+pL4EvaJj
	QlIXnxQOLqzttaxKL8JmDxrR2crt3SxiNPjX08xApxhslWuncwvLK6hC3I0qO9Q==
X-Google-Smtp-Source: AGHT+IFDjuNxGsj9w5KIK44evH4nW82BXa1kd591GncY0F3Cb/1CX97GoQ+hu6emUu0ZcgJJ0c1fpA==
X-Received: by 2002:a05:6000:40da:b0:3f8:8aa7:465d with SMTP id ffacd0b85a97d-4266e7d4580mr13949163f8f.30.1760431185690;
        Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e8a06sm22476317f8f.55.2025.10.14.01.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:39:45 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <202510121908.7aduLIkw-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_013947_915676_939DA451 
X-CRM114-Status: GOOD (  11.04  )
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

Hi Peng,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan/remoteproc-core-Drop-redundant-initialization-of-ret-in-rproc_shutdown/20251010-202737
base:   3b9b1f8df454caa453c7fb07689064edb2eda90a
patch link:    https://lore.kernel.org/r/20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c%40nxp.com
patch subject: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify lock handling
config: i386-randconfig-141-20251012 (https://download.01.org/0day-ci/archive/20251012/202510121908.7aduLIkw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510121908.7aduLIkw-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_core.c:1841 rproc_trigger_recovery() warn: missing error code? 'ret'
drivers/remoteproc/remoteproc_core.c:1993 rproc_shutdown() warn: missing error code? 'ret'

vim +/ret +1841 drivers/remoteproc/remoteproc_core.c

70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;

Please change this to either "return 0;" or "return -ERRORCODE;"

0b145574b6cd2b3 Alex Elder           2020-02-28  1842  
0b145574b6cd2b3 Alex Elder           2020-02-28  1843  	dev_err(dev, "recovering %s\n", rproc->name);
0b145574b6cd2b3 Alex Elder           2020-02-28  1844  
ba194232edc032b Peng Fan             2022-09-28  1845  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
ba194232edc032b Peng Fan             2022-09-28  1846  		ret = rproc_attach_recovery(rproc);
ba194232edc032b Peng Fan             2022-09-28  1847  	else
ba194232edc032b Peng Fan             2022-09-28  1848  		ret = rproc_boot_recovery(rproc);
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1849  
7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1850  	return ret;
70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1851  }

[ snip ]

c13b780c4597e1e Suman Anna           2022-02-13  1976  int rproc_shutdown(struct rproc *rproc)
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1977  {
b5ab5e24e960b9f Ohad Ben-Cohen       2012-05-30  1978  	struct device *dev = &rproc->dev;
ee3d85da617a065 Peng Fan             2025-10-10  1979  	int ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1980  
c42baf6f84c7694 Peng Fan             2025-10-10  1981  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
c42baf6f84c7694 Peng Fan             2025-10-10  1982  	ret = ACQUIRE_ERR(mutex_intr, &lock);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1983  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1984  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
c13b780c4597e1e Suman Anna           2022-02-13  1985  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1986  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1987  
c42baf6f84c7694 Peng Fan             2025-10-10  1988  	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
c42baf6f84c7694 Peng Fan             2025-10-10  1989  		return -EINVAL;
5e6a0e05270e3a4 Shengjiu Wang        2022-03-28  1990  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1991  	/* if the remote proc is still needed, bail out */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1992  	if (!atomic_dec_and_test(&rproc->power))
c42baf6f84c7694 Peng Fan             2025-10-10 @1993  		return ret;

Same.

400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1994  
fcd58037f28bf70 Arnaud Pouliquen     2018-04-10  1995  	ret = rproc_stop(rproc, false);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1996  	if (ret) {
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1997  		atomic_inc(&rproc->power);
c42baf6f84c7694 Peng Fan             2025-10-10  1998  		return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1999  	}
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2000  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2001  	/* clean up all acquired resources */
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2002  	rproc_resource_cleanup(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2003  
33467ac3c8dc805 Loic Pallardy        2020-04-16  2004  	/* release HW resources if needed */
33467ac3c8dc805 Loic Pallardy        2020-04-16  2005  	rproc_unprepare_device(rproc);
33467ac3c8dc805 Loic Pallardy        2020-04-16  2006  
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2007  	rproc_disable_iommu(rproc);
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2008  
988d204cdaf604c Bjorn Andersson      2016-08-11  2009  	/* Free the copy of the resource table */
a0c10687ec9506b Bjorn Andersson      2016-12-30  2010  	kfree(rproc->cached_table);
a0c10687ec9506b Bjorn Andersson      2016-12-30  2011  	rproc->cached_table = NULL;
988d204cdaf604c Bjorn Andersson      2016-08-11  2012  	rproc->table_ptr = NULL;
c42baf6f84c7694 Peng Fan             2025-10-10  2013  
c13b780c4597e1e Suman Anna           2022-02-13  2014  	return ret;
400e64df6b237eb Ohad Ben-Cohen       2011-10-20  2015  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


