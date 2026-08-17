Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5281C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3llulX3328L3Ek3yxprc6vIvWXNUGeLhpBQoQq6NfSI=; b=3JEQaMYrnFkniUGOmW4CzJARCN
	HIvawc3mm/jzs7ZXhttjNvUpQWV4j+6AmI5Pfi4xBXB4sAeQvefdeOCY441/SP8Q+hRfICoQDSpin
	VVXJT3RDKPvnTo8Zb8W27bZrYuiIFAn90ksuYCX+ijhGKuWYkN5QQX4wU5nzcwAmFOMX+Yhl/FKw2
	nY40ZmrDJK2cFiUQtihyKKxA7m/cRLbzN96buIZM8vspUbV4hBZ6x/iqOSj4YQGB3MbZxupTQ3lDg
	H90h4GcbOksY1PPuoOjaPxKMGyHrfsI0TtMyxAFdo8TCUNS2Y3t9P0uP/X4YWTsLp5+2NwxPh4qq9
	+s11QGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0gK-00000006Yse-33kI;
	Mon, 17 Aug 2026 16:59:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0gK-00000006YsX-0k2b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:59:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F09060A58;
	Mon, 17 Aug 2026 16:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5491F000E9;
	Mon, 17 Aug 2026 16:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786985967;
	bh=3llulX3328L3Ek3yxprc6vIvWXNUGeLhpBQoQq6NfSI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=mnBw6EIWGNULVx0W8kvE/NLBA5bt3cfsKbMg12I2bZiOg0VYkksZvlnG53qFDLK/8
	 rOlB9Oy/Lf22hL6rGJeu34lRvCh4Iyi0OP9c7PSMDgL7Tlqk1i+MM+5cyxe+JFwuIa
	 8gdO1hQueYZ8IveAlXulQOSIIkJ09hHJRD8EfSbbFKknUkWGNyyOqOYSVJcx3QT+gT
	 4r6V2cp6ugQANfoXV5CqvtPuqzaLRqvHupw0rBfjoHcxdv+3hGtnJLTO4hL3c6WA/H
	 pQqhxMBd8h1vnaSwDEzwfBz4Hq1Nv479ulAyPlxO8jOY2YswIvXIGzhutpNseh7A4M
	 gtlvYZ0B6a7Ew==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id F2635198005A;
	Mon, 17 Aug 2026 12:59:24 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Mon, 17 Aug 2026 12:59:24 -0400
X-ME-Sender: <xms:6j2DajBLqUlsCMxiWpJVM57j4vDzsqoGdXqibdORWyEbL__RQA2yxw>
    <xme:6j2DakX3cEIQiTkFEKIs2Hsw0opViKFDAnoFQis8ch5YRH--a5IadIO8fp9wXHiU8
    3S0J5J-hhzVzp64TbCIgVNK8RQ8SFHf0q9W20G32plG7GZ0UT0IWXGR>
X-ME-Proxy-Cause: dmFkZTGWu6WDxCMnrRb1S3oKmk5iStRE3JaOXC54KSBpqPeipijwwR2HrCmeM/GVeLZWSt
    s/eB1469nVCVVflUTjbd+qswpbrqXXrhXA4ApuQS8LI2sKJzb8PHg/IImzC7JB/jP1Sytq
    cReM4bk+nka73PAkzlFdd6UuaZaoz8JkNOhc7QqtpOuETM92JuVHOyJ7x7rTLP/wjCqjqY
    9NyiJTlNHR0yJSfrSmL0vKxlP8oqqrzRKDlcVeYleOsVAfmnEgS3XmwJLrM/Z3kHOIJUpM
    5+zA3bJtqp0uSdxO1KgwkeojQQEBxJnqtg2GqfHtQc+U7qpYO4ejNX5oomUoRv1XEqugFP
    Lv0luHj88B6zo+rCCZvzIOUniSLQRL3ra1LLYQ/i/1RmW/dLvPc1wfhSo2nh0lnJecyffB
    pgODSi+jzRs4nYeUbEHmgmnXH3b/fufoFdl/hcoQ6CcoRwoSDJwhXJwybouSvxVxA3zOrv
    fyF2YwAYT3YQSyopA34B5JfBXsFMgx0M2jDPf209xPrH097NrNVsl0Ns34RTUI1yp4hiqH
    n0fl2t0KRiyPRwnn7Vkyb44OePTmrmPN5SGUs18qYiojQAWmgDa+DDwvYAi4FV6ylkQRXf
    c5bm2Eh0GkegawCm9g/SXOuBjEvPzfeF6xIElleYhtChO24izz/HiASSKI0Q
X-ME-Proxy: <xmx:7D2Daj5q29beGjnbsbtA93utKnpj9jmj2wsgLPILJ8Cyuy4WuNVhCA>
    <xmx:7D2Daplet-CiwwBZf6VZIRWLwcDLoDccMe7H2E08akQqO74c4x7fpQ>
    <xmx:7D2DaoqR0ZcLFyx5S2nxSP0eUbVjvcFiyk6hgmnWPYLugRXHbo7NDg>
    <xmx:7D2DaotTgha0tXeupLxmjBoNAs4--vN6aS7WieJPHzMFJ5mJTYSlSQ>
    <xmx:7D2DatHPiq5B-tvkrlgYrlZ6-RrGWxOM-WUeyM0ssjBfIP7Vu-5t0RKY>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C4C4EF80071; Mon, 17 Aug 2026 12:59:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 19:59:02 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Leif Lindholm" <leif.lindholm@oss.qualcomm.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 loongarch@lists.linux.dev
Message-Id: <c3cd6952-87fd-442b-8d54-13c814b8d5f2@app.fastmail.com>
In-Reply-To: <aoMV3TX0hgTsj3_m@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org> <an8xTBiCy_PEuwZi@leviathan>
 <a0d10b63-bf9a-4ad7-a9d8-ab748a9c0c2c@app.fastmail.com>
 <aoLR9BPGt4Kzbr3y@leviathan>
 <92baff04-d30b-4174-b5f5-87b24e6a1cc0@app.fastmail.com>
 <aoMV3TX0hgTsj3_m@leviathan>
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core kernel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Mon, 17 Aug 2026, at 17:08, Leif Lindholm wrote:
> On Mon, Aug 17, 2026 at 14:00:16 +0300, Ard Biesheuvel wrote:
>> >> > Is it time to update the boot ABI to say x0 will hold the physical
>> >> > address of "device tree blob (dtb) or EFI System Table in system RAM"?
>> >> > They can be distinguished by 0xd00dfeed / "IBI SYST".
>> >> 
>> >> Let's avoid 'boot ABI' here, given that we are talking about an internal
>> >> interface between the EFI stub and the kernel proper.
>> >
>> > It's an internal business in the topic under discussion, but if we
>> > were to change it, that would mean updating booting.rst, which I
>> > consider an ABI.
>> >
>> 
>> But not an external ABI. It documents specifically how the EFI stub
>> interfaces with the kernel proper. This might change at any point,
>> without any obligation whatsoever to remain compatible with the
>> previous method.
>
> So you're saying if the kernel proper decides to use x1 for something
> else, we'll move to x2?
>
> I agree that in the context of how the stub calls the kernel proper,
> this is not ABI, but x1 is one of the registers currently marked as
> "reserved for future use" in booting.rst. So it feels weird for me to
> allocate one of those registers for this internal use then not mention
> it.
>

Whether we mention it or not is irrelevant: the only thing that matters
is that this allocation is not something that OS loaders other than the
EFI stub are able to rely upon, given that EFI boot on arm64 requires
booting via the stub (except for Xen dom0).

> In that case, couldn't we instead pick a register outside of the
> reserved ones?
>

It has to be a reserved one, given that the state of other registers is
unspecified at boot. Otherwise, we'd have to reason about whether a non-zero
value is accidental, or represents a physical address that we can map and
dereference, which is needed even to check the system table's magin

>> ...
>> >> > Minor bikeshedding below.
>> >> >
>> >> >> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
>> >> >>  			pr_err("Can't find property '%s' in DT!\n", pname);
>> >> >>  			return 0;
>> >> >>  		}
>> >> >> -		if (dt_params[i].paravirt)
>> >> >> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
>> >> >>  			set_bit(EFI_PARAVIRT, &efi.flags);
>> >> >> +		} else {
>> >> >
>> >> > This condition branch doesn't in fact have anything to do with the fdt.
>> >> > Should it still live in fdtparams.c?
>> >> >
>> >> 
>> >> I don't follow. The EFI_PARAVIRT flag is set based on whether we are 
>> >> using the generic or the Xen-specific set of DT properties. What would
>> >> be a better place to decide this?
>> >
>> > Apologies, I may have commented confusingly - my comment was about the
>> > else branch:
>> >
>> > +
>> > +                       bm = early_memremap_ro(memmap, sizeof(*bm));
>> > +                       if (!bm) {
>> > +                               pr_err("Cannot remap EFI boot memory map\n");
>> > +                               return 0;
>> > +                       }
>> > +
>> > +                       mm->phys_map            = memmap + sizeof(*bm);
>> > +                       mm->size                = bm->map_size;
>> > +                       mm->desc_size           = bm->desc_size;
>> > +                       mm->desc_version        = bm->desc_ver;
>> > +
>> > +                       early_memunmap(bm, sizeof(*bm));
>> >
>> > So to restate - this function is called from efi_init():
>> > ---
>> >         /* Grab UEFI information placed in FDT by stub */
>> >         efi_system_table = efi_get_fdt_params(&data);
>> >         if (!efi_system_table)
>> >                 return;
>> > ---
>> >
>> > Before this set, this function called get_fdt_params() indeed gets
>> > "params" from a device tree. After this set, this function gets params
>> > from a device tree in some instances, and not in others.
>> > Which feels suboptimal.
>> >
>> > We could rename the function, but then there's still DT-unrelated
>> > code held in fdtparams.c.
>> >
>> > If we go down the route of passing the system table in x1 on boot,
>> > then I guess the effect of assigning efi_system_table will already be
>> > broken out. But should we then split the mm struct initialisation into
>> > separate DT and config table helper functions?
>> >
>> 
>> Not disagreeing but I think it is fine to leave it as I suggested at this
>> point.
>> 
>> Some additional work is needed to get rid of linux,uefi-boot-memmap
>> entirely, and until that happens, passing the EFI system table via
>> X1 and linux,uefi-boot-memmap via DT is not a huge improvement.
>> 
>> linux,uefi-boot-memmap is needed when SetVirtualAddressMap() is called
>> [with a non-1:1 mapping], as the EFI system table contains a remapped
>> address of the config table array in that case.
>
> Of course, the devil on my shoulder suggests the stub could always
> add an address fixup handler for the config table too...
>

What is an address fixup handler? We cannot change this value back,
as that might break the runtime services.

