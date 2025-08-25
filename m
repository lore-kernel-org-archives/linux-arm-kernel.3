Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C813CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 01:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wx9Mvwqd/Fupzjh9dwn+ke7htuP2OVC1r6OZYVm27Po=; b=UaRv+hYhMWu+7w8Vb9qV/uzK+P
	ioUEGZJVnN1EF8RJnoutChO+R1vQ98+Fz3HyeyQddZSsiXo6qHp4Anf9/VdmeesoHTrBcMMoJUdUC
	gsJBeex9bskcIyrosUWvBOO2he2goMdAQcfwyexMN0lVm5CTxTX1PIjxQdcZGF4H40u+jZZSjJOD+
	x/W6ztTFsP1Zl91+/AYI307FWzw75m6th1i14mJJKGX6vdMGtWl8OvYvUP8hKh1GF0hm56oowmcdj
	krhba2dtGYg75R2X/kabrU+6jGcWe9XOq62JMU43gwxLjde/IrOuP3VlXcuDd+WAuciRsJjf9wdl0
	c5uON55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMGP-00000006hjO-44mz;
	Mon, 25 Aug 2025 01:44:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMDm-00000006haX-1uRY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 01:42:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONtHlI026320
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wx9Mvwqd/Fupzjh9dwn+ke7htuP2OVC1r6OZYVm27Po=; b=orpO7qzt+8k89oHt
	VNTCILEaVRu5r08lraPhC40re5n2QnX8zJ86dYv3IspbUQW+rR1PINtO4JmLYZcq
	i0GtxtJqs7LUKDXCFUFp3s14NOID8TZHXbFZEzc8/7HPsMVN3qckba24aU7BAmZ8
	bgQjnWzJ8fODxB91PvQwzNEFKe952WbjwPb7N8cO1UHJ/6eAJ2dsKp5YWqRgCjxQ
	ci19J+G5QYKJR0RryHO7VnH3Xu48FtBMqmPyKpHCXAWHIu69VB1sXwrX9DLN9Se+
	uAIlyezllKptof/88CixLWBBQllWTBwIiOvjleHvtACUbR7K7MNGyTo7bK7N9Umw
	R5kCFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615b9q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:42:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so43829145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 18:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756086124; x=1756690924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wx9Mvwqd/Fupzjh9dwn+ke7htuP2OVC1r6OZYVm27Po=;
        b=qDY4kBVxPOtD7mIAw9SEBqLZi7vmQLxmNN5yeqiB5xJcuP8nAzUxIvcBlRImaWnlqE
         rRF0UpukNov5Zld18B9W/APYkCaZR2v6nJtVB4sVqvWhXN+3f39Jhj38vXqgFy1JymGn
         jWHeaMw27Bu+2qgPvxgzGTDbeW4vuwMzE/PFj0Pru9V4l8+uLb4gpGtvdI/vBlcUroll
         BBhgUtxAfBM0RIaMmP1/CDF3Gronn/EyH/Xlmb1O0x8TqVDcZ3X3efNr8Sh4z0hnvxq7
         kGXxmz7Ty7VLGrPq5zeQniq2HDTgpyLpSlDY0Jwvu9yVEtx8RbGdShd39WTr0Rrs2Q5a
         feXA==
X-Forwarded-Encrypted: i=1; AJvYcCXxWk5TwWdV5dbF8Hcl31gpaYac3egfXZy9ErVCvn4pcqV5f+XftKWbrVm8xqR6+l/1eqwZPGO9L3MucNj436BP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7fT7JkGsodGsq8olLETvJ0LtuWe+cLZmFJHgIpH8ifJDME4S
	IPpA9V95tN/ZkfHKDmpTra2SHcwuNyfuqun8RZFTqcyiDYyea11fa0unTGKxQ9u3HlYtaZV2G8W
	SKOJQnb9UYV/qGjpDMqoN5SX9DmDwM0Bk4t8gteSIypD52PuBXr/tFEDOGpl41/vLkHCkBz27az
	CZyQ==
X-Gm-Gg: ASbGncthcY03vjXecCtxEHQrB3DXnJjj0VoWVraSVXxc8tFADOUIgr03vkMY9ciUMMN
	juKr44COSf33GZur7wIiDZWcwmRBAlzSHfc4I6sBaszoKnmL/+BxuO21pu+I++ec3cCeHF7kGjr
	x2juPHkOLn1Wz3IfHtQ2vP1p/8bb8yn2+aH9kVpVWQsboKZhWUR1UGAqGGWPO62cPqWDfB8BvOG
	VWCmoVlSbpYCVwjCkMOq6eht9BNbjT0hoPIUu0APc4+QnuSV5iWR1IXiU58N2mK+XJC0aAmdmLm
	T+d/nJmlgB8c6PZ/Yv+5J8SSjdBwitGbuW6CuzJC0wlJBWVMhXhXI3OZPihAO0OQRc4a4bewL0x
	B7vOi0WYqyNEU7gPiKkC8MHBgC3OrUQ==
X-Received: by 2002:a17:903:1b06:b0:240:a559:be6a with SMTP id d9443c01a7336-2462ef4446amr141635275ad.34.1756086123870;
        Sun, 24 Aug 2025 18:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFpg+bpZ7QwpIA5qa7RwCY04pGTISVYnR1wJpz4Jt6bzorPDManuuY4IJYjNnbtQCMDCdC8g==
X-Received: by 2002:a17:903:1b06:b0:240:a559:be6a with SMTP id d9443c01a7336-2462ef4446amr141634875ad.34.1756086123386;
        Sun, 24 Aug 2025 18:42:03 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687af234sm53290055ad.48.2025.08.24.18.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 18:42:03 -0700 (PDT)
Message-ID: <c4f7eb1d-79a9-4fa3-8cfa-0c499b394da2@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 09:41:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX1k6AWQJgP/Qd
 BBDmxV/zWRk3kYbU5iqGaojYRk4F9piyAxq18dWATitNeNVNKUcL/Wza9Is3zzBhwVDDa01RZCL
 QYBKM6s5x/xppYlg7MzFBNAvH1V9Brb2teEXPViV7/sdRwAWCzG95abqukSQPhg/C21/qCCykfJ
 pQPxqb/PHbvIqs+b1dUJNVnGYCflI5BZSPSO8zBt5qoNudfnl6ZauHMeuYwuJ1nsqqHClmFBBKt
 +coFcEe+o5DEHBJ1cXbTdsi39BNLzC5wjcNi108SHNkbMrRC+3AyArpXWTIVTM+BD51gpNOd9CS
 4FJaV6xcl3LLyykgU4lKcSraJTSwIIO/0EMX/50jZgi9H7fka6bd84krIo2gDt2waj6fVFRI/f/
 7KKt+RbA
X-Proofpoint-GUID: rYf4Cdlx9GtPKvuyqqkBDOV70iV1IZGL
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68abbf6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BaEammc9KrtT-KL9giMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rYf4Cdlx9GtPKvuyqqkBDOV70iV1IZGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-24_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_184206_632607_24260F60 
X-CRM114-Status: GOOD (  33.53  )
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



On 8/12/2025 4:37 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 


Just a gentle reminder to ensure the patch series hasn't been overlooked 
due to the high volume of message.

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
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Enable both ETR0 and ETR1:
> echo 0x10000 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
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
> Jie Gan (9):
>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>    coresight: core: add a new API to retrieve the helper device
>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>    coresight: tmc: add create/clean functions for etr_buf_list
>    coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>    coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
> 
>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 +
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>   drivers/hwtracing/coresight/Makefile          |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |  59 +++
>   .../coresight/coresight-ctcu-byte-cntr.c      | 368 ++++++++++++++++++
>   .../hwtracing/coresight/coresight-ctcu-core.c | 108 +++--
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  62 ++-
>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>   .../hwtracing/coresight/coresight-tmc-core.c  | 104 +++--
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  39 ++
>   12 files changed, 824 insertions(+), 59 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> 


