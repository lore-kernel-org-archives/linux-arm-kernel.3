Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA08C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=; b=DxZ6tSf/Vqn1l0cvv+PCx/84L+
	WcYbYkMRWSX+9UPDq9nyFKz6FtxkW0tsWwUUWIag+VBKGYIB92xttm2NQ2vNnXOZHrKH/QMlXMRQf
	pMFuR3Qu20YUWAuEPkOdH+/Y9TwBCJIEPVrH5RYjeC8s/Voy61UG97pYX4ALe1RB2wF29o4y72oBh
	YQWnv+u+vxIJdSDzwJrg+LgjM/YwoSyqQQnINveGxT1Qks9M7fEMJuSAwHNt0jr9K61sJQbRT/A/i
	3zjobb3aIR2EJC9EFvoANP2KnGiwUoVEnf2CsCAFY3grKust9vIy6ZKrC2pDK5ePOkGuOvJkd+ke5
	ZtdQelww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UKI-00000006ykr-1BSC;
	Tue, 15 Sep 2026 14:40:02 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UKF-00000006yjT-2zUm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:40:00 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so4781707a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483198; cv=none;
        d=google.com; s=arc-20260327;
        b=UWxK78fDj+zaZaLL10Sh3haTspt9kZYpiYFL2kF8JfdR/JQ7Py47oEKDryCb5dar/+
         7ZcJGGgbo2L094jNb5cEIhmTz2JTkaEXRf7UW3j4A8Rk4IpW4vDCMT1Q0pvhF2IfmtBh
         1q+Ideb3I/RUGvmEvpg/MyO7p/B4+6NOe59ogO+ZTGztij1q1VbBznvGo1SLEB0Hh5Iz
         e2nThyYuEMhPLQhoOYGuO1FYANDfQFdxqxYqX5SLspKFphhWVgwdOctR/+8YqwDgijAK
         ZV36m5Bw/IcI+DBzvakkIvdniylXT/SMjhewHsVDBykBvCFCeh2trt/PJkjaWO94pDJK
         3++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        fh=9hfg7wGsZbwNBdBbqGAvsYsayVSpm5VQeTHYPd2ZlLE=;
        b=A91fwO7mj22I/v82lzcVN0lMPtqyv2PhLL3PuddmYseyeAapt08yDP9FPOOIeBkJLW
         5hVAat4HKToRGaKGGjgStWB/5UD53Fg5oEcs+efrU1dPdubephJkhxHU6PkXA3TEI0+f
         i3aw9CLZUhcLV/b5s9MSKZQ7aiFBJQCkT05WOYuWLlAOWrQZ/xfZ5/StUrmS7gPx4k7T
         8Q+6D0IzsbaqPkGvE62l14VWq3Z+qwnXjSx1iedCiskJP0jkl1q5h+CGn/ur9nDC2GLK
         4ldW5XT09yQVs0VVKG6zBMT4G1wkvHwYfVi+wwOkldrmPnG2hAMIzo2R2Dlu/rInml71
         nB3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483198; x=1790087998; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=sL3tgw9ZpCL7DlzA2M7lTOYNo9U696lygU22Sb0udv5jliuDw4e+EiQn2KuUYTZLOP
         vaJQ4nC96pLHlSp6ARoPsbsNhnZCJJT+WiXO68gpOb6KojLOkwRhhJsLnLieulAFrk+Z
         Ayp9RoE8AU6oeC1e2nLFAFi5OEzIp/xh7nJ/ZZOLQYoPbu9ZAEseGuZ9NmUNRqWZFpnz
         NBblyLVwjw3C44Lf7GP+QVYgr6gYUPAUGAyAQOPkacDKid/+lTtCk3aiclgzIAL5+9PQ
         0FJqjO24wt6nc3FTBR9WAaaG9ZXk1wiQJzgmBY4z4TarOD5zPNOLx3yOlnEbfQEU39dG
         AiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483198; x=1790087998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Xwa5YtOq2I0pAIeBe3GC0dtIeA/uMMyehMpms7xKhI=;
        b=SG5r5OKE5oeG9Dy18/wffk9vvzTPwyV9mncZdrgwZkQkV3cPWxrKZdiR9vzUH/5+L0
         egApWbnHJY6KwzacNkfA1t7mL8KYRg7QQuRO757KlJqr8CsWeYQ0oSiQ1WPfhVcfRpJ3
         CNHRcjtyxV7lD+MrCco2pME0FeRwBvMEfo2M5JJFym9sF5gd6Hb06pusCUAI8CjnN0+d
         ExazrluOvt4W4CjNTlMPq1+Zvm4rwNkPXU10qqr9S7/igZbPOx0sngjedZUNQGc8CtFH
         /fQaH0CEuidk+LzLSjpw+3s/9fv1errlPfzsAXL6H0OyZZXz37aJO3WQcjlMOrz/Gs+I
         Z7cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy12OOPm6YfTX9Romc9k0l9n6UEdlCs6c89gPgSmh4qtwHQS6HWSrbEit5XyzlaOAHXSIhY81QV6BzE6M/UQeSU@lists.infradead.org
X-Gm-Message-State: AFuF++keODVyxhb1bq8I5YX5TpYhVAOL/xkxypEASUID/COE7xntvgtm
	EnLkXrtJKye3ChFyHXG/YKUQDy57i8fvXtcw6yoJkChWhFAkPWzVF3oyTDHpeDcoRAvz5a4y6du
	Wx+My0/NML/01iN9Uvk/bytsv9ChlWb3pI2EpV35OfQ==
X-Gm-Gg: AYBFou1nccsF54tKDuhvCN4lwgfvaswEQH2gSbIYtsBJQmukUJj39Mk/JfESIy/Sysn
	C0/Yw8GphQrVVKET2IJMxFH+uLd6UguxAoLziw97N94Vie//oeeUGdEYR34icsKpyL3Z7yN37dm
	Xo4ryLNFmWGQHqDodN1jZ/rYx26LMJwa0e4zUhBShH+O/rQLQoc60ZJaMhNXMPhEEBDZ8Y42Kdk
	qYc/kKDX8ApCRUSHOssr+pzXep5XLkO82F3xkJMEnsKMSt77S6nf57xHoxHQdT5rcZv7KIvI0yq
	oHXx1zBLlTZ8+Otn5yPy3VeX4OIdRXWFExTqD59XyVHqkZHs+mc4lAzlela53qmmzapnnEK5pX+
	xCNVwmn4Xzv1mwg==
X-Received: by 2002:a05:6402:20ce:20b0:6aa:1112:62ce with SMTP id
 4fb4d7f45d1cf-6aa11126963mr2247651a12.17.1789483198039; Tue, 15 Sep 2026
 07:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:39:46 +0100
X-Gm-Features: AcwNN1UWbY0jLS0AasFyFQBRa0-ZrbV9B9Ct3OZ1vkaXc7hzdPFBJ52yoD3W0ms
Message-ID: <CADrjBPoEmxv=f9DmRx2Zn9cB40+V9DpruayEHFkAznbNeu7D_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_073959_774498_788E6056 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required, that is why "mmio-sram"
> compatible can't be used for ACPM purposes because it requires child nodes
> to be declared, which are not needed and make no sense in case of ACPM.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram
>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>

