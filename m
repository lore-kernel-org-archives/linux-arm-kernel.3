Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39C5C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 20:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aU3GtdyvnIFsX7EEuvTP5n0LC+5wNHQ+PxclHEEIGc=; b=NLML142wEq2qXuX3gn+PmXBUpo
	rtYA5VpBNjJ8PHYe/9gPs4kx+sCnDgwXLvNFLPyPemlCWG1mh0fQ6dqHWpjgfxAfWHZoYs5atKPsh
	TeX+uEKztMOom4wZlqAcYCHAJDxjdKtAi+s6I0NpSXsCQYoqqQo58UK/Uqr5Yhk95mGnmTfLA4Q46
	QhFD2dwy1igPYfu0FtldgbAKcjs8F2sdomyq0n4esL8KPJdD452oK0wTGzdLvb5qTRR3B0mfyyFTY
	bexc8M3xyEztw9s3KFQY5jVcjxSGXiFA1GX9cnyvLTbav7Vwf0aiRgOuOonSpkLOUpEmV7lQjRZC6
	j3ApjBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjObb-00000000hJI-2XCj;
	Sat, 15 Feb 2025 20:17:39 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjOa8-00000000hAD-0PXJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 20:16:10 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 6107141A29;
	Sat, 15 Feb 2025 20:16:02 +0000 (UTC)
Date: Sat, 15 Feb 2025 15:16:00 -0500
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Julien Stephan <jstephan@baylibre.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Ondrej Jirman <megi@xff.cz>, Dragan Simic <dsimic@manjaro.org>, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <54gp7mhpu5fgeeif5amajmcit4znuil2kikx43bcu6eujmq5wu@oxaq6fgmkuyr>
References: <20250208211325.992280-2-aren@peacevolution.org>
 <20250208211325.992280-8-aren@peacevolution.org>
 <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739650563;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=9aU3GtdyvnIFsX7EEuvTP5n0LC+5wNHQ+PxclHEEIGc=;
	b=UhxPIwY9S/cJsjrbo7Y7Jbp8fUaTByXNtTY9daK6nCgyrAVRT/LqrCjd9PIK20mNGpI+Sb
	FyoQ4aPFr+Gu5e6hm1lrVo5zf0SOTy7mJ8vMS9HehLOI0GNQBSn015MMTSx2lbhaBwB32O
	GE4DT4Me4PlvRlOFVApH7v3WxkKD1H8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_121608_218932_6D035F87 
X-CRM114-Status: GOOD (  24.38  )
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

On Sun, Feb 09, 2025 at 04:47:44PM +0200, Andy Shevchenko wrote:
> On Sat, Feb 08, 2025 at 04:13:24PM -0500, Aren Moynihan wrote:
> > Using dev_err_probe instead of dev_err and return makes the errors
> 
> Use dev_err_probe()
> dev_err()
> 
> > easier to understand by including the error name, and saves a little
> > code.
> 
> I believe this patch will make more sense before switching to local 'dev'
> variable. Then the previous one will have an additional justification as
> the "struct device *dev = ...;" lines in some cases will be added already
> by this patch.

That will only be added in one spot, and I skipped updating the dev_err
calls in the previous patch that this patch rewrites, so churn shouldn't
be an issue. That also makes it trivial to reorder them, so I guess it
can't hurt.

> >  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> > -	if (!indio_dev) {
> > -		dev_err(&client->dev, "iio allocation failed!\n");
> > -		return -ENOMEM;
> > -	}
> > +	if (!indio_dev)
> > +		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");
> 
> We don't issue the messages for -ENOMEM.
> 
> If it's in the current code, add a new patch to drop this message and return an
> error code directly.
> 
> ...
> 
> > +	if (ret < 0)
> 
> Perhaps, while at it, drop these ' < 0' parts where they are not hinting about
> anything.

Sure, I can add patches for these, although continuing to rebase this
series is getting a bit cumbersome (perhaps just because I haven't found
a good workflow for it). Would I be better off reordering this so the
refactoring patches come first and can be partially merged?

Regards
 - Aren


