Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB9AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=; b=F3ldoTaK9XMT5244cvoNTIEPvj
	i2po88vgQPge/SkkD8wgjh1wyz8y3nCkIlNAD2Vws9zcjzAoWMn02Z6usScv28iItwwpGuQprYERA
	wELlGlTIYJN9q9gf5nHOQYo7CfO/SiOiNHjubeS6Df2e4UouYIAyQeBVCisgGahpCNZK0xTpConZi
	clG2G8djLFpuDNOseOx2lUy97KSWQCxlwf4B4oRg+1TP/DwvU0eRstOHLu6uq6SBrf9sT9KzFnlqb
	TFdbJlWFi+ACDczaUOXtzXO3ODjteg91KYiwkfjPVfHysosTsLMXvtkoOtSCI0CWh3JrSh3v6Zjzs
	iyAMGb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ovh-00000008k54-1hi4;
	Wed, 23 Sep 2026 15:30:41 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ove-00000008k4B-13eg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:30:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso613379a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790177437; x=1790782237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=bgYcIVFVNN0tzbZHaVjFFmAWaf+30myK170vRBpO1WIHh8QyYJy2SpB+JhHeqmnxjP
         71ws9Y3kGghSOTia4G+e28GnMK41BP3QQZgfiRcC4Qo0HoZsTGxiDVtu2I8FqSeFXZ9T
         yrbUHMDzhAx4vSiOgOC7o4+f/RJpnVTMZYVB7qWRebmgNUVkCOgovZTe/z2madVX4tpv
         a/X1pIIgqjqYYZUUz+Rj45ATuuQL5BGJ3lpPWJJ3cNuHygJ97oubkBrLCQLjaKKQSUeK
         gjGeqq0gXdBuwf7sCTjB/6DdOncVd4EjXnhf2FeiGoLvpYu28euoOpY8k8Afyft26OmQ
         yeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177437; x=1790782237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=Qhvfh9Si15imJx7KLIg/0aTCctiM+WUIYYM68lxKsGGqAxie2fveQjvMYN+hGJl9Z3
         cKfz/qZrXWNMdt7u2hCL9Zclc8/QgkVQHB6E7TIGzRCPJd4yyo9dHuRlfW4cHtkGTzwW
         O2pM+guJNh1ZYWYv4ASXo7qawt/gmUUpuZXyZB9XvN0jO4yZWKrSl7LLZkc1rQr6s/GY
         l1eMsCTmNpATl78l5ewPCQkuSIqwla4u0a8TDMZjAkb7wDhUmzOQSnEjhGKbaVpFRAl9
         hncunUoOKXod8Pd33s6Dp62xuXryDY0ueeO2xKu5k7RN/LBPSOrMrIvcmWi6IiQUP/hC
         KEKw==
X-Forwarded-Encrypted: i=1; AKwUvBwOF3wZrNnF9BUnRYNr35lstfPwuc97v7SaTUrD9JZqHteJ+sAHtfsB8JsTRZx0Kd2fruu5utcNtKLQxYZV0l2N@lists.infradead.org
X-Gm-Message-State: AFuF++lVOzRsAI39RToumnlnKuCWsTQIf9B9al3h2dSVS/pZj/GWKxTj
	dacJLLgmWleqEqz4JV61zpfbj8t/ubBwpmh7D3Ew4bJXJHjWT3UOhuui0H3bwzGocwQ=
X-Gm-Gg: AYBFou144rsbNlUgNNEUTr20qcO7UVZ7GYh8GmpoFjpXwI8Qldk7crOv+2zfXOhyHul
	wIB9Dh2fmU3JPZJSQUyvlnrRfuU4MfhCPS4tsRx2u+Nz3eVUk/RpCcwPeiaAjdIfuH/aJMr7O/m
	6mQ33BY8DMDHpJ/0cloFQ8URvy7LP/x+YT+Do0nFA+48cavIbm0W75OjEuF14bPkAbY3thTMtoN
	S8wQ+ib9kvWpAggies/RnY9MgBrAHVhsNQEnZ6/gXe2RG+8kdC+JRzQiklitsJNMYBeCxAEkNSI
	ukd1XPTBv68P97fBhpDvm/gyjEoysZNFshdguQgNSrr1OwILz1UabYkbqalFUrcLjP3Fnjcb6Al
	Q+ImH1XUHAQlrtzTOkDEUcUN8UWuw3YIWStcLlMl8QH4bX3Rur0ESj7txqFHB9bj8JMGMltXcNM
	9OZ2MIBo0+0/BM426MDKKUqhJr/ySwpVfzLiX6LjCgIF0rZjlqy0Q68qeB+pvf6KNOg2fSqTQ=
X-Received: by 2002:a17:90b:4d0e:b0:39e:6a7e:ee19 with SMTP id 98e67ed59e1d1-3a07e6540e2mr2620920a91.37.1790177436748;
        Wed, 23 Sep 2026 08:30:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf1cf3sm5652074a91.9.2026.09.23.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:30:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:30:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Message-ID: <arPwmV6I6e2hCqo6@p14s>
References: <20260921232520.3127457-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083038_331623_ED50AB34 
X-CRM114-Status: GOOD (  16.10  )
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

On Mon, Sep 21, 2026 at 06:25:19PM -0500, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..2f0a28c7a24c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -28,11 +28,11 @@ properties:
>      description:
>        Should contain the address ranges for memory regions SRAM, CFG, and,
>        on some platforms, L1TCM.
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -171,6 +171,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
> @@ -185,6 +186,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3
>          reg-names:
>            items:
> @@ -195,17 +197,31 @@ allOf:
>        properties:
>          compatible:
>            enum:
> -            - mediatek,mt8188-scp-dual
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
>              - const: cfg
>              - const: l1tcm
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 

