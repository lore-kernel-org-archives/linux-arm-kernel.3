Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF033D72369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePKEQ0GejUBw1iTzV1iSOFdxHwY73KC0ci9l7qDVv0U=; b=nv2zjmCu/BYoxwWfbNwL6d4ICG
	0ScxBiSvIxubO7g/pnurSde109KA4ORDruzFfViTB1rJMYrbekkikwz7+j8FS94yXltOLoqUp5CIW
	LvmO1j11UIo7QztgNXbbxkFZ4m4/qbHgP/agkGxlZMRt6RWY/Njo7L43mPXgAl/vQCt0fg+Xhkrka
	pg5Jf4TQOWuSr8W/912s5bFYyHyHvKpaZJuZJRDaaZzE1w6HDRz0iII7rjrECMn5qDKoqJCmePjJ/
	fTmWn8slLQbK5Fhb9hgu6LJCA2soZ9WbIJC4pre0ZIpaJWMCCKtyteVv6XIjuztozaNmCyR1+FbJ4
	pWzCdiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrH-00000008cmU-0iRd;
	Fri, 23 Jan 2026 09:53:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDrD-00000008cjo-21b5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:53:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a1462573caso102095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769162014; x=1769766814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ePKEQ0GejUBw1iTzV1iSOFdxHwY73KC0ci9l7qDVv0U=;
        b=J+XihFgYCwqvp2+95BNp8Q5rNLQphnADt0vlpeMpzZXLds9Hxuctb9l2Yz+4SZ6UVv
         hEBj+hFQFrUVOf6aAa5n1BaR5xS8vuHez+kXQIdpJF8z6p5Zps/Y6ivJ3aWx4PvBQwIe
         PsHOblS/kLs6I7XQaaLlv+lSRx1m3rDJ6x2X/LOjIt0Dvv5iFNQVfOAQgn5l2SFtWg/B
         pVx9TFSrk2zlDITH75Mi8cuDsHeoOETBWH4KhrsEn8zkm7ok78im7WsFdJQ2F+9ImpsE
         eS8tlhrrv9SZGHmU89HdygkI0CTa3i29Y8oa+KMXJ+VPw3RXnUXA/03y/lBaSqVvU0Q7
         MGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162014; x=1769766814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePKEQ0GejUBw1iTzV1iSOFdxHwY73KC0ci9l7qDVv0U=;
        b=obDsXax2BH2JYzarA1YA2jX9Qf2H6gp5/dqbOhE4uuPI8bCmJVqeSnW0aQGyxe9EVn
         JDvlNqn8P93DIhveHssiOmdYDZtHwNuM8LKoCMeAzz/VO/6j9o6ExoV3BTQw7ypwHGT2
         GFkMLZ5kzX8GoUBar/Kh2kOUT4FKk1cmg5KprnEK7wDJ0dwvGVoKbbM3+ok3rj3QmIAG
         y+nkEn3Ig27yFxUuehNyK4m7F0F1W8qBGH9QDx+Zyuf8widlY6at3MesXbLh6TFeDqhV
         a2Jqc6U9equnk+ZhhXUrEpJW22woje4ShaxdKGZbTY92XksPSBwxYci3pyukYa2Kj2Hu
         67zw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Vpokg9TSjmaymXb/sl+koHku+C/cWqhqfcDptEILSMCFOy4txQoKm7bTfGiuzKpE6jrnOZkS81SpuM09Y28H@lists.infradead.org
X-Gm-Message-State: AOJu0YxwoDhkU9kSFDEDYgcfW45gvY8F1YaWOU1MldnbyFkPORX37hTJ
	OYwT8tB0eSqyoL+xn2K/MeQb5SwP5C8a/h5uPxsq/Il+FDnQJj9IVg5So8iJbnBlSA==
X-Gm-Gg: AZuq6aIqzIztZ8JfB6K8MAiBycmtHYYMrnTSE2uMq+Zy0Ow7f8Cff0gQhP99eX3iKmB
	k7hb1DbxaWHbq6upW8bhSd8DVWNxM9iDvxoQNiIY1kKc2Hn1lQbT/obbTPu/yKAWBBv2uRRZf0m
	yHuVJYZdyY7DBkq3CG0Id0uUFrIYri4FxW/u6PzRwa+m0NCf6k3LF8ZhtMCkR5fRT0shidna16A
	tdfDDZqK/Z12hN95Hkr2aFIbgRqnz2iu0nPMqrzX0roLmMyooDidOAHM8NwuADEclRS+Hx1ckfC
	THJy73AYziTTypYJYZqGhDE+By8V4wVAtEbMkuwdjDm4eC0/zn4Q12bvrAGGfAFJ4vjLCM4Cm6i
	ioWqaTn711k5lODth/1gvPNcNHbbv/yV4ZwVw2123h2cvy3Hz6O9lqcnWO9L4jWj+jLN/L0EBUB
	4pc4vSX1ZMa+NtTovvjfDCMgQyjwl56ldM4/gRpR/ZQa03SR6I
X-Received: by 2002:a17:903:40cc:b0:2a3:cd98:f07 with SMTP id d9443c01a7336-2a805c91485mr1873745ad.3.1769162014172;
        Fri, 23 Jan 2026 01:53:34 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm15301165ad.47.2026.01.23.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:53:33 -0800 (PST)
Date: Fri, 23 Jan 2026 09:53:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, jgg@nvidia.com, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aXNFGNM5MmEuyUSG@google.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015335_521263_836EBB4F 
X-CRM114-Status: GOOD (  17.35  )
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

On Fri, Dec 19, 2025 at 12:11:25PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Create a new data structure to hold an array of invalidations that need to
> be performed for the domain based on what masters are attached, to replace
> the single smmu pointer and linked list of masters in the current design.
> 
> Each array entry holds one of the invalidation actions - S1_ASID, S2_VMID,
> ATS or their variant with information to feed invalidation commands to HW.
> It is structured so that multiple SMMUs can participate in the same array,
> removing one key limitation of the current system.
> 
> To maximize performance, a sorted array is used as the data structure. It
> allows grouping SYNCs together to parallelize invalidations. For instance,
> it will group all the ATS entries after the ASID/VMID entry, so they will
> all be pushed to the PCI devices in parallel with one SYNC.
> 
> To minimize the locking cost on the invalidation fast path (reader of the
> invalidation array), the array is managed with RCU.
> 
> Provide a set of APIs to add/delete entries to/from an array, which cover
> cannot-fail attach cases, e.g. attaching to arm_smmu_blocked_domain. Also
> add kunit coverage for those APIs.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Co-developed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  98 +++++++
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  92 +++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 258 ++++++++++++++++++
>  3 files changed, 448 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

