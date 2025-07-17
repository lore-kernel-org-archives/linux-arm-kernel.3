Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7413C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lI0pEfmVhQWkOv8EPGMn/xg7zISwfZGg3TSb4XZEXe4=; b=PG9pLHkIzv2eFX4TzZvxYGQwOm
	0Gc5DtJ2at/UmqElbw347EqzBmuEehkkH7Xg3mzcrAqHU5/7ph+aAHokHZ6ew/MmJa7IlY8VU+LBQ
	dXAVR/WU/9lXbEo6KhJ8OBiOQWwIYWW8KzNYUHoQX3xJ0GxTzs0vNeppq+gZvj7eA5P28AnnJzkfY
	iRfFOq5z7rAne+8dW3YsR/rgnsbJACTl/rXX2Y+BeFIdWghIrLrcyzFNdOR74SUd41oPxGOXizob7
	Ry9NyX2BFVK0iU/7TKhRyZiUE8eI5aqLBdm1b+eQ7x/lt7HDvvyyJLm445b4NGQNOQNmHjQqmjBbn
	lcwV38sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKg7-00000009hYO-2uyE;
	Thu, 17 Jul 2025 09:13:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKF9-00000009bPe-1Yxq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 08:45:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso310613f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 01:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752741930; x=1753346730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lI0pEfmVhQWkOv8EPGMn/xg7zISwfZGg3TSb4XZEXe4=;
        b=gNKw+0ZmGBYNx4sMApGIjjIcx4Enr7Pxyib4ELYVL2VCMH+4J8gNYlmtr/3f3hZZ0q
         h2iGzCc9U+EKeFCln2/fZo3GzfXpaYowGYIBMvxxtf51NocKiDwrcH53pTFr4+xVNKOB
         DG6akdT5SYXv3RKEEHtkD630UzZnxMtSz20zJbwZkLeZQYg0INxkRXl9DsmuYFvbt1yv
         Ofh6wvujjqOgZok5RccH6Cnej2wDTiqxB88mDG/RLkFP4a/Fd4VX16VHWNZT53VLcjc0
         1rOqcWsKn2BRmSNEwOUF7N5oyJEdAmVyQza6Sm4zJx3Dcrhp5pZyEjpQn7mADnR6Hmk6
         nCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752741930; x=1753346730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lI0pEfmVhQWkOv8EPGMn/xg7zISwfZGg3TSb4XZEXe4=;
        b=sy7BKW1OlFrfv1RxwYK3KC4xdImw44VQiY5YyJR8NW4DrEWR3borQ9BooVGzumFV14
         18QeAdamJXQJVn4tv/edn8B+MPjL+J5JxctL2piGie/qeyw8sl58+chS0tdMxpQXDX2f
         oU84/maTIlF961nhKQB3423JI2vKDD49rNZeqr7AbXoZj9zkjKCAVRm65i1PHgLy1aPl
         OQBMH/B1SyTiOJ5+sY4W+56eVaQ/zoC8IEYLeK/6GXZMLz4Tfey4nDUDaq4kUMGPm7Jl
         8FydpOdKPssvuCoAaAz9WZglcVjyJ+K8JMRnxJgEA39seQqhRWWzNS3ziDqMeKE9RWEK
         DxyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqlq760bo3DrUrBo+CPJ6gDOMaIWEBDvWzcoApzU5StQmL50uhPRM9002eplkWw5Ga/CURQD15PZxz9VmUycTr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6a44aPhNE/hZ21CUiJ8hZnv6VQjpn8V7wgQLHOEEspQTKlbz9
	S4573tMbiNbEMcFVvQLI+escHGPr89JAvv6t2hAXXekx7CmthRga2QwPZxrBtfBHw4k=
X-Gm-Gg: ASbGncuFKPUpxqCFu83R5MWOuTkQIcJgQ9fYAdxgaK8Wk+6ydg3DlQgsp7D/eH3hYYI
	DW0kImPfaJZINLujakXHfLlLpIJVjfD0pb0pFu/i5IsUis9yOwjnq8BtnX4UEtN8/Ov2I2Wlshw
	YyK0to7oEXQjw/gDvzGmtelrbiK2UJzigNIiygnmdLXFgMGeVbQrRUoOs6be+2rU5M2zT+lsPMc
	ZqDCWEJ2dBTOSQ/e1BDIwGmofcykn3tMtCCj1NTaYbRH0WAx5AwKTRdalbH2AhvKFsTZ9rbEnG9
	/pnsULYsTgZxaC1qgSO1P+zzFM3C6OHL5ct2eeN7+EYbpltmq8EV8z1+j5pCkkFZyHgnIDnqKl/
	wxMEo1yL3yRmA/SQ3wrcvm9ArASsqOGgrmegkS4FuwkNF2Tg3D9pSvvgJinwviQ89HyOS7vieRd
	Di
X-Google-Smtp-Source: AGHT+IHynfEiO6GXy/zERfnUna5/ILOl/Jpu2n8FLydUo9tQGpFN5rGKrkj6TlP/t2+2sNcZBF+q3Q==
X-Received: by 2002:a05:6000:250d:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3b613e66eaemr1561801f8f.13.1752741929767;
        Thu, 17 Jul 2025 01:45:29 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:37e:ce58:94c8:a752:de4:96bb? ([2a0d:e487:37e:ce58:94c8:a752:de4:96bb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45634f5cad3sm15783305e9.9.2025.07.17.01.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 01:45:29 -0700 (PDT)
Message-ID: <d1e84ad9-eeea-4d0b-9f29-1dd4be49225c@linaro.org>
Date: Thu, 17 Jul 2025 10:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] dt-bindings: thermal: qcom-tsens: document the
 Milos Temperature Sensor
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>, Thomas Gleixner
 <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-8-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-8-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_014531_412414_9924683E 
X-CRM114-Status: GOOD (  12.67  )
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

On 7/13/25 10:05, Luca Weiss wrote:
> Document the Temperature Sensor (TSENS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 0e653bbe9884953b58c4d8569b8d096db47fd54f..94311ebd7652d42eb6f3ae0dba792872c90b623f 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -49,6 +49,7 @@ properties:
>         - description: v2 of TSENS
>           items:
>             - enum:
> +              - qcom,milos-tsens
>                 - qcom,msm8953-tsens
>                 - qcom,msm8996-tsens
>                 - qcom,msm8998-tsens
> 

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

