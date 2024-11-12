Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FADD32D97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8E8hvRUbANQxvdQA+FQn+tu9MYQOb26X7vdR/xDtMY=; b=mT7xmYo1c86V60kqwZESJg+HDe
	onhB1QcXjxM2tVs/tuA9bS4nYZVnnS858FtaMaE0lXmNhVpeJbH1HaLhkmjGcS5zMHnv+TjV/HHng
	gUBdSZZbatFWAIJt5QwvswepY1El8qUhN8IUg0NmJWF4fZPzO5+QHZJtdgfzN4giM4+zOfJVzhMmU
	39iTquGsZ8fp4gMQ4VkNffF6S1ZNCPhGskRwTfe50yPTbBj2iQgBsjuV5Zt6QGT+JrOuUaY2klj/8
	HMBRN8SfP9jjAR9zpSy/Q/w81tgs55OezyCBgq8WiUZZ8zJeTBH0X0tTfg5ktbJ5sZM85tD7b9UMT
	PdDCNfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwUE-00000004hUA-2SsY;
	Tue, 12 Nov 2024 19:23:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwSP-00000004h8h-0MDX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:21:47 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so4533130a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731439303; x=1732044103; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W8E8hvRUbANQxvdQA+FQn+tu9MYQOb26X7vdR/xDtMY=;
        b=tsvHUmdJOnSXuvJihK98MTFd77XLIteyv8vnVeAOPWnumvHSKnMSsPLcBxzqwhLyDO
         Th2kSO50OPApFowT0oQLUk4vb0qW+tMQs3gWDn7267ns/5bgjXsnbTeJGrslcBILMEs1
         fLPUISKXD75pTl+87++S+ikxcMzdeH4AoSVWI+pGsFaYa8DKTSK/NEQ1zTcfEODxjW7Q
         PHoAUAisVgQ7cp5WFjOd/qeIZRMkBN9uPh04XRQ6qG0tDXFvX83urS1WS8t3+Qgz6QAK
         fIV8tbv06ZUFpyVpoGjJ1F5b8GBvrdL7285hoJDDLs+n8xTBv53XRiKBHDCHHq1uRjmZ
         bZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439303; x=1732044103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8E8hvRUbANQxvdQA+FQn+tu9MYQOb26X7vdR/xDtMY=;
        b=KYSVlvG7mxXXLzu52rryeaqFbZnPSyQbErHdAel1qDWeD4VPAfnXw+5YN+/fOkUtEL
         cnAJMXgX95vQTbgqZrDmOqOkt5PWYvULNlaZaCwJWO6fzfW0OJpoOSdVDdPvjygEfVNn
         cikbX1fhe+yiEf8bYuYLWb1U6HS9CjiMN9haMHH4mt11+mUoKQkXzVYEp4+O3PwwVXDU
         e6j7EpfJ26Gl3cMsl8lmSeljAFeYsZdVVICpExOshepKjW8aOc4bd9HbtzvCpgBq8x/o
         d5u3uZ+0uSAjo0w309kF92zORoVPBa2cXjcV5f3d4dyYXIswyzMtWz1TpeQAP2VNPJen
         3u+w==
X-Forwarded-Encrypted: i=1; AJvYcCXip7pu1hZRtMx4kZ1ff7N9dWwvLtBSlKb6rDWCa5tPezOD1Jwj56flSkpmmuY5Tl9Nf2MqUrH5d22LQYtB52+t@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1aFi7isXrVR6prc0SAo6YHl2cF2jzHrjbpgqEcdJHQ+f2x9A
	HYPe1NeQ7YLBHicHMdlG0+bzR374rL2jwsEsjUDyby8ovLAif6spqHObwTeXeGx/CGFtR4fcSGR
	eYVyZWtiMxtlEVReOb8TGhO4vdgglmuvZMRN6Dg==
X-Google-Smtp-Source: AGHT+IFxvsUZbRq6EBtiU4eI2evzjD88r74nk+AjKhdkZj9oL44QuKfvXT1iJBItUh7aJXP7Hr1lnN3+lnV2Bq1t860=
X-Received: by 2002:a17:90b:2dcc:b0:2e2:e6bf:cd64 with SMTP id
 98e67ed59e1d1-2e9b16e66fcmr21666806a91.5.1731439302973; Tue, 12 Nov 2024
 11:21:42 -0800 (PST)
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
 <CALE0LRt7cwwwQ0Rh+0qJsUzTsNULEQSYgAoviQp5F5SXeJk8LQ@mail.gmail.com>
 <CAC_iWjKkdS71Fh3LZ0CJR-vnC+PwGKGndxjU3WjjUPnZ84DYWg@mail.gmail.com>
 <CALE0LRt2ct8onNyPvTNzy3Ps1kqduqx-OMmnQse-SXsk5M451Q@mail.gmail.com> <CALE0LRsA==Art8xqRQfPQq0HP6ebtYTuQ677t-BV7fDZB3grWg@mail.gmail.com>
In-Reply-To: <CALE0LRsA==Art8xqRQfPQq0HP6ebtYTuQ677t-BV7fDZB3grWg@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 12 Nov 2024 21:21:06 +0200
Message-ID: <CAC_iWj+4G3LG0XpsygS+MYJU9+oPhftOnPAfkOnEgn+GgTp2OA@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Enric Balletbo i Serra <eballetb@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_112145_163437_4840AA33 
X-CRM114-Status: GOOD (  25.80  )
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

Hi Enric

[...]

> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > ... stuck here ... traces indicates never outs from the efi_setup, so
> > > > looks like hungs
> > > >
> > > > Let me try with BeaglePlay and read a bit more, as I feel I'm a bit
> > > > lost right now.
> > >
> > > Sure, let me know if you need anything else.
> > >
> >
> > Same behaviour on BeaglePlay, so either it's currently broken or I'm
> > making the same mistake in my process on both boards.
> >
> > Ilias, by chance, do you have in which versions did you test?
> >
>
> So it looks like it is a problem with edk2 and/or edk2-platform, since
> reverting those repositories back to September, things started to look
> a lot better and I'm able to see en UEFI variables programmed.
>
> FWIW I just found this project [1] from you, thank you for it. Turns
> out that it is easy to reproduce the issue I'm facing even with qemu.
> I'll try to bisect what's the problem and report properly.

There were recently some patches in EDK2 changing some aspects and you
also have to update edk2-platforms & OP-TEE [0] to test this, but this
is not merged yet.  I did try those changes and they worked fine. When
you bisect why EDK2 is broken please let me know otherwise I'll have a
look.

>
> Thank you very much for your guidance and support.

You're welcome.
Keep in mind that [1] is _very_ hacky and it's just testing variable
accesses in the firmware since U-Boot emulates the RPMB, not QEMU. IOW
it's fine to use it and test U-Boot but the changes won't survive
ExitBootServris and won't work in Linux.

>
> Cheers,
>   Enric
>
> [1] https://git.linaro.org/people/ilias.apalodimas/efi_optee_variables.git/

[0] https://github.com/tianocore/edk2/pull/6116
[1] https://git.linaro.org/people/ilias.apalodimas/efi_optee_variables.git/

Cheers
/Ilias
>
>
> > Thanks,
> >   Enric
> > > /Ilias
> > > >
> > > > > >
> > > > > > => optee_rpmb read test 4
> > > > > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > > > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > > > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > > > > D/TC:? 0 ldelf_syscall_open_bin:135 > ldelf_syscall_open_bin
> > > > > > D/TC:? 0 ldelf_syscall_open_bin:164 Lookup user TA ELF
> > > > > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > > > > D/TC:? 0 ldelf_syscall_open_bin:168 res=0
> > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 492 bytes
> > > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > F/TC:? 0 read_compressed:178 532 bytes
> > > > > > F/TC:? 0 read_compressed:178 924 bytes
> > > > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > > > F/TC:? 0 read_compressed:178 248 bytes
> > > > > > F/TC:? 0 read_compressed:178 760 bytes
> > > > > > F/TC:? 0 trace_syscall:147 syscall #6 (syscall_close_ta_session)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > > D/LD:  ldelf:176 ELF (023f8f1a-292a-432b-8fc4-de8471358067) at 0x40048000
> > > > > > F/TC:? 0 trace_syscall:147 syscall #33 (syscall_cryp_random_number_generate)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #4 (syscall_get_property_name_to_index)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #8 (syscall_check_access_rights)
> > > > > > F/TC:? 0 trace_syscall:147 syscall #41 (syscall_storage_obj_open)
> > > > > > D/TC:? 0 rpmb_fs_open_internal:2356 >>> rpmb_fs_open_internal
> > > > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > > > D/TC:? 0 tee_rpmb_init:1253 >>> core/tee/tee_rpmb_fs.c:1253
> > > > > > D/TC:? 0 legacy_rpmb_init:1142 Trying legacy RPMB init
> > > > > > D/TC:? 0 rpmb_set_dev_info:1111 RPMB: Syncing device information
> > > > > > D/TC:? 0 rpmb_set_dev_info:1113 RPMB: RPMB size is 32*128 KB
> > > > > > D/TC:? 0 rpmb_set_dev_info:1114 RPMB: Reliable Write Sector Count is 1
> > > > > > D/TC:? 0 rpmb_set_dev_info:1116 RPMB: CID
> > > > > > D/TC:? 0 rpmb_set_dev_info:1117 000000009e93ab30  13 01 4e 47 31 4d 31
> > > > > > 35  4c 10 27 91 28 07 a9 00
> > > > > > D/TC:? 0 legacy_rpmb_init:1162 RPMB INIT: Deriving key
> > > > > > D/TC:? 0 tee_rpmb_key_gen:308 RPMB: Using test key
> > > > > > D/TC:? 0 legacy_rpmb_init:1176 RPMB INIT: Verifying Key
> > > > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x61
> > > > > > D/TC:? 0 legacy_rpmb_init:1180 Found working RPMB device
> > > > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > > > D/TC:? 0 tee_rpmb_init:1205 >>> core/tee/tee_rpmb_fs.c:1205
> > > > > > D/TC:? 0 tee_rpmb_init:1214 >>> core/tee/tee_rpmb_fs.c:1214
> > > > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > > > E/TC:? 0 rpmb_fs_setup:2143 **** Clearing Storage ****
> > > > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 2
> > > > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0xD3
> > > > > > D/TC:? 0 tee_rpmb_read:1362 Read 1 block at index 0
> > > > > > D/TC:? 0 tee_rpmb_write_blk:1494 Write 1 block at index 0
> > > > > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > > > > F/TC:? 0 dump_fat:1951 flags 0x2, size 0, address 0, filename ''
> > > > > > D/TC:? 0 read_fat:2221 fat_address 0
> > > > > > D/TC:? 0 tee_rpmb_read:1362 Read 8 blocks at index 2
> > > > > > F/TC:? 0 plat_prng_add_jitter_entropy:68 0x18
> > > > > > E/TA:  read_persist_value:338 Can't open named object value, res = 0xffff0008
> > > > > > D/TC:? 0 tee_ta_invoke_command:798 Error: ffff0008 of 4
> > > > > > D/TC:? 0 tee_ta_close_session:460 csess 0x9e925a50 id 1
> > > > > > D/TC:? 0 tee_ta_close_session:479 Destroy session
> > > > > > D/TC:? 0 destroy_context:318 Destroy TA ctx (0x9e9259f0)
> > > > > > Failed to read persistent value
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > > Cheers
> > > > > > > /Ilias
> > > > > > >
> > > > > > > > => optee_rpmb read test 4
> > > > > > > > D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> > > > > > > > 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > > > > D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> > > > > > > > D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> > > > > > > > F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> > > > > > > > F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> > > > > > > > D/TC:? 0 ldelf_syscall_open_bin:163 Lookup user TA ELF
> > > > > > > > 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> > > > > > > > D/TC:? 0 ldelf_syscall_open_bin:167 res=0
> > > > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > > > F/TC:? 0 read_compressed:178 1024 bytes
> > > > > > > > F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
> > > > > > > > F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> > > > > > > >
> > > > > > > > => efidebug query -bs -rt -nv
> > > > > > > > MMC: no card present
> > > > > > > > mmc_init: -123, time 2002
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
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > Thanks
> > > > > > > > > > /Ilias
> > > > > > > > > > >
> > > > > > > > > > > => efidebug query -bs -rt -nv
> > > > > > > > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > > > > > > ... stuck here ... I need to reset the board
> > > > > > > > > > >
> > > > > > > > > > > Will continue to see if I can get more useful messages
> > > > > > > > > > >
> > > > > > > > > > > Thanks,
> > > > > > > > > > >   Enric
> > > > > > > > > > >
> > > > > > > > > > > > Thanks
> > > > > > > > > > > > /Ilias
> > > > > > > > > > > > >
> > > > > > > > > > > > > I'll try to add some more prints to verify if REE is used as a store
> > > > > > > > > > > > > system, I assume this should say something about RPMB. Am I right with
> > > > > > > > > > > > > this?
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > And tracing the function calls gives me that:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >       tee_stmm_efi_probe() {
> > > > > > > > > > > > > > > > >              tee_client_open_context() {
> > > > > > > > > > > > > > > > >                optee_get_version() {
> > > > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                } (ret=0xd)
> > > > > > > > > > > > > > > > >                tee_ctx_match(); (ret=0x1)
> > > > > > > > > > > > > > > > >                optee_smc_open() {
> > > > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                  optee_open() {
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                  } (ret=0x0)
> > > > > > > > > > > > > > > > >                } (ret=0x0)
> > > > > > > > > > > > > > > > >              } (ret=0xffff000004e71c80)
> > > > > > > > > > > > > > > > >              tee_client_open_session() {
> > > > > > > > > > > > > > > > >                optee_open_session() {
> > > > > > > > > > > > > > > > >                  tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                  optee_get_msg_arg() {
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=0xffff000002909000)
> > > > > > > > > > > > > > > > >                  } (ret=0xffff000002909000)
> > > > > > > > > > > > > > > > >                  tee_session_calc_client_uuid(); (ret=0x0)
> > > > > > > > > > > > > > > > >                  optee_to_msg_param(); (ret=0x0)
> > > > > > > > > > > > > > > > >                  optee_smc_do_call_with_arg() {
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=0xffff000002909000)
> > > > > > > > > > > > > > > > >                    tee_shm_get_va(); (ret=0xffff000002909060)
> > > > > > > > > > > > > > > > >                    optee_cq_wait_init(); (ret=0xffff000002e55910)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=0xffff0004)
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=0xffff0004)
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=0xffff0004)
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=0xffff0004)
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc(); (ret=0xffff0004)
> > > > > > > > > > > > > > > > >      ... continues sending this forever ...
> > > > > > > > > > > > > > > > >      ... Hit ^C to stop recording ...
> > > > > > > > > > > > > > > > >                    tee_get_drvdata(); (ret=0xffff000002e55800)
> > > > > > > > > > > > > > > > >                    optee_smccc_smc() {
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-op-tee-for-efi-variables
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Thanks in advance,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > The most common problem with this is miscompiling the tee_supplicant
> > > > > > > > > > > > > > > > application.
> > > > > > > > > > > > > > > > Since we don't know if the system has an RPMB, we emulate it in the
> > > > > > > > > > > > > > > > tee_supplicant. How did you get the supplicant and can you check if it
> > > > > > > > > > > > > > > > was compiled with RPMB_EMU=0 or 1?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I'm using the tee-supplicant provided by the fedora package which is
> > > > > > > > > > > > > > > built with ` -DRPMB_EMU=0`, I think that's correct, right?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Yes, this is correct. We fixed the Fedora package to compile the
> > > > > > > > > > > > > > supplicant correctly a while back.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > [0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
> > > > > > > > > > > > > > [1] https://apalos.github.io/Protected%20UEFI%20variables%20with%20U-Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Regards
> > > > > > > > > > > > > > /Ilias
> > > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > >    Enric
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Thanks
> > > > > > > > > > > > > > > > /Ilias
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >    Enric
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
>

