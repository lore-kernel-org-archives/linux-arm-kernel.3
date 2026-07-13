Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CEFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eXBpWbviecDKppTWwg8dkHBEfdI8wp9XjN/TbkZ4Ak=; b=lr+m/75Pg7WmcNzzvNxp9Bxk7g
	vOMX5eqKIJbsEmzuHp+7OIVmfEeCdO/GeTKZsOezCm0y4zzzuWK1xsEgSltGecFzgjvVS4k6bmgnT
	P59nk5zXHPEqFvvAE76t9b5i+jkgzuGznVFWAea2TU+p41U15ErJEtRi2uvDvhWI92rZgAWQgifXb
	z7hCGEuB3DSjliM2bVcpe3DaaD356HEeq49I/NVkIlJeZ+okuaZFxiUY3QGudxflZujWGrnVvIhR+
	N/+X0FtU3UcA6Rt7+ofRflInM0IJG/qtQ7N9cFiUE238RWahlg8kHvHAVJ7hVI36nhzb53qPBs/NP
	HpZ69Ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJFv-00000009usT-25hk;
	Mon, 13 Jul 2026 16:11:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJFt-00000009urs-2tSn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 16:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9eXBpWbviecDKppTWwg8dkHBEfdI8wp9XjN/TbkZ4Ak=; b=jLBAONMo7xwv+gvLe+MsO3KH5g
	um7TpEP8mK8qQWCNrTrZyTebxnj7ML6U0g171WpxY7XaN79JfAK623mLiDTnaOjibx33lBGiYclsw
	gWWWgciFhqKx7qO0kHtI7q3UgbylSKim3plup/xE5+Rg5n2PdZLvrZeWJEqz1NxTMBXCSaJGn3DFn
	W8jxbzgbCxZqdA+KYLlly9FtLsOB3IfB+qg3cbq/MZvXaHItPsmIV+Wj8Id6ua1paupzZtgbCpaWZ
	U48vnBCSO7A1zCH4DPLUFh3v6DbGidYdndjJbFdn9z/ZMqzACURlIlQUG5frxvpOIB3NkPTT6II+T
	Y9Na+rxw==;
Received: from mgamail.intel.com ([192.198.163.19])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjJFq-0000000BowI-1qvs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783959099; x=1815495099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+IU61+Jwj0fMNgcOY65R9qPPSYIUxxsbnaMdI892scM=;
  b=e1HmOjEjxdvW/AHEx9hC8nX+g+J6jMwFPsf5cJQli/UeOGNER/qh6MT5
   MOTyT/Q+wKCbDbDIDQA1fYIIG5Ff/x0KUmG1rsm75idtkxcznd0G753C2
   /+KJp4EoxTRBZ8IaxUAhorcOk6FPpiU9eYYXE4gI+aamY3teZZTVzzXcz
   mI2z0Dq5yU8B6AuIxQxMFllbppzFLKzKszbcGFAtjmIM9kJILcgtm2Pgt
   d5rGJ/nFesgqkqc0vL2zsBVXfha/X/ZRHrlOhMw6AJgiurSvyRG8Jf7mh
   ZupBl0DEsfpW4krJja9/wxhmpcO7NwK+2GGD/Hq0ZEy/DBaEhS80fbrIr
   Q==;
X-CSE-ConnectionGUID: 1FGIWgJcSpakzZlhusB4EA==
X-CSE-MsgGUID: P7SrXqCKSdm5vub/peXUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83551653"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83551653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:11:31 -0700
X-CSE-ConnectionGUID: zTJ+zbqmRTShmr594eTWxA==
X-CSE-MsgGUID: 9qK1kM3gTW2YwQIZ2QQNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256233993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 09:11:28 -0700
Date: Mon, 13 Jul 2026 19:11:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 1/7] i2c: core: add callback to change bus frequency
Message-ID: <alUOLfkkB1oNTa-n@ashevche-desk.local>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-1-72bb8af8ee8c@gmail.com>
 <alUODujJFdtYElbY@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUODujJFdtYElbY@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_171138_922331_099BDF7A 
X-CRM114-Status: GOOD (  10.76  )
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

On Mon, Jul 13, 2026 at 07:10:58PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 13, 2026 at 09:19:57AM +0200, Marcus Folkesson wrote:

...

> > +	u32 clock_hz;			/* bus clock speed */
> > +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */
> 
> Ah, I thought you also updated to _Hz here...
> 
> But no need to resend just for that, only in case of a new version for
> something else. (Or maybe Andi even can tweak this whilst applying...)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



