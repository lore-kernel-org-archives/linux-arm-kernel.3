Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68259FF512E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeLYwHcVD9B0EutpT6V2+2V3AhDZX5KiFnwCP2iOghs=; b=CpB5Dpg1bwfP3XrQfJz0nshBNR
	qlueP5hlwYFQitL7sL7qLw25wbFkPT0YW4CziJGeT7b9po7yllvt5liKK812OJOQSj6mWF/HsKW78
	BYA8wdWjkOaS1jCG/+6wrIMYDL4l5zHVr6uySfNjs9lZ0Yhdb2RhjGLfQlZpiJgwEIW+KrZtrHZxr
	h9AoFH17P5U+vZoTdAAjNXm0boP/e2wdiPpWsCWpzaLRlLks3kz2D5Ab1sXoaSAsTfLrSD6JCXfMa
	AUJ2voAgz1wwNwuCThmAc/uxR0vrT/Et2hZmpATzGKXs1LQ0MG/MmzeUDHiMeiS04T16yjrQidgvX
	bcdSeLFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA6E-00000006rGj-0SgT;
	Tue, 07 Apr 2026 17:20:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA6C-00000006rGQ-3fxJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 17:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aeLYwHcVD9B0EutpT6V2+2V3AhDZX5KiFnwCP2iOghs=; b=R/WkMZfuSNe/JXzHelzd0D/Dds
	ir1ojmszqH20YOydnkltqBo7cEOq4sFPf73aVcgANeUdWTaHDamLQbwG+FSUC0AiPUMlXjWDVTEK+
	FkmR76qfmLnapwUycohH0yIyMQxKNGZFmJsBT5CBAStbkv5eBynDuAcZnA6kmNJQUympSq9u6gQ/1
	V8KOIsMu2+hl9sDI9jX4RBobVaHr3WhLBsNZHvRpUvcuzfB6aHRtoIroPT8WhKK/0wA2ruSlPkN2V
	7GIKZNmH/6VGW9CkXgoW5R5LCY2vl2kPvWHeybGnlBll5HhljeWwkrUD9s1eCk5VQvhO3UtmWI1/m
	GqNWMBtA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA68-00000008llw-2j2e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A146E439C9;
	Tue,  7 Apr 2026 17:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B560C116C6;
	Tue,  7 Apr 2026 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775582416;
	bh=BcFJ2putys3P6/zGB23SL08fXAgv8v1CEym5nRQpouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuGsitZGzFfVbHuQLwYEGw4RMCkz7e9rMLWeqHBYYouyYEZX5YSi+EfHu5jpkUVgL
	 kijgJNJl3WUt34t11eXze1dC3LZ+wMlk7HlKz7K3+epoHvubJjEwUDQv9L1jEGkedP
	 dU5qhYrOe7g/2p9Jdm+2ZSs8XZ2a1Wi+MmxbHJxCxUmdp9eU2i5Tv+n5qh9JN/iCRZ
	 ygIRT3Tn0MGWjhTK0wpVqf2DqNjCq+wdD/GX6nUZPZbiwG8kvkOlps5HriGJ/J4+Sd
	 GqWpwV9Y4XVeswwq9QwfEZzWjA8czQW4S3guo9tFQG8AFzi1APhKp704ClmK6pAIcP
	 KfmLfSUKakTYQ==
Date: Tue, 7 Apr 2026 12:20:14 -0500
From: Rob Herring <robh@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: dma: arm-dma350: document combined
 and per-channel IRQ topologies
Message-ID: <20260407172014.GA3090142-robh@kernel.org>
References: <20260324120113.3681830-1-jun.guo@cixtech.com>
 <20260324120113.3681830-2-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324120113.3681830-2-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_182020_953222_8FFF86FF 
X-CRM114-Status: GOOD (  13.48  )
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

On Tue, Mar 24, 2026 at 08:01:11PM +0800, Jun Guo wrote:
> Document the interrupt topologies supported by DMA-350 integration:
> - one combined interrupt for all channels, or
> - one interrupt per channel (up to 8 channels).
> 
> Assisted-by: Cursor:GPT-5.3-Codex
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..bec9dc32541b 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -22,15 +22,22 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    items:
> -      - description: Channel 0 interrupt
> -      - description: Channel 1 interrupt
> -      - description: Channel 2 interrupt
> -      - description: Channel 3 interrupt
> -      - description: Channel 4 interrupt
> -      - description: Channel 5 interrupt
> -      - description: Channel 6 interrupt
> -      - description: Channel 7 interrupt
> +    maxItems: 8

Don't need maxItems

> +    description:
> +      Either one interrupt per channel (8 interrupts), or one
> +      combined interrupt for all channels.
> +    oneOf:
> +      - items:
> +          - description: Channel 0 interrupt
> +          - description: Channel 1 interrupt
> +          - description: Channel 2 interrupt
> +          - description: Channel 3 interrupt
> +          - description: Channel 4 interrupt
> +          - description: Channel 5 interrupt
> +          - description: Channel 6 interrupt
> +          - description: Channel 7 interrupt
> +      - items:
> +          - description: Combined interrupt shared by all channels
>  
>    "#dma-cells":
>      const: 1
> -- 
> 2.34.1
> 

