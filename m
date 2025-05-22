Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C295DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBDwNxzfrktfgwrv8cltdXa8ilCdiyBQqCJ1D4oRvUU=; b=oKV79OIT/zjG54lbxMCjB34hq7
	DpN5RJrtkv13SUlUHPE/HBNQpKm8MYvXsoOaGFMUrhZ6eor5yQ5GDhTSAEpuYuVhCgYBG256DK3OL
	IYB8yzdKnF3q+RziDDIdIqPnJBDxsta5ZYLFFrPCw2+5CEmHAMn1UKuQtzAdrWU80bYhLUmgpNk61
	KUsHgKXq4FgvuovsDkKfjgM9TySDAq/i194duiz2oZ1+jlJ4pAx6beA7eXsg9UoQVjDv+4oejQeJL
	acDdFw/aS2SetEm3CBoF3Ns2VxBeC8XCQ1qy8QwXqmxbOj3iTBSXBLL1OrGapwcuLtcbG3ee7OwIO
	RtMmx+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1FM-00000000H8d-3KeR;
	Thu, 22 May 2025 08:25:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0yC-00000000EbC-17dd;
	Thu, 22 May 2025 08:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 699215C5527;
	Thu, 22 May 2025 08:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF59EC4CEE4;
	Thu, 22 May 2025 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901283;
	bh=AsgpU/OXH0n6Yb0Oy9gxgm5VK9clyMyMr5CAUWaU9So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npu2yHi7RF+x3QqPt86UJMSYYCX4TVIOqXQZrJCPm0uuRfr/u3IgWtctAkR7CYm5I
	 NvZmkWkMM0QX5lZchXerYvMg7LIh6xCfi8jr43v0dq4uBdDJkLIOtsxon0Zjz5ARJo
	 OGIhhRWlqEF2bkpOCwN6ZpN3DJJQyh33NbrZCRmrF7qsoQ6c39dHeqMc5sBT98t4B0
	 DDfd7DqR7cuVtRaCWrDNC7I17dkVBf0zUsiI6xE0zesRjD8qjHPoCzvUDVg3jd6ewR
	 /Z4kH6avZrHUWv27bQ2dlz1itw0POwicnltY+WaQzJpa+Zs1Ybskh3dMOyJkL0uabM
	 37XjpVdbKQfvA==
Date: Thu, 22 May 2025 10:08:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 2/3] dt-bindings: iommu: mediatek: Support 5 IRQs on
 MT8195 infra IOMMU
Message-ID: <20250522-foamy-cricket-of-defiance-edc2cd@kuoka>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
 <20250514-mt8395-dtb-errors-v2-2-d67b9077c59a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514-mt8395-dtb-errors-v2-2-d67b9077c59a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_010804_342231_1F49E804 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 14, 2025 at 10:19:57AM GMT, Julien Massot wrote:
> @@ -97,7 +97,8 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 5
>  
>    clocks:
>      items:
> @@ -201,6 +202,21 @@ allOf:
>        required:
>          - mediatek,infracfg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-iommu-infra
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 5

Instead list the items here and in else:, or in top-level if first
interrupt is the same.

> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1

Best regards,
Krzysztof


