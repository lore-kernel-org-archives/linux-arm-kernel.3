Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC6C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 06:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01z4ynnMtNBDHQYVyEaQtwhuMW57f8vzgdG5nOyT7R4=; b=uFkq/sNeJtroPP9/MV2MZtyvA8
	434lyKUD2vWu3f8ph1uVaobNhXW7UpCm8XfjNRlYcJFRV/nrZ/cyx6yLLCtYHCoAPaBP/iFwglDh0
	j5gXe8rIJJeGzR2ZqsjQob7q99vb4lZtLPEQXJkdj7Ucb81EremMCTcp9nrUUgXk7lDzjbKmpI0/N
	NiLN7Lujdf7IS0z7lr/G8z7T4rNDr502KGdWOGRInps5y4v2MbmoGWFzScXP3P1bekSD6o2Zd87wl
	WXMDdqD+Sl0qheuZwZC7ctxpENstkQvLGwgD3e+wvrO9SGeZ+6aNjhD/bq3mW1Owobvap1csZyDTA
	MfUxQdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjC5e-0000000H8bd-1IAx;
	Sat, 15 Feb 2025 06:55:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjC4C-0000000H8SR-41Tc;
	Sat, 15 Feb 2025 06:54:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5B105C410D;
	Sat, 15 Feb 2025 06:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326CCC4CEDF;
	Sat, 15 Feb 2025 06:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739602457;
	bh=mfCqWG6NaYR6Sxd++9L3Sle7RqL0qWrh+kjSNFtksAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS4GDR/SYf5jq318wLFt00h54nZgI/f4yIrfYTZvBV7jtSKQ1RY9pTAqlNYYxSCC6
	 zygTR0MT/JQ5CQ/0x1v48rY/2sgioAgVjQlS+fAcz/p+8ZpKoylYdoM2+Ime/YZKv1
	 76WODxrBGyq6uEyBhlP3dGL1sSbDsZD2GKoZSyLE=
Date: Sat, 15 Feb 2025 07:53:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021501-tamer-sank-142a@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_225421_115670_7C35DDAD 
X-CRM114-Status: GOOD (  52.91  )
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

On Fri, Feb 14, 2025 at 07:16:30PM +0100, Jerome Brunet wrote:
> On Fri 14 Feb 2025 at 17:33, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Feb 11, 2025 at 06:27:58PM +0100, Jerome Brunet wrote:
> >> Add helper functions to create a device on the auxiliary bus.
> >> 
> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> >> the same code repeated in the different drivers.
> >> 
> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
> >>  include/linux/auxiliary_bus.h | 10 +++++
> >>  2 files changed, 98 insertions(+)
> >
> > I like the idea, see much the same of what I recently did for the "faux"
> > bus here:
> > 	https://lore.kernel.org/all/2025021023-sandstorm-precise-9f5d@gregkh/
> 
> Reading this, I'm getting the feeling that some (most?) simple auxiliary
> driver might be better off migrating to "faux", instead of what I'm
> proposing here ? Is this what you are suggesting ?

For any that do not actually talk to any real hardware (i.e. they are
NOT sharing resources with a parent device), then yes, they should.  I
was also trying to point out that "simple" apis like what you created
here are a good thing in my opinion, I like it!

> Few Q:
> Is there some sort of 'platform_data' (sorry for the lack of a better
> term, no provocation intended ;) ) ... it there a
> simple way to pass an arbitrary struct to the created device with 'faux' ?

There are at least 2 ways to do this:
  - embed a faux_device inside a larger structure and then do a
    container_of() in any sysfs callback to get to your real structure
  - in a provided probe() callback, set the driverdata field with a call
    to faux_device_set_drvdata()

> The difference between aux and faux I'm seeing it that aux seems to
> decouple things a bit more. The only thing aux needs is a module name to
> pop something up, while faux needs a reference to the ops instead.

aux is needed for when you want multiple drivers to be bound to the same
hardware resource and need some way to share all of that.  faux is used
for "fake" devices where you just need a struct device in the /sys/ tree
to be used for "something" or as a parent device for something else.
See the examples in the above patch series where I convert many
different types of drivers over to use faux.

> I can see the appeal to use aux for maintainers trying to decouple
> different subsystems.

Again aux is needed for "sharing" a real device.  faux is there for fake
ones that people previously were using platform devices for.

> > Some review comments:
> >
> >> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> >> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
> >> --- a/drivers/base/auxiliary.c
> >> +++ b/drivers/base/auxiliary.c
> >> @@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> >>  }
> >>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> >>  
> >> +static void auxiliary_device_release(struct device *dev)
> >> +{
> >> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> >> +
> >> +	kfree(auxdev);
> >> +}
> >> +
> >> +static struct auxiliary_device *auxiliary_device_create(struct device *dev,
> >> +							const char *modname,
> >> +							const char *devname,
> >> +							void *platform_data,
> >
> > Can you have the caller set the platform_data if they need/want it after
> > the device is created?  Or do you need that in the probe callback?
> 
> My assumption was that it is needed in probe, but I guess that entirely
> depends on the driver. If that was ever needed, it could be added later
> I think.
> 
> >
> > And can't this be a global function too for those that don't want to
> > deal with devm stuff?
> 
> There was a note about that in the cover-letter of the v1 but I did not
> repeat it after.
> 
> It can be exported but I had no use for it so I thought It was better not
> export it until it was actually needed. I really do not have a strong
> preference over this.
> 
> >
> >> +							int id)
> >> +{
> >> +	struct auxiliary_device *auxdev;
> >> +	int ret;
> >> +
> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> >> +	if (!auxdev)
> >> +		return ERR_PTR(-ENOMEM);
> >
> > Ick, who cares what the error value really is?  Why not just do NULL or
> > a valid pointer?  That makes the caller much simpler to handle, right?
> >
> 
> Sure why not
> 
> >> +
> >> +	auxdev->id = id;
> >> +	auxdev->name = devname;
> >> +	auxdev->dev.parent = dev;
> >> +	auxdev->dev.platform_data = platform_data;
> >> +	auxdev->dev.release = auxiliary_device_release;
> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> >> +
> >> +	ret = auxiliary_device_init(auxdev);
> >
> > Only way this will fail is if you forgot to set parent or a valid name.
> > So why not check for devname being non-NULL above this?
> 
> If auxiliary_device_init() ever changes it would be easy to forget to
> update that and lead to something nasty to debug, don't you think ?

Yes, this is being more defensive, I take back my objection, thanks.

> >> +	if (ret) {
> >> +		kfree(auxdev);
> >> +		return ERR_PTR(ret);
> >> +	}
> >> +
> >> +	ret = __auxiliary_device_add(auxdev, modname);
> >> +	if (ret) {
> >> +		/*
> >> +		 * NOTE: It may look odd but auxdev should not be freed
> >> +		 * here. auxiliary_device_uninit() calls device_put()
> >> +		 * which call the device release function, freeing auxdev.
> >> +		 */
> >> +		auxiliary_device_uninit(auxdev);
> >
> > Yes it is odd, are you SURE you should be calling device_del() on the
> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
> > just call that here?
> 
> I'm confused ... I am call auxiliary_device_uninit() here. What do you
> mean ? 

Oh wow, I got this wrong, sorry, I was thinking you were calling
auxiliary_device_destroy().  Nevermind, ugh, it was a long day...

thanks,

greg k-h

