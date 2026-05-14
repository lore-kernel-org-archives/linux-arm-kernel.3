Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F9DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gaz6O4X9do0BGWQONEe3HxIai3qi71LXCmSNixrbqLA=; b=gGRM0zYSs9ZV/iCZboqtEaqzLR
	cpKwly4EcpeD6Z5u5lvESb3gGlKN22RB+x0Df9LkW+LHlWZqOgPayV24DnBVT9y5/uCDzkJlL5p7Z
	NGTvY+LDZGGtgo7LDhFQEnpeW+8d1Aylom1iFzBcJvNsOUgUGrJ09zvzP8NMbp12oCETFG3o86ANc
	BRXQQTw6TZcu9xCWblYyXLTyyTMSG224imABVIlcAMGmvJGp5q0yQgr7glq05a/fogSKwS9AUhrpR
	1Wp4l+SDJJ5cvEwqvGw4DlOXHcGCAro3LIxEcXOG6kTozlsf+9q10aoBVLJ67dKTENnfzQw6mIXiM
	m4UuKmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPsX-00000004kik-3FaS;
	Thu, 14 May 2026 06:49:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPsX-00000004kiN-0bCB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 886B860129;
	Thu, 14 May 2026 06:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1CAC2BCB7;
	Thu, 14 May 2026 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778741344;
	bh=ScTbkdHtQwGqkowBWsSjhjRkE6Kb+/LGJ07lyfcr+U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjqpkp0WQIRm9dgM5y5Y/4JTN1V+PEHl5Ifbr7UWYeHD6WROSNpbjXEPZ6bQ0eU+J
	 mMzx0UqRapFU76U0xsAY/BdR116hHq1mwy2ifivXLXaGs2M0EuycoDjpS8D4ri4iIA
	 P53bjzBKT4DGAm9h7MnhuPT51SAqMLnjpTYe6Ngk=
Date: Thu, 14 May 2026 08:48:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alex Tran <alex.tran@oss.qualcomm.com>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] scmi: Log client subsystem entity counts
Message-ID: <2026051441-agreed-suffice-bbe1@gregkh>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <agS8udcvqgQmiqB4@ashevche-desk.local>
 <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2fb1de-ebc8-40ef-ac53-3348499295e3@roeck-us.net>
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

On Wed, May 13, 2026 at 11:27:21AM -0700, Guenter Roeck wrote:
> On 5/13/26 11:02, Andy Shevchenko wrote:
> > +Greg (I believe the trend is to drop such messages and not add them [back]?)
> > 
> 
> Is there some common guidance on this ? I'd be all for dropping messages
> instead of adding them, but there seems to be a perpetual battle between
> people who want to log everything and people concerned about logging noise.
> As maintainer I always seem to be stuck between those two camps.

When drivers work properly, they should be quiet.  This patch series
adds a bunch of dev_info() calls, which is not ok.  If a developer wants
to see extra messages, use the dev_dbg() infrastructure, or the tracing
infrastructure, both of which are there for this very reason.

So yes, I agree with Andy, this series is not ok, don't make more noise
please.

thanks,

greg k-h

