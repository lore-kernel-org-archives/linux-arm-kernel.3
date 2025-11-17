Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E05CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=; b=CURYh7iNuLNRsuZPSGdTvykhIl
	j/HV9PU4bWyWi0MLTnMgmXAgL3McmK4cJqvs8ZoD8yxFwwfxP4Gp4h83QoFYk8oG+0jUVxbrw+csa
	p6xcrS/Jm9JiHe5DsYVtv9XKPfRVkM0nJdCMWMrp50rl4TiwBzRvGcfDu3VcUHDP1X8QjIR+y1G/1
	WBpxCVcvuO1OpMmbY00MxyHZFyrtPJNKmo3LQm/zSS3B9e8nB9X7spIz9hryfIoxXKFaCaLu9VsIJ
	7sQfv06C86eXgFgPpAeWl/omAeVD6L41iSSZsuNsKK+OW9YHBwOtmSQEWTgGf7U9fiWNx891AnqiI
	zxpa465w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrwM-0000000FSXa-2HoW;
	Mon, 17 Nov 2025 05:38:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKrwJ-0000000FSXC-36tF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 05:38:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o1AQ3266190
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 05:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=; b=LZVJCNzrzdDIg2w4
	IQ3kEGgsz6n1+UdO4UbFEFF+hkRA3abfumbtTPJe0vXgSD0Q+KvtsrTz5i/S5KEa
	Chuhqc0nWKjxPaBRoYyR1Hid00Zybu0VAm5f+/RstcpZli8imJTAcU0B6aGSycu2
	+MT3tvDHq4bx5Qkj+Imn/ulRKg09tu1PuGFSG/VdVeyxlhduy7Qfq/kq50MqD/Gh
	rhavpk3wV5fqEtLfPc2hXxiqT7XauNHIXLDwC86nOWnYfVVdx5t6QjTX1WD711nf
	PCppVrBYhhk3OuWuW2iCFLhK3sOdh6pmW9rjjOfj9iSq12pA9wPSxo9Bxo4PPhoK
	tDbD6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh33g7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 05:38:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2958a134514so51540205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 21:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763357888; x=1763962688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=;
        b=ZFwtDjjMpsEtoNnwXp2017zsCZd1s5DJncWzhA66DU+qx9aEA+llqqjPIg52+qzYDL
         fhPpO6NvusDAidjZsZy6vIGkAF0T/Ifq/TrDqQvV4EEWRNfOnpWyVYYiilAvJR/1mLgV
         XrYLrxjkoUaklR/OcOYs+KweejYSPL487rYYyb019OGoU1LiaGqtAZCu79HqERAG3i8O
         +wabaCcXgMvE3XJJNyAkpuXSga/Cw6UT6iT3lBaYB8dCGcbgBSpNSa7m3KhwX1tBoQzY
         Uq5GSoPoiM0oY8LmyPEC2FLNJlNZFEw09o/nR7MEfqEP9W/pjsLOWEbkjZg1XG0uJWRK
         oeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763357888; x=1763962688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ij+zGrZP39izW7VSXxtNQBt2rAsGHOP1QJw0Oj7RuU8=;
        b=utPIwsNNvoxNxht9cEtCu7G5GvdlIsx7cu/vCvt/YsucTJ0ieI+gg0/SK9D2hl083+
         JyP84OljEI/0vp3zt4mEd+RSZLscpfEV6fDHcaxQZnBnOFgGWvPtiXSX4rSWnj5uM6qb
         cGA8xeX7oSnPqwak2kdamVZcX4xu0InEmq8WD6mfHrkZ+YoBsWQaDibp3g88vkSFvK9l
         jEPHzuFqVAIFC1RSJrMFo/Vr9ow+IkfJ5Rs30KUULokc2E+Vdq6pdnv97S+P4jjeNzwF
         OzhzksfGYpKsEa/4Bmv2U8YlMEOG3K6hZnPpYEgJO2nxBT+VSATi4mBU7MtUJvZWIrpU
         1YSw==
X-Forwarded-Encrypted: i=1; AJvYcCXjlMK1341mwEZ+2t0MwHxLV0vrb6ZmixPKSDXTdY6JYB0u5sGQv02y59X2xAj7w4fGgshPAxCjPfFrD4BWDC9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8y8gneXR84W+Yoy8GRwbjoWGUEUWcRZWuKW9+6ZJQY7sU9z1k
	uM7/k2GPLJAt9k3T2jqx+wlgcr2vJcYk1cXYej16S1EnyUsyTIi3SHr1MKckww0jRqCbdnXMa7Y
	q7TnvdxCLPh4OknLhNxVd2Lwu/adPAWmnfJ9qnev+ISKvsw8UJZHnSu4d7sHxo2upQzlmvJbHxZ
	PoEA==
X-Gm-Gg: ASbGncvyor/NRFc5ELi8YXU5hyHQiiwQ7C53uI19B+ByOrPVZDk/KOtU0Tux8bXDqCs
	mYnj9B3xV/ybJbI+Q8R2FE3xmHcwA3O8FPygCygbGTXQHy16BMT6pIb0xudl+iPxrBNsW0B4FHh
	AIMtAVDdRnMJ99JKzZGtpCQFOfkAVKrmSZNpKzrxi1rR7f83yXlm/6WGJqRV4zHZaj69QNc9rho
	Z1ZJmaACnwlcQF2kcdmM2IbVUxt6Pf+vwqfKxgmaKpTy0I72/0g1ruJDjUDIPW2HqTjOCkQzc3C
	0y8kIZQFFe7faxk0sMXj1gB/rFlJ2GzgTYjBOjjcJ5hIRS7nfWA+8FEOMCjTgur2dgFhC3w4F7k
	kqwTXemGS5Pi0rKDS5JfmRxixlfGJsoqgUF2f6Xfj5Z9/o5EScKFtOSXBZt28/wg=
X-Received: by 2002:a17:903:1a28:b0:297:f088:56e6 with SMTP id d9443c01a7336-2986a6ec32emr130499485ad.25.1763357887799;
        Sun, 16 Nov 2025 21:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYqUFXKLsOkhEiX9l4+zz+nyyWRjSor9RSpHrl4xaX6xAJ0ck8S4Cs4Tcptvd5SBcxgZNH4A==
X-Received: by 2002:a17:903:1a28:b0:297:f088:56e6 with SMTP id d9443c01a7336-2986a6ec32emr130499255ad.25.1763357887305;
        Sun, 16 Nov 2025 21:38:07 -0800 (PST)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c0fe8sm124895515ad.80.2025.11.16.21.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 21:38:06 -0800 (PST)
Message-ID: <06f4fbac-1f49-4dd0-8834-d23f8abd3fe3@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:38:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] add sysfs nodes to configure TPDA's registers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AKffAGAYrgL_g8pLQjo5fxEDUy27KLtr
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=691ab4c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rf22lFbXz3lptHW25oMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AKffAGAYrgL_g8pLQjo5fxEDUy27KLtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA0NSBTYWx0ZWRfX7DRT6zvFE/rQ
 SWtrgdjQQQZ1ZeKtRrcSelJWQRucQZCxATIGVpRA0zeE/eOr6+gxAUeMcTxts94kiWIHu8XhjpW
 d/yGadwdqPApyMJ/dlYxGVPkRwcUX8u2IggKTS8rj9fxqOV7H5MkhABBdvKNDKwUDsmd7/Gawp2
 DUqhnrl3e3MrV2rY/9x9N5Vzi05gHxyTc5VKOAyusPdFAbZLEAmSrJh8N/RsP5jTMPr5kZuDxOM
 k9lh9FHmVhxVmTUZETr/1IpjLj799UWUgJezBU2D5rMHwjAbYQomtq8a8k2BeKlwcxg9vsmfE1G
 QO0fukQ9h4iCLftkKuqCp0TJEw0haV2RKzwj/iV85i4m4ptJAZC1WloLUwLANyU+kUlPok3CE/i
 MUjKOydjHuyFy2sx1JWmasA333dCzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_213811_905764_D9273AC8 
X-CRM114-Status: GOOD (  17.44  )
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



On 10/28/2025 10:02 AM, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 

Gentle reminder.

> Changes in V4:
> 1. Document sysfs nodes with correct kernel version and date.
> Link to V3 - https://lore.kernel.org/linux-arm-kernel/20250827105545.7140-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Tao Zhang (3):
>        coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>        coresight: tpda: add logic to configure TPDA_SYNCR register
>        coresight: tpda: add sysfs node to flush specific port
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 278 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
> ---
> base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> change-id: 20251028-configure_tpda_reg-f3396f97f9a1
> 
> Best regards,


