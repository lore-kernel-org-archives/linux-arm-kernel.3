Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD271C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvM3MTmlrFxN3QrG/GnOK9O/WjcLd399D+a1DSfnP44=; b=WD6hq9PGZz2RoToqiq5n5BYaav
	UVpQ5K37dojfMJu5u7dVgTj4lWq5mbxL6P3gyYMMJpbDYJZYiIx2OPV5tBPoKY3AgOMaRnfA37VK4
	kW1VNhWF7Rr4NJxi8Mvy+f0/y2Uiv3EGG171rMTvmrfUC8EntMZCEnKKPppgs3clVRLjGeRVMhZdZ
	WepIA3scKxwuvcVw0I1otQHhTr58paGAQHAt89jSO2xcWH+Womj6Znekdtcu+lLiZtsRzCBzCRezD
	GweVHUYqfGk9yT59Ac0kZqkzKENoGVZNg9QJBLJlWM2FZIL+ATO2EQkgdcP3cb6KigfvsNyat+Mu1
	ZC5pqlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQds-0000000BxBI-2arp;
	Mon, 10 Aug 2026 14:06:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQdp-0000000BxAb-2vf4;
	Mon, 10 Aug 2026 14:06:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 332781A153C;
	Mon, 10 Aug 2026 14:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04E596033B;
	Mon, 10 Aug 2026 14:06:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF18F11C4A82D;
	Mon, 10 Aug 2026 16:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786370768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CvM3MTmlrFxN3QrG/GnOK9O/WjcLd399D+a1DSfnP44=;
	b=sOj3nodO6jx41/2DNx2k4PciPwaiWzQV9MwLm1ov+xDgDV1DNDjN66VbS6IReNs6nrXycZ
	hgj71e3rCeJTMAaaIoCHTgjMYH+Jt++u/eWRWlswU2SlpnylYQ3IGJagrRGLpmsHJLBphv
	VlyMrkiwL9vuX001v2/SCfGZ71zxLsqD09o++95HNiK3bZc2UGhkgoRLsELcX17ATxr3DX
	uFQwVc3nMa3oLx3KbhFeIXhHQMLlGu5rEgS9yqJ/01HiZ2TkFZtybkqsZX/2NT9FXI2jYZ
	DO1pFXFkiUI3lH0XSyMhxdWBvx4JX9jAOa2latSKIuF2l3IYqy95rUAHF2yeRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Steam Lin" <STLin2@winbond.com>,  "Hsin-Yi
 Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] mtd: spi-nor: Refactor Read Status/Write Status
 support
In-Reply-To: <DKL2WROHNLXJ.3239EBUTVXRQL@kernel.org> (Michael Walle's message
	of "Mon, 10 Aug 2026 09:18:07 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
	<87se4rem0l.fsf@bootlin.com> <DKL2WROHNLXJ.3239EBUTVXRQL@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 10 Aug 2026 16:05:59 +0200
Message-ID: <875x1iqddk.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070613_878247_0F35FBDC 
X-CRM114-Status: GOOD (  23.25  )
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

On 10/08/2026 at 09:18:07 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Thu Aug 6, 2026 at 9:38 AM CEST, Miquel Raynal wrote:
>> Hello Michael,
>>
>>>> One thing that comes to mind is hardware write protection. If
>>>> there's nothing before that code which checks it, the verify might
>>>> fail if the hardware write protection is enabled. So we should
>>>> somehow check for that and drop the verify here.
>>>
>>> But how do you think we should handle it? Will the QE bit writing
>>> verification fail if HW WP is enabled?
>
> It should, because you cannot alter the SR.
>
>> Looking into this further: we shall return an error if the QE bit is not
>> set. It just tells the caller that quad mode cannot be used. Then up to
>> the caller to either hard fail or just degrade into single mode (maybe
>> because of a strapped WP). What we should do is to propose a DT property
>> to flag when WP is strapped in hardware, this would make the content of
>> the status registers immutable and we would just skip the entire write
>> operation in the first place, instead of deliberately trying and get a
>> 100% failure rate. Nevertheless, the changes introduced here are kind of
>> orthogonal and do not alter the current behaviour; we shall however
>> listen if people start complaining about this and perhaps implement the
>> solution proposed above.
>
> There is already a property in the DT, where you almost certainly
> know that quad mode is impossible. Iff there are four rx/tx lines
> (spi-{rx,tx}-bus-width). I haven't seen a flash (even in larger
> packages) where there is a dedicated WP# pin.
>
> What do you mean by a dt property? If (1) the flash is using the WP#
> pin? Or (2) if it is using the WP# pin and it's tied to low?
>
> For (1) you have the QE bit, if it's set, WP is turned off and vice
> versa.
>
> For (2), that doesn't make sense, because that pin could be tied
> to some kind of logic which can change during runtime.
>
> FWIW, I don't care too much, you've asked why there is a
> verification step, I've just answered :)

Thank you :) Anyway, I've reinstated these checks in my last version.

If you look at it, don't focus on the commit about the names, I need to
fix that up again by adding some kind of "hide" flag for the RV chips,
instead of dropping the names (the rest won't change much).

Thanks,
Miqu=C3=A8l


