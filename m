Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBBEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qHNBcErh/9Cb8Kz4D569n5ROv5RlS4x0QnaD2U5sJQ=; b=v4ayYyBxvR/D5URh5V2ADb/EvY
	U6u0BPSw8RtsI8dokCLya/hsUpBOS8W1t8j9KPN/cY1sv3gfnsIZtKUryi7tzWuJ2qdM1yrge/uQh
	GhDC1q+WuPFeCLW6at7Vzg81iXcI6ovuOJXDeS5N2uaqpAM9AMwOgXM6KzH38+BNPTU84QcilC/Na
	lVxl83PoJ4alPwzGO6MAql76kjo/9yxlSGP6EJLAsw7YY8UcPRnVZSQAk2GwavQt/s4Ly/MsfToak
	yR1FKxZI3dCnWlf/RSg7EXEk2CD7P+6lqT8jH5k5CrEe5VICtA5r/+Lwpv5vKtGjeJf86sTNwGY0Z
	cHnDNVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viThI-000000056kf-0TRq;
	Wed, 21 Jan 2026 08:36:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viThF-000000056kJ-1W8s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 08:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768984573; x=1800520573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AmAt/5VJ7tS0yWz5F1R0sjelT69xys6GeqwdR0QvhZE=;
  b=QsX2A0qFj2ZibFAhZmb4tEM5KlgMfM2O1vGvh//2QEgwvSXn0zZYeDU4
   i2fWKsGka13/FBtu55sCgbssrMJecBtOtezyOY7/nVDsi77MDsSFKN04I
   75GNIjmmZNkO700DfXhPE8yy5sjBDGcKLKSp9OdvwvX7U9Qj3tYvLlVbZ
   hPRbDaf0P68qaQzaI5WhmuEQcYPQtCKv0Oyx/BYii/5JCZE3TRldv1z9p
   +qRpikT8GvvLQC2HkY3tLgHaM3iAHdCJm2f/GZiQmZg4QuEY7PKR8fQGA
   X6/TNbgVZV+jJ+NsfUzWMPZy7EHZoIWQQeUETVBxrgXyItxtvBU4bTITa
   Q==;
X-CSE-ConnectionGUID: YVghSFbNRriFNlWVi6yATA==
X-CSE-MsgGUID: a+1+hHvVQdyLEjueFSIFVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80835382"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80835382"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:36:06 -0800
X-CSE-ConnectionGUID: y0n/W5e5TIy+9Z8MZXZB3Q==
X-CSE-MsgGUID: +PBGUecEQL+drmTeR2NE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205638284"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 21 Jan 2026 00:36:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5049498; Wed, 21 Jan 2026 09:36:03 +0100 (CET)
Date: Wed, 21 Jan 2026 09:36:03 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: add ACPI support
Message-ID: <aXCP87og_n1DLUKL@black.igk.intel.com>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115002846.25389-1-abdurrahman@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_003613_413011_C42A3647 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
> Use generic device property accessors.
> Make the clock optional assuming it's managed by firmware.

The generalisation parts are okay in a sense for prototyping, for ACPI-based
platforms, we want to see the proper _HID allocated by a platform vendor
(and maybe accompanied _CID allocated by the IP vendor).

Also you need to reshuffle header inclusions (removing of* and adding proper
headers following IWYU principle).

...

Add

	struct device *dev = &pdev->dev;

to the top of the function and use it everywhere.

>  	i2c->adap.dev.of_node = pdev->dev.of_node;
> +	ACPI_COMPANION_SET(&i2c->adap.dev, ACPI_COMPANION(&pdev->dev));

Instead of two lines, switch to

	device_set_node(...);

...

> -	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(i2c->clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
>  				     "failed to enable input clock.\n");

This needs to be in the separate change explaining why this is okay to go with.

-- 
With Best Regards,
Andy Shevchenko



