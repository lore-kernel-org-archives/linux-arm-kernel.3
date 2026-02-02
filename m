Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B67E7DF0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=; b=YPE8+rH3lgx8a+fFj5H8GqSnbp
	0E1NDaqw0WzwYqW0IgmTox+/L6LAjmZMyvib+nng4U+G0NOXeRroNlmYTMPiTwtX5LPJRz4dwB95B
	RJFOU7yHxZ/vzeFIhMhNC/mOSqeMpDuFYzX6OjPTqiz8lY922bk4iTMrhON7KtIBZ65PY7h4SmU3o
	SwYLAhm66WhfP0arHMoQnZA6Xl8DO28+A2mPm3otj+uYAZTnfkh7zhMT/Bei22nESRbowHNMy8U9/
	l1W+/t5ue8LuexVftN/uWl3BOBvUOp/ST+41SbxqReMy66HqJgnPkipCdVRMB+q6b9gy9FNhOLPhi
	EluBSKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxR0-00000005LGd-1K8f;
	Mon, 02 Feb 2026 17:09:58 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxQx-00000005LFW-0tys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:09:56 +0000
Received: by mail-oo1-xc43.google.com with SMTP id 006d021491bc7-662f65c7d8cso2606651eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 09:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770052194; x=1770656994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=;
        b=N3nH90qU3OrHCKD1emXofeAZDDoHUJsJ2A3XXFlqhq/tPl3r96r+kx4plMC2dUtX9k
         vfa3U4lBMDOEPtD0x7m7HaTeGMSoG2M0nooJA+K9kQ5ECxa6YkTXteFxnteLF8Ppf5VY
         lPB5CYvNTLH04KWxJhGk2mABalswobEPEeK4s/Oj7rClG1M5Oi7qJL34iLlf0P9C1RZ6
         OPczSlDPe0sHmB0mDv4X4g16cLafK0RAdTfhnyY8lRwVzuqaNFdsvrkexf14tQAGTWFh
         UN7Oh6nlEUiIgTpTd6mg9xZ5lebH6EGUExWD6UX/2I6jJVuk18gzJh8/ZamMSxBaiceH
         sMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052194; x=1770656994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=;
        b=CZOqASBWcpNcvTdOhtXlpVyzHHKgn5bDfrE30Qy7FossH/ramDDrprcA5f7Bhe1oXp
         u3h420S+Ivx+mSxQX8kBQWN0gpbqMAhDPggDwmKtdzOhOsRGs5AacrNRayXEWLaiZ/ZT
         CJMg5EQTfPJIyg85hFsTt6YWW0LpEUyCH/MdQR63ZrqtL3DLgFBmJqvpECIKmnVZlx6f
         35QBkOTDRSHBTrj2VzKHacoUcH06qNnQkPgWPTDknhhp50KQLwgwI/YTGmpBg1KPIeOv
         cDCOav6K+iEx02Dt/OY04FiR1qx8DWIdEvkY29V8HaCeET6peIxjLK9AdsIAZNTU9iVj
         1Bkw==
X-Forwarded-Encrypted: i=1; AJvYcCVwDSZdc8lbtbsN4W9E2LVz5z71TkjJSVjf+epZ7UkIWgAo0YnMVG29P8nvFUFakAOiHLjaU/v4oZX8EVm9enZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxtWtMZo6Ci/W4h5lPYZvp+CHcAvHh3/n3jLbaJhM+CBw8qobYF
	zRobGI4x/vF4Y2H/FQq/6wM1RS/55yrRDgtZkw8uWu3RpMOkKf7SggaRDWIjMACZSrk=
X-Gm-Gg: AZuq6aKe4uyKY+ggDQ1YGrfdkoni0QelEtdwqlt1DLAZj2DRBcVVTLpL2X5kErkqgeq
	1h0rJF9taWZGBnN+k2OupvuVBSB0iWfxfbY2eq6px7hM6DfbeAP8qycqxG4JpAWKeJodqBmoPBE
	NOJfSQCUiYc+8EJhh1A5mNveDUnQEhpVImJXhxK3fNo0sXiz8kVIb4xVplwEFf3PgyitWUCB0MU
	yVInx6AaQPMCWfQ69Dhi89DTDdGBMRNiAUI5V75Ia1Cf5QgtQ6fP3iWIKnS7aH6YY74g08e0X9G
	vG95DWovQAaj/JdkxLtgFcRKxeLfIak1iGTtrL4g7ThOGsEcI9MdD0MAkVJjZ9fU/X0Ov3OoJN7
	XZkYOAiZOiUyiDnFQZYr692AoP2KUNbWPFxd6u2uyU0yc/N8ituNQZsf0xnhC/rOhir2bfELLZS
	98QOcyUHdoof+3cRX/qzr96aNZ/1zpTYnsCPPSV3BavTmvRsbI+iIdQ+roGyN7QxzkwzjOyZ8=
X-Received: by 2002:a05:6820:220d:b0:662:fabc:b108 with SMTP id 006d021491bc7-6630f008ef9mr5758808eaf.5.1770052189360;
        Mon, 02 Feb 2026 09:09:49 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4095756cb0bsm11668068fac.18.2026.02.02.09.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:09:48 -0800 (PST)
Message-ID: <c616cc63-35fb-49a5-bd1a-ac559574c32d@baylibre.com>
Date: Mon, 2 Feb 2026 11:09:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8365: fix infracfg_nao node
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_090955_330750_84E624B6 
X-CRM114-Status: GOOD (  19.70  )
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

On 12/16/25 4:57 PM, David Lechner wrote:
> Use correct compatible string for the infracfg_nao: node and remove
> the #clock-cells property.
> 
> Likely this was copied from the similar infracfg: node. However,
> infracfg_nao: is just a syscon node with it's own register definitions
> and is not a clock provider.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index a5ca3cda6ef3..4116f96c81a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -537,9 +537,8 @@ iommu: iommu@10205000 {
>  		};
>  
>  		infracfg_nao: infracfg@1020e000 {
> -			compatible = "mediatek,mt8365-infracfg", "syscon";
> +			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
>  			reg = <0 0x1020e000 0 0x1000>;
> -			#clock-cells = <1>;
>  		};
>  
>  		rng: rng@1020f000 {
> 
> ---
> base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
> change-id: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9
> 
> Best regards,

Hmm... it looks like someone sent the same patch (actually better
because they fixed the node name too) quite a while ago [1], but that
patch didn't get picked up either. So I suggest to drop this patch
in favor of that one.

[1]: https://lore.kernel.org/linux-mediatek/20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com/



