Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6Z5RyFXrHpvFc4eRiFbkrrxzN6WfAoXMcnq2pqicfw=; b=Sddz9LJUHS2eYv1udFIXXLIIAw
	5g742TpSDXHfpUKskzmQ3KFlo4C0KmUZxBg6YUN1NCiqpB90TM+JMpgdWk59Ab3VQ99atldfR5Xmz
	YXqmAgnwemf86O1X6C5wBLhyRv9DDSviJ46GJBceFtKeeiJLtARCllk1JLIkg11vhF2Rl4ipm9Bbn
	64sOWHDVaIkSflX61aUWqiQWO1NjGq/5eyfDvZbfRJj/CrVlziwaxcF71xvOOhz0KN9x9Upy1J6A6
	gmBTdibW2/QkkL4l7Vq/CX3pgWoFuO67hNd5ZGqtX8fN+bO21Vw3YCRWdQpqflyTMVcwoH6/5kSVc
	zAjhLcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKx3-00000000oHS-38z3;
	Tue, 21 Oct 2025 22:35:33 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKx0-00000000oGy-1kFO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 22:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761086116;
	bh=j6Z5RyFXrHpvFc4eRiFbkrrxzN6WfAoXMcnq2pqicfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NwVzHpcr0vkIJvUKi4uJ0cl729CK2k58bT2Z9Ridpa0BoeNFzr4MFJoyHmGl5fbzL
	 gYMCighc5YVlazpkf8da3p75/KNSwBfP0ZG2KsCPTB4YLtUh+alrSexKuCyr7nNRkG
	 LBhYY6ftXBx6U6YFmeKdl+dzpeEh+kIivnR6uYPC9VMKf6dBXAzF4L4vdCQqKHRTaV
	 8lolNXRaQ+P5jNzfc7yWl5ErfUyvSn6RrmZIMqxg3QnMC9O13/h/SYXQQVE1VE1Hbw
	 L0da78AKJ5pE5O8L81Bkf01EzxTShIlzcfSiZFAkH2K4nmMtgdASu2tgLNzHs+f6IQ
	 QTIbNS/9CZZpg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C76C57406C;
	Wed, 22 Oct 2025 06:35:13 +0800 (AWST)
Message-ID: <4aa22124cefc6bd23d75bdb0d5a85a2f38c22a77.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from
 round_rate() to determine_rate()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>, 
 "gregkh@linuxfoundation.org"
	 <gregkh@linuxfoundation.org>, "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "joel@jms.id.au" <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "sboyd@kernel.org" <sboyd@kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "mripard@kernel.org" <mripard@kernel.org>
Date: Wed, 22 Oct 2025 09:05:13 +1030
In-Reply-To: <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
			 <aMatZAX6eFI1RmDH@redhat.com>
			 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
			 <aPEZSY6RC-UVclxN@redhat.com>
			 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
			 <2025101759-runner-landing-374b@gregkh>
			 <2975918e3f3a7de245e93fbee52335acb78bb23a.camel@codeconstruct.com.au>
			 <2025101721-twiddling-huskiness-4852@gregkh>
		 <13566a08eeaed313ad789abcae1920d9b00483b0.camel@codeconstruct.com.au>
	 <d53256b35ee7089607463c66bb4a8c3420faf058.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_153530_691382_8041FBDD 
X-CRM114-Status: GOOD (  34.17  )
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

On Tue, 2025-10-21 at 21:01 +0000, Winiarska, Iwona wrote:
> On Mon, 2025-10-20 at 09:30 +1030, Andrew Jeffery wrote:
> > On Fri, 2025-10-17 at 09:43 +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 17, 2025 at 05:57:44PM +1030, Andrew Jeffery wrote:
> > > > On Fri, 2025-10-17 at 08:41 +0200, Greg Kroah-Hartman wrote:
> > > > > On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> > > > > > Hi Greg,
> > > > > >=20
> > > > > > On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > > > > > > Hi Andrew and Iwona,
> > > > > > >=20
> > > > > > > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrot=
e:
> > > > > > > > Hi Brian,
> > > > > > > >=20
> > > > > > > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > > > > > > Hi Iwona, Joel, and Andrew,
> > > > > > > > >=20
> > > > > > > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wr=
ote:
> > > > > > > > > > The round_rate() clk ops is deprecated, so migrate this
> > > > > > > > > > driver from
> > > > > > > > > > round_rate() to determine_rate() using the Coccinelle
> > > > > > > > > > semantic patch
> > > > > > > > > > appended to the "under-the-cut" portion of the patch.
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > > > > > >=20
> > > > > > > > > Would it be possible to get this picked up for v6.18? I'd
> > > > > > > > > like to remove
> > > > > > > > > this API from drivers/clk in v6.19.
> > > > > > > >=20
> > > > > > > > My (strong) preference is that Iwona applies it, but I'll k=
eep
> > > > > > > > an eye
> > > > > > > > out for any unusual delays.
> > > > > > >=20
> > > > > > > This patch wasn't picked up for v6.18. Any chance this can ge=
t
> > > > > > > picked up
> > > > > > > now for v6.19?
> > > > > > >=20
> > > > > > > I'm hoping to get this merged so that we can remove the
> > > > > > > round_rate() clk
> > > > > > > op from the clk core. The clk maintainer (Stephen) mentioned =
this
> > > > > > > work
> > > > > > > in his last pull to Linus.
> > > > > > >=20
> > > > > > > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboy=
d@kernel.org/
> > > > > >=20
> > > > > > Are you happy to pick this up directly in Iwona's absence?
> > > > >=20
> > > > > Why me?
> > > >=20
> > > > I figured that would be sensible since Iwona historically sent you =
PRs
> > > > for the PECI subsystem.
> > >=20
> > > I did not remember that, sorry.
> > >=20
> >=20
> > No worries.
> >=20
> > > =C2=A0 The MAINTAINERS file does not mention
> > > this at all, and it lists many other maintainers that should be able =
to
> > > take this patch:
> > > 	$ ./scripts/get_maintainer.pl=C2=A0 drivers/peci/controller/peci-
> > > aspeed.c
> > > 	Iwona Winiarska <iwona.winiarska@intel.com> (maintainer:ASPEED PECI
> > > CONTROLLER)
> > > 	Joel Stanley <joel@jms.id.au> (maintainer:ARM/ASPEED MACHINE
> > > SUPPORT)
> > > 	Andrew Jeffery <andrew@codeconstruct.com.au> (maintainer:ARM/ASPEED
> > > MACHINE SUPPORT)
> >=20
> > Iwona currently appears unresponsive, as mentioned. Joel's stepped back
> > from maintaining the ASPEED bits as of earlier this year; I worked with
> > him to add myself as a maintainer there, hence the last entry, and now
> > getting in touch with you.
> >=20
> > I can apply the patch and send you a PR if that helps, if Iwona doesn't
> > respond in the mean time.
>=20
> Hi!
>=20
> Sorry for the delay - for some reason this entire thread didn't land in m=
y inbox
> and I just found it now, randomly browsing mailing list :/
>=20
> I will sent it as a PR for v6.19.

Ah, super! Thanks Iwona.

Andrew

