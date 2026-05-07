Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354ABCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv6ESL3sqOkfsUQX3nZNF8lwSawGbrEYEhFUcZ/x1Kc=; b=2eGvnO1X9gW0vYpXE/7L5oNwcj
	d8/aDcjultJbgFzinzjvYjzwRqC+2Ru0lwZPcabWAjPUWLODRkkkBYuCVhJ9Cawl5w3/DY2+J1mBB
	xDraBTjp4iLm6jlgyOaZ/7r8UiI9Y2ETe70YaWGDVmL7ArhkTIM4qm9ebGPXJssXslrWBEIPqooo/
	cs30NAepOUl83PYMpmRLkjkQyzp6hU+q9Ov4naVlTge6eLcboMoE+P8r0VLY0fTVIJSwOejwd9Gnw
	6SM7feiJKoADttja3F7t63DDBehZchjxZtvNAySSkKOEcWzC3yupNhWUkFMUT24sg5u9sC5BmcFe1
	gvrg8L4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvVQ-00000003QIr-0sFs;
	Thu, 07 May 2026 09:58:56 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvVO-00000003QIC-2ngt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:58:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c801ba7685cso368337a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778147933; x=1778752733; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv6ESL3sqOkfsUQX3nZNF8lwSawGbrEYEhFUcZ/x1Kc=;
        b=ebrr3lnNNGqPqLkU69x2nZCF9BHdzHmKy9pARtxHBIiZiZmTuptXFDFaoCPnzAt6fV
         XRbsNpR56g0AGOGfnZZ2bDFbafhMFbusUCHqbBlXzwXaqj6XoFXhfxIAGARtWsiB52f2
         tF2EgFlJ3kRHrDYKuQbGOYAQF3nsx8KJ8RxwqCuElbjPb1Yk6xPkrGMwqV0zlvJzIyAt
         CqSUA1E27wTDbz+xRT4ejCt7j4PtxSZJhC43KNujXpJek8gdHOwEtbzGLID0xZEomuNb
         8Pd4Ck73Au0RO2BvYEJWBjyZx9fpVKzgWBJJ1/uWbqplLNltTK7j6+pfvg1RPLPr4pko
         loaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147933; x=1778752733;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv6ESL3sqOkfsUQX3nZNF8lwSawGbrEYEhFUcZ/x1Kc=;
        b=g/Qy5ofvJskBgXlzEgfau+RcJr8UmeCQ7S4fCY7EHTGD151Mjhqq1HK/7ZGP4Hv379
         /Mcmm+E3NC1YPocDYQDHBQlKfuJpqzTa1gj6/CKOIT6eTg4O1aImRbahaRTE/jmdvKVf
         2oibtCGEc937AgPoBeofqxMVNNSA2ewUKTSYmtpld/iZUc/5Yz5cQu2UbyZ7T1BsFKNw
         IN+yCcfokhR8f0K/ETaLbO1GZCApSYGdY6SSmNs3Olph/+mi6MwBTmyD90TMuNXGn5TF
         CUVox+TYosAnYlqsEOBz/Q6hk2lcItFbrkMNrathbVsSwQNhKHiqdQa8rmO4MGte8sN/
         n/0w==
X-Forwarded-Encrypted: i=1; AFNElJ/jfQOTXDmmQO4NgXsriHObXmAonkLLLTZdnHHrAhtta2fZGyhQcKEGWFRiClq2NdjkoDAdT0iTQ3AONNmTjokc@lists.infradead.org
X-Gm-Message-State: AOJu0YxQgxyAYViHiwez5L4L1lYaLVm52n6l0Ty58VjBn2Dk4rUdUl02
	xfLMVhPQ5IgPomrPqboDL01due0Pn/MiU19Dq/eOYnREzv2QkZfhlIOYeSyXPX2393lhnrifRke
	/t00/U+OhTLevQCADuO2oPzTvxw==
X-Received: from pgac3.prod.google.com ([2002:a05:6a02:2943:b0:c6e:228a:f070])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6d88:b0:39b:e710:e2e2 with SMTP id adf61e73a8af0-3aa5ac1ae28mr8112180637.46.1778147932850;
 Thu, 07 May 2026 02:58:52 -0700 (PDT)
Date: Thu,  7 May 2026 09:58:51 +0000
In-Reply-To: <20260424133953.GY3611611@ziepe.ca>
Mime-Version: 1.0
References: <20260424133953.GY3611611@ziepe.ca>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260507095851.3220765-1-joonwonkang@google.com>
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com, 
	baolu.lu@linux.intel.com, iommu@lists.linux.dev, joonwonkang@google.com, 
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nicolinc@nvidia.com, praan@google.com, robin.murphy@arm.com, 
	smostafa@google.com, will@kernel.org, jacob.jun.pan@linux.intel.com, 
	easwar.hariharan@linux.microsoft.com, kevin.tian@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_025854_714664_246D5D55 
X-CRM114-Status: GOOD (  33.87  )
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

Hi Jason, thank you for your review and sorry for the late reply.

> On Fri, Apr 24, 2026 at 08:53:39AM +0000, Joonwon Kang wrote:
> > For SVA, the IOMMU core always allocates PASID from the global PASID
> > space. The use of this global PASID space comes from the limitation of
> > the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> > from IA32_PASID, which is per-task.
> 
> That's right, and all the iommu drivers should have no issue with
> per-device pasid or they are not following the API contract..  I
> believe that has been taking care of already.
> 

Thanks for this info that every IOMMU should support per-device PASID
space already, i.e. each device behind the IOMMU can have its own PASID
space.

Let me clarify my understanding first to prevent future confusion.

The reason of using the global PASID space in the first place, i.e.
`iommu_global_pasid_ida`, is to support the case where a userspace driver
wants to communicate with multiple devices using the ENQCMD instruction
without kernel's intervention. Since the ENQCMD instruction fetches PASID
from the per-process IA32_PASID, the userspace driver could not use a
different PASID for each device. If a syscall had been provided to change
the process' current PASID, however, we might have been able to get rid of
the use of the global PASID space, although it may cause other issues and
require research on feasibility and effectiveness.

Please let me know if there is any other reason of the global PASID space
use that the team considered back then.

> So, I don't think this is an iommu driver capability.
> 
> Instead, you have to decide if the PASID is per device or not based on
> if the system will use ENQCMD or any similar instruction.  I
> understand ARM has introduced a similar instruction.
> 

By "similar instruction" on ARM, I guess you mean ST64BV0, which fetches
the bottom 32 bits data from ACCDATA_EL1. Please let me know if you meant
others as it will matter. If ST64BV0 is supported on ARM, however, it
would mean that ST64B and ST64BV are also supported already according to
the ID_AA64ISAR1_EL1's LS64 field. The latter 2 instructions are just to
atomically store whatever user wants to a memory location without
referring to ACCDATA_EL1 and all the 3 instructions can be run at EL0. So,
the userspace driver would have enough capability to designate arbitrary
PASID as it wants via the latter 2 instructions when communicating with
multiple devices.

> So you may be better off with some kind of 'arch has enqcmd like
> instruction' to control this instead of involving the iommu driver.
> 

If the above makes sense, I guess we could lift the use of the global
PASID space on ARM unconditionally. What do you think?

> > - The device is not a PCIe device.
> > - The device is to use SVA.
> > - The supported SSID/PASID space is very small for the device; only 1 to
> >   3 SSIDs are supported.
> 
> Yuk
> 
> > With this setup, when other modules have allocated all the PASIDs that
> > our device is expected to use from the global PASID space via APIs like
> > iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> > our device fails due to the lack of available PASIDs.
> 
> So you have multiple SVA using devices as well? Or multiple instances
> of the same device?

We have multiple processes and a single device, those processes want to
do SVA with the same device, and only one process will do SVA with the
device at a time. Though, the problem occurs even when irrelevant
processes allocate the PASIDs from the global PASID space for their own
irrelevant purposes.

Thanks,
Joonwon Kang

