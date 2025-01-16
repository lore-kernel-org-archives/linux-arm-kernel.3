Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFADC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cuWckv2mg3iIR5MCaEBEb/4QCrqfrfbJmqZ9RuoMko=; b=M8TIxj6e9+6bn7zeXWwkZV5s2F
	xvs7mcWbKwrFiEW9wOgzL6HmY2NcZjgAwarQc7xoUnhHotXxzTzv9DqdL2jlZGrw3K3HFBa7lNClY
	PjVoMDe7p67/W7H3ck0+wWa/4n+PWL6zAGab7xfetKJ+fgyk23iqv+EJTL9E/yvjYt2/baGAYU46b
	nbEOoqo8D6jir1ep0g5BfAc9owVMlcuk02xT3p27f1/i18cPb9UcDN5xhFrLdxtf0rAITAKQ49QJg
	v4205peRw4+nngJFpWhe0/UVBaa76PwEhp0NaRg/UZpCvNGgVbRF5alHlqVQ+nO93wgBY0Q9O5Vgq
	4UzSgiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGDG-0000000DhID-06Ex;
	Thu, 16 Jan 2025 03:06:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGBz-0000000Dh3M-39nr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 03:05:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21625b4f978so61625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 19:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736996710; x=1737601510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cuWckv2mg3iIR5MCaEBEb/4QCrqfrfbJmqZ9RuoMko=;
        b=Gb485FGif74mBzCnrSSbdC6jKxKLVzjmXc+4NF6YRSKwABhkPjiyqOYBjxaiy/WE4g
         YmG/NQy2/9GEZQdIB0epj1nhNPmodg9ud3nHcR6WSJhDXR7FsA2QORJJbvGpb9DKaUba
         c/kF8JBI26wSdUzj30jnUJbzVVHjRXEftAO/gxkIY6NbzTUbO5AnVboEqILtQE9bV2Mb
         YTebA6R30iqubJay0x66IzE93E2h3pZcPCbOJEAdQGr4/a7NlXHxyk/sW3hzrGXVl3Ek
         kWv3EIiIOZLJ5ZTV8MBDxN4qYf1GrEwpBcg+nKP+kN7VUJ1zDOqA5IjQkp2FgBg6KsgU
         VzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736996710; x=1737601510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cuWckv2mg3iIR5MCaEBEb/4QCrqfrfbJmqZ9RuoMko=;
        b=Ajk41CRDUaYwiEqPJHuubFupJCoffQrVF6oWjV6amgQqUIjnVdG3CtWwZgI2GdhZNS
         w8XMGxKt7Xn+eox/HN/EaAClKcSnxRUfZXxTAsYMOle5OhTE37gkfeZUJDqKG8cEKs99
         MqX8YhebBkrVVVlPrZNwF7d7wVW5nf2wH6eq9R5ErdCNbrHLR+GsNqj0ToQ/+z8bx/pH
         IDIO3BOL+py1ZAVU6lSeqJwbVXPZLi9fXP/ldHJwhKl5qJNW4Y5hUbR2zCSONma0Ualp
         J5d9Zd/zvo7uhNgW1T26V6LRSPkiagvag3HcndJjLbtLb4LNHIqUgGQE/Dii8CjaI0fs
         WZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWCkifDOxJabZf/JMYAbB8tRqdgFKwllcQVq7x5aU+ylGxBpaUn7SeXQsxgB80SvbvQht8NC50gOYLqeIVx/qFJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzSe2OfO5VRwtEv5gzWc64J0pHzq/qqY8qDPiryz7ZH9quoIfxT
	ABsHq269a9tSXGL2x7vzIY/xlS57fmKscO6vJNGDAofM1hguvr+nknl8Exru4Q==
X-Gm-Gg: ASbGncsnafx0ISryrUugKAKr9gubm1nSdW3KZvHKiSc+RtYjDNaZxurFr1Y3Mi/XwYo
	m3qIXv38d74fsHx1lKR8mTx5XKYlNuZFLDfstKr/YQThjdjbaoZSKDfRbV8R31+8Wf+wsHfRxh+
	fFPYdu5pPYA59DGJtRabw89iQnUCo4seaaWpMD91KvOTZdXwFsgtK4ObqbTpvaQBhg/JCwm64bv
	cVeqCRu7LB458c8lhLSoZpKJxyqNZwJKDJBv73BzKS/ZavctBc2tjre6nW6LqbGJpLobiyFu4Px
	wQU46wGJDdps
X-Google-Smtp-Source: AGHT+IGgvey12XcQ8iP4n+eaUVK+cmvSLWMH2UIplRse6X8rSW8rrU74w2Bbqndq54XuqjUDHEawSg==
X-Received: by 2002:a17:902:f785:b0:215:69a3:1c94 with SMTP id d9443c01a7336-21c12cfe139mr1268815ad.28.1736996710051;
        Wed, 15 Jan 2025 19:05:10 -0800 (PST)
Received: from google.com (1.243.198.35.bc.googleusercontent.com. [35.198.243.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c151cbfsm2135397a91.6.2025.01.15.19.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:05:09 -0800 (PST)
Date: Thu, 16 Jan 2025 03:05:00 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu: Use str_enable_disable-like helpers
Message-ID: <Z4h3XHrzB53IAvys@google.com>
References: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_190511_792272_5F5A5237 
X-CRM114-Status: GOOD (  18.51  )
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

On Tue, Jan 14, 2025 at 08:26:42PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ++-
>  drivers/iommu/mtk_iommu.c                   | 9 +++++----
>  drivers/iommu/mtk_iommu_v1.c                | 3 ++-
>  drivers/iommu/rockchip-iommu.c              | 3 ++-
>  5 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0e4cbb2c64d7..358072b4e293 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -26,6 +26,7 @@
>  #include <linux/pci.h>
>  #include <linux/pci-ats.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>

JFYI, this include was merged in the arm/smmu/updates branch recently,
hence it shouldn't cause any trouble while merging.

>  #include <kunit/visibility.h>
>  #include <uapi/linux/iommufd.h>
>  
> @@ -4321,7 +4322,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	 */
>  	if (!!(reg & IDR0_COHACC) != coherent)
>  		dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
> -			 coherent ? "true" : "false");
> +			 str_true_false(coherent));
>  
>  	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>  	case IDR0_STALL_MODEL_FORCE:
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 79afc92e1d8b..de205a34ffc6 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -34,6 +34,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/ratelimit.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  
>  #include <linux/fsl/mc.h>
>  
> @@ -2106,7 +2107,7 @@ static void arm_smmu_rmr_install_bypass_smr(struct arm_smmu_device *smmu)
>  	}
>  
>  	dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
> -		   cnt == 1 ? "" : "s");
> +		   str_plural(cnt));
>  	iort_put_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
>  }
>  

For the arm-smmu part.
Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

