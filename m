Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA493CF538B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=; b=zqGABayc0vL+yW9fbps/JcFhcO
	MaeArPJ9PzAXszO2MYjHmfBSrI+bj2iG4SGK6LkATeHYmVK4D1raXh2IXVfclUuc/K0DLFAICu2HO
	2gtN4bVou5nwGVWAOBBJ+1/KUW+hJaxrPjDJYcannHTYZmSyKoqcV827VhhMUPWhIrEkR6kfd3lvr
	c/1jgihouzJKhuQSehMyectGRDLg2Jg9PMvWkugMbz2fmeQ5fZfqlgnVo2jb4f1JNssKlplu6cSYp
	sRQgLBCcCrEUpHvrwQxczcLLAQf3T6oo6B6Q10evxrQgdxmy2HWfzTMRfcQC+pVc23RSO9CKY/1uk
	w/U3jVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bkD-0000000EbJE-12Zx;
	Wed, 23 Oct 2024 13:49:49 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bif-0000000Eb0y-2QYI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 13:48:15 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-84fc0212a60so1791903241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729691291; x=1730296091; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=;
        b=B9gZ0yvy//Kqx623XAtiYbYEkAr0d8LLJPbWmqnXYe4ZydXj2UQV1XkW/w55oRIf1i
         a/Ep9or27qJduek1FIIlsg/a1NdZ9aapI8UchSstqFqxHhJPdI9gOG8YeLux/7IviXGO
         lJiGZ43I2OU+JwqtFyBYkvWe/Jhx5aqPqyDgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691291; x=1730296091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1ErG2T9UQjEKEnbXbgxig/MiNVygt+6QYl0dpxRA+w=;
        b=JG9SVoXqpaSkotdb58HriidIB/hdwlvop0fhP8mH/tab+k4xcK0fP5caxW9KTxKf88
         lbY6WRD38pZcifjsX6o5pAo83NQFddy9/xW17tdX0VZ7VUyecSi2/U5/hLrQLbMY2nyd
         M2VfLNjGTNRVivpDLhMPI4sYCq6IV23JC46nRUnM17dVrFCZgjwVBlq/N4smfHARwrvW
         UCiV4Pz0oWH7cBD6RTteXa+Oi4A0krrIO5yKIiap6dyeUvOSMVmVu5EaW1VSwH2X7zrg
         tYr7XLA9WVYXDV4qRtO69tDBY7sV84tAcELyJlExUiHogXi87drFV1lUjCSaPdGfc+EB
         20Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVLl6gQMXIuIGNQ8aqjeE6JOW+69iJxDu8HcxOyfqwbK9maiWjnbUwc9jnqccbTl1LgyerRgm4hhfnejoaGtAY2@lists.infradead.org
X-Gm-Message-State: AOJu0YxF7baciQxoDOKqfv5GYPYoxlIZKCTC3DEOA8+WzREZbuzx8sfT
	e0ne31xqKtq1yBCZd8v8kqMWyWJo2pXmmuow63KrfGoKwKBkaANRv8+VS5j/ji2Cq1VwoAZDrql
	Apw==
X-Google-Smtp-Source: AGHT+IEIr09SXicXd3ggn+6UZwHKcUlnDsf30cufHAMhwEdk4BVI4wZ3FOGM7WCoVwy6w7Rw73K2PA==
X-Received: by 2002:a05:6122:65a2:b0:50d:85c8:af3e with SMTP id 71dfb90a1353d-50fd00c1f87mr2987107e0c.3.1729691291492;
        Wed, 23 Oct 2024 06:48:11 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50e19e4eb07sm1043949e0c.13.2024.10.23.06.48.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 06:48:10 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-84fe454176bso2201939241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 06:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfU/rPpujYWmtLODtfAn0AEGHpTz63305Q+ss9Dg24SiCcJehypv1lX4NhVD0soqJYflmrDHdY6W+BucnGce8P@lists.infradead.org
X-Received: by 2002:a05:6122:513:b0:50a:d1e3:82f7 with SMTP id
 71dfb90a1353d-50fd031e55fmr3184053e0c.8.1729691290235; Wed, 23 Oct 2024
 06:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241023102059.512352-1-fshao@chromium.org> <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
 <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
In-Reply-To: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 23 Oct 2024 21:47:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng=ZLB+vB=kNywLGMdeN1RRted0j6d-fC9ANoyu=ni3Mg@mail.gmail.com>
Message-ID: <CAC=S1ng=ZLB+vB=kNywLGMdeN1RRted0j6d-fC9ANoyu=ni3Mg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_064813_629187_3C14F369 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Oct 23, 2024 at 8:03=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Oct 23, 2024 at 6:40=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 23/10/24 12:19, Fei Shao ha scritto:
> > > Fix two minor issues in the comments.
> > >
> > > 1. We balance VSRAM voltage based on the target VGPU voltage, so the
> > >     comment likely refers to VGPU.
> >
> > Function `mediatek_regulator_balance_voltage()` refers, as stated in th=
e comment
> > located at the top of its signature, to "GPU<->SRAM" voltages relations=
hips.
> >
> > So, we're taking into consideration only two regulators:
> >                    VGPU and VSRAM
> >
> > The first comment says:
> > "If we're asked to set a voltage (implicit: to VGPU) less than VSRAM mi=
n_uV[...]"
> >
> > ...so, I think that you've misunderstood what the comment says :-)
>
> Let me make sure we're on the same page - VGPU never goes higher than
> VSRAM (VGPU <=3D VSRAM), is that correct?
>
> [ min VGPU, max VGPU ] ... spread ... [    min VSRAM  ,  max VSRAM    ]
>  (min_uV)  (max_uV)                         (vsram_min_uV) (vsram_max_uV)
>
> The longer comment is
> "If we're asked to set a voltage less than VSRAM min_uV, set the
> minimum allowed voltage on VSRAM, ..."
> So VSRAM is the subject here I think? Because we "set voltage *on*
> VSRAM" based on its own minimum allowed voltage? We never set either
> VGPU min/max voltage to vsram_min_uV?
> And it's attached to the line that decides vsram_target_min_uV, with
> the maximum of (1) vsram_min_uV (i.e. minimum allowed VSRAM voltage)
> or (2) min_uV + max_spread (min VGPU + spread)

Ah, I just got your point. Both interpretations can explain..
I linked the "min_uV" in the comment to the one used in code, which
stands for VGPU min_uV, so I had the impression that it was a typo.

Regards,
Fei

