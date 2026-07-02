Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F3AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5F4SqLSzXJmEFBlCC95grIlZ95ePwaUrWR6lWfF8+0=; b=AKfBjzpePzLVQl9Wz8fVwFgu5+
	Wwct5bBdRd5ojFTvKkSuEBIG/lYilS3LQGvUivx7usIu8rvUEvZVFi7iBdaxDRwfmQCTg3wrXx518
	dDQc5yYl7TJzvXaQdSS5RMf6BenCJedTFKQk9xY6v4fRkt7n95KXbLFTkJdLEj3tnN0d7gx0rQ+ZB
	ilkJDNzZCT2bZ4wT+6cXWZjxzvO78NJI8G+ZxoBU1tqV2cbOFPoBMtOQTNAr+1DyXH9OXjiq28VHY
	uI1rXW6t7iLf37zqTcxfO9ShMLY5RcoyVFXujCqQu+vUE4O7mzpeIhsX91YHO2Y+XyhQji6PCw5+x
	jx0Doteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNUL-00000005Pgu-2An3;
	Thu, 02 Jul 2026 19:54:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNUK-00000005Pgj-0Wul
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:54:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 93C3D43EC0;
	Thu,  2 Jul 2026 19:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC431F000E9;
	Thu,  2 Jul 2026 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783022059;
	bh=H5F4SqLSzXJmEFBlCC95grIlZ95ePwaUrWR6lWfF8+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lxSHss0jvK733v7BcM65Sx1MTW6AMDnyfsKr8aUmdVyraJinGJwuu9LxqTIuIjTch
	 53aM7s/8DC4UG2yPyIiEWJgCYHJqcHF/oILB5+udDsK6hEh16L2CXQggyUbf/cfaCX
	 byO7sJKOq6RcgaMHHAOtbQCIo6f/YbGyMfyhyR7J8QeGco0JoC23f7XDbtWD+IW6aq
	 75XQn2YmirE3ToiqMt7mmw2PHlwAnyZRIx4Tmsh4UvZjxm6z6XxuPu0bV1svRH61cJ
	 g1Bvgm6gFRGpIlxQjWlf4PAy9ORUsrayYN7JKByWKmPT9JHA7jPHsbQrBE9QMyJWHK
	 fcuqAp46QwCew==
Date: Thu, 2 Jul 2026 20:54:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Harshit
 Shah <hshah@axiado.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <20260702205412.4cd58a5a@jic23-huawei>
In-Reply-To: <5e84024c-041b-4e2b-9a91-6c0bb9fb3bb2@axiado.com>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
	<20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
	<20260622115554.000036a9@gmail.com>
	<5e84024c-041b-4e2b-9a91-6c0bb9fb3bb2@axiado.com>
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

On Tue, 23 Jun 2026 10:30:37 +0200
Petar Stepanovic <pstepanovic@axiado.com> wrote:

> On 6/22/2026 11:55 AM, Joshua Crofts wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> >
> > On Mon, 22 Jun 2026 00:47:28 -0700
> > Petar Stepanovic <pstepanovic@axiado.com> wrote:
> >  
> >> Add support for the SARADC controller found on Axiado AX3000 and
> >> AX3005 SoCs.
> >>
> >> The driver supports single-shot voltage reads through the IIO
> >> subsystem. The number of available input channels is selected from
> >> the SoC match data, allowing AX3000 and AX3005 variants to use the
> >> same driver.
> >>
> >> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> >> ---
> >> +     info->clk_rate = clk_get_rate(info->clk);
> >> +     if (!info->clk_rate)
> >> +             return dev_err_probe(dev, -EINVAL, "invalid clock rate\n");
> >> +
> >> +     ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> >> +     if (ret < 0)
> >> +             return dev_err_probe(dev, info->vref_uV,
> >> +                                  "failed to get vref voltage\n");  
> > Sashiko raised an issue that I've missed on previous reads - why
> > are you using info->vref_uV in dev_err_probe()? The info struct
> > is not zeroed out on initialization, which means that dev_err_probe
> > will return a different value each time when read_voltage() fails.
> > It was designed to accept the retval from whatever function we're
> > checking.  
> 
> Thank you for catching this.
> You are right, |dev_err_probe()| should use the return value from |devm_regulator_get_enable_read_voltage()|, not |info->vref_uV|.
> I will fix this in the next version by passing |ret| to |dev_err_probe()| and assigning |info->vref_uV| only after the call succeeds.
> 
Hi Petar,  Quick process thing.  If you fully agree with some
feedback, don't send an email to say that. The place for thanks
etc is the change log of the next version.

We are all swamped in email and it takes a non trivial amount
of time to check every reply for discussion that needs to continue.

This is probably the most common thing people who are new to the kernel
do that I'd rather they didn't :)  I send this email once or twice
a week at the moment.

Thanks,

Jonathan

> Regards,
> Petar
> 
> 


