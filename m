Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD14D148A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=; b=xLlfcAJM9WTradmodV9n4SIEi1
	MKDw48ohvLWmugG732JvHMszco5aL5gOkvp8c6agTDa6OdLXc5FK+KC9kV30JoXobke2iyDG05wtN
	O66ecwpIaeUKH4+fnZa89sAicNrQavWqLnyBRK1KIhjW3W4osr40za2jh+q3dApYyZlaSQYAZRq1T
	cuWN6FgmqLfU1vDhDTF1/POPgw2D/K2ucncF+u2Dmr5YLG1xtboSFLu8K0EtgER03y9SO8aM7JMlS
	qiFiZZDqvfXIockzve/fNSVDgAANdcjnqkSPN8Rkp55Aq6TsQd7ZP9AVlFqUjCPOo/yorAzryd3L9
	rAtbkwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjpq-0000000G1Tc-2nuS;
	Thu, 08 Jan 2026 06:49:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjpn-0000000G1TE-3KJw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 06:49:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084RKGv2593336
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Jan 2026 06:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=; b=ZUenZjAU0swzmpON
	v9hwK34UB72PTyx19jiQaAweV0EUY+7ETCaUH51uyaZwlCNOY3lvMhvrsvwRSuTO
	62Ws1kq0CjhtyqIb7kWun0PIMvgK7IZlNaoaQTubw4gJrZAu1xSxm8h346emU+Ds
	5XMJYjlNhUO7ooIkC9dGEfQVD3u5bb+5AXDFgli+8OwhHOH04TyhLnjYqNsHrvyu
	rVZXj7J8F05DZHKy8S+MqmCvQX+eOWpicjVCvoi1RaJki46sJN+n00ktvN1pPX7+
	OJvLY8a9FCbsHNqFVJongXbVURD0/ZsFFjzgpfqdcFkUcAMoVYmKI65aQharB5UE
	Up/qHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn293njx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:49:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b99763210e5so3190765a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 22:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854966; x=1768459766; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=ckt11XfHfxFKo52NGGnhSrWt5wipYF8tqX9Z+lTvttuiI+ZtUBoIuCQN/i+/5X99+G
         6aGXoS6ATUWknE/O64mwuFmxBPF0Z/N+O9ZGrlK2QmLQScalKn1wb07jx10yrDdXcZhj
         pPQ8vMdUfoFkjIr5DVJKRLneNp+JoDxCUJ+9xeRPIFRJKTfpwi7/ip8GzJyMBsnqxqG0
         gwbk+SEWDfPt3yG0xsnYxRJJ5e2y5pFfwC8fs1QvQVPmsQtcz21YvcMJ0R8eNU0A8KKy
         8NkD1/u7+PLnjWFQ0P6HCadKp2m1gq+vQ3wTXXVpx/3CejFmraWLgRmezkUUjeLSpyGi
         uqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854966; x=1768459766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=Oz3d/LC0auAHfnofOH87Yvl5/yc5+s9oycM5qIO/d82HrNOllDu8ziRIiERZuSrZNK
         5ewsr4/CMm9T7EfvsQM2L+p+YgBvNxmjwMfxSzCpBL0OCKJ37au40NwFyfQA0FHtohaG
         3FDoxMcI4xR2K3fGIsxWhRVMzLdpTuYTNp35S0HoIeONb+zOGKBlxeojgMwbbUZbg9fU
         j+kX/pIu2xvXfaeWDCiPy1wl6kUmh+SYneI/L2DRIToSUvm+5Jmh6uJyMniH/R1x4zPC
         9Mj/kuPa3H+mZZrrTPmdOjdiWTryt9H8TbXQSYW2HyNoUiRtJNcfR7YU9vohLmml6/b5
         6jBA==
X-Forwarded-Encrypted: i=1; AJvYcCUhOR2Khp2NwNoIsoZi9064ylJEu1H6F63xb7IaMeEoxcMiQhUspsWn//sZB92qHUWm2uPCione3Xrd1U9pzutd@lists.infradead.org
X-Gm-Message-State: AOJu0YxcGKOnyk7X2mIAy4RYz5sU8LyTsbg/mB5kBEPutQ27ekqUKmk9
	Y+2ZfSoI3akZ2uMwP15Yn0vRfBSuXQn21DT3PQRa213uuCT06HJ4bRWLGxxNT+r2UFtJG1ytmKT
	jb+dR8HNlb1DLFeBCgERQn55slPOnMKAasxzEmVzwc3fjE//KyyYEVGnZI35p/W0SEWqb0vuFF9
	6ilQ==
X-Gm-Gg: AY/fxX5IeCbhEgiSyOJwZKtPBxJu0f6IbzRgRE1MeHIYegLy9mmiucSPlA61c1alVt6
	1244NffIidhDPS5GQj2rBg+paIiRXUfPlYKOUH8Vn7T9lAwsE4piy4AOf1oxQEZZ8o3NxyfAAcT
	42RV6pQG537Gffy0XuM25zo1iy2pqbZhuUapjgTMjMmvuSEWO2y+zu3bY06S3Llt5yS6WookIs4
	S2AkabeVLRdl0hlLC2BGw2ZX5sp/jQ2t/rgt2YzfDEtRqBQx5k1vHazf3Pr0wDRccpbb1zdcDb7
	BqSJIlY+LmcOqOOcmjHnu5IK2n4RkqlGQwSWvgyc4mCbpfPcxATJiAxsgKtDh+XXpmwQBxAgIN8
	bN+TOKhjBfstrUA6AfF3rU7HBijhnZ7uS7lDUNoBe85mVP9IyAl2KLSfxvR7a6l4B+l8bt2wf7l
	0dFWeP8p6EbWAKdj+shhQARouVnL8=
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665356637.65.1767854966474;
        Wed, 07 Jan 2026 22:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa2SdPaKLqYb+HLrRZM9A6ohxX3cBE+s5ZZnWlaUs2rO6QVISa1iEsyIT/QJ73LDsxfm5vzQ==
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665331637.65.1767854965984;
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm6894788a12.23.2026.01.07.22.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Message-ID: <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 12:19:20 +0530
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
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: NyxKF--QPjSAEhT_rVBctt4dvgCbLuvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MyBTYWx0ZWRfX/atXkkGZm9/V
 d+8aTtmtDNUew5XM+peVqyna9+yE06szTq9mo5NLkVR+NuhO6qS4ahreWSRX9xJcQol6UAaj7Et
 466i5ytfJBxUq2lsaUTyhqF8pRu1BC2u0Iyo6izGnZQL5DIGKGDXIYpceZ/ervWSEJ8lTDVhc/F
 xUgYvZWACFn/71uEDTnNSJmUIfQyUO0xmyGsM6zT+dSp8efOKl8iKcSkjs2x1Bjmf7nA7maL8JZ
 e3aamU7pCdOt3xTnMbQvUjlWbdISVY82IU1oDPo4CPWhG8KeEK6zcpkH29Vl5HxYlRErckpZJgU
 m50z7Y20SUu174MPKauMXPIcuTgcmYdQdcGIcylVCB2xLugaGjyTPoBFXFNllm2SWvFV0mDDeA6
 FaYexn3ZMAOJq4/fqA9BGK9oqq2anymkT3P29Tl1VFFhDT5KnUW/4iEjJFFWqYfz1JS5rPO5Yot
 b8GGYDClZlFG+55qC9Q==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f5377 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3ijyyCfgxb-kCMGLBNUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NyxKF--QPjSAEhT_rVBctt4dvgCbLuvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224928_483378_34AF16C7 
X-CRM114-Status: GOOD (  21.12  )
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

On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Some qualcomm platforms use shared GPIOs. Enable support for them by
>>> selecting the Kconfig switch provided by GPIOLIB.
>>>
>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>  arch/arm64/Kconfig.platforms | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>       select GPIOLIB
>>>       select PINCTRL
>>>       select HAVE_PWRCTRL if PCI
>>> +     select HAVE_SHARED_GPIOS
>>>       help
>>>         This enables support for the ARMv8 based Qualcomm chipsets.
>>>
>>>
>> Enabling shared gpios is breaking hamoa and glymur boot on next-202601=
06
>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job=
/24722#L3514
>>
>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982=
] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_loo=
kup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <=
4>[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.=
911030]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnod=
e_gpiod_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70=
/0x150 <4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  =
platform_probe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.sp=
mi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulator <4>[   =
 2.911043]  really_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_dev=
ice+0x78/0x12c <4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    =
2.911049]  __device_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_e=
ach_drv+0x84/0xe0 <4>[    2.911052]  __device_attach_async_helper+0xac/0x=
d0 <4>[    2.911053]  async_run_entry_fn+0x34/0xe0
>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  wor=
ker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.9=
11060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not =
found, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <=
4>[    2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] q=
com-pcie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[  =
  2.911069] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed wit=
h error -2
>> Reverting this commit fixes the boot on both platforms
>>
>=20
> Hi!
>=20
> This is not really the offending commit, it's a recent one in the
> implementation. The issue should be fixed by the following series[1]
> that will be in the next next tag. Can you give it a try?
>=20
> Bart
>=20
> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2=
f7581@oss.qualcomm.com/

With the linked patchset applied I still see the same issue

Pankaj

