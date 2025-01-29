Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47870C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyx2HnrHkqjaWL4grDrBJMJLyZTpqWFcrU3zWDmIiLc=; b=iFJ7srFIjiqVzSpVCHL7re53IX
	neizsxK2aUPPq0utnWo3D5oiDo5iM6wywvwjV8x+UsHE+kyMOZQhtw747+/vpxlP7F8bGaBU9GKLK
	RUsb/eFpx/yiiNIOmuMYRDJs1J6DOj5+FkNUDEJ4ZxTsee+0XQVOYsBWWSO5YfPNIcVLOnGIIzcKf
	rZESzi3e6eed3/GipWWsVXHkDI0YMAeufNCdUzVh9nvqxeOUYDI4kwmO1VeFkYOFFMz+z711lZ0kY
	D20DWjeEkDJ0Jq2VgFF0iQjMa8qTG/nl1+1N2f/zE8S9yLxcEAi+r7leoOP5VICipboZKToK+9PKt
	KblCZ7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAUv-00000007Kf3-0502;
	Wed, 29 Jan 2025 16:01:01 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdASj-00000007KR0-1wzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:58:46 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3ce87d31480so21102145ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 07:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738166324; x=1738771124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yyx2HnrHkqjaWL4grDrBJMJLyZTpqWFcrU3zWDmIiLc=;
        b=i1SnkcS/6mCo6/s+etnK30FCA+qBOtego+3sVxxpsylQJrlySpcMs8Tyxj9N9hQe7w
         1AOjvn3+HD6ep+ty4qJF30nhQAOpHu7+ULhf9Pn9Hn9ZiUKgegyYtX22v3cUewSuQaGx
         t6u1WXlhE0BBdP530Wmiub37eGJMq8usRjda8l2AC8Bn8ohBXnN1+PQOvToI8+igh7qw
         OIY3tjBXoLi6KLuEba/CVyR1oaNlvV1w5DMGfN4bUhHblWjiF31RS8GQKUYcl96F2p6S
         zblTJV4SKiS4/8w/oOxJ14v4zlq1fVWL3lt6KBZcX/tFu7sRmComD/0FtoGg6SR9D+uf
         rhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166324; x=1738771124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yyx2HnrHkqjaWL4grDrBJMJLyZTpqWFcrU3zWDmIiLc=;
        b=goIZBai2K0rnxkcKRYBFyOvO2XFo+HcoQrE4uHz4Qcw83F+xRpAY9IS9ZC86nQhnqS
         T/RhZegqFWsB+jA9+Q6EPLzRPh0382oP+8BbSsvVRK0lI6hLM61X3UsK079Wg15SmhsE
         1xkbvUvXmaRTZjXM6xaTG0gk02o+0oRcxobOiwNe3X0GK4EJ7ptx5dqga4CRXt+VAARe
         Ef4MxrDeg9wNVKAPmjaVDFAgK5cXpI6O4KTbhC80IxUIccBI8/+Mvo/feJm90ZuOmZjg
         lLOzyfYyaEAEZC9GjiyLMsxUes8Vv39vqKLfhXLYDt66PAKaZM+GPy3H4INc0G0Ywm+M
         xJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPHMsgEbXFtO6yrOOi+mSJKYdeP/wDeR6a2UJJNiBFA9f0UPZh/4Eg6uEwZw18RSOXK4t4coqyT/qaCjMExneF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfrh6UFzb4uNUUMMHbwD7E94yves5akrvY/IhFyKHGEnjVqIrA
	zx4Zj3xhd5kd5PJX3n0szz6CY5C6Y44bg5rmUKcAvPDTHvBfOawrYh2ujunoRa9vIPGOnXCbgTR
	0TuqDr/RGzGpRDXuG7QC9YTFLmUc=
X-Gm-Gg: ASbGncu6cj+v4CkDJ0hELuCUXCGpxUZQVvqSfYxtumbB/ynJVQrap7FUNJIyf3WC9W/
	yh8Vxm2KExfQHT+Vb0GdFWFO+IV/muj66lFH2jKa4QTxWbjPL2yooxbdLxkuNEDcXhZmJL7Cp0h
	OA6pS1R9cIFEYQ0IkBVRIzaUuAjZg8ZQ==
X-Google-Smtp-Source: AGHT+IHnCFTfSAmMVBm2YjmSTGYFPFdPTEgRxK+qIu+I/T+Z+PCgdh1bWdqnU7KHBa1TMZ2xZtF0vpMUCLb2CtJzpM0=
X-Received: by 2002:a92:cda7:0:b0:3ce:8b1b:2f with SMTP id e9e14a558f8ab-3cffe4b2c16mr28938375ab.17.1738166324333;
 Wed, 29 Jan 2025 07:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
 <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
 <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com> <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
In-Reply-To: <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Jan 2025 07:58:32 -0800
X-Gm-Features: AWEUYZkqyL0XupB4dML0yNwAmFsGfqHPxcVGzGZq55r_jJ2AS-o5CA3GcwcpY1k
Message-ID: <CAF6AEGv0-_Xh6adws+1WFTgX1vRSA4wLoDDZ7+RKgxpKgN-P0w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250129_075845_505709_1C5F478A 
X-CRM114-Status: GOOD (  42.07  )
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

On Tue, Jan 28, 2025 at 7:34=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 10:25=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gm=
ail.com> wrote:
> > > > >
> > > > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmai=
l.com> wrote:
> > > > > >
> > > > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote=
:
> > > > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic=
_guptap@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott w=
rote:
> > > > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <=
quic_guptap@quicinc.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbo=
tt wrote:
> > > > > > > > > > > The context would remain stalled till we write to CBn=
_RESUME. Which is done
> > > > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stall=
ed context further
> > > > > > > > > > > transactions are not processed and we shouldn't see f=
urther faults and
> > > > > > > > > > > or fault inerrupts. Do you observe faults with stalle=
d context?
> > > > > > > > > >
> > > > > > > > > > Yes. I've observed that on MMU-500 writing RESUME befor=
e the interrupt
> > > > > > > > > > has been cleared doesn't clear SS. This happened with v=
2 in the case
> > > > > > > > > > where there was already a devcoredump and drm/msm calle=
d
> > > > > > > > > > qcom_adreno_smmu_resume_translation() immediately from =
its fault
> > > > > > > > > > handler, and we'd get a storm of unhandled interrupts u=
ntil it was
> > > > > > > > > > disabled. Given that the architecture spec says we're s=
upposed to
> > > > > > > > > > clear the interrupt first this may have been an attempt=
 to "help"
> > > > > > > > > > developers.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Just to clarify, present sequence is:
> > > > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > > > 2. Report fault to client
> > > > > > > > > 3. resume/terminate stalled transaction
> > > > > > > > > 4. clear FSR
> > > > > > > > >
> > > > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 seque=
nce, is FSR.SS
> > > > > > > > > cleared and interrupt storm is observed.
> > > > > > > >
> > > > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subs=
equent
> > > > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 =
there is no
> > > > > > > > interrupt storm. From this we conclude that MMU-500 does no=
t clear
> > > > > > > > FSR.SS unless #4 happens before #3.
> > > > > > > >
> > > > > > > Thanks Connor for clarification. I get your point now. I thin=
k it's
> > > > > > > expected interrupt storm with #2->#3->#4 sequence is expected=
.  With
> > > > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the=
 sequence of
> > > > > > > #1->#2->#4->#3, which is spec recommended.
> > > > > > >
> > > > > > > so, common fault handler can be modified to follow the same s=
equence, but I
> > > > > > > have concern regarding clearing FSR before reporting fault to=
 client.
> > > > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but ot=
her client
> > > > > > > handler may have similar expecation of fault register not cha=
nged before
> > > > > > > client fault handler is called.
> > > > > >
> > > > > > Simple solution would be to move the clearing of FSR to after t=
he
> > > > > > fault is reported.  It doesn't really matter if it is before or=
 after,
> > > > > > as long as it happens before the irq handler returns, AFAIU.  A=
nd
> > > > > > drm/msm will collect the fault info from the irq handler.
> > > > >
> > > > > As I said in the earlier mail: "From this we conclude that MMU-50=
0
> > > > > does not clear FSR.SS unless #4 happens before #3." #4 is clearin=
g FSR
> > > > > and #3 is writing RESUME. So no, unfortunately it does actually m=
atter
> > > > > and we get a storm of unhandled IRQs if we don't clear FSR first.=
 Your
> > > > > solution is what v2 did and it didn't work.
> > > >
> > > > So, just clear FSR also in the resume path
> > >
> > > Then we'd run the risk of incorrectly accepting a second fault if it
> > > happens immediately after we resume. Not terrible for our use-case
> > > where we only really need the first fault to be accurate and we
> > > disable stall-on-fault afterwards, but if you ever leave it on then i=
t
> > > would result in another interrupt storm.
> > >
> >
> > Howso? We'd still be ensuring that #4 happens before #3?  If needed we
> > can add a param to resume_translation() so drm can tell it to only
> > clear FSR if it calls resume_translation from the interrupt handler,
> > or something like that.  But I don't want to lose capturing the FSR,
> > and I don't think we need to.
> >
> > BR,
> > -R
>
> Because we could clear FSR in the resume handler (ok), then resume,
> then fault again, then clear FSR again in arm_smmu_context_fault() and
> unintentionally acknowledge the fault without a corresponding resume.
> Again, it's not possible with drm/msm after this series since we
> disable stall-on-fault before resuming but still this means it's very
> fragile.

Alternatively we could use the return code from the fault handler
(maybe, -EFAULT) to indicate that arm-smmu irq handler should
terminate+resume immediately, rather than calling resume_translation()
in the case that drm doesn't schedule fault_handler.  We can change
both sides of the adreno_smmu_priv interface if needed to come up with
something sensible.

> To be clear, FSR should already be frozen until we resume, if the
> SMMUv2 architecture pseudocode is to be believed. So any fault that's
> recorded in the devcoredump will still be accurate with this patch,
> just subsequent faults might not be accurate.

I guess by default I'd be inclined to "trust but verify" that (and
also on qcom,smmu-v2).

BR,
-R

