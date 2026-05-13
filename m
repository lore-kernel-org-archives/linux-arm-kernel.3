Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9803ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIE7cQlAacYojpyg/Yr2JlzoQru5MX58F3i4qGlPMT0=; b=XlqPHA8uWTtSv24Et44ZL2MDNS
	U8lNXWHJnzM/kDtlUB5BrDovnAJYfe4mk49hQNW1IKl0OuRVs3szS67DRh0WFDu4RsDQXhrJ+OpVR
	3OJsA1lhnOigbsjMSQxPpx+UWA/sYBQ5D2SdB1nBknoNFqaV3O0C4Yk6sKkRn466kiVCs6u4Ez7Wp
	sheUY51yRfQM0ipfibPVf/yKV/9IuDvQ4fzG5ZKrSyxOsv3n3vh3aPyLizqU2ikHTr4upvZXRpYq/
	vlCR4oFaR2dITYWzprUHXbAV6daqMIZbfRt5Pt3Y0FaJ7/EWToyqOKiCWyWLeyhSPZWHp27UN4D0N
	kuewJnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDx8-00000003Qbs-1HaE;
	Wed, 13 May 2026 18:05:02 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDx5-00000003Qb9-37tW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778695500; x=1810231500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yhiVvKVYnE4pSsybhm4bMdvTBloUMTYhEHFkSnUr74Y=;
  b=L5+2rfqn2pSQz7B8voWWJwaxglmDGFFh8Cw7M87GbUG6ZIgRMba6lQQl
   dwOqvWZggfDq4afUctK4PWURXqoFdGtLWxJ4tRV5xe5OCQyVsJTdC082Y
   okhygKYsuMd9zyFTkB890hxeXlKOOKZVuMzg9cTbOBM/8oLCHx938DQgV
   XiNzjLQpwR9chikIMyBGSlTFOpIzCOjwXg5skDZqtbCCkBnwKjfRP3jqO
   VLRUUM6ZwNbWFzWXIqqw1kzZd1J9OxvX90uEvEGecGFwmXnTrEianGgSm
   UNpD497nTx9t5EmDti8fcFIQp32FFRvN9MAwNzlAIfekJ+KGT01P/D1ZK
   Q==;
X-CSE-ConnectionGUID: p73I/QAZRMioDdn3bZGv+w==
X-CSE-MsgGUID: EoS8Z1TzSsiRYZTtT30uyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79748288"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79748288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:04:59 -0700
X-CSE-ConnectionGUID: wT0TNYt/SjuaU0Dz0KFdlw==
X-CSE-MsgGUID: ARhHdZziQIeeuGgCC0lmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238044413"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 11:04:54 -0700
Date: Wed, 13 May 2026 21:04:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Message-ID: <agS9RGifDpgmgjfa@ashevche-desk.local>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_110459_797300_61354F9E 
X-CRM114-Status: GOOD (  12.76  )
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

On Wed, May 13, 2026 at 10:16:53AM -0700, Alex Tran wrote:
> SCMI client drivers do not consistently log the number of supported
> entities discovered from firmware. This information is useful during
> debugging because it shows which domains or resources were exposed by
> firmware during probe.
> 
> Add logging of the number of supported entities to the SCMI cpufreq,
> pinctrl, reset, hwmon, and powercap client drivers after a successful
> probe. This aligns these drivers with the existing logging in the SCMI
> power and performance domain drivers.

Too quick between the series, the v1 discussion is still ongoing.
Hence this should not be applied (at least yet).

Read Submitting Patches and other process documentation that suggest at least
24h period for review and in patch series even week or so.

> ---
> Changes in v2:
> - Use dev_dbg instead of dev_info log level
> - Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com


-- 
With Best Regards,
Andy Shevchenko



