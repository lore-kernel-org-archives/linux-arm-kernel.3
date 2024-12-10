Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8BAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FDyzQaVBJmBdWgi+flPumHn5fgNwsPGMW4DJuw0nzM=; b=uGJiLOIGxlQq8aNiTC7ATjRk0k
	01K2/XeggoGPhZ37PhSksKSbUKh1aesvVUbzfGyQCWT3Q6wo60hMtWOG0dEQd2JpInkTnOrZmOevp
	4a3TqYeg1JKnM4T0AULk8us88Cn/MCW0zo1EGGBqEEAL9yR5axPAS2T/azufeWWQWnbPvY4PwChcU
	tw49rKXTAW+zuO11BGb7/j74TcfSO3ghtlu8Jv5dlxVSQ4tMbACdDTi1ZrjYxiM78ZQwm6G49Eulu
	LrzIK9YlRNC45v0hyANr0yncaMmHe1M1HGMi9yzXQOe5/zU5ScNp8eFizJq+ehol2NVi45oZvG1ow
	k74+8UyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwk2-0000000Ay1A-3jRq;
	Tue, 10 Dec 2024 09:41:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwiz-0000000Axpw-3HvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:40:14 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4675936f333so102431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 01:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733823611; x=1734428411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FDyzQaVBJmBdWgi+flPumHn5fgNwsPGMW4DJuw0nzM=;
        b=hJ3Oo/9TWsqzynZpErZPIe1io8uEyoRynstcfsG/3WOWDbRB7tBtQqpPOQgzTQs4az
         UjD3OUMBjhkYWWDBE3wRl4oeMNj1ic7jZrlMPKStlldhamyIv/W7nixd7ysppKuzdDD4
         NCrQaCPaI0L/tG4RZYT8iKCfaEl2eXvCuGuIQBZek9CXiYMVmA4yeVd9DTG4fscIDLor
         Ok3DOFqRBI9scTJfHsRTmM51HCE/h8uH1aYfwjLKwujE+du28aqHRJwdt5DlSECDQNY+
         yo1oNdurWyZjlRljri4vWvuyeq1s71ow3LYTh12NFBAKHhFyVdG6DQZ+rhiHIsOCLaJc
         zPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823611; x=1734428411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FDyzQaVBJmBdWgi+flPumHn5fgNwsPGMW4DJuw0nzM=;
        b=tKXxPGc15FMrthc3K91Zw3wHkIvb98G+asmocekcbvwDjGuY7y/BweM7Z61eO0eFnZ
         Eyxqqec+oQX2GsFUq9XjAfMbS85ZuGxkGzbAl3kzeNtve5ZMDTvnruwHbBGlrhbGEiZM
         uR9A+iTWXsGbk66t7I/+q++klKgFUVyCptYik1cLIp0YyJyWLUddQVsLWIoaQ9SSj8Sv
         YLLfA9GwyqM7Nvo/i6Sy7IMfiQlAKD7ApFV8wE1iTNNFnwNU/buPyPWB+I/wbs9OrUx7
         5FWDPmdr8sJxM2hCS3MzyW091JzNtlBOh73c2r3bnLia2vxPjUiXNWfU4GR2dNodRk59
         e2xg==
X-Forwarded-Encrypted: i=1; AJvYcCVf4ClSVQwm/IqcuavI0m8AxERexq+T4gkmV3Z0f3+eTdlxg8D/E/BM7tSHwIeCTXLqs7JSltB1xlH2jcc2yTKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbXPIIT8SoboJOUKXvEi8a0znSSJx6BiYPitztE7QbIoC15sM
	Eu6tVkCyf/ijjxwqX9DEfp6G4T0uMhbe1PcAnrb49vooYmgxEH3+Ny+bMIHg2jgo8Zc3MF684em
	neOcNb7AjLskkz2A6hjZM5R9IqLRRLqjXjGXK
X-Gm-Gg: ASbGncsnIDFK/P/yQNHjmLf4LSOiuOzI2f1zADw3qxaNT41jD9DrO8qPPqaFId8ViXQ
	cOC5syaK2WqlycKgA79WlOGkWmA7EhE56oA==
X-Google-Smtp-Source: AGHT+IH7V4UKeLrvjNkOyGEOEUYHbY8QYbuKts1kktkzSbiMR6UVtyJWD2Q0aBvHWwJs5sF1JPgPGTYIeXHNZCK6L4o=
X-Received: by 2002:a05:622a:5186:b0:466:8a29:9de7 with SMTP id
 d75a77b69052e-46776158637mr3576401cf.12.1733823611360; Tue, 10 Dec 2024
 01:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20241202140604.422235-1-smostafa@google.com> <20241202140604.422235-2-smostafa@google.com>
 <20241209235804.GA14069@willie-the-truck>
In-Reply-To: <20241209235804.GA14069@willie-the-truck>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 10 Dec 2024 09:40:00 +0000
Message-ID: <CAFgf54peN1fGOpr4Q4eihRTYFi1prT3LaQvH-K5x5KO50gmacw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iommu/io-pgtable-arm: Fix stage-2 concatenation
 with 16K
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com, joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014013_840828_ADDBE94D 
X-CRM114-Status: GOOD (  24.35  )
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

On Mon, Dec 9, 2024 at 11:58=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Dec 02, 2024 at 02:06:03PM +0000, Mostafa Saleh wrote:
> > At the moment, io-pgtable-arm uses concatenation only if it is
> > possible at level 0, which misses a case where concatenation is
> > mandatory at level 1 according to R_SRKBC in Arm spec DDI0487 K.a.
> >
> > Also, that means concatenation can be used when not mandated,
> > contradicting the comment on the code. However, these cases can only
> > happen if the SMMUv3 driver is changed to use ias !=3D oas for stage-2.
> >
> > This patch re-writes the code to use concatenation only if mandatory,
> > fixing the missing case for level-1 and granule 16K with PA =3D 40 bits=
.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 45 +++++++++++++++++++++++++---------
> >  1 file changed, 33 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index 6b9bb58a414f..0055876b3527 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -223,6 +223,33 @@ static inline int arm_lpae_max_entries(int i, stru=
ct arm_lpae_io_pgtable *data)
> >       return ptes_per_table - (i & (ptes_per_table - 1));
> >  }
> >
> > +/*
> > + * Check if concatenated PGDs are mandatory according to Arm DDI0487 (=
K.a)
> > + * 1) R_DXBSH: For 16KB, and 48-bit input size, use level 1 instead of=
 0.
> > + * 2) R_SRKBC: After de-ciphering the table for PA size and valid init=
ial lookup
> > + *   a) 40 bits PA size with 4K: use level 1 instead of level 0 (2 tab=
les for ias =3D oas)
> > + *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 t=
ables for ias =3D oas)
> > + *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tab=
les for ias =3D oas)
> > + *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 ta=
bles for ias =3D oas)
> > + */
> > +static inline bool arm_lpae_concat_mandatory(struct arm_lpae_io_pgtabl=
e *data)
> > +{
> > +     unsigned int ias =3D data->iop.cfg.ias;
> > +     unsigned int oas =3D data->iop.cfg.oas;
> > +
> > +     /* Covers 1  and 2.d */
> > +     if ((ARM_LPAE_GRANULE(data) =3D=3D SZ_16K) && (data->start_level =
=3D=3D 0))
> > +             return (oas =3D=3D 48) || (ias =3D 48);
>
> I'm guessing the second disjunct here should be:
>
>         (ias =3D=3D 48);
>

Ouch, my bad.

> I'll make that change when applying...
>
> Will

