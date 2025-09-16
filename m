Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4B4CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAXPi8+KuwRaa3qx04ySFQpznpxpBD4ALEEO3wmFkAo=; b=PtNUx2C2jtBVRy8FxjYTgeBlQu
	BezESDW9I3srXQqGXgbp2BX29cWRUf5w5TXEWdvDfAfDTh2L/lGnUKzkf6jGiCZmIMysNNcnch67V
	uLYELIO3SbWbCxh5gIFzwtGq25rdT6PUMazqzgsRiUsghoqC7c4auHTVWbSG7OSvRogZCZWIy0h3W
	1L76rCdbyE1i9MyudtCN5LOMV8QF8bDd7/dhu/DeRZ4iby7qrB6A+WXN8Yh5fITqV/EcAdctfnmy3
	56SSZXbG8L3k7yjqIBV87sJsOfSYSM+88fWqyv47Fp0ZFP1GcmTppGqf4O3mezpwnFmfOVXcD0sGa
	eZZq3+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWOY-000000083BT-40dV;
	Tue, 16 Sep 2025 14:10:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWOW-000000083B1-1KZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:10:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f28aba94cso53925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758031854; x=1758636654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LAXPi8+KuwRaa3qx04ySFQpznpxpBD4ALEEO3wmFkAo=;
        b=FiMAq6yxn9HS2NdIPdlS3z0Pjg9/gz7aEFJQqHJNeghovc/aq+oR9FCdZaweR4FbDg
         I4QszTlPMfLuo0Uk0P/DI7ir6yP8a7tIIvGUKCcMfpff5EtmAELyAx/oEUJTK5Zo5WJr
         zcvPPUMq9qyKFTEGnGj1sM+YsVAPPHkntNx/NMIt5LkPpDRmRwQACC9S559/cF9ATPg2
         ITi4zMur1XOIAMqTDIGj+g9MP3A3v9wfU13DTmrFJQj1Mq2Tn7KB+SRSDGaPQx4509h5
         BkY+39YR0mV/afApmLIC1ZvrA2sHoAVnB5Ggag5H1k6G9euJuKUA4dA9AWu9kyyH7PEb
         AhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031854; x=1758636654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAXPi8+KuwRaa3qx04ySFQpznpxpBD4ALEEO3wmFkAo=;
        b=grPccafqaxbe9sPWh6h8w5lWbzVb516fPItUKl/2vOdN9ex+g4t13Tbd2jvdFWPjDw
         gEutpbjovy132wbprnM76iNureNBl6HF3UrvkE+BZUm7CIFHN8PhCz3iBkConGNecX1S
         yUPkAePD8G9off83xDXmTSrTooagN4JA92sZAxoHk97i1fvrI7SNrxbW2sl6VyhasRUT
         eNxo2M/5Z/y4dQbkmXNpEuRKjc06kJ9N7H4wLZRHh4rTI+cP5P80UAJrvtFk2U0qlS/a
         nCGR+vaQNDXNTGc5o3LIlbK2kuIzQQZsv+CJ2+fgF6s5UPBs96EHg80BA0uSaLNJF2Vz
         7LOg==
X-Forwarded-Encrypted: i=1; AJvYcCUP+4WGEJMvuc7yFs+9v1fUcmzETcyN7fYiZD0KWxX8HVAKb2QuSCkaBigdspE8LYA155OWAZBsfl06vDY0pAXP@lists.infradead.org
X-Gm-Message-State: AOJu0YyYQy8iWdameIc63yxbo92yWkXQ+41tJmfTjal3NkzrAGMsy+Rh
	BqEWBNT1kOhUnyQwoyoy3Y5JMwgRfX0lky/1XuJBL5DpYAHArHVkAsin9LwmYL76gw==
X-Gm-Gg: ASbGncs+AR/WXGiYEk3sXdj6CKmf8AoKKFwAzEBLYdTRDDhJC6OTsciZXYnm8DJV+/H
	5WWOGfmLKPoXoItX056emj7PriRaOtj7wduz9pCDzKeVQK9gKP24XR/bd24dulOalbvCp2k8ZiH
	6Uq/Lt0P8SMmLP5Dv6XqpkdDsrtDQxG1kFB9KLd2CqCNRmR/sDQVhP66GcgnZ/owtmYadH6XR5G
	Emimy54k8We8p4M7woCUtljoWYRP+FRhAF9QnGWKAZ27x2PAong7275UX33dsFwjx/KnC6L1wUX
	MMqCab1tuXfJW2zFVHsjcTDH4fz/5InrBHlmLqbtxn0A4FAqyeWz0gcm0Abmx/0FnKqWJbCraIu
	8SnlGmJoKKt6CAUGg0jzqo4AU+ZTDi8SH2fXDcV4ojLVGKwU5le+8J2nmi+F/DDRMs7LkwjM0vy
	AeOhU3
X-Google-Smtp-Source: AGHT+IGcTe1ECO2GamWj51rf4zuyd3cbzaJnBRpBuslk+LBrCQjMJhqgUMk66hHXtNsu5/Krbmp77Q==
X-Received: by 2002:a05:600c:3b85:b0:45c:b4fb:f0b3 with SMTP id 5b1f17b1804b1-45f3278c3admr1396305e9.3.1758031854210;
        Tue, 16 Sep 2025 07:10:54 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c9d91sm219090395e9.20.2025.09.16.07.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:10:53 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:10:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 06/28] iommu/arm-smmu-v3: Split code with hyp
Message-ID: <aMlv6rLaZ80j33OV@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-7-smostafa@google.com>
 <aMA4UpDgLDuiGYf8@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMA4UpDgLDuiGYf8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_071056_371048_EF217B35 
X-CRM114-Status: GOOD (  22.47  )
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

On Tue, Sep 09, 2025 at 03:23:14PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:34PM +0000, Mostafa Saleh wrote:
> > The KVM SMMUv3 driver would re-use some of the cmdq code inside
> > the hypervisor, move these functions to a new common c file that
> > is shared between the host kernel and the hypervisor.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
> >  .../arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c  | 114 ++++++++++++++
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 146 ------------------
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  44 ++++++
> >  4 files changed, 159 insertions(+), 147 deletions(-)
> >  create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
> > index 493a659cc66b..1918b4a64cb0 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/Makefile
> > +++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
> > @@ -1,6 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
> > -arm_smmu_v3-y := arm-smmu-v3.o
> > +arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-hyp.o
> >  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
> >  arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
> >  arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> > new file mode 100644
> > index 000000000000..62744c8548a8
> > --- /dev/null
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-hyp.c
> > @@ -0,0 +1,114 @@
> 
> Given that this thie is linked into both the kernel and the hypervisor
> objects, I think I'd drop the '-hyp' part from the filename. Maybe
> something like 'arm-smmu-v3-lib.c' instead?
> 

Yes, that makes more sense, will do that.

Thanks,
Mostafa

> Let the bike-shedding begin!
> 
> Will

