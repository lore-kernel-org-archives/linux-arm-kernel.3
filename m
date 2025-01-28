Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF6EC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCB4v+WXq4lF4QrBSoQLeECXyKf0oYWAfbCsOcRv7h8=; b=eyKSwMaOZNkoVS1F5qaUi2kWV3
	L0KhRhkQasFdJIl3yhiNLvxcI1eBjxA/mtgmsAkioAuLov7B93dMk8fTfr1hBFfZRWHXtbCV4alSc
	LizonUT8EFTHfLrs79V4kb7xZVetHw9tdsu5Qe4TEObUyHvSKNCtjWw0fvF2fjDLlGEpRH53k0oKd
	dYvGbfnG2wPfZWUt1+6oD3PU9Z3Uy5bS9EiUxs/6GMAXIUIsXKTgUG7MIWhdGNg/TvJ+Xlynrqu8v
	Y6mGYD1TSqHIuho6lFQf/lV4hGXnA6IEaziV13DvBsX0oSlcZ/fPLk8KsU74xuqsL4j8nz0oMSTfZ
	8OLUGgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctzQ-00000005vHU-0a64;
	Tue, 28 Jan 2025 22:23:24 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tctsA-00000005uXr-3P1m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 22:15:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-216325f516fso12947875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738102553; x=1738707353; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCB4v+WXq4lF4QrBSoQLeECXyKf0oYWAfbCsOcRv7h8=;
        b=MFBgvZqyJRXbPNvFDymB00Deib5hHZMAUtuqcPYVx9QMSq8kCNL3iMewriccBePwVp
         cjogkCCCKFkEtU4UiwjW39OQ9wsY1IFFd7+GOsx+bZYUMS4FVwm+gPjHE3Y4boGmvi8W
         e7WI/OgC10A7YKl8F91Iys0HB61Ls5kuT7wlkuGo7MMD9LR5YSAyJqEZ3JhVWthAEVD0
         H0fAZDStntD+6MAew8+jvzh36GpSrmhc8DUXv3/3ekKm3eYjWxT7en15+zJF6Mgjz6f2
         Iz2rWyamIbC2kK9apu8CzPx2j83L9yJfEEUKCZlWa7d8RfN5QheZssRu1/asx6eev51l
         GWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738102553; x=1738707353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCB4v+WXq4lF4QrBSoQLeECXyKf0oYWAfbCsOcRv7h8=;
        b=Y40abY81C4OUbkAD+xMrRihLgyWSW75uwkcB5W/kyQxmJ0idBUtO4vAkxXMS0MPBh0
         LLuukL8B3kcbuXb8Q4Dz4F5UeXgKt2nXbS1loheHO202/0iSA5G2GYC4zq3uNB7RWfai
         YoVqelY0SaU6hZmyYoIWX1XXpiTaosnoBTTzCswmtCi66WhP7NywKxbskQcSpTXDZHUB
         mx10Yh2y8U3rXuT4tvT39W/l7h9oOWuJCe5BPTzsgS1rpdNDFmsT7KGcMUmR01NRCQ01
         e86i30B65v0fQzcK9hl72PEI4ZT4AOCsYBpskcweyg0tZgJKNPv0ZV/FBQwtp1zpjn/h
         2irA==
X-Forwarded-Encrypted: i=1; AJvYcCWrJDjQiJR8iTr3qxEpPytx73E4JGpkpc1RbtY/g81gtxgjKVZRHJQ4jrsMeSMifj3gK/pPPc34MJ/RrWARyoVH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6U2J03H+SnP/+AQlDwDBnHNvekNvEWrXr8bcJcjEvT9vghGdv
	6vuy34GaS4ubm0HLEduVaM6KrrleF9PIO6eGxb4lJBBgszdTlWh9539QDftTVqqGNrNuozqQSg9
	syzREWPLoQDnShoN43rS/VO73tnc=
X-Gm-Gg: ASbGncs0/0IM1PltVqwTTipfAL0SsVRQwBlMFWr7yEzC1IxY7bEf8s4OND8PORsPHhy
	7D4ASPORZDzq2w+jUIUVeXFf+Moj3H5oZZAZKpgcqDLP8Cwc8ej4eiLtcNkAxLVgSvorfEV8i
X-Google-Smtp-Source: AGHT+IG/JmcUEYW3G4Bmqx5GSmXS6y3U6GnDUzXK7OMM0PqZHUQojy9s8Ihml9PYOSpGiLYloAZZ2FBD4HwsETOp5ok=
X-Received: by 2002:a05:6a21:1013:b0:1cf:2be2:5e5a with SMTP id
 adf61e73a8af0-1ed7a7105ddmr592759637.10.1738102553534; Tue, 28 Jan 2025
 14:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
In-Reply-To: <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 17:15:42 -0500
X-Gm-Features: AWEUYZnR6X8QNZSt4NrL1WtbRcFAaPRCRbEEvulRWjwJr5nBO0UJqRrYtEh2Opo
Message-ID: <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Rob Clark <robdclark@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_141554_857728_CAB79B39 
X-CRM114-Status: GOOD (  38.57  )
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

On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quicin=
c.com> wrote:
> >
> > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@qu=
icinc.com> wrote:
> > > >
> > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > > > The context would remain stalled till we write to CBn_RESUME. W=
hich is done
> > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled context=
 further
> > > > > > transactions are not processed and we shouldn't see further fau=
lts and
> > > > > > or fault inerrupts. Do you observe faults with stalled context?
> > > > >
> > > > > Yes. I've observed that on MMU-500 writing RESUME before the inte=
rrupt
> > > > > has been cleared doesn't clear SS. This happened with v2 in the c=
ase
> > > > > where there was already a devcoredump and drm/msm called
> > > > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > > > handler, and we'd get a storm of unhandled interrupts until it wa=
s
> > > > > disabled. Given that the architecture spec says we're supposed to
> > > > > clear the interrupt first this may have been an attempt to "help"
> > > > > developers.
> > > > >
> > > >
> > > > Just to clarify, present sequence is:
> > > > 1. context fault with stall enable. FSR.SS set.
> > > > 2. Report fault to client
> > > > 3. resume/terminate stalled transaction
> > > > 4. clear FSR
> > > >
> > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FS=
R.SS
> > > > cleared and interrupt storm is observed.
> > >
> > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is n=
o
> > > interrupt storm. From this we conclude that MMU-500 does not clear
> > > FSR.SS unless #4 happens before #3.
> > >
> > Thanks Connor for clarification. I get your point now. I think it's
> > expected interrupt storm with #2->#3->#4 sequence is expected.  With
> > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence =
of
> > #1->#2->#4->#3, which is spec recommended.
> >
> > so, common fault handler can be modified to follow the same sequence, b=
ut I
> > have concern regarding clearing FSR before reporting fault to client.
> > qcom_adreno_smmu_get_fault_info() is an example I gave but other client
> > handler may have similar expecation of fault register not changed befor=
e
> > client fault handler is called.
>
> Simple solution would be to move the clearing of FSR to after the
> fault is reported.  It doesn't really matter if it is before or after,
> as long as it happens before the irq handler returns, AFAIU.  And
> drm/msm will collect the fault info from the irq handler.

As I said in the earlier mail: "From this we conclude that MMU-500
does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
and #3 is writing RESUME. So no, unfortunately it does actually matter
and we get a storm of unhandled IRQs if we don't clear FSR first. Your
solution is what v2 did and it didn't work.

Connor

>
> BR,
> -R
>
> > > > The way CFIE disable is helping
> > > > with current patch indicates write FSR is unstalling context and su=
bsequent
> > > > transactions are faulted.
> > >
> > > No, it does not indicate that. The interrupt storm happens even when
> > > there is exactly one context fault, and when the interrupt storm
> > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> > > is asserted. This has nothing to do with subsequent transactions.
> > >
> > > > Do you stop getting interrupt storm after write
> > > > RESUME.
> > >
> > > Yes, as long as the write to RESUME happens after all other bits in
> > > FSR are cleared.
> > >
> > > > If you can mention your SCTLR configuration and FSR state in test
> > > > sequence, it would be clearer.
> > >
> > > SCTLR has both HUPCF and CFCFG enabled.
> > >
> > > >
> > > > An aside, If reducing delay between FSR and RESUME write helps then=
 both
> > > > can be done as part of qcom_adreno_smmu_resume_translation(). This =
will
> > > > follow spec recommendation and also make sure fault registers are n=
ot
> > > > cleared before reporting fault to client.
> > I think this sequence should address the issue you are observing.
> >
> > > >
> > > > Thanks,
> > > > Prakash

