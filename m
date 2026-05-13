Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EDCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWwRMJn4ysC40SZu5iEtoxx7CK76uQCrAvLKY0VkjCM=; b=3Z5DB5ADGvMAuQKxffT1R9SDL4
	efzcB6/ntgcG+LTuIS7KsUCVsG0f59PHlNSkTJJnr/uDxttUAuE1Mv06bBxtS66mXR89b2oGRcQm3
	pWgB/Fj8cu7/q0qtxDTPIHLE8VKbcJXPdO3U5INa7ekxoxY8huu9PAGo6+MZfMGNrwDrP/FEjHpLh
	OQpItllnv7xGSQb9JjZk+/6ZPP4BLhroQ0B8Q/IE8I9gI7hDuLGa+BCuuuJtJ684ygQiiReiTOgKo
	I9+kIjoTjd9z1CT80IGYF8FqVib5tH0G+N4MRTFwvprQTCfqaSbol81tXAb14Qtnbaf018fC8DhXF
	0kKDJztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCzi-00000003IKd-248F;
	Wed, 13 May 2026 17:03:38 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCzg-00000003IJp-2zyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:03:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so29358295ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778691815; x=1779296615; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XWwRMJn4ysC40SZu5iEtoxx7CK76uQCrAvLKY0VkjCM=;
        b=bZO3umTWVXqz/WVGfCeGXDz4erFhP+HKM8aNFCBVQe298S1kkJ2mpjxE8Dhz+NEhIM
         m6TQa/bZRo05rrpZiRjW/5M2ELRP/EGbnC87hgqxKqdS9GP23JTsmWrh8NiSN1OypwrB
         UR//+AIX0BGcL6jcoXyD9wNCkl0M7B4uRO/ZaGM3vJmkmaltx0ABy64LVzl2hEi8nsUY
         DnDcvCq51gKUOUIxJS6yUld8D18fsUDf2WTeI8OVbX1AWsbLI1YAYZeQatOuYk9TQZoS
         lBoZf0RgQJIhSD6izG+O8A7vLyGBM5OUMtRPCOnUB0+6RXh4qRDRcuE7UupKAPMFbjEG
         1E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691815; x=1779296615;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWwRMJn4ysC40SZu5iEtoxx7CK76uQCrAvLKY0VkjCM=;
        b=kqQzJUfnxFV036t7m1t/YqowRhzIKhuLMjlUOpJuNVM4oSbLcSKSL8vobtEGpITgPt
         SRJ15+ZcluWrFD1l0ouc5bc3zJ+SbsC3xtHrAcFVMYKfkuMZKM2P8CDWnhTZye2/7cYv
         e0VkdQfCha1fL4Y5D2V+1PnojUq2eAaOVcGraYHTvQR5sKkKqmkKY8sjGauVRN7XQLHf
         oTvSUE9IlbQaSwrO7JOs7arinUIvCnpbgXNxTvSD9U6+VBtDni/yptnsijb4eNJpPiM7
         FQZ0yFW8W5VB/KdtdW6NGitrQobu76Q6sz22j21elIOZTFQpaNdgxOa0XEUYVOnMEim+
         +BRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cuYg30oNm8N6evaQfOMuFqA0Uxovy0C9nyQHkSZMSExXrRtZr5FUckxJvKh5/S2K7smx2OsYjMUTKXuo30CQw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gu0E7NB+Rw6nELpa1YNTtELUeZLiZuNheHESfMdBrL3dL9u6
	gOEE43QKBIgs9s0Ird5/rRtWjcZDzW5ewxfNGFcNDLLYP6g9Emz8C6wpasxPKRwNEuvd8WFBqdf
	3cFpFmGbWabEUICqHOI8kz6p/eA==
X-Received: from plbkf6.prod.google.com ([2002:a17:903:5c6:b0:2b9:53bb:4a09])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:46c4:b0:2bd:2de3:51ad with SMTP id d9443c01a7336-2bd3043ca95mr42686725ad.34.1778691814901;
 Wed, 13 May 2026 10:03:34 -0700 (PDT)
Date: Wed, 13 May 2026 17:03:33 +0000
In-Reply-To: <20260512151133.GD7702@ziepe.ca>
Mime-Version: 1.0
References: <20260512151133.GD7702@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513170333.1235601-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org, kevin.tian@intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nicolinc@nvidia.com, praan@google.com, robin.murphy@arm.com, 
	smostafa@google.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_100336_751602_104D8921 
X-CRM114-Status: GOOD (  19.06  )
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

> On Tue, May 12, 2026 at 02:51:38PM +0000, Joonwon Kang wrote:
> 
> > Appreciate all your clarifications here. So, my understanding is that if
> > our system does not support ST64BV and ST64BV0 or if our device does not
> > distinguish between the posted write and the non-posted write regarding
> > PASID, then we can lift the use of the global PASID space. Can I say this?
> 
> You should do what Robin said - just have your driver use a per-device
> PASID that it allocates and never use the global pasid allocator.
> 
> To do this lightly re-organize the SVA code so the driver can supply
> its own PASID, and in this mode we wouldn't activate the ENQCMD
> features in the mm.

Ah, we could actively disallow EL0 to execute ENQCMD-like instructions
when the device driver explicitly shows the intention via a new API like
`iommu_sva_bind_device_pasid()` that Tian mentioned earlier. And the new
API only uses the per-device PASID space. It makes a lot of sense. It also
means that ENQCMD-like instructions are only allowed when the PASID is
allocated from the global PASID space.

If a process communicates with only one device with the PASID allocated
from the per-device PASID space, however, there should be no blocker for
the process to execute ENQCMD-like instructions, technically speaking. In
this case, should we allow the process to execute them? and later if the
process tries to allocate another PASID for another device, should we
disallow the instruction execution then? I guess this way may complicate
the implementation without much benefit, though.

To allocate a per-device PASID, I think we should do it using
`dev->iommu_group->pasid_array` instead of making the device driver
create its own PASID set since all the devices in the same `iommu_group`
are supposed to share the same PASID space.

Will create a new patch with the establishment so far.

Thanks,
Joonwon Kang

