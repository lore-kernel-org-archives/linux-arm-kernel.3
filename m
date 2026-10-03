Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596EDCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=; b=UAXRz1eYx1vYMHB+09/yCuC535
	gM7nrdA0LQzD4KP5613vITexyfkFJ6HFfVBvTO9jjejepk+0M8T6c8N9u+gGlMpyPlJxUkbg9BgU2
	wSg2xiJ7kKwJdVd+2UhkK1hlAyArzKdGhnSL1rCJAd/CujCvDEAQGlx/FS5aHfYgicLI++4faxB/j
	bHSgmd4cgp77036MabieKkbMsp+U4RV5pxx+o9AcAJ2fa33WOa1JsoYsSv+mUFA1Q8WD8acGFXhA9
	yuG+jRqdBQOk8r6jF/YiGTxyec7S9nNFllssoq0p+XgsrNuqvtxhyKzFSYbZtfvPwHspN6d3ZmMvo
	G6MDLLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxFi-0000000DNrn-3eyF;
	Sat, 03 Oct 2026 10:46:02 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxFe-0000000DNq4-3T6j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:46:01 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2e59b02972so76554366b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024357; x=1791629157; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=HNtFM2hjkKVvwekJppAOaEfCPRzfQ1E/MABiWIbgMmHQ3w4//897LBhDnAiLLmV3Ix
         MCMOIfMII7vfZ0V/8APovr9DyXXyyPSO8MGGdJ7Oo8dwaG3Q+fVzFoGNdgIVWau1+ejt
         S3T7hXdt8onFjp8uqVWKb1qFUkwKHMBbLgMjmAoveyvKE6J2Vp78rGht07bnAKT4FHP9
         dQbOJ4qWMxXQrOm4Lth6AcwWo6RDmBeOIGGzPWPC0db6uRoluSKiXzJ9VdlmHbjR1B2e
         Nq6N/rB209twwmQQTjt41BQc8uRf+AJ5LfNpfzM2ejDX1HMv0Wf/iagBZcIeQcSxIRo1
         zDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024357; x=1791629157;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezx4xzy/gAlLbYrRv684J3BP0hR2VYyaFcE+9qMDACQ=;
        b=ypp9IGmIX/Ck0Nw2mO+qLSjyUciO6l7N40pe5Tx44NgWS2pEXF8SIfonB77nCZoB+X
         4t2+ufnYd1Q/DaTfZIVEFaoi0NV+DmcA7riTlhTd3bOT5Yatyny29B1jHUX47uDqk+Yx
         C1ybMcvZ+oz0XWk1uIf//x4LGJ3n3rnylIzFrEE0Y/c4aM2q/jbY/jEnVfzeTC5QblYW
         9lWRb9qEf28QEJ8alTkkAcacuZT1Z8PSUnghqpNJdZzcnzqu5tU0mJ6nmeWqbTRZc7lf
         lhgMr6vrfhRwEByX4IsijWLTdcPSeVrdfT8ApZsdMzAUBBfi6bd3VoBtiKAXtH+Pg+AR
         tRYg==
X-Forwarded-Encrypted: i=1; AKwUvBz0+bg/QSE2+RO23NObx4a/A5Ldemb/ZT6c1lfNwexjKJDl/5lVr0BxSOXQAiUPHScGz88dqUkFo0ko2hDUBbJW@lists.infradead.org
X-Gm-Message-State: AFq9FYJwTbKTAbQvawZE2u0bxne9B0P/ADNfZNpB4Cz73jHWhmcNGO9r
	n+pazUlfBGv6FTgPkD8rzJJwPKtIDTscpjZWC2iYNKLI4Td0qqqkX74H/xsxjlL9O74=
X-Gm-Gg: AYBFou0Qb28/vDNbkPhLTOwuS1axQCjTurl6KOb1LxXxCLyqLKNzDrkaZX5Q9M9uSaJ
	52MKZeBNp3djeSNiypozAq2++xq3z3eO/1IPHR+Bvmx3xNMcJC/+odmhIQOlZ+AXFwjIxfH1gWP
	v8Iumka3UFWZ5y3WvbXs1XvpiZpl0p+WHzPFoUgL/85uqjxTIWKuUE4nYsdoqedfLVGgeRDKbP3
	ExeCh8p2GTqNjdvcGUSel6w1a2AEWdqZOng4lsQ+6VG/wcI55GZSxf2YMMwKVcshMFlO6UFHwmV
	hGXQOJL09ItkOudfj0NQXPbCnIkmURsQeM4f1+FqzuhHrPyPN0Rfzxy7oEdM1IvcKTU+BNjx5t5
	C7jPZquONapM+YQBKYsAUOrTXh/bMTl6dBvmsOKz6c7zUqxUUWK44KqnfJsNJfrODypezoR53t6
	fMhdXfPWZmJVa43p4R+1uiuAYZYhgBcQ4/zLAa4UFOhmNTwXUjKUZSTPQPY68jEx9bVOmnO0qMC
	jwg82p0ekA=
X-Received: by 2002:a17:907:6d24:b0:c2d:ca8d:435a with SMTP id a640c23a62f3a-c2e4af80457mr432580266b.38.1791024356730;
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd26bedsm186675466b.34.2026.10.03.03.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:45:56 -0700 (PDT)
Message-ID: <80d0d390-a0ca-452f-b8fd-a7da85bdde92@linaro.org>
Date: Sat, 3 Oct 2026 11:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <rtlQmJQ4ykTc4dV6nFJIqsjY7h9hUEOCFQETkvIiKG5GSaRI0L45Rmi2FuzpULqJC8hFjPE_3D4kyuRqgJNOdA==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-1-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_034559_776096_A4FE1E09 
X-CRM114-Status: GOOD (  14.01  )
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

On 15/09/2026 11:42, Amin Gattout wrote:
> Document the syscon compatible for the General Register Files of the
> RK3576 MIPI CSI-2 DPHYs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index 7bcb4e2f47ec..e94c83d7c138 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - rockchip,rk3568-usb2phy-grf
>                 - rockchip,rk3576-bigcore-grf
>                 - rockchip,rk3576-cci-grf
> +              - rockchip,rk3576-csidphy-grf
>                 - rockchip,rk3576-dcphy-grf
>                 - rockchip,rk3576-gpu-grf
>                 - rockchip,rk3576-hdptxphy-grf
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

