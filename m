Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FECC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=; b=d6PZ45cyzfCmJ15UhNkU6U2U5C
	2lXhnucrCdXSXS/Tyh3xLsiaWBddesmMSWYI/DGcWAkDJJjqYlQO5FE53ZxnUi5jEkpHwSHj5uGMI
	E+udOxf7RV+qZ4LJ8DZWT3k6ch6V0VWcaOB5A3K4hA9NJ2LKGi43TQXsI3iiq2nAOgBDOD7q+VBey
	/oBR+heiNSV1R8WrINLghC+OHW3Gsey+Uxh/etqRG8neCO4zWs+N77uMjbbKWJJQRMDUiG9pEdJ93
	a8pOdBSZvHSxPx+XFwPEzAmSSzLpQE27SBNhHgm05D1n+rEG1EnULIomXJe0IiA6OQrcbSfKUSivm
	m3x2HN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcty7-00000005v4b-1kSJ;
	Tue, 28 Jan 2025 22:22:03 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tctmU-00000005tv5-3CS4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 22:10:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3cfc154874eso47173835ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738102201; x=1738707001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
        b=UWfXCDmgEsb9Nq7KvwHUPPdKXj4hTr6nKsryDcfhtMkDYjZDP9skkhNLclpXvmRSMQ
         5TWukYVSlabVN9ufW+Vfzya1wXug0LKFbnsb7Nql5F6b1XZE/r0DQO8JZZJ0LtJXGTkF
         Cp5y4S6K4suXRGLmxVWfQAAsSog/CBH7if5DjsbumJfMDmt0X4IgkfduQUu964rtbl9p
         l7y4iGwz35cUgAABUdFj2q88cmvSy+G/2SCSvJu647/4lKxiVW7KpaTSyoka+Y/NlSJn
         GV810NSq6YFMb9kf9HcgMiOnXoL3K/I2FFZheSG0N6/LA+WO/Gnh5O0JBj4ujlqO70HT
         CKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738102201; x=1738707001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
        b=oUnX0TvIFSBs+TELZ6iCzhUntPXeuK/SSMB2S2cDNtmDm7bDZ7VmKLrpJYeJwbVqJi
         w3DZ8ZCBKPTbsyseDeeUQfT/uib1pknEkrCLVGOqxmLtNHzGK20O6zikGEauUbLIvdRe
         cHe9Dy8oEVDHPVMAMgEy8VkLswgygjt27fGhYWs9We2Sp26T51aQjJFuBtPHmVZj/602
         Wlekv2Es30rsOe838gupziu8Vmb/7t20q5F0BxKuC0y6hCO/2wR3VM6kztJDpEiGOmGb
         1QjVMkUi/oA2igVulIbgyvj9XS/wPzYOGdqjnRCoscMJFEAwdbZ+DI9DeLKfbTK3yAMQ
         +G5w==
X-Forwarded-Encrypted: i=1; AJvYcCXVh9RLjnnA1LYFM+V2Wb2eAOsNv+FowYHSd+pWl3E2mBVwsV5fou5q+Q4uithAcbjzhybARa3SeZqAKOpCLmRB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzw5JSNRMMCQvGoEVsub+jcavKry0R28C1iQ3P2dcO/ucNk9be
	WS4fS27p2e30mzzWuDlexk8KGQGh9+VQAB9kJC8MA6hAcJY5wDnHTr4olJU5mDNkgFYx7HXbuyl
	pz95bjHJR8mAOME6ND5Eck7Lw7M0=
X-Gm-Gg: ASbGncv00DH0NRGRWYoAC16QTiEUVfNs7zceyHgYORHmhTqtGszyqWDiGEgwuDxApxt
	2VR2oQJbz2wkqk3ycOXOCZlD611tjlvYhSv2/13JIISHY2VFhnJIn+2AXA55XRz7eK5iBdLqukc
	53i8Pdz9Q4l2Ky9Axya4lsJBQxWg==
X-Google-Smtp-Source: AGHT+IHgfYpA0VMAacYmWKH7JphTu43Ivw7JChSTcf6n7PHDLpUdxL7L5C0eaN2l2Zyi0/kWh6WQspB+VO1SCyrGhQU=
X-Received: by 2002:a92:cda9:0:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3cffe44793amr7793705ab.16.1738102201257; Tue, 28 Jan 2025
 14:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 14:09:48 -0800
X-Gm-Features: AWEUYZl2-uHarNn2psbsrw1v352rDEu3UlOhpWnD80DHoE6YTIxA3r72Hj27dzk
Message-ID: <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_141002_810767_4D6CE130 
X-CRM114-Status: GOOD (  36.26  )
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

On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > > The context would remain stalled till we write to CBn_RESUME. Whi=
ch is done
> > > > > in qcom_adreno_smmu_resume_translation(). For a stalled context f=
urther
> > > > > transactions are not processed and we shouldn't see further fault=
s and
> > > > > or fault inerrupts. Do you observe faults with stalled context?
> > > >
> > > > Yes. I've observed that on MMU-500 writing RESUME before the interr=
upt
> > > > has been cleared doesn't clear SS. This happened with v2 in the cas=
e
> > > > where there was already a devcoredump and drm/msm called
> > > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > > handler, and we'd get a storm of unhandled interrupts until it was
> > > > disabled. Given that the architecture spec says we're supposed to
> > > > clear the interrupt first this may have been an attempt to "help"
> > > > developers.
> > > >
> > >
> > > Just to clarify, present sequence is:
> > > 1. context fault with stall enable. FSR.SS set.
> > > 2. Report fault to client
> > > 3. resume/terminate stalled transaction
> > > 4. clear FSR
> > >
> > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.=
SS
> > > cleared and interrupt storm is observed.
> >
> > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
> > interrupt storm. From this we conclude that MMU-500 does not clear
> > FSR.SS unless #4 happens before #3.
> >
> Thanks Connor for clarification. I get your point now. I think it's
> expected interrupt storm with #2->#3->#4 sequence is expected.  With
> CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence of
> #1->#2->#4->#3, which is spec recommended.
>
> so, common fault handler can be modified to follow the same sequence, but=
 I
> have concern regarding clearing FSR before reporting fault to client.
> qcom_adreno_smmu_get_fault_info() is an example I gave but other client
> handler may have similar expecation of fault register not changed before
> client fault handler is called.

Simple solution would be to move the clearing of FSR to after the
fault is reported.  It doesn't really matter if it is before or after,
as long as it happens before the irq handler returns, AFAIU.  And
drm/msm will collect the fault info from the irq handler.

BR,
-R

> > > The way CFIE disable is helping
> > > with current patch indicates write FSR is unstalling context and subs=
equent
> > > transactions are faulted.
> >
> > No, it does not indicate that. The interrupt storm happens even when
> > there is exactly one context fault, and when the interrupt storm
> > happens *only* FSR.SS is asserted. I've verified this with debug
> > prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> > is asserted. This has nothing to do with subsequent transactions.
> >
> > > Do you stop getting interrupt storm after write
> > > RESUME.
> >
> > Yes, as long as the write to RESUME happens after all other bits in
> > FSR are cleared.
> >
> > > If you can mention your SCTLR configuration and FSR state in test
> > > sequence, it would be clearer.
> >
> > SCTLR has both HUPCF and CFCFG enabled.
> >
> > >
> > > An aside, If reducing delay between FSR and RESUME write helps then b=
oth
> > > can be done as part of qcom_adreno_smmu_resume_translation(). This wi=
ll
> > > follow spec recommendation and also make sure fault registers are not
> > > cleared before reporting fault to client.
> I think this sequence should address the issue you are observing.
>
> > >
> > > Thanks,
> > > Prakash

