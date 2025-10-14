Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B86CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=; b=p7aHVTecUdbNZ5/E4XZeMwCT3T
	muuCjvvXHs9/+1PfetCSIORUMtdF1OJKp6yC4iF2Zwd4F2UdOhxiAZvDfnAYxpw0aaZMT9xNuNqGq
	hagfnn9XS97zbGKHJajYNzJKMzQfpfs6+B64H52K8xw1EuKG/168k6VCBKR+CbwGudmkszP9qbT+E
	Y4fCVzhEBlmlWcBL029pJ5p9sFZnmDNDFayTKbTTl5dwhaaDcuzkNsLcWE32V/gG2QSjd6xMIAvxf
	DwAyXtQM20uGO1E0YrNEvcpgumr06mlkOAmJssD9W8B2UCkV8yWQaa6KKfuOVPDzyrtFMcBZBEb2J
	o63lPtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFx-0000000G6Rk-0xVx;
	Tue, 14 Oct 2025 11:31:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFv-0000000G6Pq-0IO0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:31:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso4526128f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760441509; x=1761046309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=M43GP4F28JQCBdn0nUIJiA7Tszff9BoHL+q2Qsc2cxSKLlpY38QQE6nw0g2ECrlx8Z
         oG4JkmGdKfzQU2IpQU9AoyYGRrRRMUYbWyIjPYLHIo5vAUpvc3m8YnrdgaA/C1PFdIvE
         toaD2BqSoO0Izo+RZANyl+TEZPSE7IWBny2VP9AloValoqsNOTb8UehoKmJyAQvYmemj
         NSmQBPR2R537epzSjAX4iIlH8RcoLYHfLfJZgQYuapyoeLBmq0anK/OHAdlIwz2jbBoE
         AKkfvPuM8bovA6BFCx+s0GOhyvnbd8Foz15x0rHVnPbX1CP63kCIccyMvX0l3v0w2tzO
         NVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441509; x=1761046309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofkJNulQu/wtU9ucbaTHhfLlEv5BRzrjhZDncPD/y2M=;
        b=RAEgaASBhi1LOws2Bo3GlHcgWWDpGiaevnISqy+/R35e6DdNOF8CxMpQkJWQcTDUwS
         QW/EW2nkRO8WV9prHu2b6ieWvK6iFDWbBNSoeCGnc8In/B2NNUJy+WmsZsQzqMMdF19E
         UFtowwY7BFo5v4pj5F3eqLTAfAPfKiuVUrgf9J434OC7jE3LB71Yb8TLxd0PIebfvF74
         eIswFofGJ3DTMDMxPwwFT5QnhNbd4McK4IiQatHsK0DnQGzA9bmUV9YIHOJGh+4eppT5
         jLVU7fI6Ua5tqlx+1IuDqt9CJMe9tBIDo477WeJ3pgdX/0r/I0ORCYz/qzffA5L+e/HM
         op2A==
X-Forwarded-Encrypted: i=1; AJvYcCURHdLcqsjYZbMBQfQ7d0/FyBx/HWp4yNozgK2EJxblgDkGGkgiE1aZGo2FVBSAfunf/sPaFx+wqCa+Fi7gpqv1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb3HzGWHxOR+Vj8awGbnDjNLksy9GZnsesK0+QaFZZlQ2YDGxu
	XTAdWp3gmfZsCBGjpbmgSQCiPf9gPDTzCaCYFdXyRUOkmklEvTdfbtOKVMQCdTaH8kA=
X-Gm-Gg: ASbGnctGj/h0PuKXiAbGHRTF7FalTXJxBbwsx0RMVyjrisljwxjxcXry1qg9B+TVFlw
	LddL37I2AuW5zl5KLtqr+jQep7sINoM8Q60wspo15OcMjyfmk/BPytK54sJPHMtGSHxTY6UkKjV
	1AlD3FmTe10xSAkOC7n3m9cymY8k9OuXO4x3sGXTcEjMKJEz3qsYEcja2GYag8I+k7PJmPhtsLf
	vtYzF+IWrQplDO7Gd68VoaAQqFKcOdQNBnkbhfUqVnLna3exQRI5ai/t4kwK7OSeAIF4roVXrHl
	p1zUHj9YJGPGAP94qsssqgtEj5YeakPs2dnWeP4S4htrJbXXCWBzC63E5JcrokM6TfNd5BIU3VB
	QO4oUZHDmUKD/vaCSbOab/igO3Go4PH1N1SEgwBQMxlCpIvt+uQM=
X-Google-Smtp-Source: AGHT+IE7JRJVgX/0XRZqqgOQ0IMTJn2bfv2E4RS1BB14d24blTgxq9Or2UqVDIrAHI/wbElOafShvQ==
X-Received: by 2002:a05:6000:43c7:20b0:426:f355:7c9a with SMTP id ffacd0b85a97d-426f3557ce6mr628338f8f.25.1760441509084;
        Tue, 14 Oct 2025 04:31:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb49c4027sm234419565e9.17.2025.10.14.04.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:31:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:31:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <aO40oQkj9sT78bMV@stanley.mountain>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <202510121908.7aduLIkw-lkp@intel.com>
 <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043151_129635_389C254D 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, Oct 14, 2025 at 06:45:11PM +0800, Peng Fan wrote:
> Hi Dan,
> 
> I am not sure, Is this false alarm?
> 
> On Tue, Oct 14, 2025 at 11:39:41AM +0300, Dan Carpenter wrote:
> >Hi Peng,
> >
> >
> >vim +/ret +1841 drivers/remoteproc/remoteproc_core.c
> >
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
> >70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
> >c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
> >c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
> >7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
> >0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
> >c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
> >
> >Please change this to either "return 0;" or "return -ERRORCODE;"
> 
> ACQUIRE_ERR should already returns 0. This change does not change the
> assignment to ret as my understanding. Please help to see if this is false
> alarm or I miss something?
> 

I guess if this was already merged then it's fine.  But "return ret" looks
like an error path where "return 0;" is obvious.  This code will always
trigger a Smatch warning, and I always tell people that old code has been
reviewed so all the warnings are false positives, still someone will
eventually change this to "return -EINVAL;" because it looks so much like
a mistake.

regards,
dan carpenter


