Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440E7E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IW/1H+wBsYHEd+yu91SFC/VMNkW4y30uxY2FjxFoA0k=; b=vj7RyunJOcH8qUM0p7jqU2i1pD
	e2SKXCgSNO14PpWeWdFCETbRIG8A2kOFizv/ffP70sdRYJ3SziwFsCP8B5aT65lhLF3iKMFCBrSXH
	iYFudAtQt28qF53q7U25XOaRakAzlMm/cN9J2tx34vFiUF1h1Rjr7QpQ3+sHf9kHd/LVbP7u6lHQG
	0Jx5qp1eYqt43bBEpvuY0SMoa8Ih10o/ZJeAVHdr7g3/2aofGL9O0jJ+HF2yFc/Lrn0e7geTjlGns
	dvV44qwcoxJJMRWj3xihqSl1Gj05CC3XKgtVN403T6dLm49L291avdKN69Lm0ys58S8x4zF4EGh/q
	AAGy2XgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMHA-00000002rxp-3Tol;
	Thu, 19 Dec 2024 19:33:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMG3-00000002rnX-10sP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:32:28 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso96542e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734636744; x=1735241544; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW/1H+wBsYHEd+yu91SFC/VMNkW4y30uxY2FjxFoA0k=;
        b=Xa56Ro9cKudrFtJK/NVK5c3HI/ulohAShCDfFdmzTBxJeyMgRGj+IO9AgtieMkv3GX
         lKEXmlN6jzm48LyBKQ5hJd9gfaUqIuRz4HNM8YR4vk7eZUChSird96E7garkX57emq6U
         7zKB7gdJZ7JFxJ+yfgIPADR3QLZTAfjx3DfmZ2TohbYvXuizXv+Fc+ln9Jtsg5GBULrx
         /1pvxLZHjRxzi2gAMxRaU0x8GMEUJhp91SUVBhTu4Tpqmigyh1RORC1CDWqWRWds491Q
         WbcgUTJwyppggtn4i9HLEZPvWyL/f3fjNhOcdOgmGWvXdyz+dJlqxz5uzbhHuSXektzo
         W7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636744; x=1735241544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IW/1H+wBsYHEd+yu91SFC/VMNkW4y30uxY2FjxFoA0k=;
        b=YcyV+J9OtXWkDAcIOzcW85rgESQOF5N6TI2+wzKTgkWh5x//gP/P+NapYZRMnXIBC3
         DjG1zoaYykjrUscEccmx3GEoADgHAY+sho0j7JOcQeYyA2FD8r0ztozru22NzgWE+Xy2
         oswJUrCAsqaWa3EVvpzHAwOBkpDp6H7pYolCbwK0IXWF4QAiD148ci/rG4NDbzLhGPOu
         bp9dX0ZE0I27slgdPpGWoh4AIBLrw075MFTtaH29nftQ0dCtvUKMBOJngtZOwVpmjnkP
         rFFM8VYWSe8JXnD79RzV0jifnLi/0SzWI5FZTidwCYX1oeM86x0PhnlbKvKywP+cXY+A
         GUxw==
X-Gm-Message-State: AOJu0YzgGPmDtekZQiUuevFcMFNB/Mvdq1ggNj/B6d26JDnZi57IPKdZ
	ZQUvtsRdyVoIR60pXL8jFOrkBxdi6x0wZdzuzmw4uz7kq60gJqshwACb74xrkHo=
X-Gm-Gg: ASbGncukL5/ztaHwGySt/aqV9c5Q1Z+e0VUH/Q0u5Y0nrp5Q9NlZgibFcvEoN0kKXC7
	OkxrapBpIowOeXWtOodDMLNfPXqaxEi9cVOtO0gQHjH3K2XZwUnfW0zlX5ca1PUffsN1gTVVro/
	cGFAGEvT9xQLEmfYKDS8Ovqy7fn/EpoRWkoLVOeBI9XysAduMTnhOyn+s90KYbDkKykvncadA8e
	ca8h79GKKmzA3fI8Y4qrW7UxdDRlL/QgvmVphoo00zAQiE5W1ziacAGjgtqjMRsLllh/T4cT9pM
	lu7QVZ+ao8cyOZvL13NE064BG5DzIaEuKYY=
X-Google-Smtp-Source: AGHT+IHUvBst8RiUn9IST8/5AjNtAtHUWTb9tBGd8LLvhOk3TajPDIYTYMQtaGEJvz/fTfQPjsQaIg==
X-Received: by 2002:a05:6512:398d:b0:540:2aeb:5d3c with SMTP id 2adb3069b0e04-541e673d7c7mr950150e87.2.1734636744478;
        Thu, 19 Dec 2024 11:32:24 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5d88sm256403e87.15.2024.12.19.11.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:32:23 -0800 (PST)
Message-ID: <c7253f5f-eb4a-4636-b0f9-7d284a2f5a8d@linaro.org>
Date: Thu, 19 Dec 2024 21:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
 <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_113227_343584_C84B1FF6 
X-CRM114-Status: GOOD (  18.20  )
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

On 12/19/24 21:06, Konrad Dybcio wrote:
> On 17.12.2024 3:40 PM, Vladimir Zapolskiy wrote:
>> On 12/17/24 16:06, Vikram Sharma wrote:
>>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>>> Enable the IMX577 on the vision mezzanine.
>>>
>>> An example media-ctl pipeline for the imx577 is:
>>>
>>> media-ctl --reset
>>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>>
>>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>>
>>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>>> +        rst-pins {
>>> +            pins = "gpio78";
>>> +            function = "gpio";
>>> +            drive-strength = <2>;
>>> +            bias-pull-down;
>>> +            output-low;
>>> +        };
>>
>> I have doubts that it's proper to embed a reset gpio into driver's
>> pinctrl suspend/resume power management.
>>
>> Konrad, can you please confirm that it's really accepted?
>>
>> I'd rather ask to remove this reset pin control.
> 
> There's certainly some appearances of this in the tree.
> 
> You could make the argument that it makes sense to prevent misconfiguration
> (i.e. the bootloader may set the pin in input mode), but then the counter
> argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we would
> expect that the driver uses that if the GPIO is requested through
> e.g. reset-gpios.
> 
> I'm not particularly sure what to recommend here. Krzysztof?
> 

I'm worried by a possibility that a device reset/shutdown control GPIO could
be turned off by entering the "sleep" pinctrl setup. If a particular GPIO/pin
is off, is it still continuously functional as a control GPIO of some device?
I believe it is not anymore in general, this is my concern here.

--
Best wishes,
Vladimir

