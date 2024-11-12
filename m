Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F2D42BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGjpopU//5Z3ijsaSdLB1L4ysYnNj5d6t1WIT5/TMSI=; b=nARNdVJ2JQvQBJZ/vHq1kaJz2Q
	rD+/f3f2UuO/xfJNTr0sPmbltyZ7okWgzfmvaFZ5Kv7I8XNuY5p31scPseSSL/tYwBW+HovYknOq0
	tI6bsJPlZGVmWXO1HiQtC4hDrnmcwGiI0z2UsBfZ80hrTVbw507m5BqQdGcH7fv5ugBfqTcDGTAzq
	tmJ7feeAqDytLNj9wpu9az+A0sILw+xbtYWelcj2a4g5rhdD0aUy9cf4QdascnBuCwBcphpher2CU
	4RzlJ8U9z7IVTlQBvokz8HpSb/C+vl22N/ZwHrFZ9Ps1w6AVfWPTl3nKtDM/dsDZ/hoCWH/OzDyQu
	U2D1v0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQ7-000000044m0-0Oq7;
	Tue, 12 Nov 2024 16:07:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtMK-000000043qj-1hQV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731427395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGjpopU//5Z3ijsaSdLB1L4ysYnNj5d6t1WIT5/TMSI=;
	b=ME4LXGhISvfQeratkAwqLkGO8suqycqHncwzPYfN787I8pv5KUfM2qXkNGNbuEzD9te8sF
	VHTwsrFS69seG3zIUL2liEn47rKswhU+nh1jBbT1GrGdvrG/S7m8wt6jnzz7J+5yP6KIgt
	XCWGno+thzfUelglfKdbEI5YDWJ3oD0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-C7oqfzm8OqSYr7gHoVnKRw-1; Tue, 12 Nov 2024 11:03:13 -0500
X-MC-Unique: C7oqfzm8OqSYr7gHoVnKRw-1
X-Mimecast-MFC-AGG-ID: C7oqfzm8OqSYr7gHoVnKRw
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb75d21d3eso41161eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 08:03:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427393; x=1732032193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGjpopU//5Z3ijsaSdLB1L4ysYnNj5d6t1WIT5/TMSI=;
        b=Kkj1MTDvvGoD919bYgHDmSMU1O1zUXHXsCGw23b71mPcawteyn8FBDcq98aFJF7qqT
         BpEdjY9iJfGFlFIiO62jVQjflthZo/MGGosV81Pauv9y2plBgfTH97JNjTCd7Qwve/az
         V/I5sjfSsOU8Te7/zS0eX3olbqvwL5z/1iGW2jgOjlTbNefqyx3dkPulfHTsy8IZYSYA
         9+kXKEcC4vsqSajKsi0UPa8FBDxRqRQ9cmP7Nm5NcIsP7MfLPFTzott2cN6Fi7rvgWcl
         +JNrkSkAgzhWRRt81IZzQXJ9FmWZRmbsKL2f+qqISFp5DUsAKylECvIC7BX8mWhB+J19
         C9fA==
X-Forwarded-Encrypted: i=1; AJvYcCV8V+CPiKthuFhA539I2dnWQxXiNkLAAvjRskfrMhwB+10ewmwNSNxI/0IGpzPAojiJ5ihayVyJZn7qvj9vBW3O@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+jRUXM/8qG1mzzAyvoLJ+dvbbsw6hP6ohz69/tHYWux84/VvW
	8zH5ImAoZBoyEFikDnZioPDiOemxxPpBaB5b2zqFpoj+hjgehLc/5NSsvXCnQ/8nz9Tb577eX+e
	Gc9ahe1/iWXWbb4v46nu3nBG7Qn+JLFMVk9KtxLTpmlfRjb65HOWC8zdMOlpVFUe7jOaPSHDmWk
	byFH5VXFdLfxHoqKBzWDNXz7W/AihXu9l4gdr1eZqZgKKpOPk=
X-Received: by 2002:a05:6870:9d18:b0:291:cb6:f3cd with SMTP id 586e51a60fabf-295600f04b3mr3378957fac.8.1731427392807;
        Tue, 12 Nov 2024 08:03:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6K30AckXB3aEumZtFVfs7n1j8qvpk6yUxT6SWtcwB5Q41cmA94cAVxxZej7fXm079vvCRy6HcYFAc5PeZ48s=
X-Received: by 2002:a05:6870:9d18:b0:291:cb6:f3cd with SMTP id
 586e51a60fabf-295600f04b3mr3378934fac.8.1731427392148; Tue, 12 Nov 2024
 08:03:12 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
 <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
 <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
 <CALE0LRvN3tYgWig1XnCiAZvdzE8x=cdLanGxbUvpPr5nfexSPQ@mail.gmail.com>
 <CAC_iWjL4mp-sTsp5a+yFkUauXuMvZ1yoTAk_60nm-CCKUgwayw@mail.gmail.com>
 <CALE0LRsYXXaao2uCUMFkd8Y6f5Mxgoc-Qpft_y8wWW3ZiekbbA@mail.gmail.com>
 <CAC_iWjL+J9tNxEdh0AoYD19h013N4nk=KmaT=RACo4-oVwuRCA@mail.gmail.com>
 <CALE0LRu2oDSo6KOhO2fTDMiqX7iqjqNjNGD_67MJFS7BJWqT_w@mail.gmail.com>
 <CALE0LRvFT3fDdoBLXHK2e47cibD02pxXAuZ83rTqEfrzU3HnKA@mail.gmail.com>
 <CAC_iWj+STZib+VOZrQtZk95skWzyLqe7_HpNM60G6axNa3Lnnw@mail.gmail.com>
 <CALE0LRsqc6L9EunhOyvyOR_KgG28zb10YBR1qN2qgZ9iJvaHEw@mail.gmail.com>
 <CAC_iWjKLqDFb1wSUQ1uMqOfbeRtzGNX9gyTHtQy5-71WvBiiLA@mail.gmail.com>
 <CALE0LRt7cwwwQ0Rh+0qJsUzTsNULEQSYgAoviQp5F5SXeJk8LQ@mail.gmail.com> <CAC_iWjKkdS71Fh3LZ0CJR-vnC+PwGKGndxjU3WjjUPnZ84DYWg@mail.gmail.com>
In-Reply-To: <CAC_iWjKkdS71Fh3LZ0CJR-vnC+PwGKGndxjU3WjjUPnZ84DYWg@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 12 Nov 2024 17:03:01 +0100
Message-ID: <CALE0LRt2ct8onNyPvTNzy3Ps1kqduqx-OMmnQse-SXsk5M451Q@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q8SHndpW5tnhgEQ3X0qi_MKaKLkriawTE64x7fFhdVY_1731427393
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080316_670304_6AE94CF6 
X-CRM114-Status: GOOD (  37.29  )
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

On Tue, Nov 12, 2024 at 4:07=E2=80=AFPM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Tue, 12 Nov 2024 at 16:39, Enric Balletbo i Serra
> <eballetb@redhat.com> wrote:
> >
> > On Tue, Nov 12, 2024 at 2:23=E2=80=AFPM Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > [...]
> > >
> > > > > > > >
> > > > > > >
> > > > > > > Unfortunately that didn't help, but I don't see this code bei=
ng run.
> > > > >
> > > > > That's weird, look below.
> > > > >
> > > > > > > Who sets for the first place the uefi variables, is this u-bo=
ot
> > > > > > > writing them to the rpmb? or is optee itself?
> > > > >
> > > > > U-Boot sets the variables, but it does so via StandAloneMM.
> > > > >
> > > > > > >
> > > > > >
> > > > > > I tried to compare the behaviour between optee_rpmb (works) and
> > > > > > efidebug (doesn't worrk). I see that the first thing optee_rpmb
> > > > > > command does is open a session against the TA application, some=
thing
> > > > > > that efidebug doesn't do, shouldn't efidebug do the same to acc=
ess to
> > > > > > the rpmb device and read or write the efi variables?
> > > > > >
> > > > >
> > > > > That's a bit more complicated and explained to one of the blog po=
sts I
> > > > > pasted above.
> > > > > We do open an OP-TEE session, but not for talking to a TA. We sen=
d the
> > > > > messages to StandAloneMM, which then usese OPTEE RPMB APIs to wri=
te
> > > > > the flash.
> > > > >
> > > > > The weird thing is why OP-TEE does not format your RPMB when comp=
iling
> > > > > with that flag.
> > > > > If done correctly, OP-TEE will wipe the RPMB contents the first t=
ime
> > > > > it tries to access it.
> > > > >
> > > >
> > > > It does if I call optee_rpmb command
> > > >
> > > > E/TC:? 0 rpmb_fs_setup:2143 **** Clearing Storage ****
> > > >
> > > > But I don't see any attempt to write efi variables to the rpmb
> > > > partition if I use the normal boot workflow or calling any efi comm=
and
> > > > from the prompt.
> > > >
> > > > I think I need to read a bit more about all the pieces because I mi=
ght
> > > > miss something.
> > >
> > > You don't need the command above to store variables. You need this in
> > > case you need to use the RPMB from the command line.
> > > Do a 'printenv -e && setenv -e -bs -rt -nv test test1 && printenv -e'=
.
> > > Does that work ?
> > >
> >
> > No, `printenv -e` gets stuck. This is the log with some debug messages =
I added.
> >
> > =3D> printenv -e
> > > lib/efi_loader/efi_setup.c:227 Initialize once only
> >   > lib/efi_loader/efi_setup.c:234 Set up console modes
> >   > lib/efi_loader/efi_setup.c:242 Proble block devices to find the ESP
> > MMC: no card present
> > mmc_init: -123, time 2002
> >   > lib/efi_loader/efi_setup.c:249 Initialize variable services
> >      > lib/efi_loader/efi_var_mem.c:223 efi_allocate_pages
> >      > lib/efi_loader/efi_var_mem.c:236 efi_create_event
> >   < lib/efi_loader/efi_var_mem.c:244 - ret=3D0
> > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
>
> Please try again with the FAT reset config flag in OP-TEE and without
> doing any reads and writes from the U-Boot console
>
> > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > ... stuck here ... traces indicates never outs from the efi_setup, so
> > looks like hungs
> >
> > Let me try with BeaglePlay and read a bit more, as I feel I'm a bit
> > lost right now.
>
> Sure, let me know if you need anything else.
>

Same behaviour on BeaglePlay, so either it's currently broken or I'm
making the same mistake in my process on both boards.

Ilias, by chance, do you have in which versions did you test?

Thanks,
  Enric
> /Ilias
> >
> > > >
> > > > =3D> optee_rpmb read test 4
> > > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > > D/TC:? 0 ldelf_syscall_open_bin:135 > ldelf_syscall_open_bin
> > > > D/TC:? 0 ldelf_syscall_open_bin:164 Lookup user TA ELF
> > > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > > D/TC:? 0 ldelf_syscall_open_bin:168 res=3D0
> > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
> > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 492 bytes
> > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > F/TC:? 0 read_compressed:178 532 bytes
> > > > F/TC:? 0 read_compressed:178 924 bytes
> > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > F/TC:? 0 read_compressed:178 248 bytes
> > > > F/TC:? 0 read_compressed:178 760 bytes
> > > > F/TC:? 0 trace_syscall:147 syscall #6 (syscall_close_ta_session)
> > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > D/LD:  ldelf:176 ELF (023f8f1a-292a-432b-8fc4-de8471358067) at 0x40=
048000
> > > > F/TC:? 0 trace_syscall:147 syscall #33 (syscall_cryp_random_number_=
generate)
> > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > F/TC:? 0 trace_syscall:147 syscall #4 (syscall_get_property_name_to=
_index)
> > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > F/TC:? 0 trace_syscall:147 syscall #41 (syscall_storage_obj_open)
> > > > D/TC:? 0 rpmb_fs_open_internal:2356 >>> rpmb_fs_open_internal
> > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > D/TC:? 0 tee_rpmb_init:1253 >>> core/tee/tee_rpmb_fs.c:1253
> > > > D/TC:? 0 legacy_rpmb_init:1142 Trying legacy RPMB init
> > > > D/TC:? 0 rpmb_set_dev_info:1111 RPMB: Syncing device information
> > > > D/TC:? 0 rpmb_set_dev_info:1113 RPMB: RPMB size is 32*128 KB
> > > > D/TC:? 0 rpmb_set_dev_info:1114 RPMB: Reliable Write Sector Count i=
s 1
> > > > D/TC:? 0 rpmb_set_dev_info:1116 RPMB: CID
> > > > D/TC:? 0 rpmb_set_dev_info:1117 000000009e93ab30  13 01 4e 47 31 4d=
 31
> > > > 35  4c 10 27 91 28 07 a9 00
> > > > D/TC:? 0 legacy_rpmb_init:1162 RPMB INIT: Deriving key
> > > > D/TC:? 0 tee_rpmb_key_gen:308 RPMB: Using test key
> > > > D/TC:? 0 legacy_rpmb_init:1176 RPMB INIT: Verifying Key
> > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x61
> > > > D/TC:? 0 legacy_rpmb_init:1180 Found working RPMB device
> > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > E/TC:? 0 rpmb_fs_setup:2143 **** Clearing Storage ****
> > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 2
> > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0xD3
> > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > > F/TC:? 0 dump_fat:1951 flags 0x2, size 0, address 0, filename ''
> > > > D/TC:? 0 read_fat:2221 fat_address 0
> > > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x18
> > > > E/TA:  read_persist_value:338 Can't open named object value, res =
=3D 0xffff0008
> > > > D/TC:? 0 tee_ta_invoke_command:798 Error: ffff0008 of 4
> > > > D/TC:? 0 tee_ta_close_session:460 csess 0x9e925a50 id 1
> > > > D/TC:? 0 tee_ta_close_session:479 Destroy session
> > > > D/TC:? 0 destroy_context:318 Destroy TA ctx (0x9e9259f0)
> > > > Failed to read persistent value
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > > Cheers
> > > > > /Ilias
> > > > >
> > > > > > =3D> optee_rpmb read test 4
> > > > > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > > > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > > > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de847135806=
7
> > > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > > > > D/TC:? 0 ldelf_syscall_open_bin:163 Lookup user TA ELF
> > > > > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > > > > D/TC:? 0 ldelf_syscall_open_bin:167 res=3D0
> > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_comman=
d)
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellati=
on)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_comman=
d)
> > > > > >
> > > > > > =3D> efidebug query -bs -rt -nv
> > > > > > MMC: no card present
> > > > > > mmc_init: -123, time 2002
> > > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > > Thanks
> > > > > > > > /Ilias
> > > > > > > > >
> > > > > > > > > =3D> efidebug query -bs -rt -nv
> > > > > > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > ... stuck here ... I need to reset the board
> > > > > > > > >
> > > > > > > > > Will continue to see if I can get more useful messages
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > >   Enric
> > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > > /Ilias
> > > > > > > > > > >
> > > > > > > > > > > I'll try to add some more prints to verify if REE is =
used as a store
> > > > > > > > > > > system, I assume this should say something about RPMB=
. Am I right with
> > > > > > > > > > > this?
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > And tracing the function calls gives me that:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       tee_stmm_efi_probe() {
> > > > > > > > > > > > > > >              tee_client_open_context() {
> > > > > > > > > > > > > > >                optee_get_version() {
> > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > > >                } (ret=3D0xd)
> > > > > > > > > > > > > > >                tee_ctx_match(); (ret=3D0x1)
> > > > > > > > > > > > > > >                optee_smc_open() {
> > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > > >                  optee_open() {
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                  } (ret=3D0x0)
> > > > > > > > > > > > > > >                } (ret=3D0x0)
> > > > > > > > > > > > > > >              } (ret=3D0xffff000004e71c80)
> > > > > > > > > > > > > > >              tee_client_open_session() {
> > > > > > > > > > > > > > >                optee_open_session() {
> > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > > >                  optee_get_msg_arg() {
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0=
xffff000002909000)
> > > > > > > > > > > > > > >                  } (ret=3D0xffff000002909000)
> > > > > > > > > > > > > > >                  tee_session_calc_client_uuid=
(); (ret=3D0x0)
> > > > > > > > > > > > > > >                  optee_to_msg_param(); (ret=
=3D0x0)
> > > > > > > > > > > > > > >                  optee_smc_do_call_with_arg()=
 {
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0=
xffff000002909000)
> > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0=
xffff000002909060)
> > > > > > > > > > > > > > >                    optee_cq_wait_init(); (ret=
=3D0xffff000002e55910)
> > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D=
0xffff0004)
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D=
0xffff0004)
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D=
0xffff0004)
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D=
0xffff0004)
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D=
0xffff0004)
> > > > > > > > > > > > > > >      ... continues sending this forever ...
> > > > > > > > > > > > > > >      ... Hit ^C to stop recording ...
> > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D=
0xffff000002e55800)
> > > > > > > > > > > > > > >                    optee_smccc_smc() {
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > [1] https://docs.u-boot.org/en/latest/develop=
/uefi/uefi.html#using-op-tee-for-efi-variables
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Thanks in advance,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The most common problem with this is miscompili=
ng the tee_supplicant
> > > > > > > > > > > > > > application.
> > > > > > > > > > > > > > Since we don't know if the system has an RPMB, =
we emulate it in the
> > > > > > > > > > > > > > tee_supplicant. How did you get the supplicant =
and can you check if it
> > > > > > > > > > > > > > was compiled with RPMB_EMU=3D0 or 1?
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'm using the tee-supplicant provided by the fedo=
ra package which is
> > > > > > > > > > > > > built with ` -DRPMB_EMU=3D0`, I think that's corr=
ect, right?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Yes, this is correct. We fixed the Fedora package t=
o compile the
> > > > > > > > > > > > supplicant correctly a while back.
> > > > > > > > > > > >
> > > > > > > > > > > > [0] https://www.linaro.org/blog/uefi-secureboot-in-=
u-boot/
> > > > > > > > > > > > [1] https://apalos.github.io/Protected%20UEFI%20var=
iables%20with%20U-Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Regards
> > > > > > > > > > > > /Ilias
> > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > >    Enric
> > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > > /Ilias
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >    Enric
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>


