Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86A7CF6AB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=; b=Vc1JXtw7O/QJlbtKPPk6Ic8bgR
	vFBfeYm7Cthy+cpMau3xaZlaFqhvfUOQsPaYWaOmOFPOZZMFoam2fN/nuk5xaofYjch+FGhKDXvQQ
	GPxhqI/ymO/Gn1+G93dz6+PSjL+nevVeNJit1E5jKBXXBESrgBVw7GbV5U7yxUMjJ6Hp0Kzdu7OK6
	fBSRHBTsfL+T64ZX+MfsKAjWec4he7I2rAggPWlbBYXqo7FqXoP5MOb3bsaxR0jNC7AAdh/fncxTc
	3MK/Vq8SL+g83enprDAhosExxmv/dVO0bJHK4Bhhhk93YLpBctsNT+x9DsOtE8uSb8ryLfwUIaVzP
	4+7he6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmYn-0000000GVRi-24DI;
	Thu, 08 Jan 2026 09:44:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmYk-0000000GVQl-0ZgC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:44:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084chSE2593311
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Jan 2026 09:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=; b=TnHFKNCVpjP7QQwP
	q/itYudfrtE9JK4odnA9oesUL9wCgxB7umvdi82dswmFdW4DBiEBKimPStLoGkr3
	bozxmndHF6KE1KZSNhHhb3fk2U/Z6unhDh0eZSksK6l3xLffJ3Sl1dN9OeNLENpT
	FGwaGsRquxE7WJ/kT0rKrLO0IDT2bYtIAcRu8uU8uRj9Zz2dl2l9J+HEdClN+ntE
	U8kalwfPdZRNqv3qybo1pA1PTkdz/C140AtvIw7g22DzJfRiIVRiK0KEtjnAYCxn
	ihk43mIJeeED1d2mQDx7M9XDa2gIdImJ5JNRNoCysDfA9THd5BknimTYXNR78TBK
	oKZZFA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2946tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 09:44:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so3442106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767865440; x=1768470240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=;
        b=hoq+0GJ9Ev6m8ALENoh2JzatAXLrgeSJMiyUj31TNsILgFHC0rQCD/jjh/jjYicW5Y
         jGZ4SHFrVYUKrovybVsKuA1ARLNMk/ciWIk8yw6syaCTBkitJoO0Aj3beNUedmUt/Tfm
         qaAiI0eQPqK8G35h3KpOIrvwTqwm0CmDEJPYQGcBwkHqc3qgReK7/6xO+XOCDOUpD+g3
         MmsFzfXtYVAf2JVFXq5DaFxrm51wFyFoaQKA7mklY4r2DoSRyShlfT1rYk48XCympJQO
         5KJmkKm72z6ne8Sl0ZlUTO5XwTP8o+2K2m0bwFCa21to6BDRkURcHfx9zFYF5JXo3jYA
         h4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865440; x=1768470240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=;
        b=AbPPJJajeIWDmEiWEVHLVLlHaBAyORbLJSrPJl7JonRJ08F9IQ+F3YgF14jtQe4m1u
         WInCQ6WKkIU5Chkh2omyk3mrslTV4ObmU7+1ALtBT3jRXrLZ0h9vt13427ifGaitqCvy
         f8CpFvIf2ckWrrLgqNRXwhaWzk1uuf9ob0rh306Yctjyd3nUtwPvMlJsq6DXHF4NUtkj
         4kkDKODFK9DrKqgZGNWs37AoFl6u+yCUjRwyaZBn0VLIdZlDKAWLWd7Zo5pUwqitbmg8
         rFHV/NK6JOvS62uBtU+WMKdDqUImXWVnZvNPGVdTVGvx7gY8wNI0BC6YeM4mjRs7cBuN
         GhAw==
X-Forwarded-Encrypted: i=1; AJvYcCV7YF6xcqDgGNHmm31DRZjZn8tx+A0tPBCkOmn/WOPeDmVLzTMMg6y1gRsZXvTwVQC2pdJEE1vkxiDnS6u5Rf4X@lists.infradead.org
X-Gm-Message-State: AOJu0YzPCiQ5RucaVDyBysbbgnKkFi1tEd4tfqp/F3QCiI+d+8f8zP1I
	zWi1xspg8xz40C5fzxtTahH7GtidVR7oX/VWCAeK+/Rpk+tS6BQsmGx7cw4JDTlTY7SB25C0DEe
	BlMxD7bh/38W2mO9zY9sAPVlg4GEQ/v7lOdpYKOrvp7SawLB+rFbruna4lOtaxZUEr4DxYz+TAq
	LTmA==
X-Gm-Gg: AY/fxX7FVY+sKIE0CznAWV38UGBtSzQtjDlyAKsER3up1O+PrnG6JYKutwEW9rHwZ6a
	S1KLpdaOHNBo80d5OC/czjf3drIBtVEtRkCOoTxA2cxEkMB9HcvwBOA0hJVrWkYX71uooD5Esyv
	kcRulUx/eMwptdmUnKxeatauQVhj/VIPlXAmNs2E1x8JeyN3IioUCRyW3wMD8GY/IOMSrSyFizC
	Fru1qlS5jUY5GYGfC5d3zCm9AqtZXAY16G13gOsp6/wFqlswDqbZjaSzkzaTpyb8j2/aYHJn/JS
	xYBcSEzWZRB2HI9hGEYMbC02vISnTK1095/2zoxkV6YkweCLUVmkGgxXJocvP2DqnHat35XvnZ+
	OQPB3FRIhAHj5xTZUmIlz4JhW931Lel4lbb+nsC+P9/+zAG3VCLCetsmZ5MnUdF6ZIGZcPAqglk
	KEmBdAoXx7kXKdkHts+wLpDqAhetA=
X-Received: by 2002:a05:6a20:1585:b0:366:14ac:e209 with SMTP id adf61e73a8af0-3898fa65f3amr5482062637.71.1767865440400;
        Thu, 08 Jan 2026 01:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4Co6md478Bni07LU4UJf1qlULZ9dhIAUPNNon9u4U6HztgO1NmE+JxLoEEQ4fc/5D13ilpA==
X-Received: by 2002:a05:6a20:1585:b0:366:14ac:e209 with SMTP id adf61e73a8af0-3898fa65f3amr5482035637.71.1767865439877;
        Thu, 08 Jan 2026 01:43:59 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm7461139a12.23.2026.01.08.01.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:43:59 -0800 (PST)
Message-ID: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:13:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
 <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: E0kiquIzAw4_XMxjj6s1g17HF26zLBg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NCBTYWx0ZWRfX2Gy60qF/z2SP
 /RxGAk3e4+wFBmx6t1fX5Q1kttXLP2glXr8wbPnkaVw9GpfDC2vG/Pu/FdeZBmoc8iwKQX2SWBm
 QXbG/rUNp//w+qEJCNtVXjZgFi53atbAJsDQwzPqFIJ94mDNkZN7gWCPrit+gBOaJ0xonhZkdMn
 rpo7WC6gQwLSd9WVX0dTaOPV6YCICkQEHV9xfByp27kRo3B4e9nsqMrRiojBx+q8hHD9cdS6P41
 9rFkeCZVElZ2tJpxFLhqnOjGyIiaUFeevoc4uXfDbEivwDX4WQB5WilcWnDVGUoeFJaFostVgnZ
 +GEV0kDPNGcOVXdB6jARdXLNWelDqGX03KbQnVYrhnm8Icuju6nJTX3ivyQdUxpR6euRU9VT1dP
 tq60HkRfN7OICNtlecm9d7H0cbVw6S1dVB/4YIAlI5n46tu434ySIh8C6/CsVk+dX6eUK97Xfv5
 KsXebmniqQiyD5Lerxg==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f7c61 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3ijyyCfgxb-kCMGLBNUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: E0kiquIzAw4_XMxjj6s1g17HF26zLBg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_014402_210815_63890861 
X-CRM114-Status: GOOD (  21.55  )
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

On 1/8/2026 2:15 PM, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 7:49=E2=80=AFAM Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
>>> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
>>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Some qualcomm platforms use shared GPIOs. Enable support for them b=
y
>>>>> selecting the Kconfig switch provided by GPIOLIB.
>>>>>
>>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>=

>>>>> ---
>>>>>  arch/arm64/Kconfig.platforms | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.plat=
forms
>>>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d=
8cb3fd0f29e277af94f20 100644
>>>>> --- a/arch/arm64/Kconfig.platforms
>>>>> +++ b/arch/arm64/Kconfig.platforms
>>>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>>>       select GPIOLIB
>>>>>       select PINCTRL
>>>>>       select HAVE_PWRCTRL if PCI
>>>>> +     select HAVE_SHARED_GPIOS
>>>>>       help
>>>>>         This enables support for the ARMv8 based Qualcomm chipsets.=

>>>>>
>>>>>
>>>> Enabling shared gpios is breaking hamoa and glymur boot on next-2026=
0106
>>>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking=

>>>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/j=
ob/24722#L3514
>>>>
>>>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.9109=
82] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_l=
ookup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace:=
 <4>[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    =
2.911030]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwn=
ode_gpiod_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x=
70/0x150 <4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]=
  platform_probe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.=
spmi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulator <4>[ =
   2.911043]  really_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_d=
evice+0x78/0x12c <4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[  =
  2.911049]  __device_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for=
_each_drv+0x84/0xe0 <4>[    2.911052]  __device_attach_async_helper+0xac/=
0xd0 <4>[    2.911053]  async_run_entry_fn+0x34/0xe0
>>>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  w=
orker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2=
=2E911060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 =
not found, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x=
20 <4>[    2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.91106=
5] qcom-pcie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3=
>[    2.911069] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed=
 with error -2
>>>> Reverting this commit fixes the boot on both platforms
>>>>
>>>
>>> Hi!
>>>
>>> This is not really the offending commit, it's a recent one in the
>>> implementation. The issue should be fixed by the following series[1]
>>> that will be in the next next tag. Can you give it a try?
>>>
>>> Bart
>>>
>>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
>>
>> With the linked patchset applied I still see the same issue
>>
>> Pankaj
>>
>=20
> Is the gpio-shared-proxy module available? If not, can you change the
> config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
>=20
> Bartosz

With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same

