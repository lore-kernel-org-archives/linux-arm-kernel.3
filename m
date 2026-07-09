Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPd4R3RZr6XUvBWe8w2VqRwuexC/tSsRCq8hfew2igY=; b=HNkNb05sE0l/jLXg25FI65hWW1
	W73thwigGy8VBflRe2BpPVZg0JQaqVLtyUftRiV5JH/Gv161ZgfZYWesVNdaNxr4l9QlpfgM2BC0K
	WoTvHrFTGdp63cKL5VRHoyFjV344O9iHk31UTe4PN7DFzuxFu6Voyg4aISl9181M38oS2GkAC1O9f
	wZcnmtgJ0XIKqrSgRgvdgZujehKZwwDcJW8e62VtcEWQIoJ6OmzdmrvYKJ9Y7X3BAgBVJhiXK/0+V
	Xhl5KgsJsV5KCjnmHnM/ju1UWlVukRAnfFSzbS3W3fAnS9OzqIv8IMQi9BwGmybYoizkTxE0cNDaR
	syuVbNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpdd-00000002k1p-2SW2;
	Thu, 09 Jul 2026 14:22:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpdd-00000002k1f-0c0o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:22:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF110404E9;
	Thu,  9 Jul 2026 14:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35A11F000E9;
	Thu,  9 Jul 2026 14:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606924;
	bh=PPd4R3RZr6XUvBWe8w2VqRwuexC/tSsRCq8hfew2igY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U08lohmL+eSOg1LzXZz61RAnsviHoTM8uo6PezdCXwkZ0kCcScSo7S/bMAVS5stPn
	 IlnPyj/jltNh/nTNg+T8ltK51/WdXLFxB7UM+nyRs1gsv7XUXPBwCSND4dFHCSw7Jh
	 JgJ7XLHUqCTInOiiYAOls0uhaHscVPp2rt3Qgrl814QeN3zAXkTuarAPY3WFzT/CRm
	 k+7zqVWpPxRfiCOnp8TtyDt55QxOBsDZfYGzKqzhsKURSUUUHmp1eQDosGhysk5aC1
	 05bPv+Q3wj3zg/WGUDtQafiL/OHy2rdEs9a/aLjZkPr8c6DRRDa1fcIeojzwz3bAF0
	 Mb/4oRbxSDinA==
Date: Thu, 9 Jul 2026 15:21:57 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
Message-ID: <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
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

On Thu, Jul 09, 2026 at 04:07:17PM +0200, Hans de Goede wrote:
> Hi Brian,
> 
> On 9-Jul-26 15:28, Brian Masney wrote:
> > Hi Hans,
> > 
> > On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
> >> On 9-Jul-26 12:10, Sudeep Holla wrote:
> >>> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> >>>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> >>>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> >>>>> modules, but they are then not automatically loaded. Rework the SCMI
> >>>>> device table alias support to make modpost consume the information from
> >>>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> >>>>> this information, if known. Also add a protocol-based alias to also
> >>>>> trigger driver loading when only the SCMI protocol id is known.
> >>>>>
> >>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>>>
> >>>> So I just gave this a test spin and unfortunately it does not work.
> >>>>
> >>>> The problem with Fedora's kernel-config / setup is that the
> >>>> request_module() from patch 2/2 runs from the initramfs, but
> >>>> the scmi_cpufreq module is only available in the rootfs.
> >>>>
> >>>> It does work if I explictly add the scmi_cpufreq module to
> >>>> the initramfs, then it does get autoloaded.
> >>>>
> >>>> We really need some place to put a uevent sysfs attr which then
> >>>> gets replayed when udev is restarted from the rootfs and then
> >>>> re-reads all the uevent files as part of its coldplug
> >>>> enumeration.
> >>>>
> >>>
> >>> I don't have much knowledge on uevent to provide any suggestions/help.
> >>> But isn't this a generic requirement ? I mean you could have modules
> >>> install on the rootfs and not all of them are packed in initramfs ?
> >>> Just wondering if that works for other modules, we can examine how
> >>> do they work and what are we missing ?
> >>
> >> scmi is special because the actual devices under /sys/bus/scmi/devices
> >> only get created when the module with the driver is loaded because
> >> of some funtion/id mapping requiring info from the driver.
> >>
> >> Patch 2/2 tries to work around this by loading all scmi drivers matching
> >> the scmi protocol which is known at bus enumeration time, but this only
> >> works if the actual scmi driver is in the initramfs because this done
> >> through directly calling modprobe() from the kernel which does not
> >> get "replayed" when switching to the real rootfs.
> > 
> > Should the SCMI drivers be added to the dracut module here?
> > 
> > https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73
> > 
> > A few years ago we had to add the interconnect drivers to the list for
> > Fedora.
> 
> That would be one solution. I first want to understand the problem better
> though. The scmi bus not creating the devices until the kmod with the driver
> has loaded is weird.

I need to recall why we moved from static list of devices to dynamic.
One reason I can think right now is the vendor protocols and their drivers
But in general it was an attempt to help multiple drivers bind to different
scmi_devices that have same protocol ID. E.g. the performance protocol
can be used by cpufreq and devfreq/performance genpd drivers.

> I wonder if we can just move a small part of the drivers
> (some mapping table) into the bus code and then just have this work as it
> does on regular busses. I hope to be able to make some time to look into
> this soonish.
> 

I started with that few years ago and we then moved to this dynamic
device creation. But I agree if it is deviation from the norms(which I
wasn't aware of at the time), we can remove it.

-- 
Regards,
Sudeep

