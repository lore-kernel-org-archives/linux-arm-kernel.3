Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7693ED111BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAfXcyaiK92LlKeeKImXjqMsQvlAIjS03581hIC7+84=; b=zjnZP+uwkgjFSUH9sVqDxtyQLx
	mp+/vzL/hf6A0NaVUBxsJdAR4wwq5pAEC4AGsBV4L1KgKTbXmiHtsj+/WO1EFYTHbb5CzNxIdKxZi
	hg+pyUsrwDiAGBYPdNOglFWSsV1WrQnayuXChWPGCT/gqrB/6Om0uI626QPhrIQR0nH+pjjIMIGdB
	CT+URyAQBraYjWns5UMzOHoTHvUYh7LkQ6jPZY++PxdxBSO6Ztl3EJMX5ch5syJvtdtmo3si2Zke/
	oqPEwJyBNrdI3vfbggA2zfpW0McCl2s8Fj1jhDF2VhN15svmaAFB65kQgCJZwtr6WplOqylDTl+VT
	nuH1KAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sXH-0000000Cz4H-0uoI;
	Mon, 04 Nov 2024 08:34:07 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sVZ-0000000Cyft-2BPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709141; x=1762245141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zAp+R+E7m6ywEIK/+UhcHQD4V6TJ0Wiyk2ppk67o1KU=;
  b=gduvQAtf0fsPzhnv+tchjrTRGMXiclYkTMfUBbdPa+xfjhuH0YRBTrMw
   n+w/XwlTaz8/yJxg2T3bOWnQ/7RUcoGHV355Ym8FTOZYdLFYAnbtRiT+G
   cm7qJnZC1vv8Jrn1xIZKV0zMnayp4fD6eZFbSZhqmyxbPgniABpHn9/rM
   mExiTN7gnxATA/OQ52R/Yir6P6sMkRfjLmMsruoa4vr0XPFi4mivIbXbl
   1+Qz+Jm+U+7muECjmXZ9xgd7g9OfXmCg1z2sHpmAK4i9+YO3DSsWt23xd
   IOCD9dEllOdtrZvQT2gHdOySoQdU0uZQSkEYoLQPOuydjXiboLVQrIYYe
   Q==;
X-CSE-ConnectionGUID: lYRrOA37S3elg7kVF64wIg==
X-CSE-MsgGUID: GUUAOuOxRLGWcj4hZzz0Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52955085"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52955085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:32:17 -0800
X-CSE-ConnectionGUID: ++ai5ejURxymdXTSysQxNA==
X-CSE-MsgGUID: GoHmC6LZSP2kLjSzGTo2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114367291"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:32:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sVN-0000000Ayz5-0Hed;
	Mon, 04 Nov 2024 10:32:09 +0200
Date: Mon, 4 Nov 2024 10:32:08 +0200
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
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102195037.3013934-7-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003221_626064_D113FE48 
X-CRM114-Status: GOOD (  11.23  )
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

On Sat, Nov 02, 2024 at 03:50:37PM -0400, Aren Moynihan wrote:
> Using devm callbacks helps to make the ordering of probe / remove
> operations easier to reason about and removes some duplicate code
> between the probe error path and driver remove.

Where is SoB?

...

> +	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);

Why not simply 'dev' as in below call?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register cleanup function\n");

...

> -	mutex_init(&data->lock);
> +	devm_mutex_init(&client->dev, &data->lock);

Missed error check, otherwise what's the point?


Also can add a temporary variable for 'dev'.

-- 
With Best Regards,
Andy Shevchenko



