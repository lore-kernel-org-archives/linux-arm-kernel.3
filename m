Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F8D12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEZbdTzEYXuLwbBpuMXGMeDEFhAzoB1psOB+/X4Brc0=; b=4v9YRHog9oNIXmOzyLpxwHDMpb
	n8dr55BxZxvkqsUiv+MPg/NR6Nhlrh33laJBpYas489yettevizMZHzRSpEl+npDPNK/2WV6wYjIk
	CwlJtzDrvDY/YuGgQjox+lLngwKcG0CZGoJkjXHF15W4XTnVvXun5+WpbxXh5DPcm5lFBICpmehMw
	Fyg/XVpL1UcEVevnk0KqO61hguOYpdKjldAKIwHhZq/cuutu92KRxDC3kAID4yEnrUuJQ0EiV9fCo
	k96rqFgwEoAO543q9n7GystqF1CPw+RS85HJKisUzysLsZzDkYdbxRN1m/CIOTkQShY62cVc0BAzm
	gBtlEGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADRm-0000000FRV0-0Rkx;
	Sun, 10 Nov 2024 19:18:06 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADPo-0000000FRIR-2hgp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:16:05 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id C40554C82C;
	Sun, 10 Nov 2024 19:16:02 +0000 (UTC)
Date: Sun, 10 Nov 2024 14:16:00 -0500
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] iio: light: stk3310: log error if reading the
 chip id fails
Message-ID: <jwk6xutstzr2whki2y52rpm6tgx26hswq24lqwyy7fdjeyyq6x@gn5pghxezbc6>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-13-aren@peacevolution.org>
 <ZyiIp6t53FN9ssyV@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiIp6t53FN9ssyV@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731266163;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=eEZbdTzEYXuLwbBpuMXGMeDEFhAzoB1psOB+/X4Brc0=;
	b=ZSnKUv8xaun5sbvhBWZ2JSwkOP+AghP5j3wKuOTusj7T9J1oAvEw2rvL+ZWE2dfEo54pm5
	Dm9MxoL7j0wrj7VCrRAhKXDSKdtG5Mc2GcjJeoSnaKIHj7lAh81QFpB0ZLzku0t8nydRDW
	aPcf8pYQG4YX1cF48Qx/WxXA+ALdh2c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_111604_773560_2D6D3F5E 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Nov 04, 2024 at 10:41:11AM +0200, Andy Shevchenko wrote:
> On Sat, Nov 02, 2024 at 03:50:43PM -0400, Aren Moynihan wrote:
> > If the chip isn't powered, this call is likely to return an error.
> > Without a log here the driver will silently fail to probe. Potential
> > errors include ENXIO (when the chip isn't powered) and ETIMEDOUT (when
> > the i2c bus isn't powered).
> > 
> > This function is only called from stk3310_probe, and this condition
> > should return an error, which fits what dev_err_probe is designed for.
> 
> ...
> 
> > +		return dev_err_probe(dev, ret, "failed to read chip id\n");
> 
> Please, make sure you have consistent style in the messages. Most of what
> I have seen use period at the end. This one doesn't.

All but two log messages in this driver don't have a period at the end.
I'll correct those two in the next revision.

 - Aren

