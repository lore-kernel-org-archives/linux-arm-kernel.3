Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C355FC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QHlmUCfRMDCYm4XCbQfPD+NoA9p8cr7Dg0SwC6Cnx0=; b=E9W+8PYOX9FKZgbsR5mY4R25c/
	WzGQlZ/ZA+tBooeKIGO2K2DMVeLmWPE01skB3l8J7mqnjSrsUYwZCFbTSRk9+l39qOQchHxuAQ7IM
	cLYs3ktaYTOd62TNj1jLA3BXdo0Ni2p6P74VxW0gA7buJREq5UvaYp1Zv/Pva7RIUYdX3Z7gO4l40
	S3oM7y2BU6bdLH3k53uyFqha4fNgwGUQQjhPpy1MaLUTnQNgLb9Ba+nX8S3Foni4kcl0zBGKgru5M
	mhRrPfx1qsNxZ2F4t95bbntFvwNxMxS73GQS9HOvrEBzS47/CaGX3VAdr2nuCodsBxgg+ILYiSTiO
	Twxt3/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcF7-000000042d7-1Ycf;
	Wed, 05 Aug 2026 14:05:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcF4-000000042cT-2Lak;
	Wed, 05 Aug 2026 14:05:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C09AE1A143D;
	Wed,  5 Aug 2026 14:05:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 933BF602AB;
	Wed,  5 Aug 2026 14:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F3A711C34B9D;
	Wed,  5 Aug 2026 16:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785938699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8QHlmUCfRMDCYm4XCbQfPD+NoA9p8cr7Dg0SwC6Cnx0=;
	b=XGJPsma+bnubqu0Y6npEobey93rSQjtfyKimTrfqnFkKWCI2D55QBPmGtJlUEIf7u79HA3
	wXEsV9K45d5Uqe5XaUZHhHHNz1icvH6uAqIRawZ22GeMVzoYNLvhHIwmrQzy7AN3Ewmjex
	24WPVMllDLyiQs93uqmL+okucUPonNeWIaNSusxLbf5hwcKeVjO1Qd24zzUyzVwbu0r96l
	AS5FOYEOmR/kEGmCqXy5ZiSar8yxCtv75Qr8ZJDHbePj2MRZyttApLe/mzveURS7plHeb3
	YsCDBAqds8pkCOAyO7J7a9lIvORf0x1UZtwfeJl+oEF5B+b97QDpGK5eskUHJQ==
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
In-Reply-To: <87mrv2exwp.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 04
	Aug 2026 16:57:26 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> <87mrv2exwp.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 05 Aug 2026 16:04:52 +0200
Message-ID: <87y0ekek8r.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_070510_832406_8C79F9F0 
X-CRM114-Status: GOOD (  10.04  )
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

>>> +int spi_nor_read_srs(struct spi_nor *nor, u8 *sr1, u8 *sr2)
>>
>> nitpick, i think this is a weird name. But maybe it's just me.
>>
>> What if we'd just make the one status register as u32? I mean in the
>> winbond datasheet it's called S7-S0 and S15-S8. That way we also
>> don't need a two byte qe_mask. To optimize the standard usecase to
>> poll the WIP bit, we could add a byte mask.

I experimented a bit the u32 status register, I don't think it is a good
idea.

My target of improving the readability is completely defeated by the
fact that:
- all the callers need to add extra maths to explain what SR
  they want
- endianness shall be handled, people always get it wrong (including
  me), so why bother if an array just makes the whole thing simpler?
- 16-bit accesses get more convoluted, we need extra
  get_/put_unaligned_le32() calls and pack/unpack bytes in the hot path
- 8-bit accesses imply an extensive use of FIELD_GET(GENMASK(),) macros,
  which make the whole fonction totally non obvious anymore.

Whereas, a simple:

        if (sr2)
                *sr2 =3D foo;

is self explanatory. I also do not really get the wish for a QE mask
instead of a two bytes array.

So I will rename the "srs" naming that you dislike, I will group the
opcodes in a big structure, change the baseline default to match your
suggestion and follow-up with the other minor comments, but I believe
I'm going to avoid the u32 switch.

Thanks,
Miqu=C3=A8l

