Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F0C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKaH4FvG2TmXmEhvB0F9YmL5YMCxJ8VL8nIdi9ei9Dw=; b=CKLhJchcUB9Hs0oTTwP2Wshh7b
	IqZItjxKAC2YZUNskUMtasRGO4HmlPrl9uo6N+gRojeBVN85xM+NEw9oT/XQIVldvmYy9s4uLmL4t
	JBN/8658YUGA5d9GPg8YvS5FMnbf7jxqTKCHMZldvcsEWCByViu1eYWlJDCFFUFgc5lvUdqQkPt3j
	3G6vNbvZUtV9/Pum8U0vRgXzO/xdznnbsysMusPKp635hWOG08Y3gYZ7DoIL87wP1t2F7ApeA/QpR
	//ms13bzhxRV6zsIK5J1FVc1J8DcoV03/R2r3icEdrIb0tcWgk2hAX7o2DdxYN1iu3OAunsxB74ra
	8CEkB8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSTc-00000008OYD-0z1D;
	Wed, 09 Jul 2025 10:56:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQTM-000000081Bo-0nQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752050892; x=1783586892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ApbaFaUdVgbCLb3e8EMfbruCyFj7sOIBzssDOASSRBU=;
  b=klGITQAsuxbl5fOAYj72hSAaovfBcXWJwLV9L5r4AwZa4nG9h1AJAh+9
   fPqyILBOvibzhXRnvHJPRfninozqUQgp2Cewo8mfo+U9f0dqTYwDvjV53
   xD55v9wr3aVEybN76TCJuBeKfvvZ7RmP2RhegmAWkWEMrQgDhcWfqMNBX
   EI0r5QSxSXGAb8AwR0V7gI8xc7HaNhVE2AZTXmRSIX31wxrHKdrnfoZhh
   VQ6FRDwYZCXSQIuME/2GgrrAKer7Puc4cr+ThYGh7QGMbgIYuh7dWgasP
   Bfgdt3VkA8pJhXGce9T6XbG2Zs1xaBCPaMvcXXdONDYwK2gk/SjijSE5F
   Q==;
X-CSE-ConnectionGUID: DJeknpqfQJOLeqA9o0pOyQ==
X-CSE-MsgGUID: 9eBfWr2oQbqjEUHsCGUnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65366322"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="65366322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:48:11 -0700
X-CSE-ConnectionGUID: HJKTXCCZRRaFCsDbctY33g==
X-CSE-MsgGUID: zEhTeGJUQDGJ+h9nL519UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160029510"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 01:48:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uZQTE-0000000DoRa-3oNF;
	Wed, 09 Jul 2025 11:48:04 +0300
Date: Wed, 9 Jul 2025 11:48:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aG4sxEtXRw982Z9q@smile.fi.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
 <20250708231152.971550-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708231152.971550-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_014812_303972_D5D316F4 
X-CRM114-Status: GOOD (  11.09  )
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

On Wed, Jul 09, 2025 at 02:11:52AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().

...

> -	if (!enable) {
> -		pm_runtime_mark_last_busy(dev);
> +	if (!enable)
>  		pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return 0;
>  
>  err_put_pm:
> -	if (enable) {
> -		pm_runtime_mark_last_busy(dev);
> +	if (enable)
>  		pm_runtime_put_autosuspend(dev);
> -	}
>  
>  	return ret;


Hmm... Why not simply

	ret = 0;

err_put_pm:
	if (enable)
		pm_runtime_put_autosuspend(dev);

	return ret;

instead of the duplication?

-- 
With Best Regards,
Andy Shevchenko



