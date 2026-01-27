Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3BCD19515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwXi2iEKt4ohjBom3MHhPfGwFDePZQVICIeAID/Bs64=; b=ogwGOMKa4h+tl1BFh8VukYUQsZ
	DHXehSe1Cw7/siIMgSx5z9P0fxBefWPuaemBmXYipUEteMrMpqHBDXLReu2R22vVLQdpjUoRlrnzD
	/gSTrUReScpwYOLwt9ri1Y7QUC/07VS/Pk66GwAQSh/qzPX8ktvct5rOHtq++uIuznSKBj1Qfr8Hy
	rJGrbynQDvyBqi8qHQof/16i5kfjBqMRur0t/Hktfm8uHn2Yn1waSlgMoAF7H5d6bCTvzieGCn1HY
	i9egkymeALsPtQ0ATfq34do+t4lSVy/sHqt+ZabgjpDX3sUHkgWJKCgs5tm1msCtI9v+5yLjtqeXq
	nO5wOsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfU8-0000000Dx2s-0cpG;
	Tue, 27 Jan 2026 09:35:44 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfU3-0000000Dx2O-2eCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769506539; x=1801042539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u9fgX4gOpXlnZ/mXQcZ3TbVrsG5fbHhYBvVFFPW/45E=;
  b=FN3hgyMAg41lqIcOEI6H8q8tx+45cEsU8TLJw9oqmK8jqxWX/QDaDdq6
   bC0sW/l9mcfYC3nVDdtRtMhRy21ZOHvZ/caAL9yAm7ge+fOY+WGbhGtlY
   w8qmbLb50LJ5nwL3vGNVxGfED0acdXfEBTlhqkXPuERTe2KBaYMCXnHeh
   gJZ0A2rySdXoFvTmsPdL1fV/RoWDHXJG+azZahkDTawkfVtgwTasxE1n5
   ykRnUwdxfCZSF8+Ni2UhkfkJOyxV0WDm0Kj2tPUeNBU626adtbEKFfh9X
   YxtTeYBNLG/c9cCYtGDizjY08boBqhlOOaAbTReDo5WhN9qWyzTT3/0jt
   g==;
X-CSE-ConnectionGUID: pQW1RDTERq2cBfgwoh1M0Q==
X-CSE-MsgGUID: wp+gTVRORCC0XpuOTjRJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70591257"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70591257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:35:39 -0800
X-CSE-ConnectionGUID: YSXB+yfTQSuClfxtWBR2zA==
X-CSE-MsgGUID: dA66sZBFQn2pvXbzeSQpag==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:35:36 -0800
Date: Tue, 27 Jan 2026 11:35:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] i2c: xiic: switch to devres managed APIs
Message-ID: <aXiG5p9BQ-vkAgbV@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-3-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-3-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013541_957173_26A3B4C0 
X-CRM114-Status: GOOD (  10.38  )
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

On Mon, Jan 26, 2026 at 05:08:18PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Simplify the error code paths by switching to devres managed helper
> functions.

Thanks for the update, my comments below.

...

> +	ret = devm_mutex_init(dev, &i2c->lock);
> +	if (ret < 0)

Why ' < 0'?

> +		return ret;

...

> +	ret = devm_pm_runtime_set_active_enabled(dev);
> +	if (ret < 0)

Ditto.

> +		return ret;

...

>  	if (ret < 0) {
>  		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
> -		goto err_pm_disable;
> +		return ret;

		return dev_err_probe(...);

>  	}

...

>  	ret = xiic_reinit(i2c);
>  	if (ret < 0) {
>  		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");

Ditto.

> -		goto err_pm_disable;
> +		return ret;
>  	}

...

>  	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
>  		(unsigned long)res->start, irq, i2c->i2c_clk);

Side note, consider using %pR instead of ugly casting for resources.
(separate change).

-- 
With Best Regards,
Andy Shevchenko



