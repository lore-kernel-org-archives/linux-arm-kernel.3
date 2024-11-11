Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD03D2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj2DNZ1KVT5OMTBp9DuFZAenW0xgDUzq6xmlXFq+iFA=; b=p6tCHM3X1JeLUrxDuAbp740U7Z
	xn8J0CGfJeoxyPnnjhR2iS7WrMQRe9zXjWYHdX5H1ouReK1+uCgVV67haXx98FtSZS9LIRkecjiHz
	ZSs/Pd06RlvhHKScPDa+LXalIQuYzhBc79oIwBkYwR9hVbcL/mV/CJRDmDvSsRxhgb+2ToRYO3sTU
	zWP0zFPbSN6CjRp/3UR9ZXfKGVYmvP1yGEqqAh9z7CHnhbFja+ntxu+jbnQIvuDx8nZ0td+/+7sxR
	HmzEyASFD05QmyNgeySexl/kTre4lbntnbFbt+yW+5EhgbpsJ0NbzIJfbgbxEQHlXecxQPXK0xA4j
	7W9A5ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVDV-00000000I8t-2Eu0;
	Mon, 11 Nov 2024 14:16:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVAN-00000000HV6-1HNf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 14:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731334398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mj2DNZ1KVT5OMTBp9DuFZAenW0xgDUzq6xmlXFq+iFA=;
	b=WR0rOHufg9NlQQIZUjsym4d+IZkAtdkfDizH1nkx90+pg/pXwKrlfBSJRZRH0Z+Gi2xMy7
	5ItTTPlSTt5NFvTTx3Zc+6nNu9Ee9EfYY0DaNw3554bOY0nQ2RWH/hlkoep5XnFUFqGlHO
	bU8YdAFnoGXLWIj2AIYteHtvDDq2luY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-_0bAHEx7NameC-CNSFBa5g-1; Mon, 11 Nov 2024 09:13:16 -0500
X-MC-Unique: _0bAHEx7NameC-CNSFBa5g-1
X-Mimecast-MFC-AGG-ID: _0bAHEx7NameC-CNSFBa5g
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-717fac47d50so1582982a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 06:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731334396; x=1731939196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj2DNZ1KVT5OMTBp9DuFZAenW0xgDUzq6xmlXFq+iFA=;
        b=Jzhq7IzD4K6Q6xIBf6ZhYIqsBlicnM3uU3Q3oEXTly/HrRqkguz5CGbA9OFtzHFlf9
         rLe4C2f8bU44LWffC46FsRL7dpVD4c8g2QRQ9Ds0VdEntTsogSIBzFlKZYNOlkt6akIY
         AwoM8i+eX4nIZ/vIXYXNCjam5cec779jaeCFX0XZAHCQFnNn2fan6NVI4GVowsu9i/QY
         b2iwptCqBEyjEy8bI3k55bPYU2sUxynbE8UMfHzW78cED30+1LsGIyAAjn7mnrVepduj
         TrGbzJmxem8XbYcU/ZXurglRkgMexR3Lu+xqy/7TOoQ/uQiMBfHr3h8tvOqyHKwIuPU3
         YRkg==
X-Forwarded-Encrypted: i=1; AJvYcCUwrQBq/SOeAAZNICEjTbZNZ5YfIW2AGQsYZaX/FLzviaHshTFZ1leTMV7zElQ5AfzWJ9IpMpiaYcRJplaGc6tk@lists.infradead.org
X-Gm-Message-State: AOJu0YzY6ob0B/oTocI+y1wZRHGkPj1NT7OpY6KCFsRxZhG5eaYZmBPf
	K1x4KoyHkOaWvn2jxi/g5TCZ4kTB9/X5xU0RNoJghMgnXx9Mw17QTf2Y7T2Tx3byetExDohZrIG
	q6MdRK1Ex4b+0JdsDi/w7iQ2+Vc9qrd1qKCdeY5YXJlR+PiIx4Ty1rhvz7OkUEbU9b+UB0eSGTx
	8CBDHoszHDr4RUqHKa3vlxxFlLAErAv/RarUDTFytPjfGV5EI=
X-Received: by 2002:a05:6830:3983:b0:703:7777:244b with SMTP id 46e09a7af769-71a1c1de353mr2811824a34.1.1731334395769;
        Mon, 11 Nov 2024 06:13:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo6HGRnVfI0fIsFktnZWZHQNrBxxLllEj9rzg2nwPC9BnHMmVQLaszslpdE13aC0lzeqP2KIYWY8A9A1AJpG4=
X-Received: by 2002:a05:6830:3983:b0:703:7777:244b with SMTP id
 46e09a7af769-71a1c1de353mr2811813a34.1.1731334395414; Mon, 11 Nov 2024
 06:13:15 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
 <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
 <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
 <CALE0LRvN3tYgWig1XnCiAZvdzE8x=cdLanGxbUvpPr5nfexSPQ@mail.gmail.com> <CAC_iWjL4mp-sTsp5a+yFkUauXuMvZ1yoTAk_60nm-CCKUgwayw@mail.gmail.com>
In-Reply-To: <CAC_iWjL4mp-sTsp5a+yFkUauXuMvZ1yoTAk_60nm-CCKUgwayw@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 11 Nov 2024 15:13:04 +0100
Message-ID: <CALE0LRsYXXaao2uCUMFkd8Y6f5Mxgoc-Qpft_y8wWW3ZiekbbA@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: snqgXUcbf06EC6UFhdUbBZSelwW5fgSCFw3TTrmCGs4_1731334396
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061319_528970_7DE11FD3 
X-CRM114-Status: GOOD (  47.04  )
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

Hi,

Thanks a lot for your support.

On Mon, Nov 11, 2024 at 12:01=E2=80=AFPM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Mon, 11 Nov 2024 at 10:21, Enric Balletbo i Serra
> <eballetb@redhat.com> wrote:
> >
> > Hi Ilias,
> >
> > On Sat, Nov 9, 2024 at 1:31=E2=80=AFAM Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > On Fri, 8 Nov 2024 at 23:11, Enric Balletbo i Serra <eballetb@redhat.=
com> wrote:
> > > >
> > > > Hi Ilias,
> > > >
> > > > Thanks for your quick answer.
> > > >
> > > > On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
> > > > <ilias.apalodimas@linaro.org> wrote:
> > > > >
> > > > > Hi Enric,
> > > > >
> > > > > On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballetb@red=
hat.com> wrote:
> > > > > >
> > > > > > Hi all,
> > > > > >
> > > > > > I'm looking for any advice/clue to help me to progress on enabl=
ing
> > > > > > TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.
> > > > > >
> > > > > > I basically followed the steps described in u-boot documentatio=
n [1],
> > > > > > I enabled some debugging messages but I think I'm at the point =
that
> > > > > > the problem might be in the StandaloneMM application, and I'm n=
ot sure
> > > > > > how to debug it.
> > > > > >
> > > > > > What I see is that when I run the tee-supplicant daemon, it loo=
ks like
> > > > > > the tee_client_open_session() call loops forever and the tee_st=
mm_efi
> > > > > > driver never ends to probe.
> > > > > >
> > > > > > With debug enabled I got the following messages.
> > > > >
> > > > > I assume reading and storing variables already works in U-Boot ri=
ght?
> > > > >
> > > >
> > > > Reading and storing variables to the RPMB partition in U-Boot works=
,
> > > > that's using the mmc rpmb command from u-boot,
> > >
> > > Are you talking about env variables? Perhaps you store them in the mm=
c
> > > and not the RPMB partition?
> > > There's some information here [0]
> > >
> > > > But setting
> > > > CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar behaviour
> > > > (although I'm not able to debug at u-boot level) What I see is that
> > > > u-boot gets stuck
> > > > when bootefi bootmgr is invoqued. I can also reproduce the issue wi=
th
> > > > bootefi hello.
> > > >
> > > > =3D> run bootcmd
> > > >   Scanning for bootflows in all bootdevs
> > > >   Seq  Method       State   Uclass    Part  Name                   =
   Filename
> > > >   ---  -----------  ------  --------  ----  -----------------------=
-
> > > > ----------------
> > > >   Scanning global bootmeth 'efi_mgr':
> > > > ( gets stuck here)
> > > >
> > > > or
> > > >
> > > > =3D> bootefi hello
> > > > (gets stuck)
> > > >
> > > > To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck and byp=
ass
> > > > the error and go to Linux. My understanding is that
> > > > CONFIG_EFI_MM_COMM_TEE is only required to read/write efi variables=
 at
> > > > u-boot level but OPTEE is running the StandaloneMM service. Am I
> > > > right?
> > >
> > > U-Boot has two ways of storing EFI variables [0] . You can either
> > > store them in a file or the RPMB partition. The correct thing to do,
> > > since you want to use the RPMB, is enable CONFIG_EFI_MM_COMM_TEE. I a=
m
> > > not sure why the hand happens, but one thing we can improve is figure
> > > out why it hangs and print a useful message.
> > > There are a number of reasons that might lead to a failure. Is the
> > > RPMB key programmed on your board? Have a look at this [1] in case it
> > > helps
> > >
> > > >
> > > > > >
> > > > > > # tee-supplicant
> > > > > > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted s=
ervice
> > > > > > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
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
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > >
> > > If I had to guess, OP-TEE doesn't store the variables in the RPMB, ca=
n
> > > you compile it with a bit more debugging enabled?
> > >
> >
> > Here is a log with CFG_TEE_CORE_LOG_LEVEL=3D4, CFG_TEE_CORE_DEBUG=3Dy a=
nd
> > CFG_TEE_TA_LOG_LEVEL=3D4
> >
> > https://paste.centos.org/view/eed83a5b
> >
> > At the beginning of the log I see
> >
> > D/TC:0 0 check_ta_store:449 TA store: "REE"
> >
> > Which looks wrong to me as I built optee with:
> >   CFG_REE_FS=3Dn
> >   CFG_RPMB_FS_DEV_ID=3D0
> >   CFG_RPMB_FS=3Dy
>
> Yes it does look wrong. Our compilation flags are
> CFG_RPMB_FS=3Dy CFG_RPMB_FS_DEV_ID=3D0 CFG_RPMB_WRITE_KEY=3Dy
> CFG_RPMB_TESTKEY=3Dy CFG_REE_FS=3Dn CFG_CORE_ARM64_PA_BITS=3D48
> CFG_SCTLR_ALIGNMENT_CHECK=3Dn
>

Mine are very similar

make CROSS_COMPILE=3D"$CC32" CROSS_COMPILE64=3D"$CC64" \
    PLATFORM=3Dk3-j784s4 CFG_ARM64_core=3Dy CFG_CONSOLE_UART=3D0x8 \
    CFG_RPMB_FS_DEV_ID=3D0 CFG_REE_FS=3Dn CFG_RPMB_FS=3Dy \
    CFG_RPMB_WRITE_KEY=3Dy CFG_RPMB_TESTKEY=3Dy \
    CFG_STMM_PATH=3DBL32_AP_MM.fd \
    CFG_CORE_HEAP_SIZE=3D524288 CFG_CORE_DYN_SHM=3Dy CFG_SCTLR_ALIGNMENT_CH=
ECK=3Dn \
    CFG_TEE_CORE_LOG_LEVEL=3D4 CFG_TEE_CORE_DEBUG=3Dy CFG_TEE_TA_LOG_LEVEL=
=3D4

There is a difference with CFG_CORE_ARM64_PA_BITS=3D48 , my platform define=
s it to

   core/arch/arm/plat-k3/conf.mk:$(call force,CFG_CORE_ARM64_PA_BITS,36)

But I don't think this is the problem.

> The testkey etc aren't required if your board has a way of reading the
> RPMB key from a secure location -- in fact, using the testkey is not
> secure. Is the RPMB programmed on your board? Also can you make sure
> CFG_RPMB_FS_DEV_ID needs to be 0? How many sd interfaces your board
> has?

My board has two interfaces, an eMMC and a SD-card, 0 is indeed the
eMMC and I'm using the testkey which I assume was programmed the first
time I booted with all this. Unfortunately I lost the traces. But,
optee_rpmb works. I.e:

     =3D> optee_rpmb write test 1234
     =3D> optee_rpmb read test 4
     Read 4 bytes, value =3D 1234


> IOW in U-Boot does 'mmc dev 0 && mmc info' print information for the
> RPMB partition?
>

    =3D> mmc dev 0
    switch to partitions #0, OK
    mmc0(part 0) is current device
    =3D> mmc info
    Device: mmc@4f80000
    Manufacturer ID: 13
    OEM: 4e
    Name: G1M15L
    Bus Speed: 200000000
    Mode: HS400 (200MHz)
    Rd Block Len: 512
    MMC version 5.1
    High Capacity: Yes
    Capacity: 29.6 GiB
    Bus Width: 8-bit DDR
    Erase Group Size: 512 KiB
    HC WP Group Size: 8 MiB
    User Capacity: 29.6 GiB WRREL
    Boot Capacity: 31.5 MiB ENH
    RPMB Capacity: 4 MiB ENH
    Boot area 0 is not write protected
    Boot area 1 is not write protected
    =3D> mmc list
    mmc@4f80000: 0 (eMMC)
    mmc@4fb0000: 1

Any interaction with efi gives me the same result (printenv -e,
efidebug, bootefi ...)

=3D> efidebug query -bs -rt -nv
D/TC:? 0 load_stmm:297 stmm load address 0x40004000
D/TC:? 0 spm_handle_scall:859 Received FFA version
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
D/TC:? 0 spm_handle_scall:867 Received FFA direct request
... stuck here ... I need to reset the board

Will continue to see if I can get more useful messages

Thanks,
  Enric

> Thanks
> /Ilias
> >
> > I'll try to add some more prints to verify if REE is used as a store
> > system, I assume this should say something about RPMB. Am I right with
> > this?
>
>
> >
> > > > > >
> > > > > > And tracing the function calls gives me that:
> > > > > >
> > > > > >       tee_stmm_efi_probe() {
> > > > > >              tee_client_open_context() {
> > > > > >                optee_get_version() {
> > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > > > >                } (ret=3D0xd)
> > > > > >                tee_ctx_match(); (ret=3D0x1)
> > > > > >                optee_smc_open() {
> > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > > > >                  optee_open() {
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                  } (ret=3D0x0)
> > > > > >                } (ret=3D0x0)
> > > > > >              } (ret=3D0xffff000004e71c80)
> > > > > >              tee_client_open_session() {
> > > > > >                optee_open_session() {
> > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > > > >                  optee_get_msg_arg() {
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > > > > >                  } (ret=3D0xffff000002909000)
> > > > > >                  tee_session_calc_client_uuid(); (ret=3D0x0)
> > > > > >                  optee_to_msg_param(); (ret=3D0x0)
> > > > > >                  optee_smc_do_call_with_arg() {
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > > > > >                    tee_shm_get_va(); (ret=3D0xffff000002909060)
> > > > > >                    optee_cq_wait_init(); (ret=3D0xffff000002e55=
910)
> > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > >      ... continues sending this forever ...
> > > > > >      ... Hit ^C to stop recording ...
> > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800=
)
> > > > > >                    optee_smccc_smc() {
> > > > > >
> > > > > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#us=
ing-op-tee-for-efi-variables
> > > > > >
> > > > > > Thanks in advance,
> > > > >
> > > > > The most common problem with this is miscompiling the tee_supplic=
ant
> > > > > application.
> > > > > Since we don't know if the system has an RPMB, we emulate it in t=
he
> > > > > tee_supplicant. How did you get the supplicant and can you check =
if it
> > > > > was compiled with RPMB_EMU=3D0 or 1?
> > > > >
> > > >
> > > > I'm using the tee-supplicant provided by the fedora package which i=
s
> > > > built with ` -DRPMB_EMU=3D0`, I think that's correct, right?
> > > >
> > >
> > > Yes, this is correct. We fixed the Fedora package to compile the
> > > supplicant correctly a while back.
> > >
> > > [0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
> > > [1] https://apalos.github.io/Protected%20UEFI%20variables%20with%20U-=
Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > >
> > >
> > > Regards
> > > /Ilias
> > > > Thanks,
> > > >    Enric
> > > >
> > > > > Thanks
> > > > > /Ilias
> > > > >
> > > > > >    Enric
> > > > > >
> > > > >
> > > >
> > >
> >
>


