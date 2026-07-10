Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwCO1//q+s3YukDP/Z5Z7eubEGo+AIobT+lx9B201YY=; b=GC/3CuOQ7+VWRdTeL7zULvYDf4
	50guJUNz+70lTAKYQltvyjRNZ95k6oj1Ndc5MNo74gXi/wFCjLr+E2j9W17aoLAisNpkeuyOiETX+
	s0WcZGwKaA3ih3Hk54EkeNIS19v+R/C5yATMnZDJW8rnxO0nydAtRrW2hbOpAgBZwzTVnLx8+BKdH
	H37ZqpAgqtmTuVGFNXe/9gaIGHuhU4wIrNPvuALklTOdF8qJKk68jiNGNGF8SLpDt7OpI7w4Sb8LD
	v5gKljpQTk1n+0YwhDAVjb8cwsqeydpANK+XHtTDYVNkqsUEmqEuSxqzQuhUySFjW2psdn7nqoV92
	+A+g0kEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEbu-00000005P7C-30wO;
	Fri, 10 Jul 2026 17:01:58 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEbs-00000005P6c-1QAs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:01:57 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c149c5722so9087851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783702915; x=1784307715; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwCO1//q+s3YukDP/Z5Z7eubEGo+AIobT+lx9B201YY=;
        b=ec5yYk5JCPEuBcc+h6aIJxg4WIKzCyMcuKl8hT1yD2BBeNetlNrSHr14vxGGT8yTFf
         ayuNnYJVNgc4ibYYA/Z0WcBGjM4uVxUWLWWxNKxlNGpOqquVJtE9PUow3qhbL/Db2P0V
         fm65dH9fYfjw3vUI0Qri3j704Sur6YIg7OhYCZXNx3uT7Mj2mYdOsq2F6Ncv2M9zhsQs
         9qlnrSQ5NPc7HKBAA6lr2PgTeSaREYqnYKZ0I1OBVbBogWSI4cgu6GiBkEkhD776ci8+
         CcgT0rAysgW8rwyOOPhG9vOkOrK24JzM1MPYSOYlQ0PD8KFCPu4Jmac+cxco0ATXA3T1
         OKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702915; x=1784307715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwCO1//q+s3YukDP/Z5Z7eubEGo+AIobT+lx9B201YY=;
        b=CWn4m/JDNjla3zwlJI4UPlL8GhDr+DTHUBn6IXOUzNh1g/h/vCipJqgRmhhrjcbAuW
         CUNxtgiOOBw8WvyLZYb3hJJY3t9R46oOMA+2QfRLkEl8mMc3C5oUNyT7OghrOuMk2qAk
         MvG/rI5iZZQZgvhsshlrbEGSA3CEc/yujlT3lr074+TiXHHEGrMgnx4Yvd73uSgeyAjc
         WdDK+FcGy63h0lATokbkWNdZJErgWiW90sCKNIm9FDQBacMahOk550yMh/m/nQQMR2YE
         DaCsDyY9YT7SO0R5bZXB4/2G9CL+iD2fQUEzeg7unmVcsDWz4QZ5hKIrqoAF+qnNqEpf
         s+/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPk0xwWr9feE/fVWYGfkIPbqWV0+vlvhuUZd21mDWve5vvfXue1GgJr1Q5Oz53/H91sUZM5N1YtcMmzE8ku7DJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyiaY/fXqimomn9+GUslD6Gvx6mOUcXzEbTIas+dcO7rQ5MIvNl
	5OLe4LsS2trAeQcHB5wbJtkYOC9mMJmbIawqt8gyGE8/hyaMeqZwRjQ9hSNkfDTUCKc=
X-Gm-Gg: AfdE7clCtZDepCOaQsk8chDJnNsSL3OZb46rYatXMGu1Pn94vFdtRS2yqQlG2XtqOaj
	RyyabJ9FfQiI1JieZJCkThxanriz33kRmhKlp/qoGBmLwWkdZSUSr8XEmIe5dteQa19zIp0FJaz
	dHHiYmz3ILcqJ+oMBMbAOjPOWHHB49IxMjy6Qi/bI3I5xhs1U5WavuXxnRS9tf9Y48VTNtCdR/a
	7mOkvYlZph711QoZbEa78RZEm4us+VTAZspa31V+/hcTWuX4Qn0SWVPbStsoX0Dve5C6/PkBE26
	z35y9k1N7A/GC9LZV/rQrH5of5bLuJY/gNOOj5suF2VdF+DY6a/VLNp6EGkLzQYZoBHL407fhzn
	9eMMxITg8AadgfXAXxNjWcA1w0eqJWnP6sUhY38qBMQGeukUAobSYfXxkocEM
X-Received: by 2002:ac8:5fcc:0:b0:517:5ed7:d28f with SMTP id d75a77b69052e-51caa476931mr43472331cf.25.1783702914518;
        Fri, 10 Jul 2026 10:01:54 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51cba49439dsm6020111cf.27.2026.07.10.10.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:01:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEbn-00000007aTw-07zw;
	Fri, 10 Jul 2026 14:01:51 -0300
Date: Fri, 10 Jul 2026 14:01:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	nathanc@nvidia.com, mochs@nvidia.com
Subject: Re: [PATCH v3 2/2] iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free
 on teardown
Message-ID: <20260710170151.GC1803712@ziepe.ca>
References: <20260629094106.251694-1-skolothumtho@nvidia.com>
 <20260629094106.251694-3-skolothumtho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629094106.251694-3-skolothumtho@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_100156_383212_84E607F9 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Jun 29, 2026 at 10:41:06AM +0100, Shameer Kolothum wrote:
> arm_smmu_impl_remove() is registered as a devres action in
> arm_smmu_impl_probe(), before arm_smmu_init_queues() allocates
> smmu->cmdq.q.base. On a devres unwind, whether a failed probe or an
> unbind, the queue is freed first and arm_smmu_impl_remove() then runs
> tegra241_cmdqv_remove_vintf(), whose VINTF deinit issues a CMD_SYNC on
> the freed memory.
> 
> Observed during testing with a QEMU hack that makes the VCMDQ fail to
> enable, so the impl reset fails and probe aborts into the devres unwind:
> 
>  platform NVDA200C:00: tegra241_cmdqv: VINTF0: VCMDQ0/LVCMDQ0: failed to enable, STATUS=0x00000000
>  platform NVDA200C:00: tegra241_cmdqv: VINTF0: VCMDQ0/LVCMDQ0: GERRORN=0x0, GERROR=0x4, CONS=0x0
>  platform NVDA200C:00: tegra241_cmdqv: VINTF0: VCMDQ0/LVCMDQ0: uncleared error detected, resetting
>  arm-smmu-v3 arm-smmu-v3.0.auto: failed to reset impl
>  arm-smmu-v3 arm-smmu-v3.0.auto: probe with driver arm-smmu-v3 failed with error -110
>  Unable to handle kernel paging request at virtual address ffff8000891e0098
>  ...
>  Internal error: Oops: 0000000096000047 [#1] SMP
>  ...
>  Call trace:
>   arm_smmu_cmdq_issue_cmdlist+0x320/0x6fc (P)
>   tegra241_vcmdq_hw_deinit+0x98/0x168
>   tegra241_vintf_hw_deinit+0x5c/0x1b0
>   tegra241_cmdqv_remove_vintf+0x34/0xec
>   tegra241_cmdqv_remove+0x40/0x9c
>   arm_smmu_impl_remove+0x20/0x30
>   devm_action_release+0x14/0x20
>   devres_release_all+0xa8/0x110
>   device_unbind_cleanup+0x18/0x84
>   really_probe+0x1f0/0x29c
> 
> Drop the VINTF deinit from tegra241_cmdqv_remove_vintf() so the unwind no
> longer touches the freed queue. Quiesce the VINTFs earlier instead. Add a
> device_disable() impl op and run it from arm_smmu_disable_action() while
> the CMDQ is still up. That handles a live unbind. A failed reset is already
> handled because tegra241_vintf_hw_init() deinits the VINTF on its own error
> path. tegra241_cmdqv_remove_vintf() is also used by the iommufd viommu
> destroy path, so quiesce there too.
> 
> Fixes: 4dc0d12474f9 ("iommu/tegra241-cmdqv: Add user-space use support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h    |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c    |  2 ++
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 15 +++++++++++++--
>  3 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

