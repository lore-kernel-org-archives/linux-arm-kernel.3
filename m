Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B91AC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq0j4WMyKl+SAo7hwBKRXWgrN10qKUEShOmoMttyE/U=; b=FSLUGNARr1PcKvIUxsLkC9iofw
	jJOqDa58B5NVrhTmpBALsTud7XoU2BlN8ij2vwYmB9GVh5jon+rNcMRGVFGscnRFwllDsb2Xxbwzs
	ojGreG0nsYvvC8n77aUyB/R4rwdZ3/wjLA88YEAAqEpdvUk3IgrqDIOJ1ozURpUtyZ7nM1oLKIbdI
	EcQ0xaxxix+NHoXpHW7vXAJvPTF/zpgoed9DYBpIeZEYUZmEjMWosy6Gho826MoJ1dfGBMg+AB7NB
	6tKQpeFYW5PbqKScTLT45g838q98G4FR4+gnNiLdjs0uJ/lJjcwQei30O2fukkmBvYRz3ZRTRHfCm
	tq4bxepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sFl-0000000240V-07TG;
	Sun, 13 Sep 2026 22:00:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5sFi-0000000240O-3lex
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:00:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B49640439;
	Sun, 13 Sep 2026 22:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEBC1F000FF;
	Sun, 13 Sep 2026 22:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789336846;
	bh=Wq0j4WMyKl+SAo7hwBKRXWgrN10qKUEShOmoMttyE/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=L6HwNCXF5EzrK/pmGJYOUUnefXlkfLJ2cDWwFJCj+2T4HXmfDfd0UTIt+bBTZM+5P
	 z7ltou4W7A2+JbgzFPfoIyjUcN7vvdSlKU06Vu6SHZ7+hLWQ42t5cI4NCcJTRgrj6C
	 r+8nHx3yCuE/HuYuDCvZ2IffZyW7LLB15lvVLMDIQV5+12+/0Hv5TjRlp90UFxnKzd
	 VvIMOzKV1JtvdgE2/+F2FQVlIXAv2sQhLuYTYNdNKB4WXkuQMeyKL8AQCDwoJp50fR
	 AxPBBUOmIHi6go0Cd62lyMTaS4NfvAbHk7EgetdM0jXkvypJpwFP9oMOjKFcZMaPRM
	 tWrEX8GDvufEw==
Date: Sun, 13 Sep 2026 23:00:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: mdshahid03@gmail.com, Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] iio: adc: bcm_iproc_adc: convert to devm-managed
 APIs
Message-ID: <20260913230041.4027958c@jic23-hlaptop>
In-Reply-To: <aqFdEiBzwIAuqVhp@ashevche-desk.local>
References: <20260908172359.30003-1-mdshahid03@gmail.com>
	<aqFdEiBzwIAuqVhp@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 9 Sep 2026 16:20:18 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Sep 08, 2026 at 10:53:53PM +0530, mdshahid03@gmail.com wrote:
> 
> > Changes in v4:
> > - Move the ADC enable error-path cleanup simplification into the
> >   clock conversion patch.
> > - Simplify the ADC devm cleanup action.
> > - Restore the blank line after the copyright header.  
> 
> Cover letter is not only changelog, it also a summary of the series.
> Patch wise LGTM,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Applied to the testing branch of iio.git for 0-day to take its
normal look before I push out as something I'd rather not rebase.

Thanks

Jonathan

