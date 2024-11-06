Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209D5D29FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXO9RRbs3HveLlIZZM8HN1XONyaSb0qVhG5bV+yNI6E=; b=IZe9NszmDgEMGZZLPN+kzteNv+
	qfOuVxKDgU6XV3gAu0Rhz9gvK87wNOULOKd9YAz5vbNcySbppdg0KR+wxAvjP40VH6t3IaADqRIbD
	Xy8JdMP6KpqZgpPvB1Jm0/xe+cvRPzzTqPFj94Nf40kqNPMRLGhPMT2ldK+sdC/cAC66FK07RLAZ4
	voXT+6LNmcnMVs+3u8/iiV07SLePBp9JAjQK2smFYl8scMoej3cALe0ajOjOcip8vYlzNMiuFOM1D
	+cAWZNzmoZlb4GjJKKH8aQ4DbGVEmNNkwz4muqaACYepa9wtGSl9twMjAEWC0+D+/8MEXLyQy5x/F
	dZVWW6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aiR-000000029uY-2kzN;
	Wed, 06 Nov 2024 07:44:35 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aex-000000028tK-09Pa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 07:41:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso5691110e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 23:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730878857; x=1731483657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXO9RRbs3HveLlIZZM8HN1XONyaSb0qVhG5bV+yNI6E=;
        b=vsP0kZlxmZ30ASSh805xLxajnGhwKJLBYQw8AsGvOoWQk8xovpi3o5Gnufxp+/FdFB
         Oi0duaAzavpk5Aaa8AKbhCJf0xuBpDiOWMgXSu/OYtZOPY7R3fG8IHuIc5xc22mzPHt4
         eLuvRLpIkPc93SGQT4rMpImDEY1EYCujJ51N2g5Q2wdjv+sC7/tgnFrqr5BWyzgDvZtH
         uFa3wln/wtlbMgt8919drDrGl69qxe9MEeI71XwuEhUeBcotso7qK6OjLO0tcDIo1VkT
         wFSq3wGWnUAoflQ1eywxnkrLOqGtvFmDIJcN3M/Hyp90FxbW6+lHuXf+c793qWRYvBQc
         T1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730878857; x=1731483657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXO9RRbs3HveLlIZZM8HN1XONyaSb0qVhG5bV+yNI6E=;
        b=Z93uLP7K2LjJWP6rwtFBjWapgvHmTV/7KNTrJARcItygpMwB/5lgNrRTr5DZjzqaOq
         RQ2p0uMnCBYw7TeCxOjY2itqJCAcJ6MycnQi/jAjBxLrW2+2bCosy94xMY6bwRQtWntJ
         P7ao0SysraNgULB/81fl1IIeRcLTrw5WPiEw6Mn8cyRXsHdnSrYsx6buf1xx14cVDChc
         7pUv1pVL53K9v6pBMCmS17E3lOkjjRUl4J72WQAEkJyVOGy6EL1VhTDxXkRvrTA/WEO9
         TB2slYPdCe3yxp+cuyrYpR+uZ+EJx5A4+9BCKeX3xfVlg3R9gzr1k5FA1BBsbwHepRpF
         YWCw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ87ocqoHusH00SHpQr2BaSHfMvRYuIVMxABqVEya7k9+imNPhWr86Wy1u692qJwFGqG/L+sKUUhcxVQby+yJb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6c9hf0guioJBD0WV9J+2DhG6CjawUbvIbUlQGtKz2pxqMAvZW
	VQ/dUAsGPEsUz5O4ly7qTWDnFyQOvi+WqEztZRIjZoqkv7NRS9aDcrG+/XPgto4=
X-Google-Smtp-Source: AGHT+IF0FcdGuJ0vO+niOKjEmLBEPpJB40aDmUzjOkTIqMnmTG4s9w+mRinnl+QEkzIM6X2Ng1KY4A==
X-Received: by 2002:a05:6512:3c88:b0:539:e9f8:d45d with SMTP id 2adb3069b0e04-53c79ea6c5dmr10858734e87.52.1730878857022;
        Tue, 05 Nov 2024 23:40:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c043sm2398395e87.102.2024.11.05.23.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:40:55 -0800 (PST)
Date: Wed, 6 Nov 2024 09:40:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com, 
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <uroldzsi6n7b6hyiutanqfqyqsny65zr4fzyggsmvqsmyfayrp@u5c27k3yi5cf>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
 <ygd6bryp73jgsm5zggy2jz4uc42dehht2e6ht5f6yowf74c6ns@u6dul4rnybt6>
 <20241105113723.GA12600@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105113723.GA12600@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_234059_111759_1BDB2E22 
X-CRM114-Status: GOOD (  54.97  )
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

On Tue, Nov 05, 2024 at 11:37:24AM +0000, Will Deacon wrote:
> On Mon, Nov 04, 2024 at 01:10:12PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 29, 2024 at 12:47:09PM +0000, Will Deacon wrote:
> > > On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > > > 
> > > > 
> > > > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > > > > > Default MMU-500 reset operation disables context caching in
> > > > > > prefetch buffer. It is however expected for context banks using
> > > > > > the ACTLR register to retain their prefetch value during reset
> > > > > > and runtime suspend.
> > > > > > 
> > > > > > Replace default MMU-500 reset operation with Qualcomm specific reset
> > > > > > operation which envelope the default reset operation and re-enables
> > > > > > context caching in prefetch buffer for Qualcomm SoCs.
> > > > > > 
> > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > > > > ---
> > > > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
> > > > > >   1 file changed, 42 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > > index 087fb4f6f4d3..0cb10b354802 100644
> > > > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > > > @@ -16,6 +16,16 @@
> > > > > > 
> > > > > >   #define QCOM_DUMMY_VAL	-1
> > > > > > 
> > > > > > +/*
> > > > > > + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> > > > > > + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> > > > > > + * buffer). The remaining bits are implementation defined and vary across
> > > > > > + * SoCs.
> > > > > > + */
> > > > > > +
> > > > > > +#define CPRE			(1 << 1)
> > > > > > +#define CMTLB			(1 << 0)
> > > > > > +
> > > > > >   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> > > > > >   {
> > > > > >   	return container_of(smmu, struct qcom_smmu, smmu);
> > > > > > @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> > > > > >   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
> > > > > >   }
> > > > > > 
> > > > > > +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +	u32 val;
> > > > > > +	int i;
> > > > > > +
> > > > > > +	ret = arm_mmu500_reset(smmu);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
> > > > > > +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
> > > > > > +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
> > > > > > +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
> > > > > > +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
> > > > > > +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
> > > > > > +	 * during reset and runtime suspend operations.
> > > > > > +	 */
> > > > > > +
> > > > > > +	for (i = 0; i < smmu->num_context_banks; ++i) {
> > > > > > +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> > > > > > +		val |= CPRE;
> > > > > > +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> > > > > > +	}
> > > > > 
> > > > > If CPRE only needs to be disabled prior to r2p2, then please teach the
> > > > > MMU-500 code about that instead of adding qualcomm-specific logic here.
> > > > > 
> > > > 
> > > > Doing this on MMU-500 code would make it generic and reflect for SoC of all
> > > > the vendors on this platform.
> > > > We can make sure that it won't cause any problems in Qualcomm SoCs as we
> > > > have been enabling this since for some years now and could not
> > > > observe/reproduce any issues around these errata.
> > > 
> > > Unless you can explain definitively hy that's the case, I still don't
> > > think we should be second-guessing the core SMMU driver code in the
> > > Qualcomm backend.
> > > 
> > > > But we won't be able to guarantee the same behavior in SoC for other vendors
> > > > where these errata might still be applicable as per [1] and [2].
> > > > So as per my understanding it's safe to include in Qualcomm specific
> > > > implementation and not changing the default behavior in all other vendors'
> > > > SoC even if they are not prior to r2p2 revision [3].
> > > 
> > > If you want to gate the errata workarounds on policy, then please follow
> > > what we do for the CPU: add a Kconfig option (e.g.
> > > ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> > > the relevant errata aren't all "rare") and update silicon-errata.rst
> > > accordingly.
> > > 
> > > Then you can choose to disable them in your .config if you're happy to
> > > pick up the pieces.
> > 
> > Is it actually going to work? For most of the CPU errata we can detect
> > and limit the workarounds to some class of CPUs. For SMMU, if I'm not
> > misunderstanding something, the errata will be enabled by default for
> > all SMMU-500 implementation, so only very few kernels, targeting only
> > the Qualcomm hardware, can get that disabled.
> 
> We can add checks based on rXpY per the erratum documentation, but Robin
> was saying elsewhere in the thread that some of them are still open (i.e.
> unfixed).
> 
> So ultimately, the decision to disable workarounds for known errata on
> broken hardware is going to be a niche sport, yes.

Yes, I understand that. I'm just trying to understand if we can have a
better solution than having errata workarounds enabled on a majority of
the kernels (which means less testing for the non-workaround-enabled
setup on Qualcomm devices).

-- 
With best wishes
Dmitry

