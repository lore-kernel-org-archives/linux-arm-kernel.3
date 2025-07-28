Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD9AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GySiiFaaabiZQ4Il8d89HhZwj5V40q8muWzbkZdlYfk=; b=4nffjeadQ60os9H0bD7jnwm5SF
	Y096RfMvUbpSh4iEUrQTUjNeziHZ670+F5UXpBxl/hy5vTDs9XIVJ/U5vz791fPVS+MqWXr+lmeJh
	V55T/KquCcAw6ALpFB7DL5jjhKGcXRddYrxZH/pYP6MVIrZ0y7L+ROeI0kUnMcAF1hr+MymA7+A9P
	3uKWjxVzfV0HktEDUQSJgm6JcoVIcW4sjwNvCTFBwXSOeJpX38yNK+uDI3MYi/lesX9ZHcdrrFyLX
	0DTaaLv947cHbXIPLAWtol5xYvDzCB+Pf/kHK+GQ3RTmvk6sHZd8ZnrclkwbYATXGRToTYP4oXylJ
	RU0nWW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOOT-0000000Eb9h-25Lw;
	Mon, 28 Jul 2025 13:59:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugODY-0000000EYxu-05kj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 13:48:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so27441395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710518; x=1754315318; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GySiiFaaabiZQ4Il8d89HhZwj5V40q8muWzbkZdlYfk=;
        b=eP9FOnEgZzGYFqRuk6j0CU5ZdChCIs4sc5UVdxXm+mnBGqyHtnwbSkt9AJgwMoGQ3C
         USYYBmUsxGG4QITbq9oe4vAMmzBAnKIB/uV+lre+NoCoP7DshHompZ5QVO3qUozgeHVT
         neUyYEzYsUc7SPaP/N1PaJSykdVSKmyc4p6jvAnKVPDutG5sM+GSEdl92ChFUQ4RLlEo
         ICZDVtnXeR8GZ2Z7maIRQqAvNbFNi653OzyyW+cXgiz/qkrF73RM3H6tOMy+aztyqUsC
         4zKfHSCtz/zcBIFiMNZJCNK+VFMYFuHmx5R6HSgNrpIPbr9hag4YFDVc1Bmk8V1KEiUF
         phbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710518; x=1754315318;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GySiiFaaabiZQ4Il8d89HhZwj5V40q8muWzbkZdlYfk=;
        b=pqjSGE7m6UkCT9Yv1ciZdflC0QXFeH4gvVaIVSMHLsSdTZRr4hVrtRSe0sJVGWOG9j
         r8V3KbhUCv5T/bvhqRMpTtwYLDr05rEyBcy0iGSYbVdPKaG7qxIu3AFlkJESSbAqQ4wc
         vU6r2I36SuUzgnRu2Ghz5PBfs8FO1qEXtsCx+wosdhwNCkcyLu8N2nRh+nQ56+un86sr
         4I7w4pNhS7hx8hEBDLUrVbIAq6Zeybz9wvsUiohEaFrT8jpdqOD6ACrh0vQOJoU92q3V
         dMXq/XnThPVHMaPJm8Jo1Q9phpgojLT+pCCmznT2X96mwnSwoi0PS256CoelKyvsmFGh
         Ixow==
X-Gm-Message-State: AOJu0Yz77mQ5Bp7gAFuqNO606xHfiAC/DNxPNBUaG5b4bSKkp13Fds6h
	mly/1mY6yrqtCNEnB8hQ96t9ptWOiinZlrYQjTnb37man3XWC0rLypto8bpBqdgUxfs=
X-Gm-Gg: ASbGnctQmYNmXKFMuXlPWmOdEDR+5MpX09n74cCBuOyMPwthx5i1f/7iuxHJTvCfcck
	D0VZsG/iORujIAXMw+K9GU1RxsNZq++H9ZOaXtY3efqeErjU2zagJyGHvNvwFqF++mOQGSi+AYd
	yw/4uoOW5hiLEfKZYt3sfHAHO3GWQ1LfJgBW4WBs424dgCz6G6NfHcJJUWINQnduh29iXwiiwRT
	e6siMvxRaPyWpzu10GGxSNGqOen30KCz1qJMZNE3U+vD4lmrdtJcJ9Euy187zTrsTk0kQ0R8nyG
	VYciW3rG5v0e8L9rpBD+werUWxvTr5adVVqccXSbW+cIhn5J4YRXdusMLU2idUnF47/5/1786bn
	vRZcoxlrf3qBmhKM43BAKvab5dcA14f42TxvBFGAFbv1DxOcZF+rTYS6j/LGfFxI=
X-Google-Smtp-Source: AGHT+IFc0a/dVlHIMLVOyP9kKSGycnWL7vZKmINSvzq5X/lptb5FMCqb9vFSczBjeGl5NDbg5XFrqQ==
X-Received: by 2002:a05:600c:4f14:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-4587a6ab65cmr76381245e9.8.1753710518174;
        Mon, 28 Jul 2025 06:48:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587ac66ed6sm100843815e9.28.2025.07.28.06.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:48:37 -0700 (PDT)
Message-ID: <ef93c737-1a85-4b8b-bd70-5dcebe0a1f18@linaro.org>
Date: Mon, 28 Jul 2025 14:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-5-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_064840_574941_4059DD8A 
X-CRM114-Status: GOOD (  14.26  )
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

On 03/07/2025 18:19, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara<quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara<quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 185 ++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index fed34717460f..38ac33b082c8 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>   #include <dt-bindings/clock/qcom,sa8775p-videocc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
> @@ -4345,6 +4346,190 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		camss: isp@ac7a000 {
> +			compatible = "qcom,sa8775p-camss";
> +
> +			reg = <0x0 0xac7a000 0x0 0x0f00>,
> +			      <0x0 0xac7c000 0x0 0x0f00>,
> +			      <0x0 0xac84000 0x0 0x0f00>,
> +			      <0x0 0xac88000 0x0 0x0f00>,
> +			      <0x0 0xac8c000 0x0 0x0f00>,
> +			      <0x0 0xac90000 0x0 0x0f00>,
> +			      <0x0 0xac94000 0x0 0x0f00>,
> +			      <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xaca2000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x0400>,
> +			      <0x0 0xacad000 0x0 0x0400>,
> +			      <0x0 0xacae000 0x0 0x0400>,
> +			      <0x0 0xac4d000 0x0 0xd000>,
> +			      <0x0 0xac5a000 0x0 0xd000>,
> +			      <0x0 0xac85000 0x0 0x0d00>,
> +			      <0x0 0xac89000 0x0 0x0d00>,
> +			      <0x0 0xac8d000 0x0 0x0d00>,
> +			      <0x0 0xac91000 0x0 0x0d00>,
> +			      <0x0 0xac95000 0x0 0x0d00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_lite2",
> +				    "csid_lite3",
> +				    "csid_lite4",
> +				    "csid_wrapper",


You can add my RB here with csid_wrapper as the first register bank.

The reason for this is CSID wrapper contains a mux for the CSID register 
banks and so its the "boss" so to speak.

Please update and then add my.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

