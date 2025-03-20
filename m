Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312E5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+DKgKKe0d2S0aLSGa2DZ5AxLYPiZ/5bN97M2PhD9xQ=; b=AweBa8A6DxNWxnx5TkBrtN9mlS
	CRoBa7qvC936xW2/3txELfdVgrmX+Fd5i1Y6bQlWnZ5WGZqDJ7OxzQXowfcIkBkl1NdUlFSduXsT9
	k+qAccw2vAEKE3PyZbefQK/lR0y2vxFfEwjbo4SHUcFvBZviq3YHbKUqt/kXQo9imgRh7gwmdqxjv
	DYQFt7R1wqEsaVXmWwjHCl91HeCfY4iMYBwlsA4o77t7GIIBYsEwzHlwfcTHNQrtwUPfYkhZgy0bs
	CFgBecCByYtco1m8oPXy4Q0VDS4gFEW3Y0Nc/Y88KLA4aL76R7Z2P9uEi12rCbfKujZ8MMKaMcW5x
	5es449Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO3o-0000000DJhX-1kOt;
	Thu, 20 Mar 2025 22:08:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO26-0000000DJTW-3DLf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:06:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9631935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742508393; x=1743113193; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+DKgKKe0d2S0aLSGa2DZ5AxLYPiZ/5bN97M2PhD9xQ=;
        b=bKyneWAqzKwJnJZXIzkvg/zfqADrTfEDj4SybCCJtBbidrxWzZHXNZfVl6Lq2Nu5AO
         aVmrkNZUt6kEetqbbibeZD2/JdGRGAHV1ybRj5sBLq0eCqnPu5njV+dIwZsLJ1L5f8DY
         WmJoI23CkzAggEiIusYyyIHj4QwOrbEliJSqcoaa+PXlXZdeJBFQ6xonDKPQdVaIOpEo
         OLv4ZHupHMf7pEy6pumrZfqzbLSAp7Y5fSl5EVpR4P0V/ZZOlm5FJ5N8xXOnht55NICt
         E++JpQJ5Z9audvoLjhWgcoUoYXeZiPsZl624wYwdjm2Cb6rfNhoxESqhyqLV3NURsM+t
         vjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508393; x=1743113193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+DKgKKe0d2S0aLSGa2DZ5AxLYPiZ/5bN97M2PhD9xQ=;
        b=b8AlkxamMJFwIe2Vr3bZWjSn7zinZMDDxSsM1nDFNbx8JV2NhxItN9ln1HxusxjbWi
         YHrbXABa8chPrnsQemUerYTwqg9Ui6kbrTAqoExbpxGW1m9q0TnuGwBJ4KnzyH72TRH0
         Rx2p5F6JFEPdzbSyxTMbh69aCGkYKM59rdulGvPn4mCqT48AU7+94k+vOGMAOysZPAd7
         uIG6wiAV7bpa0GXQ5yAWi6ERSkBBzMsQG7jEiC58Wur9PJJ9GY/IAnCogfshTIepZgKF
         LfbeZ+/KmVm/gVQoi0+fj/ecul5AKvcn1cXVyWadQrXOD4Of7ptHM61EdGKMrIPHqgRF
         Xtcg==
X-Forwarded-Encrypted: i=1; AJvYcCWXgPsOAtX9t8GyNg+xrDUSStDKF4KPOqtTnaG9YWH1bEph9zP0rhZHqu9Z1fboM/MrzIzebIXHgJ9SeaVHfGLM@lists.infradead.org
X-Gm-Message-State: AOJu0YxMspawqEfRNuGnoyStnFmLX8yC+c7egiEMHatvpwBB30r47dTQ
	zxWwvY7zmebmQDyjppeZgC/Iopl+NM7TiZq6WcziB/fm1Nqv57MKadEPaagkiHoIH0vn1gejrkd
	T09trEg==
X-Gm-Gg: ASbGnculpFcoXiRGlFkz0j0lkqhMO2NloQ6AD3V72OFd54uKySctJwJm32B0v3yVKbf
	+P7HRz6xA5UW5wjTSlGRMAI12l+DRFv8VshyOPgz4cSGDhPMTMoq1DfDmsUTXuWUpULYMnYLoYn
	rSDd3BpC4gTCwHMRPFUdTdW7ijG+DLehFoQEPwgaYCYIFZxD5sDuzUeOoHx4a2IfEK+9wdr8bBN
	s5cYRBsTES8HMObFUjgZg5tPnwCkYS6npdv7YXvgoelFu6a1lCvxOUtBGiowqMHqqZkJY1pQIYH
	uQOi6KhTx1Me68X+40JTdv+Aymc8uI4GLdS87iPesbQ3BSHk2lKGljdMFiLzyEfAR1AhmeAhggj
	R80/x1BgOLA==
X-Google-Smtp-Source: AGHT+IF666w+fhi7xMb+8oGJRC8UIY8sQphK9beWqbHC+xtVyIDPE6027D6kLOQ0WtAFbDSaxhPr2Q==
X-Received: by 2002:a05:600c:4584:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43d509f433amr7194745e9.14.1742508392863;
        Thu, 20 Mar 2025 15:06:32 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e64casm662410f8f.73.2025.03.20.15.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:06:32 -0700 (PDT)
Message-ID: <7dc8700f-0d53-45f5-bfff-2bec71c7053e@linaro.org>
Date: Thu, 20 Mar 2025 22:06:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
 sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <U9NTFHDe_r-uUozJFJGmc7VpxMDx39onKby4M3B_sy0jJ2fr7-iXkS801m2slu8PXanf7Y7faBxuZ8fzWiKxTg==@protonmail.internalid>
 <20250320055502.274849-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320055502.274849-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_150634_840892_2A67794A 
X-CRM114-Status: GOOD (  14.75  )
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

On 20/03/2025 05:55, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..32e8d400a 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,16 @@ opp-128000000 {
>   					opp-peak-kBps = <15753000 1>;
>   				};
>   			};
> +			pcie3port: pcie@0 { 

Missing newline, please check your dtb checks.


> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>   		};

Why is pice3port the only port to be enabled ?

What about the other ports ?
>   		pcie3_phy: phy@1be0000 {
> --
> 2.34.1
> 
> 

---
bod

