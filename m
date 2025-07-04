Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C50C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=; b=LMfqWaC8NzVxm+F2Ef7Zh1lvtp
	HDTT/JjBi/C0vNFU2HpbrEaaGsRDZssO5AvaqfSiDM2BO4voz2uOOgQjp9MxC0GaboIZgVTwVLYHK
	k8HZjD+mr6VDwv07jIYukkBbz/ApCbg065fePRFZA8ank0c933jCiWJhQYbuSRR+c8BTl2Mw93T6+
	EaUIi/HY24lOaPlC3rxNEqaSHDEmu927MMsECinPlUVhwcWNFxkPci8OLGbPqGn3uPTjjLcjB0OQs
	BnevfwtZuDjoNKNqIu/s4anahi8uKhNCNaDZoURl69CPfmc/d1kV6+eJ6C+qayaWVrN8jzMw2rSvK
	dHj415sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWVY-0000000D6af-2NN6;
	Fri, 04 Jul 2025 02:50:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWNE-0000000D5jD-40hI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:42:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Hw7OC032412
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Jul 2025 02:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=; b=S9CZwYt3snTN5xZK
	j0OkC87Dit0j3HNkRLGdoqtO8qJ5cTAP768R4UmRpASbmOtIrB1NQ4Ypw0Wr/lNK
	V3rhtK0KN3B+YeYV09gmzfEinf1vEYzowJfIdhfuZghbqhbT+y7muQX7hC8tItHw
	ogSR5UJv/FKCvB5KWs1FuGLIOVHAr6OzsP9aI6EXkbP+tLR8L2tm0tKfbvasY8gA
	mqtYUv9R6vNV8QPOZZ5yWwdzN/ldMUmmPt7RZWa+1g401NuruHv0usrA99SJ/3/B
	BgUVZ41XiZVhUXKLcmadhNdGwXovWATIA231YPm9xDPoFDC8HCSLHmycOQSZKBRg
	JE+CEA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ta25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 02:41:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b115fb801bcso576330a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 19:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596917; x=1752201717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=;
        b=k/cMuqMjAU+3Vj9hsMeOIC9QVQ+9txEwk0N3q5go19DpZH0RItUs9on6UcJiWxG8KS
         G52Gq8YVf+s/iZ8EEeopkT2UWf/SUh0xFiis3dPUJPRGkrO7gXoFOLQBpOEyZKx4jskA
         KqmJp46cVHX0vwnBoA65TXwDEyeH/a6GaghqQRxkulnQJsh9/obLTBquS3M6p+dzEwhe
         AJpiVlGzEzf30ZcJzhdDkubN9fyMAPb/DX5HEVBNUOufHCxlIPgRmhDLyfdpLfP2B8xS
         vISYd2dK4cxuIaKqYCAnS+wND09n5r7GWxmPFCDbGcLDmo/SqecCQPBLQ4UYcpEeneOl
         H6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWktRVMu0XA7jPX8CNOzb4CVr+Fjo3p8mrK7syszjDrmIijkjpmej8QYZuxr/pdhEI4xMGdIvuhS3Dl4F7dIr0C@lists.infradead.org
X-Gm-Message-State: AOJu0YytIug0ldBtSLdCSMgsWLG8aP7x9oTfZVOnJtAPy7yyuo5Xy8KZ
	+wAo8nk+lsZYAHv+H6N0vUqx7uOy9HwS7v5pv2nxypovZe9xpN8o/MrsED3KBUyI2yEpNopMtyk
	Ym1CezheeiL2OdLK1AYk90xoUIXEIfrZgbXoCn+W7oNW91RuikUHGngWlIGlxUVzJYQ7uY+cOoS
	uztw==
X-Gm-Gg: ASbGnctN5/a6qdOi9g6NOXKCGC/L9K6IT5HW4MnMyXJzPCdgZ6N30GJKyDzxP88h6z6
	GzrSPQjCbdKVH8vEeB+//z4/6JzSApFK4dvIMoh+2uEf21RWBwDBnHOcewKn0bEz7w6ycjMlZ/i
	KSBVLqqI0XiBbHE9+wVgMTjjnTiJT2C0M6LTCZRdUgLnTYB39lmGZqqxEAxhyywaGE75UV7uj7o
	UGN0ly+wGyDWGVNcEpX+wnPgavcWl2yfbb13R8UlB9hJwYgQZGcTBe8APozpP8mD5Jnzhw/ZqNv
	FoMlJ0Q3E7h5rfyXTV6Uv0LU5UM84MK7SpREwlH4mVvDK2F34TrKmYneXCRfX1BtaCidwnA8m/I
	rAhdrxOo=
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17465065ad.14.1751596917322;
        Thu, 03 Jul 2025 19:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeWqGIPElykE9v+hg85L5a5KZ3QAOpihd97fl9vgoQOOfdPXTblhDGoYOMNi4iH4oHDkr31g==
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17464635ad.14.1751596916850;
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Received: from [10.133.33.146] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455db09sm7648685ad.121.2025.07.03.19.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Message-ID: <d628c3da-4e2e-4d9b-81c5-8cf88628e400@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 10:41:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68673f76 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=UyySFntBJEnY6qwGPMMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _wfTPwUs96kTFLQOcduLwaUgUGJxy4Yq
X-Proofpoint-GUID: _wfTPwUs96kTFLQOcduLwaUgUGJxy4Yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMCBTYWx0ZWRfX9If2fzo2XkQG
 qdjAsN3eUveDs1Ry2Kk94PixIcaYJ7qNfDTqBZ9zKsTbVl42NiI+vHRs0r4hhLrKg70oxZNN93I
 TD0Mj0Qdr3hsTsixyTeFT+id7L1vpMsVbBZC4pggJdDEIOAJ3hx5mxnepkzOU3/TSaHmR6JxFKm
 Z146eber8/4423KCWsBUr6f24J6sCFTPGV9LvFKwv0DNkSi9Tq8pmHeQ6zg5h22n053i6lGh/Gs
 bL3qigKxJIkVAaO0NtoF+ICTM+BqQ9z8NQf/wO10pYWxQ5mwSHkKPz0i5FykZzwDWA69dLAdmB7
 lI6yu+EXNVmsVsuwP8T2TFh3jfpWKPFa5VBy8Jcg0/J+jFDJGPwQgZV5lpLlx1gQnrmYbKJsZ8m
 9BW1JMT1hPbtm8RnAbSxvYj95mJXSyLs1RCzNl9zbGpnKwfFqQ+4MzlFJgbxaFdhpWxHUG9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194201_125391_63D57A23 
X-CRM114-Status: GOOD (  29.39  )
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



On 6/24/2025 2:04 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is tiggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle ping.

Thanks,
Jie

> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr, e.g.
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Jie Gan (10):
>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>    coresight: core: add a new API to retrieve the helper device
>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>    coresight: tmc: add create/delete functions for etr_buf_node
>    coresight: tmc: add prepare/unprepare functions for byte-cntr
>    coresight: tmc: add a switch buffer function for byte-cntr
>    coresight: tmc: add read function for byte-cntr
>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
> 
>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>   drivers/hwtracing/coresight/Makefile          |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
>   .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
>   .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  52 +++-
>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>   .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
>   12 files changed, 691 insertions(+), 32 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> 


