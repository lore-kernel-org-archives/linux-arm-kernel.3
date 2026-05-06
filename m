Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596A5CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=; b=B9Nvj5xBE6GuIP0S8Nn99s2YEm
	DlknBS2aWKlVVSlvM8r4D0qeUwkHPAb8CIwrD4Fjl/MaIH318K4Md8+DtZnV6yFxZW3fqsB667sCs
	UhKV+CwW8Lw5MGk4pdDCc/7W/satmte3NSgz2K27RiKa5Bf6Jmq0i7cTmCm/7AyMpj4b6h2iBTnsD
	XlDxiTCn6s1RxI8Bo0Lzn2sWTNYAbNYCOtaqNw0wL3dgBGFebBS2vIwrfJOHh0SXnWFYEvwwf9L/K
	IoBgXwxWJ1Gn2A5KQbuw73jHP+1xEm9KG2SohbkKET1XfYiopAYRrbksCIiePxz7YK/pE69eKN5PI
	MY9E63eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKlrk-00000002IOd-19KI;
	Wed, 06 May 2026 23:41:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKlri-00000002IOJ-01FM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 23:41:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ba180a022dso24335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778110876; x=1778715676; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=;
        b=gSX0sWlxOmzka2+bQDlGL3RrdSdtmcDGrGrI/H+3dxhXK71U4DGOyb6G5BlWX4u/pm
         RmXfIu8MAgqvbmMExFFeY1fmvTI1A9FBKD3X1nhWTkJQ1rCK7qtPwS7PD6bHCgguiXtX
         /F2Liyj5bdYwE2GkXpwp/0CgeknbIsIAd5h0h9lx3MzfVgMkJMx+XvhuPxjRhX/OVQKX
         2T4SY/74n8DPqOVxYUCak4gw2qYnK6pJkwMYv7N3e27RFvv4ukELXBlq76HBf3MinTVM
         rrGew67e6DEB25AWXKOELCpZjJaBViq+WzGE61NMOZRXVSeXUIzBqlykg9sdUX6CYHri
         VQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110876; x=1778715676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0Srmy8jgIvvOfgyisrTtf/fJrmdBVr4h8Ys4jXIB1k=;
        b=Arnmoy36FvhIccvmEYdM58vmaoQeJ1SHS6ueLQFMe+BB8k9avyF5i6XuQxomWXCAlH
         peEZwmPQRWpon2EGRCR+EztlPVKQlpUPKXOR3b22N2VQbjcnk92+WjzkPLRW/KW/47ZK
         u+O2rDCcaB15WP80J8bbpJXarMxMA2sIZ3yHYvBB6Zm7M7Zie3gLpOlbH2k62JCkMXv0
         0IV0dhLEWpGR3EW0RkcWiGjXD/Hbf3PETKHCb0J2nWXPHVRCzKxeQsjthx+X9F9xb5dX
         1O+CM3Uw/TVPHmVyPBfO/MTtDcywcWNvXSNAS8SiJn8j7qjdR4Bx2XGmoInlj+5oowGq
         mriA==
X-Forwarded-Encrypted: i=1; AFNElJ9xFtwHnXbCaX6L/zxK4aNm9MIzrEo7FZ5MWyc/+3WiHiVMNR2Qm23NrK8+HbeE3W06Pe0cMrUz6cX84DJ9/ES3@lists.infradead.org
X-Gm-Message-State: AOJu0YzoYBXF4DrClVplk5MYnOzDTRJpwvsyIJw2TMhWFgo1KRJCnEM0
	1bfj8Wtc8q64eMCG/9p7sw2Ud3cTRnWjJ8VTiInzmRZnv9jPo9XXkeBaF80Vt0iTZg==
X-Gm-Gg: AeBDietkzVTMrANdyq4Q3PwCcau6JwB0HxC/DQSsVZK/Dl3YB9vCL5vC5uoeZUOFoM8
	TV2lJ5wu9KJVuymxYVgIZ/fBaRCGyhMUMQ6a1qEPop2Y61fJkiaSGDFii5TQTOaedxEzkG2g2Jk
	I3pjmJm4M9a7FFtj2Q4e4Tfdfbdbs1EhaHqfRw9azMuUsx7KveyVqLx1gKL6llZPRo2KBgaA4uP
	2rx9/1pQ5iyGDqTlB/GQ7XnD1md7Efwilf6IEJ8FyiqTEJad+xK3jGKSoMFFvFDYNpyNVMcIbAc
	CVYLhWpwoSUkdnl+PtJZpMmLdCc7XS7itmjwIJJTg5KdYi37icm3xEAtomcDhqbe4lY7nhdkKiu
	c6vSYCA5MFYMUhqzr/MRb8WyNU+Y87oSw7uBNVflW5kOunE1GNDrK+C1lTZEtXElJ8c0/pIvCKT
	nwTYMvwUsyK+ripI+0FcKlTE2t4h8Rh0mmP7sD6qdeyLTsFDGBwDR+VkcsfqgcpxLDoys82tg7e
	HFDd7hm
X-Received: by 2002:a17:902:d414:b0:2b4:60e6:44bc with SMTP id d9443c01a7336-2bab641edaemr956085ad.13.1778110875628;
        Wed, 06 May 2026 16:41:15 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b08cc8c9sm1629410a91.6.2026.05.06.16.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:41:15 -0700 (PDT)
Date: Wed, 6 May 2026 23:41:11 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	patches@lists.linux.dev, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to
 represent the HW format command
Message-ID: <afvRefDGTuqNsfGM@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_164118_049127_7E145976 
X-CRM114-Status: GOOD (  11.42  )
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

On Fri, May 01, 2026 at 11:29:10AM -0300, Jason Gunthorpe wrote:
>Like STE/CD, add a wrapper struct around the u64 array to represent the
>already FIELD_PREP'd command data. Unlike the STE/CD this is a u64
>because the command submission path will have the swap to le64.
>
>This makes the API clearer when a u64 is referring to a formatted
>command and makes the following changes easier to follow.
>
>Move the command constants out of the struct and into an enum alongside
>the rest of the constants defining the HW format so the entire HW format
>is self contained and independent of struct arm_smmu_cmdq_ent.
>
>Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>---
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 48 ++++++++++++---------
> 1 file changed, 28 insertions(+), 20 deletions(-)
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>

