Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE12CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2GShboWfCH+geXdhp6U7pMNHFToJXb2v7Io6huPy9A=; b=xNVqu/DtvctOqrxwc10bOktZRH
	vY9y+AX6grgctDjDX3tJbnuIXX+OWlp2zp7kUVbHHSsuH9VQcJV5YRSt7y1FPYDxmxuR0xnPKCiIT
	nGzshuHG8bG3jPa72tobIGuMtwU0hDLoNQksvevNtF3/DyhWP7DmQ5o8uGFaeYFJ1L7qBm4zAxgZV
	HKdgqxmxXSarythqx46+r+nHhZttd1OCGiKmVBMb8s9il+xanmgIIniVB7fe1umG7V3UXSyLTBQID
	ffAAEFJtzaybDUAxwRB9rIYqJ8E/uM5s9LSeAnRSmlEuqnULpIHM2/r7cBuiRAw+tAkcPcnr7TRHm
	1NpduNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSij4-00000006RFS-2iim;
	Thu, 28 May 2026 21:57:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSij2-00000006REw-3eUW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:57:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba180a022dso935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780005432; x=1780610232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2GShboWfCH+geXdhp6U7pMNHFToJXb2v7Io6huPy9A=;
        b=tLKTE6Un/ZrH7xQwkQaMC4HQ8GGVCp/SKiSZZymsDsGgbXMPgE0jn6UmYt0tnqNuSw
         /kg9e1KnEDYkWTtDMg6DOholXwAR76PP64veGBb70BJI/q2EggavtXM/RT0LPnkYvshd
         N5aui7cioq0B96626Zte9ULw/8bzbxqKyN1vpheka2yz9hYhs4OgBO/p0yYglKIDPz1y
         ETJ4Wmwfpx24JZOfP/898GS/g59UB6ezj7O6b/FfE6r9NTc56/ESv8uGzvq4vh368sWa
         2w4TSImAE8rwlCT3iRaTfYHtu6jQ76uZBFP6p+PkEvMHjmNpfcMCMroj2jhBZXqsI/EY
         RK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005432; x=1780610232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2GShboWfCH+geXdhp6U7pMNHFToJXb2v7Io6huPy9A=;
        b=isbdE9yh9AyGVozj3oeb/FObt7sNljaEY7dg5QKGJK1qaeJHUtIxXJ34soUwr/Yi22
         BzKUnpDBRI8SJ2yYkxHw0E/+1xp6RzlQYA4+L1GuakuxbmQ5eichZqFEur08z7SMrv75
         s1e6DzARc83YjYnuOMl6JiUic8TWNWDzq747LLu2UWYtU5BlZLx8Rvh6W59rNB3wNGHJ
         rOL7pM3cqISvp2RfeZRBqve6UftfqsWQsSEQRdD07AzOrltGlEVMdOASVOij/QOTZTOP
         j45pBZ/LInFBUlmhoSIFEFn/db5dHizrT9pKiVUE/mIWkkX1MZkf3ihR8WGIY1gh5Wts
         96HQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sLzpdwMVzAIwXPfjJ6KsM9SZuOKgBtY7S/hGBQ/6hfiDkezzjmiOMrB3Ze3055dcfsEgqFT1fGyCPmPVc/POc@lists.infradead.org
X-Gm-Message-State: AOJu0YxlcJw88P8Np0wFW4lvzZ8BXSOn8FJLLWWcGpBfcU8CbQJ25qvX
	I+65aBbbCzZu9vjx5ne8buHJGz/qn5sFN0p2zX8egelwuVzvjr1sISe0IARKqisz9A==
X-Gm-Gg: Acq92OG96KJ3CCS3/76cHA0Yzh0OqP6USvfMrWIQqj85/ePOjBjzOsiNJRr1l4/FV9W
	V+u834O8XAsEkSjqkWKdjfaQIeqNNvHRooL48lRY6P/QVsCpV+cl8wNkQu0ibxAc4CK8Pni9sEj
	7QNhHYGoPqLht336OXYYQnwh26NtpvE8CZkaOvf+XYCebc7ENaYI65o5FqBT4ibxoopQdiDzman
	NeFwHnxMpLdhVeh7Ce3viDwkytDkxciyaZngc2b6MVMGEO/8ZqFPA4UI5rMRWi6TLY0PilMGg/G
	lvJMk86+FCq3xXQmS1C517qk8aiz7zOdpVPcjKnYpPWBQ7CQGl5CZDWLLA6lFhFR2j0q8+zLY6q
	61PgaIqPIGmg2z4FYsI8arsS0KkWomb1eE4/p/ScNMaiyKhr2k7Kzv/Gp5wxNl40IQ+cUFTRtmG
	q4ItaTXnzyLUKE4ThnQ9h0tCwOlCmWyW8gYW8aB7Iy/EPIaTcDtTsl4wL4fZSQAfD5SRBx
X-Received: by 2002:a17:902:e844:b0:2b0:7a9b:82f3 with SMTP id d9443c01a7336-2bf2097502dmr215445ad.8.1780005431489;
        Thu, 28 May 2026 14:57:11 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe1f9377sm46400a91.13.2026.05.28.14.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:57:10 -0700 (PDT)
Date: Thu, 28 May 2026 21:57:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 05/11] iommu/arm-smmu-v3: Cache and restore MSI config
Message-ID: <ahi6MJaAene0ogY8@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-6-praan@google.com>
 <ahiLFoRk4xaxr2vn@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahiLFoRk4xaxr2vn@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145712_930137_5C8E71E0 
X-CRM114-Status: GOOD (  22.30  )
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

On Thu, May 28, 2026 at 11:36:06AM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:01PM +0000, Pranjal Shrivastava wrote:
> > The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
> > address, data and memory attributes lose their state when the SMMU is
> > powered down. We'll need to cache and restore their contents to ensure
> > that MSIs work after the system resumes.
> > 
> > To address this, cache the original `msi_msg` within the `msi_desc`
> > when the configuration is first written by `arm_smmu_write_msi_msg`.
> > This primarily includes the target address and data since the memory
> > attributes are fixed.
> > 
> > Introduce a new helper `arm_smmu_resume_msis` which will later be called
> > during the driver's resume callback. The helper would retrieve the
> > cached MSI message for each relevant interrupt (evtq, gerr, priq) via
> > get_cached_msi_msg & re-config the registers via arm_smmu_write_msi_msg.
> > 
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> > +static void arm_smmu_resume_msi(struct arm_smmu_device *smmu,
> > +				unsigned int irq, const char *name)
> > +{
> > +	struct msi_desc *desc;
> > +	struct msi_msg msg;
> > +
> > +	if (!irq)
> > +		return;
> > +
> > +	desc = irq_get_msi_desc(irq);
> > +	if (!desc) {
> > +		dev_err(smmu->dev, "Failed to resume msi: %s", name);
> > +		return;
> > +	}
> > +
> > +	get_cached_msi_msg(irq, &msg);
> 
> I wonder if we could use __get_cached_msi_msg() since we got desc?

We could've (and that's a nice suggestion), but unfortunately it 
(__get_cached_msi_msg) is not exported via EXPORT_SYMBOL_GPL() :(
We could break modular builds as CONFIG_ARM_SMMU_V3 is tristate.

Let me know if you have a strong preference about exporting it, we can
add a patch in the next versions.

Thanks,
Praan

