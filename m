Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5105BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=; b=4+jVSSznqu+KARR7GIr0dtAOm6
	d9iauNFrFbISu98FKsIVhDQj9E7gzCkG8M0H6kC+jv8zeIakD8Jq8MvRPX6JAfsdOHea+OfkjtwXD
	QS3AK0gfh3DZHz7AR+EfVk2G1VWri8BjmdUiNqflksoFnT6aCyBY4bwikj030xwmV1qF7X22qSSR8
	YFCz9AkPCXyOiWDx6x89iykelOo0UMuuHkw4jrC8aoBINr5u25elg8HZtj5UL6ddmlADvMv0wsx/J
	jzzdKI22ixHPSeM1IXnRpo8TUirFBzsj5xZ/CVRKHVGgFqdm0DQIV86xOHRvW+BT20ryIOSX4neoY
	dKK2CNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkp26-00000003BzG-2KVb;
	Fri, 17 Jul 2026 20:19:42 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkp23-00000003ByN-3pPB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:19:41 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92e5c9211d2so678782385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784319579; x=1784924379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=M8AzFT7jK5pwLDlmnaxBPPg7G2URcFr6Um7DunVxQNlXHbPskxpjIF2uYphg37Dj74
         KaocDpV4FWerG+mHMIPtygBhHKjtjdEugRZdhhVv1vXdy2Ak/JnkPZKHz/J3X9uFFMWS
         fHKVEN0BseNI8YJEtH7szX5/jIyOPhwSqzzowEMoxXP/wtMp7NO2c27uzjTUQ2xztECK
         Q47Ybhl1Zj8wxU0QvFTu2Hhy2Vnh5bj39st+f3YPvVVzQQgqjUJHaNkRGSonPoGE8hw3
         8BG9Hn5UQxjm9VAfVpoSsi9PnqE8AkxHNx65FdTv2XSLUgSaY+VOfzDx1dPQEyplmJle
         2KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319579; x=1784924379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2hbpzf52w+esSVkF8QFMW+oo8Oyq13jDlcvDql6gbs=;
        b=UJQ+6sEwhNt3Yn4yBBdYzUWfve5ETPY+g1bK3fsFOuXRXAWTQ25B570eN1ahy0LH9N
         IVQe2R02CjgkSOheLCVCk/1WGq66K8rn9B+4Actk5CU98lHxA29mf+t+lSD6FmE0S+y5
         co/l4L0PlDa63Fr345GCiKcvna+8DdVBXL/2sZnavCXboEcnE7CcSxRSCWhJzAmk3KsV
         qJuFxUikjpdGVTJpqT4rOFpL2jy7P7N/VfljYYnRnATbuWYPs/YqGyY8Tzkqy3arwLcX
         s9dGGnzAq52WnWBG2eM/6RH4LTj1Q/7nZFyI0dpM4bWiaWFbh1nk6tZ7HZsDaN3bVQvL
         YQQw==
X-Forwarded-Encrypted: i=1; AHgh+RqDOVGdIL711CwpfZaHgWV5ou3NCRREk4NGUaW1lVllPnRvOn3J48AXCAYZFYW9YzcJ0GS0ga90cqFcpxjSqKyp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvuqz0mLFj7TEx1K6Z5+UbzIoW6ywaEI4Y1c56vAQ2g345H1u1
	gRCyu0nIDS1z2jwzRRtmNqR11cJD1Ay9km7NxaBR95fXGTX5Fvhaj8LDFOiPS7aS5TA=
X-Gm-Gg: AfdE7cn1JuQNB98pyE3GmmKiTkKhmivuf1wH0gWCRWzD4UdLm8l6L/bYhpGSVCCC0lc
	CCogir9JNZjOFID4VCr3c2rNjYbPRCeWu6nuwY7quXLoR2oPDxtqg4OF6WMQjL3va5+1NeUs0pj
	nra275Fi0VitMkIo+j5cLAzRmNxElHsNtbxCZt2ubmFa9t9UZkNRbH5fBMB4b3sBzHK3N4B2mDK
	TwFBXdFfvdtsqgoKjpySzREKQrUPkQbJPl/RxjqbtV/BLlFEowF9AbvT0eWIPZqH03g14AMVUFR
	oxYn6DKy87AJW7yOPGdMY53vD1gsHrqe6cHPSa9/peyZ0cRxmc7wxzgcGilw8093AFizUzkkSYP
	/znGKpAjZ71dQixMg6+O91n6bYxx1GHXTdTCJACGzJkIqAB9G2g==
X-Received: by 2002:a05:620a:4588:b0:92e:e2a4:9d40 with SMTP id af79cd13be357-930b3f4547cmr452740585a.27.1784319578518;
        Fri, 17 Jul 2026 13:19:38 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542b300sm245589785a.26.2026.07.17.13.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:19:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkp20-000000052xd-3lLn;
	Fri, 17 Jul 2026 17:19:36 -0300
Date: Fri, 17 Jul 2026 17:19:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 3/3] iommu/arm-smmu-v3: Enable CFGI/TLBI-repeat
 workaround on Tegra264
Message-ID: <20260717201936.GD701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-4-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-4-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_131939_958680_83F35A22 
X-CRM114-Status: GOOD (  11.19  )
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

On Tue, Jul 14, 2026 at 10:42:02AM +0000, Ashish Mhetre wrote:

> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5357,8 +5357,10 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  	if (of_dma_is_coherent(dev->of_node))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>  		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
> +	}

It is a bit of a big hammer to not have the per-instance FEAT but it
probably doesn't matter

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

