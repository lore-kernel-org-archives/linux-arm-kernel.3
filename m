Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02060D33997
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9LEb9BbOELh9KNWuD8o/WxA5M96G6O62+yT2MMV0ec=; b=dokvRuCPDMCXta1D8OW8UUKJ46
	GMiX7L6CQ9v66z+YF3hIh6m1hgoLDLVwyioFwE5fUuW5LqyXcvYix76+Tl8H2HpdVDvpSEtjy5wkE
	m0J3+K4bPJzqrRf6VJES6wK+f02EnXSKStfQH3Ge1AuHnJbH0TseDcdQx1XoAPPZ7udTwvlAuh/HJ
	xGVAxVmTOA8+cqIKFE3QWSpJrqpuC5uErZJmVOI1l7+spd1o1lo++62IztwKQgOsl1Fh/7A5t/rzs
	X9p3MDrwS7HSxKycNE7iP6esLOgvfiqy78dl8EiHVGs53mII1qbgHJvcABGZ7kCit6CF8Zmt+q9J0
	JemSgbEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RRI-0000000BGfs-28WO;
	Mon, 28 Oct 2024 15:13:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5R05-0000000BBWk-2P8k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126745; x=1761662745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UnDAvpzTjiJ2n7QorFmV93OWIKQH82nfR4Oun/gbU5A=;
  b=Xs1Y9ZPEWNWyWt0jNvnjURxdH0O5es88ZJ3b7It5Ply6wcqK05UdD6iJ
   3DJue9rO05Uofs9wA3PT6rvtyNTBjkPMQs8O5TlLWao1Wv9yScs7+ei/t
   MP4NCzO2TtDEG5kpR2vwmkjwDG/3hEx5+E+PpRYl21gYc5pnn6mwY2vsP
   gCrgUqDNobRyzIXT52Ho8SEtSu1GSk9G6VtiTadfbZ2y9qP3MJItYZR4F
   zraXcvIZrPsl1mZu9Av2BFpuoZbuQnTt4Wr/SQLrLcNaMDtIJH4R4ay0+
   G93Lvn/15PbuztMpwN7q2knw1FHkz9acrByFS4qwBiZOnGmOkghN+DyAR
   g==;
X-CSE-ConnectionGUID: lkJ9fQvKQNuUU1Kgvra4HQ==
X-CSE-MsgGUID: inzUq8WxRPiBlXbsN8D65w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47186264"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47186264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:45:44 -0700
X-CSE-ConnectionGUID: 4vzrq205TqGg5djw1tymcQ==
X-CSE-MsgGUID: +juHO9pRRQC0nMF8RrENCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="82456817"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:45:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5Qzv-000000085kO-3T5j;
	Mon, 28 Oct 2024 16:45:35 +0200
Date: Mon, 28 Oct 2024 16:45:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] iio: light: stk3310: log error if reading the
 chip id fails
Message-ID: <Zx-jj8FEldW6sG55@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-6-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028142000.1058149-6-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_074545_690635_9408CA5B 
X-CRM114-Status: UNSURE (   9.69  )
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

On Mon, Oct 28, 2024 at 10:19:59AM -0400, Aren Moynihan wrote:
> If the chip isn't powered, this call is likely to return an error.
> Without a log here the driver will silently fail to probe. Common errors
> are ENXIO (when the chip isn't powered) and ETIMEDOUT (when the i2c bus
> isn't powered).

The commit message does not explain why dev_err_probe() has been chosen
and not simple dev_err().

-- 
With Best Regards,
Andy Shevchenko



