Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D4FCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpDI9VCVvPiTA30BrbW/EAvAxcTtdpEeKyvpESQeX74=; b=Ty4UWYBnYazqIHX+KqnCBwfqpl
	hoqeVkS7WxRZWho9nsdruL0fJsGZRvjpMa7/4TVpGcyGpJ62EhfJxh2CoTbdHdMrmHQZaKBKy9yt/
	JNWg9uGpHOB0IOK9fqDf2g5PNPRz+GAWX19kY9WwaSxNCgljfS3utIhNUDOmQ0Lw3lS3ri88WfKGT
	EDv8eokDsOg1Kcxw9EBX4nSUsED2aGy6y4ouqwk1nFz34GUb0xkmxVYEmgpQ//zn/qlXfJjQLohJ/
	sw7Gwb8P8A+O5BraCRi+Uh0xA+UCoC6+oTp5AvNyRJT23d9yKJ1pD8NoRZjgEjWrg6xtsaJoGXLzE
	HRUCxNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1mQ-0000000BuPh-0yaI;
	Mon, 01 Sep 2025 10:28:54 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0iq-0000000BjWi-2wDQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756718469; x=1788254469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ls5u1XePOINQwXxs0U11TUbZVLbAaL/foUkpem7uo+s=;
  b=KjZyoppno26TjHnKQ19m6gVtoyQGrv9K9hox9lrXrK8cLFB3TqzdxzS2
   LUQfYiHhgJTALw9BwRjVREIBcEfN2Yw5T4ZutizQTyoXXvlqFSlWLO6zt
   griaAZOwI+GUr13sP4PhRIN5AI3XN2evsY9d+MkdJGM/ADe86PUR08nJR
   BZKbc70p9EeprYOav8A+3o6RZY/To3/Tum/E/uWp+1ns9FRnj//DoUXg/
   xU+4Fmfr6B5dPhWwpFcw+xfitlybRNp4fIp12WeJoN30plTzbXE7bfm1o
   4syWL1c0Ht+P/nV+Hu2iFZORzqnFXiFayH8+yPMEQI99nKHDIiqh4ZJK+
   g==;
X-CSE-ConnectionGUID: m8v+QZAvQFyCaqbrrZ3UDw==
X-CSE-MsgGUID: npnt9a7hS5KvKNvP7PIzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62803591"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62803591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:21:08 -0700
X-CSE-ConnectionGUID: V7X8rnqMS3ueJLy+SCkyKg==
X-CSE-MsgGUID: MLlgXYFpQ5GnCrnqMVziLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170823305"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:21:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut0ih-0000000AN6Z-42sq;
	Mon, 01 Sep 2025 12:20:59 +0300
Date: Mon, 1 Sep 2025 12:20:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLVle-fEMXlQlDR-@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_022108_783527_1647E9B0 
X-CRM114-Status: GOOD (  12.91  )
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

On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. The first patch in the series
> fixes that regression. The second patch improves recovery to make it
> more robust which helps to avoid communication problems with certain
> SFP modules.

> Changes in v3:
>   - rebase on tip of i2c/for-current

Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)

-- 
With Best Regards,
Andy Shevchenko



