Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E388CC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxwcF+GEHxUG8bL+ir1yRXCJzX7aC3C+dEO4fpdt0sE=; b=HDSyxFrqyU3ak7uM0gvgdTPXy0
	cVKLTi6Q9d0mP83Lu36HgkIHkYLq58XrwpP0gSpQc9UqZRF1cUjorkhKFo4FV6Lo9zc3aY1wb1C7u
	IU0u03UcpA/7vapUJsKBO9sTBYUVE2A/pGpWaSVdOHXwtEIFZREHRzHoPhJANaQQsPMwFEF5NlT8l
	9aNObsVigaF1RzjOOqQe0wDtoSOE+1O+KeAL56rkyqBBHoF47P0lJuH49DsWcBBDKOjW99+ZX7SKp
	17IyxajcHw9aKnEKUmlcF2/3JMjD9sjIEqLR33N7J1/eli7E8Tv7ZmUcKQW2fXrCum30INKobOACl
	xMUhnQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdCI-00000004OCJ-0liP;
	Thu, 27 Aug 2026 16:43:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdCC-00000004O9d-2DPP;
	Thu, 27 Aug 2026 16:43:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98D204E413E1;
	Thu, 27 Aug 2026 16:43:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F6D3604ED;
	Thu, 27 Aug 2026 16:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C11511C780CB;
	Thu, 27 Aug 2026 18:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787848990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XxwcF+GEHxUG8bL+ir1yRXCJzX7aC3C+dEO4fpdt0sE=;
	b=CtnZ5jljui7LdupirTQTWqUV0oYljGBVXGYVu4CKz7D7RrOdul50N1Vby2mU6FlWVMh7NP
	pKStH9KHhko65mtJp6B9E3QC7MJSP8AhJlQ6HfGvHSwKQc3izf4qS4FUznX6lb7ORcjKDf
	ADmbhhOI+hd2ATph44wfpEQu0d6amAUwbAW9VrA29F0/CnzYFkLcFfdeKBWIgCLBykfdC2
	I1RQ9YcOVpEN4VABV9DjsBdrautKJkfwi3iFAk6gh29qq+nz5nCbSs/0utCAWw5QQlYJbJ
	qKOx+G6BAh58Au/A9/qRftOK+XnMerXXvl6GkxrtsbkO2MrMa8tb4WjmgN0gdw==
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
Subject: Re: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup
 table with match function
In-Reply-To: <DKOKFU8AD2U6.151AX0VOBX67H@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 11:40:21 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
	<DKOKFU8AD2U6.151AX0VOBX67H@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 27 Aug 2026 18:43:04 +0200
Message-ID: <87cxv3cy5j.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094320_887531_325B3A86 
X-CRM114-Status: GOOD (  46.23  )
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

Hi Michael,

I took me a lot of time to go through all your requests, in the end I
will not implement most of your feedback because either I do not
understand what is the gain, or because the result is not better at all
from my point of view. I try to explain that in my feedback
below. Nevertheless, I truly appreciate the deep review you made. I
think I mostly agree with the comments in the other messages.

On 14/08/2026 at 11:40:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
>> Manufacturer ID tables increase and fixup() hooks proliferate. Having
>> one possible structure per chip was fine until the fixups started being
>> more and more common and needed, to some extend due to ID reuses. Mixing
>> fixups and chips becomes hard and requires extra helpers to sort which
>> ones are needed for a given chip, which every time this happens requires
>> a lot of rework.
>
> Thanks, this patch looks really promising!
>
>> Replace the two-level fixup association (a manufacturer wide hook and a
>> per flash_info hook) with a per-manufacturer list of fixups that can be
>> looked up by flash ID and/or match function.
>>
>> The match logic works as follows:
>> - If there is an ID, it must match
>> - If there is a match function, it must match (cumulative)
>> - If there is no identifier (no ID nor any match function), it's a
>>   catch-all entry typically used for flagging manufacturer fixups.
>
> This mimics, how it's currently handled. But since the fixups are
> now treated as a separate list, i.e. it has it's own SNOR_ID, we
> shall move away from this manufacturer thingy too.

Why shall we? See below, I don't get the point. I drafted something it
took me two full days to work on that, to eventually realize I did not
see *any* benefit.

> IMHO that really
> clutters the code.

Clearly an opinion I do not share. Maybe I am missing something.

> As a fun fact, spi_nor_match_id() will have the
> unexpected side effect of setting nor->manufacturer.

Not sure I get why this is unexpected?

> So here's how I'd do it:=20
> (1) remove spi_nor_manufacturer.
> (2) have a list of initcalls in the core to call into the individual
>     vendor modules (that could later be replaced by something more
>     sophiticated)
> (3) that initcall will then call spi_nor_register_parts(const struct
>     flash_info *parts, int nparts)
> (4) (optionally) calls spi_nor_register_fixups(const struct
>     spi_nor_fixup *fixups, int nfixups)

I've been trying hard to follow your approach, but really, I don't get
the point. Initcalls are not possible here, or it would prevent
CONIFG_MTD_SPI_NOR=3Dm so I went for an alternative approach with an init
registration which I believe matches your expectations. This is not
an actual problem.

But registering parts and fixups independently, maybe, but again, why?
What is the intended benefit? We now need to go through 96 (spi-nor
wide) fixups. But what do we get in exchange? From my point of view:
extra churn and boilerplate, nothing particularly better than before. I
must admit, I do not understand your aversion for the manufacturer
structure. So while I like the idea of a flash-info independent fixup
list (which I implemented in v3), I do not understand the need for this
extra step.

Since I do not get the point of this request, I prefer to not implement
it, because I will anyway do it the wrong way. If someone wants to make
a proposal, I will have a look, but at this point I need to back
off. There are already ~70 patches pending which I hope will be applied
ASAP after -rc1 gets tagged and we agree on the remaining points (there
are other comments from you and Takahiro which I need to address).

> Also both could be a macro, then we can get rid of the size
> argument.
>
> The current manufacturer fixups gets registered with a
> "SNOR_ID(vendor)".=20
>
> That leaves us with the manufacturer name, which should be set by
> that vendor catch all fixup.
>
> Btw, I'm fine with deprecating the name as well as the manufacturer
> sysfs entry, but it shouldn't be as in "it just goes away".

I have no strong wish to get rid of those, especially the manufacturer
name which is not particularly problematic today.

[...]

>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>> +		if (fixups[i].fixups->post_bfpt &&
>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>> +			if (ret)
>> +				return ret;
>> +		}
>
> This is repeated several times, can we have something like
>
> spi_nor_apply_fixups(struct spi_nor *nor, int (*fixup_fn), void *fixup_ar=
gs);
>
> int spi_nor_post_bfpt_fixup(struct spi_nor *nor, const struct spi_nor_fix=
up *fixup, void *_args)
> {
> 	struct post_bfpt_fixup_args *args =3D _args;
>
> 	if (!fixup->post_bfpt)
> 		return 0;
>
> 	return fixup->post_bfpt(nor, args->bfpt_header, args->bfpt);
> }
>
> which then will be called with
> spi_nor_apply_fixups(nor, spi_nor_post_bfpt_fixup, args);

I drafted it, but arguments are different, argument numbers are
different, return values are different, we need stubs for each
fixup... Nothing is identical, we just save a couple of simple checks
and a for loop. On the other hand, code just grows, complexity is
higher, readability is definitely lower. Sorry, but again, I do not see
the gain with this attempt, it just darkens what the core does. It would
definitely work with another -more advanced- language than C, though.

>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>> +		if (fixups[i].fixups->post_bfpt &&
>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>> +			if (ret)
>> +				return ret;
>>  	}
>>=20=20

[...]

>> --- a/drivers/mtd/spi-nor/gigadevice.c
>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>> @@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>>  		.name =3D "gd25q256",
>>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
>> -		.fixups =3D &gd25q256_fixups,
>>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>
> The fixup_flags should also go into the fixups list.

Yes, we can use a similar logic here. Actually if at some point we want
to get rid of those flags, we could transform the flags into proper
fixup functions, but I'm not going to do that now.

[...]

>> +/* PM25LV parts have no JEDEC ID and are likely matched by name */
>> +static bool issi_pm25lv_match(const struct spi_nor *nor)
>> +{
>> +	const char *name =3D nor->info ? nor->info->name : NULL;
>> +
>> +	return name && !strncmp(name, "pm25lv", 6);
>
> Won't just strcmp("pm25lv", name) do it? Both arguments are
> guaranteed to be NUL terminated. The above would also match
> "pm25lvextrabytes", no, and we get rid of that redundant size
> argument.

No it won't, because that would no longer be a match, you would compare
pm25lv against pm25lv010 or pm25lv512 -> no match if you don't limit to
the first 6 bytes. Since names are part of the sysfs ABI, we cannot just
modify the names for that. We also need two different entries (two
different sizes) since we do not even match with an ID.

[...]

>> @@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_no=
r *nor,
>>  	return 0;
>>  }
>>=20=20
>> +/*
>> + * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
>> + * In order to not mix the fixups, further filter out using the part na=
me.
>
> How would that work? The part name is also set by the duplicated ID,
> so the first one wins, no?

- First part (mt25qu01g) is checked
  -> ID match
- There is a match function where we compare the name with n25q00a
  -> no match, not applying the fixup

- Second part (n25q00a) is checked
  -> ID match
- There is a match function where we compare the name with n25q00a
  -> name match

The fixup is only applied for n25q00a.

For the other chip we can just give more ID bytes for the match.

So I believe there is no problem here?

Thanks!
Miqu=C3=A8l

