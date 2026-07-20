Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BFCC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrRZ35PE61Z45ZTePrz/A8zUB/yMQMCsPXc1USmDe9U=; b=P9zeslSCqq6kxhgm0bqYDSlOGt
	nSJNiCqzy7QUG3uef9BWUXomvOYOktwoUwTm2tGQ8nsSugnF6ZR7zF0Dbi+lmfM+7PZSRvYeM6sMp
	ZR9Pj+BSFWbobtL6VR2p87usuhBNL8zM+f+Wh1pORMRUtMAkRBdhiYG9COiwguAnr2Su1lfR1XOkX
	qtvclR0+v0dMltrVGeLKy6DZ0snwLa1uLBWb2rk+fjgNkp8HR3ZJY5PP7zOmJQacuLoM9lx6RZdR/
	cOBn2QWdP9JqRkl4eV6xP4kp9eGXT2bwIYri5mmcEN3YfOBFb/u9B2FGyDuJMWttltV8cadbCkxG1
	0kHXrEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllv1-00000006ZlG-1YB1;
	Mon, 20 Jul 2026 11:12:19 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlluy-00000006Zkn-1Uo7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 11:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784545936; x=1816081936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Tu1sNIjvh0qe7418eMkiZjWGhY5PHNA0ccDcGQxbH8=;
  b=cfUShBxo7gveFW3Vpcqa5KV/eZDxwHc0qO1WodKCgvBMu/xoKfQ+BoQC
   2on5zfM/enLR8tM7ofjLd0i6Cvhvf6/uQm80HBHwNq76avp1RB4ILLwEb
   21c6mXl7Hpz0UR7p3zbM3KKfwhK8tKxF+QGz30oasRg4JwCKxDb76LunW
   Tvi6Bzc3e9zPzwE+ZU8G3rMA898oN6d6+9qmBbQNhpU24ESopj0L59TXW
   PcbS7zmfInudgprhybIJ3NuVjJL47batYYo5+Ss+buXNUJVtQe+PsfNxE
   ZMehC6qVigYgkuwEX29CJHcVggpnfed0jVL78OGiJfsGng92A3R5j+oaj
   w==;
X-CSE-ConnectionGUID: gKWqvfokRXaVY8YuzGsQkA==
X-CSE-MsgGUID: 7ACkyzcQSKuTk19EOrnBow==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95776375"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95776375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:12:13 -0700
X-CSE-ConnectionGUID: 0IEGxcEkSyqqW1z1IDaPng==
X-CSE-MsgGUID: TrEMbgEwR5myB/DSP6nxvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256852429"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 04:12:12 -0700
Date: Mon, 20 Jul 2026 14:12:09 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 1/7] spi: pxa2xx: introduce clock enable and disable
 helper functions
Message-ID: <al4CiYmT10s8mrZ_@ashevche-desk.local>
References: <20260720104029.13740-1-fourdollars@debian.org>
 <20260720104029.13740-2-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720104029.13740-2-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_041216_433927_9044F4A0 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, Jul 20, 2026 at 06:40:23PM +0800, Shih-Yuan Lee wrote:
> The driver disables the clock during PM runtime suspend, PM system
> suspend, and device unbinding (remove). It also disables the clock
> on various error unwinding paths in pxa2xx_spi_probe().

You forgot to add cover letter (or forgot to Cc me). On top of that you haven't
waited for at least 24h (and for this series even more) as stated in the
Documentation. Last but not least, I only today answered with the people who
will be interested (in my opinion) to glance on this.

So, thanks for the effort.

-- 
With Best Regards,
Andy Shevchenko



