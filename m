Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ACAC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVRdbR32fbMwCjy/t/IfCUB0e7pTnQGXBNkJ9mb3Mzk=; b=wOUjxHN/O+pgv0KGf+CN/Jt13/
	I8QCVKJsngbSBVnvS0efnRJOnFrSSbKDfc5lq8B83pgQvSsxhp+dxAcVshXMcXtLyZ9f5gNaqE22m
	k21APMP/ziZ4rEo1L3nxx6BpPSM9W20ASRXqrnBbfuVS+t3CIWbihm6/Vwu9hb7g8BkXR7VHtTRf4
	QdqtWzvVae0/1IBSVWS5Rh83+3050vw1kUtvzqTh3jS6jUdZhWYCQUoWchAEA0a7u4Al1fD+RbqxN
	+owGhUZQP3eNWAKV4hOJwesJP4n6QYki8qR/p44T0znxmddnjSVrCO00qHVXa7vGXJ+tuHKLa5o0H
	HeB6Uj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1htQ-0000000EJQG-2OJN;
	Wed, 02 Sep 2026 10:08:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1htO-0000000EJPq-09dt;
	Wed, 02 Sep 2026 10:08:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91AF81A195D;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 632E46053C;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F24D811C792F3;
	Wed,  2 Sep 2026 12:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788343701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xVRdbR32fbMwCjy/t/IfCUB0e7pTnQGXBNkJ9mb3Mzk=;
	b=WqLK9HD/tgyVgNJO/gLA6/XJnsi1JsewfVdkRfA1VY8ScLST05n2zKL1CqkfWSdbztexbH
	uLSzalGh7SrZvP+G/PPqBGGeD30kE8PRc2/v6mVZC4XkuflwLNhIcoVuCvlq0AiKIxsPjY
	dmYCds75vhQRtTsk6dQaT0o7ek8UMXpi5JRow6FT3QswbJbMQ8mwUHGBFnrlzASuIIa1Y2
	DQLHWWIbHB3TsNSOEAkUwturdmZQ26/2UTvkOUNQ/YpYPLIDF5XFkjm/L1m3aUq4H2Gj9V
	PnWSWGYjBz6LuM5fO7xgrw9rmEq4QxG5wUBDZaJAFoxgYwucA8M/GIAdtimMYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 03/23] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <DKONYM8W4BAW.25PBIPPWCILG1@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 14:25:56 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-3-b637cf120d5c@bootlin.com>
	<DKONYM8W4BAW.25PBIPPWCILG1@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 12:08:14 +0200
Message-ID: <874ig87ypd.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_030830_378286_A5F87C0D 
X-CRM114-Status: GOOD (  31.03  )
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

Hello Michael,

>> There will probably be breakages on older chips. These cannot be
>> guessed because they are not properly listed in manufacturer
>> fixups (yet). If we want a cleanup/simplification, we will have to cope
>> with this risk.
>>
>> I hope the diff stats will motivate people to have a look and report
>> their testing.
>>
>> I will also eagerly monitor Sashiko's output which will probably be
>> very useful to catch niche weird cases where these changes might break.
>
>
> Honestly, I'm still not sold at the sr1 and sr2 split. But since
> spi-nor is know for it's code churn. I could just rework that later
> :)

:'-)

> Still I had some questions in the old thread:
> I don't get why there should be any endianness problems?
> Just the low level read and write would have to figure out how to
> read and write the status registers.

Yes, that's the point, with an array there is no endianness problem,
even low level helpers do not need to know memory ordering. Endianness
is *always* a pain, it is most of the time wrongly understood, I hate
endianness topics :)

[...]

>> +int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
>> +{
>> +	struct spi_nor_flash_parameter *params =3D nor->params;
>> +	int ret;
>> +
>> +	if (params->opcodes.read_sr2) {
>> +		ret =3D spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
>> +		if (ret)
>> +			return ret;
>> +	} else if (spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
>> +		   spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4) {
>> +		/* Make sure the QE bit is persistently kept */
>> +		*sr2 =3D params->qe_mask[1];
>
> Mh. So before there was at least a check if a quad_enable cb is set.
> Is this now implicit? because qe_mask[1] is zero if there is no
> quad_enable? That should at *least* get some comment.

You are right, this is missing the st_micron case. I will re-add the
check.

> I tried to actually get the original use case, but all I've found
> is Tudors commit 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit
> on lock()/unlock()"). There wasn't much of a discussion on the ML,
> and I couldn't find where Boris was suggesting it.
>
> So before we cannot get rid of it anymore, we should just handle it
> in the one caller which actually uses it: spi_nor_sr_{un,}lock().
> I've checked the current spi_nor_write_sr_and_check() and the only
> actual user is the swp.c. atmel.c is doing global write protection
> on/off, which IIRC only uses SR1.

Yes.

> So let's move that weird handling there. Then chances are, we can
> get rid of it as we know what flashes do locking because that is not
> discoverable at runtime. It's just tedious work to check all the
> datasheets. But as soon as we now put that into a more generic path,
> we can't do anything about it anymore.

I understand the concern, which is right. I just added a
"read_sr2_careful" helper for the swp.c purpose.

>> +	} else {
>> +		*sr2 =3D 0;
>
> I'd expect an -EINVAL or -EIO here.

There is an actual case that is possible where we do not want to use
quad mode on a BFPT_DWORD15_QER_SR2_BIT1_NO_RD chip. I believe we should
keep =3D 0 here.

Thanks,
Miqu=C3=A8l

