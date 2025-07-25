Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64913C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3zdFfPleR9/NME5SnuvxwSdlOs1YNUyMXK+UnEoUgM=; b=NIukYlf1WEY81ctiNjmOAsRo6L
	WE1K6kwjEuTIh8G27AKz+lBPKl86+6Mm1nZ3W7X299KoO99NGBQ8K7ei34lMb96xEcG24TskqEwk3
	WNv6WhaIGGx4NaMx+bB3vwzaRYJo61sBADTrj8djmDhRNuKCpSmwRhvf91q9O7oQiS2rTXrRui2oD
	jok2q0Hd5h9jCOBW3iVwtHcxnoG7d4SaQ1GGvxjaImzcyIP0MFNpebtrKNVKcp1inNufafZ4iHmlp
	5xt1WAaqQ3YZeWYAxxONorDrNrqwgFrlV6KezL385+SQw6IXmPB5af1oCGMm+/wTL7RU5EZjPzj+l
	uO/Aga2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOUg-0000000Aast-0qnY;
	Fri, 25 Jul 2025 19:54:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOQE-0000000AaTs-3QJC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 19:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0E36A566FB;
	Fri, 25 Jul 2025 19:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F26AC4CEE7;
	Fri, 25 Jul 2025 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753472977;
	bh=iiaOefTh/5OENt0FAUBnlV/H3u7UFzargnPQcIltk/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVbjN1qYQpdx3muILzzWjaJ8epF/zocVS+xHte3uc11rXp0UKOfQutx6pCwd6k2jI
	 /ceFETJ6jinjHpzAxRShzd4C0pxj9cz0+JdBmf2iF40aVE00Y6uZZeOOxnXwE6qgEs
	 ShCPUz35FvGv07QPUXcPPFdZrjMujnYb+oUK392w90+TIDy9S+Pw5IeDxDV1lo9Loc
	 5FU/ZkWx7NaCjHsiDPK+Qy65LlLqzZPVf6QMNq4yh/+CV7d8F+AG5FTIdfmybeCxFd
	 Q3A1VUbas9Jam1TmzFl1qbAH6vmdMDYSlNZJY8L/7JAgPyDDDPkp5U7/iSmNTn/XEt
	 zMDmFpZeJ3WIA==
Date: Fri, 25 Jul 2025 14:49:36 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: display: st: add new compatible to
 LTDC device
Message-ID: <20250725194936.GA1731993-robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_124938_986817_3272187D 
X-CRM114-Status: GOOD (  18.86  )
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

On Fri, Jul 25, 2025 at 12:03:53PM +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 37 +++++++++++++++++++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index d6ea4d62a2cfae26353c9f20a326a4329fed3a2f..546f57cb7a402b82e868aa05f874c65b8da19444 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -12,7 +12,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32-ltdc
> +    enum:
> +      - st,stm32-ltdc
> +      - st,stm32mp25-ltdc
>  
>    reg:
>      maxItems: 1
> @@ -24,11 +26,12 @@ properties:
>      minItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: lcd
> +    minItems: 1
> +    maxItems: 4
>  
>    resets:
>      maxItems: 1
> @@ -51,6 +54,32 @@ required:
>    - resets
>    - port
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - st,stm32-ltdc
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +    clock-names:
> +      maxItems: 1
> +      items:
> +        - const: lcd
> +else:
> +  properties:
> +    clocks:
> +      maxItems: 4
> +    clock-names:
> +      maxItems: 4
> +      items:
> +      - const: bus
> +      - const: lcd

Why can't 'lcd' be 1st so you aren't changing positions? Keep the items 
list at the top level and just use minItems/maxItems in the if/then 
schemas.

> +      - const: ref
> +      - const: lvds
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.25.1
> 

