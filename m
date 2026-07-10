Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB5BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHiYCqM8hSQa7B5ZpbJ9qj0q83p+UmFHrgLIko6Kvoc=; b=pPUs7rvnto75SdQ512eTzLpiuW
	zYCuLRbQlvAG50GFJpA9DNmM8XKtl8+A+Uo3Vygn7Hfe6169UtT3rfN/LVCJB8xJYJWn79cRnSkg0
	CMc9GlV9/kw3xAFphiQXRZVqfsozZTa1ygzFR9dvzC0QfC05+7c+CBFh7hJPmHR2r4QhIg6vI1Jsj
	8gxV3s6qa/BZ515stNGTPTRnGLIhJGjrNUButxbAIOGQ+8Cvnp/D8xUT1lNGr1ggiHKhKePOOBbDw
	vx5LgT9qPdaSrxAx4W8vl/V+2pTy58k7nPLQER3xS+cNxMUOpvbvqyfdIJFTDFO3w/siiKn0hzb2U
	V1B2ig+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEi3-00000005PrW-2O9w;
	Fri, 10 Jul 2026 17:08:19 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEi1-00000005Pr3-0Arx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:08:18 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-664cdeab266so1807020d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783703296; x=1784308096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHiYCqM8hSQa7B5ZpbJ9qj0q83p+UmFHrgLIko6Kvoc=;
        b=H15wYFuPTmSMZ4ze/oWYnHP4UE3bRQgl+nMmcnPk6g0+scxV8qH5U/BzXbOkQnKtqq
         +K/P0eVF+0RzDhrBBNFI7wLfEae10UFo2EUksBu5o3Nik1lVQKA5t0lweIUuzTErmciG
         h8Qi7uUq7KzeklzQa4JPpVGjA8C1xwmoSdr0Hv5UcXkbYexkopcdHkOskFquGtowx/5N
         97OvO5FkZHbdwhfM0n/rb21aN+occBcgMgajiKk9mtpGOzQjXegELiP0ZxQLf94fRakq
         zUln6+Ja6k8fYd8hCY20PkjIb2//8HktXB/apPuSCGrq59WsbZdWkzb7SaH6g8kTVtHy
         hENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703296; x=1784308096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHiYCqM8hSQa7B5ZpbJ9qj0q83p+UmFHrgLIko6Kvoc=;
        b=hCsRnCeoqs2tHFVhW91gNENhFFqMFsrhs2QKdutyIGPXy4ezIKErQhD5btLy68bJZK
         FnMicq7hh9eqMcL8wmTIlQykvvwnQwr/8Wc8WjrWmXVJGBSVpY31dmOv00L9JkNkQeRt
         jySBS/elpfGYJNHI4LxRcf4CAHWJAmqitmSlroCQOXAA4NXsw/0NQwcBtP3g3F758E1R
         Fyyn+Jkj3xeZmkH4OiPs1eL4yzwHWQystTqOK5zQB0cwTbZD8QRXWc1fh2EEwr2mje8u
         d3BwJFM3AoWZfcOenI8CbiAcgY24cZFM7y9gWnA9TgAF0RNcDtAfxGdeZVJH58XdxUHK
         vUmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhx+iBmPKOg05nOaaOYs8oFpC1WUpbS+kgQgYf8fO/LQjowfleFbXhOzNFSSJzv6vk2Xp5CrKM3Hrt/YfKLqGj@lists.infradead.org
X-Gm-Message-State: AOJu0YzhYinCEya4wLf+vfzUCkffkU/40C8/rxQBANqf9xMXRkvB8oSp
	Tq0DHD2CxT8OTc7SpqJZDP88fxIt13enjTMjopQYfDHFUmxtm2muH5SI+F4XOl94MyHH0NCZipq
	OmGcs
X-Gm-Gg: AfdE7cnKlHdLLTOZXaWN3m/i2CtcOqhaL96sLAeZb+1R/TJpHVep9WwP0/eFDsmp0fH
	8lE9YgnajJtb7r0L2E0Y+xZxzy1bVoG3i/ZkVjcu5oq7jfH1/lLZWwdEbRuVzMy5DsZoDm7GRlf
	5TX5kEAyY+laoXaQjg4W5gqFbvmdXMLAC6p2dan3eyjuQDmolIWMD7dYGva9nTmOME6FuUcAvMF
	zLR6tlkcTHjCYeNDa7GQY2BPIkb5mHeF3kLHf0ncZOkRHzdOmYXMx+ppUaDvnmdAtw1BeQnSgN+
	g7FTesLNhe3T5pJV8e5TFqcbHyimzkh85YgLgL4rkHV0lzTxKt+t9a06VYTeB4lTJOLmPm8rWlV
	Wkx3spndjOfUOk14ZPTcHVI+jF4q8J0Y1UsHnLZCpen+/gG9pZjEF0yTmywb2abfpd8cenYI=
X-Received: by 2002:ad4:5764:0:b0:8ee:6e1e:e38e with SMTP id 6a1803df08f44-8fec342ea79mr153526046d6.34.1783702828117;
        Fri, 10 Jul 2026 10:00:28 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbb1e1sm45465696d6.22.2026.07.10.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:00:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEaN-00000007aJa-3c9z;
	Fri, 10 Jul 2026 14:00:23 -0300
Date: Fri, 10 Jul 2026 14:00:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nicolinc@nvidia.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	nathanc@nvidia.com, mochs@nvidia.com
Subject: Re: [PATCH v3 1/2] iommu/arm-smmu-v3: Manage teardown with devm
Message-ID: <20260710170023.GB1803712@ziepe.ca>
References: <20260629094106.251694-1-skolothumtho@nvidia.com>
 <20260629094106.251694-2-skolothumtho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629094106.251694-2-skolothumtho@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_100817_080469_B3C25CC3 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, Jun 29, 2026 at 10:41:05AM +0100, Shameer Kolothum wrote:
> arm_smmu_device_remove() manually frees the IOPF queue, destroys the
> vmid_map and disables the device, while the IRQs and queues are devm
> managed. devm unwinds only after remove() returns, so the cleanup runs
> in the wrong order. The IOPF queue is freed before the event-queue IRQ
> whose handler uses it.
> 
> Manage all of it with devm so the unwind order is correct. Free the IOPF
> queue and vmid_map via devm actions, and disable the device from one
> registered after arm_smmu_device_reset().
> 
> This is also a prerequisite for fixing a Tegra241 CMDQV CMD_SYNC
> use-after-free in the subsequent patch.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 56 +++++++++++++++------
>  1 file changed, 40 insertions(+), 16 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

