Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E504E95374
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyTpBAyQI5OR7vNweD0HHwtT71emEXEcP1PrKJwpdlI=; b=cUimTbcL0EPtwhKcEvJo/BQEYv
	NAsXzXzSXoxWAqM58SxMHW/RDXZraceuJUJKxEuqgpVmiDwFDN0kGNxRVWGEdNEb3OVRyu2rWqmit
	gn0tJRyBT5TnelPsd/Z5sbpxrzj9hw+tyZDGTjR2nDzvVrgJs58OMvnu3Mlpj2/Gw3YrjBt4VFiG8
	/NG8Orm9AXaxeOZ+RPMwoyRoTFs9BvhRMBdtElkF5GaOWssaEBDwb0noO+Ss4TNVBnKxBT0s9qAXM
	GrLG/KWaI4eKDzdUnQ7X4JwznSLYvtbIh6qQINCmf9Ce5yXdOuUs7dj3p8FgyR7uBDtrN1B4XDan0
	ERB/72Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZra-00000008Gru-1Wg1;
	Wed, 04 Feb 2026 10:11:58 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZrX-00000008Gr7-2yXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770199915; x=1801735915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCztL+ZGIqEKl+3prqcGfzggNapxW9kzpdyfA9ixefg=;
  b=iZNq96JM3U0lovQnWzcmReh3Es0PnSZEVpHeKeYa4f0J+RAOePsQTGFa
   mExvPPc5t8Os3l8rBiB59HnIayath7TI4mnKM08ogYzWMFYM5vxaAdXcp
   SSjHTLNXd+0EC6ZhZpJouuB3Q/0VqvgrH6P7XN4McDzKQWDVmNG9r7kZz
   CjNNS9J6gtnnih962p+zFoN5Doxd1QmHdL3bExobnFb2Ab9hToyDGm/td
   tWzKAGvgN8l2i8w6SKiR7Ukqj8udblapHKEE885KZYpVhlROnX8wgM3ry
   V7tqSM9O5UF/JT97RlsZYFmickyKIKXluZYx/sL3eBA59x6vhx0E5d6i4
   g==;
X-CSE-ConnectionGUID: HaKpHEU5Rye2mn034+6tcQ==
X-CSE-MsgGUID: eAKnXX9PQCeruI0D96eBbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75004736"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="75004736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:11:52 -0800
X-CSE-ConnectionGUID: jygyKsJoSMi7YU6MZZBLBw==
X-CSE-MsgGUID: ExVi6qRYQre5wvCap/MlSQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:11:49 -0800
Date: Wed, 4 Feb 2026 12:11:47 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
	abdurrahman@nexthop.ai, Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 1/7] i2c: xiic: switch to devres managed APIs
Message-ID: <aYMbY62uJo95yc1l@smile.fi.intel.com>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
 <20260204-i2c-xiic-v10-1-c2b996425235@nexthop.ai>
 <20260204100034.000050b2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204100034.000050b2@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_021155_816382_239C0853 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, Feb 04, 2026 at 10:00:34AM +0000, Jonathan Cameron wrote:
> On Wed, 04 Feb 2026 07:01:58 +0000
> Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org> wrote:

...

> > -	return 0;
> > -
> > -err_pm_disable:
> > -	pm_runtime_disable(&pdev->dev);
> > -	pm_runtime_set_suspended(&pdev->dev);
> > -
> >  	return ret;
> Trivial but if you are respinning...
> If you get here we know ret must be 0, so make that explicit to the reader as it
> was before with
> 	return 0;

> Otherwise they need to look up a few lines to realize that is true.

Right and this is already the line above, just wrong one was removed.

...

> > -	pm_runtime_disable(&pdev->dev);
> > -	pm_runtime_set_suspended(&pdev->dev);
> >  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 
> Take a look at docs for the devm_runtime_enable() that is called
> by the cleanup for devm_pm_runtime_set_active_enabled()
> 
> Short story, it will call pm_runtime_dont_use_autosuspend() for you

Good catch! It's not obvious from the devm_pm_*() naming... :-(

...

This definitely means v11 should be send at some point, but,
Abdurrahman, do not hurry with it, this series missed the cycle
anyway, we have a few *weeks* to polish this.

That said, send it after v6.20-rc1 (or v7.0-rc1) is out.

-- 
With Best Regards,
Andy Shevchenko



