Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15410C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZzNdIClB3nmQqrQO//o1cZvjoMRTBtVTQixuboABb8=; b=RB2xZ6i2dXsbUJfbWpc66cjLzu
	QkruaEyQKQuSOSMp1h5zCqXEQGz4aIZOjiYAakq2kt53rG8iQP6K1MIoEoSdd1TzLfnY2H7KihAid
	qZTowJjR33VC1oMXOPrXCHw2uSdyxuuaS68/XgBrJrHJsP1B9WJvHoPLXRZQjq8NAYWVBXhTHSKTE
	vAyBDISPXqTvUX/bf7SyiXDWk6YopSwlWnaluwyRj8XoE7eClhz+lmFpqwjCYIBOkkt5b5Tw4G6f9
	r5NDmF2ucYkzT1yTO4CRxDh/XPhnStPRud3+JImwh+qz1xAQsHsIr2gLu94ujXWXWqzqUQc6kFgo+
	4FRKAUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttkWY-000000000JQ-1Pjw;
	Sun, 16 Mar 2025 09:43:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttkUq-0000000Hb5w-3eCw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 09:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ACE75C3DD6;
	Sun, 16 Mar 2025 09:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C876C4CEDD;
	Sun, 16 Mar 2025 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742118088;
	bh=puDl3rB5y/M97kW2lFGXNqo6QtunGrZjc7dlVKkYZSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Dno9Eqh0qhwYJ4lTi7hNkN/Keqtg1ukHhOGtaXU7K5uy5MbrN5z4gCQ6YXlyF27/1
	 /Nb9K3AvbggKF08mHXurrZ5cZLkbUrPPA1WyEnFo3bZWM33AMc3TOEqO84TUuS5tjX
	 MH7fCtPqb2MFKCq16oodB7pmecUZDKgKaG6KVrmgu7irir1PK6MtuGGC3JsKenTHyS
	 aS3dt1rHZQ/V4htHdf75Tp9kyGOAFPpjMrTzGVGJzf9gBino3vbvR/Ibq36w3ZOugs
	 0ncIletBELy1KvzmpcdPeMOUi3YTTrqNhHz8m7lRgEbvOqnUFnpZhs4b2SaE8eTGls
	 jmbPQTSYlRfRw==
Date: Sun, 16 Mar 2025 09:41:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>, David
 Lechner <dlechner@baylibre.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin
 <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <20250316094112.6731bd01@jic23-huawei>
In-Reply-To: <Z9LQ0O34EUM8WZku@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
	<df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
	<Z9LQ0O34EUM8WZku@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_024128_997953_953BF064 
X-CRM114-Status: GOOD (  22.76  )
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

On Thu, 13 Mar 2025 14:34:24 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:
> > The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
> > help drivers avoid open-coding the for_each_node -loop for getting the
> > channel IDs. The helper provides standard way to detect the ADC channel
> > nodes (by the node name), and a standard way to convert the "reg"
> > -properties to channel identification numbers, used in the struct
> > iio_chan_spec. Furthermore, the helper can optionally check the found
> > channel IDs are smaller than given maximum. This is useful for callers
> > which later use the IDs for example for indexing a channel data array.
> > 
> > The original driver treated all found child nodes as channel nodes. The
> > new helper requires channel nodes to be named channel[@N]. This should
> > help avoid problems with devices which may contain also other but ADC
> > child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
> > string didn't reveal any in-tree .dts with channel nodes named
> > otherwise. Also, same grep shows all the in-tree .dts seem to have
> > channel IDs between 0..num of channels.
> > 
> > Use the new helper.  
> 
> ...
> 
> > +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
> > +				&sun20i_gpadc_chan_template, -1, &channels);
> > +	if (num_channels < 0)
> > +		return num_channels;
> > +
> >  	if (num_channels == 0)
> >  		return dev_err_probe(dev, -ENODEV, "no channel children\n");  
> 
> Note, this what I would expected in your helper to see, i.e. separated cases
> for < 0 (error code) and == 0, no channels.
> 
> Also, are all users going to have this check? Usually in other similar APIs
> we return -ENOENT. And user won't need to have an additional check in case of
> 0 being considered as an error case too.
In a few cases we'll need to do the dance the other way in the caller.
So specifically check for -ENOENT and not treat it as an error.

That stems from channel nodes being optionally added to drivers after
they have been around a while (usually to add more specific configuration)
and needing to maintain old behaviour of presenting all channels with default
settings.

I agree that returning -ENOENT is a reasonable way to handle this.

Jonathan

> 
> 
> 
> 


