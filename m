Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUCvo+eJn6bk+nron8wWMV1pda48hSURP7rehDXmNbU=; b=NFu/4zrhCAM3cRe9Nk90qAzmHW
	40MgS8SEL0Gq30d0/1deCVob/wIVxjNIWLY8Git9nBAHfxKd2f9D5rWe3mS7gcSh94shWUGwqfn1Q
	V4+Z+hw1hSQ2Pd96dyoKwq0ci8Ztp9FzJnPB3YySWdCzRs+MaqBlbereffWJ3jkN0a0fZ7v9dlfK+
	G/4mz7aAm+srOdbP2X64AtSlf8WYUaMxq+99bh2WLNuWpPoT4L4Lt83/K8gYAq4cixANtRyV6/LOz
	e27YgQZhg/frpc7KLmClU+pbFYoQ6Ewr1yXtScTPyt5Yr7Z60fnKm3dwZgzKuih/cW64UYEe8CAuC
	imOiNTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr0Z-00000002yCM-1Eer;
	Thu, 09 Jul 2026 15:49:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whr0W-00000002yBb-2c1b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:49:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B76163591;
	Thu,  9 Jul 2026 08:49:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D82703FC81;
	Thu,  9 Jul 2026 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783612186; bh=ZsaKwAUaY+JsR6IrwdSMe3xghd912Wa8gpID9dHYC30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evPqTocHRC03pIflm2SZxRRhVRTiFHKTvKcjolKMB239pCjvuYrLCRhAd4L02W3jy
	 OFtPohxvaG0XD94c3XJ/Bfko/yektPa6o5yoouYGp8VpZFlOjWdSIMlvetlMiXttOV
	 mwgBG7Zg+hn0jDotXznT+qvyAZDMTiIfgXQkn4Eo=
Date: Thu, 9 Jul 2026 16:49:30 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
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
Message-ID: <ak_DCuTgF5uTI_Lb@pluto>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
 <ak-h8oPcL69fCUg2@redhat.com>
 <f05860be-dd75-49f8-b27a-bff7b554e71b@oss.qualcomm.com>
 <20260709-exuberant-galago-of-spirit-1c908f@sudeepholla>
 <5fb236b7-7b99-40fb-b80b-fa7e1dfccd70@oss.qualcomm.com>
 <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709-exuberant-narwhal-of-correction-7f4650@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_084948_746288_7C4D1311 
X-CRM114-Status: GOOD (  42.25  )
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

On Thu, Jul 09, 2026 at 03:37:33PM +0100, Sudeep Holla wrote:
> On Thu, Jul 09, 2026 at 04:31:00PM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 9-Jul-26 16:21, Sudeep Holla wrote:
> [...]
> > > 
> > > I need to recall why we moved from static list of devices to dynamic.
> > > One reason I can think right now is the vendor protocols and their drivers
> > > But in general it was an attempt to help multiple drivers bind to different
> > > scmi_devices that have same protocol ID. E.g. the performance protocol
> > > can be used by cpufreq and devfreq/performance genpd drivers.
> > 
> > Note it is ok to have multiple drivers bind to the same modalias,
> > depending on the reason why there are multiple drivers either one
> > should detect that it is not compatible and exit probe() with -ENODEV
> > or there should be some other mechanism to make sure only one driver
> > loads.
> > 
> > E.g. duplicate USB device-ids happen (they shouldn't but they do) and
> > then the drivers typically figure out if they are talking to the device
> > which they were written for, or the other device with the same USB-ids
> > and then one of the 2 drivers exits with -ENODEV.
> > 
> 
> Understood. Sorry I tried to explain with examples assuming you may not
> be aware of the details, but now reading your response, you have better
> examples.
> 
> > >> I wonder if we can just move a small part of the drivers
> > >> (some mapping table) into the bus code and then just have this work as it
> > >> does on regular busses. I hope to be able to make some time to look into
> > >> this soonish.
> > >>
> > > 
> > > I started with that few years ago and we then moved to this dynamic
> > > device creation. But I agree if it is deviation from the norms(which I
> > > wasn't aware of at the time), we can remove it.
> > 
> > Looking at the issue this is causing for automatic module loading if we
> > can get back to the bus enumeration code always creating a device without
> > waiting for the driver kmod to load then that would be good IMHO.
> > 
> 
> Sure if it fixes the issue for you. Cristian can point out anything I
> might have missed to consider as he is the one who reworked it and made
> it dynamic device creation which at the time sounded nice option to
> solve the issue. We weren't aware that it could cause such issues 🙁.
> 

The reason for the awkward mechanism of dynamic device creation AFAICR
was an explicit request by Qualcomm (via its Linaro landing team at
that time) for the generic vendor module suppport that I was adding to
be fully self-contained: so that you can write your own protocol and
add the DT node and that's it, without the need to patch some centrally
maintained table in the core SCMI stack to add your new vendor protocol.

Not saying that it was necesarily a good idea to allow that, but that
was the origin of this....as far as I can remember....together with the
fact that the internal interfaces were reworked to be absolutely the
same for standard protocols and vendor protocols...

I thought that the current situation was that auto-loading was working
for vendor protocols (this autoload issue appeared at first for vendors
protocols one year ago) then I had made this hacky attempt to make it
work for standard protocols by forcibly emitting a uevent for all known
standard protos:

https://lore.kernel.org/arm-scmi/20250203100154.140877-2-cristian.marussi@arm.com/


...but that was clearly not the proper way..and all the rework was
dropped...

Thanks,
Cristian

