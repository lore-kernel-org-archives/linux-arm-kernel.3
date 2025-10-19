Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E9CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 23:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL+/KBVBt7ybXFRGcP41DFJKQfuf10A0qEbi6RFqyFg=; b=jJ5kGfRvwqMfxQX/8JhBVMVGX8
	suQHZnebTYkPvTW5De8+fH1KBIKNuK2LO+9CuXp5tTMMazJhOf6hHegm5ukyhFYkE/RXNMgLaWhgB
	o2oPiy3OF7DO9HlGBkFutIkAOa9iS3xyzjY19R6QTzK8eNL4k0B3m0vcppMatm6ZX8B9FvwC6VOun
	+EGyChp150NNtzgYoYrkntFT7Teb6C2F9tR8gb/krAkvBnU0ROTMNiYHQPsVqZ011d3LBLwhqva1u
	8DNDskmJ/auS/2Gt/Ydd5aosVeyC6eyLDrQb2A4BCAyPaNIWBRSqJXcntnFMiQWixvIeTIbN3ESKk
	w38pGAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAcOm-0000000BWVn-3EWc;
	Sun, 19 Oct 2025 23:01:12 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAcOk-0000000BWUL-11w8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 23:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760914827;
	bh=YL+/KBVBt7ybXFRGcP41DFJKQfuf10A0qEbi6RFqyFg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EBetrH7Mpg1i1zFMo8JaQBs+Cjt3hHOhLBkGvVSs7waTLYIOzg9cqMNtrXUZAOat7
	 zJ6rFaO2+KA/ZfRSDelAVV5cxNxEfrycVHUI2CFYGZD7Ch9+/IWskmiCxCwukNem8F
	 kPTVGo3/XVioCSuH67PQZZ2g1yW2DO2UQiHCf3I8/e56hejAHIGNjEVj0rI4rISro+
	 v2C8BN0ZR9tVobn3cUyCLbBKF47AqKlXWyabKdhiEXCD5r4NN84ic+0Q7Wn5RYmFsn
	 JwKp9Eipxql3mS9Ut+hwivy5RLaCu9IezcvHUCFkyA+LCdt27GTR5DluXFH6cSx011
	 KpY+zwcV3Impg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0C68E6CA42;
	Mon, 20 Oct 2025 07:00:17 +0800 (AWST)
Message-ID: <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Brian Masney <bmasney@redhat.com>, Iwona Winiarska
	 <iwona.winiarska@intel.com>, Joel Stanley <joel@jms.id.au>, Maxime Ripard
	 <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 20 Oct 2025 09:30:16 +1030
In-Reply-To: <2025101721-twiddling-huskiness-4852@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
	 <aMatZAX6eFI1RmDH@redhat.com>
	 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
	 <aPEZSY6RC-UVclxN@redhat.com>
	 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
	 <2025101759-runner-landing-374b@gregkh>
	 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
	 <2025101721-twiddling-huskiness-4852@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_160110_500993_D2193338 
X-CRM114-Status: GOOD (  30.09  )
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

On Fri, 2025-10-17 at 09:43 +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 17, 2025 at 05:57:44PM +1030, Andrew Jeffery wrote:
> > On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > > > Hi Greg,
> > > >=20
> > > > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > > > Hi Andrew and Iwona,
> > > > >=20
> > > > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > > > > Hi Brian,
> > > > > >=20
> > > > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > > > Hi Iwona, Joel, and Andrew,
> > > > > > >=20
> > > > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > > > driver from
> > > > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > > > semantic patch
> > > > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > > >=20
> > > > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > > > like to remove
> > > > > > > this API from drivers/clk in v6.19.
> > > > > >=20
> > > > > > My (strong) preference is that Iwona applies it, but I'll keep
> > > > > > an eye
> > > > > > out for any unusual delays.
> > > > >=20
> > > > > This patch wasn't picked up for v6.18. Any chance this can get
> > > > > picked up
> > > > > now for v6.19?
> > > > >=20
> > > > > I'm hoping to get this merged so that we can remove the
> > > > > round_rate() clk
> > > > > op from the clk core. The clk maintainer (Stephen) mentioned this
> > > > > work
> > > > > in his last pull to Linus.
> > > > >=20
> > > > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@ke=
rnel.org/
> > > >=20
> > > > Are you happy to pick this up directly in Iwona's absence?
> > >=20
> > > Why me?
> >=20
> > I figured that would be sensible since Iwona historically sent you PRs
> > for the PECI subsystem.
>=20
> I did not remember that, sorry.
>=20

No worries.

> =C2=A0 The MAINTAINERS file does not mention
> this at all, and it lists many other maintainers that should be able to
> take this patch:
> 	$ ./scripts/get_maintainer.pl=C2=A0 drivers/peci/controller/peci-aspeed.=
c
> 	Iwona Winiarska <iwona.winiarska@intel.com> (maintainer:ASPEED PECI CONT=
ROLLER)
> 	Joel Stanley <joel@jms.id.au> (maintainer:ARM/ASPEED MACHINE SUPPORT)
> 	Andrew Jeffery <andrew@codeconstruct.com.au> (maintainer:ARM/ASPEED MACH=
INE SUPPORT)

Iwona currently appears unresponsive, as mentioned. Joel's stepped back
from maintaining the ASPEED bits as of earlier this year; I worked with
him to add myself as a maintainer there, hence the last entry, and now
getting in touch with you.

I can apply the patch and send you a PR if that helps, if Iwona doesn't
respond in the mean time.

Andrew

> 	linux-aspeed@lists.ozlabs.org=C2=A0(moderated list:ASPEED PECI CONTROLLE=
R)
> 	openbmc@lists.ozlabs.org=C2=A0(moderated list:ASPEED PECI CONTROLLER)
> 	linux-arm-kernel@lists.infradead.org=C2=A0(moderated list:ARM/ASPEED MAC=
HINE SUPPORT)
> 	linux-kernel@vger.kernel.org=C2=A0(open list)
> 	ASPEED PECI CONTROLLER status: Supported
> 	PECI SUBSYSTEM status: Supported
> 	ARM/ASPEED MACHINE SUPPORT status: Supported
>=20
> thanks,
>=20
> greg k-h

