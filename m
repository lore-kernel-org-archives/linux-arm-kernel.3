Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B299D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTYFAMmhtE4NKQmdzfuC730nwqhs3VcPytU8c4s1NEc=; b=slTDqeNc0ZTjqURnaWcosW/uNC
	wBeWsBN4CsFx4wu7aqQhv8/NYcCsbMOwOSWl/QzAQA0gGr/vt3CPAvOCtJr7RIseCOji/F+azQdTV
	cvI+j8l24WJYGQ9lqFBBG1L7uy//zwvAqwxne8oRelDGXlSp2vz7Dbh9tdL87dhjW42hWAaGcWpMY
	dx1hzfRQcpNJ4KWHL1urcZTzce1JKXEf3nv6buGBm75eK9raMx6gzwGNwcV+M7KPjgBsLPqiRsnIW
	FqlzbzpAS0BZD2L4169HAYg0+GOJdtCIwXI5yBUGw9e7A5zOKlB61dkyGjn4AASaPW11SHYRSUkqW
	UARp5gBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsR-00000008dfL-3Z5N;
	Fri, 23 Jan 2026 09:54:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsK-00000008dVz-1rWW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a76b39587aso96005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769162083; x=1769766883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTYFAMmhtE4NKQmdzfuC730nwqhs3VcPytU8c4s1NEc=;
        b=0gme3DsVPNgCl+qOzboG4yNHmYyDoFD/DDf/tVXSRHkAy0G1sVNHBOp2hyn+zIZtkF
         QBT+TDPFYbCy785xJUXyxeSYxeHonuGdbWYWOX69yO0uk1tGifAX6QFSLMAcNhqtY59p
         0oEIIqK3dUqsdlqyuFuCRpABDPRxjD1gvkH4CRFhNT4AbiGwE5p/ln9QluyH2JnPbPpt
         /wXSy4c0iMJxKutrMsfZVx3Wcv9XdF7V21z2Ei5qpnJhUx6RyDhGxJwp7wiSZ+KTpyhY
         d4KTYgCairP+i56rrbW9U4WpWDfXzajvUB1oLfoLFdAQOksU041bXPFKw0OvSKCuNNty
         Z2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162083; x=1769766883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTYFAMmhtE4NKQmdzfuC730nwqhs3VcPytU8c4s1NEc=;
        b=POVV+k6lWm8gKEik8G0iyJU9sCCuVScgatrDRSCUDBTVgBfBUih/GsGA9cbc2Nc6aG
         r7+u+yMJVIJH8zlTmKIfpLbwz/jV0rB6Wr5qyB6qUM0fUjCkWOtVnC8FQFPHYfYEfZCu
         P1E0k/VpYGjBOYzCdc66FogI7f3L38+vTXjxB93I3X3j/cEC4SIpMARpnhLM72zc+zhk
         Dmn1Qw45dz4q0/KdS0mWy1p6RPnU2vC2anzMpd7tz5sLeBtTYzCV9uhb1RKtWgboHzFK
         gH5hPcweoY9Y2Xbs0urGivztTSCRhxnuJ7s0oDd8lOmwRjTxBdKgY4s07gil4wHYkaXl
         7FSg==
X-Forwarded-Encrypted: i=1; AJvYcCWzZLhQUbC1u7D4ck1xLaEAkaEY0AI0cwPKdiyI9/vrPTn/QbVx6rUENXEKTrOIzUfupe0CPAFzh5aqj1G7AMGv@lists.infradead.org
X-Gm-Message-State: AOJu0YwSfAKiF4TiI7RFslcftSvrFeOkmEh7lato+SLCmfJxeOAd0eyI
	/QDiEt0GJKKrYtC4M6yat4VWob98dw/T444UZNO9yHz+b1YJnzrlbps2IvalPHxHPw==
X-Gm-Gg: AZuq6aKv9IcgwVVuvg6b3jKkunP3w9ytjtOk3eJtPyH+nA/aLZ3Tm1kRSXe9uOFEWWd
	rfzCYQ/UAP3+EmhsUE9K+3QAV418QuQy9b8bwVcCqL0Js01z2VNjjm5pV8fO18PFNdb1cLK7EB3
	JcA1cr6ooT14dFzzUzikQ/KBH4tTvLdD1lgYFPbaKh4BdCwvF0N5l8pCHOgIAXWCrVgACk69LgJ
	p6nQYwMf+0Jp8S9Vo/3PNuG0BpNVlUbZ62GgKkiOca2Dl6seT3c5rLgVWIodStJ4SJDvQRr8MoR
	V8m4PGWfQkNLPI5pASXkjjU98NeiqW2O6iJyPh13rZ9g2b0AJju3v8ccc0LYfqFPjf02jp/YNj9
	oCRFH9FAnw89RIYIOR7TGO7vvPyH77vRTO9BB8bQCv1Y/W37LI2Z7PuM0clAfi5aYZW2UgNtEUA
	NvLgYMCtM4WF84nXl+S1YWUUjtuA7cPZs2FWeKmb9Yqqp/CNLG
X-Received: by 2002:a17:902:e548:b0:294:ecba:c8e with SMTP id d9443c01a7336-2a805c9abbfmr2227345ad.3.1769162082816;
        Fri, 23 Jan 2026 01:54:42 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d57csm1719570b3a.41.2026.01.23.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:54:42 -0800 (PST)
Date: Fri, 23 Jan 2026 09:54:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, jgg@nvidia.com, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master
 invalidation array
Message-ID: <aXNFXJ5SWuiQvJK8@google.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <d6565a84698d93d6a2842b32bed492f87179af5e.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6565a84698d93d6a2842b32bed492f87179af5e.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015444_515180_C731B80B 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, Dec 19, 2025 at 12:11:26PM -0800, Nicolin Chen wrote:
> When a master is attached from an old domain to a new domain, it needs to
> build an invalidation array to delete and add the array entries from/onto
> the invalidation arrays of those two domains, passed via the to_merge and
> to_unref arguments into arm_smmu_invs_merge/unref() respectively.
> 
> Since the master->num_streams might differ across masters, a memory would
> have to be allocated when building an to_merge/to_unref array which might
> fail with -ENOMEM.
> 
> On the other hand, an attachment to arm_smmu_blocked_domain must not fail
> so it's the best to avoid any memory allocation in that path.
> 
> Pre-allocate a fixed size invalidation array for every master. This array
> will be used as a scratch to fill dynamically when building a to_merge or
> to_unref invs array. Sort fwspec->ids in an ascending order to fit to the
> arm_smmu_invs_merge() function.
> 
> Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 41 +++++++++++++++++++--
>  2 files changed, 45 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks
Praan

