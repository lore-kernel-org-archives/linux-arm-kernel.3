Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC916C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 03:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=; b=ut5eIOqPKLUDSEeZnsgxfCRH2d
	jETHB6tWXrs2G5BwCjxir4OcCLfZec9KvTFha1sp2PYjDhhTQhuHiYKOPUFWgWhbh9jo+vXG9lkU2
	U1+FZwvU629E2A0YKxgioAZpSGu28+N1d1WKUM1Ix5+bgnfJf/pC7I0ZMKrT40OIOINYN9D9ugmOO
	2Q2dglvhliD4YPsGK0CNg4ArI43Wt90cq7Ocxu0de67JSHFL0C6OIaWKNbOfFoAs+Yq5qp+/PmhvH
	gSui+257SBdXFUewxAPjfL5CFqWwhOdiP8JjyEfXsHGD4ypDIu6WcUDm0veKbH08Edk8igfsfr/dQ
	pZS1PvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcysC-00000006Goq-2UAI;
	Wed, 29 Jan 2025 03:36:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcyqr-00000006Glm-2vvt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 03:34:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-216406238f9so14418095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 19:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121692; x=1738726492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
        b=mc8HUso+xNpwSSz+mQkZAUBpcbI/85xuR/t3OygU0MwTgFbSb+ZsCeN3pAR3R1PTW4
         qsby/Ja+eprzsABE95MQHD9ZrTVdOoqoEX6YxSlk+qMD3zFfG6i//el3TJzjQwvOx9VB
         lcR2aHiQkm8K9GAO736s1YMVTBcPBtXtQDDlWjCCJp+4M1XQubyfO05cC5H9r1OokBPL
         wQwkLysGkOXsogdiTG5kZF/UYGfCbLHB8BKGTxaAV+25Ake0Eb4WiNejXFl4DJItltEJ
         5QmCm6gvi87IF+ig9NkpqulfLh793xNzU9D0vNPOyUMergGyuprDCgOuHSVMFl10H1L6
         8cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121692; x=1738726492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
        b=RLiYPnxJWhZTnv5jbIrgS3+RB1LWuDO45dHzXsOVXOa3dqdJzYJezxoUFEuH3AK2Dj
         4r5BLx+Hyx5tnRDc/VLoTTFS1daSH4iP/hSFz74+NNuRVo2G/85NR8xFR0x+k5YdfN9k
         HHSduyteGx+y3iAkDNtg2hXFlfDkZKaQ5rpqeEElNOoecy+VVuU1eawR7OJzVgv7aaM+
         WdLuuXZlcIJQgECGNvftK/0UThVqC/Z/QMqowqXrbRdFItNiQMEWEj17/tYqTNrV3ihg
         xozj/LyptY6vf8O7+ihnOjtvBCctZR6MRLDYH6BWGCw1flcyS5cqVZvylOrJO6NCc0Ab
         Z5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWZtnjbaC9bAELxQUKtE/OFDw/afp9924B03qR4JwRgbCwMS/gspM5Loyo4gUKm7zJ+NMps6flxd/VPD48oc+wU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6utovBd/rSzY72cOzrq/6rlu07G2ECTJgT3Rp7IIpO81dMDw4
	NkgFBHLDa+Uh+bCAjtrPBYYR+VQEVlzq0ktJXFLjo071kmirgNx1qMxXqGajq0qSILwTZHpfkOO
	7mv63qMRPhKn0mE4BIPtMG3YTwvc=
X-Gm-Gg: ASbGnctiMmdo2BUn+zR5Sfsp436GaESOjPp3RXaDzcS6Wicg4kiGTyKR/ijCmHZmifw
	bBcB3Wzp2KO53OYPJsxKCGu4zq5Qn0LSLSaiYTvH+7pUBPBlO9K+zVm3KLJYH791YorpLKIDu
X-Google-Smtp-Source: AGHT+IFbFQSYTvKU6Tn/jYbbxgPrehvkrB0XAVXsOwTCtBnwvAVfgVvZVo8IQ1hdLTPS9gNaQI/uOQ9lmAgGhGlB37U=
X-Received: by 2002:a05:6a21:329c:b0:1e5:d3cc:4632 with SMTP id
 adf61e73a8af0-1ed7a5c5535mr1035370637.1.1738121692412; Tue, 28 Jan 2025
 19:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
 <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com> <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
In-Reply-To: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 22:34:41 -0500
X-Gm-Features: AWEUYZnSb6QYpR0Fp9PLawYr9P-QPjVvmIEP1Nm8egoDpm1trM7-ebAtlM8-HK8
Message-ID: <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250128_193453_740501_CE0C46B1 
X-CRM114-Status: GOOD (  37.79  )
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

On Tue, Jan 28, 2025 at 10:25=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wro=
te:
> > > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <qu=
ic_guptap@quicinc.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott=
 wrote:
> > > > > > > > > > The context would remain stalled till we write to CBn_R=
ESUME. Which is done
> > > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled=
 context further
> > > > > > > > > > transactions are not processed and we shouldn't see fur=
ther faults and
> > > > > > > > > > or fault inerrupts. Do you observe faults with stalled =
context?
> > > > > > > > >
> > > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before =
the interrupt
> > > > > > > > > has been cleared doesn't clear SS. This happened with v2 =
in the case
> > > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > > qcom_adreno_smmu_resume_translation() immediately from it=
s fault
> > > > > > > > > handler, and we'd get a storm of unhandled interrupts unt=
il it was
> > > > > > > > > disabled. Given that the architecture spec says we're sup=
posed to
> > > > > > > > > clear the interrupt first this may have been an attempt t=
o "help"
> > > > > > > > > developers.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Just to clarify, present sequence is:
> > > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > > 2. Report fault to client
> > > > > > > > 3. resume/terminate stalled transaction
> > > > > > > > 4. clear FSR
> > > > > > > >
> > > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequenc=
e, is FSR.SS
> > > > > > > > cleared and interrupt storm is observed.
> > > > > > >
> > > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseq=
uent
> > > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 th=
ere is no
> > > > > > > interrupt storm. From this we conclude that MMU-500 does not =
clear
> > > > > > > FSR.SS unless #4 happens before #3.
> > > > > > >
> > > > > > Thanks Connor for clarification. I get your point now. I think =
it's
> > > > > > expected interrupt storm with #2->#3->#4 sequence is expected. =
 With
> > > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the s=
equence of
> > > > > > #1->#2->#4->#3, which is spec recommended.
> > > > > >
> > > > > > so, common fault handler can be modified to follow the same seq=
uence, but I
> > > > > > have concern regarding clearing FSR before reporting fault to c=
lient.
> > > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but othe=
r client
> > > > > > handler may have similar expecation of fault register not chang=
ed before
> > > > > > client fault handler is called.
> > > > >
> > > > > Simple solution would be to move the clearing of FSR to after the
> > > > > fault is reported.  It doesn't really matter if it is before or a=
fter,
> > > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > > drm/msm will collect the fault info from the irq handler.
> > > >
> > > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing =
FSR
> > > > and #3 is writing RESUME. So no, unfortunately it does actually mat=
ter
> > > > and we get a storm of unhandled IRQs if we don't clear FSR first. Y=
our
> > > > solution is what v2 did and it didn't work.
> > >
> > > So, just clear FSR also in the resume path
> >
> > Then we'd run the risk of incorrectly accepting a second fault if it
> > happens immediately after we resume. Not terrible for our use-case
> > where we only really need the first fault to be accurate and we
> > disable stall-on-fault afterwards, but if you ever leave it on then it
> > would result in another interrupt storm.
> >
>
> Howso? We'd still be ensuring that #4 happens before #3?  If needed we
> can add a param to resume_translation() so drm can tell it to only
> clear FSR if it calls resume_translation from the interrupt handler,
> or something like that.  But I don't want to lose capturing the FSR,
> and I don't think we need to.
>
> BR,
> -R

Because we could clear FSR in the resume handler (ok), then resume,
then fault again, then clear FSR again in arm_smmu_context_fault() and
unintentionally acknowledge the fault without a corresponding resume.
Again, it's not possible with drm/msm after this series since we
disable stall-on-fault before resuming but still this means it's very
fragile.

To be clear, FSR should already be frozen until we resume, if the
SMMUv2 architecture pseudocode is to be believed. So any fault that's
recorded in the devcoredump will still be accurate with this patch,
just subsequent faults might not be accurate.

Connor

