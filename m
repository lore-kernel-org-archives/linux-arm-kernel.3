Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088A4D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2DcE5/95zKMGcm5PK6kvg2lmrYchM0TUglmEw2Vw9w=; b=Lxyiiuhfh5Fk6B0rk36Dvjh0YA
	pAnDubyYuJ4fuEF6Gvz+XDw/BfTfpcVZzjODDmyvmEd/5zlG4ydUP0k6aS2QE+yLV5uCqOeiY97XD
	MyIZomNB4rMm70oDvU6/x6S5teqdRczkQZAMlWv9SOu8IkdE+Rarpfg+ww6IjpI/89Y3afFsNPjVp
	FLU7BTUg+Q2pFsshiG5IQEP4uHS1WbzrpPrQibO8yv6T6NIOU6z8LGdWiyIS/+X5R73uBFndYx4wo
	9gRg2UeBkxxSeMvoJBZMkYO35MoRkcmhVywYZczbGU5YsjK+XZd3haI93ZbFTJ9LlYwF+WzmZirSV
	aWUITeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPNE-00000004qBY-3Flo;
	Tue, 16 Dec 2025 07:21:32 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPNC-00000004qAp-0BCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:21:31 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37a33bd356fso3578311fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 23:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765869687; x=1766474487; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2DcE5/95zKMGcm5PK6kvg2lmrYchM0TUglmEw2Vw9w=;
        b=EBtP/JB3F2XhD1dATvJgly8P3k4DtUTJVkTezIFYFw2nLVMgaieWgO6vcog+AZ6Y7A
         AtohAdUXEt58/a72+ut4+xhCfQ4WUJAMxHMEJZlQFNTb1lGTDPbkWu1v9X/dftkAClgQ
         fIwmY9Zibm83VAG1fEPQKIqYeHwdrjp1/+qA5t8uil+pmlUcQZcOdms8vHUko9/I/YOM
         05yO/9YTnwQoEIowS/hNVDoSmbevp1HjNZdr8I8CHcyXvDHh3pFKt4L1QHA6FYHqZWAJ
         1T4FQX37WurUWJjR/aagsZYh2vGomUrOh7dU1PTGr4zEzU60W2YDcFRURNw2G19Skd9u
         OVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869687; x=1766474487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2DcE5/95zKMGcm5PK6kvg2lmrYchM0TUglmEw2Vw9w=;
        b=r5kdiJifpmG7GOBu5qtPR8k3CjmjGxXV9VCla8DZ4rrPqSshZzhrEotuUDQTfaXyNl
         5eBE28uPKgEqMKm8Okp3lGPhVuUEochOdySZUaYFSLcOeWRip1w4bvOP2uYcZuUSmbOp
         v6jKlqqKaocrHeZPpI1e6jmnJtVvA2PSfTyRIVmfAatBpShfMWkVRv//buSiF6/+fi+e
         jLD+uaS6knZuf0XvWd1m6/KbZr68gqLfmfe34OIpOj61FLL4QwC7OR+aconXaHgP5l9c
         D2TrZQsUzOQ6J5Te03uAOJF1waSN1hdDuEF2JBgwrbaXUoGf0JQM/THaNd/u6ofICPyd
         P0uA==
X-Gm-Message-State: AOJu0YxGKel7bbttAAS6XNCFRmyj9x6Bz/E5LRh0a+Cfw0zAa+86HXCj
	CKQ5jW8fEL+bBf6UWSBbdBmISUk3ptqud9eDTG2eFVuH1n8tuGrJoUnzP1ng2tV6RSc=
X-Gm-Gg: AY/fxX4NxOlzAg28ZOjkYk10QiMxyEE5pw4cRoemUrqLJzFk61GX/jn2txw7+NtReY2
	cIGYK8TlRbX2YjR6fVb+9IrZVvCiJKG7jEVXff+D/VDMABhpMJ2KMFbE4ctQ/Bd5naKR7RUZOVC
	lxNFOSHqA6ryDyozV+CXU9m7VeLhWfLdRHOYfMYkb/V4DVahb0qFnjSrL9w8GYw4x5c5UUGQdLu
	VXK6++1/VNHYpIVTGNDQHtZjUMDlN8F92O8Ln8numN9fuaM6lktlDfOK3bc6D4xpqm13+FFUm3S
	Euf3r4mCVvwXG46bwhLmP+TNPswgx2+ex7AzI2inUBlWKE8cTNZTocVTdCbieaPYtXytgu7UgCX
	jrH2wzDCLsrae4etl9vkBy6WkPQgVe3LdIZME8KjKNrPnZtoGhJnkKr6GrKBhZOW/6uQeMMkbwS
	D/I/mpnuLOrWwn0rS3hEOJzKyintDH9X2rdjipXGD5Za51bq85Xmap+MfAa3B2rXYifg==
X-Google-Smtp-Source: AGHT+IHNMgsgp9u2yPWPCiPcD2bTZmOe3omll5Q5NDvnxjcWG7cZCuUSmQe6KNVWP+5AylmWofEkEg==
X-Received: by 2002:a05:6512:3d1b:b0:597:d7d6:398d with SMTP id 2adb3069b0e04-598faa01850mr2816802e87.2.1765869687301;
        Mon, 15 Dec 2025 23:21:27 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da79110sm613437e87.101.2025.12.15.23.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 23:21:26 -0800 (PST)
Message-ID: <87815e05-737a-4051-b139-499f388cc144@linaro.org>
Date: Tue, 16 Dec 2025 09:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Content-Language: ru-RU
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251216062223.2474216-4-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_232130_108684_5C83B07E 
X-CRM114-Status: GOOD (  12.45  )
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

On 12/16/25 08:22, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Monaco.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 4b2d8a449b00..ace09239d167 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5182,6 +5182,27 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio69";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci0_0_default: cci0-0-default-state {
>   				sda-pins {
>   					pins = "gpio57";

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

