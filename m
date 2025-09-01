Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFFFCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0cXZlA6UuIM1VRBKjNaxNZZffnLYDzuSkE1Fa5x0tM=; b=wvGm/9XXig2q55lwdOIYPjZWMR
	Bz4bA6fUa1fXaWAvUUUth0pN7bZXAV9GYmnW1cJZmv3lWPJCXI2KAM983mqpZas797X5vnb0V2epE
	50oVcwI2i3p12HlUQQi3ccwAJ7qWmRbKnJwNzc3mOwWbbMRo4UCqcBCw8WPluglD7vzLLBCXljkMF
	Tb332MTgx2Pqyk5J+ggfKuQUtcgzMYKTmvJg6dCjwaZrPHutFAvbvsfs1AP44WNL3NiIcqvjEtgp4
	3CkEZL959zcqVCzRxCzh/NdthlsaPAccrS9SrVpmWS5+3hNNCDmOAE+mydwavoTbWaJQ7UAu81vTb
	KM1OJpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1pC-0000000BuoX-3w3e;
	Mon, 01 Sep 2025 10:31:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0lq-0000000BkCv-2yhw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 09:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N0cXZlA6UuIM1VRBKjNaxNZZffnLYDzuSkE1Fa5x0tM=; b=jmwnFXvvukabfxQhg6nCL3OhCo
	Ay/fAABGVBJGAM1hijtTgbNrE5947N1bvlf734tskNS7QW+oi38Mfy2pG1jdDOBHQDU4uVV3S2bre
	mmN0FnfSu0YfkXG7wJ0ofVux+3bp3gTkFcZLZUbdcojWb7lJdwWkw+bpTnG0IhtvJK1ta+x8+Ni/a
	euG+J6gKGDTYY1ZA4ZxgTRcaS4Hj1NG1DxiOZz5E01ozxDwkL7fwH5x5xpAtwMqE+84tdOuvX6kOx
	Y7B7m8hVOnhL0B9f8Y4/DEC3vEwWcgNrJiHZQUJySJu0uoOdoq5au5P/eHefx6bfBNr3OavOFoYq4
	yGzM9QUw==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0ln-00000003h8T-0j8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 09:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756718651; x=1788254651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+Xj0rZyysLavFO/ivCHNXIvOAG2SlkbSMufW+nOfw8=;
  b=L5rPZjq7H5CHM/GDb2juAltf/K0iu8B9+fOKh2Jk/JqkKLwWgJ4VtSTe
   KpVHVCvuNmx4yrwiyMcpNhMxtMt93NrZRNMQFPppto+mBAlgTbnVVXXD3
   ageWsVYXS7jkeC4VpZAuLsxMH2ue2PL+/sEXrKd4SOiTZEAxxlo+it7m8
   WOPeP0CO9ch4kwF8lj1Tmz9DovEMG6wnYsbtQUcO0QJzHZBMZsE945sPH
   OMurZhD+XO7i7eligORXrAIaorgSMAobTS2dmRT+mJXD6WCviPUtXp1OE
   4u2YdqSiw1EHU4y4+RhyEXWCAvFQZI1piYfmGEe6Hrh4eOSpAki5W15qq
   g==;
X-CSE-ConnectionGUID: vPnkxSolQxmWYpAnnjWJgg==
X-CSE-MsgGUID: CrJ1ZRfNQr6/E4ZQhGvS/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58904237"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58904237"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:24:01 -0700
X-CSE-ConnectionGUID: KnieA+JKSEuAmMEdyCnOEg==
X-CSE-MsgGUID: 1RoFlB6oTXagl4Ix4oEuLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171823134"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:23:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut0lW-0000000AN9U-3oYK;
	Mon, 01 Sep 2025 12:23:54 +0300
Date: Mon, 1 Sep 2025 12:23:54 +0300
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
Message-ID: <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_102411_903059_05B09A2A 
X-CRM114-Status: GOOD (  16.04  )
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

...

>   - remove Imre's tag from the cover letter, and replace his SoB tag to
>     Reviewed-by in the individual patches

Note, this can be automated with `b4`.

	# Start a new branch of the same base
	git checkout -b v3 ...
	# Apply last version from the mailing list
	b4 am $MESSAGE_ID_OF_v2
	# Do actual development of v3
	...

Also you can do more with `b4 relay`, but I haven't tried it, so I don't know
if it makes it possible or better.

-- 
With Best Regards,
Andy Shevchenko



