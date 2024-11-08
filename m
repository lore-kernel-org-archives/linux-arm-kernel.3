Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB16D6408B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 21:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRqlXjowIXjJU/wOruO4EV/OIEg8cJDYqC1tZv9nmzc=; b=fgeUWfOFqi6hO69EHqpysRqMqf
	nsE7s9AvOCuQ8/rQN9piWgptyGU/qkKy6bggPCsoabl5WahGuArsTKl34oi5RJnVBgsWB4hDkGMmi
	nWQ4CxqX952wrgokCKHURidS7VXXFLHdWYbDmlLq35hoqngCLC8hnrhwBL+/jZCKGzaZ404ZslLzu
	VLPCTlCwP1JI2+hYBTAV3s5UCRNLr98k7Bwe91yTI89nZSye3qUCkMyc0pA5XygN6q0UwCT+nPOxE
	5KZe9BfhAVcLqu5AMUw6mOM4GTeAiyIlWQmldI1zOp4fMi7kSMXv1V1COf5kZqZ0/qfEG+jfyYbM1
	1t1qMhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9WHz-0000000C0NY-1skz;
	Fri, 08 Nov 2024 21:13:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9WGB-0000000C06N-1Co1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 21:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731100273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nRqlXjowIXjJU/wOruO4EV/OIEg8cJDYqC1tZv9nmzc=;
	b=NnVyVW/S2aZe0v/ymdhWAV9VIdQQDnyJc/FEM+c3tIonK5SdEBoHXgxgoXQxr/+ulHdQ5x
	mP555UWwJxzGrmW36pKPm0xA0hLCwwNpwtC0+44TDddDC6e9dwx4qWcdirVxLRo/ZhPMQt
	J+3tGb1MUWDpRpz1jAnZ9OgPDNFG9bo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-SbCf8LlANlGjyLV2_L3AFg-1; Fri, 08 Nov 2024 16:11:10 -0500
X-MC-Unique: SbCf8LlANlGjyLV2_L3AFg-1
X-Mimecast-MFC-AGG-ID: SbCf8LlANlGjyLV2_L3AFg
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3df19f2433cso281571b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 13:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731100269; x=1731705069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRqlXjowIXjJU/wOruO4EV/OIEg8cJDYqC1tZv9nmzc=;
        b=Br0nQvbxdynd8lF6eOrzxHzVaUvBrVpE6B0gXUHqK5mHGuO99/TeX1Q0mo1Ua3ZrCI
         vzgcW7KyTDb+bFsMVWUQAA5LZaP+neQEOgNz48UZfqPIviUBXnRflzC4VON6xrMdbkdn
         6jMBU39b/cFSj8BwjVm5wU6Bhk41SQkCMy8ZQX3L0LqqiysbW1qOH9Hz9zGkOe1/3iq8
         JH8p+ZWYzZN3u0z9z/mrKxZGYSceyL2tSp5hbzwXh3NG2BkYnv1teqU34NfmQ2nukffx
         yaxctZ60UE+Hqkggifburk7tHAQ5JEwV4ygbGQgdUBHVLDUL8dIG5M/utwWn1D5lIl2B
         QbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqXCxpKfCcWh+YpY2lBQ+rZqzDslah+UjntiMXkzcFp0MCjX+pattMBa520VnYmdIMLqcIyiJ1lLaY7EPZFO2p@lists.infradead.org
X-Gm-Message-State: AOJu0YxYYPHclWyTXWRFM2rb+OfRsvuPcCtSWjQT6iAT60Wn0KEI6/GR
	RUjEyS8pU7rYAAWkVyH8lFJNccnf38usgE69y9+KS6lo33XlSoG/Udb2kU/GqLe7Z4seIheKLVf
	4X8rpvgdWpWp3iWqUuoRywnWlFOa9sSqDe4UbLU4+eciIRPEOj3Qh/0PmQoHPmbjR5Mt+hLX7NL
	mKdMyto9CxjFKgs+5/BvvqsU3UqphS9nfopSOjdszNH/pkbo8=
X-Received: by 2002:a4a:c70f:0:b0:5ec:1ed0:3849 with SMTP id 006d021491bc7-5ee57c40c98mr435419eaf.1.1731100269610;
        Fri, 08 Nov 2024 13:11:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqh380fjLkQ2+6qUYw/LIIxhyTMmTEiMJpEsuaSUMLQmk08/Vgv54D+6rC2jQTKpUOPaljEGzbAInyxOPQtcs=
X-Received: by 2002:a4a:c70f:0:b0:5ec:1ed0:3849 with SMTP id
 006d021491bc7-5ee57c40c98mr435405eaf.1.1731100269214; Fri, 08 Nov 2024
 13:11:09 -0800 (PST)
MIME-Version: 1.0
References: <CALE0LRvJ-n77oU=O9__NdSLw2v33zMK+WYkn2LcwWMwHCbohQw@mail.gmail.com>
 <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
In-Reply-To: <CAC_iWjJEXU+dodjvWQYM9ohPa3P2p0bFG=exGoi-iYFrLLbCTA@mail.gmail.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Fri, 8 Nov 2024 22:10:58 +0100
Message-ID: <CALE0LRtUz8hd4pdR9sX2Sb6tOn=K4wkRnGG9B7f72qU8JFQSYQ@mail.gmail.com>
Subject: Re: optee-based efi runtime variable service on TI j784s4 platforms
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Manorit Chawdhry <m-chawdhry@ti.com>, 
	Udit Kumar <u-kumar1@ti.com>, "Menon, Nishanth" <nm@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 54ZktipW4dEN59SCPnMf_pyFmcLvqG1bqd_rF5nwTs4_1731100270
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_131115_433967_59879AE6 
X-CRM114-Status: GOOD (  28.32  )
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

Thanks for your quick answer.

On Fri, Nov 8, 2024 at 4:48=E2=80=AFPM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Enric,
>
> On Fri, 8 Nov 2024 at 12:26, Enric Balletbo i Serra <eballetb@redhat.com>=
 wrote:
> >
> > Hi all,
> >
> > I'm looking for any advice/clue to help me to progress on enabling
> > TEE-base EFI Runtime Variable Service on TI a j784s4 platforms.
> >
> > I basically followed the steps described in u-boot documentation [1],
> > I enabled some debugging messages but I think I'm at the point that
> > the problem might be in the StandaloneMM application, and I'm not sure
> > how to debug it.
> >
> > What I see is that when I run the tee-supplicant daemon, it looks like
> > the tee_client_open_session() call loops forever and the tee_stmm_efi
> > driver never ends to probe.
> >
> > With debug enabled I got the following messages.
>
> I assume reading and storing variables already works in U-Boot right?
>

Reading and storing variables to the RPMB partition in U-Boot works,
that's using the mmc rpmb command from u-boot, But setting
CONFIG_EFI_MM_COMM_TEE=3Dy in u-boot I end with a similar behaviour
(although I'm not able to debug at u-boot level) What I see is that
u-boot gets stuck
when bootefi bootmgr is invoqued. I can also reproduce the issue with
bootefi hello.

=3D> run bootcmd
  Scanning for bootflows in all bootdevs
  Seq  Method       State   Uclass    Part  Name                      Filen=
ame
  ---  -----------  ------  --------  ----  ------------------------
----------------
  Scanning global bootmeth 'efi_mgr':
( gets stuck here)

or

=3D> bootefi hello
(gets stuck)

To debug I disabled CONFIG_EFI_MM_COMM_TEE to not get stuck and bypass
the error and go to Linux. My understanding is that
CONFIG_EFI_MM_COMM_TEE is only required to read/write efi variables at
u-boot level but OPTEE is running the StandaloneMM service. Am I
right?

> >
> > # tee-supplicant
> > D/TC:? 0 tee_ta_init_session_with_context:557 Re-open trusted service
> > 7011a688-ddde-4053-a5a9-7b3c4ddf13b8
> > D/TC:? 0 load_stmm:297 stmm load address 0x40004000
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
> >
> > And tracing the function calls gives me that:
> >
> >       tee_stmm_efi_probe() {
> >              tee_client_open_context() {
> >                optee_get_version() {
> >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                } (ret=3D0xd)
> >                tee_ctx_match(); (ret=3D0x1)
> >                optee_smc_open() {
> >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                  optee_open() {
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                  } (ret=3D0x0)
> >                } (ret=3D0x0)
> >              } (ret=3D0xffff000004e71c80)
> >              tee_client_open_session() {
> >                optee_open_session() {
> >                  tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                  optee_get_msg_arg() {
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> >                  } (ret=3D0xffff000002909000)
> >                  tee_session_calc_client_uuid(); (ret=3D0x0)
> >                  optee_to_msg_param(); (ret=3D0x0)
> >                  optee_smc_do_call_with_arg() {
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    tee_shm_get_va(); (ret=3D0xffff000002909000)
> >                    tee_shm_get_va(); (ret=3D0xffff000002909060)
> >                    optee_cq_wait_init(); (ret=3D0xffff000002e55910)
> >                    optee_smccc_smc(); (ret=3D0xffff0004)
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    optee_smccc_smc(); (ret=3D0xffff0004)
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    optee_smccc_smc(); (ret=3D0xffff0004)
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    optee_smccc_smc(); (ret=3D0xffff0004)
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    optee_smccc_smc(); (ret=3D0xffff0004)
> >      ... continues sending this forever ...
> >      ... Hit ^C to stop recording ...
> >                    tee_get_drvdata(); (ret=3D0xffff000002e55800)
> >                    optee_smccc_smc() {
> >
> > [1] https://docs.u-boot.org/en/latest/develop/uefi/uefi.html#using-op-t=
ee-for-efi-variables
> >
> > Thanks in advance,
>
> The most common problem with this is miscompiling the tee_supplicant
> application.
> Since we don't know if the system has an RPMB, we emulate it in the
> tee_supplicant. How did you get the supplicant and can you check if it
> was compiled with RPMB_EMU=3D0 or 1?
>

I'm using the tee-supplicant provided by the fedora package which is
built with ` -DRPMB_EMU=3D0`, I think that's correct, right?

Thanks,
   Enric

> Thanks
> /Ilias
>
> >    Enric
> >
>


