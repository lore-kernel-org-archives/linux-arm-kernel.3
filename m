Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5855C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=; b=A/wny0YVy+Aamt6Ek3dnDZWuNX
	UphIcC2q/tWUfloEgbgiE1VIGlouUIfBBiBPsn6l++UzCkaWBooCoRwpYQKlaIS/Zg1MLjTrQHUAi
	JiaT5creASOFFuajmjOAIgc5XlSLKQmWgzQCDqms6vKICxyTpjyxEP/SeTpkdnzmYMpbgaycFvWAa
	GFo9rT/gfe99wGc2Ie0cH81xvpD/Ymfc+0QXkXRW9XxhJYy74bKRhMM3zjyicC+JXbsWh0qwxS0Pe
	ohTK1PBuv/aF9XADdG96KZxwsrQu9xLHzYS11DytlTf8ZpdfRGQ8gU8MeL2l/OJP3XyMNOwXRX2ON
	uSpcVP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOh3-0000000DLTh-2j1o;
	Tue, 06 May 2025 20:15:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL7u-0000000CfNh-0a0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:26:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-739ab4447c7so511992b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746548797; x=1747153597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
        b=PnnijZcVWhIJcYrilu1TzGtK5sVeDyx+EWc7+674ng6Cpjr9zdQznKlwgj/YN06/ki
         2LrVBUokjZmuGr4Ukt5oxXoODN3BODz0YELg35898epBEzkQc0kBS18e6F67+3pP5RCX
         p+8gq72VBuvfsXCqLJalmH4WoX7ILSw5cyIoD/p9Znj/xq0U7FR6IYW2dMO9lXBZ5MOb
         oQSjC3qm3/CkZW/fN3ZbCO2w7VD/36CIqNT8Q9bJID0p47jrDycpAw2fL3PoReMAoQTL
         7p+QQkQ2xDdRgwUaIH92dx/SQrfWrVxxJmt4/F0yHQ3DHeeN87jKiLxneAeufdTHlxv5
         O7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548797; x=1747153597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2iEPT31lWJmfZ711HkWVQ8QdQyTw1Ihj+viAfDs+a4=;
        b=GZLaKDoewPsNx95iiq9omDDPGJ5qAgIkqcwVRDzOGUSXaTmlz3A+EjphcDz7aoMoN2
         g+O8FWsbd/B7DcWemEs2VJHjnh3E3Gjzf+Ye9sp5Q6Aa5AVTy9ZrOnkU0hBUJ98iV7TO
         Dapz12WFXNHmm0ZFanqX4+J3FBX/nWYANqImDPJMcBQIKZg2RWcr/fuNxRze4ZvBgbjW
         1yEiYigAz/s0zgrep5PqpldqaobPSbwcPVt1sxzlOwaLCrwGxdEiJSQuJTxVJFVKvrAn
         9lDgux7awq3EQt2nqPKJbOJc7j/YkemV4v+kK3OBhwft09S/PgcdUBpeDYKyFfdkF4xj
         kZCg==
X-Forwarded-Encrypted: i=1; AJvYcCXnDBFGMr385lUMIpV62sALvs7lnRxsipbLh9GH4tT7HKw5iUi3uB2r+JJ3vYwVagX2XlRWJ77ZuN5l7KVpvvAz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5sXLcemt75mdotvqfl757tGr202daSONGGacjXcP0vPTRalVF
	RT0gmYrYzy150QoOBs37ZJx/3GhMPR07zpe9MbHdwXJoj5ZtTtDCwxlh+IlTAiwVYFRJadXcpX0
	mmNm40XWK+DfgPZuu81kFFgN/0ww=
X-Gm-Gg: ASbGnctH2bw2fgUuZBRq4xuRM5WCgdAVVS8EVPmp1L4iJbU3WzgYW9GS7wADReSjVqe
	4s7biBS99C/faIUZetro4zRf5gUwl/+s+4/JRvuIP44KtV0qTWa+VmqsgAuAEJMpUoHof7cHnog
	hs7awalRX/XZJR9S56NdhsFw==
X-Google-Smtp-Source: AGHT+IFevbIXo6chZ46DVNlJBWVZ9S7rGrPtFFMLAbHqHbciNEKnYEm+KoSXMjS7AzymQV/ccrlzB9i7DV6tVCsE5Kc=
X-Received: by 2002:a05:6a00:4296:b0:730:87b2:e848 with SMTP id
 d2e1a72fcca58-7409ba60c50mr111599b3a.5.1746548797029; Tue, 06 May 2025
 09:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
 <20250319-msm-gpu-fault-fixes-next-v5-1-97561209dd8c@gmail.com> <20250506113246.GA723@willie-the-truck>
In-Reply-To: <20250506113246.GA723@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 6 May 2025 12:26:25 -0400
X-Gm-Features: ATxdqUGyVeePAC0AKGU6Pbw5gC5TE6nCefsVqalCzAGzu-h58HCMKVxLU73Zb-o
Message-ID: <CACu1E7HXd9bUWwPCa_XxkQYRwCg6aobr8snFzArE=D99Z+iRJQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092638_173510_BEBFC4E6 
X-CRM114-Status: GOOD (  21.63  )
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

On Tue, May 6, 2025 at 7:32=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 19, 2025 at 10:44:00AM -0400, Connor Abbott wrote:
> > This will be used by drm/msm for GPU page faults, replacing the manual
> > register reading it does.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 ++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c            | 35 ++++++++++++++--=
--------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h            |  7 +++--
> >  3 files changed, 29 insertions(+), 19 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/=
arm-smmu/arm-smmu.c
> > index ade4684c14c9b2724a71e2457288dbfaf7562c83..a02078eb968b81a35c1c086=
ed7007ea2a453ef94 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -405,13 +405,20 @@ static const struct iommu_flush_ops arm_smmu_s2_t=
lb_ops_v1 =3D {
> >  };
> >
> >
> > -void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, in=
t idx,
> > +void arm_smmu_read_context_fault_info(struct arm_smmu_domain *smmu_dom=
ain,
> >                                     struct arm_smmu_context_fault_info =
*cfi)
> >  {
> > +     struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> > +     int idx =3D smmu_domain->cfg.cbndx;
> > +
> >       cfi->iova =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +     cfi->ttbr0 =3D arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
> >       cfi->fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -     cfi->fsynr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr0 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +     cfi->fsynr1 =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
> >       cfi->cbfrsynra =3D arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA=
(idx));
> > +     if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1)
> > +             cfi->contextidr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_=
CB_CONTEXTIDR);
>
> I think this leaves 'cfi->contextidr' uninitialised for stage-2 domains.
> We should probably either zero it here or just zero-initialise the whole
> 'cfi' struct in arm_smmu_context_fault() with a:
>
>         struct arm_smmu_context_fault_info cfi =3D {};
>
> line.
>
> Will

The next patch moves the context fault info into arm_smmu_domain which
is already zero-initialized.

Connor

