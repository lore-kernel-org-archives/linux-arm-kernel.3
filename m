Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4C2D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlFI2bCRqxpqLkg/AiIg8IcS+TSdYsio6x9QrT+ERVQ=; b=UKjtoLZfugVX5TchQ+v7GPDGak
	+xHbjwkXFgchilmev0a4Mzxg9KmotUQTQ64lS5mzl7ITpePjusBfxw/WzRTH9PMcr2C02CWTgb3DN
	qK7DT4Caf0usLpn4j5KZnwCirPyqaaNHqic2shz8Swtmyskt1VP08QP5gMo41gholpLbE6Uxdw4gd
	7gQrUKuJLHn0Z2Dc5uz1a/kDQ5OVc6iXtidQeJVkZeBw8uE3MiV5u3EL17b/OccRBbKGzyPzHTHZB
	zsqVMbsbPl1pb381bc49en2yQUDS4/uyrrVNmT4r5djHZ2DcwL9LbgtOw6Rus9G4lmwriuVgQRjGn
	p0VxVL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwy0-0000000EGSc-27kl;
	Tue, 09 Dec 2025 12:37:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwxx-0000000EGSA-3chi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 12:37:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so62765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765283835; x=1765888635; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vlFI2bCRqxpqLkg/AiIg8IcS+TSdYsio6x9QrT+ERVQ=;
        b=go/tVijzTZyeFBBcQAIbPI+WDarVzd5f8Rv5LFw+4ySYjsDvkYP4Q7r15sC4+4Mdiv
         oRogE5fMziIDr4t1meRRZQ+ApcKFK1bnJUd/sFQhWUbDXFY2D+Nu+haTgDPdbdvEz0xY
         KcVAra3gP4xBTT5RKEchzRqE6lUnI3OWAsfjedktaFDVX4LpmPiLC0pXNUMBuoThAoXc
         kVbOV3KjikdpjfTFxpoKETOTagOHZPB8ugd7jcPh2lmlDsRmy2ta9eF8UTlFdTcnageE
         VGTvf+J1UXdPnXMrKeGDwRto+LY0qpW1QoysuyBEIdN2TqJ7Vyb0yz2TVvdwl7M+EYlf
         Ds/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765283835; x=1765888635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlFI2bCRqxpqLkg/AiIg8IcS+TSdYsio6x9QrT+ERVQ=;
        b=cXNt7CuNU4PdQFOGQnISPeF/tZljZzyj2+9AEEhSKwWdTz3Hhuu93YmqL2Qsl/RXax
         MTXjXc2akvnBsewkiBfXVRbBhQDhRxKY1BYPKBEM+nrSY0CGqz40ceugxuJIaloIInTT
         cJvJvz3/Q5suoclmNtdmDztWQvFk+n3lKp4xg5/V9Hd5og8iTcosfL26410Rebz0HRtN
         WGkVbcw0DJczo9XrrSR3jp0AyVCxDsRUy9nTKJBTSjwSvLu/jYwo8QyfwGVXoF07hBJR
         JBM16EoAmxIncVE5xXLIohLDK5CYRGRoEwA1i/WKEIQ81dlf8uOVvEr+DbJqHciZz0na
         nN8A==
X-Forwarded-Encrypted: i=1; AJvYcCX0VcYEuaNfLCHaYs4OikDRw0HJ0MLvxCD6414Q5XU7arV4hUHhtg+DujyIuEYvHogLFwf1dMk0l3nymh4MRESu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy75WxE0jjkFSS8rY4wZsKQd7I91meKnNLAFYWICnmEoO5VFXmg
	i4F79ErGFCTh10aCvHBfAe4s4unusV0Zl/gRrTsd1of7X/8omSywWkKE6QaId1psDA==
X-Gm-Gg: ASbGncuM1D+LgEBqyDbWG8pH+Np4S5wOsc5jNWbLM5QFus6ZfhQQJDz5khyNnQgjX1R
	T7Yal+JMqRu15wzP5jdxjbhySyBm0tGnMkc27WjnQZMjJunXkjlFLj26VGzok2aFmmBn72fou6E
	bb3aLkCNe0KK7X0Q2s3w29OVVAFFBVz/VJSf3rrvap3ye9FES6go4ZpEL3Xn8AEFQ3lMhQp5q59
	3KVtt8gCnIHOuEPJPQ02ZrLvXZ8m/I1N5hrT6W59FdQh6kxIgKN8xImt8kj5ciiHkSB+lN+Ixcz
	pDfegEU32NjOngVYQLRPMaFTj419Xt7L8YopUDl0FCyVmZ3TNxNSWEY2kUf8LXNMDxSjhxNbrAB
	qNpWZW2GKa0556nVbIpSr10I/k4kdWcDHLtdUeDEuzW5xQGcclYMHSxK8v13i0glipWaq9veI2I
	0S24MVJbiYxTt8mguM1tYzkTTPhG4cbyLsjWZtsqc7VDTM2K/7H2gN8Bu11cQM
X-Google-Smtp-Source: AGHT+IFBVi6Any6314XmuF0VtSnmCugjUmteW57ZeCuI2t3TMv2bo5E7PrvrZtUvcE0omaa0J1rj/w==
X-Received: by 2002:a05:600c:c092:b0:477:255c:bea8 with SMTP id 5b1f17b1804b1-47a7dafc8a8mr643695e9.7.1765283835141;
        Tue, 09 Dec 2025 04:37:15 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee71sm31524754f8f.15.2025.12.09.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:37:14 -0800 (PST)
Date: Tue, 9 Dec 2025 12:37:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org,
	Tomasz Nowicki <tnowicki@google.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add misisng concatenated PGD cases
Message-ID: <aTgX9qhaLyrQ5iye@google.com>
References: <20251130194506.593700-1-smostafa@google.com>
 <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a39079-2285-47fb-b306-040f2bc1bbaa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_043717_969676_C9836CC7 
X-CRM114-Status: GOOD (  35.54  )
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

On Tue, Dec 09, 2025 at 11:34:34AM +0000, Robin Murphy wrote:
> On 2025-11-30 7:45 pm, Mostafa Saleh wrote:
> > arm_lpae_concat_mandatory() assumes that OAS >= IAS which is not
> > correct for SMMUs supporting AArch32, and have OAS = 32/36 bits,
> > as IAS would be 40 bits.
> 
> But that is only when *using* AArch32 format. The bit in chapter 3.4 of the
> SMMU architecture is talking about the maximum IAS that an SMMU
> implementation needs to be able to accommodate based on its configuration,
> but it does then attempt to clarify that the actual IPA size in use by any
> given context should depend on the VMSA format in use:
> 
> "VMSAv8-32 LPAE always supports an IPA size of 40 bits, whereas VMSAv8-64
> and VMSAv9-128 limits the maximum IPA size to the maximum PA size."
> 
> Rule R_SRKBC in the Arm ARM lays out the exact T0SZ constraints with this
> AArch32/AArch64 detail.

I see, thanks a lot for the explanation, I got confused by the this
statement:
Note: If AArch32 is implemented, IAS == MAX(40, OAS), otherwise IAS == OAS.

However, I think this is still a bug but somewere else, as at the moment
the SMMUv3 dirver will use the SMMU IAS (40-bits) as input for AArch64
stage-2 page tables, so we need either to limit the IAS as:

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..d21153156daa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2561,7 +2561,7 @@ static int arm_smmu_domain_finalise(struct arm_smmu_domain *smmu_domain,
        case ARM_SMMU_DOMAIN_S2:
                if (enable_dirty)
                        return -EOPNOTSUPP;
-               pgtbl_cfg.ias = smmu->ias;
+               pgtbl_cfg.ias = min(smmu->ias, smmu->oas);
                pgtbl_cfg.oas = smmu->oas;
                fmt = ARM_64_LPAE_S2;
                finalise_stage_fn = arm_smmu_domain_finalise_s2;

Or, don't populate IAS depending on AArch32 support as the driver
doesn't support it, effectively reverting:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0c453dbcce7767cd868deb809ba68083c93954e

> 
> > In that case, concatenation is mandatory in some cases.
> > Document those and add the checks, this can be simplified; instead
> > of adding extra checks we can say that concatenation is mandatory for:
> > - 4K, start level = 0 and OAS <= 42 bits.
> > - 16K, start level = 1 and OAS <= 40 bits.
> > Which cover all the missing cases.
> 
> AArch32 uses a fixed 4K granule, so this cannot impact 16K. Note that we
> don't support AArch32 for SMMUv3 anyway, and while this does technically
> apply to SMMUv1/2, Arm's MMU-400/401/500 implementations all have OAS fixed
> at 40/40/48 bits respectively, so I'd imagine it's quite a rare case to
> encounter in practice.

Yes, I don't have access to such HW.

Thanks,
Mostafa
> 
> Thanks,
> Robin.
> 
> > Reported-by: Tomasz Nowicki <tnowicki@google.com>
> > Fixes: 4dcac8407fe1 ("iommu/io-pgtable-arm: Fix stage-2 concatenation with 16K")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index e6626004b323..ecf27e86b429 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -223,6 +223,8 @@ static inline int arm_lpae_max_entries(int i, struct arm_lpae_io_pgtable *data)
> >    *   b) 40 bits PA size with 16K: use level 2 instead of level 1 (16 tables for ias = oas)
> >    *   c) 42 bits PA size with 4K: use level 1 instead of level 0 (8 tables for ias = oas)
> >    *   d) 48 bits PA size with 16K: use level 1 instead of level 0 (2 tables for ias = oas)
> > + *   f) 32/36 bits PA size with 4K and 40 bits IAS: use level 1 instead of level 0
> > + *   g) 32/36 bits PA size with 16K and 40 bits IAS: use level 2 instead of level 1
> >    */
> >   static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
> >   					     struct arm_lpae_io_pgtable *data)
> > @@ -234,13 +236,13 @@ static inline bool arm_lpae_concat_mandatory(struct io_pgtable_cfg *cfg,
> >   	if ((ARM_LPAE_GRANULE(data) == SZ_16K) && (data->start_level == 0))
> >   		return (oas == 48) || (ias == 48);
> > -	/* Covers 2.a and 2.c */
> > +	/* Covers 2.a, 2.c and 2.f */
> >   	if ((ARM_LPAE_GRANULE(data) == SZ_4K) && (data->start_level == 0))
> > -		return (oas == 40) || (oas == 42);
> > +		return (oas <= 42);
> > -	/* Case 2.b */
> > +	/* Case 2.b and 2.g */
> >   	return (ARM_LPAE_GRANULE(data) == SZ_16K) &&
> > -	       (data->start_level == 1) && (oas == 40);
> > +	       (data->start_level == 1) && (oas <= 40);
> >   }
> >   static dma_addr_t __arm_lpae_dma_addr(void *pages)
> 

