Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13988C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c90ICJ1SsNTN/OyE3dlj/IjSCNPOfdtn3uzNjjnp3fc=; b=ylfhIs5+OxpmdnLuTaiUylPVr4
	yAAbeQ5qp49mV1AUZcJVjFk0XhHzJWIzvB2gvMjKxkZl5265LXozI/z772ReeuchhEzzJazxTwUMp
	sqsp68rCv8tSdYfK1uRhOYaX9i8GqhWOoQrbLTuukyQQ5eK/c4fI1s6xaFEhbqo1zCKRXzl+ItTSz
	oyKZX1KbY/j1XiKSVofC+uI5UksHaJYmAFDPEKA0uX6nNHtXjW3VCuDG3O5PcAxtoi8/NzgQurioS
	ezVG9ncAWqhI7hgTxpjAOvnMCgGqQWH7yLaNQG/iU1OGl378i8+xuz8ENAk1Hbp+uaXCOiZ8XvowQ
	E0R3zDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thv6B-00000004rLY-2eis;
	Tue, 11 Feb 2025 18:35:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thux1-00000004pwy-31ps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:25:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 684A513D5;
	Tue, 11 Feb 2025 10:26:00 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23A793F58B;
	Tue, 11 Feb 2025 10:25:36 -0800 (PST)
Message-ID: <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com>
Date: Tue, 11 Feb 2025 18:25:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu/dart: Set DMA domain for locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_102539_806950_D790F1C3 
X-CRM114-Status: GOOD (  12.94  )
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

On 2025-02-10 7:39 pm, Alyssa Rosenzweig wrote:
> This is required.

Now that we can, I'd really rather do this properly and not offer an 
identity domain in the first place when it's not available.

Thanks,
Robin.

> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
>   drivers/iommu/apple-dart.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 9c74a95eb7e819e94ab2fb47ed0d411a1eba8bf7..9c6f780dc7220096ed6bba692fa1a4bd859b0d61 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -941,6 +941,8 @@ static int apple_dart_def_domain_type(struct device *dev)
>   		return IOMMU_DOMAIN_IDENTITY;
>   	if (!cfg->stream_maps[0].dart->supports_bypass)
>   		return IOMMU_DOMAIN_DMA;
> +	if (cfg->stream_maps[0].dart->locked)
> +		return IOMMU_DOMAIN_DMA;
>   
>   	return 0;
>   }
> 


