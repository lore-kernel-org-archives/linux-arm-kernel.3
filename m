Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6BEC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 22:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=; b=EX0YpPFEhKinXx5BZTESMxdmTp
	cvs7hscr9ZkUqFs78C+AzZq+f6NUUEBGsSCx6HxxWhKwdzWASLRuExpYMhDVv8FpwP8aDKG1e5iFx
	jSBkF0WmOnQ4MfB5fh25JJCB/bSyyw0U5TU90CkvEJDCb59+YG4DqYv0T5lQ/OlBEd/d6UBBMLf0h
	CVens03g5wXrecM2/67/KfZ35ImZCm3TGcUzT9TkVUBDnjOWQIUsYM6o6NgQrqp3PYjFh+14qBIHz
	V3gz6P7vdhkifnQBwk0GqIg2WtED3Zm/ErSgu1MyoNEtVyAEhXPotOgyHeCtsI6gxVnG9tPepm4Sj
	pn9B1pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEOQ-0000000EZK7-1dPI;
	Fri, 25 Sep 2026 22:27:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAEOM-0000000EZJU-0CYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 22:27:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d8facae850so22285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790375261; x=1790980061; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=;
        b=pGDbpkrCCOJTZ4Qb7HWKCcgUKJ4cIxPqlBcPx2WJGoyy76OBgxkusJK3/78+Dyvo2X
         MdswAJIllNynHiqlbywHE0B2RwehU2993K2ySqpLQr7/XfU6ouGrFA83D5FUDxEI5T2a
         5E3kf5FBDAF4pF3ynrYdHnG3z7AWwPkQ6lJbVW5jck/r8SuTazd8h9RN5ggMkLIZBZot
         UGpQX66bdiRRaqlcjQm1lj+x/F9db1YU4nKPBcx1BqqxhW/HIb7EUh04EKo5xaFSEUYN
         ia5s/jMNWXsE4eBmba8bHRLGGOqVtzyRdbMenGYdMFt/YFLQHiOiigCvZq+m0usFIaGb
         XtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375261; x=1790980061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=;
        b=1vDyqtpDfCqz3QiG5IEYidw2o4xnKinGpV8K3GlwlFmDmSb4pKh7Vx1hUUltGW8THw
         369/XverMGhwunAQRpx8Qu39FT3ks1H/8PtMPfWy5e+YsDyMS2/DjsOeneDR7YJiWnuu
         JVJkSZIK/MAgLFYkKo7uuXU1zK1itGp0NHRzTu5yOqGYR9/f+8twAih5A6BGEpBsypWj
         REdnce1ARyfPV5qZCMMcn24DOr5nbO81JG8BqL3sLjiONNdfuG+W2Vws/ggcPS3RsnWu
         QqLcxe9BM/Jcd62sw2r65oKgjpFqqC5oDseOJUlO8iAUQAijwF0biU+Kln21OQr8zvqS
         p4TA==
X-Forwarded-Encrypted: i=1; AKwUvBxmR2cfVt4f6+0IpZ+y02oIQeYa8omRc7kgXqHtDANUDZJTuY4DeTazpJZos9fa92ciEyix0POy/WsO1h3CvCFo@lists.infradead.org
X-Gm-Message-State: AFuF++k95/Bn6HwxiO+8x1aVkxrdFn4TSp1b4yFjn8spXv2US/gZCd+S
	n+vwgQ15CkH0srxGsDSBndG8cXFMtbR4OxJc5r/p8uN7sc5UkUjtPKSM+AaucF4fDQ==
X-Gm-Gg: AYBFou1cYfSS2xBqxjfiv+JOxinQ6O/4wuagE/kS09i4G/alOPaPFuuiQenbSY1DmXI
	WFk5DCosE3mAcveF+KNUlDvdhG31zrWK7ojObvQpZP7KN9DrM3T+dNtGJrZibz0LMizkZp8iFzi
	yX9cxWUR8yhChP5Ol+6t4t7bDqxdUt5Gdz1Z5K7M0yfMc6zY0irCgDe7kpR+MNr3yX9/GKWFfb0
	Vp2/FbL9gXj6S0qXD74RfSZKkcKIqa6OWi9/1Bbt2L2nBbyCf4jeEzItB1NI3jzZSMrSNot1dlP
	wrC1XksClbGpIEDU1orfpS15ac3lPChmQKEOdNixvBEiyq8AKwhmMKyfqpmbY/uQf6NZOcVn44k
	gL6/LE02lKhT3RiTyRD3YWmUJSvLsKzz/4tJcGeN01DdM7d9P8sAOMx+RbjQgGYuO6Dy9/JonOq
	/4KkuqDNInA4WgKPD07pJEzzM6Udi1IkLsR1lF9u89ioZhhbFCc68wKateVpSu3KebcQu5iuNxq
	tQXlCewQfj+BnqhuX56jNToQwdSQCo4inWciZE0MJzPAikwifgg89NL4h9ogbWOcMap0Q==
X-Received: by 2002:a17:903:46c6:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2dfa968787fmr828795ad.1.1790375260342;
        Fri, 25 Sep 2026 15:27:40 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm5720254a91.0.2026.09.25.15.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:27:39 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:27:35 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <arb0EZ7mPWUfhy9K@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <arbrJYsILS1IPpCK@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <arbrJYsILS1IPpCK@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_152742_131616_BC4C6479 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Sep 25, 2026 at 09:44:05PM +0000, David Matlack wrote:
>On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
>> This patch series adds support for replacing IOMMU domains with S1 page
>> tables hitlessly, that is without disrupting the ongoing DMAs. This is
>> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
>>
>> S1 domains are programmed by CD entries in the CD table. During a new
>> domain attach these are updated using arm_smmu_write_cd_entry(). Since
>> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
>> considers it a non-hitless update and sets V=0. This means such an
>> update is disruptive and would generate translation faults if there are
>> ongoing DMAs.
>>
>> Replace the CD entries by using an unused temporary ASID in the
>> following sequence to allow hitless replacement of CD entry,
>>
>> - Update the CD entry with temporary ASID.
>> - Update the CD entry with the target TTB0.
>> - Invalidate the temporary ASID.
>> - Update the CD entry with target ASID.
>> - Invalidate and release the temporary ASID.
>>
>> The series adds a vfio selftest that triggers a continuous DMA and does
>> the hwpt replace while the DMA is ongoing. Since domain replacement is a
>> race with the translation requests, the test does it multiple times to
>> capture the small window where IOMMU faults can occur.
>>
>> Without this change we can observe the SMMU faults in the kernel logs
>> and with it the SMMU faults do not occur.
>>
>> This is only tested on qemu with the emulated SMMUv3 and an out of tree
>> NVMe vfio selftest driver, not on real hardware. Following are not
>> covered and can be done later,
>
>Out of curiousity, does the in-tree VFIO selftests driver for IGB not
>work for this testing scenario?

I tried with the IGB driver first, but I couldn't get the DMAs to work.
Its probably my setup, will recheck.

Sami

