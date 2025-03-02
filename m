Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4748C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 03:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAullmgxqFcz+EbDFtj+ZHJeWGB+Q7jH6fhMkv5rlMM=; b=eRc+i6szQQaapuQ22pSuTYbfHP
	Kt4crWIaRERMnnSZG0tQ7/nlbuqOlGSrz3Bo0HZ+0fZAMLNuG1vIfDhQ4plXOln/BbM05EeyG6SEb
	TQqYIECj+h4U1V8eQXWoW5jmR/oEZyH70oDQ0hxLUpwP3xCkMSvEpu+KK00rxcpA3QpGFCECtCQOw
	4kmt4dGCQu+BdbhiuRaxezt7G/bY8Evupsz9/OD7XKew5sLMY0VMPcB0aZYHE6svUvukDlFkwjBU3
	mLwsSSHztsEEHLnMi79Uu/quBSj0Q+AzwBllNUjY40t3UR2GkdKWXULcbftm14ogU+QWTE9JtzVQJ
	ZAQvzCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toa0x-0000000FJVB-0Zyg;
	Sun, 02 Mar 2025 03:29:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toZzQ-0000000FJMt-0l54
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 03:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ADD161141;
	Sun,  2 Mar 2025 03:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FF9C4CEE2;
	Sun,  2 Mar 2025 03:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740886058;
	bh=xeoHgHj3bNlK7LjXGpml+TkLIjpdrYcsjMsKfm9nnXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LSdXKJIxOirqQI1m13tjX1BMj7eUz6JIakaoy7b+wXaqFWuFfpDJQRZ3vCoyBN/gE
	 MPR2PoZBhfeL04215hrvgW7StKZn5HsKdMmiLqCkKri5his6Y3/j8O4so58eKXdOFL
	 ukLYC+UfymP4o78ZKBk9vksk7WW0bzf699WIWRUD2JqPvR2me30I4uRtUY1QYbWIXR
	 Zp2JgcCxUY3LYivy5E4SlSrYJE7E3c1Cawo3x6RxR9LmiVUDUVbC4b23OWX+1FSVK+
	 v0VsXky5LRTW/m2m8FIZQ40m18sWbPKf3evG8pEUgS9HLPA9drQtHQGG7huYq4Jlgt
	 viUme/vqHuFaQ==
Date: Sun, 2 Mar 2025 03:27:13 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Dumitru Ceclan
 <mitrutzceclan@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, Matteo
 Martelli <matteomartelli3@gmail.com>, Alisa-Dariana Roman
 <alisadariana@gmail.com>, Ramona Alexandra Nechita
 <ramona.nechita@analog.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree
 config
Message-ID: <20250302032713.1c834448@jic23-huawei>
In-Reply-To: <d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
	<20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
	<f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
	<d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Feb 2025 08:39:11 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> On 26/02/2025 02:09, David Lechner wrote:
> > On 2/24/25 12:34 PM, Matti Vaittinen wrote:  
> >> The ti-ads7924 driver ignores the device-tree ADC channel specification
> >> and always exposes all 4 channels to users whether they are present in
> >> the device-tree or not. Additionally, the "reg" values in the channel
> >> nodes are ignored, although an error is printed if they are out of range.
> >>
> >> Register only the channels described in the device-tree, and use the reg
> >> property as a channel ID.
> >>
> >> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >>
> >> ---
> >> Revision history:
> >> v3 => v4:
> >>   - Adapt to 'drop diff-channel support' changes to ADC-helpers
> >>   - select ADC helpers in the Kconfig
> >> v2 => v3: New patch
> >>
> >> Please note that this is potentially breaking existing users if they
> >> have wrong values in the device-tree. I believe the device-tree should
> >> ideally be respected, and if it says device X has only one channel, then
> >> we should believe it and not register 4. Well, we don't live in the
> >> ideal world, so even though I believe this is TheRightThingToDo - it may
> >> cause havoc because correct device-tree has not been required from the
> >> day 1. So, please review and test and apply at your own risk :)  
> > 
> > The DT bindings on this one are a little weird. Usually, if we don't
> > use any extra properties from adc.yaml, we leave out the channels. In
> > this case it does seem kind of like the original intention was to work
> > like you are suggesting, but hard to say since the driver wasn't actually
> > implemented that way. I would be more inclined to actually not make the
> > breaking change here and instead relax the bindings to make channel nodes
> > optional and just have the driver ignore the channel nodes by dropping
> > the ads7924_get_channels_config() function completely. This would make
> > the driver simpler instead of more complex like this patch does.  
> 
> I have no strong opinion on this. I see this driver says 'Supported' in 
> MAINTAINERS. Maybe Hugo is able to provide some insight?
> 
This seems to be ABI breakage.  Never something we can take if there is
a significant chance of anyone noticing.  Here it looks like risk
is too high.

Anyhow, as discussed there has never been a clear statement on what default
is and whether the channels should be presented or not. It's always
been binding dependent, but it seems not as explicitly stated as it should
have been.  

Maybe there is some DT binding magic we can do to close this ambiguity but
I'm not sure what it is.  If not documentation may be the only way.


> >> As a side note, this might warrant a fixes tag but the adc-helper -stuff
> >> is hardly worth to be backported... (And I've already exceeded my time
> >> budget with this series - hence I'll leave crafting backportable fix to
> >> TI people ;) )
> >>
> >> This has only been compile tested! All testing is highly appreciated.
> >> ---  
> > 
> > ...
> >   
> >> -static int ads7924_get_channels_config(struct device *dev)
> >> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
> >> +				       struct device *dev)  
> > 
> > Could get dev from indio_dev->dev.parent and keep only one parameter
> > to this function.
> >   
> >>   {
> >> -	struct fwnode_handle *node;
> >> -	int num_channels = 0;
> >> +	struct iio_chan_spec *chan_array;
> >> +	int num_channels = 0, i;  
> > 
> > Don't need initialization here.
> >   
> >> +	static const char * const datasheet_names[] = {
> >> +		"AIN0", "AIN1", "AIN2", "AIN3"
> >> +	};  
> 
> Thanks for the review David! I do agree with the comments to the code.
> 
> Yours,
> 	-- Matti
> 
> 


