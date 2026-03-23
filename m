Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CADEC01C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2h4wu9ijG+KqC0akKVvmy1CDszrhRn5Tz8hcd6aAcU=; b=DA0JFSzPOBtcfaqsrK98J/EQ3q
	ESlNxaE3FY4Ep5e+8y6Dmb50/youK7HyGaJs2d4BbzBE7biCZ0cVUc/VTHZzucoqEnKdbF8DgXHw3
	6nyA7Whvz6hnLl6/4wLnbYrgvCQVFh2/kEnXSXqL9bQ8RVob9p/ZQCiRHYx2RcQEp09dpazOJCYUy
	liBRugBnrB+0DMsuhueFElqvh2Cb0VhUG2c4ZFnRr3aSJye0+PQZBUqkq7cT1SaxGMPf8YR50+fe7
	YCNRnxqRUhpNQT+09JwZe8Bqd1TMorkYypsbMhx2ekS+bdMRTtsFr3n1DaV88jbnuTcXaUdyzlRU4
	CKtT8e3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ctd-0000000GXuu-4Bpe;
	Mon, 23 Mar 2026 10:52:34 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ctc-0000000GXuJ-0Apn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774263152; x=1805799152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dYFyRYEwxpvZcJORzLC/7c9c4OiyVF87NhTBMWfsyQk=;
  b=SJpMRzZY3nrP4shyasf0b77XixVwyodfkpMGLaphOE6AAoeii+w9vONg
   ryRDPI6KdAJKj8se0x11sLRy1oS5ddbU6EPb0FvXP2oU+ee/rE2QRgI+R
   FGxv0w93CjM8/izr1kKfIFcRYCNeljHa1MSZim/fnwyZ24YV1ol4qdP5U
   KY2nSl0qd7NaZ3X+iXguGulJ2Fr3aKXPfYEQ1gZD1KGF4YOBMlt2plkox
   oZn0LFxJELGVxoOUCekdwa6h6LkeazxFIim9YOmrQxHC1Xh9dFbSeozfN
   4YsUJvnE0kLjfoB8/BfOZxdYuKL78aKNZiZwoMNXYv78jNVvOrlnjvD1l
   A==;
X-CSE-ConnectionGUID: xo0nuqbnQ/m9B2OKIc/Bsw==
X-CSE-MsgGUID: 0beHqq6dSm682eqY8yKr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78854042"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="78854042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:52:29 -0700
X-CSE-ConnectionGUID: CQ7Wgjq5SmObBNzJ4UBJgg==
X-CSE-MsgGUID: Eu6qvPOJTFi1hr7Iho4xsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="254467029"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:52:26 -0700
Date: Mon, 23 Mar 2026 12:52:23 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, saikrishna12468@gmail.com,
	git@amd.com
Subject: Re: [PATCH v2 3/4] iio: adc: xilinx-xadc: Add I2C interface support
Message-ID: <acEbZ0O3HKrGx0u1@ashevche-desk.local>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-4-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323074505.3853353-4-sai.krishna.potthuri@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_035232_142721_8F0B6142 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon, Mar 23, 2026 at 01:15:04PM +0530, Sai Krishna Potthuri wrote:
> Add I2C interface support for Xilinx System Management Wizard IP along
> with the existing AXI memory-mapped interface. This support enables
> monitoring the voltage and temperature on UltraScale+ devices where the
> System Management Wizard is connected via I2C.
> 
> Key changes:
> - Implement 32-bit DRP(Dynamic Reconfiguration Port) packet format as per
>   Xilinx PG185 specification.
> - Add separate I2C probe with xadc_i2c_of_match_table to handle same
>   compatible string("xlnx,system-management-wiz-1.3") on I2C bus.
> - Implement delayed version of hardware initialization for I2C interface
>   to handle the case where System Management Wizard IP is not ready during
>   the I2C probe.
> - Add NULL checks for get_dclk_rate callback function in sampling rate
>   functions to support interfaces without clock control
> - Create separate iio_info structure(xadc_i2c_info) without event
>   callbacks for I2C devices
> - Add xadc_i2c_transaction() function to handle I2C read/write operations
> - Add XADC_TYPE_US_I2C type to distinguish I2C interface from AXI

...

> -	if (xadc->ops->type == XADC_TYPE_US)
> +	if (xadc->ops->type == XADC_TYPE_US ||
> +	    xadc->ops->type == XADC_TYPE_US_I2C)

Can be one line.

>  		return 0;

...

>  	/* UltraScale has only one ADC and supports only continuous mode */
> -	if (xadc->ops->type == XADC_TYPE_US)
> +	if (xadc->ops->type == XADC_TYPE_US ||
> +	    xadc->ops->type == XADC_TYPE_US_I2C)


Ditto.

>  		return XADC_CONF1_SEQ_CONTINUOUS;

...

>  int xadc_write_samplerate(struct xadc *xadc, int val)
>  {
> -	unsigned long clk_rate = xadc_get_dclk_rate(xadc);
> +	unsigned long clk_rate;
>  	unsigned int div;
>  
> +	if (!xadc->ops->get_dclk_rate)
> +		return -EOPNOTSUPP;

> +	clk_rate = xadc_get_dclk_rate(xadc);
> +

Unneeded blank line.

Also, don't you asked for options?

>  	if (!clk_rate)
>  		return -EINVAL;

...

> +	i2c_set_clientdata(client, indio_dev);

Is it used?

-- 
With Best Regards,
Andy Shevchenko



