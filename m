Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6427C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8ahLP6tau5z9zFvNaThnA7Wz1kGZZr7teXmDUhSLis=; b=YiAKuQIHJDXdlb2Mwkx+LPyQ5O
	io449hmwXxX5VD1d0yWRJmjrPVuYREqtsayh1rU5dVjDkj7XqOOHVN5nCC3dgn45JgOdAlThg/UZk
	fbBZ24RBmlLEWXV8IXa+sy5ufNHaYN/1seL4UptKJ/YcRD+InGOc1aDlQpvSscsjW6g2uaLISlyIQ
	3QbDgT84XM+8uos1BsKG17mwJrQWcRGdod5TA+1yPsHAEpG12KKdeGAydLPvppj9vLfMOIJLc6wAV
	Y5JDctjr4j/p4bI59PCsonJTUqJ85bQP5P5HU+C5xEia+0l+uOVUb2SUb9dfvm11a2zAg1BPoaLUu
	2dHs77Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to67U-0000000CN15-0Olo;
	Fri, 28 Feb 2025 19:34:00 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to65w-0000000CMqb-1DLx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:32:25 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c0ba9825e9so174059585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 11:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1740771143; x=1741375943; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8ahLP6tau5z9zFvNaThnA7Wz1kGZZr7teXmDUhSLis=;
        b=kCI6nH+Fw/gWBs2BHWX5mvziv9IiedSe71xrRFEOjB3l8NLRPK3TzRyxAyyqdeCv5M
         +JLl6hA+C5DO4DctZ1GzKS+wMHmrXvlfP9XCNQ3AUKBGnjKcLCgQwzZ3yye0VGPtyXyK
         NiQxF00EZdkQgcxw86JxE/naqWYnlLS4NAcArRVLky1HRaBAvyba34VlBcMZU9XMLeJu
         AEK42O2HwHpGFnvifINh2nk9ehD99TcCdjVZBECKa66u1TG02lxsuKhzQbsJxYD7IKDw
         fFS6GLHERYXUx9tYyu+JbxAM8SeRRygcA/vhLdJBzI1gOEIHf2lQcD/qmtyWK6P/F4Mw
         T8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740771143; x=1741375943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8ahLP6tau5z9zFvNaThnA7Wz1kGZZr7teXmDUhSLis=;
        b=GziTxVTzq65XNgrx8DqgTgNy8Rgu1Z2Pb8fLWw54bBdUuXEnK+Ux5W63cfH5UyRx/A
         cBWGmXicbLWAg6g4NjRh3zLoTh9YLxY29cL1cmwuY6jkvchhonmRdmpIqhl/zFCxbSEz
         aKxKmPm4QoyGxJ3u4bvOYHHMbF3CH4sVr35zk3HssArk3vWTYfzy3UzEPThri01HDNRN
         cZ7gOG9hmO6BXMHAwosX6Nj9Lp9giI7QLdxplG6z0o/0crOdxVj0tUWBbrOQswA+H/s0
         cNeypeSRTYiJ3oUQt7IR7EgRt7+sX4whZa1U907Ohb5zS1fYKQzDPdLgc/Lyxbaeuz1Y
         lreg==
X-Forwarded-Encrypted: i=1; AJvYcCX2buWcWTjyKdiu6f6ELojUx7AEvaoyiC8RAbWkErteB9ysZQ/RYUVdbMVoVJKFWykZVU2On/Xm97E0MgLN+p3S@lists.infradead.org
X-Gm-Message-State: AOJu0YxuuMayEL/FAz94qZwthtvcG630abFIMLrjtZYC3TT+nuD692wt
	THQzi/OU5x28DDgn4VbAd3l7zE4XWQd/T5xTwQS2vs0E0GQmP2M6V8ZpcjF+3TE=
X-Gm-Gg: ASbGnctGw9IoVVXL4H+MvkpHUYL+O//7Lt5N4fX0yxwL2mAsamtrMNWDPT+IsBqdWhw
	TLCe3yCwsFw4tnSPj2w1q8pc2jzrmJxWbt+rHzFOJ1U1ZnkpMHPghX+fKY4B6Fl/Au/u4XU7PoK
	lHCFcMsyFlyXeLWdou3z+H1lkVtApY/F8O641Bv+0cASujVIp/OuHQzO4XZrUGLe1E3i2L2siGb
	vLvUd5iQNn99gM+yrJILhccwX5bt0SVXs7QbWrSBTzvyzD81BEtXojLaE6/PCXaYqoEYzhExlS3
	40+4a1ltc+ZjI2N5sPImcAHPiHDrZExgcGvTW+dy4fWcHR9XwMZy+g8lqD3dR+Fc7CJJr22Y3UI
	=
X-Google-Smtp-Source: AGHT+IGfp/qlV0bFdQ4UlFF5bJNQ0s1CsbH7fJWc4GjD61AnOXb+ucW0858X/QRyI+8xsu26VjRTjg==
X-Received: by 2002:a05:620a:668d:b0:7c3:9d4c:8193 with SMTP id af79cd13be357-7c39d4c81bfmr429574885a.5.1740771142740;
        Fri, 28 Feb 2025 11:32:22 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976da283sm25082546d6.111.2025.02.28.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:32:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1to65t-00000000Th1-2Pej;
	Fri, 28 Feb 2025 15:32:21 -0400
Date: Fri, 28 Feb 2025 15:32:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, catalin.marinas@arm.com,
	will@kernel.org, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, joey.gouly@arm.com, oliver.upton@linux.dev,
	james.morse@arm.com, broonie@kernel.org, maz@kernel.org,
	david@redhat.com, akpm@linux-foundation.org, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 4/4] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250228193221.GM5011@ziepe.ca>
References: <20250228182403.6269-2-miko.lenczewski@arm.com>
 <20250228182403.6269-6-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228182403.6269-6-miko.lenczewski@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_113224_452520_B4E7CC23 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Feb 28, 2025 at 06:24:04PM +0000, Mikołaj Lenczewski wrote:
> For supporting BBM Level 2 for userspace mappings, we want to ensure
> that the smmu also supports its own version of BBM Level 2. Luckily, the
> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> BBM level 2 is claimed.
> 
> Add the feature and testing for it under arm_smmu_sva_supported().
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c                  | 7 +++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
>  4 files changed, 13 insertions(+), 4 deletions(-)

This patch looks good, for what it does. However for bisection safety
it should be earlier, before the patches that change the page table
algorithms to be unsafe for the SMMU.

However, I've heard people talking about shipping chips that have CPUs
with BBML2 but SMMUs without.

On such a system it seems like your series would break previously
working SVA support because this patch will end up disabling it?

Though I see your MIDR_REV list is limited, so perhaps that worry
doesn't effect any real chips made with those families? I am trying to
check some NVIDIA products against this list..

Jason

