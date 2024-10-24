Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC07CE8E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deK4DomWPJydxnpax2btzYZb2iY+zRxceQoLFulpLGg=; b=eNwflsyiWGOpZHY5X3wKBAbKVV
	mTzGMVVUgB0Hadn22L3B7wjC2UvyOBw6e9XA3BfvNghtbzX0Mf3cENzQOkrAKTa3ja0RvMc8EAXBv
	3CgMUf22ckUvDOyzoaJq4z9pzKv3Ee1qHks3H0Dm0/dVm1zi0iutgw+nUAwQCjzJerHA36ZZxFmj+
	3O0okhs5RB9JzP1l8z/HEt5GVoXFHMKj/0+6zZEoqA2+F2Eyu6O23gBdqpgTHQWUriDcMFDdGsdAq
	GPjZCZk3GZCeCRk8HnW/eS2OekPGQjGhy+ef7THo7uYmrKktuzx3zS4mlH6gxGwvrv5ig03pbFzpR
	wudJyoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3z4D-00000000nKA-2vVf;
	Thu, 24 Oct 2024 14:44:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yu6-00000000l0l-1wmE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:33:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cdb889222so8313415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729780413; x=1730385213; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deK4DomWPJydxnpax2btzYZb2iY+zRxceQoLFulpLGg=;
        b=osT6haKVdhBWEoE0Ot65HLJGgg7UHRinQXtKvtd75rF0Pi3vu5RwAC3QLOE8iIwgJV
         v2mLDuSfcZbKeoFMg7fin7Z6zRqmegqUJdeOzsdWNohe9nD8FtrG2gRAVm6rqiEHBd+m
         L/s46W1WBM26ZRVYd7eHUQkfJ5INB6L98WWJzhh7aRCzgFtq6J+RYe3VeEvKlEepJ1TN
         1osne/TYdbiNuQ0p90UHEanrvgFcwFIcnOFV8Bpeq5/Fusdm/Ql6azcSyenJlOfWY3VQ
         5GzT5j4lZ2QWYGeqExA0yKL6fHIOzaC2tEPkX30E8Mq4SaBPddCgMvoK8+OeCwMG8W7R
         vRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729780413; x=1730385213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deK4DomWPJydxnpax2btzYZb2iY+zRxceQoLFulpLGg=;
        b=G2IbLg0Y169pTtFot4+kn4nct6ZXrB+t6MiejtyCZ+DvM5NLNEQH0H+m9IMOjym0lW
         ZMig3v8mzrPwxFp4wph8DuAwqn6sSY6PXUCmJBOus30zavrJAqSrfj9+q1Ifk0a8iDXG
         ZGyYCf75MV2CB5R6Crb1CEqAy2Pho7f/OKiocRbNpxmPGWGUTU7niDUkqFZhcaM6T4m5
         qPImjyo4IcCxPdemEbzTcPsU6yij0HW6o3mC8WcuoB8gMyyGCGSizV3NuNcTVOfvfAsp
         ys/sWHGWYx+O3ltood2dPPvrtfAVk/a8NBIFQ/qAZVtZQaj/UcP4Tje7H/QppfemqK+H
         0nJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdi0xgjQZG+BxYk/A6YjJGY+oD/IVZkG1QDeSOW+4sJFzQxqb2s9EFAuxKfNxINBH9Dg2PxwhP1G5yJEk6xwNn@lists.infradead.org
X-Gm-Message-State: AOJu0YyApb1y/8aSCGmS0ZJAFNPhJTm2lvMO7wYY8phk66XQYJLvkGX7
	U+zH3St0NCB3ycmLCVCMrafAMwoc7gi+dH2sw/FlR19terwCS18iZz9TbDKE5bE=
X-Google-Smtp-Source: AGHT+IF2QHwGQNfnbzeB+vGVeNFxEkbVpRfo0zDrRN0S9cesanZ47dqvPBfNb4vh5OOx0sxq3LEACg==
X-Received: by 2002:a17:903:234c:b0:20c:d2d9:765c with SMTP id d9443c01a7336-20fa9e09acbmr77487705ad.15.1729780413199;
        Thu, 24 Oct 2024 07:33:33 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7c96:e131:bee8:c8a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd5ddsm73207425ad.141.2024.10.24.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:33:32 -0700 (PDT)
Date: Thu, 24 Oct 2024 08:33:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <ZxpauMKLcSz73y3B@p14s>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_073334_551931_889EDFBE 
X-CRM114-Status: GOOD (  18.54  )
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

Good day,

On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add new compatible for imx95's CM7 with SOF.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..ab0d8e017965 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,15 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7-sof

Why is this added in the remoteproc bindings when the driver is
sound/soc/sof/imx/imx95.c?

> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dram
> +      - const: mailbox
>  
>    clocks:
>      maxItems: 1
> @@ -38,10 +47,8 @@ properties:
>        Phandle to syscon block which provide access to System Reset Controller
>  
>    mbox-names:
> -    items:
> -      - const: tx
> -      - const: rx
> -      - const: rxdb
> +    minItems: 1
> +    maxItems: 4
>  
>    mboxes:
>      description:
> @@ -49,7 +56,7 @@ properties:
>        List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
>        (see mailbox/fsl,mu.yaml)
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4
>  
>    memory-region:
>      description:
> @@ -84,6 +91,10 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  port:
> +    $ref: /schemas/sound/audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>  
> @@ -114,6 +125,43 @@ allOf:
>        properties:
>          power-domains: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7-sof
> +    then:
> +      properties:
> +        mboxes:
> +          minItems: 4
> +        mbox-names:
> +          items:
> +            - const: txdb0
> +            - const: txdb1
> +            - const: rxdb0
> +            - const: rxdb1
> +        memory-region:
> +          maxItems: 1
> +      required:
> +        - reg
> +        - reg-names
> +        - mboxes
> +        - mbox-names
> +        - memory-region
> +        - port
> +    else:
> +      properties:
> +        reg: false
> +        reg-names: false
> +        mboxes:
> +          maxItems: 3
> +        mbox-names:
> +          items:
> +            - const: tx
> +            - const: rx
> +            - const: rxdb
> +        port: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 

