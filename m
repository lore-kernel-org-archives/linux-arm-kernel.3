Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C74CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wayzXiIvXZ+65LI5CwNwB4BPx1PsmW3NvKiQ0xrMIcM=; b=1Xg6th2Ql/k2FnyXJI8Shyx5aE
	C5WMYpi4fdl5pupbCYw0XaMEgumMKPu6O802Sd2L6v20zNIekanmJ5wHmwY9JO3Y6y3VTcYGVh/qD
	whogE0uHBSZoreIw14mcZl73Be+x0OBNtlpYLwLMuOjqUOYeXhJR1fqwHsVWfYGnL4dLdPBR29I7F
	S4luPwGQv3iV59JrX1vMy1nvFYbDy9SgI0pvYxzu6G8HzyOrar6he4vj1kDWmkPnc/D2mRuQDkH/1
	5W0E3EqdybdBobe5ggcHxymP4/9Y5gvNU/dNHnbDvgjR/s+oR61VEEH91PQIP3sV0Fsn+E4rdviFn
	aQbi58pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrG7-00000006r0s-2M4l;
	Fri, 29 May 2026 07:03:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrG4-00000006r0N-0LO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:03:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf22c18ad3so125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780038231; x=1780643031; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wayzXiIvXZ+65LI5CwNwB4BPx1PsmW3NvKiQ0xrMIcM=;
        b=D8dxUD5qJ+7D30Jm5ncLUSwfIpq7SrIIpjj3PbeqXXUi9KA5oDQkrDz9RsqLW9sSuq
         elLN698W/FoPqXHyQjUUF7qcl26iyJ8w5SqOAeIfxic4lTUKkU76KqLAFs6Uxr4RTeWT
         BGMQaNpPruO7YLfn0ik4KZ5u3ZPBucTKeWDWb1L2luAQ/+rAv7/oyQ13dgQk758fBMrj
         DInamSIE64TF/WhPSxkrTPQx8iziYLuC+QLkX89SADDAma6eCi4qMSmZJCifu2L+m3q2
         DHCdDe4N+o7JDziW897LV7fG74vEenVVEJjmow9KKUWtfM1c0v3zQ7VlfhYFUiZ8ULrO
         RV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038231; x=1780643031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wayzXiIvXZ+65LI5CwNwB4BPx1PsmW3NvKiQ0xrMIcM=;
        b=hNHl6Gb63qxqHZV8MdaCcoOYpbgivot9g9Q4Aqz9zTUmISFYSR4boHBMPP/m+WTpAY
         kyJvJF8Sq/Kx01IXuz/6vzg8XotqkhQS6tSJrCrPTMpEW/kh7xbZCh6GDF+O0qLxaW8c
         k/MxzfQiJ1OBwcXo+EBdX55/0vh2xWlNd5eEfHhHUoMKQpI4hsvw2+cyD+HHp7rJtmja
         aerm1p0j703KbOYMH6/1JlQ1MKNoUXc0nvCG+NdpsE+USvnBTMqnngUAOn3w7xUCyNM7
         HCeVgbD2o/QjX1BaoaOfIUYoBY0QZK9ffgYOEMRxd2RXqdK4XhYFHmKPcSwJOa26S3M2
         YM2A==
X-Forwarded-Encrypted: i=1; AFNElJ/KvLv/omIibDaXSX/9r31T5ggJFR4SM2k6D7asbqfkF6lcjZuO24Q6gdqfULAtCVRlC6hOrbVXTflZ5PZloJgn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5fgYBB38Ke4lPBbqq/f1xVexKNgKOxe4lSEctz/U9sXQDDq90
	Xxx1Nao1SlaHeMDMXAXPn4DGL5vQMFVTPf544DDPmtisTj4710RJaQ4YeSDpot4jS7PsoZOJ7c9
	42L0aQA==
X-Gm-Gg: Acq92OGkR823RQEjmKAfmkFOd3ikbt5e05NS5TJi0apGpmECw+2rnxtIi/Qj1dAHh0B
	y28xq7s7u+VB3gHfnEN5U5H17rmEfa7OQcY0auJXYrjKEYAf6lJZKCRQ6SR3H+YTHTUd00/xHMY
	6z0R+aC+vYOpPhqN1SQuvGm3qYjMeKB+5ou7LFP08/ZJ5HubaDlAoj5lQ3kv+Khcu1l+lWqMEdz
	TKyz8r57e4+WN9IJ/HxxtOEWdeE75HbZCadsWP1PzA5I+BBcTU9RPzB8odzK1dcZDsrXj2XINjg
	S5ao6XSvJ+QaWgLwgBaAWfmddhPevbFNXGcQJH6oPToXN2MY6DBbl0a3jtQO3ED/W++I1Sr+CR6
	uPoj5rdd/4fvZEUC+kgq43fC/gWimcYN1hFNNoGGuoorltVLeuM88zt4lcErjz//k1OTKvGjblE
	Berf8Z62/bVmvrgIR42DE+EKiBFjon5fKQtlsz3qABEPP2vbl2Fu0U58KDv6agc0zC66E8j5QT1
	v5/Mjs=
X-Received: by 2002:a17:903:41c7:b0:2bf:1ae5:2c51 with SMTP id d9443c01a7336-2bf22e488b9mr1020105ad.1.1780038230320;
        Fri, 29 May 2026 00:03:50 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe12456esm592183a91.4.2026.05.29.00.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:03:49 -0700 (PDT)
Date: Fri, 29 May 2026 07:03:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v5 6/7] iommu/vt-d: Fail probe on ATS configuration
 failure
Message-ID: <ahk6TchfnjsGUzs9@google.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-7-praan@google.com>
 <3fa3d4c9-c083-4167-93fe-814f0ecfcb7f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fa3d4c9-c083-4167-93fe-814f0ecfcb7f@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000352_149117_38C6E9CD 
X-CRM114-Status: GOOD (  26.37  )
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

On Fri, May 29, 2026 at 02:39:26PM +0800, Baolu Lu wrote:
> On 5/29/26 04:23, Pranjal Shrivastava wrote:
> > Update the Intel VT-d driver to handle ATS configuration and enablement
> > more strictly. Specifically, update the device probe to fail if
> > pci_prepare_ats() returns an error. This ensures that any ATS-capable
> > master reaching the attach phase is guaranteed to have a valid config.
> > 
> > Additionally, update iommu_enable_pci_ats() to WARN() if pci_enable_ats
> > fails. Since earlier checks in the probe phase preclude config-related
> > failures, any failure during hardware enablement is considered a kernel
> > bug.
> > 
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >   drivers/iommu/intel/iommu.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index ed6d3a0203f5..f13da16717fe 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -876,8 +876,14 @@ static void iommu_enable_pci_ats(struct device_domain_info *info)
> >   	if (!pci_ats_page_aligned(pdev))
> >   		return;
> > -	if (!pci_enable_ats(pdev, VTD_PAGE_SHIFT))
> > -		info->ats_enabled = 1;
> > +	/*
> > +	 * pci_enable_ats() should not fail here because earlier checks
> > +	 * have already verified support and configuration.
> > +	 */
> > +	if (WARN_ON(pci_enable_ats(pdev, VTD_PAGE_SHIFT)))
> > +		return;
> > +
> > +	info->ats_enabled = 1;
> >   }
> >   static void iommu_disable_pci_ats(struct device_domain_info *info)
> > @@ -3292,7 +3298,10 @@ static struct iommu_device *intel_iommu_probe_device(struct device *dev)
> >   	dev_iommu_priv_set(dev, info);
> >   	if (pdev && pci_ats_supported(pdev)) {
> > -		pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > +		ret = pci_prepare_ats(pdev, VTD_PAGE_SHIFT);
> > +		if (ret)
> > +			goto free;
> > +
> >   		ret = device_rbtree_insert(iommu, info);
> >   		if (ret)
> >   			goto free;
> 
> Sashiko made a valuable review comment, and I believe it applies here as
> well:
> 
> [Severity: High]
> Since ATS is an optional performance optimization, does failing the
> IOMMU probe when pci_prepare_ats() fails break backward compatibility?
> 
> This completely prevents devices with buggy ATS capabilities (or VF/PF
> STU mismatches) from attaching to the IOMMU.
> 
> Could this disable DMA translation entirely for hardware that would
> otherwise work correctly without ATS?

Ack. We explored the "not failing probe" strategy in v3, but following
discussion with Jason, we moved toward this "Fail Hard" policy [1]

The rationale is that we ONLY enable ATS IFF ats_is_supported().
If a function claims ATS support via pci_ats_supported() but then fails
in pci_prepare_ats() (e.g., due to an STU mismatch between PF and VF),
it indicates a bug or hardware inconsistency.

Thanks,
Praan

[1] https://lore.kernel.org/all/20260519145947.GK7702@ziepe.ca/


