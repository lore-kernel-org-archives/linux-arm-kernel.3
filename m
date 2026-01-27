Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32869D2D8D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYavw6x53D+W7due+b8gS5tyQNfFTRfLXC6wxOL1kAQ=; b=PQoxa6xQf/Hru9bswZinHpXdLA
	9kTKETW1aVqln17JIhtSmWxNz8ANOCCQ0UXQ/RXJ7GIS3sE2fnWpSqrslRkgElnPwjqUHsu7zY9Iz
	j1EShCySvEbOhvbVodOXudn3NgscoJ0+G5hSXbHq9tfZgju9+M3SHT8raEGaA/X1SoYo3n6PkpeSN
	NRaeAvVGUUo7jEVJbktaWPDjnGBQAm3UATsKtEIamuBfidxEjnV/YT7c0g5eifI/a5actzzpsk9SM
	gPMTv4uxKTQ+COIUkWyLmPY8ZyAgwc6YQocwwu1XOtP2vMwNPoO4hzpt3PGYSd5FjhjlBMbQuUcU+
	JVkHYwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfcq-0000000Dz2k-1kl6;
	Tue, 27 Jan 2026 09:44:44 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfcl-0000000Dz1A-0RZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507079; x=1801043079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jPvLZnphMdcVN/l/3xsINCKdek0m9norh4P5F7hOiDI=;
  b=Z2nNllUnUU0kPJ87c8W6YDULEOR1VRWKCQ17XsYMZeEH2qVbxKvwFD6j
   FtwtAWSx+EsirLE5Q56XDo1GQiIdQT79phZDdP7A6YDJq1dKN9WaB7Qau
   VTvOrQYI/7ANlf2fIC7urt5RPRDU0RtItMTpEeQofwIOI5w1+sApjNXo0
   NCrOFjosZhhGVVy/iK3uSDRWOD+qekUzR5HaAKWNi6UDB2E7fwa03K+10
   UUnwgzAJU8mjRpSmDvGdUpXsMow3nbd2Vy5r8x6dZn0QFV0BnllXlwGkd
   L81uVOCR9wkzVzFlJ0PtRsoXVkwTmHuC1ENXMJ5Nr0C0uvqBhYF8rxQmR
   A==;
X-CSE-ConnectionGUID: Ade1BYw8QXSySG92T6eYPA==
X-CSE-MsgGUID: 6l/Q75feR6S9C9JZUEXxcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70416856"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70416856"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:44:38 -0800
X-CSE-ConnectionGUID: 8UUpICqfQcST4/sJ1x6n/g==
X-CSE-MsgGUID: k0n/UH1wQ0meFryrjQEfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212909062"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:44:35 -0800
Date: Tue, 27 Jan 2026 11:44:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/6] i2c: xiic: cosmetic cleanup
Message-ID: <aXiJADHPJ0NXLVNa@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-6-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-6-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014439_189270_D569AFB0 
X-CRM114-Status: GOOD (  11.71  )
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

On Mon, Jan 26, 2026 at 05:08:21PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Re-use dev pointer instead of referencing &pdev->dev everywhere.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
A couple of nit-picks to be addressed though.

...

> -	i2c->dev = &pdev->dev;
> -	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
> -	pm_runtime_use_autosuspend(i2c->dev);
> +	i2c->dev = dev;

+ blank line here.

> +	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
> +	pm_runtime_use_autosuspend(dev);
>  	ret = devm_pm_runtime_set_active_enabled(dev);
>  	if (ret < 0)
>  		return ret;

...

>  	ret = xiic_reinit(i2c);
>  	if (ret < 0) {
> -		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
> +		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
>  		return ret;
>  	}

It should be integrated in the second patch or so, I have already commented on
that.

...

> -	ret = pm_runtime_get_sync(i2c->dev);
> +	ret = pm_runtime_get_sync(dev);

>  

Drop this blank line as well.

>  	if (ret < 0)
> -		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
> +		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
>  			 ERR_PTR(ret));
>  	else
>  		xiic_deinit(i2c);

-- 
With Best Regards,
Andy Shevchenko



