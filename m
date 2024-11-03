Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D60D11180
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q7IWRD1gpOW1Lskvc4rjHRf5AbTOTI6oSgYSMbB074=; b=FGLBVSguLzxe0ZDpVh2TnepK/D
	yzY3Rfp2Rj7j9k+dMYVkMVIM7ot6uJC/jJoc+jzLaaFEMAG6PNDDkwiUcwIFhgRb9b9LYcQb6k86+
	BND8+FKMaxIbjFqP8F6Kwx/kt1N8Tv7A+nFzLCvhml/TX82f0fWsmsx9H/9LPv3Ds0LlYMsZ1ep6B
	c9FFth6TQUEKTUANSvKCw0+Nkl39fFZxfQcMw81whD+HYjJ+xaqoYQ7pcStSnSdDUkwLAf9u/KLTD
	Tdh+liXA1ywLA9vF3K8/ncTM9YNSxF3ep2XZ+CFEgig7PGgVHQ/Q1sq1V8Q5mZ9NdBlaew2d/9P8Q
	l4SBhEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dFK-0000000BgAc-1u7B;
	Sun, 03 Nov 2024 16:14:34 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dCE-0000000BfuP-1OqB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 16:11:24 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id B0D134C745;
	Sun,  3 Nov 2024 16:11:15 +0000 (UTC)
Date: Sun, 3 Nov 2024 11:11:13 -0500
From: Aren <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <cx5bvcqfabsptn37uzscooh73j73dsoqadmfaibzxrzjk3byx4@ofwu7qa6ht4f>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-9-aren@peacevolution.org>
 <20241103112933.60f96f97@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103112933.60f96f97@jic23-huawei>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730650277;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=3q7IWRD1gpOW1Lskvc4rjHRf5AbTOTI6oSgYSMbB074=;
	b=pLlGFQaC+RM79asWpic5KogsiEgd7rRKglcrwIATo9BlHDxXN1CfmqzAZDL+ATwdbmOjG5
	pUiNx1bIU1/iU751En6NAr5vmzF7xDI64tGRkfacCUOIKoqq8QVCqJvvXKAuasXuQer4Jw
	F9P2J+OeRh+nMCaavLqn3ENg6jl+zCc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_081122_471273_E9FC4584 
X-CRM114-Status: GOOD (  23.26  )
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

On Sun, Nov 03, 2024 at 11:31:03AM +0000, Jonathan Cameron wrote:
> On Sat,  2 Nov 2024 15:50:39 -0400
> Aren Moynihan <aren@peacevolution.org> wrote:
> 
> > The vdd and leda supplies must be powered on for the chip to function
> > and can be powered off during system suspend.
> > 
> > This was originally based on a patch by Ondrej Jirman[1], but has been
> > rewritten since.
> > 
> > 1: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82
> > 
> > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> > ---
> > 
> > Notes:
> >     Changes in v4:
> >      - fix variable declaration order in stk3310_resume to match the rest of
> >        the driver
> 
> For this Andy was asking for consistency.  Generally we don't insist on a
> particular ordering in IIO drivers, but we do prefer them to be the same.
> Your new ordering is inconsistent between resume and suspend.  Whilst
> existing code may be inconsistent, you can still pick most common ordering
> and use that for your new code.
> 
> If the existing driver is inconsistent then feel free to tidy that up but
> do it in a precursor patch so there is a consistent style for you to then
> carry on.

Oh right, the order of declarations in stk3310_suspend also needs to be
flipped. Is that simple enough that you can fix it when applying this?

Apparently I was being dense, I checked the rest of the driver to see
what it did (it's consistent about putting shorter lines & ones without
an assignment first), and fixed the case Andy pointed out to match that,
but failed to check the rest of the patch.

Thanks
 - Aren

