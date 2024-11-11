Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A674D5E140
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=731nUNUH56RkNe1YrJYqN6ub2oea0yPftrA68rs2+yI=; b=uQOwlmbaMP0x2wPMTM6Yw80wSk
	6ijKuq+KagvDwIjMznVCc/vT7UsW6uABTsGwY3HtW3jVTvBsmVpgRdBF/scfiBh0w2eoD2XzMtolf
	o21V/tZQprvMqKfhHwGH8kzrGXXD2DoD7MbSczz5aG1VvHcJJTWwfkMMzyiqaj44H8niWAJ8+FmJZ
	DSCQTc6gQ1VI90fYoGjh8DeYpjX6o/iYqoxTv3xPlAyumIT9KA6hF8gUv2X5RYW4PuorcpoVdPHGv
	drqz6/rTyAu4or3Z5bxrcb6e3S95+brE3ATX0izbxQSibO3drTitmrJ7vFlLhPy6Rpnd+Snq+0Mc0
	D/hV1Vdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPhH-0000000GoGP-0xIP;
	Mon, 11 Nov 2024 08:22:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPfT-0000000Go3d-1Qid
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731313260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=731nUNUH56RkNe1YrJYqN6ub2oea0yPftrA68rs2+yI=;
	b=RRwprxxPAxfnJBRDE+HEGa7UknB7JtGh3jitzwU+FK2+WCvlQYAddGLIsqcZ4e8xV31w5g
	ZHYKGX7E9bWsq7ugO3xLX5KYrp77ZRdPhaFyp93QkHRORrfiDZqqthk5sPow/RN+7Pm+hl
	hu13+bjU+fjZMd098LP/i9utetFBj8k=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-fc4EKxxBOAineCHr0AV2CA-1; Mon, 11 Nov 2024 03:20:58 -0500
X-MC-Unique: fc4EKxxBOAineCHr0AV2CA-1
X-Mimecast-MFC-AGG-ID: fc4EKxxBOAineCHr0AV2CA
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7180d9a3693so886377a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731313258; x=1731918058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=731nUNUH56RkNe1YrJYqN6ub2oea0yPftrA68rs2+yI=;
        b=azdqvC3nnH0v3lggA1gOqHdQVZ27Xth3JBkzI7EyvVClqg+ajMvhx7DHv8YYXPW6U5
         HbjvvJJb6qBivrMrG1zmY1Nz/2+GDCmRO+J1QDXzXBIMNtskE/sHlylSEbVSUfcFTgfb
         qVT0TfAGhoHQfmzvVf5KMH8E1bPoPizwq3GnlwAYB1Py3dX6cRQAQhq0UZ/b2aAhkhsi
         UK7qpzwgYQsIXB2JsJIIZkb23PjoCtUNLjmtCLW5AqGfZfK2Nsl7IUsIMt6YcaFbce1C
         8PC/Q0mrbjSgvHYFPgb8xDR915qEP9/V2xwrVRxS/chhAz1lMENLkl92Zuy9uETR13ra
         yd9g==
X-Forwarded-Encrypted: i=1; AJvYcCWBFeGdoqH6kIhO0nlxIwnQPnf8zfqLayS9TAFIf+KMDduiZ6nrK3I+0lMekvpn89tVUhYatBR4ux8cJU1duaTx@lists.infradead.org
X-Gm-Message-State: AOJu0YxKiWPEqJrR1BEJEEZ3Ky5dO5hpOM8ExcpwNm9TnGj9fR6CFVG/
	IO4Lnt2ZAL44O0HMbZ8PgEdPVg1g8ztNkNBE6H+gY4XqytIjpShXIlrVLS0+kHTQ2/ZiXfIz49x
	MIFhc1kofG5zKEDg9w1oR7W5tYZvzEGWH+jZXXom3gFkAt4j9Tv/cE1AyBiWj3SlMY0K+/5MOow
	AeOof8GNCRLEoQnE9HsOEE8+7YgnH4ViwmCJCKd8Bs7QINnmw=
X-Received: by 2002:a05:6808:159b:b0:3e7:5b5f:b287 with SMTP id 5614622812f47-3e794627395mr2705879b6e.2.1731313257981;
        Mon, 11 Nov 2024 00:20:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnEFp6/9FBZIbouIExDE3KA6MzIaSOVyXssNYKMt6oqF3c+m/uBwhrK59Jz1TWkrqwgPbdS/q5TsC6YgHvtmU=
X-Received: by 2002:a05:6808:159b:b0:3e7:5b5f:b287 with SMTP id
 5614622812f47-3e794627395mr2705872b6e.2.1731313257637; Mon, 11 Nov 2024
 00:20:57 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
 <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com> <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
In-Reply-To: <CAC_iWjJLSSTO0Ca7rgOWAHfWzbkBkKHkQedRUbcwsoU0dtrsGA@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 11 Nov 2024 09:20:46 +0100
Message-ID: <CALE0LRvN3tYgWig1XnCiAZvdzE8x=cdLanGxbUvpPr5nfexSPQ@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pbBoSKGj3e1Pgt90XGceX-113MKqEyrJk4HoM_BeW-o_1731313258
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_002103_481419_99D89742 
X-CRM114-Status: GOOD (  43.58  )
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

Hi Ilias,

On Sat, Nov 9, 2024 at 1:31=E2=80=AFAM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Fri, 8 Nov 2024 at 23:11, Enric Balletbo i Serra <eballetb@redhat.com>=
 wrote:
> >
> > Hi Ilias,
> >
> > Thanks for your quick answer.
> >
> > On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
> > <ilias.apalodimas@linaro.org> wrote:
> > >
> > > Hi Enric,
> > >
> > > On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballetb@redhat.=
com> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I'm looking for any advice/clue to help me to progress on enabling
> > > > TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.
> > > >
> > > > I basically followed the steps described in u-boot documentation [1=
],
> > > > I enabled some debugging messages but I think I'm at the point that
> > > > the problem might be in the StandaloneMM application, and I'm not s=
ure
> > > > how to debug it.
> > > >
> > > > What I see is that when I run the tee-supplicant daemon, it looks l=
ike
> > > > the tee_client_open_session() call loops forever and the tee_stmm_e=
fi
> > > > driver never ends to probe.
> > > >
> > > > With debug enabled I got the following messages.
> > >
> > > I assume reading and storing variables already works in U-Boot right?
> > >
> >
> > Reading and storing variables to the RPMB partition in U-Boot works,
> > that's using the mmc rpmb command from u-boot,
>
> Are you talking about env variables? Perhaps you store them in the mmc
> and not the RPMB partition?
> There's some information here [0]
>
> > But setting
> > CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar behaviour
> > (although I'm not able to debug at u-boot level) What I see is that
> > u-boot gets stuck
> > when bootefi bootmgr is invoqued. I can also reproduce the issue with
> > bootefi hello.
> >
> > =3D> run bootcmd
> >   Scanning for bootflows in all bootdevs
> >   Seq  Method       State   Uclass    Part  Name                      F=
ilename
> >   ---  -----------  ------  --------  ----  ------------------------
> > ----------------
> >   Scanning global bootmeth 'efi_mgr':
> > ( gets stuck here)
> >
> > or
> >
> > =3D> bootefi hello
> > (gets stuck)
> >
> > To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck and bypass
> > the error and go to Linux. My understanding is that
> > CONFIG_EFI_MM_COMM_TEE is only required to read/write efi variables at
> > u-boot level but OPTEE is running the StandaloneMM service. Am I
> > right?
>
> U-Boot has two ways of storing EFI variables [0] . You can either
> store them in a file or the RPMB partition. The correct thing to do,
> since you want to use the RPMB, is enable CONFIG_EFI_MM_COMM_TEE. I am
> not sure why the hand happens, but one thing we can improve is figure
> out why it hangs and print a useful message.
> There are a number of reasons that might lead to a failure. Is the
> RPMB key programmed on your board? Have a look at this [1] in case it
> helps
>
> >
> > > >
> > > > # tee-supplicant
> > > > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted servi=
ce
> > > > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
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
>
> If I had to guess, OP-TEE doesn't store the variables in the RPMB, can
> you compile it with a bit more debugging enabled?
>

Here is a log with CFG_TEE_CORE_LOG_LEVEL=3D4, CFG_TEE_CORE_DEBUG=3Dy and
CFG_TEE_TA_LOG_LEVEL=3D4

https://paste.centos.org/view/eed83a5b

At the beginning of the log I see

D/TC:0 0 check_ta_store:449 TA store: "REE"

Which looks wrong to me as I built optee with:
  CFG_REE_FS=3Dn
  CFG_RPMB_FS_DEV_ID=3D0
  CFG_RPMB_FS=3Dy

I'll try to add some more prints to verify if REE is used as a store
system, I assume this should say something about RPMB. Am I right with
this?

> > > >
> > > > And tracing the function calls gives me that:
> > > >
> > > >       tee_stmm_efi_probe() {
> > > >              tee_client_open_context() {
> > > >                optee_get_version() {
> > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                } (ret=3D0xd)
> > > >                tee_ctx_match(); (ret=3D0x1)
> > > >                optee_smc_open() {
> > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                  optee_open() {
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                  } (ret=3D0x0)
> > > >                } (ret=3D0x0)
> > > >              } (ret=3D0xffff000004e71c80)
> > > >              tee_client_open_session() {
> > > >                optee_open_session() {
> > > >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                  optee_get_msg_arg() {
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > > >                  } (ret=3D0xffff000002909000)
> > > >                  tee_session_calc_client_uuid(); (ret=3D0x0)
> > > >                  optee_to_msg_param(); (ret=3D0x0)
> > > >                  optee_smc_do_call_with_arg() {
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> > > >                    tee_shm_get_va(); (ret=3D0xffff000002909060)
> > > >                    optee_cq_wait_init(); (ret=3D0xffff000002e55910)
> > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    optee_smccc_smc(); (ret=3D0xffff0004)
> > > >      ... continues sending this forever ...
> > > >      ... Hit ^C to stop recording ...
> > > >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> > > >                    optee_smccc_smc() {
> > > >
> > > > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-=
op-tee-for-efi-variables
> > > >
> > > > Thanks in advance,
> > >
> > > The most common problem with this is miscompiling the tee_supplicant
> > > application.
> > > Since we don't know if the system has an RPMB, we emulate it in the
> > > tee_supplicant. How did you get the supplicant and can you check if i=
t
> > > was compiled with RPMB_EMU=3D0 or 1?
> > >
> >
> > I'm using the tee-supplicant provided by the fedora package which is
> > built with ` -DRPMB_EMU=3D0`, I think that's correct, right?
> >
>
> Yes, this is correct. We fixed the Fedora package to compile the
> supplicant correctly a while back.
>
> [0] https://www.linaro.org/blog/uefi-secureboot-in-u-boot/
> [1] https://apalos.github.io/Protected%20UEFI%20variables%20with%20U-Boot=
.html#Protected%20UEFI%20variables%20with%20U-Boot
>
>
> Regards
> /Ilias
> > Thanks,
> >    Enric
> >
> > > Thanks
> > > /Ilias
> > >
> > > >    Enric
> > > >
> > >
> >
>


