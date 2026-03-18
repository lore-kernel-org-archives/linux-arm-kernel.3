Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27301088E50
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=; b=3AzpZ3zyxYBCi1qNMBF9122pOu
	jl261ptZbOB9sVOnW2WlX4HRl2GnC8aPxTUwtJPAeQ2QPhy7xGiXu/5SZBiLy7vCgpzNsGP8dr7G3
	Vh+jgjh+52RdgVBJHVrPsP3IBZvoDsS7qqAjQhPjI4om01O853HMalhqTKyX/lNNwoV1s7+QAyB5I
	qrcpxN2JnamoxIpUZ2itXZomBy5OxL/K5M8C9xrlmy7OR7OIOH9JWy/Loqokt2xYR/FMJ4faeDQlE
	qta5GCwK8ohNhwibPBGL5Oe8lW6qXBSdPZtjf3sHWpis1zJw3Ucj5BBxocMmgGmmczOva/mIeiEOV
	mPzFg8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zsg-00000009SRg-35Ns;
	Wed, 18 Mar 2026 23:00:50 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zsd-00000009SQt-1fJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 23:00:49 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d750eeaec3so186535a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 16:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773874845; x=1774479645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=;
        b=ptGkKrZyvdJNruHJjX31Pxysv1OTS+DH2yCt5tqrX7JxN+0AilcJCQzUig8T4PCfCx
         u3+h9V0iEnJy+cgkBZ0mGU/k2tadC0VjqCMdiqt97QIdb972PwxVMl6AsySULniwJdzK
         khErgcf1Vhf4f90mEsye16Rg2DtJdp6YVyRwCHhy+R4s/BuzrMwe4rujpmC4pfJIbxVc
         A+gGETXJPASrCafa6c8VLbRJpgZzawUJ25MR0w6d8rMVJ4zuXozrx6WauSCVfFB4K7R8
         uVAPNxUEe7mt4ldn113zT8dgfOBPd5fxQVhFtyHJqCjOvIMfLuSzvl+GS/4NpdtOFoTr
         iypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773874845; x=1774479645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXk/XAl/MQx/OXuZk0UOeHJIU6eSq8cRls/Q/FJTwAA=;
        b=YUsf7IOjVE8lcsrPYonoGbg2/2LZ7eL/0WM/ernzjeDNd4oCljY8iFrbl2eCpDQ8sh
         Z2oCumraOuu2DM4Ie2ELfYdrdfBqI5xUBG/fRNv87b1Kht4eMlM3EImlcdjtNw5zWCzW
         C+JlP4sSNnbQUmuF2BdMpyrVgJJm91OkNNr84pbuuGF6CYkkqybFKtzexxt9V/WzunjL
         zGsSul2LdK+/j1fhrNbnl1yKags45pmsV8ytLgHqidyWzBYdTtfNy9ILvlfEx2+DDZZh
         NWI1K0laFsQkXjL1WMDUMoxdspL4WSsSI6IGCr1UB6ykD8aKJ+2/GRfbzNsDVH8K5R23
         Z0gg==
X-Forwarded-Encrypted: i=1; AJvYcCUdU4yacHZp3wfxe45MKPOn38tjtNzKVSN5kP2hWyl+otEpyf/uEYEc3nHQMFh/1V8VUa/WaOvrTZ8Pz+USf9Sr@lists.infradead.org
X-Gm-Message-State: AOJu0YzDUSCTmaBBi4F/nsjBeLHKGYn/5n4TqeYGPtkeMiwSQLeSZ5xQ
	leq36g2eDB6Ns3MapXkRmK2oICO/oMI8h9HQL4xATrokOfln7sc1yF1vCmkGVaEjIDg=
X-Gm-Gg: ATEYQzyIdaHmsAZld/442OJOYyVnZHW1Fqv/3mWDYhUQp5i9+Sx8nXDd7htzchFozrQ
	S6KGkldHieVnENuqj7GalV/ky4OnlX6wfgn13cr84jpBMgVl0BEB2b5AJCBdpup6JWvctyFHkJV
	4KaEooZCfnVRel/pn05pwKdNrHrxDNa9keAo2x+9qFY+gzIIjAQ4p9fn+6V7dH0v52C7KbEPjm2
	umyhtKk1l1wq3wnCZrLoiKBBW+K1qZqqimQQZ0gUrH4zkjrDhEcNT8PUnhSXdjE42qydod6e715
	WcvlvVejZ+atoIvFWwjPv9dAPKfoDUtNOfqpx7WTlP+slE7M93V7mpGcZUfRhD8sdOXdynXO4sp
	57zTUnriekHAbg2qNLCz50J2Uo+tZnpBDiVIHUn8vj9Ad/vEzVOEVsihEfU/viv7wiNgNh7GATU
	rX0opI1cph7sbK3uwwNPKq84lR5n43UCFAxk6nLkw+hZs0PSwNGQfIsmCaEKnKhN0komxdTic7L
	g==
X-Received: by 2002:a05:6830:730e:b0:7d7:4921:897d with SMTP id 46e09a7af769-7d7ca2bda63mr2987245a34.0.1773874845232;
        Wed, 18 Mar 2026 16:00:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:244c:fc8c:8216:1344? ([2600:8803:e7e4:500:244c:fc8c:8216:1344])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9950d99sm3182160a34.6.2026.03.18.16.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 16:00:43 -0700 (PDT)
Message-ID: <4cb07b9a-249a-4c13-b09a-6dac9f72265d@baylibre.com>
Date: Wed, 18 Mar 2026 18:00:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
 <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160047_624844_01BF89AB 
X-CRM114-Status: GOOD (  18.11  )
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

On 12/3/25 5:45 AM, Louis-Alexis Eyraud wrote:
> Add a new compatible for MMC IP in MT8189 SoC.
> Even though this is partially compatible with the one found in MT8196
> SoC, the MT8189 SoC register layout has some slight differences and
> additional features.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 6dd26ad314916a3e40cf55ff69a7d93ed63dbdd4..eb3755bdfdf7e001602c3eb870898275085df3e6 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt8135-mmc
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
> +          - mediatek,mt8189-mmc

I think this can be in the group with fallback to mediatek,mt8183-mmc.

I was able to make it work on U-Boot just using the existing match
for "mediatek,mt8183-mmc" there.

>            - mediatek,mt8196-mmc
>            - mediatek,mt8516-mmc
>        - items:
> @@ -192,6 +193,7 @@ allOf:
>              - mediatek,mt8183-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
> +            - mediatek,mt8189-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8196-mmc
>              - mediatek,mt8516-mmc
> @@ -240,6 +242,7 @@ allOf:
>                - mediatek,mt7986-mmc
>                - mediatek,mt7988-mmc
>                - mediatek,mt8183-mmc
> +              - mediatek,mt8189-mmc
>                - mediatek,mt8196-mmc
>      then:
>        properties:
> 


