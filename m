Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1368CD64076
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1E26MnGizRapo2n2N6bqp5svQaI3HCt3C2eCsi3AIQ=; b=JHmbHCzjgpRw30XYZnDLKS3zXF
	FCmy8O2P5FRBHLD+B4C6p/93bM5UENieLrtOtaXL8bfsZhg1vH0Z7NwbW4ASkdlOjCmP/XAhZ6dxs
	my5bE9TMblH2L5PxtfFxwiF2mjcyvvh+RlWY0TORK0+gCsVIj4fK6tR6vTrBFdoqaf56LC0F97n4X
	JDzqjX9NoN0QRHiu9sx1+t3iVA/d4y998RlPebxxGWUj7jfEeSLDppm4eaEeZUkRvpk/MOrqBXtZD
	BcYpQTZZ0sIaGWwCQhJVVd24XwohBk8oyuNr5eF6OkRQckcszlRxxEGefKt8uX16S1nTs1DOtxPcX
	qyVrXQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZTL-0000000CMSw-1zIY;
	Sat, 09 Nov 2024 00:37:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZOJ-0000000CLi2-1BEK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 00:31:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21116b187c4so23836075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 16:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731112310; x=1731717110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1E26MnGizRapo2n2N6bqp5svQaI3HCt3C2eCsi3AIQ=;
        b=WKVBDAAil/EiBre8fDgL1lfmzYbXlBYEi80TcF59aL1r/vbLcmVR+U8c68DvW4EBRC
         TDOuPdA8orJIpjvOeC00TntEIsIZXWracKAwLf2gWDPY6jUKWPRPkrHMxTVO5zb4f3lD
         3Qqpgfn5pxOt89cxHl7GZPV0VPWR0aEGA04YWj1MlQM5/PUx1knYODRt1sjqmKk/J/P/
         pzXzjgJVTEDegmCsgRzSX6SW+VxyDJQhuMnDvXamfmx6D1DEcwTXIj9f+DVKxMqv0rVn
         GbfEzxv1XrcH3lfrS+L4qiAzXFFzqJcZNJT/QefAebWcnf0hPgTpEyncbQq3PyURXywa
         pepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731112310; x=1731717110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1E26MnGizRapo2n2N6bqp5svQaI3HCt3C2eCsi3AIQ=;
        b=BVdLs70fu/yaj3M3L8UQzecLsLck8gcIES2m+qQa/9kdv4ebl5YKhak2kzv2/Q00Hc
         o1MC0CfhCFfZ49yW2DCXMW0uDJUMcBLJ+AOLJ0UNSWhw1RdSr9GYwQZ7GX8M3ukc6t08
         BZtGsjMtAdOVAM8CtbR7pgeNihzaBMWepSIiK1sgtIxcuXZmtan1HoXgdErp/99Nmc+9
         ziMvdpJ2lcbsT+dEIGbVdCcgyAUDn9uW8u2PWZcVHn0kVoFh9fvJbrDAZga2N10k8rNr
         fN49v5vRnbRlVOBbslnaoS4CjrTwID/FP9K+5mJxgeFdP1rzjaj75FThKi9UvntJ2GZt
         JPEA==
X-Forwarded-Encrypted: i=1; AJvYcCXbhJkBItKoqM5APPzW/neEg34cy62/1nYCCEVETgkMwk9yisyEWsorEELccbMfKzAUUGFySZMm4lKNBbKEn2nF@lists.infradead.org
X-Gm-Message-State: AOJu0YzeE5pisV7qv9cnjziWjikmLQTiDOoYR0Hyqw0IXc7gvhND5mwg
	bcO8qzXnBX1+xqg5UOQrbUmq0GhF0E8NgvmRp9IWBKasYLaJuPbOC8N8OssZbwUtNK6sHC/Q9dN
	KqdA23Bfo/7F+N73d+K5GhK/Lsn+clcwgazoIPA==
X-Google-Smtp-Source: AGHT+IHCHLh39cxBw5ufNm7dZo+CDQzWBDFzWuOIxiVp3gnbTUBNURR8pxRRy/13hfp6Af72Rhtnz9aRlZ+COJrcvI4=
X-Received: by 2002:a17:902:e747:b0:20c:e262:2560 with SMTP id
 d9443c01a7336-21183e4c8a3mr62876625ad.50.1731112310250; Fri, 08 Nov 2024
 16:31:50 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com> <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
In-Reply-To: <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Sat, 9 Nov 2024 00:31:14 +0000
Message-ID: <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241108_163151_394404_FE3A2612 
X-CRM114-Status: GOOD (  35.72  )
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

On Fri, 8 Nov 2024 at 23:11, Enric Balletbo i Serra <eballetb@redhat.com> w=
rote:
>
> Hi Ilias,
>
> Thanks for your quick answer.
>
> On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Enric,
> >
> > On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballetb@redhat.co=
m> wrote:
> > >
> > > Hi all,
> > >
> > > I'm looking for any advice/clue to help me to progress on enabling
> > > TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.
> > >
> > > I basically followed the steps described in u-boot documentation [1],
> > > I enabled some debugging messages but I think I'm at the point that
> > > the problem might be in the StandaloneMM application, and I'm not sur=
e
> > > how to debug it.
> > >
> > > What I see is that when I run the tee-supplicant daemon, it looks lik=
e
> > > the tee_client_open_session() call loops forever and the tee_stmm_efi
> > > driver never ends to probe.
> > >
> > > With debug enabled I got the following messages.
> >
> > I assume reading and storing variables already works in U-Boot right?
> >
>
> Reading and storing variables to the RPMB partition in U-Boot works,
> that's using the mmc rpmb command from u-boot,

Are you talking about env variables? Perhaps you store them in the mmc
and not the RPMB partition?
There's some information here [0]

> But setting
> CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar behaviour
> (although I'm not able to debug at u-boot level) What I see is that
> u-boot gets stuck
> when bootefi bootmgr is invoqued. I can also reproduce the issue with
> bootefi hello.
>
> =3D> run bootcmd
>   Scanning for bootflows in all bootdevs
>   Seq  Method       State   Uclass    Part  Name                      Fil=
ename
>   ---  -----------  ------  --------  ----  ------------------------
> ----------------
>   Scanning global bootmeth 'efi_mgr':
> ( gets stuck here)
>
> or
>
> =3D> bootefi hello
> (gets stuck)
>
> To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck and bypass
> the error and go to Linux. My understanding is that
> CONFIG_EFI_MM_COMM_TEE is only required to read/write efi variables at
> u-boot level but OPTEE is running the StandaloneMM service. Am I
> right?

U-Boot has two ways of storing EFI variables [0] . You can either
store them in a file or the RPMB partition. The correct thing to do,
since you want to use the RPMB, is enable CONFIG_EFI_MM_COMM_TEE. I am
not sure why the hand happens, but one thing we can improve is figure
out why it hangs and print a useful message.
There are a number of reasons that might lead to a failure. Is the
RPMB key programmed on your board? Have a look at this [1] in case it
helps

>
> > >
> > > # tee-supplicant
> > > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted service
> > > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
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

If I had to guess, OP-TEE doesn't store the variables in the RPMB, can
you compile it with a bit more debugging enabled?

> > >
> > > And tracing the function calls gives me that:
> > >
> > >       tee_stmm_efi_probe() {
> > >              tee_client_open_context() {
> > >                optee_get_version() {
> > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                } (ret=3D0xd)
> > >                tee_ctx_match(); (ret=3D0x1)
> > >                optee_smc_open() {
> > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                  optee_open() {
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                  } (ret=3D0x0)
> > >                } (ret=3D0x0)
> > >              } (ret=3D0xffff000004e71c80)
> > >              tee_client_open_session() {
> > >                optee_open_session() {
> > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                  optee_get_msg_arg() {
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > >                  } (ret=3D0xffff000002909000)
> > >                  tee_session_calc_client_uuid(); (ret=3D0x0)
> > >                  optee_to_msg_param(); (ret=3D0x0)
> > >                  optee_smc_do_call_with_arg() {
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > >                    tee_shm_get_va(); (ret=3D0xffff000002909060)
> > >                    optee_cq_wait_init(); (ret=3D0xffff000002e55910)
> > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > >      ... continues sending this forever ...
> > >      ... Hit ^C to stop recording ...
> > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > >                    optee_smccc_smc() {
> > >
> > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-op=
-tee-for-efi-variables
> > >
> > > Thanks in advance,
> >
> > The most common problem with this is miscompiling the tee_supplicant
> > application.
> > Since we don't know if the system has an RPMB, we emulate it in the
> > tee_supplicant. How did you get the supplicant and can you check if it
> > was compiled with RPMB_EMU=3D0 or 1?
> >
>
> I'm using the tee-supplicant provided by the fedora package which is
> built with ` -DRPMB_EMU=3D0`, I think that's correct, right?
>

Yes, this is correct. We fixed the Fedora package to compile the
supplicant correctly a while back.

[0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
[1] https://apalos.github.io/Protected%20UEFI%20variables%20with%20U-Boot.h=
tml#Protected%20UEFI%20variables%20with%20U-Boot


Regards
/Ilias
> Thanks,
>    Enric
>
> > Thanks
> > /Ilias
> >
> > >    Enric
> > >
> >
>

