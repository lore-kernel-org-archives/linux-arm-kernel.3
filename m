Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EFDD609C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x4E8wiXQgWWhk51Xz0Izn5wXZBkvHxtPMjLjyfmt78=; b=u4Ag0bXmWj7T3KaJCDnQV/hx1Y
	hu3Jsqoyza6fO2JnGvQuJqfzE4KKCY6e/xchQuKct3C7GD8fWlHbNldyUlRwQYsd0p+KKRaxYxa4H
	tkqw9xAnIIG/jCLw4NsXyQ4gpfWtUJaVNc/LQf6/MMpZ5Ad9b3rqH3ymFF73pElgooE9AkNoYZH1U
	87yaofi5XRl8Ua1pEcLExTvLZY0Lt4XiDkJJiOuTh16csTqpFJ4eTVwNJtKQ+d9wIy1vOZ63zuQCY
	JyHmWR3z9lNVQt7moncU2+C37ETgKFFLehKyVnrb123jxnTOPoX1TU2cDqy1GtxnIWSYxH+KVXVjh
	1tn8pyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEap-0000000Cj9D-2NxS;
	Wed, 27 Nov 2024 09:44:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEZr-0000000Cj2N-2YyB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 09:43:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4349c376d4fso3939955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732700597; x=1733305397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/x4E8wiXQgWWhk51Xz0Izn5wXZBkvHxtPMjLjyfmt78=;
        b=nLXfaDEX0aRHetalvXJD7ZtRibZ7xfyidO4jeL4bSmpVXjcaj5VPYe22rkmtD3gwy/
         0x0KsPWba1N6t07axir3ruoRKiphk4Olo6YX0qvATED5G6w9Jq7Eg1roNkQBJ2ly482T
         TlKTahu/gMKNnk1+cQKmCfTZbAl5rTRGPtQ9SoHt3e4T0K9Ld/M1GRjrSLbeINvUCTs6
         kN0krOBkEs7Qj5Pt5c/KxqM6dBp402Jo/guMKTDjgB31gUuGx54R7goMltqH/zpb2daT
         WbVIWQL6Q74AbH0kSDobCQkyrmBx7pf4e1YvK1UFWFcESO6Rw2WcNj8HpYFvO0wSj8Ak
         3PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732700597; x=1733305397;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/x4E8wiXQgWWhk51Xz0Izn5wXZBkvHxtPMjLjyfmt78=;
        b=Yia2eEYK/I2EFiRfVwHVrnGfoh02HSTmxyoaA65elVT+x2wkhlzrldh2o1XdzjDwlr
         hdkgbqyxxR8/kHBVj/2QpYK/Pu+bnDHS24kpz/5OYL2XA1x667DZTBX3API8QnXjFf35
         SutjQqo350X0kUtIGWTZ4iKoeNYE3GHt88FD//O4Ju9QWN0X7PC7F5mTQJcTPRPYyedv
         x340toSWVLJgksCA/mzbX9pIIxBXSI694s/ReiF0ys5FH7jz9CUNBSBGb8dOzhz8yw6e
         ert3OihmJhSKTxlIjAUgLVmEqvpEgHdWXDyokptOzcKzWqq4YoFr+5i7m7VGLxoiCaLo
         ZCWA==
X-Forwarded-Encrypted: i=1; AJvYcCWEkCpgoAoY15WPMQM8u+P+GG9HUXZZ/6J1mI0d+j0Uh9bXT8fxYJvHmhRx4Tct7TiuC5SCKYbxKom4b4RTuXOA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9pDh5/ZAGZ/fK7IKJl93qg+DHo888ScLeQ+LZjeAhL3M6KS9Y
	jel9pTP9CN93k+7PMTXT/sBdPUP+3nj21aENSQI/hq7R0kcMgwtoTug+tEvmOP4=
X-Gm-Gg: ASbGncul4fhgTReHQWzcWLNV+3obOzZBRYGousG0iqOGNQeZU2nkGv2E6EYdhTRIYd2
	+++vbMHStcI+YBBn5IDbUPERq+lsE/KxBecxhYmM7XX6DuyqkjzSIBh6/LGuF+7P+P64Fkvd7lQ
	hWok/MK1g775yXCY76I/3R07oWu+vuFm36q4QUi24giFnRtpY10m8s7nXuhsVV+8Qeml+cmTJaX
	Tju4FSt2cjtbe3EwLeZKmq7vQWgFnAtwW4kE5GR499y16eRz1l6zwXLC+0mhcMLcm/a
X-Google-Smtp-Source: AGHT+IGW2kHkktj3j2eNCDXupvHHC0vvQtDZBn0LOqQ61CYdq4dYyGvDLQUw9Ne9ho7ByaeTK8Dqvw==
X-Received: by 2002:a05:600c:4447:b0:434:a0cb:6d24 with SMTP id 5b1f17b1804b1-434a9dc0c14mr7514325e9.3.1732700597439;
        Wed, 27 Nov 2024 01:43:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.219.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d29fbsm15165425e9.29.2024.11.27.01.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:43:16 -0800 (PST)
Message-ID: <3637deb7-3f64-4fbd-b492-f4642478c647@linaro.org>
Date: Wed, 27 Nov 2024 10:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: add initial support for QCS8300
 DTSI
To: Jingyi Wang <quic_jingyw@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Cong Zhang <quic_congzhan@quicinc.com>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com,
 Conor Dooley <conor+dt@kernel.org>, quic_aiquny@quicinc.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>, Xin Liu
 <quic_liuxin@quicinc.com>, Kyle Deng <quic_chunkaid@quicinc.com>,
 Tingguo Cheng <quic_tingguoc@quicinc.com>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
 <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-3-494c40fa2a42@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_014319_662930_906D82D8 
X-CRM114-Status: GOOD (  10.42  )
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

On 25/09/2024 12:43, Jingyi Wang wrote:
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_CLIENT_CDSP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +				label = "cdsp";
> +				qcom,remote-pid = <5>;
> +			};
> +		};
> +	};
> +
> +	arch_timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
I feel disappointed that instead of reviewing the code while it is still
on the lists, you prefer the bug to be merged and then post a patch on
top of it.

Best regards,
Krzysztof

