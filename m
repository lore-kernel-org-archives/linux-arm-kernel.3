Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AEFD19515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoZ90IXP/6E5Rt+WwFGibQn+JvYiki36dLMqWIs5a68=; b=yJkmWLhfHEkuDyci8LN7sQbrkD
	i/W/QS4qFTHEpWHRgv7h0fnHUqxK+56sidqK3p6Hb2P0mkO0oxzvNZPuwjXeao3Nosazd30Xi+JId
	/WdOHV9u3/RA6DHFB7w6eu1elq2KWhGxRKxbeKqTnFCZqlnjJA7qMRL4VQjqOFr3HmG8wp7CzZxnU
	tra97m52RKjJC+YC1k0m6tqx0M5NpWEIoYBrfeF5jJhBBYZwwXkvu4I+R+Od6uVHWoUMbsyV0ISrI
	gGkuPmlC6y8KmS2cP163bn0wGZOcc2G5M9rkthrzZC/AY/MR/DuBVgSg8Sk+KE4Li3nmDtOxBq1Gs
	9aPL+Xmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZU-0000000DyC6-3HdE;
	Tue, 27 Jan 2026 09:41:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZP-0000000DyB3-2f3Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769506871; x=1801042871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIXG/8Eo//+j0yiImQIH97d8+3mFCxfZi9vJb7DS8pc=;
  b=aKJhygLO4dDyOrAr+jCMauvQkd/+fE9LG9fECa513roVcQr0zFjIoyMU
   WCbdqFfkvp6dUwXFcSl8rvfF9W/fmc5ZQ9FbeNr/9eZvENiVFB8k2KeKN
   8XDiuFPoOA6WxgOKo0F49/1hK9OlyVPnuXsXeYwZWtjBdlnduCn9e8spM
   fVsQyG+qKM9XppIo1aUIw+n7QBtibsEo9S9NJckH3SzV4QMebOv3j7LZT
   0/FxNTZvrdtlZp9bLwwbnKpxX6ohniZ0znWAIdIQqafpz0+mwtF9Z0XLn
   uO++s+ib3O3LEiplCSNZDheT+JnGa8jjE7+GN9bFrNv7dNWwBaJtmH8K0
   w==;
X-CSE-ConnectionGUID: P9nyN4jiTmyIP0xo/3N1qQ==
X-CSE-MsgGUID: Rym8gNU2Qda6az0PBs9BIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58270411"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="58270411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:41:11 -0800
X-CSE-ConnectionGUID: fAXHViZGSHCLuNfjHWBb0w==
X-CSE-MsgGUID: BFlrLTLRQT2o9ar23b41uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212475873"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:41:08 -0800
Date: Tue, 27 Jan 2026 11:41:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/6] i2c: xiic: switch to generic device property
 accessors
Message-ID: <aXiIMUUWREUT8tm_@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-5-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-5-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014111_684569_A56C82A9 
X-CRM114-Status: UNSURE (   8.11  )
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

On Mon, Jan 26, 2026 at 05:08:20PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Use generic device property accessors.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

One nit-pick below.

...

> -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> -					xiic_process, IRQF_ONESHOT,
> -					pdev->name, i2c);
> +	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
> +					IRQF_ONESHOT, pdev->name, i2c);

>  

Also drop this blank line.

>  	if (ret < 0)
>  		return ret;

-- 
With Best Regards,
Andy Shevchenko



