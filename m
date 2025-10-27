Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B807DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTL9y5hoxBaPgBxu/x6NYcj/Eee8Myu8VJAMg7qDJgo=; b=h0KTIJygkH7DoZ2sgo2Itw3aIM
	HgeNGyB6YWrCoVyJSt3uNn/hN6yA41hA5AW6sgq+6Gcy2csCIRuYOxDZJNnaRmCLeY3bizxwuIM4A
	r6BY39w/69gaahSdpIWwuMmmFRcbmT9lwEx6QUo9pcGZEaDSRPJAvEe7d991+fxGyG6f59fdpTHK3
	8/EwBzAqIYpppjERhGHlRHJeVyYapj2D9GUC75x9XPGS5wVRKQlniK9NKTBFysx5ToymWOHRriw1+
	fN8Tp9+L1HkEnHU5DvnrSqXoUq99CitONT6yhjWSuUYl6McPlIsm09kqxgE/ttJgbaWn8y0z0XcLt
	0sha/b8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBmb-0000000CvlK-0qn3;
	Mon, 27 Oct 2025 01:12:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBmY-0000000CvkS-1b6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:12:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QNS2oS1041684
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTL9y5hoxBaPgBxu/x6NYcj/Eee8Myu8VJAMg7qDJgo=; b=Xpl8wnw6QZhQF6MJ
	WmRSG9ZOY86FBON/H9krw4KOWDNiumS1K9g/05uu1IpzxgpkAB5J88CFCrZpJovC
	gF3V5ST5uVg1YG63b5E+mvXIYgNnDTlu527UELeKtRsGY+3mROt/UeuAVnQsQQ8f
	c+nq1vJUjs/ArJyrGkKV/D+jkiF5vP4tZik0lbvYtli45gvX94i6AoYLPpqSEdbR
	KhjjZIeaVaxJWtsj+eVmHukVORLS8n2un+tgOzV00EKeQ98c/2a6tJ1VlfNuoxoQ
	7jDM80Uk2HEf/bmrmQJWMn/pQRb3b6j0lGriq84H8wRktq/sZTnWwghfV2r8QI7o
	txdnlg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0pmqjsry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 01:12:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2909e6471a9so27235885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527540; x=1762132340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTL9y5hoxBaPgBxu/x6NYcj/Eee8Myu8VJAMg7qDJgo=;
        b=BzNlUVky26OTonkLhoX45PQmDHmXUUz/bAfcukfLP18W65xOEhOL6LRbyovgyfMNN8
         OccRoCp8FQ+YveaEKZjy3o5HRW8Enzs7Lg9HCvYIeusA8d/owcu8G2nmtMMEkImvxe2Z
         7oShxVIb6eumfvHT1MuJUolpL/lXTRGu+HTbADSr1G99idjT8pNtYgb+xMYzLsLSu8G5
         6dSSNlNPwfjw3BT79ycUa3lnl/oXqljLZn9TnkNACyh3HOkO9HA08Q+8z3gtfLVxmPaE
         f57i4n446w5NTwnmq7LfgzlXm4wgbLtMovGTaPbPmCAd7QKS4ex6b/+f6BaMNWSvtSdd
         oT5A==
X-Forwarded-Encrypted: i=1; AJvYcCUculqr15Vwav5AazuBJp7IDtcwRVoJh5r6pIsU9zZvwXAG02r+7BeUOglPtKZHzRQCaTdpktvj3pX72Hp7q/iC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd39aVw2sW5wVVYVMWoRNkkb2hBwKHfstR4SLl0Q7NSIOBqyKT
	Q83l9L9kYyS4mIa36pgP3E4rSTmA1hD8G8L1b8kwyjrHrtxnPwV8tovlC3OAdlR68rSqTFAdC1j
	6t8zwFLSN6RoYs7AmSYd7qfS26MO+tKOFYonQIf1+yToVRAfIy3d9tIFkQ4Gte9Nm5P23p+kRek
	zb3Q==
X-Gm-Gg: ASbGncuvHd7Lp4Q+dROmg42lVzT04Ed+dRwXD0TXb3JoMqFKB6iONkOegdcUW4cURgR
	MrhgkQN0zu1L74K/Lfqk8eub/iTKF1XOojq2mxcwG9PHTQyPZF94hsXufgRi0dQXkLbl3M7bMCn
	ie9JOanfN+D7g11S7oU7s3hYYsOeXZaEzLWCePXJBr7+y+Er/UQJxan4EyzawcdEra0MXx0BKNr
	AMyeUYMY8RvVW8jJC+qFpFFjxiV5i/Dgpjt8oVNuE+jFjELfV1MZy2ya19Bb++oNn4jAOal0kSk
	KNeboJo+77dgpdbNtdEKeJIvhp0YG2LgtRpkQCNa+FEM7yUhXLXBWCQeGKCMbktPwo7pWDWPcB4
	XKE9J//p3HMGJPdZ+45SgUf3SPcdZvvd17UcHKstPrY2c4HQAmDrlF6USrBol8Ufi
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id d9443c01a7336-290c9cd4adbmr405070045ad.23.1761527539603;
        Sun, 26 Oct 2025 18:12:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElV346vt6mTLqveixte6Rt17xgJSsxWZg+bp/Vx3HjPF1vQG+l9xsJz6G3G/KOm9+o+if/zQ==
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id d9443c01a7336-290c9cd4adbmr405069795ad.23.1761527539112;
        Sun, 26 Oct 2025 18:12:19 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27541sm61527645ad.61.2025.10.26.18.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:12:18 -0700 (PDT)
Message-ID: <06d76546-badc-4035-8954-4c3e13d2fb22@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:12:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan
 <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xMz0ti-PfaQ7wISy9CGO8Tb4eReROrpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX53S5FfQMZ06A
 s7wdv9WE0h/wVi6HRbNZeNXMhWSi9ps6KyTqZJcmM0w8icF3z5qHlLJSibGkt5QakyMmaAgLSW3
 TlovmOQZ5rRpV28esQiur176ENPXPBOcaMRz3vTrrdziHYrpJFliyrc3Dh4Wgr9XXNpd9sRo306
 +CKVCQu9g3GFbI/nVoVmpNu52BFsOioClh9Q3s6nHRem1rmsvuI/IWKHIO1nbz+Kn7bw7Lw98Qs
 qQgtbib5mG2+5Gm4pRSRaqqj+GWItEXMMFF9+2nE8zR0ihymWZOf/agUx5jbTojQtiKONcO0px1
 G5U15jWKvaNI3rEvtkK7pgDWiUGDlGyviyDy0mtyQZwj95Vl+FLWrJVvf68nYP8/QIdK/daTFWy
 wlbd6T4bNZus81LjNYAc2WeZcUa4jg==
X-Authority-Analysis: v=2.4 cv=Vf76/Vp9 c=1 sm=1 tr=0 ts=68fec6f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=BaEammc9KrtT-KL9giMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xMz0ti-PfaQ7wISy9CGO8Tb4eReROrpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181222_563521_000D7FA1 
X-CRM114-Status: GOOD (  33.88  )
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



On 10/13/2025 1:49 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 
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

Gentle reminder.

Thanks,
Jie


> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
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
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (9):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: core: add a new API to retrieve the helper device
>        coresight: tmc: add etr_buf_list to store allocated etr_buf
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>        arm64: dts: qcom: lemans: Add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   6 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  17 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   5 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  59 ++++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 368 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 108 ++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  62 +++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   4 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 112 +++++++
>   drivers/hwtracing/coresight/coresight-tmc.h        |  37 +++
>   12 files changed, 825 insertions(+), 59 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-enable-byte-cntr-for-ctcu-6199b791b77a
> 
> Best regards,


