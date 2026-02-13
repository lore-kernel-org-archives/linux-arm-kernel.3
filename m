Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09618EE369A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eyggfxqXQm5yOG9/vAbEEIHqaGMvmk6satEJYTdoBlk=; b=2a/Zv9iAUKw/2EpIipv4wHm4tL
	PBHkaXieSTxnq15F6AguO4MUL9roZ6emjtkRqd5YqZ601AMYJP0qIJOV3RMH15FpK63qgMWl1fKhW
	05KcYeYJXSygONGrMao2uOobCc2H4KhAsc7ew9hlHPinokPEt6chusx/Iwrc9DofmCbEleLdBD0XZ
	YSHeLSJF5gaYN+7VDvAKeJ7WfbJLUAHR0rgY8uXFaylmBUYMaNCSwd/eVPfkSrNFFS81L8bO3vjNU
	q1wTyN7lmU3bkqWWZtrqt438YR36fYlgI69JWRf0BGjHbcxKqUcv+VtxbXHsAFQqDy11Zxbm+kftv
	UEvKUPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpZ6-00000003FBI-3wl6;
	Fri, 13 Feb 2026 09:34:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpZ5-00000003FAH-0V1h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 09:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770975259; x=1802511259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2WYAevwv/bre8sXgj9rzmMSY8BHqfPohwWP/K3U+PM=;
  b=R1uNWkjX0v6aJCwbEpppCCCgTGAUsEAZ4EJm8JB6fYCrff54wRhgaUfS
   Rumx/VIu/Wuf3p+g+XLRPv2uF+hpDJqTzbZ+mmvREAmRFA2MLcMx2qyRy
   qNScug/tEOqXGjy+CRXXuXzvNsZRxzhklq/dEhJXpsJyyWetHOV3qLH4C
   niTiPbjz8NA9jUSwXdFPRSATwqZ1f3eQikps9ec4LwBECpfP7drg/hDpI
   AUBXvbgEvUJBVLzo93py8RiL+dCrYE2g7p8/9GQn0Y5MbTU1Xpg65Ol7z
   HRAZz7bqjE5tS1x1NbEt6dV01XaFfTr6DxcU5GYsceg3o5sSvBu7J0Y10
   w==;
X-CSE-ConnectionGUID: CzG60mZ2SG+0BiMh4h0F6Q==
X-CSE-MsgGUID: yTZq22MmQlG6CbD9L5K7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="82792038"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="82792038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:34:18 -0800
X-CSE-ConnectionGUID: r3qh6X7TScGQFOLfBlP3Lw==
X-CSE-MsgGUID: xwZTVq/PTcm2YlPgSq7zMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212910054"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:34:15 -0800
Date: Fri, 13 Feb 2026 11:34:13 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <aY7wFbwUr3KLT0Zi@smile.fi.intel.com>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
 <20260213-i2c-xiic-v11-7-5d18aea11bde@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-i2c-xiic-v11-7-5d18aea11bde@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_013419_220708_1CF11BB3 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Feb 13, 2026 at 12:15:22AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Currently Linux does not implement ACPI ClockInput() resource to describe
> clocks, unlike DT. However the xiic driver is happy if something
> magically enables the clock before the driver probes, and does not
> turn it off again. The clock should always be considered optional for
> ACPI.

...

> +	if (is_of_node(dev_fwnode(dev))) {

You would want to have

	struct fwnode_handle *fwnode = dev_fwnode(dev);

at the top now, as here is the second time it's being used.
Perhaps it makes sense to do in the patch that switches to
agnostic device property interface.

In any case, wait a few days before doing any new version, unless Andi asks
you for it. The first 6 patches may be already applied as is, in such a case
the above comment can be addressed here (with a little churn of touching
a line that has been already modified in the series).

> +		i2c->clk = devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(i2c->clk))
> +			return dev_err_probe(dev, PTR_ERR(i2c->clk),
> +					"failed to enable input clock.\n");
> +	}

-- 
With Best Regards,
Andy Shevchenko



