Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEIYnXmiuiCnXQORIAEomqFu99C3KeIPuJtJwkgOheQ=; b=UOHsP1qy2Of1G4bv/M0vGb8y/o
	vVc5Brxd+6FDkwoUemZOHd4ZFHnfDbrieCDpkTpch/OnwfGIU2L3m68oElB6Nie3jhN4vPHFDn7sY
	dpEiVz6GsUvZoINVL47hZT40eO4M8WOzQZ1DiaIdns1LGxZ8SC3s5PUQ8SnJfbuc2MRGqa/usGsKN
	iIgttZmSYX++arO8heMfE8B0mQA6xLP5ZPeJwn9FEn9orSZb+bzqolInnsJ342WGiqA+qh23mtMg1
	v4YUc6KUVD96rmD61ipv6CRK/8VQmLoP5ZCvBoGqr+Ua2UY1y8s7rPoi66xNpgmt+EY1h1sP4rVPh
	TiN1U70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGaO-0000000299t-1piJ;
	Tue, 04 Aug 2026 14:57:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGaK-0000000297r-1GbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:57:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C001E1A140A;
	Tue,  4 Aug 2026 14:57:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 904286029E;
	Tue,  4 Aug 2026 14:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4528011C32F40;
	Tue,  4 Aug 2026 16:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785855451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dEIYnXmiuiCnXQORIAEomqFu99C3KeIPuJtJwkgOheQ=;
	b=OXjBquElr/oxShyT6r7L/ScoSQSkIy3LCFBQnGmg5dFEskonA3N6s4Gd0wZVRlx8K36hDA
	RGsSezKszgtA+zOPv66FZ5blDKUqP2Ef7AbI6svggnbP1FZxcDTlzoGX+K7072luNbdxiG
	cR4vmHt2GSDsp4GLoFNyKSKCkkO+H2m6uMKOwZlwrjA+ODQYp+tL0j6YRQXzsrEmgG++pM
	Jb2EjF7mRSWUgTccKzcVp7t+ZKid7TcXzkgFSguAbudhsmqJfzjAUNwPr2jhoFbPTnH+ZS
	mo8YDTncuF/NTRgOh3yEXzaSgcVSHJ0PVJhde7ys95e0RTICPtdx+hKXDDniCA==
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
In-Reply-To: <DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org> (Michael Walle's message
	of "Tue, 07 Jul 2026 11:43:44 +0200")
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-rv-addition-v1-1-f3ae18502d5a@bootlin.com>
	<DJS8PQ5HZZG5.2YT956NCDX8MG@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 04 Aug 2026 16:57:26 +0200
Message-ID: <87mrv2exwp.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_075740_622425_201CF252 
X-CRM114-Status: GOOD (  82.16  )
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

On 07/07/2026 at 11:43:44 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> Hi Miquel,
>
> thanks for doing this (somewhat thankless) task. I briefly skimmed
> over this patch.. [Ok coming back here, it's quite a bigger
> feedback. And I'm sorry if it's sometime confusing, I was jumping
> back and forth].

Thanks a lot for doing that review, which I know is painful.

> On Fri May 29, 2026 at 6:05 PM CEST, Miquel Raynal wrote:
>> SPI NOR has a lot of history. Additions over additions, the subtleties
>> of the JESD216 specification, their implementations by the manufacturers
>> and the hardware mistakes have generated a gigantic maze, let's try to
>> understand what is really needed.
>>
>> The specification explains the QE (Quad Enable) bitfield as describing
>> where the bit to enable the Quad capability is, but also how to set
>> it.
>
> I think the standard just wrote down what all the different vendors
> were doing. So it didn't really start as "one" standard but just
> collected all the different variants from all the vendors. Also, it
> seems that the standard is only interested in how to enable the
> quad IO mode. Everything else is guesswork. But iff a given vendor
> stick to its implementation, chances are that the QER will
> correspond to how to read and write status registers. So for our
> guesswork, we can use a QER-to-"sr access" mapping as a baseline.
> We should map the QER enumeration to vendors to get a better
> understanding now and in the future.

It seems more complex than that, because indeed it all started with a
status of what were (more or less) doing the vendors. Unfortunately they
did not stick to that method, so it is not possible to identify "vendor
X =3D> QER Y". And it continues to evolve (as in patch 2). And TBH I don't
have the history, but if someone wants to sparkle the SFDP switch with
surgical comments, I agree it's interesting to keep a trace.

> Also, I haven't found a vendor which is using the 3Eh/3Fh opcodes?!

Good question, I have no idea either, but if I remove it I fear even
more pushback :)

>> Unfortunately, the specification is not precise about what opcodes
>> are supported exactly in all the cases. There is an introduction that
>> basically states:
>> - Opcode 0x05 reads SR1, and then SR2 if another byte is read
>
> Where is that? It only states that 05 reads sr1, no?

You are right, my bad. What a sniper :)

I will correct the commit log and the code.

>> - Opcode 0x35 allows to read SR2
>> - Opcode 0x01 writes SR1, and then SR2 if another byte is written
>
> Ack.
>
> But reading the individual QER methods below, I'm not sure, if that
> is really the baseline here.

This is what the introduction of the QER field states. Then, every field
slightly modifies that baseline, except 101 which IIRC is more or less
the nominal behaviour without subtlety.

> I mean 101b corresponds to exactly
> that, no?

In the spec, yes. In the implementation, no, since (I believe for wrong
reasons) SR1 cannot be written alone. So we force 2 bytes writes in this
case, I am not changing this.

>> Then the bitfield, among indicating the location of the QE bit, may
>> indicate:
>> - Reading SR1 and SR2 in one operation is not possible (loops over the
>>   content of SR1)
>> - Reading SR2 directly is possible
>> - Writing SR1 smashes SR2
>
> You mean writing just one byte with 01h, will set sr2 to zero. IOW,
> you'll have to always write two bytes if using 01h.

Yes. I will make it more clear in the next iteration.

> What we also don't know is how many status registers there actually
> are.

Very true, and solve with this approached btw. For now I don't need
it, but the RV chips feature a third status registers.

>> One problem with the current implementation, is that it only focuses on
>> the QE bit. A quad_enable function was created for each case, even
>> though in practice, the logic was always the same: read, modify, write,
>> read back and verify. One problem comes when other features need to play
>> with the status registers, like software block protection or OTP: you
>> never know how to properly handle the QE bit, nor where it is, nor how
>> to read/write the Status registers. This lead to
>> approximations/guessing (in swp.c, otp.c and obviously in legacy
>> controller drivers like atmel.c) but also to the implementation of a
>> gazillon of helpers for reading/writing/checking the status registers.
>
> Mh? why do we have to know the QE bit in other parts? We shall just
> read-modify-write the status registers, no?

I am sorry I'm not sure I get the question here let me attempt a full
answer.

No, rmw is not always the way to go, one must be more careful, since you
cannot read SR2 sometimes and cannot just write only SR1 without risking
to loose SR2 some other times.

However, I don't want that complexity to be handled by all the callers,
hence I am proposing high-level helpers for that.

>> In addition, I believe some design decisions had a negative impact over
>> the years.
>>
>> - All possible situations had to be flagged by the core. This is likely
>>   wrong, because we no longer know why we need specific quirks. It was
>>   ineherent to the state of the SPI NOR core before the great cleanup
>>   that had happened the past few years. I believe this creates confusion
>>   in the core today, and we should push this to vendor fixups
>>   instead. As an example, in 2023 Hsin-Yi was facing an issue because
>>   his chip was setting the wrong QER value, leading to RDCR being
>>   prevented, thus falling into a condition blindly setting a random QE
>>   bit (I strongy believe it is done like that for wrong reasons). His
>>   chip actually had RDCR support! The correct fix should have been to
>>   mark the capability in a device fixup instead of handling this in the
>>   core.
>>
>>   Link: https://lore.kernel.org/lkml/CAJMQK-hR0eaO0b4Vd0U8_KAndLyZapqdHj=
VLAoe42rWi9rdLkA@mail.gmail.com/
>
> You mean the "always set the QER bit"?
>
> I agree, this should be pushed into the vendor fixups. But what I
> really want to avoid is that we have to have a never ending list of
> IDs for these fixups. So there shall be a generic vendor fixup.

I guess we can have this kind of fixups, there is one in macronix.c and
soon another one in winbond.c. But at the moment I just cannot invent
them. I can only translate the existing ones and cry for the others.

> As a side node, I really don't like how the fixups are handled at
> the moment.  I've proposed that way back but it would be awesome to
> be able to just register a fixup with
>
> register_spi_nor_fixup(SNOR_ID(0xef, 0x40, 0x16), winbond_w25q32_fixup);
> register_spi_nor_fixup(SNOR_ID(0xef), winbond_default_properties);

Aaaaaah, that would be great. It is indeed a problem currently, since we
cannot "assign" a fixup to several chips easily, if these chips already
have other fixups. I found a neat way in the Winbond driver (the
is_w25qxxrv() helper) but if someone comes with such a series, I'd be
all for it.

If I get bothered too much with that I might also do it myself, but,
heh, one step at a time :-)

> Maybe you have some thoughts on that. I'm not sure we really need
> the distinction between manufacturer fixups and per device fixups.
>
> Now obviously, with our id reuse problem, that above isn't enough.
> I've proposed to have a match function back that - by default - only
> matches the id - but can be overwritten to match anything else. I
> have also thought about just doing a checksum over the SFDP and
> match that.

A checksum would be super painful to maintain, however I would
definitely go for a possible hook that says whether or not the fixup
applies (based on SFDP content, like the SFDP version or anything else
that could be checked). This would be a way to deduplicate the entries
when there is an ID reuse.

> Any thoughts on that?
>
> But I digress..

:')

>> - SFDP parsing is over cautious. I believe
>>   BFPT_DWORD15_QER_SR2_BIT1_NO_RD is abusive (nothing states that RDCR is
>>   not supported), and BFPT_DWORD15_QER_SR2_BIT1 is also out of
>>   specification when forcing 16-bit Status writes.
>
> Also, I don't think BFPT_DWORD15_QER_SR2_BIT1_BUGGY is a good name
> :)

Yes, maybe I can rename it now.

>> - SNOR_F_HAS_16BIT_SR is only imposing 16bit Status writes, whereas
>>   reads can still be 8-bit wides and even sometimes can only be 8-bit
>>   wide.
>>
>> - The usage of helpers verifying the writes was also spread for IMHO no
>>   really good reason. Why shouldn't we trust spi operations when it
>>   comes to Status Registers? We do not read back our page reads, so why
>>   status registers should be treated with so much care, if it's not
>>   because we are unsure of what is being done? My proposal includes a
>>   check when it comes to the QE bit (done once) but we don't need these
>>   checks otherwise. If the QE bit was written properly, there are high
>>   chances that the other register accesses will just be fine, no?
>
> One thing that comes to mind is hardware write protection. If
> there's nothing before that code which checks it, the verify might
> fail if the hardware write protection is enabled. So we should
> somehow check for that and drop the verify here.

But how do you think we should handle it? Will the QE bit writing
verification fail if HW WP is enabled?

>
>> Asde from my main quest, I also observed no good reason to ask the
>> read/write status register callers to use nor->bouncebuf while the
>> low-level helpers could do it themselves (we are talking about one or
>> two bytes being copied).
>
> Totally agree!
>
>> So after these observations, my proposal is the following:
>> - Create private low level helpers that just read or write a status
>>   register. They are flexible, we can give the opcode (which varies
>>   based on the SFDP QER field) and the length (1 or 2).
>> - Create public generic accessors which will be used to read/write sr1
>>   and/or sr2. This is where all the cleverness shall be. The helpers use
>>   the available opcodes for a given chip in order to fullfill the
>>   request.
>> - Provide a single generic ->quad_enable() hook which generically does
>>   all the steps mentioned above (read, modify, write, read back and
>>   verify).
>> - Create a list of opcodes for all 6 possible situations:
>>   {read, write} {sr1, sr2, sr1 and sr2}. These opcodes are
>>   filled/cleared based on the QER field. An opcode set to 0 indicates
>>   the absence of support (there is no 0x00 opcode in SPI NOR).
>
> How would we fill these fields for flashes without SFDP? I guess
> by vendor in the vendor modules.

Non SFPD chips are already using the "default" that the core implies, I
am not changing that (just translated it to the new formalism).

>> I tried my best to analyze the current behavior and to mimic it as much
>> as possible, but this is a risky cleanup. However, if we go for this, it
>> will be *much* easier in the future to handle all kind of chip
>> variations. We won't be limited to a couple of flags anymore, but rather
>> we'll be able to just disable a read or write capability using a single
>> line.
>
> I'd op for taking this early in the cycle for at least two cycles.
> I.e. just let it sit in next and don't include it in the next PR,
> but one after that.

I very much agree with this. Ideally at -rc1.

[...]

>> +/**
>> + * spi_nor_write_srs_ll() - Low-level Status Registers write.
>> + * @nor:	pointer to 'struct spi_nor'.
>> + * @opcode:	opcode for the status register write operation.
>> + * @srs:	pointer to status registers buffer to write.
>> + * @len:	number of status registers to write.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spi_nor_write_srs_ll(struct spi_nor *nor, u8 opcode,	const u=
8 *srs,
>> +				unsigned int len)
>> +{
>> +	int ret, i;
>> +
>> +	ret =3D spi_nor_write_enable(nor);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i =3D 0; i < len; i++)
>> +		nor->bouncebuf[i] =3D srs[i];
>> +
>> +	if (nor->spimem) {
>> +		struct spi_mem_op op =3D SPI_NOR_WRSR_OP(opcode,
>> +						       nor->bouncebuf, len);
>> +
>> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +
>> +		ret =3D spi_mem_exec_op(nor->spimem, &op);
>> +	} else {
>> +		ret =3D spi_nor_controller_ops_write_reg(nor, opcode,
>> +						       nor->bouncebuf, len);
>> +	}
>> +
>> +	if (ret) {
>> +		dev_dbg(nor->dev, "Error %d writing Status Registers\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return spi_nor_wait_till_ready(nor);
>> +}
>> +
>> +int spi_nor_read_srs(struct spi_nor *nor, u8 *sr1, u8 *sr2)
>
> nitpick, i think this is a weird name. But maybe it's just me.
>
> What if we'd just make the one status register as u32? I mean in the
> winbond datasheet it's called S7-S0 and S15-S8. That way we also
> don't need a two byte qe_mask. To optimize the standard usecase to
> poll the WIP bit, we could add a byte mask.
>
>> +{
>> +	struct spi_nor_flash_parameter *params =3D nor->params;
>> +	int ret;
>> +
>> +	if (params->read_srs_opcode &&
>> +	    ((sr1 && !params->read_sr1_opcode) || (sr2 && !params->read_sr2_op=
code))) {
>> +		u8 srs[2] =3D {};
>> +
>> +		ret =3D spi_nor_read_srs_ll(nor, params->read_srs_opcode, srs, 2);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (sr1)
>> +			*sr1 =3D srs[0];
>> +
>> +		if (sr2)
>> +			*sr2 =3D srs[1];
>> +
>> +		return 0;
>> +	}
>> +

[...]

>> @@ -3106,11 +2804,14 @@ static void spi_nor_init_default_params(struct s=
pi_nor *nor)
>>  	const struct flash_info *info =3D nor->info;
>>  	struct device_node *np =3D spi_nor_get_flash_node(nor);
>>=20=20
>> -	params->quad_enable =3D spi_nor_sr2_bit1_quad_enable;
>> -	params->otp.org =3D info->otp;
>> -
>> -	/* Default to 16-bit Write Status (01h) Command */
>> +	/* Default to 16-bit Read/Write Status commands */
>>  	nor->flags |=3D SNOR_F_HAS_16BIT_SR;
>> +	params->read_srs_opcode =3D SPINOR_OP_RDSR;
>> +	params->write_srs_opcode =3D SPINOR_OP_WRSR;
>> +	params->quad_enable =3D spi_nor_generic_quad_enable;
>> +	params->qe_mask[1] =3D BIT(1);
>
> Not sure this is a safe bet. I'd need to consult all datasheets of
> the different vendors. Not now..

This is not a bet, just a translation. Unless if I'm missing
something?

>> +
>> +	params->otp.org =3D info->otp;
>>=20=20
>>  	/* Set SPI NOR sizes. */
>>  	params->writesize =3D 1;
>> @@ -3258,8 +2959,11 @@ static int spi_nor_quad_enable(struct spi_nor *no=
r)
>>  		return 0;
>>=20=20
>>  	if (!(spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
>> -	      spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4))
>> +	      spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4)) {
>> +		nor->params->qe_mask[0] =3D 0;
>> +		nor->params->qe_mask[1] =3D 0;
>
> Why setting the mask to 0? The mask is still valid, but we just
> cannot use it. But it could still be a useful information, i.e. in
> debugfs.

I see, let me find another way.

>>  		return 0;
>> +	}
>>=20=20
>>  	return nor->params->quad_enable(nor);
>>  }

[...]

>> @@ -130,7 +112,6 @@ enum spi_nor_option_flags {
>>  	SNOR_F_HAS_4BAIT	=3D BIT(4),
>>  	SNOR_F_HAS_LOCK		=3D BIT(5),
>>  	SNOR_F_HAS_16BIT_SR	=3D BIT(6),
>> -	SNOR_F_NO_READ_CR	=3D BIT(7),
>>  	SNOR_F_HAS_SR_TB_BIT6	=3D BIT(8),
>>  	SNOR_F_HAS_4BIT_BP      =3D BIT(9),
>>  	SNOR_F_HAS_SR_BP3_BIT6  =3D BIT(10),
>> @@ -375,6 +356,13 @@ struct spi_nor_otp {
>>   * @otp:		SPI NOR OTP info.
>>   * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
>>   * @quad_enable:	enables SPI NOR quad mode.
>> + * @qe_mask:		two bytes mask used to set/clear the QE bit
>
> Two bytes? I assume that's one for each status register. That's not
> really clear. But also see above, maybe make it u32.

Yes, why not. So we are safe until they add a fifth SR :)

>> + * @read_srs_opcode:	opcode used to read SR1 and SR2 in one operation
>> + * @read_sr1_opcode:	opcode used to read SR1 alone
>> + * @read_sr2_opcode:	opcode used to read SR2 alone
>> + * @write_srs_opcode:	opcode used to write SR1 and SR2 in one operation
>> + * @write_sr1_opcode:	opcode used to write SR1 alone
>> + * @write_sr2_opcode:	opcode used to write SR2 alone
>>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>>   * @ready:		(optional) flashes might use a different mechanism
>>   *			than reading the status register to indicate they
>> @@ -405,6 +393,13 @@ struct spi_nor_flash_parameter {
>>=20=20
>>  	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
>>  	int (*quad_enable)(struct spi_nor *nor);
>> +	u8				qe_mask[2];
>> +	u8				read_srs_opcode;
>> +	u8				read_sr1_opcode;
>> +	u8				read_sr2_opcode;
>> +	u8				write_srs_opcode;
>> +	u8				write_sr1_opcode;
>> +	u8				write_sr2_opcode;
>
> Can we move all the opcodes into one place? There is already a
> die_erase_opcode. Though it might just be a good idea now to group
> them into a subnode.
>
> spi_nor_flash_opcodes {
> 	u8 die_erase;
> 	u8 rdsr;
> 	u8 rdsr1;
> 	u8 rdsr2;
> 	u8 wrsr;
> 	u8 wrsr1;
> 	u8 wrsr2;
> };

Definitely a good idea.

>
> Also I'd make it a callback, so a it can be overwritten if there's
> some weird flash.

Why a callback? We just need to amend that table. That's exactly what I
propose in winbond.c, it just works and is much more readable.

> int (*read_sr)(struct spi_nor *nor, u32 *sr, u8 bm)
> int (*write_sr)(struct spi_nor *nor, u32 sr, u8 bm)
>
> int spi_nor_generic_read_sr(struct spi_nor *nor, u32 *sr,
>                             u8 byte_mask)
> {
> 	spi_nor_flash_parameter *params =3D nor->params;
>
> 	if (params->flags & SNOR_F_SUPPORTS_SR_16BIT_READ)
> 		...
> }
>
> int spi_nor_generic_write_sr(struct spi_nor *nor, u32 *sr,
>                              u8 byte_mask)
> {
> 	if (params->flags & SNOR_F_HAS_16BIT_SR)
> 		...
> }

[...]

>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -561,10 +561,21 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  	val >>=3D BFPT_DWORD11_PAGE_SIZE_SHIFT;
>>  	params->page_size =3D 1U << val;
>>=20=20
>> +	/*
>> +	 * The standard declares various read and write status methods, some of
>> +	 * them will be overloaded based on the QER field.
>> +	 */
>> +	params->read_srs_opcode =3D SPINOR_OP_RDSR;
>
> Not sure, that's a sane default. I think it was always 05/35 for
> reading.

That is right, I will amend and follow your suggestion which seems safer.

> Some newer flashes might have mapped the sr2 to the second
> byte for the 05 opcode.
>
>> +	params->read_sr1_opcode =3D SPINOR_OP_RDSR;
>> +	params->read_sr2_opcode =3D SPINOR_OP_RDCR;
>> +	params->write_srs_opcode =3D SPINOR_OP_WRSR;
>> +	params->write_sr1_opcode =3D SPINOR_OP_WRSR;
>> +

Thanks! I will come up with an update soon.

Miqu=C3=A8l

