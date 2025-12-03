Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F736D12D57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=; b=HmFK2vZ2dPk7ad+m2Qh+dH7KcE
	XNa4iclgJX1MlDttl4dXC+JViCEaVa4QaxBBFa1LvRaP0jQq7we2k4RJwUvnhVigwL8vujz+36LRL
	x1YWsOMj7pfnm+gUVYRh7qwC23eOAI74OokAZqm56YCYqk/7JGC69eof4aYpelVqCudx2SCUQEoAz
	ZxHU86zzijb0eLgsQomfOD6iKqTUErUnzze/qOdKd9EbkEFTNPSv2Qjp/vmAUfkcmre87rmLvUMcS
	uoNxmcQdI9GFiFfhNgVmFDNHEfLAnkxJ62OXL2qybX0em7Zh9udke7mgehnA3jHu1LG/I9rm1hKiP
	aMxFyDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlzs-00000006Yyh-2Ja1;
	Wed, 03 Dec 2025 12:30:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlzp-00000006Yxw-1lIL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:30:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B396Rqk805887
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 12:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=; b=aHgaUk/C0Cf0iAM+
	P2cEI46fknVlFZLKSgr5FeaF+P+vdR4ILAF+TSQFP6hWuZdVNn5yIAItYFAqbVPf
	kQfPAgRdO4MLoP0CsyDqIFFB6iVFnoahqDofkP6eN9NUS4bf+bkRnTtGACvndBYi
	hBX67SZR3VgryPz/pgUtNyfMsrxBzaFlVKb4h9ihVguGaqP7YMGay431UQCXTfYq
	sYkN+5U3iDs/8Sv2sNNcdd2bqEIBXDzM4ElLJpnByDpUjtNumiVWI/8QssheHNmn
	yvdgRn5j0ky1p6PifAFzm4B5W5JthvbKV5LUgp2vFbQmx41cLPIvcVULz5zx0o4s
	pK6JoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmhxcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 12:30:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29be4d2ef78so81196685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764765011; x=1765369811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=;
        b=VeKzvR2ZqsWoq5fJu4lbqxPHlVWh07YNmh1xEW9yoUjngrPAQlhF4/kPuVFnkaiX1m
         ivB4YUAg8g8JbIcOQR7pjxN4vdXN+gJm+jZ+qwMUQRsx5s8G3LUk0ToP/gxXQmvSxA/Z
         u/Tqujpyyx6VR5jqMoI2Ti/5Ib5TlOvtc4UdgGdBMPDtx/tSZQIcoQ2M/rH0DG+482nr
         ah03OA3BtFZuDp6rnHRSaS5zwKPY944B+442wCF0rgJPCebbEcRQP50kLtLKOZAAEn7G
         N7YFbkyznG/2dj6aKYmvkaI3UIIYPDHXeiMM2sgM7AqCSRpndYqL/0YpBkV8rH+lzWcj
         uAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764765011; x=1765369811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fYex6fpcn/B1nlgT3oL2QgMlu3CZUz/VwJR0bhgoqE=;
        b=CTz/eR4LAy3m/0R0qzyMDncvYBro3Z0WFvBgg83nBVsYlQRme3E1t/7SlBEvBMo2Ah
         32/MvR3h5CbTQpSjFN+282zAJjw1Stpd+kKrVpnI9sRWQqa6fyWG9Ccm1j3DmabKyyuf
         N1YJnVHIL5RzZeiNvLT6sSl818q370ekUviMns5zA5QKgLaz4oSsVqZeIBaKMZs6/c4O
         hpwqHGy7wFWYEqt5PiQ9dVj6M830WKt7X5Y9GkaSSjLBkMHETNAMEwPjQ4y6hEmaB2Fj
         dZUkFG2qAMPF3K3xqU1hSJ1KhTzxj2G2aCxHiMfDvYaY+du7Ka1bcfQ5DHBtXxkb6eHc
         lMtg==
X-Forwarded-Encrypted: i=1; AJvYcCUAvvFvLBAyc58jXPaF3qoJVGJweakxb7J1ad9ahbw3focFEE6Nu/V+QAGswpFnwYXKmGVJgmqFQNDfrCxbRCDt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw79YjIkcc6uEFA2zw+SnxFcq8i/FqDnN+OvsXlv2QPEtY4NhXI
	eZmExnr0RmT0I2gY0vn0+mNAetBenClOJyK0R4N02NfSh8XNesCIblqwZOCEzRPH67D1uCpj9lZ
	2qc5feyI6uJ2VqSVqfxVyBGKHbbtg5NOOnKM7m4PSAp6IWgrN5pl3IApLmbMMYuLpMVAaIwAjWD
	8qSg==
X-Gm-Gg: ASbGncsREnJEvjlvC5JyVA+DiHQZAmzoM5pegSgI+1blF8xZEFsdrV3R03f1Z1BRZYc
	5ztThIelMppKaWqV6kdS0y8I2Vq6h5JY8IFXgIyUYRbDZC8C9uWfzTx5oVL2d0/2W3Zx8sOqmbt
	DOFUPwtx1NGaRmHQDMUX1jkkaaLJx/kSkglllLZBT57DPfQL/CqlYGYtd+8gqiBsWTbNUSQhfpv
	iywBYTqyPIZWkhJiE67/zlC5HUpRk4i9wpNxaunXpUKwsjoeS5f77v3F9iMRNqRYXhGoTRcASyO
	NiW+6dBPQaDrtoWn1HzMqj1VvRPpbTifCsY9KdHLeL034cezuTWpy3Hxqrcj6QcDF5YGSLD64w6
	d9VicovOrPhRrSSC+yeUOJmXiTNAnf4URucgj3vRexhmxWfDqQZc5aY6vU8rmkDPkdzkFeuTw53
	c=
X-Received: by 2002:a17:903:1b50:b0:295:2276:6704 with SMTP id d9443c01a7336-29d683d8d2emr22768195ad.51.1764765010692;
        Wed, 03 Dec 2025 04:30:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi514MvoLWPQ+mY3QhTw3sJim5M/u4DvZfebZxJa2M+8ysnveo0HmfWywoFhk2Q0m5oo41QQ==
X-Received: by 2002:a17:903:1b50:b0:295:2276:6704 with SMTP id d9443c01a7336-29d683d8d2emr22767635ad.51.1764765010040;
        Wed, 03 Dec 2025 04:30:10 -0800 (PST)
Received: from [10.133.33.113] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29d8f4075cfsm880765ad.50.2025.12.03.04.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:30:09 -0800 (PST)
Message-ID: <3e069b0b-c73c-4a42-9d39-9fc5072a2710@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 20:29:59 +0800
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
X-Proofpoint-GUID: -bzu2SFYGv4Vb7neqZdG7CrkZ-Sc8Fvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5OSBTYWx0ZWRfX3MuU3ybN5DEY
 Z1baA2N0Nv/yCPD84lFwGXIGyLoHQqkxcwioIRKfL5BMqjN4+XQP1k86QLoL3jxIoiz/k+a/rhg
 ZOUfjZ8LbBQtqDFXgKXwXM77WD9vmqk49OuSPqpW3t0tbk0PnngX3P9A/R0lGaHgGrlo6pLJ1qC
 VwkKILgpShGQO6mtIs5daKvL6goc8muTvimbybpEuGMIxtV7fjI0o831jKJV4ntzZAAbNAZeMDG
 Ym9b+mCHo9wN+z7TyAzrMGd+okjdg5JETL+QY1OxqpxRRy/F8SlK9Capn36dNKNFuN6nooF9hFR
 /eEcj3rKdo1PFsQzNoClbM9gFypGLgJoiwO8a1RoCjI1kKu+E8yZfDvM88b0scy8nWfc6sTxiGA
 HmMeBf7GopuZlSRQLsViibxlAI352Q==
X-Proofpoint-ORIG-GUID: -bzu2SFYGv4Vb7neqZdG7CrkZ-Sc8Fvn
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=69302d53 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=BaEammc9KrtT-KL9giMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_043013_474637_4479D9FD 
X-CRM114-Status: GOOD (  34.05  )
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

Gentle reminder.

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


