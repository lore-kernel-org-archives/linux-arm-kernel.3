Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E25ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPSoQs2CvGi5u9WAZU9trHNjsn5O33QJQeQZz6ZOGo8=; b=sMuR/ejk97YaKNXUm8gaLFSwzc
	ASo/l2GYNA/CxnkOwH0sAKSQXeonhwB8FS6tLGcz8own5jZjtQB0WUUTtM0In1wsLS4CPRve6x4k3
	s/QN1pv/cje3ZcsiqGSt3LnbO2Ie2HmPh4uG294shk1lmmI12tqDAkW7PFy/3EiXM1Y8JnKR3xYuC
	2DVOTwAnYKW85nnKk882WLQv6S0TljEIkmxmA0iJSwTzXZnvABVwb0XkIDnCVtaDnRn418h+uFOvB
	m1pY2Cvu8eMVWpYoJckhqpBMjDzBc7cBrwJ9UUeXh8bNHjXXrJkdGjFyyo96wuGYF0KBazk3H2tr1
	G18bKg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAllI-0000000CV44-414m;
	Mon, 20 Oct 2025 09:01:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAllF-0000000CV2f-0Sqn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:01:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 407431A1537;
	Mon, 20 Oct 2025 09:00:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14310606D5;
	Mon, 20 Oct 2025 09:00:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EABE102F0848;
	Mon, 20 Oct 2025 11:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tPSoQs2CvGi5u9WAZU9trHNjsn5O33QJQeQZz6ZOGo8=;
	b=FWCLp+LymzTBtoxTpwCzYeqpC03RM5EI7AN7m04pAvK1k+3K7S9RkJKa6pxKOrt+rYFmhC
	TzdH1nu7WX2+ytv8jxRU37msTsvka2trXNIPTurDBqWBzyXvGqX4DPlZ3HD/aDIcvyOeMW
	EBmZzwmJStLSpTECQHbKP4h17C0oNr8BJCSaFRR2VINwm/jdSU+0RnPA9fqHOQuebw5zFg
	kamhtAmJBEGnhwkcK5Da+rZXiArfdes8X5DCXTBN/RPTjSaetFawm4FK4Yq5JF6clVjy8O
	I85axUH+b6Xe0ojYvTG7FwBzfKttPZzsrtiS/emYYBx+WPKDIXEJAPw0HvX/zQ==
Date: Mon, 20 Oct 2025 11:00:40 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
Message-ID: <20251020110040.18cf60c9@kmaincent-XPS-13-7390>
In-Reply-To: <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-3-maxime.chevallier@bootlin.com>
	<20251017182358.42f76387@kernel.org>
	<d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_020101_427438_0A187B6B 
X-CRM114-Status: GOOD (  42.68  )
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

On Sat, 18 Oct 2025 09:42:57 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Jakub,
>=20
> On 18/10/2025 03:23, Jakub Kicinski wrote:
> > On Wed, 15 Oct 2025 12:27:22 +0200 Maxime Chevallier wrote: =20
> >> The DWMAC1000 supports 2 timestamping configurations to configure how
> >> frequency adjustments are made to the ptp_clock, as well as the report=
ed
> >> timestamp values.
> >>
> >> There was a previous attempt at upstreaming support for configuring th=
is
> >> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
> >>
> >> In a nutshell, the timestamping can be either set in fine mode or in
> >> coarse mode.
> >>
> >> In fine mode, which is the default, we use the overflow of an accumula=
tor
> >> to trigger frequency adjustments, but by doing so we lose precision on=
 the
> >> timetamps that are produced by the timestamping unit. The main drawback
> >> is that the sub-second increment value, used to generate timestamps, c=
an't
> >> be set to lower than (2 / ptp_clock_freq).
> >>
> >> The "fine" qualification comes from the frequent frequency adjustments=
 we
> >> are able to do, which is perfect for a PTP follower usecase.
> >>
> >> In Coarse mode, we don't do frequency adjustments based on an
> >> accumulator overflow. We can therefore have very fine subsecond
> >> increment values, allowing for better timestamping precision. However
> >> this mode works best when the ptp clock frequency is adjusted based on
> >> an external signal, such as a PPS input produced by a GPS clock. This
> >> mode is therefore perfect for a Grand-master usecase.
> >>
> >> We therefore attempt to map these 2 modes with the newly introduced
> >> hwtimestamp qualifiers (precise and approx).
> >>
> >> Precise mode is mapped to stmmac fine mode, and is the expected defaul=
t,
> >> suitable for all cases and perfect for follower mode
> >>
> >> Approx mode is mapped to coarse mode, suitable for Grand-master. =20
> >=20
> > I failed to understand what this device does and what the problem is :(
> >=20
> > What is your ptp_clock_freq? Isn't it around 50MHz typically?=20
> > So 2 / ptp_freq is 40nsec (?), not too bad? =20
>=20
> That's not too bad indeed, but it makes a difference when acting as
> Grand Master, especially in this case because you don't need to
> perform clock adjustments (it's sync'd through PPS in), so we might
> as well take this opportunity to improve the TS.
>=20
> >=20
> > My recollection of the idea behind that timestamping providers
> > was that you can configure different filters for different providers.
> > IOW that you'd be able to say:
> >  - [precise] Rx stamp PTP packets=20
> >  -  [approx] Rx stamp all packets
> > not that you'd configure precision of one piece of HW.. =20
>=20
> So far it looks like only one provider is enabled at a given time, my
> understanding was that the qualifier would be used in case there
> are multiple timestampers on the data path, to select the better one
> (e.g. a PHY that supports TS, a MAC that supports TS, we use the=20
> best out of the two).

No, we do not support multiple timestampers at the same time.
For that IIUC we would have to add a an ID of the source in the packet. I
remember people were talking about modifying cmsg.=20
This qualifier is indeed a first step to walk this path but I don't think
people are currently working on adding this support for now.=20

> However I agree with your comments, that's exactly the kind of feedback
> I was looking for. This work has been tried several times now each
> time with a different uAPI path, I'm OK to consider that this is out
> of the scope of the hwprov feature.
>=20
> > If the HW really needs it, just lob a devlink param at it? =20
>=20
> I'm totally OK with that. I'm not well versed into devlink, working mostly
> with embedded devices with simple-ish NICs, most of them don't use devlin=
k.
> Let me give it a try then :)

meh, I kind of dislike using devlink here. As I said using timestamping
qualifier is a fist step for the multiple timestamping support. If one day =
we
will add this support, if there is other implementation it will add burden =
on
the development to track and change all the other implementation. Why don't=
 we
always use this qualifier parameter even if it is not really for simultaneo=
us
timestamping to avoid any future wrong development choice.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

