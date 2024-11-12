Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140B9D42B97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICYC9cbuAnrz+KQRyWd5babqhuEe5Mol9lDWJ31i8HE=; b=kPMUxLHHSx8cw1ozKHDoAdoCKy
	381VTrvxppudLyabZV3OI9xrvPEsjjnQKVbZ1z0FlyTKMpM6WnSX2o0yBPI/EXLhUVz+Ju2ODPscc
	vBFaYlA8jwKEaBtalz/GHYgCFt3OUKi/cixkG0wF8TmgRd4g/UKkMVVJ+T0eORHSqUXTAIjUMehEc
	VPX0/yXqMjW6Vvy6Rg0SASl0T+6EGN036zTO7WpCkWJe1Ptu38IFFZUS8FI+wKZakQONROBwTptB/
	W4rv6U+qPjzjQicrWQy+usnPa0Larbd/jvBHQAp0eiAbtrXBjAgnPRY4jDg4gzvPARaVsw9CobCIS
	kDxvfNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsVr-00000003tWB-0JQ1;
	Tue, 12 Nov 2024 15:09:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsU2-00000003t7v-1chk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:07:12 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so4618828a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731424028; x=1732028828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICYC9cbuAnrz+KQRyWd5babqhuEe5Mol9lDWJ31i8HE=;
        b=L9eiVUGlQe+OBfP/9eO3vEE4OgK8bTNyJKYWTX7+MoDYVOYogseKdJqYSPXDW82TEX
         9kGhjTECHIjRJjPx84+JU56Pc0TjN6byo4m5C/k2l3ozRqZR9S9kIkSp99qz+t1kpZ+M
         z25pVBNi+M2+1R6UrhLTgjabEMo4ghfeNleUOnmyyqt5RiGC6kEcCHQILerkqr+V6Xm3
         K14mOKT4EwAE6D3o2LYrv71edYpZslQU7BgKieOJLT/lusm2zWu0a982XMoiyquSE5wo
         uuuCm8psafUfaimtj7HIrtXbQlDTwoMK1HjsJLllt3d+1zxSo3s61sXWlty1mspAsrPf
         S22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731424028; x=1732028828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICYC9cbuAnrz+KQRyWd5babqhuEe5Mol9lDWJ31i8HE=;
        b=rtdiSC/BqJGzZ1eUw1Zf2dOooSczE34K1mVpVjpCurELyH2iw1cToF3atjnUCGH58q
         okvN11rsLVIShDWGblj31I7azr1e5JLXkjHON2sWG9CyWZZ47tfXpzvqf8IP1O/Q5E/A
         Tji7oveeEqR4lcxkpgaEkJztu7d1gRzfCv/ZaQ0CQPiO+q5Y2mcRwaB3aLTjX6E+tGZ0
         tvzCq4K8bq9gg8Yt9AyODfzwmL9H0NJfqVsPvZCrMKPY47KAVw6wzc+lBm03Gs8dw4go
         qWomvrVDAhF69+2cnXJZrQSGtIsMUgKIKG3oehGtcsN7U6kbECWGgAE9Zocnnf6J4KXC
         s2fA==
X-Forwarded-Encrypted: i=1; AJvYcCWsXlxBwwHG/C2p2D0P5ehxDZC0rqMLhSUIdyiHtutfcQVXBJWiI7GVmZLi3xq9Au1hTBUk11wX5IWQjk8W/SQW@lists.infradead.org
X-Gm-Message-State: AOJu0YwofokfIlZF/iNLPz8rYM3YNwDQJu67gCZ4P/TOYV+q9Zcwbsz3
	m+jODUtROcWTqwHlEjHeZWqDen8/Ui02iRIShJdIPqx/B2/ZkGfbFpg8F1Yfllunj2yWcLWaZed
	cFv3oRxH4mRsU425qv4G9WidFwNegGR0skraEBA==
X-Google-Smtp-Source: AGHT+IEMFA2N/yGGDVRl5FDQKmGyuuLf9uDzAtzC7J4iSem5PQg02Wdnx3DUpZ7b2+IJpxJur1U8RxODUYXsW5SZ/u4=
X-Received: by 2002:a17:90a:d88d:b0:2cb:5aaf:c12e with SMTP id
 98e67ed59e1d1-2e9b1788b6amr20088864a91.37.1731424028013; Tue, 12 Nov 2024
 07:07:08 -0800 (PST)
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
 <CAC_iWjKLqDFb1wSUQ1uMqOfbeRtzGNX9gyTHtQy5-71WvBiiLA@mail.gmail.com> <CALE0LRt7cwwwQ0Rh+0qJsUzTsNULEQSYgAoviQp5F5SXeJk8LQ@mail.gmail.com>
In-Reply-To: <CALE0LRt7cwwwQ0Rh+0qJsUzTsNULEQSYgAoviQp5F5SXeJk8LQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 12 Nov 2024 17:06:31 +0200
Message-ID: <CAC_iWjKkdS71Fh3LZ0CJR-vnC+PwGKGndxjU3WjjUPnZ84DYWg@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_070710_465430_A7E320FF 
X-CRM114-Status: GOOD (  33.43  )
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

On Tue, 12 Nov 2024 at 16:39, Enric Balletbo i Serra
<eballetb@redhat.com> wrote:
>
> On Tue, Nov 12, 2024 at 2:23=E2=80=AFPM Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > [...]
> >
> > > > > > >
> > > > > >
> > > > > > Unfortunately that didn't help, but I don't see this code being=
 run.
> > > >
> > > > That's weird, look below.
> > > >
> > > > > > Who sets for the first place the uefi variables, is this u-boot
> > > > > > writing them to the rpmb? or is optee itself?
> > > >
> > > > U-Boot sets the variables, but it does so via StandAloneMM.
> > > >
> > > > > >
> > > > >
> > > > > I tried to compare the behaviour between optee_rpmb (works) and
> > > > > efidebug (doesn't worrk). I see that the first thing optee_rpmb
> > > > > command does is open a session against the TA application, someth=
ing
> > > > > that efidebug doesn't do, shouldn't efidebug do the same to acces=
s to
> > > > > the rpmb device and read or write the efi variables?
> > > > >
> > > >
> > > > That's a bit more complicated and explained to one of the blog post=
s I
> > > > pasted above.
> > > > We do open an OP-TEE session, but not for talking to a TA. We send =
the
> > > > messages to StandAloneMM, which then usese OPTEE RPMB APIs to write
> > > > the flash.
> > > >
> > > > The weird thing is why OP-TEE does not format your RPMB when compil=
ing
> > > > with that flag.
> > > > If done correctly, OP-TEE will wipe the RPMB contents the first tim=
e
> > > > it tries to access it.
> > > >
> > >
> > > It does if I call optee_rpmb command
> > >
> > > E/TC:? 0 rpmb_fs_setup:2143 **** Clearing Storage ****
> > >
> > > But I don't see any attempt to write efi variables to the rpmb
> > > partition if I use the normal boot workflow or calling any efi comman=
d
> > > from the prompt.
> > >
> > > I think I need to read a bit more about all the pieces because I migh=
t
> > > miss something.
> >
> > You don't need the command above to store variables. You need this in
> > case you need to use the RPMB from the command line.
> > Do a 'printenv -e && setenv -e -bs -rt -nv test test1 && printenv -e'.
> > Does that work ?
> >
>
> No, `printenv -e` gets stuck. This is the log with some debug messages I =
added.
>
> =3D> printenv -e
> > lib/efi_loader/efi_setup.c:227 Initialize once only
>   > lib/efi_loader/efi_setup.c:234 Set up console modes
>   > lib/efi_loader/efi_setup.c:242 Proble block devices to find the ESP
> MMC: no card present
> mmc_init: -123, time 2002
>   > lib/efi_loader/efi_setup.c:249 Initialize variable services
>      > lib/efi_loader/efi_var_mem.c:223 efi_allocate_pages
>      > lib/efi_loader/efi_var_mem.c:236 efi_create_event
>   < lib/efi_loader/efi_var_mem.c:244 - ret=3D0
> D/TC:? 0 load_stmm:297 stmm load address 0x40004000

Please try again with the FAT reset config flag in OP-TEE and without
doing any reads and writes from the U-Boot console

> D/TC:? 0 spm_handle_scall:859 Received FFA version
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> ... stuck here ... traces indicates never outs from the efi_setup, so
> looks like hungs
>
> Let me try with BeaglePlay and read a bit more, as I feel I'm a bit
> lost right now.

Sure, let me know if you need anything else.

/Ilias
>
> > >
> > > =3D> optee_rpmb read test 4
> > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > D/TC:? 0 ldelf_syscall_open_bin:135 > ldelf_syscall_open_bin
> > > D/TC:? 0 ldelf_syscall_open_bin:164 Lookup user TA ELF
> > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > D/TC:? 0 ldelf_syscall_open_bin:168 res=3D0
> > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
> > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 492 bytes
> > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 1024 bytes
> > > F/TC:? 0 read_compressed:178 532 bytes
> > > F/TC:? 0 read_compressed:178 924 bytes
> > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > F/TC:? 0 read_compressed:178 248 bytes
> > > F/TC:? 0 read_compressed:178 760 bytes
> > > F/TC:? 0 trace_syscall:147 syscall #6 (syscall_close_ta_session)
> > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > D/LD:  ldelf:176 ELF (023f8f1a-292a-432b-8fc4-de8471358067) at 0x4004=
8000
> > > F/TC:? 0 trace_syscall:147 syscall #33 (syscall_cryp_random_number_ge=
nerate)
> > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > F/TC:? 0 trace_syscall:147 syscall #4 (syscall_get_property_name_to_i=
ndex)
> > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > F/TC:? 0 trace_syscall:147 syscall #41 (syscall_storage_obj_open)
> > > D/TC:? 0 rpmb_fs_open_internal:2356 >>> rpmb_fs_open_internal
> > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > D/TC:? 0 tee_rpmb_init:1253 >>> core/tee/tee_rpmb_fs.c:1253
> > > D/TC:? 0 legacy_rpmb_init:1142 Trying legacy RPMB init
> > > D/TC:? 0 rpmb_set_dev_info:1111 RPMB: Syncing device information
> > > D/TC:? 0 rpmb_set_dev_info:1113 RPMB: RPMB size is 32*128 KB
> > > D/TC:? 0 rpmb_set_dev_info:1114 RPMB: Reliable Write Sector Count is =
1
> > > D/TC:? 0 rpmb_set_dev_info:1116 RPMB: CID
> > > D/TC:? 0 rpmb_set_dev_info:1117 000000009e93ab30  13 01 4e 47 31 4d 3=
1
> > > 35  4c 10 27 91 28 07 a9 00
> > > D/TC:? 0 legacy_rpmb_init:1162 RPMB INIT: Deriving key
> > > D/TC:? 0 tee_rpmb_key_gen:308 RPMB: Using test key
> > > D/TC:? 0 legacy_rpmb_init:1176 RPMB INIT: Verifying Key
> > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x61
> > > D/TC:? 0 legacy_rpmb_init:1180 Found working RPMB device
> > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > E/TC:? 0 rpmb_fs_setup:2143 **** Clearing Storage ****
> > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 2
> > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0xD3
> > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > F/TC:? 0 dump_fat:1951 flags 0x2, size 0, address 0, filename ''
> > > D/TC:? 0 read_fat:2221 fat_address 0
> > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x18
> > > E/TA:  read_persist_value:338 Can't open named object value, res =3D =
0xffff0008
> > > D/TC:? 0 tee_ta_invoke_command:798 Error: ffff0008 of 4
> > > D/TC:? 0 tee_ta_close_session:460 csess 0x9e925a50 id 1
> > > D/TC:? 0 tee_ta_close_session:479 Destroy session
> > > D/TC:? 0 destroy_context:318 Destroy TA ctx (0x9e9259f0)
> > > Failed to read persistent value
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > > Cheers
> > > > /Ilias
> > > >
> > > > > =3D> optee_rpmb read test 4
> > > > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > > > D/TC:? 0 ldelf_syscall_open_bin:163 Lookup user TA ELF
> > > > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > > > D/TC:? 0 ldelf_syscall_open_bin:167 res=3D0
> > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation=
)
> > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > >
> > > > > =3D> efidebug query -bs -rt -nv
> > > > > MMC: no card present
> > > > > mmc_init: -123, time 2002
> > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > >
> > > > >
> > > > >
> > > > > >
> > > > > > > Thanks
> > > > > > > /Ilias
> > > > > > > >
> > > > > > > > =3D> efidebug query -bs -rt -nv
> > > > > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > ... stuck here ... I need to reset the board
> > > > > > > >
> > > > > > > > Will continue to see if I can get more useful messages
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > >   Enric
> > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > /Ilias
> > > > > > > > > >
> > > > > > > > > > I'll try to add some more prints to verify if REE is us=
ed as a store
> > > > > > > > > > system, I assume this should say something about RPMB. =
Am I right with
> > > > > > > > > > this?
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > And tracing the function calls gives me that:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >       tee_stmm_efi_probe() {
> > > > > > > > > > > > > >              tee_client_open_context() {
> > > > > > > > > > > > > >                optee_get_version() {
> > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xff=
ff000002e55800)
> > > > > > > > > > > > > >                } (ret=3D0xd)
> > > > > > > > > > > > > >                tee_ctx_match(); (ret=3D0x1)
> > > > > > > > > > > > > >                optee_smc_open() {
> > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xff=
ff000002e55800)
> > > > > > > > > > > > > >                  optee_open() {
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                  } (ret=3D0x0)
> > > > > > > > > > > > > >                } (ret=3D0x0)
> > > > > > > > > > > > > >              } (ret=3D0xffff000004e71c80)
> > > > > > > > > > > > > >              tee_client_open_session() {
> > > > > > > > > > > > > >                optee_open_session() {
> > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xff=
ff000002e55800)
> > > > > > > > > > > > > >                  optee_get_msg_arg() {
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xf=
fff000002909000)
> > > > > > > > > > > > > >                  } (ret=3D0xffff000002909000)
> > > > > > > > > > > > > >                  tee_session_calc_client_uuid()=
; (ret=3D0x0)
> > > > > > > > > > > > > >                  optee_to_msg_param(); (ret=3D0=
x0)
> > > > > > > > > > > > > >                  optee_smc_do_call_with_arg() {
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xf=
fff000002909000)
> > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xf=
fff000002909060)
> > > > > > > > > > > > > >                    optee_cq_wait_init(); (ret=
=3D0xffff000002e55910)
> > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D0x=
ffff0004)
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D0x=
ffff0004)
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D0x=
ffff0004)
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D0x=
ffff0004)
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=3D0x=
ffff0004)
> > > > > > > > > > > > > >      ... continues sending this forever ...
> > > > > > > > > > > > > >      ... Hit ^C to stop recording ...
> > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=3D0x=
ffff000002e55800)
> > > > > > > > > > > > > >                    optee_smccc_smc() {
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > [1] https://docs.u-boot.org/en/latest/develop/u=
efi/uefi.html#using-op-tee-for-efi-variables
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks in advance,
> > > > > > > > > > > > >
> > > > > > > > > > > > > The most common problem with this is miscompiling=
 the tee_supplicant
> > > > > > > > > > > > > application.
> > > > > > > > > > > > > Since we don't know if the system has an RPMB, we=
 emulate it in the
> > > > > > > > > > > > > tee_supplicant. How did you get the supplicant an=
d can you check if it
> > > > > > > > > > > > > was compiled with RPMB_EMU=3D0 or 1?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > I'm using the tee-supplicant provided by the fedora=
 package which is
> > > > > > > > > > > > built with ` -DRPMB_EMU=3D0`, I think that's correc=
t, right?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Yes, this is correct. We fixed the Fedora package to =
compile the
> > > > > > > > > > > supplicant correctly a while back.
> > > > > > > > > > >
> > > > > > > > > > > [0] https://www.linaro.org/blog/uefi-secureboot-in-u-=
boot/
> > > > > > > > > > > [1] https://apalos.github.io/Protected%20UEFI%20varia=
bles%20with%20U-Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Regards
> > > > > > > > > > > /Ilias
> > > > > > > > > > > > Thanks,
> > > > > > > > > > > >    Enric
> > > > > > > > > > > >
> > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > /Ilias
> > > > > > > > > > > > >
> > > > > > > > > > > > > >    Enric
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > >
> > > >
> > >
> >
>

