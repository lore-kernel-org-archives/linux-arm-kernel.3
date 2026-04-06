Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE352EF4EA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=; b=BZ9UEE+CBh4AJBkFHhK29EKk0x
	XeWFSXNERwjSuwmyXHnm9vzgQkgmahm2zLSNdEjYZkaTlDYxEX3jjs6Pplsx9JMC6D8Yh5wLQWDvT
	GGImm8+ZxpnhrFeN29x/DFAW5JtQpuCD5PnxFyGSeMGlVena0CYzD9wHmZsXLKToG+bYLGppw2Xkl
	dktpk6dMCjHiylPGVf1TEnd9f6TKazywStTkSswKgN1LITjy9YderwXzlwlk3UcpLX54KE+AQtoFC
	bLj6P/r0ja4O5G+NnvP9FwE7QQVMpTzt/8n8oEDWv0KGkVLKZhY0YKiQcHYaNjOUiAiYHWScZg6PG
	fM2FTJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9eVt-00000004tL6-3cmu;
	Mon, 06 Apr 2026 07:36:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9eVq-00000004tKM-3P3l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 07:36:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6364uIXi2936947
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 07:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=; b=bCy6Qgz1f4bT6KeV
	/3e+cNg3Ex/VZzvTHkZwmtrwr86SCLI70JbNkIkLzNQK3eAhBeBGvILLaNFblJu3
	IO9df7W8NiplnRi8JajqTEMjaTXsPXUPIPALPHw87stS3FPn1R75hK7snY/EJFk5
	n69r1nBKpAEwO8/WJ8fx5znQE1d71TmAzSIYmd/IO+Jkrvuu1zZu/n+6FBjLZIu7
	vO+ikPgKkONqVfdCABY6fFJ8Zsjbs+in3trmOl3fnsXuU+OMrrAYRE533Tg4MVjP
	O/qZ1bN0nOVT+b1w1jDdzcuLIeO2BP1xtbjcBUAWPbvUNa4lZWM0E0Hq8MfrtVZa
	BaShMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd49u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 07:36:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso8455025a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 00:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775461004; x=1776065804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=;
        b=TurallYRabuclOp1jZXW2JM3+loYh6EEcvCnZZvJGhZgtAZfU4T4CSL4FATJXwnI3H
         92BCv1bk3X8f86++/8olIbbpAL7nNTOZgcpWvlvKF94S6MpDyrTv+LEzFs4lDJivG1JM
         w4pVjDQpItF9E7dgsxRCJIR6FltUlOPxkkFnTa+qQhb/peGPCZPTuvMfWDRV5YmLl9pS
         pWf2a13BA2yoKaqB+LYzW1Un4ahHvB0+nHciyopjmAsgaHTTYQx3Z0cgHS+7+2uFDSd3
         73W9370q6oK+RKzIjogTN3DoGCXbAWbM5wWnCsZl9huOaXXlQm1MLX9YFwzYODtkVzH0
         ekrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461004; x=1776065804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og+gS/7LhEE28OGj4l+LQ9SM0DiaD4s8OHH46+FD40k=;
        b=jaCO+U/LOaNI+Winkc3QkHMz5Yo8QMJlRdb9tIydUkkCCe9cocU0qsMVHkCw3SQF/t
         /3Q0CfGavETfImCOJWbWSDiXlERThJnX+x8DjdOKAN+WyUy0vSi/oz6JJWBocWW4xee0
         NAaUhjO28LY8tfmbmFY87gimtvxKhOT6rgSoyqoe5kS9jSv5mHm+NBGESrflzMPojxIs
         Izj0qqy5+yhLCZxBEBEk18ozErLG54AejuyZtj86U8FMogDFvexHtK2r5Bquzhsj1w08
         zC03i3UyqB9TT4aF14cl2Tmbng6xcUPvgGx80VBfV/lNm9eVlijGbq6PZimuxw6wRnmm
         Xexw==
X-Forwarded-Encrypted: i=1; AJvYcCVzTxh6Rf5EdsGaAqapNAtGhD117AzFLksI5YB7DWUwEFX8tQlrYXK77DCILftfQBz6qT/BWwfAPQ9YsIDPHyPC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywds04keCL8VRPZ79U3tbFt9kUPDzvJBJLLAYXZ+4E5+eTZn61X
	cbMEnLY1w6ia/uwxRmox3w2P0Kw9cucBfatuepIhOaN5nL0hcUbeywt6zacDCue4dXK4izZbHSv
	uCVCFVxHQ0OOwa1iYv19u9K6wZhkg2+PaBvU6kDL7F6kzfsHP4RPHR/K17S9QF2/lA+SpmKTrtS
	GGTw==
X-Gm-Gg: AeBDieuOkezVVRahkhijDH9dDnMjsPyQWgKMTed7BXtsR3/8ZGUhORUhjFsGk6k3zzH
	EfF0HwpGVzpzt2IXVExBD7MKEoWk+2wQT+bQIcrygWN5LvRBn+n957VTBCFdQjqFCNb+5ZKd9Ko
	7EUIKySaAVJZom+1aHjdoENw8wapVcsSK2TgZAJO5pFf75jrZGb3DcIYGR90yml+Wu8bj5cGBOt
	XZMYUWzJqQBsDWlqBbTpBEWzBizLnfwS0VT+P+aVxi13aIs9OFIOQheUbAunqyEom+Uvrf2+Xm0
	Mc0NP+YZeoDqhZOTBF4lnLhNFpjv9JufQWi1jW+UN7a606hHVXwr7ykAppvm67OiRt/fXhefJE6
	V1mpvhtLFLKRSMUzU4YLxndeVecpvxGWm4z+QEtEx142Sci+RZb18YZ+hIjSozVw1nVIcabOqOz
	AkDxmP0wJrd8qw/2x4HjPsH6wtvg==
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr10698396a91.28.1775461004596;
        Mon, 06 Apr 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr10698388a91.28.1775461004071;
        Mon, 06 Apr 2026 00:36:44 -0700 (PDT)
Received: from [10.50.10.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35ddb973ffasm11678053a91.2.2026.04.06.00.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 00:36:43 -0700 (PDT)
Message-ID: <c8fbb242-c1df-4db5-8fda-705e9df4a894@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 13:06:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gj5fJEvk1ydKMvEvpjxiRwXiqfwoxfW_
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d3628d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RXLY-4Gv9SH2gAdi2bgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA3MiBTYWx0ZWRfXxfuYsibhrQr2
 J2PMzTNbqZ6fsqpjWIeifl1PvTjtDegAIJigFWjyOdLm8c3QqTE8SHg4SRsmlywJZQ9+2PGm9aw
 OYgJFqP+rSSPJMIulCm58laGOeayostZZa0X1d8U+GB3Hr6UW8sTie0FUGN1J1L1XhIL7xLImA+
 6Y2Akth22Do1UUPqZXtjO/G/icMuxhpW6pvJX5XiQkVRqYb6EZyi35blieC5d0D3/Ts9Uq7FsrY
 hW5+2tAog5r8/wjOKKgotZTvmO26z2wiqbuNG73hALE79x4pgaBv9pp38/qt015S9oV693sdh3F
 fZIZjjqOyvzu7ltYxSmjGv2pZT06BydPnzxXTpDc+lR2jaiOyzVFYtbwRk7gp2L5badEfzIWu5W
 P7qnnGAzxMnbBskM4GYzAe+iqS9uxQ+eTATlDTIXxZT10aUP53ykPmkv9lwG+6rd8AM7i6GYBl/
 uX0c40JwNrj3OJIhCvg==
X-Proofpoint-GUID: gj5fJEvk1ydKMvEvpjxiRwXiqfwoxfW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_003647_011754_1DE7AB2E 
X-CRM114-Status: GOOD (  23.00  )
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

On 3/4/2026 11:33 PM, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that registers with
> reboot-mode framework to provide this functionality.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> arguments (reset_type and cookie) by encoding them into a single 64-bit
> magic value.
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
> 
> With these enhancements, the patch series enables:
>  - Warm reset and cold reset as predefined reboot modes.
>  - Vendor-specific resets exposed as tunables, configurable via the
>    SoC-specific device tree.
> 
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
> 
> Currently three drivers register with reboot-mode framework -
> syscon-reboot-mode, nvmem-reboot-mode and qcom-pon. Consolidated
> list of commands currently added across various vendor DTs:
>  mode-loader
>  mode-normal
>  mode-bootloader
>  mode-charge
>  mode-fastboot
>  mode-reboot-ab-update
>  mode-recovery
>  mode-rescue
>  mode-shutdown-thermal
>  mode-shutdown-thermal-battery
> 
> On gs101 we also pass kernel-generated modes from kernel_restart()
> or panic(), specifically DM verity's 'dm-verity device corrupted':
> 	mode-dm-verity-device-corrupted = <0x50>;
> 
> - thanks Andre' for providing this.
> 
> Detailed list of commands being used by syscon-reboot-mode:
>     arm64/boot/dts/exynos/exynosautov9.dtsi:
> 	mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
> 	mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
> 	mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
> 
>     arm64/boot/dts/exynos/google/gs101.dtsi:
>     	mode-bootloader = <0xfc>;
>     	mode-charge = <0x0a>;
>     	mode-fastboot = <0xfa>;
>     	mode-reboot-ab-update = <0x52>;
>     	mode-recovery = <0xff>;
>     	mode-rescue = <0xf9>;
>     	mode-shutdown-thermal = <0x51>;
>     	mode-shutdown-thermal-battery = <0x51>;
> 
>     arm64/boot/dts/hisilicon/hi3660-hikey960.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/hisilicon/hi6220-hikey.dts:
>     	mode-normal = <0x77665501>;
>     	mode-bootloader = <0x77665500>;
>     	mode-recovery = <0x77665502>;
> 
>     arm64/boot/dts/rockchip/px30.dtsi:
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
> 
>     arm64/boot/dts/rockchip/rk3308.dtsi:
>     	mode-bootloader = <BOOT_BL_DOWNLOAD>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-recovery = <BOOT_RECOVERY>;
>     	mode-fastboot = <BOOT_FASTBOOT>;
> 
>     arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts:
>     	mode-normal = <BOOT_NORMAL>;
>     	mode-loader = <BOOT_BL_DOWNLOAD>;
> 			mode-recovery = <BOOT_RECOVERY>;
> 			mode-bootloader = <BOOT_FASTBOOT>;
> 
> Detailed list of commands being used by nvmem-reboot-mode:
>     arm64/boot/dts/qcom/pmXXXX.dtsi:(multiple qcom DTs)
> 			mode-recovery = <0x01>;
> 			mode-bootloader = <0x02>;
> 
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
> 
> @Florian/@Kathiravan, Please note that reset_type in DT needs to be
> full in itself with 31st bit set. (eg: 0x80000000).
> 
> PS: As advised from Lorenzo, "PSCI maintainers should be added as
> maintainers for psci-reboot-mode".
> 
> Previous discussions around SYSTEM_RESET2:
> - https://lore.kernel.org/lkml/20230724223057.1208122-2-quic_eberman@quicinc.com/T/
> - https://lore.kernel.org/all/4a679542-b48d-7e11-f33a-63535a5c68cb@quicinc.com/
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


