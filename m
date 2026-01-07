Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EDBCD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=; b=kS+D6yzFSZlhx7B9o5iFQddCaf
	oynCyK/eYzKEaEXSEp6SGlO70086jjupeZbTvfrAg/LeygmyOtBwotqKziU+Z+xj9CHBCAN1GgcD6
	FdXCUjIVivMzXS/8w/hW4dUwI/SrLtg5OcfIIDK8NY8thuLa/sOwtDHTL5DYJgsaYQ71NNyII9AsZ
	wuZSuEGBtYuzbsKcWd5IQ1Tkvu+iXs6iAE9PtzPcgPwdEcPNjy7G3pDpqZsJ0HYPKiGnAk8MtmCph
	tGOvAXDuupSCrUWuSgwxZqri9nnYcLFQgIBpfvO7+4wxrlm9sOXHehJs4tIlyEjnVwDsjcJBrI2Xi
	grOvlmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRNb-0000000EmLs-0AfE;
	Wed, 07 Jan 2026 11:07:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRNY-0000000EmLL-0WYd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:07:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079bv2d2876916
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=; b=IgDDvd010tQr7TlM
	LLqfPW89nf/amk5Gb7rpZPqQFEWzffH0YHUn0XsG/39habiFplv2gVWEmxzCz6RL
	bnTw6wmkdMLaK5ZZSJ2rYnYvAc5nYTzq74V2iOs9fa6QjBTuRa9tDcS0xRvlLk+D
	NcaJmU9Gd88O8IICyeRiEi86JAuvQNuhzJ/r56NSw9dQJkra1FmG/XYAmqK/hz+F
	iGB1fuGMC0PVsNoa1BpqtKsdw6MKnEPamhoHd89nKIWU1mxXyZ2hntcp7klyzzuo
	sigbgANEEc/V4ylSidAt1qzDWx3OrQpdtx6du+lUDXyh5mwtFP0RW32lH7fbBA0U
	VXBJ1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cr953-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 11:07:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d481452732so2722035b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767784020; x=1768388820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=jFWHnblXpMtneU1Mgd3U/hXfThstL9Ff/HPuCwCciTG9cKy74vNWqwrVyedQeqpyxr
         MmFRWGQgnNKN6iILTfI4ONGeL+qvPYGkmDqfTu32GG4u8rW6/z9PfI8aQkS1U3dGNfc4
         KrO6xFDNbitLV0rEmCnIXf8muSyAhGCdF/KKg/DgyJZ20rfnzONpKIictZP8BYRjRqg9
         /j2SZNJVUuNzCYE+52NqpJxWQYPfftFocCYzuMHxZndZ+RlmdQ76UfGNPIFbsicysXgq
         Q3/Da2WLUM3iDbnR3c4oKnzLVRBRYHS37uMzpLTcSnG0Sq3YfhmxdGIF8KRQHOx0obuY
         2LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784020; x=1768388820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=ircpCUFLUNEcd/sV4oteqrPi0ZFcMVBU58fxZes7ufb9ITUHBhmwuEEUl+mdT1CQ7o
         +besBVtD0uYyuxIcMeT083I7mimDjGYynP5J5JY4Mt47tGhMDCBgI+jGXbQrEqCFcZuX
         6nZ5PkR2lU04NxMtpNlGgXEj+k2f0Iq5j2O9BQ/df1SnbGO5rLmGg0fPci+53+vNBHTW
         aI7ZHD09hosYprX1gv82BYtO281BDK0JPueHsfTjCBp5JCqfuX8V+iqa2rCAi6FEueCg
         Vh2bVNhOVBoPAmb2Z0yVmM/+UREyixOstrRlUALoPApZnadYvKeUPCHkLAzMNij//lPe
         Wwmg==
X-Forwarded-Encrypted: i=1; AJvYcCXq0lnno3cxtXWYyRJz/anCesG/l6wIgueJQIUefmEjv2tnrNlYdP/zevKPFWjQ3CixMze2Yn4GTLd7YEeEzDPG@lists.infradead.org
X-Gm-Message-State: AOJu0YxiIuhbKVOC620jL3iDWUEJff6TSw0m3W3zsGJb/XnXwbWjOrDq
	f3CRygK3SWWVW7dGtnq0VOOZDE6dlvGG/iM0bVCSsCkIOKrX4XUZtTy8dPza5vlPNWQC4m8tNXC
	PY7Y4AGVnOUFrbzeqBhOV3NY0lQ8sSW6zgSMTjTC+0iZnGmZQmLGdtuwJkPAZMC5V6kyi0hhbbR
	PCZg==
X-Gm-Gg: AY/fxX7hBrylfeazkpT4mHEoi+sfqUM9MJFbGrlbe2HR9pFD3WvZecr1OSrOyjgfyNh
	PF+rCMfJKLyzMisuQ2Qdpj45fri4Q+ZBu4FVaOmwCr564UTLk6hLFCdzFEVGmEBrTT0E1nIYfmX
	pljNTVfTbiB6E9WMsSN2jj7ojouYMx3vcyDPvud4cbqqwO30ycejVgUNHDAxtpkdBodw6FeadjS
	LXhZLJlnY9TqSe1Sav8QPltDd/dyAxXHk6OGfHqUjAPUraQ9/LJXVkKm1/1YSPpCAjLDuqMeL1m
	lyxGv7SoDj6Ug96pp2l9A/WOlQx/3Y3zk4qsE+GFCod3/v8bljuAipKR411qwy3En6P3yhtXYZf
	We2qWjpTYxhnILsH4B9EoeGb32jDLuQmRx2RTc6Akt98f/tRpBOgBa2QDVR8RKEe4TrTm2FaCkR
	THW8MxEFvbw17wXxApTnpQ05dIFJE=
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009339b3a.68.1767784020253;
        Wed, 07 Jan 2026 03:07:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxOrOZj/lOLSkp/SPwAFiTXNYU9SdlgYCvG6OI4vj5T5zuAQFA2+WcItbEGmouMPaYav8bQQ==
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009315b3a.68.1767784019750;
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Received: from [10.79.192.227] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe96absm4739372b3a.17.2026.01.07.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Message-ID: <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:36:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MCBTYWx0ZWRfX1nIKCJFmKMvb
 9Eh7S4XzXU1iexQlMb1YeUswOEU8fybpg5yyJQwa7DYw2BnjyQPjjpPwwUjeOwExtFjcBBFvGwg
 9hvXv68diEiny6mBRL33DBL6h0O7myzgNWgxkrEBozZ/YWygEU8TCdDAppJ3Lnxx0Q/FUeHVlww
 WRgnjf0MzGpNCSfq5cQvNbNEL7rNrzxwlU2G9tF8A9OsJZciPaKnxjjLXbGowkM8dcKmzuEGiUw
 ibtiWBcrE1PnJ44zYfzPAJpVFexZV9/fHXDw/jT7dbok2tIynDKzoNM4/6PvUf3mWKQ1w6+EO5U
 niWkKqYIHAMMfu/yIYia2uHvcrj/3pio+7vo4ViTou+B+ILv13LD3d644rWJR1WD70AqcOzrZw6
 sC28hGIv9bRSJPf7TzDVjbgpsliU8XkSVbrBKtKzm1yVFpBdeIg4wxAm/3326CLh89arJ0DE3Vc
 xVnSQTz46z4BAAq8Lkg==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e3e55 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=MQqTiiUG2llzu4MCLGsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tEoNIR2hHI-eXn0xKzxj-XakvBtTJOTV
X-Proofpoint-GUID: tEoNIR2hHI-eXn0xKzxj-XakvBtTJOTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_030704_284843_8C378081 
X-CRM114-Status: GOOD (  17.90  )
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

On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
> =20
>
Enabling shared gpios is breaking hamoa and glymur boot on next-20260106
For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
Please find the log here - https://lava-oss.qualcomm.com/scheduler/job/24=
722#L3514

For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[=C2=A0=C2=A0=C2=
=A0 2.910982] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_a=
dd_proxy_lookup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[=C2=A0=C2=A0=C2=
=A0 2.911027] Call trace: <4>[=C2=A0=C2=A0=C2=A0 2.911028]=C2=A0 gpio_sha=
red_add_proxy_lookup+0x160/0x24c (P) <4>[=C2=A0=C2=A0=C2=A0 2.911030]=C2=A0=
 gpiod_find_and_request+0x1c0/0x504 <4>[=C2=A0=C2=A0=C2=A0 2.911032]=C2=A0=
 devm_fwnode_gpiod_get_index+0x1c/0x6c <4>[=C2=A0=C2=A0=C2=A0 2.911034]=C2=
=A0 qcom_pcie_parse_perst+0x70/0x150 <4>[=C2=A0=C2=A0=C2=A0 2.911037]=C2=A0=
 qcom_pcie_probe+0x414/0x804 <4>[=C2=A0=C2=A0=C2=A0 2.911039]=C2=A0 platf=
orm_probe+0x5c/0x98 <4>[=C2=A0=C2=A0=C2=A0 2.911042] qcom-eusb2-repeater =
c448000.spmi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulat=
or <4>[=C2=A0=C2=A0=C2=A0 2.911043]=C2=A0 really_probe+0xbc/0x298 <4>[=C2=
=A0=C2=A0=C2=A0 2.911045]=C2=A0 __driver_probe_device+0x78/0x12c <4>[=C2=A0=
=C2=A0=C2=A0 2.911047]=C2=A0 driver_probe_device+0x3c/0x15c <4>[=C2=A0=C2=
=A0=C2=A0 2.911049]=C2=A0 __device_attach_driver+0xb8/0x134 <4>[=C2=A0=C2=
=A0=C2=A0 2.911050]=C2=A0 bus_for_each_drv+0x84/0xe0 <4>[=C2=A0=C2=A0=C2=A0=
 2.911052]=C2=A0 __device_attach_async_helper+0xac/0xd0 <4>[=C2=A0=C2=A0=C2=
=A0 2.911053]=C2=A0 async_run_entry_fn+0x34/0xe0
<4>[=C2=A0=C2=A0=C2=A0 2.911055]=C2=A0 process_one_work+0x14c/0x28c <4>[=C2=
=A0=C2=A0=C2=A0 2.911058]=C2=A0 worker_thread+0x188/0x304 <4>[=C2=A0=C2=A0=
=C2=A0 2.911059]=C2=A0 kthread+0x11c/0x128 <4>[=C2=A0=C2=A0=C2=A0 2.91106=
0] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not foun=
d, using dummy regulator <4>[=C2=A0=C2=A0=C2=A0 2.911061]=C2=A0 ret_from_=
fork+0x10/0x20 <4>[=C2=A0=C2=A0=C2=A0 2.911063] ---[ end trace 0000000000=
000000 ]--- <3>[=C2=A0=C2=A0=C2=A0 2.911065] qcom-pcie 1b40000.pci: error=
 -ENOENT: Failed to parse Root Port: -2 <3>[=C2=A0=C2=A0=C2=A0 2.911069] =
qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
Reverting this commit fixes the boot on both platforms


