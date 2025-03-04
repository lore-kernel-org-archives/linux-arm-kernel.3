Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSm1lg2/FkL1yWeHeKV4bekvslQt2WvmtVqn6o+tUnQ=; b=yYeZvQZZPE/l4Fh+Gx4V8rLkq0
	JxgZvOwWCI+0kkRCLWBbT527oevA25OWMH0BmXqEE/bPpW3XP7ruKJqZGZ/eb9LwgFxTsvTamhPF+
	AID8DUsK2QpkGrSsl4dIlS114ipv8xCkisOhmd35KI8sMVVJ9s+ik6PnmJmEukOXEV6VeFkKIxx58
	8ALJGKDLFvHYydHjevFEZZFeUwelooaJ6PNosujg1OtKGK18HysPk/q9UBSZOV4mqU4nMD+LZwTg7
	YxVrgBV71ko4E/kdPYtfj7Zbzc9Rtp8YkQNVLy2Xe452xBLpzNM1W8Bjbn0YzqzTq/tzmaJMUCSZ4
	yHHrn+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOw8-0000000401R-3zKs;
	Tue, 04 Mar 2025 09:51:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOsP-00000003ykz-0l1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:47:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43995b907cfso34471425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 01:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741081667; x=1741686467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSm1lg2/FkL1yWeHeKV4bekvslQt2WvmtVqn6o+tUnQ=;
        b=lKD228HxOCYnV/W4DMb3iuskQR816t8J7IAoCBFAW6X6RD6QzdQ1GEvftv3foBH9HN
         HYM0BAOu56La+bDUGrrj070hTRVDlng6qMmT94ud27Gq8iwjU3NLb2/7x2+9HYDoZ3VX
         Oz6ygVQblA+mUvwKgTXhO2JkKq39fBBI8pk8FWV6rCrUmEXZoMzGQRy9k9RCJCzEK4nH
         NFfPSisvpJOZH+xYgBgJDzUl5zr/eG6cEaC9cU38wSPG47UrkyeRRPBoIdoI/ja7urX7
         2PWiJE4Vr+KHKnYNzpAqljEfvpqEJEdZ99e5p+bJ+vS6aZa7LtqP4i+2zMKdRJz+/jb0
         qgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741081667; x=1741686467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSm1lg2/FkL1yWeHeKV4bekvslQt2WvmtVqn6o+tUnQ=;
        b=jXxFxkJrSkETQMoFhOM1ORDfZf4p+J9igRHRQ9HPnP10OtIfKn8sqTMFuo9ishOXfG
         4+iU2J+9BcPYj1OO7d/bzl+lnwrPY/ZzsJx53sXf+6ih6zs6kklHHH9cSqN5fItXGd7C
         yMrQ+hsj/utYTsuy3QA1XJv5WlEQsOy2VhUv7DzIEgFNvP3WxUmycU4Rk3CeQTsbHb3+
         xWdugCfxXPchkBwrV2S5HWxp7IW0Qz1ey1FnxrgnxWNXmoMast1MdtJMd4/HX35j9by/
         4ubzW3vVS0oQZEHNtHBCuTzSY34C+/a+cxtw6Im7mutDc7Z/hK4tDnkHqhTJYLzq4GnJ
         P06A==
X-Forwarded-Encrypted: i=1; AJvYcCUqnT4xbclX3xfJMomdswVllV526NaQZ8ugMM4VO2x7ZlQJ6c9Tq0BzFXnk2Hs1gDQBtNC1CXQPedotamQQCKs4@lists.infradead.org
X-Gm-Message-State: AOJu0YzAedwPOJNUvoXXRP4UGVsB7hm36qs3bUJtsyShGiTElFRJxAKz
	l92ZrrRSHWlolbAkpKtaIC1rsx9b73Hc8H4/G2+NYzEoEG25Eg9SttenHpAz6AU=
X-Gm-Gg: ASbGnctMXo1k0sYO9lYW7PDiCedjMKH9AtVnxuQuyfg/cFvNkRfayBylanJj3ulNMKh
	QB7cyg0oeMyDsM9u10AUSrkTTL/H1bIHN3B+R1yGJRF6D8A2zAlWFmSz8PY+NGSlBG2MKL01elP
	wn2eqOvl9JNMjk0nNhp5npQVIVIVrIZna1ZfNivdqBKOyZglqSd+m/SbEhnjjH4u1CToixVnot7
	21+Md2zcjtwbSVo5/YXBqj+cGZHZchebqYyc5Y9R4Tg69N7AdvxnZkFGscY/awr2oF4nZtzF6c9
	u2IxMkGPSbDCFBjIY5nAHa0LwDWI0QMvPBwXBvzwe0IvM5NJTFme+WgFKUjIlYhnYMNcapXEUOi
	bsEHXoBMGgQ==
X-Google-Smtp-Source: AGHT+IFDmnK5YYmULhWYfPkCzV4REgmiXkQRXkNfOTnHTpTo4USjUT1kKhF/sQF1HrBw+vy8AZd5Qw==
X-Received: by 2002:a05:600c:a03:b0:439:9b19:9e2d with SMTP id 5b1f17b1804b1-43ba6702becmr158936035e9.16.1741081667192;
        Tue, 04 Mar 2025 01:47:47 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e13fsm16964961f8f.100.2025.03.04.01.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:47:46 -0800 (PST)
Message-ID: <f5c2044e-e78e-4839-9c29-63610ff406e2@linaro.org>
Date: Tue, 4 Mar 2025 09:47:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org> <Z8a7cMmxJuHIhgjo@trex>
 <baae2a56-5299-486f-acf1-14fe13fd2f81@kernel.org> <Z8a/Dk7zjZ7RQT2/@trex>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z8a/Dk7zjZ7RQT2/@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_014749_228076_1A69F0E1 
X-CRM114-Status: GOOD (  14.70  )
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

On 04/03/2025 08:51, Jorge Ramirez wrote:
> On 04/03/25 09:40:21, Krzysztof Kozlowski wrote:
>> On 04/03/2025 09:36, Jorge Ramirez wrote:
>>> On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
>>>> On 08/02/2025 23:51, Vikram Sharma wrote:
>>>>> The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
>>>>> camera sensor. Enable IMX577 on the vision mezzanine.
>>>>>
>>>>> An example media-ctl pipeline for the imx577 is:
>>>>>
>>>>> media-ctl --reset
>>>>> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>>>
>>>> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
>>>>
>>>> Based on tests reported on IRC I think this might not have been tested
>>>> correctly.
>>>
>>> I acquired SRGGB10P (10 bit packed) frames from the camera despite the
>>> pipeline being set to SRGGB10 (16 bit) samples.
>>>
>>> so something does not add up.
>>
>> Then the commands are actually correct, just the camss or media behave
>> here a bit unexpected?
>>
> 
> setting the pipeline (CSI) as SRGGB10 (16 bit samples) as per below
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> allows to capture SRGGB10P samples (frames-xxxx.bin files contain 10 bit samples for the size)
> 
>   ==> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> 
> shouldnt the CSI need to be set to SRGGB10P instead?
> 
> 
>> Best regards,
>> Krzysztof
> 

No an internal media bus format MEDIA_BUS_FMT_THING is used

See

87889f1b7ea40d2544b49c62092e6ef2792dced7
5480b0c67f120a6c293cc5eff72fa1d6a74de504
3c1dfb5a69cf836f513a2a49113ee946a4b9d95d

Yavta is specifying a v4l2 pixel format SRGGB10P which then gets 
translated into a media bus format MEDIA_BUS_FMT_SRGGB10_1X10.

I'm not sure what the historical reasons for that are, probably good ones.

---
bod

