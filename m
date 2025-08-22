Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AA8CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJ3WyXVoA1EYODa2Ml3HxN0afngAPn9sEFNCXLcyw9c=; b=O0rJDUJ1WHazShqiLzOA0lNAZx
	YivGZWRbdusw8AyrP/zgbjug5yvC5MNJTfYDdDQUujUDbh9O44z1hPtCyj1IBUN+GxeT1GqgM6KqA
	BZcXH7qpjGpsX/4vu5dR7NBKNPEkBkj3mnRByy/y0tEjDRu1oMIUJ/HXO7zqjiu47uFyGZkKri2U6
	H6s4M0BJ0VryWPWWTlsBIeLXyc8sDIm2D4kuv9OC+m/SWhW7a8Xq9SC0052Aq7SRWsB/JidJaCUp8
	KAs2FiPwZ0xkTOqJ/JRzEo/6KiFAN3B1viQRsnveaZzp/fgAsql98NvxxhCI9j+24qKialJcX8OvX
	WWA7krzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTq-00000004LU3-3PPq;
	Sat, 23 Aug 2025 08:20:06 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOF4-000000024fD-42K4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755855567; x=1787391567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7TUjIdFSpxdPwhWS7KavRP+nexN6+krDK0zXKT3Z4nI=;
  b=ISCpim4/n8ExZImxy85a3lnr7+XdrGY3jfYpQIM45jkNW90zmVBmLuZI
   yPBvA1a0y47F6+x5UKLg2Ar+Y6nxJlGxkHOalh2g5RRNtB3o536ity1Mr
   s2x+2EgmLVf7mwv/zpyPkp6Lazhfd8SimYyul4JHjoWYxMAvUoEAljozY
   n2svvColCexhRLdNoypt9YeHUo1dCp7e10bi4FRCDrs0s6BTPnupeRgvP
   A6hEF71/CWLpGNdjQDyNdhxFjQLbm6sXA8eOZT3M/hKzgp2gtU0gDUclq
   fIShpHFFNvw03X15lRYPYcciS5zASKqmU3OW6a3fLm2yom1F0vPWXWORl
   g==;
X-CSE-ConnectionGUID: IAN8UiMUT/qdBoouJT/qyQ==
X-CSE-MsgGUID: Uxz+AS7iSgmQHcfZkomerA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69260148"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69260148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:39:26 -0700
X-CSE-ConnectionGUID: f9G7SEp4RL+f9OQZP3DIVg==
X-CSE-MsgGUID: a3E0ehOpQtuXsOFDu60/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168177411"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:39:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1upOEu-00000007Tma-2yFG;
	Fri, 22 Aug 2025 12:39:16 +0300
Date: Fri, 22 Aug 2025 12:39:16 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 01/10] iio: accel: Drop unnecessary -ENOMEM messages
Message-ID: <aKg6xF4w2ugRqDMt@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023927_052096_D0CBC4AF 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, Aug 22, 2025 at 09:19:49AM +0530, Dixit Parmar wrote:
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().

Misplaced (), should be like
"...So remove the dev_err() messages from the probe."

Same applies to all of the affected commit messages in the series.

-- 
With Best Regards,
Andy Shevchenko



