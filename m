Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C65C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN8nBA+Qh6D4N+wqpSDyJLyiHWYbmS4OUKXh0N+DSqI=; b=xy8NGZvcSzlQEP8AQzhtmf36mP
	vpO2px+NDWLmCDK47U6bxe4bz+Lc5hz2L2pEuOibvuyya2lc/E8JANrsdR1EwT8hcRDPw4zJkUl9D
	IIA/eludiKHjKdL2GjODGzB+iEKPXCLbluyfWZRhe375v8O6WeWYMggyjawNdpUWiK9s6VPZNfDhM
	i0JlHofDNxkMPRFPOH+G3pN1K0sQLTb0KII3GVMhiE0Op7iT4r92sPM5tUjbAIdLPkW0G5Rfp2MEi
	hNrwujdSbxvIuRrohkNJhxgAaKPRJ4cnlg3R9wgQw4Yex+ao/SevtOAogkrOxwghzRV7lUHGzNoC/
	kMp3SoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmznY-00000000y8T-2ol0;
	Tue, 25 Feb 2025 18:36:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmz6a-00000000l7x-1yWb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:52:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-221ac1f849fso1785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740505948; x=1741110748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dN8nBA+Qh6D4N+wqpSDyJLyiHWYbmS4OUKXh0N+DSqI=;
        b=IdEBfLmjK2zEtO86ttEtlOT2oABttUHMvftkXK1OSUgaid0qIiHY4cub7XbO5Aj+FM
         j+l2dCkJNeGZIUSZisHHXUYvE1EVuU1bTR7agYXj/BdJSKMB1G+d8WysLT/qzlH2hN/v
         qECeDGdR/J6L2hZeCVaoP/NGJu3mFr8/GGAByW+TK6cdupoCTpyGkmiTKs68oQ1xCY3B
         CQNznZ06SJQSBn7FK7HX0WG+TTpQP8uMad1u2BlkHnd3F/r+DxdCtcoMeZV25pUaML3K
         DCiB8mnuCrlxpbLsKw80uCn0qvIdotMqTrxtAGZS4U6LTg1BhdaPZGyH9Q8dr2UUae5a
         FCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740505948; x=1741110748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN8nBA+Qh6D4N+wqpSDyJLyiHWYbmS4OUKXh0N+DSqI=;
        b=BeAH6mKlSxGf2/8XZI6N4BZiWMPwkTZ7prLBPR/GBzTPDfUcr31a6Qiar2CaesV6D0
         yUe92zYW/yn9eJTxz12+jxaZedhWtSoNN4URzWTNRVJ7z/7TvPW+R6iDDRhJOxjhFWTV
         bd0zNYWLg7GYuBwCKrWkm7xJhA7NF55aYn4POtbu231d0v1gTzWN8YKdOL+TcrzYKy4M
         Zzxi4a1UzD5M2wOpfcVs78X4CO9wa3mO0tdmrOlVOfCTpWHNawbIjqt2T2dFE6FZeCqp
         4FxKIHFWJzVPPbDm726+246n9lw/k+J96desm+7sh1WQh5L/Q1MALHjeiOx3hKYrAbe0
         nbNA==
X-Forwarded-Encrypted: i=1; AJvYcCXINhYRRXpKzNcImnJ5Eb7+zrwBvZYd9Wi4b2EbH5ulIUdELN/L4MnEh5GfXs+zzd3Gsq8SlrOhWyYDOauLhLgX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Z9gJ/9TnPGrbGGw/PcJ8IfiPAgxmKqsgMrArYkje1jTd+QsC
	BGd5w4a8+p+uy6wOZV667yH4xcQO46CL4J1zdDgbHX5Yg6E6lpAwoEcaqENrNw==
X-Gm-Gg: ASbGncuoIwPZsGMLZ93/Sy59njRtFQwiUnv5zyaoANNjzcymYXDTwSe+mty9R3R0B92
	4g1xQlnhDaiFhJCiLS9GUZN5QFBGzOX+1egDrWnfr6nBu5SqDIn5+9Tq6UydgFODwtznNyuuBM+
	y84LJkoiAdwpaxa9wE7qXTe4xVYj5T1Irx6C7h9WYBL8J+/Hz2xDjzH8ZS6+7ecgJ20+uhc4853
	ZaqtKAIj+QSCr4lihiYlBe2gYzfTOy+ZuHMj/wt17dyQTzT3ppooqPFmlIWpLqXKBLFSsmwYYh6
	KOhp5Kp03vfOPSy7KNuL4gWXCQa5dzlWYHYOLajrqFZef489ZWDFK0MoQ/FEOzU=
X-Google-Smtp-Source: AGHT+IHCwCn1SF2NMONCzfAyHzGrJNS1HAUTJPist+TAdk8bMDyf0wMytHFuTMKOTPJoVoDGnbqb0g==
X-Received: by 2002:a17:903:244d:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-22307a60187mr3928025ad.16.1740505947317;
        Tue, 25 Feb 2025 09:52:27 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a43ccb3sm1861445a91.39.2025.02.25.09.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:52:26 -0800 (PST)
Date: Tue, 25 Feb 2025 17:52:16 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z74DUPcl9KRZcvpW@google.com>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_095228_511096_742EBFBA 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Feb 25, 2025 at 09:25:40AM -0800, Nicolin Chen wrote:
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.
> 
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing
> arm_smmu_attach_prepare/commit().
> 
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 28 ++++++++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 45 +++++++++++++++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 18 +++++++-
>  3 files changed, 90 insertions(+), 1 deletion(-)
> 

Apologies for my spelling error in [1]. It's supposed to be:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

For all the other patches too. Correct spelling in [2].

Thanks,
Praan

[1] https://lore.kernel.org/all/Z73zvIbsXzJMCaNt@google.com/
[2] https://lore.kernel.org/all/Z730M3XptvDRObBp@google.com/ 


