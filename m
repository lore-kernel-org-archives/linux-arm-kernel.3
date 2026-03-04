Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82856EDEC12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 05:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=; b=r0N2WLrTlUZonlj1p1k+Qt42GM
	2DMY6nmBJAdY4sMquTyg+UzRUF/utjtb7Gcg419cVllH9CLbM3GEnU6V42qv4e3EaO8noILLUHPAJ
	E3DY4q7DgN+fi1mO3iARK6zFiypd9ymB7glna5c8RrPVf7u+S+mvavnDJF2klfvsBV4VBbqSRhpg1
	SylfTObFZ8l4pVvB/CQMLnqSyuafs5bfV8PuK6wQqW4kNqG7nLwbkIrT5MmXPh11SvqhbGHsSaLL9
	TCOphmZojPAB+tlC0cBcoCc2Q6ia6lWO4SyqXkSoqAX7pDvIAWKp+pC22EaJhlIhLcm84pFG/EB18
	AuXHCCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeyT-0000000GUXG-4C11;
	Wed, 04 Mar 2026 05:40:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeyR-0000000GUWI-0E20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 05:40:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQSB945101
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 05:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=; b=n4KQL2D4nW+vb9Xx
	LzjtRBihWkWIc7PDGPrANMUCWp4eaeoZn2XalpftiEevWIPtAr8BlyYk8zKXBG/Q
	fSzNPHRRMzKEM0or46IUjXUMhOhaUWIylIbkBPC81gl6vHIhDkgKy47mn+oE2XrG
	VMAfilXk1iRAqyOGdAHPPO5pHgaVCBTW0b+qgYJD9vZzH3NVuN2NwrpZYTpX/lWJ
	gB/r9gw2FhKSuiE1A6u1woG728q6QCaQQ8Ty1h2hpIc4ZsKMMON3oskmNnnfKowX
	u9VgfLz5HLjc73KQsqSzPBKD3+t8TMi3UXgn0lrzsYmfG6f08EMrfCr/pVvUnjc9
	xcWUEQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbqn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 05:40:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be0575e290so2851713eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 21:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602840; x=1773207640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=iVwjyYD3Lwz+fUVlk/R5rYRmNnGcSJP2FULr80LYHBos5H/k9htiHdZskA34zvWjVa
         hz5w7MrycPKw9TGjJMeYyl6DOel1jJ7RbwZiR80w7FZJ6weMREheJ00H+KTzqUCCObdQ
         WLFpIckP6uuy4XNQ/GDzl/SJ1AbZTAgXQp7KDhowZmkLPuv1+vAIRD5r075VSWxHZwrK
         FMpyhxGrb8oqrAUtT8z5azPXzkVfJ8fR4GRz1ef+4HnevB7Iyj5J2obuYZQHGX3HIpmo
         8ZgaqlJ4Py6jTV3mDElv2kcoEEMicNtCBVvcz+fFtzri6Dky+RDfuKRbAh5QtXFRAEtm
         Ioaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602840; x=1773207640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTkHd1KeyqUTkLs5AEaZqwf+U6dXKKpz4XNqTDwVhgA=;
        b=MlmfCzRc/jShOf441+PUVPDuW5qfwWVmr+E7thUNd9mGT2QOw97pRR4/U6ps6nmm40
         FYqaveNMXq9EltQ6L4qENY/5WuVqhfXXWfHUC1DXHDaYO4gDFiV7b9R+TTeX61ISrgj0
         DJW0+7RxXV5aDln/68ttINMQwVdD2Jm7+4o0FzoyRx5NyGRyRv88dLFCA6BM+rDVqsCy
         87jO1JlGVy2CqmOiw934X99LgNEB9jwoesYQBH+jtBMs6MSV3o43E/Vtltq66duy2J5d
         awOKnqZFMofkcTuxxuzsI3JWYJtbRXRW7t3/covUoLOnHrp4OgOmNyrfzhtQamhoRFVy
         m+1w==
X-Forwarded-Encrypted: i=1; AJvYcCUGUb/+m1bxqMzJoc0y32ZZlOfLjOjp/eAsy32HtcF5NMdb9zW/Ne73vaCoM/7RsurL6UQ3dlLv/6f3gQNW5mu9@lists.infradead.org
X-Gm-Message-State: AOJu0YxZJwm0BQDZ7uHsP3RYqdXns9vVdGR2eTWrXITZivy3Pqzj29gN
	hhRk8DzGH6NuW6y2a2fNKRE5jmjonGfeKUtO2Ojls1oEgWHM3LQ3UXebwkvjG4y223TIE5/hCU2
	Iekt5xFeYLKIE1KgTGJIkY2mMsoZaVeHA6IrzBIjwWKpTxcEu7XjgPufYivpvq+0HeSyzDN/91L
	zl7Q==
X-Gm-Gg: ATEYQzzHABmqaB885lEYQwnuNwJG5gTmkEr+ZMp6napI1oxpqsMZqoXoJd1K3d9yJgN
	vHpLv804nN79Jb9t/V24ce0U45QbMgpnzws6tOSN2mq+c/kDBUZf2aKrync+7SdZHtdXAWOTZkk
	hAtdsVeShkfA1sb8ERQ4Un9j5PchWMdG8IZkfDe1yzYKrp+tS2OrmrXODTfooEWmIK4zaXs9Png
	OcUJu+6a3sqFKTcWDogvfeO6icQhtOIxdYrzRZEaoPCd8t/saYByE1bWNhVe0NZft9104ROko36
	mUmla3DXKHVjMmLEx6/JvjL/bVY19uD051VEf1lZ+9f/GQUxlc2LDnOe9k9x1w86Dd9SWPqnIZp
	ERJ2JLDgiDYmbs+k//v4hFgfXZqVhahXbsxWAQjnfCZ/m/xqnjHXBuag=
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294704eec.26.1772602840462;
        Tue, 03 Mar 2026 21:40:40 -0800 (PST)
X-Received: by 2002:a05:7301:1009:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2be311b9a6dmr294695eec.26.1772602839913;
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e02f95sm14383897eec.13.2026.03.03.21.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:40:39 -0800 (PST)
Message-ID: <2387f306-d7df-41a6-a526-d5bc56ae1c06@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:40:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] clocksource: Add module support for timer drivers
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfX7mbTqLfqjwex
 AJwmlDFryuotuTYLPkwBLNViyPoaBlLz81oUtsDbsdYoLyJFF98nDAbT117O3QX6qrw8tLfglu+
 a7tR2TYUMSkHmISjtgzBF9wj6NotQHan8nO4mfQyu7pem5CRrGHrcFZ5Upsj3/nhmp2OKUeXXxn
 Wry7/ytkRxzb4n9m5/bStYhT93/y3W9jnhTUj0HR4IQ0ke2W9aLc3pprz8uJX2gED2g3wnbTmsl
 LCZZV1vVEdWuvQlSjAsL+u+5LiUA3l1WldlH4w8IisNj4ThgEDmRp42qwQntiOFSxa3x2ckmGhM
 /SlpjqYqsWBNwguYwrBFMl5uXNK0ePKCuNmCQKPM69TYzLUVumbonuyUzDT1hnCwIGUtjauvs6g
 umM3X8QHGtGFUmtXwtn7RF+LWxGAqeBdPk2AjnklhtnjQUfNtIPglhapJkOOa/zLP13ba5vSoi+
 6XlwbA+bkOBtJVovH7g==
X-Proofpoint-ORIG-GUID: a6V3idL9U01myfhQtaj2uH9eE6qa56uf
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7c5d9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=tqqUqQLlst2uEWk403AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: a6V3idL9U01myfhQtaj2uH9eE6qa56uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_214043_208877_35E27FBF 
X-CRM114-Status: GOOD (  22.36  )
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

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> This patch series enables clocksource timer drivers to be built as
> loadable kernel modules, which is particularly useful for GKI
> (Generic Kernel Image) configurations.
> 
> This series is based on the previous MediaTek timer modularization work:
> Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

You are not explaining clearly on the why part? Does MTK doesn't have
ARM compliant timers and due to which you have specific timer driver?

It is not clear. 


> 
> The series includes:
> 1. Export necessary functions from clocksource/mmio
> 2. Remove __init markings from timer-of to support modules
> 3. Convert MediaTek timer driver to support module build
> 4. Convert i.MX TPM timer driver to support module build
> 
> Testing performed:
> - Built and tested on i.MX8ULP platform
> - Built and tested on MediaTek platform
> - Verified both built-in and module configurations
> - Confirmed timer functionality in both configurations
> 
> Changes in v3:
> - Reworded summary line for timer-mediatek driver as suggested.
> - Improved commit message formatting (line wrapping).
> - No functional changes to the code.
> 
> Changes in v2:
> - Added Signed-off-by from submitter (Zhipeng Wang) to all patches
>   as requested by reviewers
> 
> Changes in v1:
> - Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
> - Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
> - Added i.MX TPM timer driver module support
> 
> Chun-Hung Wu (3):
>   clocksource/drivers/mmio: Export clocksource_mmio_init()
>   clocksource/drivers/timer-of: Remove __init markings
>   clocksource/drivers/timer-mediatek: Convert timer-mediatek to a
>     loadable module
> 
> Jindong Yue (1):
>   clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
> 
>  drivers/clocksource/Kconfig          |  4 ++--
>  drivers/clocksource/mmio.c           |  8 ++++---
>  drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
>  drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
>  drivers/clocksource/timer-of.c       | 23 +++++++++---------
>  drivers/clocksource/timer-of.h       |  6 ++---
>  6 files changed, 88 insertions(+), 22 deletions(-)
> 


