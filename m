Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D31BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2BFe7K3Jqr3zc2Jm/fXXdIjbIppMSbGQlqaZTkCmqE=; b=Vj2Tw0AIoz3vxzcKYtil/O9YWZ
	YSOEw6bjT15EjE/grEc73rPl5xE6thZ9ddRYHhakCQBWlKJ4pbQkZcj5wHRhhS16kiPLKPNKhBlaR
	BZR5iDOIHrUSdBBgyQRqVZgFxLsbuH2R0yinbnEyX2LRGSEmzA9RO6rcKBN7kwc8ZHAyrWkWuSEyT
	La7xyyrZHFKTOkFqNU8wR5MexBbWtBnCHrVo1S+dYjEnSbkRaSsaejhSk2AY9sNztgXjHLqrnxVmp
	ZvVHgnBkzMACc2cfJnHlenbJe2PgMLWxWMe0oCcuc6dW0D3yaUbxpv5I8z2xVS19OqVn9cI5adCrA
	YnCsY0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTBM-00000002uGj-1ZLE;
	Fri, 22 Aug 2025 14:55:56 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOH4-0000000253K-0n7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755855690; x=1787391690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RZKftV/2n/t5kgoSakypDVxhxqhMEzE7Gy6hWmya91U=;
  b=QOt7Sl4FI+/gwek72VSCovIXtpyoAvoI4WB4gykS6kQ4F24vtqS7Zg85
   QZpNqVLfEe8A6KvtM9d/1nZZIKDKQuvA+fNktetqtT3YfSvyvL/vKRjsP
   RYbR9NrFQKYHsy07RASi5N9SuxYh+oIIWxY52pcadXQZR5J4ufzU1YvST
   RwP4hVick6vrl9YRj/nuO2zXf/NeCNMWnOIpCQiXusFTHKuVhyjHnsBoh
   cWtp6konsYLNC17SG4qfCbMmCxTMaGOfJ8LbDfGKH4SEFoUbZKyGXXxrD
   vMREkU2r7dqCQsa/wlzaE/A79HmcTXU2dBi4/M1vs3WXK4qbsiZZdGT3J
   g==;
X-CSE-ConnectionGUID: 5zzcF0GUR/u4/aDgunrAMg==
X-CSE-MsgGUID: obScCEeQRQ6clteMZOaeXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61994839"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="61994839"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:41:29 -0700
X-CSE-ConnectionGUID: 7dUmcja+THqiuGqu0CivaA==
X-CSE-MsgGUID: 0REQ5MhYReu1rNaxxngBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172857947"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:41:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1upOGs-00000007To4-2PQ4;
	Fri, 22 Aug 2025 12:41:18 +0300
Date: Fri, 22 Aug 2025 12:41:18 +0300
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
Subject: Re: [PATCH 02/10] iio: adc: Drop unnecessary -ENOMEM messages
Message-ID: <aKg7Ptj4jy4Icvgo@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-enomam_logs-v1-2-db87f2974552@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_024130_263668_9FE6D0B8 
X-CRM114-Status: GOOD (  12.26  )
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

On Fri, Aug 22, 2025 at 09:19:50AM +0530, Dixit Parmar wrote:
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().

...

>  	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*ddata));
> -	if (!indio_dev) {
> -		dev_err(&pdev->dev, "failed to allocate iio device\n");
> -
> +	if (!indio_dev)
>  		return -ENOMEM;
> -	}
> +
>  	ddata = iio_priv(indio_dev);
>  	ddata->ato = device_get_match_data(&pdev->dev);
>  	if (!ddata->ato)

Looking at this hunk I'm wondering if you are using --histogram diff algo when
preparing patches. If not, please do for the next version.

-- 
With Best Regards,
Andy Shevchenko



