Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F5CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=; b=FU8z7DUcFnkGGEEO8+DyLZGaCl
	JyAniK/vkSZ4KLI/gtB4PXPsSPDv+BiYI+8PY30jLS7yXLcjg87vQLMfahN9JlOTBSzDh8hM+Iclv
	RS/NN538lQiG0B4EytywRrwpFLG69u4iKUnPiofghTxgi+PeG6isdV2yaqrZhxeixA7y61hZpqoU2
	oeEZvW9cws+ItYk6B77dqm5LvsZ9zH4v4WP3w04Z8IfFqpJ/LzUEGpefNeMmKDNqAyypkOhNVa2L7
	KFdl4KRkNBLRIU2ywvgTM3mByjaL9u/1dReSMn+egwKY9+DwNN6J/1FMgwI6W9Lf4rOxlcnIXNmzr
	xiWBnLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgktw-0000000Cq81-3kMV;
	Mon, 06 Jul 2026 15:06:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkts-0000000Cq6v-3eRH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:06:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so21848355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783350383; x=1783955183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=E1qym9q0DzBVNmjDLZotsr+mkyrhofsxzoq5vpOezBSx27fAdSIFJ4bocaExXSgTOs
         EV8mDd8VbNDEwcix1D8TTCv/fziAjTdMs3nm88sRrwtgipkUWdIsSL/I6wOIJHc/oCTg
         8x4ts99cNH6QnyG1odLtIbdbFDIezbMMeaPvXuhVxwE5OJy878EwEj0PfEizQBTNNCoN
         fRIuCP3702pz40ivtwn0bNc/ytTXTy7euXmG+2rORvYDvyhZOBpyJfl9mZbLcTCrmJtk
         UwPCABnOv/sXXySzEY/cZrfyDwSD61a+i5u2MJM3vuwv3lJ3JO85BcfEI1JHLxDV+q7F
         adfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350383; x=1783955183;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=GLHyEIQs+BA2/ncdHZ+Xo1pmGzAqTCTOXhiRnB+WD0eus/koNqeW47146UO9aQI22j
         0NPmMDO5GyNG2iWFbpLT3x5ouTWCPmLcglR/4hh9J0hS1nRmze2pJDVVltO8I7D5guub
         bZuKs8gZg94KlzMngaVHxsQvbKFBN2CzE6vGA4ud0qHEd9HKEeY9BZRyOQhgV9iyjCEt
         u2r3+o/maxnPPZveOpWOEdaDtfpUp6ZPYQv061iBjslrhS0ZY6NyWgyiL+8+sy6EVE/9
         8Oa1ETKElopkYgvltkvjjKJ6YnZqEXWHKB8/fVLG9hIAvE3G52wh8xEF6V6F8ltlV/K9
         DNVA==
X-Forwarded-Encrypted: i=1; AHgh+RqybAbJJbZfVOYF7PbkMNU3fFSAa9QVzhgWXU/W1DyxeKStu745qx+YbwBPWCx0PWvIjtlv86JQ2xkCj5fW7l0d@lists.infradead.org
X-Gm-Message-State: AOJu0YyAmzw2WLENA1bTSdgDQyjcBTbeg4VWjLO4FapI6BEKasMlkPMF
	2F705ag9pKqhrGAeIcJHFDemtICef/SCLY3OX8gXacceCCghdbGrIpmcU+DpqhZ5uLQ=
X-Gm-Gg: AfdE7clbd+DguIzWD5YSy/zb0i3I6Kpg3Vjn92EbjJwA995ixkK3Wl39NrnGoDy9Q8/
	UWS/G7vKMdBC9cKHewnjB02EKsO+xN8Ddj8T1X/Mrr5oFDh6A9HnkTD/biuwDGKtoijADABAGxO
	BreVr7A7kOXhsgIHUmJH6wAvmBTRNrOcMVaLvtxzxNDP3w2+bV7oeotqcDtSNIZFKPsZ7lmRH1L
	MQmNrqoo+e6hMPCd6ycLfnHwmGjtRiuko2aRsnj4RnQPyVNiXR4nYLeEaXYZ/yXsYZ4O450f12C
	V9ADEUvhRRdQatovavcks7DKwqD5FtpSAsIfVxAaxVsE+Fz2EENvpI+NB2dqHmRlMR5xf0LX7Ef
	VRk9s/udItpttcwDTZ8DZtCxYciTomJzvzfAMmSwE9jx4FKHzfg/uSGpy0cHxPTq411pZ4S6qgn
	d0UAhewa7nWJKuh1K9+Bcq4nrdONsxkjY5LO9cJ0TbHAUom7OsIPBdVwaczEps
X-Received: by 2002:a05:600c:6990:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-493df055999mr10670715e9.8.1783350382884;
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm291903115e9.1.2026.07.06.08.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Message-ID: <a275b0b4-30c6-4a9e-bcd1-56de269423de@suse.com>
Date: Mon, 6 Jul 2026 17:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: power: mediatek: Add support for MT8196
 direct HFRP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080624_940877_0F374A13 
X-CRM114-Status: GOOD (  13.20  )
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



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> Add support for the HFRPSYS direct control power domains in the
> MT8196 SoC, controlling power for the DisplayPort and for the
> Embedded DisplayPort Transmitter IPs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
>   include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 07f046277f8a..070c6e5666dc 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -34,6 +34,7 @@ properties:
>         - mediatek,mt8189-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
> +      - mediatek,mt8196-hfrp-power-controller
>         - mediatek,mt8196-hwv-hfrp-power-controller
>         - mediatek,mt8196-hwv-scp-power-controller
>         - mediatek,mt8196-power-controller
> diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
> index 0f622a93c807..085790bf8124 100644
> --- a/include/dt-bindings/power/mediatek,mt8196-power.h
> +++ b/include/dt-bindings/power/mediatek,mt8196-power.h
> @@ -30,6 +30,10 @@
>   #define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
>   #define MT8196_POWER_DOMAIN_SSR				1
>   
> +/* HFRPSYS Multimedia Power Control (MMPC) - Direct Control */
> +#define MT8196_POWER_DOMAIN_EDPTX			0
> +#define MT8196_POWER_DOMAIN_DPTX			1
> +
>   /* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
>   #define MT8196_POWER_DOMAIN_VDE0			0
>   #define MT8196_POWER_DOMAIN_VDE1			1


