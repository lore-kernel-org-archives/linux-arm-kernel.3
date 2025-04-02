Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C9FC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/4UPRO5F/oI15G0R/eXlr3/NmlzLK/3hZJSHUEledA=; b=KpLZchvJyKsAa6HXyV08WmFJyM
	LT0OmpSs31uEgN5ajFpmCEEaH38yDGA1bfbAM1QLG2D9DNrqAynyHoOssNvBHs9TfyQm1KaLQH4Qo
	8qW1xrFVUKb+AHbRmwxED3joT/M8GQLEghLehN0g6Nji6sQ89AhVBM9r9UNooEo+/rjK87tFDAiRL
	Mpqh/BDUNH521uK+hzFbqrgcreS8ZYCc4QzqFDnXqw3bAsyyK/qATfmI5F+eGj7kdoo1MULkr0UMp
	GFP6vumxhr1ZarS7YpwYnEwTy9pEtCEawrw0xOHJFuFj+XeRY3i9eM19i88oAs8PaI88fmCs3OzEG
	rZVVizfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00dE-00000006ayf-0ukE;
	Wed, 02 Apr 2025 16:08:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00bQ-00000006adE-3gPf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 16:06:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63940106F;
	Wed,  2 Apr 2025 09:06:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0CAE3F63F;
	Wed,  2 Apr 2025 09:06:03 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:05:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z-1gY8mQLznSg5Na@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_090608_961451_C0ACED82 
X-CRM114-Status: GOOD (  20.31  )
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

On Wed, Apr 02, 2025 at 11:59:47AM +0100, Sudeep Holla wrote:
> On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> > Add timeout argument to do_xfer_with_response() with subsequent changes
> > in corresponding drivers. To maintain backward compatibility use
> > previous hardcoded timeout value.
> > 

Hi Matthew, Sudeep,

this is something I had my eyes on since a while and never get back to
it....so thanks for looking at this first of all...

> > According to SCMI specification [1] there is no defined timeout for
> > delayed messages in the interface. While hardcoded 2 seconds timeout
> > might be good enough for existing protocol drivers, moving it to the
> > function argument may be useful for vendor-specific protocols with
> > different timing needs.
> > 
> 
> Please post this patch along with the vendor specific protocols mentioned
> above and with the reasoning as why 2s is not sufficient.

Ack on this, it would be good to understand why a huge 2 secs is not
enough...and also...

> 
> Also instead of churning up existing users/usage, we can explore to had
> one with this timeout as alternative if you present and convince the
> validity of your use-case and the associated timing requirement.
> 

...with the proposed patch (and any kind of alternative API proposed
by Sudeep) the delayed response timeout becomes a parameter of the method
do_xfer_with_response() and so, as a consequence, this timoeut becomes
effectively configurable per-transaction, while usually a timeout is
commonly configurable per-channel, so valid as a whole for any protocol
on that channel across the whole platform, AND optionally describable as
different from the default standard value via DT props (like max-rx-timeout).

Is this what we want ? (a per-transaction configurable timeout ?)

If not, it could be an option to make instead this a per-channel optional
new DT described property so that you can configure globally a different
delayed timeout.

If yes, how this new parameter is meant to be used/configured/chosen ?
on a per-protocol/command basis, unrelated to the specific platform we run on ?
 
Thanks,
Cristian

