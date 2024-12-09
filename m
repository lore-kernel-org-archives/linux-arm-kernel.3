Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4A18k9T/z6QSwsnlaqmXCZ2IF3Wk0qI/oJS+IJfDSE=; b=rtVtnDkHwP8ZCo5yjxOaI+z0uS
	bkiPXtbSbOp41YK4B3CcnKq/YgMQhSlJkYutCGvSSfZ+wtmuhUvfJ5A1FNtzGF7S9WlqedLaMR2GH
	2Khv43bSKWpSABwisayQUQ4BiqetwWv6eJT2l8B2enLxVG9nhRJBINK7f+7+X/T42prMg0gr54Gmq
	FVT4GhQ4wZDE+1jWMrItolFzYZta+di91zY1FWLR4lbuaNvyFOYtTuxzABKgs/LQyeMMWPhePVqOf
	M0fu/T0WgNsiySkA61tvovRYUCs7duIJ8r8AFDM64FAq4yQgZqJjE6tb46ntPjjT92QInlI8FJEXP
	oyE90cwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi7L-00000008q4n-0XUv;
	Mon, 09 Dec 2024 18:04:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKi4J-00000008pWq-2pPt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 18:01:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD8141650;
	Mon,  9 Dec 2024 10:01:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F373F3F720;
	Mon,  9 Dec 2024 10:01:12 -0800 (PST)
Date: Mon, 9 Dec 2024 18:01:00 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Message-ID: <Z1cwTWQWamv3lywB@pluto>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-2-etienne.carriere@foss.st.com>
 <Z1bHgf_4qqZgSnDt@bogus>
 <22ff786d1e034169be21ef7dc32c4a3a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22ff786d1e034169be21ef7dc32c4a3a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_100115_798628_B17E695F 
X-CRM114-Status: GOOD (  27.21  )
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

On Mon, Dec 09, 2024 at 01:48:48PM +0000, Etienne CARRIERE - foss wrote:
> On Monday, December 9, 2024, Sudeep Holla wrote:
> > On Tue, Dec 03, 2024 at 06:39:07PM +0100, Etienne Carriere wrote:
> > > Remove limitation of 16 clock rates max for discrete clock rates
> > > description when the SCMI firmware supports SCMI Clock protocol v2.0
> > > or later.
> > >
> > > Driver clk-scmi.c is only interested in the min and max clock rates.
> > > Get these by querying the first and last discrete rates with SCMI
> > > clock protocol message ID CLOCK_DESCRIBE_RATES since the SCMI
> > > specification v2.0 and later states that rates enumerated by this
> > > command are to be enumerated in "numeric ascending order" [1].
> > >
> > > Preserve the implementation that queries all discrete rates (16 rates
> > > max) to support SCMI firmware built on SCMI specification v1.0 [2]
> > > where SCMI Clock protocol v1.0 does not explicitly require rates
> > > described with CLOCK_DESCRIBE_RATES to be in ascending order.
> > >
> > > Link: https://developer.arm.com/documentation/den0056 [1]
> > > Link: https://developer.arm.com/documentation/den0056/a [2]
> > > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > > ---

Hi,

> > 
> > [...]
> > 
> > > +
> > > +static int scmi_clock_get_rates_bound(const struct scmi_protocol_handle *ph,
> > > +                                   u32 clk_id, struct scmi_clock_info *clk)
> > > +{
> > 
> > This new function seem to have unwraped the scmi_iterator_ops(namely
> > prepare_message, update_state and process_response instead of reusing them.
> > Can you please explain why it wasn't possible to reuse them ?
> 
> Since we're interested here only in min and max rates, let's query the
> first and last rates only. This can save a bit of useless transactions between
> agent and firmware in case there are many clocks with somewhat large
> the discrete rate lists.
> 
> I though using the iterator for this specific case would add a bit more
> complexity: it's expected to iterate (st->desc_index incremented from the
> common scmi_iterator_run() function) whereas here I propose to send
> only 2 messages.

Yes, indeed the core iterator helpers are meant to issue a 'full scan'
retrievieng all the resources that are returned while handling in a
common way the underlying machinery common to all messages that, like
DESCRIBE_RATES, could possibly return their results in chunks as a
multi-part reply...

...having said that I can certainly extend the iterators to be configurable
enough to fit this new usecase and retrieve only the desired part of the
'scan' so that can be used for this kind of max/min query or for the
bisection case.

I would avoid to re-introduce ad-hoc code to handle these new usecases
that do not fit into the existing iterator logic, since iterators
were introduced to remove duplication and unify under common
methods...and this new iterator scenario seems to me that has already 2
usecases and certainly more protocol could want to perform similar 'lazy
partial queries' in the future, so I'd prefer to address this in a more
general way upfront if possible...I will think about it and post something
next week in the form of some new iterator extensions, if it's fine for you.

Thanks,
Cristian

