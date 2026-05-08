Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F872CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 20:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=; b=HUp9aWl6PY89KiriaiDwf/zXMt
	1sY0JfZ94R0G8668KkMu031D+0y5I2TDzy008LLMHjvH2V4X2CKlSCZ2KuVat9mdpccXEW09b3ZPK
	kSg6sIiqrRluVvGEkHbpTf5Erfj3tembkPxQGO1kaFtM0ECdoYNteReuJf2w7xgOVjJSaZRAxZpxS
	zmLmAwp/ODjX+ZMhfvA67ufM8kl8X06MLNZg0H7gSIqBXpNMG6NkTzd90BJoevoNJC3adAKDt2iJO
	8mj2TLgIiMJ2AdrsiJeP6f03v4iFkLtRJ2wcPic0KjX1SPCu/g7E/NUX+EFvipYCfc2ntVRRy2zM1
	CHb+F2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRxX-00000007TSB-2JRB;
	Fri, 08 May 2026 20:38:07 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRxU-00000007TRO-0kEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 20:38:05 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so3407669a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778272682; cv=none;
        d=google.com; s=arc-20240605;
        b=F4p84zkuSVmkUkCmwEvhhnpJsAmg4sLGV4JVo57TZ0/1mU7e7O+JdhUfpznUyobxVG
         +IjirAgCRHGK1ei322vdL6GOF80ZS/Qb7JzVTMjkqzTyfg/Z3coXHjJImrtTibDbzV4/
         3mjX+ewLLSaMh4y8SjO8vWOCToVQpDQaDJhEId3YLpoG7+8eaq9hMQwnJa7zV1LiC8m6
         zWSHu/EwW9oqIgb0md7+aRnGrurIwa9WD92AMDvqfjBW1FnIhXXSjhvasiYk9HhEoYIE
         S4o9v/p1esVAPOX0kIZX+CwHwEMEtWh8U9EM928ixqrsyf6sCEXYcMr2L1lWt5hA4CZY
         o43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        fh=sZ14XQdDv4NVV5Wme0mXBL9FOBDBiELMsQbRCCeH3Yk=;
        b=KeRGoExoI5T42bt8VqeNyMvGHSMSU7b3LVEIMkWkJlpqlarB4NjBpCj9XKkJEiethy
         vJ7MFDP9F1y0wMQaY4bVe43h13LUwsh+qvkQOBAw4gMOAfSMaAeC3aV3kFrcgAaNa0JK
         HdyG5sMKAkVlEiOLNvI834vHBbTB+AhJWDlo397+9KuYbp3tOELKWHVchq/iKKeZS8om
         LJumD12bvIjcX3qzFO1bhzCehEdXiAHaXJh3tnfEAYyyhQ/3CH5VHgCh5QEQKhqZceoA
         TJG5e4g1kQM5vi4Vysju/KOCsZZZvUx1iBqNSbUMEzmh73wiicdVNkLpCVtjyqb3bIeT
         a+5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778272682; x=1778877482; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=tPtGspRtmlDltphnmkzwfbKZC4G8C5GpJ48NSQ+TPJms1ReiuPwYiserEQCZex40xQ
         BecERrVioRL1Qkic9rpwXQiXTz/aO9u/ke4jqoR2bL3dkqvZf2y8ex7UKEHwPKXS+JOO
         4zUaCrBGgXy9GS1bY5Q0yn7VaAvwmQRoWgRuilw8bNsCpAEsQn7xDgjwaU11tfx3Xdde
         9xIAh+SMkgn4Va+79wDiLlS+WAqePbFwS+WkpupZyOZ2reTqQKGGPYCcBXP6Yz/qg5Dz
         NLe42H8oT3C70g9Uv06I7GpIWDKi5BQsDLnm+wkZc1/ZwpFOKEAZmu5n1WIBEH9/2wvS
         rVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272682; x=1778877482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=WDZKtIODUGWlLuijgvEqDTmYIyIYspSzHrl31gbnfemFYFNqYDiuYNGlBEerzKZbab
         50mCTRlhcUuJ7zX0l2hKuuWHTXDBuW3c+R/Wdq1OzSEQKVDM4zOrKM/140M6GH8PH/Vv
         iKkm/1OBULR2zqyLnYybfQ6fX+bU4qyIb3dUTpRTDUGmtzIDg/qTglXGvyejvZoAyM6F
         5mcV5RrQO4y51uLt8bNtmzsU0TgtCpD9n/VpUAGvMOntZlwQBnjvM4YQHigguPDcYkRv
         ut/sUDnSzJc6/OfgsilKwEWnUq5BYOFXRnh2NGV1a5pz3N/mNTlKiGqs5q5L7c5oIXFz
         z2PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/p9gTCIB7F2IP0Qst+BbBm480FlGZXqjLeqfr9aeuZk60lpGFQUei+pFCiztywip5npKHTcQxA9EHUQxnpEBPa@lists.infradead.org
X-Gm-Message-State: AOJu0Yxic9Zt1oR+OFgVRy6aBNk4nwgYK/p6WVX3U/oa/hyLEs19mj+H
	ix6u5KVlmVxDGTca1t0J01bNDalYGAZ8IrM7RwvrcAWCmj15dP+DNDTlTL6S6crB4BVSaKPO1j9
	9AJFLz00+1cmBdBPaOlVwPNRYePfaegisJqwZ+HZVeA==
X-Gm-Gg: Acq92OEPIY4ymw0IayFpwty01BJ27M2RAwPSuNqa4ZVePqEUrROiG4hNUM7exi/tQZV
	fBb/9bOyWYG5Z/+u9kurjlwsfEAB73EuIL62kt/oDG6MjAE5jkcN2oa0tiOfbSfcVx+6tKc0UXZ
	WvEXijHj1D3ip/HAywN/RMYC4SjAKo36wNwjTL1ftZ+8R/Qs1o/OWC9xvOoUnCfCMFL6+6dasxd
	TjWOf2N+hoZ7ypoogCqGFXsS6CVs2Ssk03oVmE2CHMJUY2ji66mysfHKb0B72qNsRyr3CA3F3GL
	Nwlsos1gHQsswY4Nce+qJK85PRSnBoAtDyUsOR+MHfTBDStHyvWM
X-Received: by 2002:a17:906:5192:20b0:bc6:2fdb:b5d6 with SMTP id
 a640c23a62f3a-bc62fdbb6fbmr610270866b.10.1778272682030; Fri, 08 May 2026
 13:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:37:49 +0100
X-Gm-Features: AVHnY4IOn6XfXMt1GfjKeoDZAEYNpjk2OjuDq_6-_V8r9mPRx0-T11Fc560W84U
Message-ID: <CADrjBPozLTq6mZhszWz33wMgj9ppE8GDYBC26gkGJOftzqq_Ng@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_133804_502035_EEDB1A15 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, 30 Apr 2026 at 02:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 3881f573ec08..04662b1c5458 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -231,6 +232,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +
>                 watchdog_cl0: watchdog@10050000 {
>                         compatible = "samsung,exynos850-wdt";
>                         reg = <0x10050000 0x100>;
>
> --
> 2.51.0
>

