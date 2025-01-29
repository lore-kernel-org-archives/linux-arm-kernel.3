Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 02:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=; b=L+wqUf4DZvkoxA0c3gwCgPiecP
	j7kLlnp3Szy/agSuZ/B0hrTNOObpJhAlADdoqVUSvUDuH5J/L2qwdaSQUCh7BBgrw61GCApOBV5k0
	R2QYK6HGo4QWzVNEYj8a51aKUON5fmEH0uEPffd4u7KPdKuNAJ68TmESrxJrZM4s31VXOY5cGVjjW
	GQ0T1ElxHjNDRu2N/TfkO2YkqWih0Cwo+fpfyRvm/zC+0lavvy3fr2aS9w5cmMpV603sxVylkAkS4
	f2277LAaVeC3YQkU5lEdmU7dC4ziK5aBh8nyKWbrC6f/K7yN+1c8aYPmYMB7axFskHtfDEnKoG078
	xUzU6DSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxj0-00000006E04-2Ivy;
	Wed, 29 Jan 2025 02:22:42 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxhf-00000006Drg-11IW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 02:21:20 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso410130739f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738117278; x=1738722078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
        b=S3TPfM+rh0563de/k2IH/PRbLAWAB0JszeBSTCHwMaMD1xFUBpMhnP6KCkrX47/Lhj
         ylS1DxYNYbhU4e5Gur34v+qx7PUPl5fcel2W5l2VfpKirubKvmWgFKTXFXNn02on4fEB
         gAdC4wiDkM0ewrKUUqtQtB99J3Jgc3NU0M68TP5MeVmonjJPQx5ecSLuzRvxj7osDC72
         0ydTv2dviANN+H1J8azyv1w0x4gusT5UKjE/WWuJ4ro4zJa1IJ6CJPHu0PV6sYS0/BBr
         GCio8ak9FXeNOh4vOsjM0vzu2xcLFrsfabhV6YUhDS5fJ+UNGj0zCIWHwN1nPHjqr9l8
         1t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738117278; x=1738722078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
        b=S6FuMPvrw2H1DlrQJlXr7Uup2sd/SrOBGzR+cLHo/46z/yOs3ZWTA/+hElSaUL0hhv
         /Gd7+mmfovAH1NQMPPhBLn5Sz7ZInGi+y94qRo7H0Q8dkL45QBVJ/dOQT6mBcx+rW1Cn
         xVYGRg191dsQD8zLJUcDbTIm5/fF1b6TLSB5nftCmsn/sL7qLVzg71NUooG7UvtlZSZD
         uHdRi0ejErMGfgA6nw8VS3Zvp1ilG7xolE8+Z3IbmWPqQbwu9s4qpiRXYt49oH/RlaHd
         01mxLzoFcc4JCV0J8HN6/bvP0NMAvvjXMe0MJq170HzZdVh7B1zhDxQFfI/vRAu6xirL
         aPNw==
X-Forwarded-Encrypted: i=1; AJvYcCVczhpd+HFJ4zX31dpyoBdzbk5kqotUaxddAI7XyUkww4r6KhBeQ4GijixiPcS7MSxCAAdrGgAzkax6KTkKuoCQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyHHdXze3/2pJqdKP0CJbFD/o5aZE0sYhJLBomooYO1y98xtY4p
	2+reEZf0OdTaEzTdIq1Dncp+S3Q83uy60ZtK/mxj1zaVdd/w9PVzdyaUJbWnUKn0Ek7PC9sMgvj
	R+XxZ7P7iilUGskqFLxJWHRSZ1Ug=
X-Gm-Gg: ASbGncsOPTQBicky8s8Xp48dExnVrI3zWTaH/uXo3eHpiNXV9STRv0DcZ1KEnN/luL/
	aOCb/yEjVBqRQ5J/ZyC7miMgb2VGkfmP72ffalSSFUAE/l82riHtMYzC7UuoDXA4Z84hQQaDKyg
	==
X-Google-Smtp-Source: AGHT+IHB6eolsV4aH/hplP2BpTqjii/IaDUSxjMDLt9An83E2DQ2Sqv+/y5nVv5os4CQTqahC3lJBJ0CAAndOUs/AC0=
X-Received: by 2002:a05:6e02:198b:b0:3cf:fcc4:eff9 with SMTP id
 e9e14a558f8ab-3cffe3e5dbemr15157515ab.8.1738117278041; Tue, 28 Jan 2025
 18:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
In-Reply-To: <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 18:21:06 -0800
X-Gm-Features: AWEUYZnLX6CXtNjm5Fg1x_aeoKRaj1zqbCfN_3LTjAFaHbtGLWrCztq9g_rdAEY
Message-ID: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
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
X-CRM114-CacheID: sfid-20250128_182119_285311_721D518E 
X-CRM114-Status: GOOD (  40.02  )
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

On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote=
:
> > > > > > > The context would remain stalled till we write to CBn_RESUME.=
 Which is done
> > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled conte=
xt further
> > > > > > > transactions are not processed and we shouldn't see further f=
aults and
> > > > > > > or fault inerrupts. Do you observe faults with stalled contex=
t?
> > > > > >
> > > > > > Yes. I've observed that on MMU-500 writing RESUME before the in=
terrupt
> > > > > > has been cleared doesn't clear SS. This happened with v2 in the=
 case
> > > > > > where there was already a devcoredump and drm/msm called
> > > > > > qcom_adreno_smmu_resume_translation() immediately from its faul=
t
> > > > > > handler, and we'd get a storm of unhandled interrupts until it =
was
> > > > > > disabled. Given that the architecture spec says we're supposed =
to
> > > > > > clear the interrupt first this may have been an attempt to "hel=
p"
> > > > > > developers.
> > > > > >
> > > > >
> > > > > Just to clarify, present sequence is:
> > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > 2. Report fault to client
> > > > > 3. resume/terminate stalled transaction
> > > > > 4. clear FSR
> > > > >
> > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is =
FSR.SS
> > > > > cleared and interrupt storm is observed.
> > > >
> > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is=
 no
> > > > interrupt storm. From this we conclude that MMU-500 does not clear
> > > > FSR.SS unless #4 happens before #3.
> > > >
> > > Thanks Connor for clarification. I get your point now. I think it's
> > > expected interrupt storm with #2->#3->#4 sequence is expected.  With
> > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequenc=
e of
> > > #1->#2->#4->#3, which is spec recommended.
> > >
> > > so, common fault handler can be modified to follow the same sequence,=
 but I
> > > have concern regarding clearing FSR before reporting fault to client.
> > > qcom_adreno_smmu_get_fault_info() is an example I gave but other clie=
nt
> > > handler may have similar expecation of fault register not changed bef=
ore
> > > client fault handler is called.
> >
> > Simple solution would be to move the clearing of FSR to after the
> > fault is reported.  It doesn't really matter if it is before or after,
> > as long as it happens before the irq handler returns, AFAIU.  And
> > drm/msm will collect the fault info from the irq handler.
>
> As I said in the earlier mail: "From this we conclude that MMU-500
> does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> and #3 is writing RESUME. So no, unfortunately it does actually matter
> and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> solution is what v2 did and it didn't work.

So, just clear FSR also in the resume path

BR,
-R

> Connor
>
> >
> > BR,
> > -R
> >
> > > > > The way CFIE disable is helping
> > > > > with current patch indicates write FSR is unstalling context and =
subsequent
> > > > > transactions are faulted.
> > > >
> > > > No, it does not indicate that. The interrupt storm happens even whe=
n
> > > > there is exactly one context fault, and when the interrupt storm
> > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > prints. Once more, MMU-500 will assert an interrupt when only FSR.S=
S
> > > > is asserted. This has nothing to do with subsequent transactions.
> > > >
> > > > > Do you stop getting interrupt storm after write
> > > > > RESUME.
> > > >
> > > > Yes, as long as the write to RESUME happens after all other bits in
> > > > FSR are cleared.
> > > >
> > > > > If you can mention your SCTLR configuration and FSR state in test
> > > > > sequence, it would be clearer.
> > > >
> > > > SCTLR has both HUPCF and CFCFG enabled.
> > > >
> > > > >
> > > > > An aside, If reducing delay between FSR and RESUME write helps th=
en both
> > > > > can be done as part of qcom_adreno_smmu_resume_translation(). Thi=
s will
> > > > > follow spec recommendation and also make sure fault registers are=
 not
> > > > > cleared before reporting fault to client.
> > > I think this sequence should address the issue you are observing.
> > >
> > > > >
> > > > > Thanks,
> > > > > Prakash

