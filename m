Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281D8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MsUtMMF0iX7CLexIqOJRQHr1SBSErDvCsEOI8eH/gI=; b=3unJWEB3po21larOlDTLs44Oqu
	09EZkz8E5hcEoyQ0WD3d8/le+79dATYm/8DvjU3WrXFx6z3uTkZPX+PeWYrM3qlKjtHBjpQSr9OLT
	Djb4z+qKbXoOAk1VG8ukg3suybmsZQSfLYw1/BLBV+jztgmg8bCzrLwtx/TN8hT8hBXyONsnkJSC9
	/xvAWuV56rkqL6VGAEbUIhkeO7peFQJmaoUww5Z1dQPYhfWR66qhYNj3YPVsWuVXA9yT0rR+6oC0U
	67j5WqpNmmYkPQLrYt3A3zZZU7zKMMy/lppSP6GkVpGWJCoPipixS5QQTZK0OpZl0WalS7cvCqBqP
	E4HH1ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr5c-00000002ym5-0ofB;
	Thu, 09 Jul 2026 15:55:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr5a-00000002yls-1RRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 586F3600C3;
	Thu,  9 Jul 2026 15:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729F11F000E9;
	Thu,  9 Jul 2026 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783612501;
	bh=6MsUtMMF0iX7CLexIqOJRQHr1SBSErDvCsEOI8eH/gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XaG2qQ4lKyQHhnKBQceTBgsARkSR1fZhkvfbcutKN6ZPCGSyvfrZckrXqgjhjHz0t
	 nMenzU4cqVHyzTR+yvbLA57qSrBwR1/mdS9wJKsnVwTdwxX6yAMZjSIWVehdeBndRL
	 93M+hB0LGjPiRjBhZWm/Fp+AFZS1hTDDF4o0tOJVO2nU2xWKwpD7Xq7KC+Z1XB2aW6
	 awbRb+E53okTkYmdHUezT47eDMXNRcvbF0Lk1oKAT2FP9jgP4JaJa1doC9QwIZ4bTY
	 dgdF0k7f5Uw9tBFDXDW8R+eAhJuSZ5KvmYM/Jp39GFmRgC54iWBGDC1ywpVcySZ/BC
	 tN9m5rLEF1n+Q==
Date: Thu, 9 Jul 2026 16:54:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260709-rainbow-expert-bloodhound-b887e6@sudeepholla>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
 <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <158aa658-3109-4b7e-8213-1cc2cbd5aeb5@oss.qualcomm.com>
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

On Thu, Jul 09, 2026 at 04:49:18PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9-Jul-26 16:37, Sudeep Holla wrote:
> > On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 9-Jul-26 16:21, Sudeep Holla wrote:
> > [...]
> >>>
> >>> I need to recall why we moved from static list of devices to dynamic.
> >>> One reason I can think right now is the vendor protocols and their drivers
> >>> But in general it was an attempt to help multiple drivers bind to different
> >>> scmi_devices that have same protocol ID. E.g. the performance protocol
> >>> can be used by cpufreq and devfreq/performance genpd drivers.
> >>
> >> Note it is ok to have multiple drivers bind to the same modalias,
> >> depending on the reason why there are multiple drivers either one
> >> should detect that it is not compatible and exit probe() with -ENODEV
> >> or there should be some other mechanism to make sure only one driver
> >> loads.
> >>
> >> E.g. duplicate USB device-ids happen (they shouldn't but they do) and
> >> then the drivers typically figure out if they are talking to the device
> >> which they were written for, or the other device with the same USB-ids
> >> and then one of the 2 drivers exits with -ENODEV.
> >>
> > 
> > Understood. Sorry I tried to explain with examples assuming you may not
> > be aware of the details, but now reading your response, you have better
> > examples.
> > 
> >>>> I wonder if we can just move a small part of the drivers
> >>>> (some mapping table) into the bus code and then just have this work as it
> >>>> does on regular busses. I hope to be able to make some time to look into
> >>>> this soonish.
> >>>>
> >>>
> >>> I started with that few years ago and we then moved to this dynamic
> >>> device creation. But I agree if it is deviation from the norms(which I
> >>> wasn't aware of at the time), we can remove it.
> >>
> >> Looking at the issue this is causing for automatic module loading if we
> >> can get back to the bus enumeration code always creating a device without
> >> waiting for the driver kmod to load then that would be good IMHO.
> >>
> > 
> > Sure if it fixes the issue for you. Cristian can point out anything I
> > might have missed to consider as he is the one who reworked it and made
> > it dynamic device creation which at the time sounded nice option to
> > solve the issue. We weren't aware that it could cause such issues 🙁.
> 
> Note that before patch 1/2 of this series we did not have working
> module-autoloading for SCMI modules at all. With that said yes it would
> be nice to get this working.
> 
> Can you provide a patch for this to try ?
> 

Not sure what exactly are you asking, but I don't have anything w.r.t
the discussion handy to share. The codebase has moved a lot to revert
just the dynamic creation addition patch unfortunately.

-- 
Regards,
Sudeep

