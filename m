Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD81606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpMRqMgB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pgry1aGh;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e7ZYYylW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w878p9VACeLLpl7740pkLWeHcq6k++Uy5zzDlCAnlQs=; b=HpMRqMgB2eon7MzTvOJmZQpPQc
	Ab5YcXTT3Jgz2iOtUtnOhVBvFJwl9iYK9dVjJXyj/aK9snyCEQp0iQpalZIqMDVjpvRxLDLre20i2
	YgUfFwXTF6SMnuG0k2e01kBVW7tDUKMul+wlHpo3OGt48qBN9j1mVPaY8WS21eDI9hhsKnBy4Xs2Q
	ZZ2Ui5Pj1bv7Zrp21qZLkuqzcAiUooWJlWGfA7V4jf+qyZ1Czyxb0wwUdIBtE9LW5rww4UMYfZlA7
	wIEfXrdC+BPU+Vi9nASAD9khKc5hDjnbXcHuv4AxmXqUw4AfDMTQhy9VI1IKMdCtLVXHDbh2dxY3F
	srL4O4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvm7-0000000EVHS-2oTr;
	Thu, 22 Oct 2026 16:36:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvm6-0000000EVHA-3EzY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 16:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w878p9VACeLLpl7740pkLWeHcq6k++Uy5zzDlCAnlQs=; b=pgry1aGhrNiD1jlchtYQPxTxmu
	o/hVpvFxk49vMKNOSb1aq8mlNDRxhGFZbRdfQEPS7Y98Y9YAxsRHGIW94cCWYRKArjhXtiXUGYVEV
	L9fjSUZjPzUJN/am+TPnUC9WST/rCQO3C3NQh7FG/P0QWWAN6gQh3ujsvXjYN8aajRKh3SRvbR1kG
	dcx/apl3I5doiT7OHHnOi3U8TlbJZHWouy2Fy8wZYh8zT3B9SqIo3m8uuQOrCUYRsGSifoq7i4B5l
	A12uibOLoJ9qVylM/sUn169WiAq08lwcv87WF03FJ1+a4BrRPFPgsWZF0UzG1Cn9xLGx1VlcjxYTk
	sSnHaRXw==;
Received: from mgamail.intel.com ([198.175.65.12])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvm0-00000007X2t-2nWJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792686972; x=1824222972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LEUYGSZsLTD/SVvD/2c4iL2H5I6h5X2TitS2F7JiFls=;
  b=e7ZYYylWaLA683ul1bPtW3EoYRZUNLPEzJyVzARYuHWK4c2IZVLUcLIq
   XAH/GBoki+KpFjTljtPY8yQnFbTm4tzmrZQ/YvMsWndC+oBaSFYazva/n
   +ckZv5jE6axgvQp8TnIkkgrOr4RZQaDMrs+OWwQ8xJjyOMjz8M8Ia2gAQ
   3RPJhtOwj6cAerQOB8QqIpBRrksf/z7n/EY4AqRTNJsXC8wyBaVRJAEaK
   yMaiJgmg1obdq+rBO73c7Ah1Llk22qUx+JU3PEWfHNvX2lqVuQCEpE8Pq
   xaaZKK+jtfKbDz8XL1Q1O0x5B5irqGLUBYrFCGU3nx3LoD/MRcnCUPiE5
   Q==;
X-CSE-ConnectionGUID: eb6oMcazQiuFQg7CpRJqfQ==
X-CSE-MsgGUID: CcjlWNNKSSyRE8wBqGX4vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1322240"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1322240"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:36:04 -0700
X-CSE-ConnectionGUID: 4Fy5l208SZq9IlKmHFfDBg==
X-CSE-MsgGUID: 8NNYp9l+TBSxuX5D/cFFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3478948"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:36:01 -0700
Date: Thu, 22 Oct 2026 19:35:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Message-ID: <ato7b3ydggC9X0_-@ashevche-desk.local>
References: <20261021225450.628499-1-kapoorarnav43@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021225450.628499-1-kapoorarnav43@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_173613_299380_73938BC9 
X-CRM114-Status: GOOD (  17.41  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 04:24:45AM +0530, Arnav Kapoor wrote:
> The driver ignores the return value of all the regmap accesses. If one
> of them fails, e.g. because the memory mapped registers can't be
> accessed, the driver just continues with an undefined state.

Can MMIO actually fail? It can give invalid values (due to HW being off or
wrong MMIO window). It can give a page fault, or some other error in HW,
but the read itself most likely never fails.

> The most severe case is the read of the FIFO in
> mx25_gcq_get_raw_value(): the destination variable is not initialized,
> so a failed read leaks uninitialized stack memory to userspace.
> 
> Check the return value of all the register accesses and propagate the
> errors to the caller. In the interrupt handler, where there is not much
> that can be done about a failed access, just don't use the content of
> the status register if it can't be read.

I consider this change an unneeded churn until you come up with real life
example of how MMIO fails (at least on this platform, not exactly with this
driver).

Yes, I aware that checking for error codes of regmap is a good manners and
style in general, but would we do jsut that in a standalone change?

-- 
With Best Regards,
Andy Shevchenko



