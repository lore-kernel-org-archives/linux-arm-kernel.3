Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A5FCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=; b=RabWZW9rclRRhXnHEJdnM+Lzh+
	wCIaMsdWzEm0/mFVDosuYaM17Ya5ieWVEvUcirH+xYNPJkwy6iQ5EKvM2aG8Bma2j30LltpuwhFiu
	XpFG+epX4VNyh16e5hTxK3LHEUIBUO+u2Le2S77ScujN8xrU3DHKPqpk1Z/FCD/w0QlMV6Nu1BqUY
	plD19Jy+ZLbeY3J8VHaYbKBWgBPN/NhRaKAI3R8W+lz3YqOzq13xcutIDqfIdzKymhS07AX3zoQJP
	699F++eyeKKVN2qTvHlxnR0QoCEEWvdoLzUz6FRpsgYrLNTHUqLkW5NqXWwm+Q1MvcgEQVNjzgzxe
	nSnxj7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGK4-0000000AblO-2Bjb;
	Mon, 12 Oct 2026 13:44:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGK1-0000000Abkj-2YV7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 13:44:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09Oq1933256
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=; b=QQYfz9qmqRuEHOTF
	hHgLWSVt/mJ2qx6z5Zuor5oKTjphtj6ORKylzDIeyIRYXe4tWaH5jLhT9WW90VH1
	vws9zZI5kuW7z+mOsJ4qNRPpWvoY36m0NTvXkxaiK2l5JYvL24S7n2a4Zb/XwFpy
	tjpanKaKR8X+pRtmesE42GlZeWlHFvtiRry/VLZ7w+p7YhR0yTj4O347h/d3bTOr
	43iM7bOXZfSdt7NJ4iWyKCBZjdnOcMD4i35Q12grLqnOTFD4mYR5NspCtMp6GP9W
	0yidWB57BLhSrynbKIRCEt/BcU+Fk/Nzwf0gxQJsYk6vhyFQoGj3S9yxUYudgVkv
	cbABuQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjemf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 13:44:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso3106396eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812647; x=1792417447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=;
        b=hWhmqRoCkYIc3Y56m+Mc6bY/4dJO5hJenO7hKQEfv1/RihJW10kRYAhrr9/1Ot3K8M
         jo3Sw9/wDuxtLAasxq5ATB/5z1ZWtfVB4CUKosRVCC9OdhNWDvNFbXodcefYGwq3YRBL
         tunikn7EMc12i6kZsQvs8z6nlgbD4cg/46ahdx7h5Upx0T4p2ZGqNwdZ3jPaQqV5Drjh
         ULyRtYEMcrZ7R4DanLEIFG1XlbrFnc9tnGxd/jo8skS/pWLMZ5nteV3TAJccDfahXcmf
         X1RmuHvpq7p7vDiZYRmcC88BVcQha2R1N86XopteTdGMHPzfwRrtGXuFARSTChd3SvWE
         L37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812647; x=1792417447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrJ5o/8tqhbtrfkw4GbBGglVzHr2+lr+Pga8Ra4lpB4=;
        b=CNchAQ0I2cKFs4w1A7nlbK/mcjjxHXma4Xvi9VovJN6F096yhvN+lpoDdkijy32unD
         GABl4T5U6dM3ljHDo+4eXvJvaAYFhoV6/oEht54GF/CJA/0TO5VQMxlh7SkK2ksqu/V7
         Hz2dSlE48K83Rdl6YoHZitcEDQ1GbYiep8izlqu31EfL2EVASOBikT/sQPUoYCf4Pn6v
         jq1WSbcStJPuOwY+uoRIVtViexfb2PllxmE4slC74cQzqqjSdcmEsfdILvmquPq9vThj
         a8iQTfpdQtrcSNDM4WtUnGbwD2z32wvWxQ9TESsNiXXKXq5OlMR1TBouBu0Gdtwd0c6K
         dgCA==
X-Forwarded-Encrypted: i=1; AKwUvBypBQ/rmnyqJuOtAqT/kmsJJqjeV3dfCQDroD9qTFvHLpIQlRCQaTxWcjLiZLOevgPCsf/1hMFMeJQO3MTSdJeB@lists.infradead.org
X-Gm-Message-State: AFq9FYJEesbKPSMpJaC5MorWKj37IwBR2Npp9JwMdK/N6pVK12dDrNok
	hC9Mxw5ovxiuNhzdjlaNsBsfSugjhrIttFgdslFLx1//CSGVjeYE5cI5u5VDClVMW+CDZ/ynrMy
	uY+rtUMaVxfNGIWBnRPNpLVlWOMM60hSePNTsY6BXKlBCXLgqj9qkqa53hoIFh2qAZ2pjhMiCt2
	fsBw==
X-Gm-Gg: AYBFou3QkzDN9+6EjKnm00bUY6+qL2+oS50771n7l7Ds7WiIZlIujuUgbr+IvCZUfrT
	1T1Pr49dY67XPGOvSB1lcNs4qVJevfeSnOZMvojlorXHbSoggV2F39KxH7vnfXPp8CM9R56C0Qz
	KcbanYmpjxKBxY9xEvjXD/i99ZnPhY7BuFQ0xQ076qxA2A+niwrR3Wj5avHFcBrJ4ERGMRnpW/r
	CbpFJ+yvyJvU4OsPDUtne/+7cER30uaOGXjV1BHlpyOJGKID+ISYSpVrHW8sVVyT4PU+rG3Tgwd
	c2wd8Qbm0ehmcJErHzGoSgAani258iOZFIY9X6jHshUuH9vEg5L6X7WjuPZQCHaIWF8sfORAR1d
	T5aFNt6Gg2nYNDAqpagL5AGAPI6ocgpZ+2Q==
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19975532eec.3.1791812646344;
        Mon, 12 Oct 2026 06:44:06 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3537ddd6fb4mr19975450eec.3.1791812645696;
        Mon, 12 Oct 2026 06:44:05 -0700 (PDT)
Received: from [10.92.194.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm33512555eec.30.2026.10.12.06.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:44:05 -0700 (PDT)
Message-ID: <c5bd025c-d32e-4681-9644-11c4350caf99@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:13:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 00/10] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfXxa0n7T7Bbs5A
 e3rTfdH7mRJj5zOVJ+gStosZizY3et7lDYy7NThSuFeFwrQae3mjpXwcTKsZy+3vB/T3L9wEnHl
 rRaGDECvh538iGGwEI5ibTlbkfdNb4aIV5HDbvRgWO0kWTF3Q8qWojCGGMC0xhdiMSeDOOrIT+S
 k0SVvfXbAga2UCUKAbiQAfgbQzjHCA7BSQVsvOGD6SlbPyXPilU20drMpH1oZYS+/vDX+qGFzlh
 jEJwy36oRKArE+rI3/HEcTsmd7IjCXyzSsLSmKqvfeQto2rBDOUCFULHCxVmLqO+kKh6VaAAzcC
 sq2jnkwF4gSGvnc2tDBz1PVGWSTKZCSzRBit0HveA6HqLFeIaSY0J5uyLJuMXUpdEVvh9Zft+ZD
 3Ono6Qt1J4TEYDScjoYqUzxPLueulf6CWcU2fwiToF0wzrPUu6EWJIT35HwNgNFJDcqGepyqTxn
 dbdRyT5pobIrTJ5x1ng==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acce427 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=06DCG69OefxHWCB5cYgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX2Y/NJflj3cI1
 r4FdHyEXf3a2KHr5qgKOZcA32QPz89BHzVR+NtwOLGrjAaKHhNr8Qd3LgQP9NKLRKIkpIBpsPGi
 8UtueVvl61HZHwiIqoMF/r21zXNUHbo=
X-Proofpoint-ORIG-GUID: 7FpWEyjO51LU54kpxuXqgS-ag1rGqTSZ
X-Proofpoint-GUID: 7FpWEyjO51LU54kpxuXqgS-ag1rGqTSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_064409_776926_660F99E9 
X-CRM114-Status: GOOD (  21.85  )
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



On 9/28/2026 11:39 AM, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
> 
> With these enhancements, the patch series enables:
>   - Arch Warm reset and system reset cold as predefined reboot modes.
>   - Vendor-specific resets, configurable via the SoC-specific device tree.
> 
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
> 
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com/

Hi Lorenzo,

I am planning to send a minor update to remove some unnecessary headers 
from psci-reboot-mode.c. Could you please take a look and share any 
review comments so I can address them in the next version?

thanks,
Shivendra

