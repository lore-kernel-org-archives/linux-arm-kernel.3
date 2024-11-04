Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBB8D132AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdH9jagT/8S5NPF4fTku+zGDNqYYEhhoFHFFqWBZ6As=; b=jEDtSI7+osl4GQiVpc1/XNbs0x
	NAI79st5bcvR9AOEJfrClAFesUFjvC9DY6USfw/TOyqA7bDdLGAfpEYDh3TlYxgP+JTmeCuc1cy/+
	J+JQ9v1lLnMKGOKHSXyCDIIs3PQue7j7hD6bJYQINKWWya5xhv1SGWLxhKYYGL4BKQeOIGtSqlaPv
	vgyYuQaVFe9fHeTUvgL0Xh8lnaKm67jeVVkUrpeUdz7Ed/MVBzGyJfmfYAdYQvrJCLpWvuCqzJc+/
	GDRBDijMMv/4rlhsvItQPGaNZJGxrenzpXVaBln5rYZ6Nami1HR0viOTjVhsXnw9P1HAh73Ljxxo3
	3sR636wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v09-0000000DRyr-2raK;
	Mon, 04 Nov 2024 11:12:05 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uyP-0000000DRWr-3LqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:10:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso4131517e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718615; x=1731323415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdH9jagT/8S5NPF4fTku+zGDNqYYEhhoFHFFqWBZ6As=;
        b=J/oW0j26bhIe77aesCTHOHKXlrT5UrWiiLHM69OpaYyV0RUODJLLqWk9q1tE9BTiX6
         HG5sbEX+g8g4Ne5EaIDOBNEVhIdn6HjDKOjCePPL5JlDI1CdJP+gHgJwRo88xLoS2yY1
         3vin6tEkAWnCk+RikLHl0UkdWWubyP7mnq96Y7OOFYI2bXfWRBZnx+1Y/yolPBk9JIIx
         zcas7CtJ37xz+ujb5p4a25swcq66iwAlBC69Uq3YA6kW2k/5sxhNhq38htG2duy/V0iJ
         CTTiyfhInt3h29zuZmmQ3yqBsZnmUAZIup5kZU6vbh/k4yStxYw6xhrSV1N3xIPlfKON
         4S4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718615; x=1731323415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdH9jagT/8S5NPF4fTku+zGDNqYYEhhoFHFFqWBZ6As=;
        b=UR0V+T/+JNE7U/6V4GnVHqlM8qi3P7CSMyM0p+zs36iMA0MeMe5vKj+Yu02L+okOtc
         dRqXNAbas1aQxfSzbrUeg336yg2jz/IoeNHsWB+WdCO4gLT5qse5dblCuHL9+JLCRDib
         NqHJ/V/Tjrc6DLgcvWeTcdTbRUo4es8Gad0YNWUbu0ZwJ4Pi6mj1AS7OR6PGfczFcquj
         tToBncuUTs/C9AI6UCNu+qG9Ap78ORvMpX9/pDcW2JrgYiwdMdnRfVMnig0h5/v6gia2
         yyMCkzG/hcFBOmRFxXuYjo7Lo1qJ0ob0vxiAxRV02OwMJbRTHgxNSyP3d5gGfrhqOlTP
         v7bA==
X-Forwarded-Encrypted: i=1; AJvYcCWi7qau7QeIdAT+fZs4nxzFjBdvMfJMiEfnskq8xRHgAucKJgjPYXStG475wlQ97dBff+aczr6ML2ZN/N833MqO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl0tGyc2e7XXW9XMtr+yjKA1WprK4b5D97NM95JK+ZxtLAlkrL
	vpkFQ504e2qd9yyjRe0wLBui1CnZA/twM1apca7q+ekw/NTwfk61fhJ/AmPSmYY=
X-Google-Smtp-Source: AGHT+IEQUhS4emFgL3X45Om3GNfU0TsJqApFtwGEHEcfNMJnwL431cR9bOTneTsVxJQJXash7yfV5Q==
X-Received: by 2002:a05:6512:39c4:b0:539:8d2c:c01c with SMTP id 2adb3069b0e04-53d65e11aaemr5273106e87.41.1730718615371;
        Mon, 04 Nov 2024 03:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbfbcsm1639983e87.199.2024.11.04.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:10:14 -0800 (PST)
Date: Mon, 4 Nov 2024 13:10:12 +0200
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
Message-ID: <ygd6bryp73jgsm5zggy2jz4uc42dehht2e6ht5f6yowf74c6ns@u6dul4rnybt6>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029124708.GA4241@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031017_865290_ACA2B0B1 
X-CRM114-Status: GOOD (  46.58  )
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

On Tue, Oct 29, 2024 at 12:47:09PM +0000, Will Deacon wrote:
> On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > 
> > 
> > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > > > Default MMU-500 reset operation disables context caching in
> > > > prefetch buffer. It is however expected for context banks using
> > > > the ACTLR register to retain their prefetch value during reset
> > > > and runtime suspend.
> > > > 
> > > > Replace default MMU-500 reset operation with Qualcomm specific reset
> > > > operation which envelope the default reset operation and re-enables
> > > > context caching in prefetch buffer for Qualcomm SoCs.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > > ---
> > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
> > > >   1 file changed, 42 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > index 087fb4f6f4d3..0cb10b354802 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > @@ -16,6 +16,16 @@
> > > > 
> > > >   #define QCOM_DUMMY_VAL	-1
> > > > 
> > > > +/*
> > > > + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> > > > + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> > > > + * buffer). The remaining bits are implementation defined and vary across
> > > > + * SoCs.
> > > > + */
> > > > +
> > > > +#define CPRE			(1 << 1)
> > > > +#define CMTLB			(1 << 0)
> > > > +
> > > >   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> > > >   {
> > > >   	return container_of(smmu, struct qcom_smmu, smmu);
> > > > @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> > > >   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
> > > >   }
> > > > 
> > > > +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> > > > +{
> > > > +	int ret;
> > > > +	u32 val;
> > > > +	int i;
> > > > +
> > > > +	ret = arm_mmu500_reset(smmu);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
> > > > +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
> > > > +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
> > > > +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
> > > > +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
> > > > +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
> > > > +	 * during reset and runtime suspend operations.
> > > > +	 */
> > > > +
> > > > +	for (i = 0; i < smmu->num_context_banks; ++i) {
> > > > +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> > > > +		val |= CPRE;
> > > > +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> > > > +	}
> > > 
> > > If CPRE only needs to be disabled prior to r2p2, then please teach the
> > > MMU-500 code about that instead of adding qualcomm-specific logic here.
> > > 
> > 
> > Doing this on MMU-500 code would make it generic and reflect for SoC of all
> > the vendors on this platform.
> > We can make sure that it won't cause any problems in Qualcomm SoCs as we
> > have been enabling this since for some years now and could not
> > observe/reproduce any issues around these errata.
> 
> Unless you can explain definitively hy that's the case, I still don't
> think we should be second-guessing the core SMMU driver code in the
> Qualcomm backend.
> 
> > But we won't be able to guarantee the same behavior in SoC for other vendors
> > where these errata might still be applicable as per [1] and [2].
> > So as per my understanding it's safe to include in Qualcomm specific
> > implementation and not changing the default behavior in all other vendors'
> > SoC even if they are not prior to r2p2 revision [3].
> 
> If you want to gate the errata workarounds on policy, then please follow
> what we do for the CPU: add a Kconfig option (e.g.
> ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> the relevant errata aren't all "rare") and update silicon-errata.rst
> accordingly.
> 
> Then you can choose to disable them in your .config if you're happy to
> pick up the pieces.

Is it actually going to work? For most of the CPU errata we can detect
and limit the workarounds to some class of CPUs. For SMMU, if I'm not
misunderstanding something, the errata will be enabled by default for
all SMMU-500 implementation, so only very few kernels, targeting only
the Qualcomm hardware, can get that disabled.

> As an aside, I'm happy with the rest of the series now.
> 
> Will

-- 
With best wishes
Dmitry

