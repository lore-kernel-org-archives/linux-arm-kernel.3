Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633F8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GChTAo5rbB/wmEJGoWsmu+CPOZXtTCJra4+lLJEfN0=; b=Ps/ZVSqYi+5l3iVAqzIMJswWaz
	y8B0l1D1AJ7Lmm33o/BmT2UuX8skSt5TcZgzVm25ADbvffiiaWmulh8C9cmW6M0kpcW8BI0yD/7Ou
	ZqlaIlLpuiSTwkKq1KzyiYy8CyxGGXDM61ba9+grCnjfrVkRceqZtYcP5lkjkyo81LFwOcjFdYn8c
	UzwHohioh2VfPdAQnXEjcc4ft4+2EXAvq14sUFIAMYJne5ctlrG67gz3QDWTV7GOIp7jqE5d/bCy4
	hq9Ggdx75L1nnNhPzSHq+y8dogjaNYe7zXPu9yXqxYcX2EcudtMpCQ7/jUCdiGGmFC+33DldMiyQc
	tKN1rOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVTZ-0000000GdhS-07fO;
	Thu, 14 Aug 2025 10:46:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTxw-0000000GMFo-1D5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78E72A5213D;
	Thu, 14 Aug 2025 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887F0C4CEEF;
	Thu, 14 Aug 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755162583;
	bh=4haXZhUQhwWTQfAUzZvN0UDYTjKDPWIQ5LTd46KE9Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLuUBGtdppkgsKgis3nVC/Avqik7RnCYzK9KO7reriPcUJPTO57YUPt85/HgWATYX
	 v9Xpj+vF0aZsc18rDuptx7cW4VFNjpbBXuNKNF/BdANIEzLtY2wqZNZ7MAAWQMDBK/
	 IWS+cH7eNxDp8JNHuyoSSiJQXAgvWF3CDzn0gZFUCptj/TB3sQ5f+WPhrzRnCOuIbk
	 JwiFm7oLFMdZfFut8BL+1nbFQ3pzVMsXxnVW5fgtoDEPzWfSIFLmm187pl+w1OmZHW
	 26Enk7S0sOkxJuXinXiwvqCjBvF6QqFEZ+mGMqIuZQ+iY/PBBNMU+lgeMhR2MoVCxl
	 MQSCILYYJFxRQ==
Date: Thu, 14 Aug 2025 11:09:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
Message-ID: <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_020944_390161_485C7025 
X-CRM114-Status: GOOD (  15.74  )
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

On Tue, Aug 12, 2025 at 03:49:00PM +0200, Raphael Gallais-Pou wrote:
> Update the compatible to accept both "st,stm32mp255-lvds" and
> st,stm32mp25-lvds" respectively.  Default will fall back to
> "st,stm32mp25-lvds".
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> index 6736f93256b5cebb558cda5250369ec4b1b3033c..b777c55626e4b322d77ef411ad9e4a3afb6c9131 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> @@ -31,7 +31,13 @@ description: |
>  
>  properties:
>    compatible:
> -    const: st,stm32mp25-lvds
> +    oneOf:
> +      - items:
> +          - enum:
> +              - st,stm32mp255-lvds
> +          - const: st,stm32mp25-lvds
> +      - items:

Drop. This should be just enum or const, no need for items.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


