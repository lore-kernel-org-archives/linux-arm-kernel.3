Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C191CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g3UdL+KeDYWTxEELamnAUk8WkFzGDt3D4ifxYpzM7Y=; b=uPn7D4sNYoIGiegdDhf7nGKr5N
	fEkSlheTv2LLXsznt8V0FGm62Gg3p621sXbzr+a85fqyFMIJR53u/eBNFXF7sqIyVRc+zJJoIkVQB
	YXtFsv2oGQcUqeIn5g4fOXcY89OEq71LUAfRqk1vN8VPSn9trusWDTnI/7QBb1LEV6bIMPZsQPYOS
	HpK+P+Y82p5WSYnHZUIkEd6cVuXba+mwAKAyf3gh+Vrt+fHNUrkvfVP7ZFNuBwIs7aNhXwb/S72Qd
	kmcCBJrXFcoEPtSWVBPeP3X1UKf7Pjd4OjYDu+uMWJm/PdrQU3nLB+LewdNtYEJrWzuk4C3xG5gUI
	w5rdGqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzC9-00000005p9l-3gYS;
	Fri, 29 Aug 2025 13:31:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwaq-00000005N3C-3zoC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:44:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09BEB1758;
	Fri, 29 Aug 2025 03:44:20 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0BB53F694;
	Fri, 29 Aug 2025 03:44:25 -0700 (PDT)
Message-ID: <097a3e2e-202e-4f4c-b981-69156aeca051@arm.com>
Date: Fri, 29 Aug 2025 11:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] dmaengine: dma350: Fix CH_CTRL_USESRCTRIGIN
 definition
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-2-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-2-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_034429_037560_DAAB8282 
X-CRM114-Status: GOOD (  11.39  )
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

On 2025-08-23 4:39 pm, Jisheng Zhang wrote:
> Per the arm-dma350 TRM, The CH_CTRL_USESRCTRIGIN is BIT(25).

Oops!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/dma/arm-dma350.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 9efe2ca7d5ec..bf3962f00650 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -58,7 +58,7 @@
>   
>   #define CH_CTRL			0x0c
>   #define CH_CTRL_USEDESTRIGIN	BIT(26)
> -#define CH_CTRL_USESRCTRIGIN	BIT(26)
> +#define CH_CTRL_USESRCTRIGIN	BIT(25)
>   #define CH_CTRL_DONETYPE	GENMASK(23, 21)
>   #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
>   #define CH_CTRL_XTYPE		GENMASK(11, 9)


