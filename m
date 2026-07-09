Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20064C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+LVGraXAMblh/wS3bFKCf1Rotn9jKdnH5k+fGzPHRk=; b=zfXg6cl6JNcSXqWwinMcTwxF14
	4oXTX/qJJgUH1xJFAgl+AdxME18WC7CsidGxVb948fKRAvBdDS3oJxD2Rc6ct9CkrjwL1vrSQjHfW
	5B02O58KMq4haltAZk/ldQeJ+42ypEQ7ikhM98zK+JlMiVp6k4YUjvtrI3xXPpExT5/yE3SdwA+qS
	Xx6GRkemWRVhfcmEe7VPaEs4k2f97fwc8PQLsXHGzwGe5xpaxpt2dqTW4A3P5Op00u/d51tNxhUDY
	dFFQK20DFsgHugVewcbrI5rTBTdqOhbEHMZuHhZdPPVQ32wmAHwA/zlN9y7PpbT3djum5lpCFA6YX
	wQhUqsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp7U-00000002dXd-45A3;
	Thu, 09 Jul 2026 13:48:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp7T-00000002dXM-2c9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBACA6001A;
	Thu,  9 Jul 2026 13:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AB21F000E9;
	Thu,  9 Jul 2026 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783604930;
	bh=K+LVGraXAMblh/wS3bFKCf1Rotn9jKdnH5k+fGzPHRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I59NSzvaQxwTdYf/ydnUSsp3J7DRGD6vuGADrtJX3lWUUqErsp6d6+63BaCU2UH3V
	 q9i0SATbBbTGY4RuXl/8pyesWUhMIhjOoL53RMDtqdAUhVElEm3TPWrOmWent7AISY
	 U19kiYNZLe6XkO+rAPKDIRyhqlFQEKFTMUdtVk9nzDXYN2QNkboKu5KMB6h67J/qAX
	 5AWIXf1rUbdA38oscMMdV4R7ETds30jthSI7xq6ilNGfe1DH8Vd7xLeNN3d3dzTgGj
	 EmdXIlZNa1vL4OQeCpQZY4L1IxOauswZHU4kCZHv0NLOzZyltr7bONZorKx4UUTnV1
	 zUeN3v07P3ZzA==
Date: Thu, 9 Jul 2026 14:48:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <28cc462c-4c65-4de9-a9e2-965646eb4c83@sirena.org.uk>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yR+snn5kvWfft1sV"
Content-Disposition: inline
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
X-Cookie: MS-DOS must die!
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


--yR+snn5kvWfft1sV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.
> From specification perspective only ARM specific transport layers should be
> available on ARM/ARM64 architectures.

Acked-by: Mark Brown <broonie@kernel.org>

--yR+snn5kvWfft1sV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPprYACgkQJNaLcl1U
h9BuZwf7BOfh7haRASNEf+GyM/vJ8Rk5M6i8yfFXIOEaCoBhABZ8W1qPGH3D9QB6
j85LaXzp5x1NmpHyO1zPkfENzIT8rDMO3sNcd2V1i9UbGT5EZAOjkvFpEAiUbDPg
6vmqmlrPHzncOhGwzSsjgbGIrv8q6IDUKZCPB1fFjuBJICagQCuAQ8onuA+RLmMH
mCYg0dJz9kljPFTkBn0UXgVnCBDyR0em/jBJoFVGQqmNEuAit/KicZ13TP6+ApXP
fsZpWN+9x9deYwe20wbBAoZ6dpnPlv86m1OPhEO3WtcoKmnXLo7onCWHsRAKLJB7
57OJGcXyJz+mFT2Y1Clm/wpPUCck8g==
=gvbq
-----END PGP SIGNATURE-----

--yR+snn5kvWfft1sV--

