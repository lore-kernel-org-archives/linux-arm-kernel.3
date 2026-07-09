Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C915FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=; b=e+QFPb79A3obX4qpH7+pFNx69i
	0LSeWViHe4kzms3tVJbtmI5rXzQG+lF6kGruR6pol9FYzVXhQYfav4OJKbTLtuECHOy0tN1+uJZfZ
	YzJIq2lSUMC8h8LxGKijsHfUy2pfcAdcDhvAGLGWzSqhUxNDeBk5sxFImxUjUvBeRZqzUQ9az8RaX
	68QPGHEQPdDwIR7TOlEtF6PJQTkKjjUJGWBIlpds//J0pcC8TcAJuMGY2YcnvBN5BLggv16IH0isp
	qhfmYSOGq2xDpVgTfMNa4Cwt/Jc606P8YQLjr+e6wF1ZAACI5cSBsM8vjnkk4wc+aARE85j5iaeDu
	TgeDWlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoX9-00000002ViZ-0rP0;
	Thu, 09 Jul 2026 13:11:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoX5-00000002VhM-3gkN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:11:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6986578d8c0so1346625a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602671; cv=none;
        d=google.com; s=arc-20260327;
        b=r5cmbb8pUo+Bws/D0FMeIy1AWCn/LThY5p0RZlhIGDhfmbfYptK+hchRQe3z6QWF5f
         5A4D9KtB3IRqr29X1iJ390p9uZy+jbVFB49VH44x9G8WF0uTHvuyFRkQF0wefwOSjoMq
         jUVisPFqH+DbfmGpRFBLlALM1N6PjG5tzejTpMkbBYpC1DasKgx/hkVbHmNm4uIvOSOb
         DNHDtoIbqSFoqWZI2ynWJns8FD+jcIc2XgiNklyVz8Rg0QRURSFLlc/CbmQsEWc46Hme
         dFU5Mv4FlsgPvWL1v5aTymMFWLNmoirRod55htZHHdy2YDlBVCYc9gzzskX7am3qByYS
         OPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        fh=arN7VNjX7/kLhaw3fHVPdP9/XxsF709l/U0OLgORMKo=;
        b=JB8ABsXNJnYkOCNaFrT+SChq2dMrmRvAG2ldboNCOm8sK0UrJbXTTQ60R/JYR/56JJ
         2OmFGrcsnuD/coBhUMAL4VU9P3TJvbGmwdfkQnQzF6z1rJV3KDzKg3E/YYjRVFC71L3D
         sccfzL+1hQHKqkc/+W1lvWuEuuMrqaOqtZrnZhSLpbBJIJDvrogmuaWX1upphdUpzql5
         CoFc9c1oV7mmTG5hKDG3Hl1fXwJLX2APXyM3Se1yPVOg6zIpDcJ+UXVXzSPJk3dTD92F
         4z3/Hg364icb5qulDLq9HDSnxZ8HMTEmBj4QvRgqD+u5b47W6+l11yAB2Zy/IA5JVovn
         rKRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783602671; x=1784207471; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=UZFwH0Chs241OvazZ7C2R1wyXrVlcVMPRUMUGhgCSD5jWLuDyBcRI0TH+4V0bcFZNb
         4dSEIYP8+4ncGZlzjBPffomSMmtjIyijMLgspRzKRnyKgRfOC8TKatvNDrMhjEGjHJ+7
         FnWwhezG/H62qdLSzZZKmTcnFMzoX5vB3devwbNi8qRo7n3DamUiomTnBWRf5TTvrCl+
         vMTRgvJ0gVK6qG8lH34bbnbLfLgCh6vx0C3wj/iowPT9eFj7W0umqUe17iJB8tlJLDhZ
         LqgjfgDdhDpzKYBX59MpEW6jvMsH6wSJLkXd+b+FXe13/D59kg4wlN3aAP4JqXS7k3CH
         cvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602671; x=1784207471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E04f6wn1dc9YFn4SoRUgiBiNKqo8yz3BEpUr98h18O0=;
        b=MhoONLshYPa3I9zNtDRgL7pUu+Ghf0O0n+VgqEGUi0EZW5MqE7p/WNEwRAT8P9qQQB
         AdstWG4P7ey7x04lFEDPwDWX7eLLSvdH69fdX5nQl7O8R2O0hpnriLExgjY9ACYiEgxo
         2CV5X2/+treQFgKbsQstjgPUbufHWmSO6nvLEx1eZ7CdPIxAdYneVoqBsaFRlDp8XD4v
         +8OhGqEaSxFpG8XdIRK0+xOEogcnjop6j4cgBMaOiJktPFc5b0Ogd7xLjVSx9Efld3KS
         7SngNqpNLEtC1DA9rTFtJwPAn5VaPFcj/jW7dEwIO/mAivCs4a0FdyqcQD0guoYcEUL8
         7N/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrG1aw5OYMFvecRPPF4prpszIF3jh1IiGR56WpJeV7OIHvzlnmaS6UGBgufT3qzx/+kbs3FX8CnGrkKLwrdFaH1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9IVjQSl5z32xAPevTDtQ/DkCfBWBst7kfK8aug47BRF3FAzxs
	vn7Owt76txXsUN3UOwb6hsUTrfAlsuSRFMKRibhJPsN07no+L1rrNPyE2q/XRG5J3hSXEv9PbH9
	D70qbYLBOVQHbNgHmxrYGlNAnP/EKVkGasZnV/Upn5A==
X-Gm-Gg: AfdE7cniz43MpSv+4E+0eE9AaEoadIvikx4soTkTOwEdrZXNEQLNQQ3Vt/j+Ciu1VNM
	ufivLxQhkKfYZ1wdVMw+go8TImhsisB8sXXXjDJaNdEjgTrda52Uksq6wFiJx1jjbIl0dB8xsof
	+y/B8WDe4bMvMMcUsHjrbTMRu76MEcEOBF/svAJ43sQxFHBhKU91qN3ViL9OUW4abofTmVIogav
	oH30T3A81dZNsWw5u22m52hZjNp+V3QYYK5/J9zxL2IbuWxOUXddVScqaSQ7Ng1gZWZHusoE+q+
	wCg1XsZqoW5woI0Z1+3UwBxPE2IYqAg=
X-Received: by 2002:a05:6402:3214:b0:69a:b3ab:dbf3 with SMTP id
 4fb4d7f45d1cf-69ab4498173mr3121469a12.26.1783602671013; Thu, 09 Jul 2026
 06:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com> <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260701105731.196618-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:10:55 +0100
X-Gm-Features: AUfX_mxsj7yhT66qMFeVreq-yvEDLAx2Oah2zZKlqJssK5rRTHtI0rAPHqjZj3E
Message-ID: <CADrjBPqc_hUJUCgRjk4F6RUVE+3qK7pxs5EGUTmH2PBs4R3Ymg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung: exynos-pmu: Narrow allowed
 reboot modes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_061117_105603_3B27274F 
X-CRM114-Status: GOOD (  17.96  )
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

On Wed, 1 Jul 2026 at 11:57, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
>
> Most of Android-based Exynos devices share the bootloader or its parts,
> thus reboot modes are most likely the same, however only a few upstream
> DTS define them, so add restrictions only for these.
>
> Google GS101 has on the other hand quite different bootloader with many
> known reboot modes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/samsung/exynos-pmu.yaml      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index d124f3ae9fbd..5bd39876e3b3 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -176,6 +176,20 @@ allOf:
>        properties:
>          dp-phy: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos7-pmu
> +    then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|download$|fastboot$|recovery$))": false
> +
>    - if:
>        properties:
>          compatible:
> @@ -183,6 +197,13 @@ allOf:
>              enum:
>                - google,gs101-pmu
>      then:
> +      properties:
> +        reboot-mode:
> +          patternProperties:
> +            # Negative look-ahead to disallow unsupported modes. The '$' has to be
> +            # part of lookahead group to work, instead of trailing outside of ().
> +            "^mode-(?!(bootloader$|charge$|dm-verity-device-corrupted$|fastboot$|reboot-ab-update$|recovery$)|rescue$|shutdown-thermal$|shutdown-thermal-battery$)": false
> +
>        required:
>          - google,pmu-intr-gen-syscon
>      else:
> --
> 2.53.0
>

