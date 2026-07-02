Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBrlGHdg/4nSX4QzTJ0Yw5e59FLep9OR2Z7kdd/9HCE=; b=fLuWXn7vCXTQD9hJyqeWhwIsh6
	m9s0GE6/yfFSiBaCmXTg/FI20dWKiCfsYrhCC5kZlP8Kka02xJHKDPAKAfHLQ+PB01If8MzBgYfwj
	lBYFPZPM3qPqE7Y7BmE9+dynqUW8d7LZRdRzo6ApJTLOTu40yXAqhxM64HXp1rrhSO9n7klUUKoKL
	+10g0FsXJaUMJU1ZAF+gqpV1k6BWk6HMACGfj60TrogDP77AZ2c3HgvtlWPXPQLov0gQe5JNpB3sw
	KW1EmVMhS/JvNuQ9oNS6hZR+X+4q1YQpU3xVShBJSfSfx87bWO9XxoKIZCmafozx8Q9pXG2cVpgRz
	2sf65KwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfA6B-00000003bRl-1lpT;
	Thu, 02 Jul 2026 05:36:31 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfA68-00000003bRA-0hLk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:36:29 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 29FD6140010D;
	Thu,  2 Jul 2026 01:36:24 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 01:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782970584;
	 x=1783056984; bh=XBrlGHdg/4nSX4QzTJ0Yw5e59FLep9OR2Z7kdd/9HCE=; b=
	ZKcdgwIqb+ru2xMJjM2bCYvAyEW7ZvG5UZNjAC0kKnuuSsU2onVEWs220Dz2G8E+
	FDV01vETYk0nPiISNc4k31Sf2upk5TLUBBdvPNxcLr2SEcnxmh7FTyHOxpchhAqw
	ldgAd019icCEMdEKkPtmRFNSyEGC+97on5eY/sXzvOVAlqKGDt8CDVn/tZKqGdqV
	Mxhteb7UvQ3wpeGfiXlUjGTg3hmiBHETwawpkVBRcNg6VsJ6YES7qYzryNVsih+T
	//EjK4s2NDNrmvoAUyK21qbbLwvy4UJZkSyh3knTe3HWY5/62LypwJJVEK5PRLnI
	+NU7pRi5Sgwv+GL7ch4l0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782970584; x=
	1783056984; bh=XBrlGHdg/4nSX4QzTJ0Yw5e59FLep9OR2Z7kdd/9HCE=; b=f
	xtBu5E3Cmch2OWrzYTJYKFnBcXlUzBl7/3p+2tdGP78k34OY6n3rGl3UHn8nMsHM
	2ue0OeK6m5Mu4as/oWsGwUM2GBsjToXVooehaAU4maK3UG2xkcYRQbM/JN3eS8Zh
	UdbT6bfFhK8XNSFT9jMp3c5MI9yO82Vg8A3/VrXrwbou0ehKu2nDyVMBPGCM1WEf
	pO7Q0sn5WunzSN4J9zokGOoyreu7V1lCvi06Hf+sAkqMFTbCA0tlKrYLOMvs+LVu
	Y8L4gTKyAeqWtpvgFt+PM15053yFCumNllEuNdOkfa2guCXlRGOmcFneC2xopVNw
	90Gis114nS9OJATlQfxCQ==
X-ME-Sender: <xms:1vhFakisBrIaFlMs-k83fIqEpgeFASGOYqTOr_s7vxHRR_dIrkHtFg>
    <xme:1vhFan3ejulyLVLA5UPBsRXZl9g57ZeX1P0FMef9JS5dTPqO1UCDtN_OcxYKyyqpq
    MP1EtcMVpJgtaGXYWYnfeMLgbJf7wkwvaUWwV_gUcukjsk7lHw1Fwk>
X-ME-Proxy-Cause: dmFkZTEC/2mVBWOcrEkxjqdSRnoj9mG5aQXNjdjc6yAznOD8FtATXcMY1Toxj1OqpQSKMf
    naSQrnkLZo6wxXXZvv0CeCwAt7zq00EY3OHzbV7dxstt2EaDOQMiO2BdyuSRgtkv6sISMw
    Q3FjeYzm+h4Onk+1/+n6lSH56OTFI4/eugqrr79TxC4yVNOo36uwYHEEddUSULepfOEu6W
    H/XX6vs0QbX5iStsY1v7SDLsf4s4gtia11UqlAWCgvGa7Ii7Wt5G+mSuQ531WsJUZglUDo
    Oofryz3X/G8RnPfr3wpjEiBsQ3FoMyp2pTjFFCnDvtocW2UeDvh24uxSq+kIZ921L47Ns7
    gzkAOm/Yf/a4DMrLPdrA0fCyh62eCibHUtxNhHPtS3EzcRH+xehgkDQ41vXZmUrfhOsNGC
    j31KpI27yhMryQtpPn5sB/CBU/1cdzUHqrgLtFJxlj3dtvRKKIENIYsno1I63LxE00UK8V
    wEEkJls/5LrcPH30zuH9uQf3qUmyfCZ0W+XjMSpJqJpZZ4Jtq3h+i9WknSCF3Si9iH3/gP
    t9ti3fm/VYFdOB06pjlK97QkDsPFJ+aSWLwYI09lwyQKtSvnrNHPMIY1ZOurnK942RaTGO
    hE1QxIxsnFRiRRYEEJvzjuDyJ82ON6Mj5Tqhyz2UuNIU2clWI9Me9tb5NUPw
X-ME-Proxy: <xmx:1vhFamu6CF1Lcw-eKaPXfNoGqcAihXURaBkZP59f-8NVILWLwUtwrA>
    <xmx:1vhFaiTn97wkphEX1zcOvGf0SeRBEU3Bn8xmw41GAQlRVZxKjRn7dQ>
    <xmx:1vhFaqtY9VlxgPCYxZHvqOQekOc1T2-zQaRgNAhBARYS4rzAp0c5_w>
    <xmx:1vhFakAuxtrLi8ko5hC5kcQ1UGAhRFDITF3TM6iFIuRd8D8Xr_Ed9Q>
    <xmx:2PhFahGBFllerNItZerrISh99D7IxESmDENoV6F8MvUgRPfQbR-VC0T3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 58CC2182007E; Thu,  2 Jul 2026 01:36:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AgjFNhMrreLo
Date: Thu, 02 Jul 2026 07:36:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>
Message-Id: <46f76624-ba35-427d-8a60-ec0fe39e5b8c@app.fastmail.com>
In-Reply-To: <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-8-arnd@kernel.org>
 <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_223628_547516_A058E3D7 
X-CRM114-Status: GOOD (  11.94  )
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

On Thu, Jul 2, 2026, at 02:54, Ethan Nelson-Moore wrote:
> Hi, Arnd,
>
> On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> This configuration option is for the older boot method that preceeded
>> ATAGS. This was scheduled for removal back in 2001, but the removal
>> never happened, presumably because nobody cared enough to actually do=
 it,
>> not because there are any users left.
>
> Only netwinder_defconfig selects this option. Do the most recent
> NetWinder firmware versions actually need it? (LinusW, do you know
> this?) If not, can't we just drop it entirely?

If all StrongARM platforms are on the way out after the LTS kernel,
I don't see a need to remove this any earlier, even if the chance
that it's still needed is low.

       Arnd

