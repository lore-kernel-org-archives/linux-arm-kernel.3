Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7868DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN3EAPjcfRHByZ0TBbBSnzSEdQWlPtyMnaOEoRpWKrM=; b=gFqQO3JYR1rHqKDU69oySMsKB5
	ApUDaJ3ZaxY+grkL6145Yu4DchfEd6qHaitHDHSMrw0cUTLfCYGiNydNaqpvxA4ytCkZ5K5CbVX4W
	Yv4XHsa7Ez286mg5khNE2oE+HYMVc+9AC4y+anvDSERDsQJOhiYsjmFU3+RtWkwE1Lfx+c1VvD8oS
	QIzzrIU7qmpUlgCy9cpkbBPnGSeKEmLdP1hYYEwtV9i/CVP2ElP/qkA5JfS4mNodIDtWVgVyPQMOg
	4hMO/J2ZfuQPk73CYoSgBVMkatW1LG3Us/eIdW7rHCtk3aC32nTcwAVZZdBsEJgsTHh5aFQvDfNFw
	nLCwM6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmRw-0000000FEds-2JPV;
	Wed, 03 Jun 2026 14:20:04 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmRu-0000000FEcf-0Ssj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780496402; x=1812032402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwsFzcfP/4JAioQo/Nb7KCVYo0sn23L12Vil+WJYSDQ=;
  b=DkV6tBBjz2aPRaiyoi8brweNcEcnuFcrXG29toeQ4HduAAyrAvya8d0y
   klUMcles78DpCR9icwyZfCbYe2DGtJh6SWFDMdVmBCIz9jbHwZnNUKxH3
   nijTec5CwcFy4CjKOCvEOg/Dowoxhkz6TFdj1ZDGOWb3OJQeW1oPsbPjY
   nuWd3mU52s6fmzoVc+8sRlfyDT9U6iM+LuvyU8zqq4sVmYD3OTkh7cFJh
   5Ui7NFvqP4S+mFi8f2BLzMXUE1kKdEq7AHzu84BmhafgUCuZUGrYmc310
   NtjOgbpBVpvDImIa4GHEUFaLOldpJk6dwme+4gM0abIb96MXEvBOCodc/
   g==;
X-CSE-ConnectionGUID: qtpHtEIkTbCHpnMP8qBkUQ==
X-CSE-MsgGUID: /6a1fCZ0TKK7rbjNWM2QsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85162028"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="85162028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:20:00 -0700
X-CSE-ConnectionGUID: LoSveQ9VTW+tmjlePSRlKg==
X-CSE-MsgGUID: 5Nn22IyPSTyv6aezcUX4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="239778637"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.250])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:19:56 -0700
Date: Wed, 3 Jun 2026 17:19:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] iio: adc: Add Axiado SARADC
 driver
Message-ID: <aiA4CocrAmUCKDKn@ashevche-desk.local>
References: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_072002_171608_8B2D0E88 
X-CRM114-Status: GOOD (  13.75  )
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

On Thu, May 28, 2026 at 01:10:22AM -0700, Petar Stepanovic wrote:
> This series adds support for the SAR ADC controller found on Axiado
> AX3000 and AX3005 SoCs.
> 
> The controller is a 10-bit ADC. AX3000 has sixteen input channels and
> AX3005 has eight input channels. The driver uses SoC match data to
> select the number of available channels for each compatible.
> 
> The driver supports single-shot voltage reads through the IIO subsystem
> and uses the reference voltage regulator for scale calculation.

Always explain:
- why do we need a brand new driver?
- where can we read the datasheet (Link)?

No need to resend for that right now, just reply here
(also do not forget to include in a new version).

-- 
With Best Regards,
Andy Shevchenko



