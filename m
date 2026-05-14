Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2404CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yhy6NkQ+2FEgUIJ0c+IiCdunWdCMtL85smnQd+5uq+A=; b=LizAU+HHF3WnSa5vTs2MX4gT/I
	BR9QVcjhYUKFKx4HoAbZoHEmv7Rst9JK/cnUfHrOrGpoe5Q638Dgy0j543RVsU0CzSjOqVm2jZ0q8
	7Kme27xK0akZk4DLmzBbJPoz3/1t3zv6Ajup1UjjnvfoJa9XP0K/JalOG4ni6d4gMdVNqNSvjGBSd
	wdg9wup61oN+KEnz/4seFu4OSczQtUkymc+3mQDy3KXPArXgi0S2RM8CZS7dY3prJl8ZOmlE2qZD4
	V/vzkls3JIrTDhxTKF58kXPL2asnqINkQeBf15jmLk63a2aa2j842YA2UnpIcsjbVXpC42wwr6PuF
	3czZrDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTSK-00000005DTB-0ETv;
	Thu, 14 May 2026 10:38:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTSH-00000005DSP-1bFY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AB4740AB0;
	Thu, 14 May 2026 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05ABC2BCB3;
	Thu, 14 May 2026 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755092;
	bh=6KuqpnKj9sobxjDeqvX+sSPZ/QSHETFRdP4dGEBM9Kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP2+Q6k+vOdNmZMCBg/czK3/XTzKq0VLFIDXnQfI8q1f+VEZYn5dEFbuxpbhMVrKZ
	 LcDgW9pgW31NqQNAkn7M4q9P5MWsdEG75eNTJNuHXQu3VLIt8HrPHm/up/QrlZ3mY0
	 fzPYe8svCetFMPVLD/SM0Yi3iVTZb0iVGk8XokfoS+fbK6L+SHkBqDT/iorLvpG0GL
	 PQ5KaPxmJRTwQgTrA9hbLpPyHj25xksmDOIASEbpj14sISdX9+X/KOJo2yX7u0wUjc
	 feFwDC2Dyev2jez7STICOVKK3blTa65kRGL11nWgCmZE1UFBSxg9fUCpd+b1OWCmNb
	 jxpZVrv2QQt9w==
Date: Thu, 14 May 2026 11:38:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alex Tran <alex.tran@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260514-finicky-acoustic-flounder-2dd405@sudeepholla>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
 <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
 <2026051441-agreed-suffice-bbe1@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051441-agreed-suffice-bbe1@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_033813_439199_4D2D554F 
X-CRM114-Status: GOOD (  18.89  )
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

On Thu, May 14, 2026 at 08:48:19AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 13, 2026 at 11:27:21AM -0700, Guenter Roeck wrote:
> > On 5/13/26 11:02, Andy Shevchenko wrote:
> > > +Greg (I believe the trend is to drop such messages and not add them [back]?)
> > > 
> > 
> > Is there some common guidance on this ? I'd be all for dropping messages
> > instead of adding them, but there seems to be a perpetual battle between
> > people who want to log everything and people concerned about logging noise.
> > As maintainer I always seem to be stuck between those two camps.
> 
> When drivers work properly, they should be quiet.  This patch series
> adds a bunch of dev_info() calls, which is not ok.  If a developer wants
> to see extra messages, use the dev_dbg() infrastructure, or the tracing
> infrastructure, both of which are there for this very reason.
> 

I completely agree and tend to follow that. But I always assumed it was
left to maintainers taste.

> So yes, I agree with Andy, this series is not ok, don't make more noise
> please.
> 

I am now thinking if [1] was the one setting example for this series. I did
ack it as I left it to the subsystem maintainer's choice(in this case author
as well).

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20260304101457.7470-1-ulf.hansson@linaro.org/

