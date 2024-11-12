Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C092D32D9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRZuof606OOT943vPxL8priucDpX6fZjafbCTv30/uE=; b=K7bS95O+02H7I2hOZvmhJcSgzX
	LmKc/MYMWvFqrvzaaBXqRHkQVnH/stmQBRdJO5GqVOA22UcFRuwE7OOGo7u+NPIijHeCleWBE9/wJ
	g0rlLKSrsHkYyljCtv8kPcskEAlpmrXsBnNr1hzovZYpyrlnU2G5+6eN8ED0toWHDM9bFnfx/yCMS
	qjdcvpoLXUCUeb2xrMCY2mE4wlgSNqJPu7OncuzQKVBSftNaslIFONnn5JxulsRiREjib22RPNWW4
	NA3EbaVwcfqXzLMxiqLBVhF3JEC6MQNBhdCCxs6bB/F8spaWRNirqW7fp50U/ZR7GzsY8oPCUWG1S
	SFcfXU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAprO-00000003N6N-0An8;
	Tue, 12 Nov 2024 12:19:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApQ0-00000003I8u-0IUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:50:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso4033119a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731412247; x=1732017047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRZuof606OOT943vPxL8priucDpX6fZjafbCTv30/uE=;
        b=xzWELutkKeQpM07sZgYq0u3bT2gWqNND/uoAjjT+KnVErOr9C8RW71XRstipZjuBcw
         Lb7rHj9utkKdyoG0tmHT3DQmTsQXL0AhQkmbxc14/l9pV1wm5Xz2LPbvGKQs8sVqmLpM
         undJ4GyMNUAdWsl6gCRVaXRio9AcHq411RfwBQYkAQCOkUjxICfiLZnBNi64QSBKCC5E
         0oLMXHr7YXfVdwl/uIlmZ4gPzIhf2qIvjiKHYv1LkMd2pY9N3zE+eJ9ta13ZcMmcbMSu
         H5TWMSCTk+U5PGCiJ3wByxusX8f/DBnBVGljeTVLffMvgffFzGvCoIwrhYh2R3MWFiIm
         oFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731412247; x=1732017047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRZuof606OOT943vPxL8priucDpX6fZjafbCTv30/uE=;
        b=oty+xxVmamOgOUP5fCVQ7crinQZ/WisHXk5AdgK+qkERqV0ubXPqWk2DH3vGHH6g3E
         HJrhTY5C5jp/6XYxjeC93Z9XZ9vHTe8oenhyJIMo7X8LCUTLGKEkSSbbONLSNw9GOnqs
         tgxe38Y+PvzD/JFUplOw4/XfEcqEYq3ogKUu+Ky+xTuubujyrX2Xq8EwZw0nyca8if+1
         gazswBEv0QA3hJu2u9noTckv0mP1RuPvLVeaAUKZlLY61PdzOOxYdNvehhWZLKJZiMTF
         QIHZzJ3yaiRLY9PhSYmXaYgaXeUdsr3UvxVV83PpZRctQUVfZ/WnY6dVB2sB8MBU8xj3
         3wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCt5QPt0HPynhoS4a9rtxXEL705iHf0qtP+vXSB/PzjLGyaQJixnyNPmwEei370hFlNHaSn6CFDj/SeykVsOeU@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxOzNbsR7xLzdvdAxOU4LSKgAhDTRh1Db1MUanqgaZSg5jWXu
	E20xe10fmw4O/VIPCrWU/fsW0a6zxYga2g4tXnnY+qXpn9h1QctJ19pTG2TCtJWRTb6Z+jZlUVa
	bhFeGfoAoJGXhEH4KdZs2J+Bg7lgmDsBeIG9fW3+7XUJjO3Nn
X-Google-Smtp-Source: AGHT+IGkaMb/i80SMs/x4CRnfYWLkD+E9nhXz1u00nrM28hnR2oggdxJbCVO8DtM0v4ULU57vZom5G0WvzQi0gc7Mrk=
X-Received: by 2002:a17:90b:2dcc:b0:2e2:cd22:b083 with SMTP id
 98e67ed59e1d1-2e9b14d83f1mr20816157a91.0.1731412246616; Tue, 12 Nov 2024
 03:50:46 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
 <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
 <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
 <CALE0LRvN3tYgWig1XnCiAZvdzE8x=cdLanGxbUvpPr5nfexSPQ@mail.gmail.com>
 <CAC_iWjL4mp-sTsp5a+yFkUauXuMvZ1yoTAk_60nm-CCKUgwayw@mail.gmail.com>
 <CALE0LRsYXXaao2uCUMFkd8Y6f5Mxgoc-Qpft_y8wWW3ZiekbbA@mail.gmail.com>
 <CAC_iWjL+J9tNxEdh0AoYD19h013N4nk=KmaT=RACo4-oVwuRCA@mail.gmail.com>
 <CALE0LRu2oDSo6KOhO2fTDMiqX7iqjqNjNGD_67MJFS7BJWqT_w@mail.gmail.com> <CALE0LRvFT3fDdoBLXHK2e47cibD02pxXAuZ83rTqEfrzU3HnKA@mail.gmail.com>
In-Reply-To: <CALE0LRvFT3fDdoBLXHK2e47cibD02pxXAuZ83rTqEfrzU3HnKA@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 12 Nov 2024 13:50:09 +0200
Message-ID: <CAC_iWj+STZib+VOZrQtZk95skWzyLqe7_HpNM60G6axNa3Lnnw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241112_035048_228115_36D89FBE 
X-CRM114-Status: GOOD (  56.99  )
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

On Tue, 12 Nov 2024 at 13:40, Enric Balletbo i Serra
<eballetb@redhat.com> wrote:
>
> Hi again,
>
> On Tue, Nov 12, 2024 at 9:17=E2=80=AFAM Enric Balletbo i Serra
> <eballetb@redhat.com> wrote:
> >
> > Hi,
> >
> > On Mon, Nov 11, 2024 at 3:26=E2=80=AFPM Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > On Mon, 11 Nov 2024 at 16:13, Enric Balletbo i Serra
> > > <eballetb@redhat.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Thanks a lot for your support.
> > >
> > > You're welcome. FWIW I did test this in the past with an AM62x SoC.
> > >
> >
> > Thanks for the info, maybe I can give it a try with my BeaglePlay then.=
..
> >
> > > >
> > > > On Mon, Nov 11, 2024 at 12:01=E2=80=AFPM Ilias Apalodimas
> > > > <ilias.apalodimas@linaro.org> wrote:
> > > > >
> > > > > On Mon, 11 Nov 2024 at 10:21, Enric Balletbo i Serra
> > > > > <eballetb@redhat.com> wrote:
> > > > > >
> > > > > > Hi Ilias,
> > > > > >
> > > > > > On Sat, Nov 9, 2024 at 1:31=E2=80=AFAM Ilias Apalodimas
> > > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > > >
> > > > > > > On Fri, 8 Nov 2024 at 23:11, Enric Balletbo i Serra <eballetb=
@redhat.com> wrote:
> > > > > > > >
> > > > > > > > Hi Ilias,
> > > > > > > >
> > > > > > > > Thanks for your quick answer.
> > > > > > > >
> > > > > > > > On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
> > > > > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > > > > >
> > > > > > > > > Hi Enric,
> > > > > > > > >
> > > > > > > > > On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <ebal=
letb@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi all,
> > > > > > > > > >
> > > > > > > > > > I'm looking for any advice/clue to help me to progress =
on enabling
> > > > > > > > > > TEE-base EFI Runtime Variable Service on TI a j784s4 pl=
atforms.
> > > > > > > > > >
> > > > > > > > > > I basically followed the steps described in u-boot docu=
mentation [1],
> > > > > > > > > > I enabled some debugging messages but I think I'm at th=
e point that
> > > > > > > > > > the problem might be in the StandaloneMM application, a=
nd I'm not sure
> > > > > > > > > > how to debug it.
> > > > > > > > > >
> > > > > > > > > > What I see is that when I run the tee-supplicant daemon=
, it looks like
> > > > > > > > > > the tee_client_open_session() call loops forever and th=
e tee_stmm_efi
> > > > > > > > > > driver never ends to probe.
> > > > > > > > > >
> > > > > > > > > > With debug enabled I got the following messages.
> > > > > > > > >
> > > > > > > > > I assume reading and storing variables already works in U=
-Boot right?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Reading and storing variables to the RPMB partition in U-Bo=
ot works,
> > > > > > > > that's using the mmc rpmb command from u-boot,
> > > > > > >
> > > > > > > Are you talking about env variables? Perhaps you store them i=
n the mmc
> > > > > > > and not the RPMB partition?
> > > > > > > There's some information here [0]
> > > > > > >
> > > > > > > > But setting
> > > > > > > > CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar b=
ehaviour
> > > > > > > > (although I'm not able to debug at u-boot level) What I see=
 is that
> > > > > > > > u-boot gets stuck
> > > > > > > > when bootefi bootmgr is invoqued. I can also reproduce the =
issue with
> > > > > > > > bootefi hello.
> > > > > > > >
> > > > > > > > =3D> run bootcmd
> > > > > > > >   Scanning for bootflows in all bootdevs
> > > > > > > >   Seq  Method       State   Uclass    Part  Name           =
           Filename
> > > > > > > >   ---  -----------  ------  --------  ----  ---------------=
---------
> > > > > > > > ----------------
> > > > > > > >   Scanning global bootmeth 'efi_mgr':
> > > > > > > > ( gets stuck here)
> > > > > > > >
> > > > > > > > or
> > > > > > > >
> > > > > > > > =3D> bootefi hello
> > > > > > > > (gets stuck)
> > > > > > > >
> > > > > > > > To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck=
 and bypass
> > > > > > > > the error and go to Linux. My understanding is that
> > > > > > > > CONFIG_EFI_MM_COMM_TEE is only required to read/write efi v=
ariables at
> > > > > > > > u-boot level but OPTEE is running the StandaloneMM service.=
 Am I
> > > > > > > > right?
> > > > > > >
> > > > > > > U-Boot has two ways of storing EFI variables [0] . You can ei=
ther
> > > > > > > store them in a file or the RPMB partition. The correct thing=
 to do,
> > > > > > > since you want to use the RPMB, is enable CONFIG_EFI_MM_COMM_=
TEE. I am
> > > > > > > not sure why the hand happens, but one thing we can improve i=
s figure
> > > > > > > out why it hangs and print a useful message.
> > > > > > > There are a number of reasons that might lead to a failure. I=
s the
> > > > > > > RPMB key programmed on your board? Have a look at this [1] in=
 case it
> > > > > > > helps
> > > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > # tee-supplicant
> > > > > > > > > > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open t=
rusted service
> > > > > > > > > > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
> > > > > > > > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > > > > > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > > > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct reque=
st
> > > > > > >
> > > > > > > If I had to guess, OP-TEE doesn't store the variables in the =
RPMB, can
> > > > > > > you compile it with a bit more debugging enabled?
> > > > > > >
> > > > > >
> > > > > > Here is a log with CFG_TEE_CORE_LOG_LEVEL=3D4, CFG_TEE_CORE_DEB=
UG=3Dy and
> > > > > > CFG_TEE_TA_LOG_LEVEL=3D4
> > > > > >
> > > > > > https://paste.centos.org/view/eed83a5b
> > > > > >
> > > > > > At the beginning of the log I see
> > > > > >
> > > > > > D/TC:0 0 check_ta_store:449 TA store: "REE"
> > > > > >
> > > > > > Which looks wrong to me as I built optee with:
> > > > > >   CFG_REE_FS=3Dn
> > > > > >   CFG_RPMB_FS_DEV_ID=3D0
> > > > > >   CFG_RPMB_FS=3Dy
> > > > >
> > > > > Yes it does look wrong. Our compilation flags are
> > > > > CFG_RPMB_FS=3Dy CFG_RPMB_FS_DEV_ID=3D0 CFG_RPMB_WRITE_KEY=3Dy
> > > > > CFG_RPMB_TESTKEY=3Dy CFG_REE_FS=3Dn CFG_CORE_ARM64_PA_BITS=3D48
> > > > > CFG_SCTLR_ALIGNMENT_CHECK=3Dn
> > > > >
> > > >
> > > > Mine are very similar
> > > >
> > > > make CROSS_COMPILE=3D"$CC32" CROSS_COMPILE64=3D"$CC64" \
> > > >     PLATFORM=3Dk3-j784s4 CFG_ARM64_core=3Dy CFG_CONSOLE_UART=3D0x8 =
\
> > > >     CFG_RPMB_FS_DEV_ID=3D0 CFG_REE_FS=3Dn CFG_RPMB_FS=3Dy \
> > > >     CFG_RPMB_WRITE_KEY=3Dy CFG_RPMB_TESTKEY=3Dy \
> > > >     CFG_STMM_PATH=3DBL32_AP_MM.fd \
> > > >     CFG_CORE_HEAP_SIZE=3D524288 CFG_CORE_DYN_SHM=3Dy CFG_SCTLR_ALIG=
NMENT_CHECK=3Dn \
> > > >     CFG_TEE_CORE_LOG_LEVEL=3D4 CFG_TEE_CORE_DEBUG=3Dy CFG_TEE_TA_LO=
G_LEVEL=3D4
> > > >
> > > > There is a difference with CFG_CORE_ARM64_PA_BITS=3D48 , my platfor=
m defines it to
> > > >
> > > >    core/arch/arm/plat-k3/conf.mk:$(call force,CFG_CORE_ARM64_PA_BIT=
S,36)
> > > >
> > > > But I don't think this is the problem.
> > > >
> > > > > The testkey etc aren't required if your board has a way of readin=
g the
> > > > > RPMB key from a secure location -- in fact, using the testkey is =
not
> > > > > secure. Is the RPMB programmed on your board? Also can you make s=
ure
> > > > > CFG_RPMB_FS_DEV_ID needs to be 0? How many sd interfaces your boa=
rd
> > > > > has?
> > > >
> > > > My board has two interfaces, an eMMC and a SD-card, 0 is indeed the
> > > > eMMC and I'm using the testkey which I assume was programmed the fi=
rst
> > > > time I booted with all this. Unfortunately I lost the traces. But,
> > > > optee_rpmb works. I.e:
> > > >
> > > >      =3D> optee_rpmb write test 1234
> > > >      =3D> optee_rpmb read test 4
> > > >      Read 4 bytes, value =3D 1234
> > > >
> > > >
> > > > > IOW in U-Boot does 'mmc dev 0 && mmc info' print information for =
the
> > > > > RPMB partition?
> > > > >
> > > >
> > > >     =3D> mmc dev 0
> > > >     switch to partitions #0, OK
> > > >     mmc0(part 0) is current device
> > > >     =3D> mmc info
> > > >     Device: mmc@4f80000
> > > >     Manufacturer ID: 13
> > > >     OEM: 4e
> > > >     Name: G1M15L
> > > >     Bus Speed: 200000000
> > > >     Mode: HS400 (200MHz)
> > > >     Rd Block Len: 512
> > > >     MMC version 5.1
> > > >     High Capacity: Yes
> > > >     Capacity: 29.6 GiB
> > > >     Bus Width: 8-bit DDR
> > > >     Erase Group Size: 512 KiB
> > > >     HC WP Group Size: 8 MiB
> > > >     User Capacity: 29.6 GiB WRREL
> > > >     Boot Capacity: 31.5 MiB ENH
> > > >     RPMB Capacity: 4 MiB ENH
> > > >     Boot area 0 is not write protected
> > > >     Boot area 1 is not write protected
> > > >     =3D> mmc list
> > > >     mmc@4f80000: 0 (eMMC)
> > > >     mmc@4fb0000: 1
> > > >
> > > > Any interaction with efi gives me the same result (printenv -e,
> > > > efidebug, bootefi ...)
> > >
> > > Yes, that makes sense, because variables fail to initialize -- which
> > > is a core part of bringing up the EFI subsystem.
> > >
> > > Can you recompile op-tee with CFG_RPMB_RESET_FAT and try again?
> > >
> >
> > Unfortunately that didn't help, but I don't see this code being run.

That's weird, look below.

> > Who sets for the first place the uefi variables, is this u-boot
> > writing them to the rpmb? or is optee itself?

U-Boot sets the variables, but it does so via StandAloneMM.

> >
>
> I tried to compare the behaviour between optee_rpmb (works) and
> efidebug (doesn't worrk). I see that the first thing optee_rpmb
> command does is open a session against the TA application, something
> that efidebug doesn't do, shouldn't efidebug do the same to access to
> the rpmb device and read or write the efi variables?
>

That's a bit more complicated and explained to one of the blog posts I
pasted above.
We do open an OP-TEE session, but not for talking to a TA. We send the
messages to StandAloneMM, which then usese OPTEE RPMB APIs to write
the flash.

The weird thing is why OP-TEE does not format your RPMB when compiling
with that flag.
If done correctly, OP-TEE will wipe the RPMB contents the first time
it tries to access it.

Cheers
/Ilias

> =3D> optee_rpmb read test 4
> D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
> 023f8f1a-292a-432b-8fc4-de8471358067
> D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
> D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
> F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
> F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
> D/TC:? 0 ldelf_syscall_open_bin:163 Lookup user TA ELF
> 023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
> D/TC:? 0 ldelf_syscall_open_bin:167 res=3D0
> F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
> F/TC:? 0 read_compressed:178 1024 bytes
> F/TC:? 0 read_compressed:178 1024 bytes
> F/TC:? 0 read_compressed:178 1024 bytes
> F/TC:? 0 read_compressed:178 1024 bytes
> F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
> F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
>
> =3D> efidebug query -bs -rt -nv
> MMC: no card present
> mmc_init: -123, time 2002
> D/TC:? 0 load_stmm:297 stmm load address 0x40004000
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
>
>
>
> >
> > > Thanks
> > > /Ilias
> > > >
> > > > =3D> efidebug query -bs -rt -nv
> > > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > > ... stuck here ... I need to reset the board
> > > >
> > > > Will continue to see if I can get more useful messages
> > > >
> > > > Thanks,
> > > >   Enric
> > > >
> > > > > Thanks
> > > > > /Ilias
> > > > > >
> > > > > > I'll try to add some more prints to verify if REE is used as a =
store
> > > > > > system, I assume this should say something about RPMB. Am I rig=
ht with
> > > > > > this?
> > > > >
> > > > >
> > > > > >
> > > > > > > > > >
> > > > > > > > > > And tracing the function calls gives me that:
> > > > > > > > > >
> > > > > > > > > >       tee_stmm_efi_probe() {
> > > > > > > > > >              tee_client_open_context() {
> > > > > > > > > >                optee_get_version() {
> > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > > >                } (ret=3D0xd)
> > > > > > > > > >                tee_ctx_match(); (ret=3D0x1)
> > > > > > > > > >                optee_smc_open() {
> > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > > >                  optee_open() {
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                  } (ret=3D0x0)
> > > > > > > > > >                } (ret=3D0x0)
> > > > > > > > > >              } (ret=3D0xffff000004e71c80)
> > > > > > > > > >              tee_client_open_session() {
> > > > > > > > > >                optee_open_session() {
> > > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > > >                  optee_get_msg_arg() {
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff00000=
2909000)
> > > > > > > > > >                  } (ret=3D0xffff000002909000)
> > > > > > > > > >                  tee_session_calc_client_uuid(); (ret=
=3D0x0)
> > > > > > > > > >                  optee_to_msg_param(); (ret=3D0x0)
> > > > > > > > > >                  optee_smc_do_call_with_arg() {
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff00000=
2909000)
> > > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff00000=
2909060)
> > > > > > > > > >                    optee_cq_wait_init(); (ret=3D0xffff0=
00002e55910)
> > > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004=
)
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004=
)
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004=
)
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004=
)
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004=
)
> > > > > > > > > >      ... continues sending this forever ...
> > > > > > > > > >      ... Hit ^C to stop recording ...
> > > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff0000=
02e55800)
> > > > > > > > > >                    optee_smccc_smc() {
> > > > > > > > > >
> > > > > > > > > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi=
.html#using-op-tee-for-efi-variables
> > > > > > > > > >
> > > > > > > > > > Thanks in advance,
> > > > > > > > >
> > > > > > > > > The most common problem with this is miscompiling the tee=
_supplicant
> > > > > > > > > application.
> > > > > > > > > Since we don't know if the system has an RPMB, we emulate=
 it in the
> > > > > > > > > tee_supplicant. How did you get the supplicant and can yo=
u check if it
> > > > > > > > > was compiled with RPMB_EMU=3D0 or 1?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I'm using the tee-supplicant provided by the fedora package=
 which is
> > > > > > > > built with ` -DRPMB_EMU=3D0`, I think that's correct, right=
?
> > > > > > > >
> > > > > > >
> > > > > > > Yes, this is correct. We fixed the Fedora package to compile =
the
> > > > > > > supplicant correctly a while back.
> > > > > > >
> > > > > > > [0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
> > > > > > > [1] https://apalos.github.io/Protected%20UEFI%20variables%20w=
ith%20U-Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > > > > > >
> > > > > > >
> > > > > > > Regards
> > > > > > > /Ilias
> > > > > > > > Thanks,
> > > > > > > >    Enric
> > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > > /Ilias
> > > > > > > > >
> > > > > > > > > >    Enric
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
>

