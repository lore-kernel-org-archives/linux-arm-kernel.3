Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6ADD31A1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=; b=zH88x06aj7C+DPvjG/jcB99rn1
	yMqx1cn7Xu6KzwU72+UfDu9tL+fsXogrAKwPNf50cDp6k1MIRmeOPp/ZeEEnn2gYxrbbeJVTivtoe
	0UAy5JaCVm2ieY/aVSNokLMWSRgHqzD0xX4oJ1nPlD6lGnV4CmoGUGA41YuvI8GtAV1Pn28MsZbqw
	L6z6z8MPphwjcqvh9i4wgqCrxtizgx6AS+ePpCSk5Nm1mrlR9GVvnG6I+z+PZh8oO58YQIe+JgGtA
	D1vo8bsbeM3CB8s3i8rBNgygFgLlz/EKxasBrLiv+6LCmhcMpD72FqsFefTIRAp8STGAK9frg9k6j
	xizuyRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvc1-00000008EfS-3ZdF;
	Wed, 14 Jan 2026 07:48:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvbz-00000008Ef0-1JFg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 07:48:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jLQR2976769
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=; b=EzvE+lwH2jTHb9+J
	LBrBMbIN7Lgb2VU69/w/hcUgnm1/+cP3W5Rq4/2aBg8pvTbDeAalhCnWkxc3TuvH
	+gfscO5zGTiQU/TLeTcvxxsn3wuLSnWkxpCwyUvXorwyl2QP5E2p0QnX0hqrNb9X
	l7wyKizsLoqYhsN8hdqxM4KYNXKZlfVKjx00WRV7udRyVW4ZagI40vGNWu3w5Sov
	fh+j6j/hNIHrPud16Dyrsdn+qC/t7MDcPBiMOqif8Qo7THmCKvZzRpIMfd/C6vZT
	d/cf8AdFdzLt934u6vNjE5DZgqbT12dKHmoemrujOQ6b2wZrM8EWOvWke52cepCQ
	KcJItA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63tn6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:48:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso47287045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 23:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768376893; x=1768981693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=;
        b=eWI5sMSDPq0et7mSYqQAOSjMo6CLFN3nroKLmWJ6vM7tBXKrbkHzIbh/ycYZbwsigt
         PqbeKJaFpdNLb2YqR5YGPr8Mc9VvQlLHaiyu2KErNKKJtWeUAmERKUCICSowtgeo6hc4
         QeLWh933w10EzA61IEoYHZwmhhCs3mdv4Q9RMwp0aPHx6cfWXMJYIiFd+omkCg4kjbLC
         c+CkOwlg5RF9xql6dAe/O98w/rVgeZe4Ys3tVIDjRfpDUntVniSU2C41xsJri/Gn7tX/
         LmwBJcV1Sg8Y3meZUuAss+JePqgZ8XINEJVDQKRDhCfcELhSaykKNp2zt2QWIJ9C/W1c
         iy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376893; x=1768981693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gY4BI/MYsFUxWag4nvdti7umyW1lsf5MGYpPancJk4=;
        b=rERMCiAdE1ToV+A1dop9vgeTL3tMmDPAKZklYqrn+YGZzQ085VSa429P9WavK6tpxD
         oS6DRmSyfe4Em0tok2ryPZSaKVlqiSVAYACkCMK0X43SUoVD5Awzq0svVmBMyRQfewZv
         xg7LpzM2N12wVDpSyLyOCRhSB+NZP9T3Xo2MWeN3FUXeQVvOg2F36JiZ0Cq2A8H7+jQu
         ur8U38ie5k+JHUZuXIeYOMz3hy9CTXgUpATCGOqh5pqmZtWc2b6T0Bfi309nVQHDC8IJ
         AqydESlK4BoBtgLMED6DASAxjBCWnEqR1KdN2pPPSkT7bhEa4giFZ+vkq0Q9Pkl1UB6j
         JWQA==
X-Forwarded-Encrypted: i=1; AJvYcCVcs46UaCnk9i+s996mAb/oiIgLR5KguWEBsRPqoT7WDnCgo4xXkK6Udrc5TEs+QKQCRHfslAQzCdjRAq2qj4Z7@lists.infradead.org
X-Gm-Message-State: AOJu0YxD8Gt/GFcAXVcgwMzwAYu8uvxmo2o0u6Vqf8MfR+MBLOLaQBka
	WupDRyM4boUpqHw9CC27mvjKOk9zaLdTgVFcQVg7Nt1Z2rx6YKofWv3+Tf4S+E800WevKW7sZR3
	29j5rTZzGKcPV5cBXsr6efMoEDvCi/W/PWVfePgANtNP09CXsHRcHEhB4Kke24ibmUeEr8tIxEC
	rvUg==
X-Gm-Gg: AY/fxX4lymCsLYAPvZ1ijZluixS5uAIjoq9WSyIrqW0dbz//rwb8fScLxqDd+wbtbcn
	a0J+5fbfv97EwHWB6oD67yUo+ouAPgr8kSjFFxF4pygSiKl4qfGnWikyeAk82Mverhnc+qCtboy
	nLS2lFW7Uc56zghj3zd3j65oQ9hizztuVGZuKI+ssizUhizR0//GwqZzFRCokl9DkmojivdWIuK
	pIdCnHXHXpuGf3JvnPdXzJXloBb+tcRmrF6a2/Ly6gMGCDPl5jyv29dkg0F0H0nWA9UDJtw4jCl
	7Gy1NDcoysYJAWlABtlf/qxvMvR5Vcja5EWubeUFFD8yXX87s5qW2NBgi1JhJqY+tEo5uHBrsdu
	oJipBVdv9/vIJDOwtj5sDxoa3FkO8xq6tpvNR27SPv/IcAiCTx9Y3zqS1T1nlDlsX8ojyWJ4rbz
	4=
X-Received: by 2002:a17:902:d4c9:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a59bc6c386mr11611995ad.52.1768376892675;
        Tue, 13 Jan 2026 23:48:12 -0800 (PST)
X-Received: by 2002:a17:902:d4c9:b0:29f:87f3:9c22 with SMTP id d9443c01a7336-2a59bc6c386mr11611805ad.52.1768376892172;
        Tue, 13 Jan 2026 23:48:12 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a328sm217118275ad.4.2026.01.13.23.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 23:48:11 -0800 (PST)
Message-ID: <4e6053d9-ef1e-422d-bbb4-e39e103e93d7@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 15:48:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1OSBTYWx0ZWRfX5ZFHMT5QEgWG
 q4pckkUdT2M8hyhlP5LlDD0t0z2W4Oi3Q2sD3acgMmSIHp3AuslxX44IixBK8g+X81tQpWnWDws
 X+qgnwPwJ8P32/2yUV+mWFzpU5/G6FO3hAK7op7wbzBNzTrrHX3HOeKD6/z+jd9Ocgha35Pjt+B
 rop/JsMm49S2hytiA6IntrevsyFWsFsj6XrFhYlujC26FQwCdHt0qyaiEe+wTLyKTKbB9rOKk/H
 hPH7YW04+xvbPyoKBpHnMlOaXJi+1FsIMgNGxv0RMOQP13ftxisPW077lXawbxo7lnzajuKmKRb
 nqkQebDUow64+IejsSdxSKteRBqp9U2ARA+rgqZX76etu1evvgNE1qZV/JbTcfMmg5F4gCuWbd3
 LAyLwEacQqKWph9GLkCst8N9MOrapdxQo3TGM62r0lNVrdBWr3lvdYIdJEZi8ka98omeSUNxlqK
 X5NaxxUxCVW0nX02VBg==
X-Proofpoint-ORIG-GUID: oS-gcs0dZc1pBI8htbm_Zrygx1RfPRte
X-Proofpoint-GUID: oS-gcs0dZc1pBI8htbm_Zrygx1RfPRte
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=69674a3d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=hyi39RYjpJE5wifr7rwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_234815_372216_48EBCD17 
X-CRM114-Status: GOOD (  37.51  )
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



On 12/24/2025 5:06 PM, Jie Gan wrote:
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
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 

Gentle ping.

Missed one more point of the changelog:
4. Removed interrupt-name property from binding document. Retrieve the 
interrupt corresponding to the given port number in driver code.

Thanks,
Jie

> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
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
> Jie Gan (8):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
>        coresight: etr: refactor the tmc_etr_get_catu_device function
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's read_ops with sysfs file_ops
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  24 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 104 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 144 +++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  40 ++-
>   13 files changed, 833 insertions(+), 72 deletions(-)
> ---
> base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
> change-id: 20251203-enable-byte-cntr-for-ctcu-5a4b88f2feb9
> 
> Best regards,


