Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE96BD68BC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ascYhFdbvJ6nC72OA8rh8LvUXFT//M84YMCSbVmuWzM=; b=JNj1tvM+6dSuDzpiuxG5T5OdHK
	ofBWpBneu2xu5id8nol9u7b8Wx65ZrvfTa0HRk1CLkNa/9jutVEWAp2l0mwlDcDDR3j4EWUYL4Mhs
	ILW5YvfWddlBDrS6HFBiN8Nz3nwPxgNVuoRpGV0ARPr09/tCAR5vvjSrgXG0ol96O7TPSv4HNaASI
	2ZwHnj7szN+15Iby++ZtRA4VXc4taufhbjmyewq3IvDGfHi/MLkrSwMeKnyoWfsprYZiUhMbBd/g0
	Ldcj5h1CRzD52RpcidtOt2maeZ8rwuCI1I+a1Ehk7lyF7ApJksXC9DNpt8mPN06HiLm/F39biFpZ4
	ash3lW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxfE-000000032vB-1P8g;
	Fri, 15 Nov 2024 14:51:12 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxdM-000000032V0-206K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:49:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53da5511f3cso1944960e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731682154; x=1732286954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ascYhFdbvJ6nC72OA8rh8LvUXFT//M84YMCSbVmuWzM=;
        b=ZxP4En+0iET2Zby8JrjBu5Hq5W4wR4jCspsZx7BvhqIBvyaNXeehGflQqgGCZHmPJ6
         tslvo572hNjQpAtjet7IkvnG7wHx1Y/vgf467idFY+eXYUsSFn1iOOuJFef6dp3ne3SP
         A73RFNErU8K5CLMmcS2ETD2MHh1KIJZ6l2bVVw+BsMkc1DK5CNsj0tMgj1JlgIDQz1MF
         76tQn/ohZd/EtLT955sBIoXOzBk0o+ZGVYzFf/EWbKscczEh22DYpeh+PuWm/9vWXcrn
         w7zIF1+WmcFvXUAyl1bZdnBmOKTSb3sTmoldmxiVDQw03K5q1+j0T3Dlp/ccELYNC/6k
         csXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682154; x=1732286954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ascYhFdbvJ6nC72OA8rh8LvUXFT//M84YMCSbVmuWzM=;
        b=JSb2eTyS478PjPBvdO2+JV3p4iatPz+qPArkwavnyjZbw06P5Wtp2dXbdRnOX3vlzs
         QflR7rc4wbiKEKr7wg7LT4DbElJTmWHzpc5QOdRNxrbB7IR6jYT+Rg/2kF/GMM6mYQza
         MB2kehVcSbDf9dLprHp9MmiUv70VDplRevLRXXcLgjGoCE9xyRca1cehh7TqDc3G9rSn
         KGRQosNTk04xRrfCEE1sodxCRFCGgS1c5iqWP6d0XJiaYk/98J09GbZDJg5cbG8y6sDE
         0w9hEzDxtXR2Fq0QnaK8OIKaG6WkiEB2hyXxLxsl1bRBVR0vfJMC9sA1Wx8FSQcwMq44
         +TWg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7DPLJ2JUnUlIQOYZFcUUPnIbCOyTMKMNkafhJwcdZut+R4/M2JAsPz0707EmowJkmk1jgu4lqm0KcnRPxI2E@lists.infradead.org
X-Gm-Message-State: AOJu0YyrSEBb0BSt8OdwcFZwT6qJ5TVw//vI/wJHT7YdUFDTQ1Bf5BHJ
	yBIPKXzbpr/jGcB2IcgKh+EW9YayizCUA7b4jQydxP+ZtnEWdg+A2aXuoq7J9z0=
X-Google-Smtp-Source: AGHT+IG1NFDzV6MZrchb+mEsTwZ0o/ief5MAWsOvo+nNU08Kv6TuNreXt1Cx161FLCFILoMwYnjw2w==
X-Received: by 2002:a05:651c:98b:b0:2fa:d84a:bd83 with SMTP id 38308e7fff4ca-2ff6066e711mr18694701fa.24.1731682154301;
        Fri, 15 Nov 2024 06:49:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff59763fa1sm5695241fa.11.2024.11.15.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:49:13 -0800 (PST)
Date: Fri, 15 Nov 2024 16:49:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: qcom: Document sm8750 SoC and
 boards
Message-ID: <6xz7tuzxxkda4h5se4wep4krja2pq63lyq2uh6f5m2ywtnumgc@dctwjxngrkzp>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-2-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112004936.2810509-2-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_064916_511105_A77C6C30 
X-CRM114-Status: GOOD (  17.58  )
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

On Mon, Nov 11, 2024 at 04:49:31PM -0800, Melody Olvera wrote:
> Document the SM8750 SoC binding and the boards which use it.

Nit: In subject you have 'sm8750'. Please use single style for all SoC
names (I think it's preferred to use uppercase).

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 7c8c3a97506a..f4e8f8821405 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -86,6 +86,7 @@ description: |
>          sm8450
>          sm8550
>          sm8650
> +        sm8750
>          x1e80100
>  
>    There are many devices in the list below that run the standard ChromeOS
> @@ -1077,6 +1078,12 @@ properties:
>                - qcom,sm8650-qrd
>            - const: qcom,sm8650
>  
> +      - items:
> +          - enum:
> +              - qcom,sm8750-mtp
> +              - qcom,sm8750-qrd
> +          - const: qcom,sm8750
> +
>        - items:
>            - enum:
>                - qcom,x1e001de-devkit
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

