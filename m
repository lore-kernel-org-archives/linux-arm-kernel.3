Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E487AD11194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 00:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cm86/adYBO0QLMJTj80moqy+OSpgRV+dDfE8QASkuLs=; b=OcsMCHyfNuKURnwavubUPuI2vZ
	ur/dp/sSPwT0lNCJrrXoljmMhDkD4S1eTed8HxOoaFAvPFr4GmAXEIdFF1ko/axjAaskPubVbcguN
	X9LtZ+LI2JPw3E8z7xBopac5qFwAGNPxn8yqbUbZ9xpp+4Xn0aHjLyDC/FcOK5o/fsqnMU7rCyp+W
	aiguH3Iqy4IGMls4T/QOa++Yu/5fddsQuE4Vw6Aae9Nc5PDFjyjGh5ETaliVizQ6r4kFKBzMFmu0n
	jC0x4opEygzkO62idhHZI0NQRYKfCEPHYmfds5fUmnvG6BruljVllijQfCqH9jKnKjZHJzIo5d8gd
	nPPt//JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7kZa-0000000CHbj-3zI4;
	Mon, 04 Nov 2024 00:03:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7kXq-0000000CHM1-10gf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 00:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730678522;
	bh=cm86/adYBO0QLMJTj80moqy+OSpgRV+dDfE8QASkuLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QqHI7rhE5NLaRyprE6WKCAik4rWO9TXIZB8hGClSE0eoL/ZotGcXIg8mRB7oU/7xj
	 kKBFAqApO2jqrhOsUaShqbFNdA3JYCPpxtIMhAils8Zcc7L9C4C96eRKrPy1SbdkJX
	 W1euBcmLyVCXNvtuPlToaN7Oi6PgBIa1C8LloZyod9/W8EnmkJkuxNpptAXzgDWqhF
	 DMjeArBbGADfnVWfgqY1Qzf2FofpzPF1RyI1vnwpXbNYdtTRvjjiCqybuSd4Gqt9eG
	 AFwFi9LJRTSw7t/p3RcI3pZEfUUXKRiH3c25Q1/02Gy+kOAxnCREW3CKLmNoHikiHO
	 vVW9CrOl1jbxw==
Received: from [192.168.68.112] (ppp118-210-95-135.adl-adc-lon-bras32.tpg.internode.on.net [118.210.95.135])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EBC66A03A;
	Mon,  4 Nov 2024 08:01:56 +0800 (AWST)
Message-ID: <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>
Cc: joel@jms.id.au, wim@linux-watchdog.org, linux@roeck-us.net, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com, 
 DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
 chnguyen@amperecomputing.com
Date: Mon, 04 Nov 2024 10:31:55 +1030
In-Reply-To: <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_160210_498765_0F01326A 
X-CRM114-Status: GOOD (  23.12  )
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

On Fri, 2024-11-01 at 14:21 -0400, Patrick Williams wrote:
> On Fri, Nov 01, 2024 at 08:11:59PM +0800, Chin-Ting Kuo wrote:
> > The boot status mapping rule follows the latest design guide from
> > the OpenBMC shown as below.
> > https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-up=
date.md#proposed-design
> > - WDIOF_EXTERN1=C2=A0=C2=A0 =3D> system is reset by Software
> > - WDIOF_CARDRESET =3D> system is reset by WDT SoC reset
> > - Others=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> oth=
er reset events, e.g., power on reset.
>=20
> I'm quite surprised that the above is relevant for a kernel driver at
> all.=C2=A0 Isn't "EXTERN1" a name of a real watchdog signal from your
> hardware (my recollection is that there are 2 external watchdogs).

I think you may be referring to WDTRST1 (and WDTRST2) here.

WDIOF_EXTERN1 and WDIOF_EXTERN2 have an unrelated history:

https://github.com/torvalds/linux/blame/master/include/uapi/linux/watchdog.=
h

> =C2=A0 I
> think the point of this referenced design document was that most
> users
> of BMCs have "EXTERN1" used a for software reset conditions.
> `CARDRESET` should be representing resets by the watchdog itself.

I think this is what Chin-Ting is proposing for the Aspeed driver?

>=20
> The purpose of this design proposal was not to require very specific
> changes to individual watchdog drivers, but to align the userspace
> use
> with the best practices already from other watchdog drivers.=C2=A0 I don'=
t
> think the kernel driver should be bending to match a particular
> userspace implementation; you should be exposing the information
> available to your hardware.

I agree with this in principle, but I'm not sure what else is meant to
be done here.

>=20
> Having said that, it was known that there would need to be changes to
> the driver because some of these conditions were not adequately
> exposed
> at all.=C2=A0 I'm just still surprised that we're needing to reference
> that
> document as part of these changes.

I think the main question is whether an internal, graceful (userspace-
requested) reset is a reasonable use of WDIOF_EXTERN[12]. My feeling
no. I wonder whether defining a new flag (WDIOF_REBOOT?
WDIOF_GRACEFUL?) in the UAPI would be acceptable?

Andrew

