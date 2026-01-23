Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9D5D7234E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcdSI2BYUwRTaXA0Xsu5IrcsZZ1gCSwLvglKb+4kUSg=; b=kpW7sKnHZxWHVWdlsHTkp0vek6
	/GEnx7EQieXHpkioE4NRjUoJHlldBCqZUnKCWnqmXc8huX3GilCfb/kYXgiKoHMwCQKb+dUggmb/K
	oJLSNLT1X8i4hqGVXZpZZb13+E7Q3QuY0oTc1CJCQGPWdwohAuO4DH6Rj7JogW0a9rgIwmfMwoLJQ
	wBwAKAtzFK9LTz0LvpkpuKqfyDSJHpIhujvklm1z/BMtOuSENh4c9fGpnaPyzIrfQ1EGMLdLjc87x
	V92Q1LOxHsNJhEM1I356I4OrP1JWPwInLUoigaJ1KEuraIv9DdPJOaecWptw4m0lOrr6SR/cTxxhs
	2Vet5UbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCbv-00000008UNr-3XVX;
	Fri, 23 Jan 2026 08:33:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCbt-00000008UND-2YNH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769157222; x=1800693222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gk1j60etFb/57nufBO2p6AnquY9wEDbuevPIlPtzTqc=;
  b=oB4pa1HdHSbNucYeT+gzZIRFBLJ2fLt4xoQqEECKoka5zPag/Ce7RdqH
   H5eXT8w28gKfqvwN+p136dHGiMs8x09Ch1LHp+VLSwarwn8RvmeBKDnbl
   loOR0rdlf6mW3rCs3K5QixtCjzrIHByK8D+AZrXIYwsEb2QU9+Io3Bidi
   i3vExCv9deGzyuJAAayuDgl8wXowLEmabx5inqnrACGea3VEgWM/uU6W9
   mMB5DwXDFz8A79zD9v2cHf+aNZVWVIhl6reP1KdChZoWgHz59fEWCRTSX
   vXq1ZpZbY3o34LcunHzjI5gzHkx5X+imB6+N7Zfk/i+fanc8J7HqfYPZO
   A==;
X-CSE-ConnectionGUID: NPY4Var5QZiUehklSG0qfA==
X-CSE-MsgGUID: 8vIqKWvUTSWkQPZaWU9jGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="72996511"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="72996511"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:33:41 -0800
X-CSE-ConnectionGUID: HZ+78Hg8Qxq7puLNJ7VPkg==
X-CSE-MsgGUID: hGbVgeckSw6zw8C9ak/SZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206876189"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:33:39 -0800
Date: Fri, 23 Jan 2026 10:33:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] i2c: xiic: switch to generic device property
 accessors
Message-ID: <aXMyYbDVZjS4aFA2@smile.fi.intel.com>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-4-eb7cd4254dfb@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-i2c-xiic-v3-4-eb7cd4254dfb@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_003341_656986_399182AE 
X-CRM114-Status: UNSURE (   7.41  )
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

On Fri, Jan 23, 2026 at 08:02:47AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Use generic device property accessors.

...

> +	data = device_get_match_data(&pdev->dev);

Should use 'dev'.

> +	if (data)
>  		i2c->quirks = data->quirks;

...

> +	device_set_node(&i2c->adap.dev, dev_fwnode(&pdev->dev));

Ditto.

> +	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> +				       &i2c->i2c_clk);

Ditto and it will be a single line, I think.

	ret = device_property_read_u32(dev, "clock-frequency", &i2c->i2c_clk);

(yep, only 78 characters).

...

> -		of_property_read_bool(pdev->dev.of_node, "single-master");
> +		device_property_read_bool(&pdev->dev, "single-master");

Use 'dev'.

-- 
With Best Regards,
Andy Shevchenko



