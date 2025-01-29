Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 02:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=; b=BNdjq/dhmbPYID6ykYYeRkF9VQ
	JWEslmivzYpI69oju7QJXH4srV1jfDIC8UhyWEV4SnFJgBk8rfu+FNTkm/ndok/Ql8LPULrKOl2Q+
	ztF4Z7hlRNLHR08DtTYdZJCc/fYDN3ts1j09w066ByQPDc5DBf8LqMc+ltOXD+X3Mq72iVfk4w4Vk
	ulgZau7nW00j3s88fuH3Gd4jAOXinwusGESk/TAUtb3AIp7EjRvRNLz50shSZn+HSikNPpslpKL4T
	U2B7smbmDI6hsNakiV+jv/oBdzI73OZ9k/Ur5Ad6eVByFhn/rg3d+Z6Q8O+jS3KpIoRBfTIn72Tsm
	ftEbEddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxsO-00000006EMR-0MJh;
	Wed, 29 Jan 2025 02:32:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcxr2-00000006ELF-1NEz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 02:31:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso1489306a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 18:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738117859; x=1738722659; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
        b=HaArF3FketVPIFEgNABiwUZJm8gCpsMINvw6e4eX7o1vTiZLR2Q6my5YqSYb+kMUOD
         MqKST7SExmSTZNP0BXTvg393666tuH/rRh5ohpRxge4pvw4ib40Wusa55C5myB5OQI09
         /coAWH72y8/w5pCckeU1aiR77Kqy8fT/hWSJ/UyL1SzB3st1ZNpofjWywvRHEgRHZs/t
         10wZwlQe4PjthEKy8zDIS2eLnNwjvjDMEtVKgX1skPnMhR7PQBisDENOc4a1lpql6LDV
         n2pYGi+ONgQ3CcbqQ/yrvOcr0uqwAZpl3KH11P/cE6TQRl6wCe5OY9v9dsEZrjMLQaLG
         zLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738117859; x=1738722659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSly2TaNffKLGTngVYEFGfP2OiXY7SuVwdUXwB6ys4U=;
        b=VZAw5kXADLCur5pUDeFJ3so6fwlLPlSiY2+ZaZ7j+SWt+SEzqvRBDj6q5aqAeu048X
         J9J1FhrZ5ddvb8H+Hec6AdrykINWjbMxWywX7BA8HhA7kp3cUsWxPiwyhYDfg8KUAviV
         9uGpMHCmS2kGVX90Y5kpF1n+SVYKBxKQaxGx/qqrLlFcHliwrugPuq3TQlWnSFR7bZFr
         fdhLiGiZgp2riUWJwHIXi/hIEbVQugzd6kH8b7XnW1xelNJgZdjmQKAUSyACTciTThjt
         1eFJGAYkM/htrJDS8rxx+sQ21QIKrPRb6eFDCXO9jcwR3HgBfW9JNbUg2ZEfxdxwTjJV
         zWFg==
X-Forwarded-Encrypted: i=1; AJvYcCVn0xd5AnXyPVvYF1iWUX1u10rSIfM3t/GzQHbfXUY98XQ8mUkN5WVgvk6vG+hBhNM2RlBm2BFmf8y36EEWaVFl@lists.infradead.org
X-Gm-Message-State: AOJu0YzscbhbiLVIDNnJh7FF3EIK4OjshtmYQr7+FgucAE0MJK9PHkje
	gaTsedbkDxKCX9cjbIUfHyjY4gZ+MMAR6m4rAzazUcPJYzfLHEBwrwkXx9Gm+KHPWj8dZjWtCe7
	jyYU4HD9POYi2r6behUA7IJPySd8=
X-Gm-Gg: ASbGnctg49Cb7SeDg1gQ+7BzoZamQtZIe9T2O+lWIl6JFFJkwGMLPBwZjHoa01xuL8R
	1KSbwwrxhaTZrsXwkEoNUaGJxxQBJ+Tsa7vVJQIl03h56znYhFtcK8FaFO45SHFEenVC2ePIo
X-Google-Smtp-Source: AGHT+IEjgYmsQ4btVO6NoeAtHUBYo6uBU9FQXTRAoppwQkfpqn+YG0TztYlkbmmr8DweH3LafBf4eykvGJwllpwO6II=
X-Received: by 2002:a05:6a00:3920:b0:72a:83e4:42e2 with SMTP id
 d2e1a72fcca58-72fd0bcee41mr883477b3a.2.1738117859086; Tue, 28 Jan 2025
 18:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com> <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 21:30:48 -0500
X-Gm-Features: AWEUYZnXKpZmksZEDv9wE4ehxlAcfC2ZYtvFlEvNuv90BQMKMLlkT9uISLaRedQ
Message-ID: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250128_183100_374823_958F39C6 
X-CRM114-Status: GOOD (  42.17  )
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

On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@qu=
icinc.com> wrote:
> > > >
> > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wro=
te:
> > > > > > > > The context would remain stalled till we write to CBn_RESUM=
E. Which is done
> > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled con=
text further
> > > > > > > > transactions are not processed and we shouldn't see further=
 faults and
> > > > > > > > or fault inerrupts. Do you observe faults with stalled cont=
ext?
> > > > > > >
> > > > > > > Yes. I've observed that on MMU-500 writing RESUME before the =
interrupt
> > > > > > > has been cleared doesn't clear SS. This happened with v2 in t=
he case
> > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > qcom_adreno_smmu_resume_translation() immediately from its fa=
ult
> > > > > > > handler, and we'd get a storm of unhandled interrupts until i=
t was
> > > > > > > disabled. Given that the architecture spec says we're suppose=
d to
> > > > > > > clear the interrupt first this may have been an attempt to "h=
elp"
> > > > > > > developers.
> > > > > > >
> > > > > >
> > > > > > Just to clarify, present sequence is:
> > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > 2. Report fault to client
> > > > > > 3. resume/terminate stalled transaction
> > > > > > 4. clear FSR
> > > > > >
> > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, i=
s FSR.SS
> > > > > > cleared and interrupt storm is observed.
> > > > >
> > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there =
is no
> > > > > interrupt storm. From this we conclude that MMU-500 does not clea=
r
> > > > > FSR.SS unless #4 happens before #3.
> > > > >
> > > > Thanks Connor for clarification. I get your point now. I think it's
> > > > expected interrupt storm with #2->#3->#4 sequence is expected.  Wit=
h
> > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seque=
nce of
> > > > #1->#2->#4->#3, which is spec recommended.
> > > >
> > > > so, common fault handler can be modified to follow the same sequenc=
e, but I
> > > > have concern regarding clearing FSR before reporting fault to clien=
t.
> > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other cl=
ient
> > > > handler may have similar expecation of fault register not changed b=
efore
> > > > client fault handler is called.
> > >
> > > Simple solution would be to move the clearing of FSR to after the
> > > fault is reported.  It doesn't really matter if it is before or after=
,
> > > as long as it happens before the irq handler returns, AFAIU.  And
> > > drm/msm will collect the fault info from the irq handler.
> >
> > As I said in the earlier mail: "From this we conclude that MMU-500
> > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> > and #3 is writing RESUME. So no, unfortunately it does actually matter
> > and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> > solution is what v2 did and it didn't work.
>
> So, just clear FSR also in the resume path

Then we'd run the risk of incorrectly accepting a second fault if it
happens immediately after we resume. Not terrible for our use-case
where we only really need the first fault to be accurate and we
disable stall-on-fault afterwards, but if you ever leave it on then it
would result in another interrupt storm.

Connor

>
> BR,
> -R
>
> > Connor
> >
> > >
> > > BR,
> > > -R
> > >
> > > > > > The way CFIE disable is helping
> > > > > > with current patch indicates write FSR is unstalling context an=
d subsequent
> > > > > > transactions are faulted.
> > > > >
> > > > > No, it does not indicate that. The interrupt storm happens even w=
hen
> > > > > there is exactly one context fault, and when the interrupt storm
> > > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > > prints. Once more, MMU-500 will assert an interrupt when only FSR=
.SS
> > > > > is asserted. This has nothing to do with subsequent transactions.
> > > > >
> > > > > > Do you stop getting interrupt storm after write
> > > > > > RESUME.
> > > > >
> > > > > Yes, as long as the write to RESUME happens after all other bits =
in
> > > > > FSR are cleared.
> > > > >
> > > > > > If you can mention your SCTLR configuration and FSR state in te=
st
> > > > > > sequence, it would be clearer.
> > > > >
> > > > > SCTLR has both HUPCF and CFCFG enabled.
> > > > >
> > > > > >
> > > > > > An aside, If reducing delay between FSR and RESUME write helps =
then both
> > > > > > can be done as part of qcom_adreno_smmu_resume_translation(). T=
his will
> > > > > > follow spec recommendation and also make sure fault registers a=
re not
> > > > > > cleared before reporting fault to client.
> > > > I think this sequence should address the issue you are observing.
> > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Prakash

