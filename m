Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B35D32D9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jnA9Ys6dc6Gn0ztBuizpqw1l3pWhxfq+N40Kv0pH/A=; b=L4sooAHu3v/AOIUhfjTAL12Ns0
	mVYNxvLmeEeaOay/HQDbQLuOI1E8S7FxH7bZFur95lFfdibDpD+tEdZ9UTupbtZF4LZNoZVfYiP6r
	FerxduM04mRJ0Q8z5C7oAm0IG048kQ/AV2xWoe/En62dlzOJMxD5TgbeRzxxBCoAs1FJNvY7JaBK6
	ANer7fcank8mBezFHXyC6k88lKAt5PmhE34mpN0U0l1n2FwtVh/d3xooXaV6Hk++2em6+r2Sd12UK
	h/KqI1SA3P6CrjeHOzRBwMQC+jmGqodoU9WVmRtAqX7FPzmaU1OkDV6J/vCt4dC868rEBM2uaT+4e
	OTMCgrtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApSk-00000003Iu2-3Drx;
	Tue, 12 Nov 2024 11:53:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tApGO-00000003GAh-1Lkd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 11:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731411649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jnA9Ys6dc6Gn0ztBuizpqw1l3pWhxfq+N40Kv0pH/A=;
	b=eqynp/cE4utNmUvnO1WqFhFcI/yi9c24Xl4XV80Gd7tdnc9YXp/CtA39NYN7O06OpFpCNI
	MC4O+3y4ZS7dV0UGYdezFPPBqZDWjT1NM6EVENKxJNNzFE50935o/aqD5uCrFhlrigIVyg
	9aIpX6eb+dGEfnZrYw89onLpEXUL96M=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-DzJb1GRLO1mwYhvJrRRj7g-1; Tue, 12 Nov 2024 06:40:48 -0500
X-MC-Unique: DzJb1GRLO1mwYhvJrRRj7g-1
X-Mimecast-MFC-AGG-ID: DzJb1GRLO1mwYhvJrRRj7g
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5ec1dda8961so9175eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 03:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731411647; x=1732016447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jnA9Ys6dc6Gn0ztBuizpqw1l3pWhxfq+N40Kv0pH/A=;
        b=XQ9+Ldq/6nvzj+fel0j+h9yqBHqTZp5i/Ww5xiZIfmVBzLEk3I3g5pPkSEyJzAMJi5
         nf9PoWMuOEMGnepMArGXKjEWaoV/TdvfQ9Z7NzNPcRWVAA4OLBHUZWjRVtvcHhK6z5WE
         JvKwJHwpdIWM4GHysjsQbK67XLT9vp89YJEESS+3v3QUZYB6RWHs4uaAoHpljOR01XJx
         NOa2USaTSaiSrOFdFNJ1TiE8LVhR1D6eT8URijlXYF8zsQUF4bvHnnnYyFQB25A6v34l
         cUpmrCznuD/mwOk4MfSm2FA7ljadhoy2Py6/1O8hLEOhwVb2AY+SY26QbAbjXnH/aARK
         Izjg==
X-Forwarded-Encrypted: i=1; AJvYcCWpRI/kDDIbNoslnPBPNk9KS8414KLLODGttE7IwQ+9vX+3dDuKcS5KN/x0Mka2CShxsDDghRXU83D9mJ/5tAKa@lists.infradead.org
X-Gm-Message-State: AOJu0YwSXswB4dgwdEaqhM++hqepkB9HOdoR9Gi5f1oCLBNOQwIud837
	YTdPV7e+7qP0JC8/zLN8m/asDq/cYpb9MoVKL9tTpyXnBIMVqFT4DewncroYSnTvGHAUCtOWbMe
	+Fi88lptlHpi2c5hF03VTbNkGLXAnnNyRxvgxeyvVaAbo8kVo2hvKtm/9uwD2OkdN5PJjoVFIbg
	ttJVB6aF0pBelqXB+heyBtRvEFqWL8DIuXB/HhZQ1puolJ4Wk=
X-Received: by 2002:a4a:c90f:0:b0:5eb:bbb9:b7f0 with SMTP id 006d021491bc7-5ee57c5e731mr1739034eaf.1.1731411647067;
        Tue, 12 Nov 2024 03:40:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDiA59SC8TzPOSTALBs34rwli0vXtNdrmCAcwYQ73ykZNZ4pEo+t5ga9um7n1iSSr/GhMj2lXiI4E8nnEjOIo=
X-Received: by 2002:a4a:c90f:0:b0:5eb:bbb9:b7f0 with SMTP id
 006d021491bc7-5ee57c5e731mr1739021eaf.1.1731411645684; Tue, 12 Nov 2024
 03:40:45 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
 <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
 <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
 <CALE0LRvN3tYgWig1XnCiAZvdzE8x=cdLanGxbUvpPr5nfexSPQ@mail.gmail.com>
 <CAC_iWjL4mp-sTsp5a+yFkUauXuMvZ1yoTAk_60nm-CCKUgwayw@mail.gmail.com>
 <CALE0LRsYXXaao2uCUMFkd8Y6f5Mxgoc-Qpft_y8wWW3ZiekbbA@mail.gmail.com>
 <CAC_iWjL+J9tNxEdh0AoYD19h013N4nk=KmaT=RACo4-oVwuRCA@mail.gmail.com> <CALE0LRu2oDSo6KOhO2fTDMiqX7iqjqNjNGD_67MJFS7BJWqT_w@mail.gmail.com>
In-Reply-To: <CALE0LRu2oDSo6KOhO2fTDMiqX7iqjqNjNGD_67MJFS7BJWqT_w@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 12 Nov 2024 12:40:34 +0100
Message-ID: <CALE0LRvFT3fDdoBLXHK2e47cibD02pxXAuZ83rTqEfrzU3HnKA@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EQ9klmSY-WGhivftSDhUY6cg15sQPy5JPNFiZdVwF8Y_1731411647
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_034052_550528_475C8064 
X-CRM114-Status: GOOD (  56.68  )
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

Hi again,

On Tue, Nov 12, 2024 at 9:17=E2=80=AFAM Enric Balletbo i Serra
<eballetb@redhat.com> wrote:
>
> Hi,
>
> On Mon, Nov 11, 2024 at 3:26=E2=80=AFPM Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > On Mon, 11 Nov 2024 at 16:13, Enric Balletbo i Serra
> > <eballetb@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > Thanks a lot for your support.
> >
> > You're welcome. FWIW I did test this in the past with an AM62x SoC.
> >
>
> Thanks for the info, maybe I can give it a try with my BeaglePlay then...
>
> > >
> > > On Mon, Nov 11, 2024 at 12:01=E2=80=AFPM Ilias Apalodimas
> > > <ilias.apalodimas@linaro.org> wrote:
> > > >
> > > > On Mon, 11 Nov 2024 at 10:21, Enric Balletbo i Serra
> > > > <eballetb@redhat.com> wrote:
> > > > >
> > > > > Hi Ilias,
> > > > >
> > > > > On Sat, Nov 9, 2024 at 1:31=E2=80=AFAM Ilias Apalodimas
> > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 8 Nov 2024 at 23:11, Enric Balletbo i Serra <eballetb@r=
edhat.com> wrote:
> > > > > > >
> > > > > > > Hi Ilias,
> > > > > > >
> > > > > > > Thanks for your quick answer.
> > > > > > >
> > > > > > > On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
> > > > > > > <ilias.apalodimas@linaro.org> wrote:
> > > > > > > >
> > > > > > > > Hi Enric,
> > > > > > > >
> > > > > > > > On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballe=
tb@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi all,
> > > > > > > > >
> > > > > > > > > I'm looking for any advice/clue to help me to progress on=
 enabling
> > > > > > > > > TEE-base EFI Runtime Variable Service on TI a j784s4 plat=
forms.
> > > > > > > > >
> > > > > > > > > I basically followed the steps described in u-boot docume=
ntation [1],
> > > > > > > > > I enabled some debugging messages but I think I'm at the =
point that
> > > > > > > > > the problem might be in the StandaloneMM application, and=
 I'm not sure
> > > > > > > > > how to debug it.
> > > > > > > > >
> > > > > > > > > What I see is that when I run the tee-supplicant daemon, =
it looks like
> > > > > > > > > the tee_client_open_session() call loops forever and the =
tee_stmm_efi
> > > > > > > > > driver never ends to probe.
> > > > > > > > >
> > > > > > > > > With debug enabled I got the following messages.
> > > > > > > >
> > > > > > > > I assume reading and storing variables already works in U-B=
oot right?
> > > > > > > >
> > > > > > >
> > > > > > > Reading and storing variables to the RPMB partition in U-Boot=
 works,
> > > > > > > that's using the mmc rpmb command from u-boot,
> > > > > >
> > > > > > Are you talking about env variables? Perhaps you store them in =
the mmc
> > > > > > and not the RPMB partition?
> > > > > > There's some information here [0]
> > > > > >
> > > > > > > But setting
> > > > > > > CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar beh=
aviour
> > > > > > > (although I'm not able to debug at u-boot level) What I see i=
s that
> > > > > > > u-boot gets stuck
> > > > > > > when bootefi bootmgr is invoqued. I can also reproduce the is=
sue with
> > > > > > > bootefi hello.
> > > > > > >
> > > > > > > =3D> run bootcmd
> > > > > > >   Scanning for bootflows in all bootdevs
> > > > > > >   Seq  Method       State   Uclass    Part  Name             =
         Filename
> > > > > > >   ---  -----------  ------  --------  ----  -----------------=
-------
> > > > > > > ----------------
> > > > > > >   Scanning global bootmeth 'efi_mgr':
> > > > > > > ( gets stuck here)
> > > > > > >
> > > > > > > or
> > > > > > >
> > > > > > > =3D> bootefi hello
> > > > > > > (gets stuck)
> > > > > > >
> > > > > > > To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck a=
nd bypass
> > > > > > > the error and go to Linux. My understanding is that
> > > > > > > CONFIG_EFI_MM_COMM_TEE is only required to read/write efi var=
iables at
> > > > > > > u-boot level but OPTEE is running the StandaloneMM service. A=
m I
> > > > > > > right?
> > > > > >
> > > > > > U-Boot has two ways of storing EFI variables [0] . You can eith=
er
> > > > > > store them in a file or the RPMB partition. The correct thing t=
o do,
> > > > > > since you want to use the RPMB, is enable CONFIG_EFI_MM_COMM_TE=
E. I am
> > > > > > not sure why the hand happens, but one thing we can improve is =
figure
> > > > > > out why it hangs and print a useful message.
> > > > > > There are a number of reasons that might lead to a failure. Is =
the
> > > > > > RPMB key programmed on your board? Have a look at this [1] in c=
ase it
> > > > > > helps
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > # tee-supplicant
> > > > > > > > > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open tru=
sted service
> > > > > > > > > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
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
> > > > > >
> > > > > > If I had to guess, OP-TEE doesn't store the variables in the RP=
MB, can
> > > > > > you compile it with a bit more debugging enabled?
> > > > > >
> > > > >
> > > > > Here is a log with CFG_TEE_CORE_LOG_LEVEL=3D4, CFG_TEE_CORE_DEBUG=
=3Dy and
> > > > > CFG_TEE_TA_LOG_LEVEL=3D4
> > > > >
> > > > > https://paste.centos.org/view/eed83a5b
> > > > >
> > > > > At the beginning of the log I see
> > > > >
> > > > > D/TC:0 0 check_ta_store:449 TA store: "REE"
> > > > >
> > > > > Which looks wrong to me as I built optee with:
> > > > >   CFG_REE_FS=3Dn
> > > > >   CFG_RPMB_FS_DEV_ID=3D0
> > > > >   CFG_RPMB_FS=3Dy
> > > >
> > > > Yes it does look wrong. Our compilation flags are
> > > > CFG_RPMB_FS=3Dy CFG_RPMB_FS_DEV_ID=3D0 CFG_RPMB_WRITE_KEY=3Dy
> > > > CFG_RPMB_TESTKEY=3Dy CFG_REE_FS=3Dn CFG_CORE_ARM64_PA_BITS=3D48
> > > > CFG_SCTLR_ALIGNMENT_CHECK=3Dn
> > > >
> > >
> > > Mine are very similar
> > >
> > > make CROSS_COMPILE=3D"$CC32" CROSS_COMPILE64=3D"$CC64" \
> > >     PLATFORM=3Dk3-j784s4 CFG_ARM64_core=3Dy CFG_CONSOLE_UART=3D0x8 \
> > >     CFG_RPMB_FS_DEV_ID=3D0 CFG_REE_FS=3Dn CFG_RPMB_FS=3Dy \
> > >     CFG_RPMB_WRITE_KEY=3Dy CFG_RPMB_TESTKEY=3Dy \
> > >     CFG_STMM_PATH=3DBL32_AP_MM.fd \
> > >     CFG_CORE_HEAP_SIZE=3D524288 CFG_CORE_DYN_SHM=3Dy CFG_SCTLR_ALIGNM=
ENT_CHECK=3Dn \
> > >     CFG_TEE_CORE_LOG_LEVEL=3D4 CFG_TEE_CORE_DEBUG=3Dy CFG_TEE_TA_LOG_=
LEVEL=3D4
> > >
> > > There is a difference with CFG_CORE_ARM64_PA_BITS=3D48 , my platform =
defines it to
> > >
> > >    core/arch/arm/plat-k3/conf.mk:$(call force,CFG_CORE_ARM64_PA_BITS,=
36)
> > >
> > > But I don't think this is the problem.
> > >
> > > > The testkey etc aren't required if your board has a way of reading =
the
> > > > RPMB key from a secure location -- in fact, using the testkey is no=
t
> > > > secure. Is the RPMB programmed on your board? Also can you make sur=
e
> > > > CFG_RPMB_FS_DEV_ID needs to be 0? How many sd interfaces your board
> > > > has?
> > >
> > > My board has two interfaces, an eMMC and a SD-card, 0 is indeed the
> > > eMMC and I'm using the testkey which I assume was programmed the firs=
t
> > > time I booted with all this. Unfortunately I lost the traces. But,
> > > optee_rpmb works. I.e:
> > >
> > >      =3D> optee_rpmb write test 1234
> > >      =3D> optee_rpmb read test 4
> > >      Read 4 bytes, value =3D 1234
> > >
> > >
> > > > IOW in U-Boot does 'mmc dev 0 && mmc info' print information for th=
e
> > > > RPMB partition?
> > > >
> > >
> > >     =3D> mmc dev 0
> > >     switch to partitions #0, OK
> > >     mmc0(part 0) is current device
> > >     =3D> mmc info
> > >     Device: mmc@4f80000
> > >     Manufacturer ID: 13
> > >     OEM: 4e
> > >     Name: G1M15L
> > >     Bus Speed: 200000000
> > >     Mode: HS400 (200MHz)
> > >     Rd Block Len: 512
> > >     MMC version 5.1
> > >     High Capacity: Yes
> > >     Capacity: 29.6 GiB
> > >     Bus Width: 8-bit DDR
> > >     Erase Group Size: 512 KiB
> > >     HC WP Group Size: 8 MiB
> > >     User Capacity: 29.6 GiB WRREL
> > >     Boot Capacity: 31.5 MiB ENH
> > >     RPMB Capacity: 4 MiB ENH
> > >     Boot area 0 is not write protected
> > >     Boot area 1 is not write protected
> > >     =3D> mmc list
> > >     mmc@4f80000: 0 (eMMC)
> > >     mmc@4fb0000: 1
> > >
> > > Any interaction with efi gives me the same result (printenv -e,
> > > efidebug, bootefi ...)
> >
> > Yes, that makes sense, because variables fail to initialize -- which
> > is a core part of bringing up the EFI subsystem.
> >
> > Can you recompile op-tee with CFG_RPMB_RESET_FAT and try again?
> >
>
> Unfortunately that didn't help, but I don't see this code being run.
> Who sets for the first place the uefi variables, is this u-boot
> writing them to the rpmb? or is optee itself?
>

I tried to compare the behaviour between optee_rpmb (works) and
efidebug (doesn't worrk). I see that the first thing optee_rpmb
command does is open a session against the TA application, something
that efidebug doesn't do, shouldn't efidebug do the same to access to
the rpmb device and read or write the efi variables?

=3D> optee_rpmb read test 4
D/TC:? 0 tee_ta_init_pseudo_ta_session:303 Lookup pseudo TA
023f8f1a-292a-432b-8fc4-de8471358067
D/TC:? 0 ldelf_load_ldelf:110 ldelf load address 0x40007000
D/LD:  ldelf:142 Loading TS 023f8f1a-292a-432b-8fc4-de8471358067
F/TC:? 0 trace_syscall:147 syscall #3 (syscall_get_property)
F/TC:? 0 trace_syscall:147 syscall #5 (syscall_open_ta_session)
D/TC:? 0 ldelf_syscall_open_bin:163 Lookup user TA ELF
023f8f1a-292a-432b-8fc4-de8471358067 (early TA)
D/TC:? 0 ldelf_syscall_open_bin:167 res=3D0
F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)
F/TC:? 0 read_compressed:178 1024 bytes
F/TC:? 0 read_compressed:178 1024 bytes
F/TC:? 0 read_compressed:178 1024 bytes
F/TC:? 0 read_compressed:178 1024 bytes
F/TC:? 0 trace_syscall:147 syscall #11 (syscall_mask_cancellation)
F/TC:? 0 trace_syscall:147 syscall #7 (syscall_invoke_ta_command)

=3D> efidebug query -bs -rt -nv
MMC: no card present
mmc_init: -123, time 2002
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



>
> > Thanks
> > /Ilias
> > >
> > > =3D> efidebug query -bs -rt -nv
> > > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
> > > D/TC:? 0 spm_handle_scall:859 Received FFA version
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > D/TC:? 0 spm_handle_scall:867 Received FFA direct request
> > > ... stuck here ... I need to reset the board
> > >
> > > Will continue to see if I can get more useful messages
> > >
> > > Thanks,
> > >   Enric
> > >
> > > > Thanks
> > > > /Ilias
> > > > >
> > > > > I'll try to add some more prints to verify if REE is used as a st=
ore
> > > > > system, I assume this should say something about RPMB. Am I right=
 with
> > > > > this?
> > > >
> > > >
> > > > >
> > > > > > > > >
> > > > > > > > > And tracing the function calls gives me that:
> > > > > > > > >
> > > > > > > > >       tee_stmm_efi_probe() {
> > > > > > > > >              tee_client_open_context() {
> > > > > > > > >                optee_get_version() {
> > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e5=
5800)
> > > > > > > > >                } (ret=3D0xd)
> > > > > > > > >                tee_ctx_match(); (ret=3D0x1)
> > > > > > > > >                optee_smc_open() {
> > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e5=
5800)
> > > > > > > > >                  optee_open() {
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                  } (ret=3D0x0)
> > > > > > > > >                } (ret=3D0x0)
> > > > > > > > >              } (ret=3D0xffff000004e71c80)
> > > > > > > > >              tee_client_open_session() {
> > > > > > > > >                optee_open_session() {
> > > > > > > > >                  tee_get_drvdata(); (ret=3D0xffff000002e5=
5800)
> > > > > > > > >                  optee_get_msg_arg() {
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff0000029=
09000)
> > > > > > > > >                  } (ret=3D0xffff000002909000)
> > > > > > > > >                  tee_session_calc_client_uuid(); (ret=3D0=
x0)
> > > > > > > > >                  optee_to_msg_param(); (ret=3D0x0)
> > > > > > > > >                  optee_smc_do_call_with_arg() {
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff0000029=
09000)
> > > > > > > > >                    tee_shm_get_va(); (ret=3D0xffff0000029=
09060)
> > > > > > > > >                    optee_cq_wait_init(); (ret=3D0xffff000=
002e55910)
> > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > > > > > > >      ... continues sending this forever ...
> > > > > > > > >      ... Hit ^C to stop recording ...
> > > > > > > > >                    tee_get_drvdata(); (ret=3D0xffff000002=
e55800)
> > > > > > > > >                    optee_smccc_smc() {
> > > > > > > > >
> > > > > > > > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.h=
tml#using-op-tee-for-efi-variables
> > > > > > > > >
> > > > > > > > > Thanks in advance,
> > > > > > > >
> > > > > > > > The most common problem with this is miscompiling the tee_s=
upplicant
> > > > > > > > application.
> > > > > > > > Since we don't know if the system has an RPMB, we emulate i=
t in the
> > > > > > > > tee_supplicant. How did you get the supplicant and can you =
check if it
> > > > > > > > was compiled with RPMB_EMU=3D0 or 1?
> > > > > > > >
> > > > > > >
> > > > > > > I'm using the tee-supplicant provided by the fedora package w=
hich is
> > > > > > > built with ` -DRPMB_EMU=3D0`, I think that's correct, right?
> > > > > > >
> > > > > >
> > > > > > Yes, this is correct. We fixed the Fedora package to compile th=
e
> > > > > > supplicant correctly a while back.
> > > > > >
> > > > > > [0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
> > > > > > [1] https://apalos.github.io/Protected%20UEFI%20variables%20wit=
h%20U-Boot.html#Protected%20UEFI%20variables%20with%20U-Boot
> > > > > >
> > > > > >
> > > > > > Regards
> > > > > > /Ilias
> > > > > > > Thanks,
> > > > > > >    Enric
> > > > > > >
> > > > > > > > Thanks
> > > > > > > > /Ilias
> > > > > > > >
> > > > > > > > >    Enric
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >


