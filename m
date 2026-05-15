Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74F2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0wxUS7GvdEZUDIHneU0FsQScN6Ey+cR/GwGKSPn4DI=; b=Ws6LqHAfgN8PTFqA4KMSqobsCs
	1Dd3j3zsyLuoy6niWJ9OEQLw9HyEokqN/pXC6hokM/8N5uAzGZscxk75wtMd4DTNdEevUFLlEyY1K
	b5dO5EFTau0Cu05aa+j8HFxDbXb2o51ZZTkNGc063ligGXqaWd6ApQZQWumNX2U/47k+Ixv7u08ct
	Xn7UkJ5CHIZgwNLml0CN3ut4KaOU7qkvFwFZbwM9jLhT+ODaUyCSE3QwgPpaJ+/Y4ACyeDj+g6cbW
	HrG45nvhAnKAF3BSfgcegbXUkQ3+mzmiqKuXSwxdt3h1ssqJmottTj/TdEfggEE0/Hp8hmHa0ScEm
	K/mrJZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnvs-00000007jty-1dU0;
	Fri, 15 May 2026 08:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnvq-00000007jtg-369w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C277460252;
	Fri, 15 May 2026 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0F9C2BCB0;
	Fri, 15 May 2026 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833805;
	bh=r3ORmfQtv0ARyDCdOtTrhzGqeEBmEtb8whCU51Psl5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOClplrI7Z9cMk2Ye158aa3KtxSL/WY4mugEmIah5XzG3K6l9HQbH8/rqWKXDNzan
	 REtixeYLgQwcYYyIeaATuhSzZPf8lm+jKrwDuFOKRBoxeCzYdYuaYA7bjmCB3Pol46
	 NV1IzTFodqBLb8pmkZUatmtYIQBHusS1USe4dVbFyDB+oRO4+eW6WHq83AeCpgDBSX
	 W3BM/EmfjWgaF5eyMi3HLpfW5Sr6j/4wM1Ja/8Zil4fJ7sxJ+SshxC/A2ACfAk8sZE
	 ou9NQbXcEnGjRG5OPWRgHGSGHnoq89trl2sdH60swzI7CAoZsesMIwLAGLk43hctNY
	 NTXFKRzVU/qLA==
Date: Fri, 15 May 2026 09:29:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
 <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
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

On Thu, May 14, 2026 at 02:23:56PM -0700, Alex Tran wrote:
> On 5/14/2026 8:44 AM, Jonathan Cameron wrote:
> 
> > On Wed, 13 May 2026 10:16:53 -0700
> > Alex Tran <alex.tran@oss.qualcomm.com> wrote:
> >
> >> SCMI client drivers do not consistently log the number of supported
> >> entities discovered from firmware. This information is useful during
> >> debugging because it shows which domains or resources were exposed by
> >> firmware during probe.
> >>
> >> Add logging of the number of supported entities to the SCMI cpufreq,
> >> pinctrl, reset, hwmon, and powercap client drivers after a successful
> >> probe. This aligns these drivers with the existing logging in the SCMI
> >> power and performance domain drivers.
> >>
> >> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> > Hi Alex,
> >
> > Just curious but why +CC linux-iio and IIO folk?
> >
> > May be you had a false suggestion to add them from get maintainers.
> > If so be sure to check it's suggestions make sense!
> >
> > Not to worry - we can all hit the delete button ;)
> >
> > Jonathan
> Hi Jonathan,
> 
> Originally, there was another patch in this series to add the same
> functionality to scmi_iio probe but it was dropped. Apparently running b4
> prep --auto-to-cc does not prune stale entries from the cover letter. Will
> manually remove all entries and rerun the command in the future.
> 

I guessed so, but why was it dropped ? I don't agree to adding them elsewhere
just curious about why it was dropped in this case.

-- 
Regards,
Sudeep

