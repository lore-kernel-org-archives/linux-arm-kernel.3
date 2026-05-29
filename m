Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C8CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpdj4zdvOr4RmzrDJJcOOQOaZ4aQerKSX3Hu7HK0Ghk=; b=mvCKXIZqbCv2sVjTi4kNKFhWEW
	sn2+XHfedOSHMhJARyqHBNQWiLvMcVph8CQBiqSuHKLbVD9dZ2l9uQmTLDp4i/gtDmlw6QCV4iQDV
	JqDwucKstF8KrEkDMt8sTekcKCK4mP/rozfxJY584BzySpcc77G6Zc8DFJcmJUm53+7kVSxTVG3DE
	Nxzf7zB+MOvSiEu8ruDNamKiFa9KKvZDxq0EcrSqrBdCOjdVjNDhWRAjKUPT1nBpbKS3s/zYBs0nK
	BYfwIOOwH5I5kUPhs2Is5d5tz4mgHio7sEphYGosi2RJPJLaL5zf7mdPPFiMpkYOJYNWXpGnglyuu
	JfV3mdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrH7-00000006r7c-3RcW;
	Fri, 29 May 2026 07:04:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrH6-00000006r7H-0BG4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:04:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf22c18ad3so315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780038295; x=1780643095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpdj4zdvOr4RmzrDJJcOOQOaZ4aQerKSX3Hu7HK0Ghk=;
        b=LF+4jipqz0gIUzAwv7j3qeU7f+Y3kooZlkkP2VeD6t09g4pbGhzF+9PG1YGwRwyOU8
         8r6MKE78hRLRmc8tcEbYWzD7dwZ61ten4NKXuiextRTbBOrXFCCefbJ2cyEXkDC92tu+
         X1xHR+tHCO2DZt6xnPv0ayKrxQTdi1FLrQr07tbFO0fPcvvUXh448NljRWRt3WvP2klK
         zox6mhnpD/C9geTOIiTLR7Ote8gHt0byRXTQSqn/3hoU5dMm5vDZhBztTfk831cRzbB+
         2gSgefuN0ftvmCBp9IiZM/kBruVNl8iErSekEnPBGqzMxvFNJyXbl09MT0uOD1ARIU5K
         fqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038295; x=1780643095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpdj4zdvOr4RmzrDJJcOOQOaZ4aQerKSX3Hu7HK0Ghk=;
        b=BjelRCqQYvhI5l3LLNTPc0n7wIOMnP0g7sCoeu4ENB5Z45l4EgvFPF1AjJkXWmnqgQ
         1LLsik6g9IQxCSrqtNEfi0Q4NDv39RVDK0Ud5jRX9fVjaVPJYi4K/99e7NgYfE1NFete
         7Ulbd2M7hCwXPUM4jM6jZlCp3+qojzUeWiUisks+jvrRMcitDpk2xFJ65+eSAuxUWcyH
         k+tXlzm6tSsgSqhEFjPEuPoGB7BoXteJ7BeJnQx1lrlmC0aZQ3l8/Ei8r1mVZ8l1YtQ5
         Rjz7xouQj1rHXsR+WEHy6PrHPP3xEXVxrw13tVnXqkSibFdG5oxt+qv2heam5Twg6YUs
         n1sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XH+trApOM9pZtrv3skk/GMPd0f7c4SmBdVYPl2MnFzhZ5PkDvUk4cS3M49Ot9y9X2W9hGvoDM+xPIICDM0ibX@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGwy0MFKsfXFny0CJNlGFJzem1hMK89rxLGTRY8G7Q/Np76kP
	gIaOXkj1von/SjhTBobxGa3lTsLC0uqLJMIt4FUJGAhmkbeVz0uCBGRIpuGSylLVtw==
X-Gm-Gg: Acq92OGbVzzF1g9jevLEPgJL1gRHFlU3JJeJRueUL0M1lBnRjmu+7qKM0HD7oxMNIwj
	o1TBomxs41jWx0UsDvkB9FyR9QqHwlrZBJeYidoj2EsMBRLjl0p4BRdJ69IHW3eMYhwZwwo6rpi
	MZwf8NX9078Jp5dA5rU5IRnhPP5gNCCZ/g+AjHZx3ssORuHstFlrz+nK0pgFix3KfJQ3+c5l181
	sDEhap7obo8tGs6yQqUyfeXdOFOfJoOOQwfRmq+Ui3VUR+zkhMmbJwGLO+OFMRAln5Chbc1Iqsx
	VvGauixgXjb2P/grLwpLXdu+zs4cLhIK3t+iLUtlPvoGnS2/Ib7klyIsFSuuJvUegOe4GYEjGwv
	Qmbjz45sUhIYTtBweWOTIwq/XNid2f39tILsxgyHL1SQ+L2r6CsPQDwxomJ96x78jA4hBkrVF1f
	p1GPQ3muFi6HwZXpKyPwYpQsQ6jd664Rb0gMoXM0XvMO1zUnNU5jhiXaLzKNLv3gHun/9J
X-Received: by 2002:a17:902:db0f:b0:2ba:73c3:49b0 with SMTP id d9443c01a7336-2bf20d1645bmr1335815ad.14.1780038294503;
        Fri, 29 May 2026 00:04:54 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm914873a12.2.2026.05.29.00.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:04:53 -0700 (PDT)
Date: Fri, 29 May 2026 07:04:46 +0000
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
	Mostafa Saleh <smostafa@google.com>, sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] iommu/vt-d: Fix RB-tree corruption and
 Use-After-Free in probe
Message-ID: <ahk6jom_zexIt5S8@google.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-6-praan@google.com>
 <5c5e85f1-f745-4667-af0d-30af71288294@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5e85f1-f745-4667-af0d-30af71288294@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000456_107546_D7E41736 
X-CRM114-Status: GOOD (  18.13  )
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

On Fri, May 29, 2026 at 11:20:47AM +0800, Baolu Lu wrote:
> On 5/29/26 04:23, Pranjal Shrivastava wrote:
> > The intel_iommu_probe_device() function contains two pre-existing
> > memory safety issues on its error path:
> > 
> > 1. The info->node RB-tree member is zero-initialized via kzalloc. If
> >     a device does not support ATS, the device_rbtree_insert() call is
> >     skipped. If a subsequent probe step fails, the error path jumps to
> >     device_rbtree_remove(), which misinterprets the zeroed node as
> >     a tree root and corrupts the device RB-tree.
> > 
> > 2. The info structure is freed on failure, but the pointer remains
> >     linked to the device via dev_iommu_priv_set(). This leads to a
> >     Use-After-Free regression if the pointer is accessed later.
> > 
> > Fix these by explicitly initializing the RB-node as empty and guarding
> > its removal. Additionally, ensure dev_iommu_priv_set(dev, NULL) is
> > called before freeing the info structure in the error path.
> 
> Thanks for the fixes. Could you please separate these two fixes into two
> distinct patches and post them as a standalone series? These two fixes
> are quick cleanups and are not part of the current series, which focuses
> on improving the robustness of ATS enablement.

Ack. I'll send these as stanalone patches. I added these here to keep
Sashiko at bay.

Thanks,
Praan

