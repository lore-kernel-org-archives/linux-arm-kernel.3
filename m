Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29C5C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=; b=m64jZoB4ZIAM4dNa504S+yXfcm
	8DlB6/pMypc0OZZrFdORD/rUR7tEWhNdAIDw6zBtFKR2yZ7GfVd4f9iKOzpu1uMNu+PVLWvkrQrwr
	r/fyeFi41TUbbvArYasvZl/TmpF2bNhZ+1keaFeVgBPK+vJol8S005BkL+G6tMMhobnWbvg3rtff/
	GuYQdaFzojpS51K35fd0jDIoFwLk6U4BC+wF9Nfn1JLWMUoXcP/Nk8/vPC9tutDS0Rqw7hMVJHdqr
	mSUemyOf4KjwzS7u/DHckUe0psM0Am25NVTdmDxbrWf/OoLCHg+wpBAPsq+1yHL75kvcYlKk01Ncx
	KhvEPScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5av-00000006pPm-3vwb;
	Tue, 11 Mar 2025 19:48:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5V7-00000006nxA-1nxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:42:54 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so1435840a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741722171; x=1742326971; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
        b=N9qgNhmfps+OgW1/AW/rmzuJ1HRIA6tpkuxo4mqBUrnWPjqASiTqHnynya3b+1oTxg
         xMJyEhhjFaXAOphqm7EnhvJw/OP/GzxJmjqLxOgG/RiatBqmuNFwABKV8nyKiakzqmit
         Oemd47qVTVNfXGsUjR2yqXBGtYPMfza2zxlJr5Tbeg0kjDpzg+o8WKFcXeGVaOkeHFrA
         X7CoegycS6Z7JcOdITMKhydnTfCvaRN9L/s11wRsZ15ZuTrA15KAJnC3s3Y9uCh7g5Mf
         EioyLGh5La7g7FfparBDJfW/hc7gPxbSAOuc2IaQyCwj/qi/009YXGeG7ZH8b2mkxd2O
         yDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741722171; x=1742326971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8N/4+Bu0y09vjMihB3VFFSKzM9LtDAemE75jVPYGVnw=;
        b=a/IQVJ2tz+/vAzkl7d56vWouSEdsn+39xthRzd+B4g7SJ9smw9Oycfv2XcP88K4rG9
         PHybFLnoKD3h/zPrLAEWVWfeaPrzfr0Xir5rAchoG/t21QN6ZsjeEU1UMo2jbLfl9aH2
         Ndj1jjTSizipZRbdhmPB4Ys2vwfBkjzuX1VzvwFgLiRI+m7tlIJc0OvDPQFHiLbyaz6u
         5VdIZbNt2+qoBfL0L9Yy/hOeOnw9LWm5t+TYdET+PcGehBKbkR9K2QBcb4cULVm03LZZ
         9Ogo/M5mb+v5SNooOeTH+cmm+5PPXyFK3Ic7CTqWplHKFnu6XvfmFjHF0oKd2mSsN9hZ
         fvDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9LYaAwZvtWdOryBkLPUBhEQP0+40xL9G83SoNoZm1astkkc9lBmp9D195chC6/x3HJW+VTNssyvrQb90f7XQn@lists.infradead.org
X-Gm-Message-State: AOJu0YzSA/MSOSAk0K7fAn7S1hXndr5ho1/Py3uUDGpSdKWRgHlRsz9h
	6DU2Bn2R/Fa/kdWNKC3mVfB0bdhiFUwkXWpVcoPLrmvszY+BHN1B8ACWcGzO0UG3eaWvtMCuj3k
	bmrzm1/SACIkBbf3dPL3fK9Xq4aA=
X-Gm-Gg: ASbGncuS06U3DzH+2VK8hk0iDgHAkB90yXSRArVX49dEPZr1KJdU6X3RVO1+BLipRNN
	25Gu36lf4diS2b92B52EOHE7p9pAexBTQpwdXsWcubaQddZGNLbr1rnH1JuLJ/DFU5KtjRo3NA9
	oFs0BDMiMsPHL7l+FuheCURlduy5Ol777zjGcq
X-Google-Smtp-Source: AGHT+IFUV+t76koSVwvfP0DiZwzaDgX4TU97m1RDJMgX9rF6Maeao/NZF5n1twVNajoiVfnFuWNdcIiFIJEURljqxUQ=
X-Received: by 2002:a05:6a00:3e04:b0:730:9989:d2d4 with SMTP id
 d2e1a72fcca58-736eba65be7mr2466708b3a.3.1741722171206; Tue, 11 Mar 2025
 12:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-2-be14be37f4c3@gmail.com> <20250311180807.GC5216@willie-the-truck>
In-Reply-To: <20250311180807.GC5216@willie-the-truck>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 11 Mar 2025 15:42:38 -0400
X-Gm-Features: AQ5f1Jpiv6Ky6TiyCXBXNy8BjxnsE1wP6MKIErri1CZPIQdm5BNmyqGHT0u49Nw
Message-ID: <CACu1E7Hw6vGbTQ7t-Hj3ziycZhPxtOGSDkt7o4fNUx91KDcXfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] iommu/arm-smmu-qcom: Don't read fault registers directly
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124253_473648_F3839900 
X-CRM114-Status: GOOD (  23.91  )
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

On Tue, Mar 11, 2025 at 2:08=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 04, 2025 at 11:56:48AM -0500, Connor Abbott wrote:
> > In some cases drm/msm has to resume a stalled transaction directly in
> > its fault handler. Experimentally this doesn't work on SMMU500 if the
> > fault hasn't already been acknowledged by clearing FSR. Rather than
> > trying to clear FSR in msm's fault handler and implementing a
> > tricky handshake to avoid accidentally clearing FSR twice, we want to
> > clear FSR before calling the fault handlers, but this means that the
> > contents of registers can change underneath us in the fault handler and
> > msm currently uses a private function to read the register contents for
> > its own purposes in its fault handler, such as using the
> > implementation-defined FSYNR1 to determine which block caused the fault=
.
> > Fix this by making msm use the register values already read by arm-smmu
> > itself before clearing FSR rather than messing around with reading
> > registers directly.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++----------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 14 +++++++-------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 21 +++++++++++----------
> >  3 files changed, 27 insertions(+), 27 deletions(-)
>
> [...]
>
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/=
arm-smmu/arm-smmu.h
> > index d3bc77dcd4d40f25bc70f3289616fb866649b022..411d807e0a7033833716635=
efb3968a0bd3ff237 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -373,6 +373,16 @@ enum arm_smmu_domain_stage {
> >       ARM_SMMU_DOMAIN_NESTED,
> >  };
> >
> > +struct arm_smmu_context_fault_info {
> > +     unsigned long iova;
> > +     u64 ttbr0;
> > +     u32 fsr;
> > +     u32 fsynr0;
> > +     u32 fsynr1;
> > +     u32 cbfrsynra;
> > +     u32 contextidr;
> > +};
> > +
> >  struct arm_smmu_domain {
> >       struct arm_smmu_device          *smmu;
> >       struct io_pgtable_ops           *pgtbl_ops;
> > @@ -380,6 +390,7 @@ struct arm_smmu_domain {
> >       const struct iommu_flush_ops    *flush_ops;
> >       struct arm_smmu_cfg             cfg;
> >       enum arm_smmu_domain_stage      stage;
> > +     struct arm_smmu_context_fault_info cfi;
>
> Does this mean we have to serialise all faults for a given domain? That
> can't be right...
>
> Will

They are already serialized? There's only one of each register per
context bank, so you can only have one context fault at a time per
context bank, and AFAIK a context bank is 1:1 with a domain. Also this
struct is only written and then read inside the context bank's
interrupt handler, and you can only have one interrupt at a time, no?

Connor

