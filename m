Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15C5D79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMs1murHakBZQTnyNoilEDWitql/RlrX1khzXhn2rWU=; b=StajguGJWPYT/ImyqbaOh9DEEN
	xbh3ogrgPUFSgTTU37Pj88ryKs36CZJU+3eWt+rMKKU57lHSpV1tKCiC6Qy4EGZs7e1lRFjmM/txP
	KlVSm0HENCQqq42VMDbY6ETPvRCceSlLJBuuslG+mKSu/BgWcsYQ3zWqgxFVIED0MwntUbBahw4Nr
	+Q9FaF8+Qdxhgue5nNLWumwco5hKurvC7U8ousEigiHWdLE3hs5xeUN7wTH+A7irgogJ/s3RYUU4F
	o/Z2A29tB2D3/ZWkU6kmYKudsQEPZPB/ONS17iyOU8vyDWiF3AV+vqIPk/w4Depa/eV4GOszbRj//
	jj2KVJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7wa-00000002TaE-1K8J;
	Sat, 31 Jan 2026 10:11:08 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm7wX-00000002TZr-40LY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769854266; x=1801390266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lPSRkXhyYoo04lDTt8FQmASYC0hGPW1luf8G308sWzw=;
  b=jqgojtrdF68cZn+fPsJX2AuVkx79jE/fhvCkATDMJnyxG6Q4GyJlEnPQ
   mgUHhXjtrmRuqNeM9g3l4KcM2ogNPJROzIkDpFuRNGPPWAKyfsW6snCbf
   afGDguzhP1LSoBkr4fBNVwEJ7gQX2ckOZdRPiqcINXDsvj+JtJKqA2ycx
   Eh5ubS8O2DocaIVgZ8CGp5QAVHkxfQvrxNzBkhaxwrSbx4qNJTrjByl6C
   iumaEa16aT7M3PZx+bLGPpCdM9DufBRTSQizuF2ZNE2jBV4FWQRsnaPkE
   KyiUtUWeyCzAI7IU0h4EIH8jHpl0NJsKzRwfOD9cUlDdN4MDQflzewirS
   Q==;
X-CSE-ConnectionGUID: CF5ZpreFTG6v1UOD2G5r6w==
X-CSE-MsgGUID: rgvewhn+Q6ibhVYPtxEeHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70294399"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70294399"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:11:04 -0800
X-CSE-ConnectionGUID: QUVF/r1ERrun+lwgjxqIHA==
X-CSE-MsgGUID: iyQ3i+59RI22i3wYlCRjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213564339"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:11:02 -0800
Date: Sat, 31 Jan 2026 12:10:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <aX3VMloJdfsrLh9i@smile.fi.intel.com>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_021106_008285_598E4173 
X-CRM114-Status: GOOD (  10.18  )
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

On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> The xiic driver supports operation without explicit clock configuration
> when clocks cannot be specified via firmware, such as on ACPI-based
> systems. This behavior is implemented in xiic_setclk(), which returns
> early when either i2c_clk or input_clk are zero.

...

> -	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(i2c->clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
> -				     "failed to enable input clock.\n");
> +	if (is_of_node(dev->fwnode)) {

Avoid dereferencing fwnode. Use dev_fwnode() API.

> +		i2c->clk = devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(i2c->clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
> +					"failed to enable input clock.\n");
> +	}

-- 
With Best Regards,
Andy Shevchenko



