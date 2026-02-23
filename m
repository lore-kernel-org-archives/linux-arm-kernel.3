Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9352E98DF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=; b=rRxGX/sRXmMy+0kbMgJqu/PbsQ
	LsqiZAjbupP8zNeWZ5RCZfZGu9r6Ox74S+0E7n1sjEwBDjojTS9J2oiMN3qXoxACfSPY/KjffHmaO
	AYlsM9v4mXSr0Xymwg62NwaZaR/NtKez7PIHCJJ1YLAcSTQKhdlMp4TCXZS8HuTvD2g+O7u3KQR2Y
	dUvRUMkwRuXadKq432Z1ez9xItZoKdlCuVYQuSvI75c0lh2yzjatosHN4s/9EN5mwV5dVFRHNbOhz
	+t7owtMzPl8F2dU6zknOYcus2QClH3JxAph0QsDdyLUhipqj5w9ol0aZZs9Ikd0xRdJp3cxJwQ6ar
	c6w4iKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPoB-0000000HKCI-2GcO;
	Mon, 23 Feb 2026 06:52:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPo9-0000000HKBt-0PUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:52:42 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5wiGD4101150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=; b=eGO8AH7xfImiiqMp
	F9aSGBz7DQ2D1BHalll6+MBUsQYCWmd+fjr2wcuB5bgcTHhj3pQX+mngS08IDDAG
	lTmHJzxrks3A/rln6cM0TwNIAQJ+hFJ73uR0nAWzwMgRxKAC9tNkB39OXgHvIncY
	zJl92IVj/S579oxyQ6xAqvwDoJrhQOu4vTvI4drRQpQAFYPCouiGU5Jn+KG5GTDH
	z6MzPtv2CvNouVuKBy5PUgpfbe0Im9Li4UmHQWw1ca2yuggFCf9BRWHc1lW1bqFc
	Gt8sDsVsrAjGqZQiD+omPxbg0GPtaE0WeWqg1AXikAWELsfFKHmpPB6CR1ZptZwa
	HB+L2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbbpkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:52:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad7e454f38so153874875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829559; x=1772434359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=;
        b=YiTLV+fymhgDSc4xr4BHkKnQKA3qJCiEyLzZbcJyWReCAFW2LrnvXRqFtA90ReZAFW
         GhXCSEOFqLvlbXighSipe8lQqiZzQl7p14sm4VO+c4+EFlRhCDTjby8mjOWl5pg9/4gT
         BrlaVjPJe+5M2AcA2b5GAINpoAn74F0YzQZuvsJVN+xTdyn5cq2g0nmmh2gjiOZY2vyB
         xFPZGqPjgUbaRAI+Zsvc7BjiNSD6aJ/G+C8A6l70HTG23MYYRAgd4hSN+RkaKIB+1DG+
         zdbr27ToL6tbv6PKzX/xDJ8OB1edLy7OmGfK5n0LtvpO20Soj5ckPPKBbeFMI3LVo10b
         eyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829559; x=1772434359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=;
        b=r6AEkMRVhmk1MR37A/fmGT+D1Udb6gYwPkwlnodiPNLQYf/7uNUX7Who0Wce1vYdBF
         b+r6dxi1TPTaYRCLvtjtren2Q4qWJPWn4icwTRgLnU4dWZzGORsYBkELCzRAEGKW9pvR
         zgCMYXWOGDWBwPTtUuYwhOgf3/oqXbhCNKasSvR5cRezrRQJLwAY3i6KdTiJjQ0bTOVl
         a9AtkVvRZm8dMaRCZo/MGkinVNHWDTOJVexez6b40PDixpeS6tvCjU60TYbL2cD3ZlJb
         czaXNWJFF6SnEUW5d2MMWcqACU5NeGPRBj0wNWLGjI6+mANSh8suuIWJP3eTskp4tAnL
         C14w==
X-Forwarded-Encrypted: i=1; AJvYcCWpiOjVb6tzpj9Xf0pYTXEJ2AWd4vn1y/OaAbUJlN92JkSYj2RwGwjjBHdFf0pszFCKgPh8tC6RPWrqFug3RGLt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj81f6WXXW4S3ibAD33Lo9xcJGULqDtSg41fsR0uDnQvUjRPF6
	cTUdH5K4mmcmJxKvKNiKzCb5m1n6netRYwVNXAcs6p8ljJfPY3PQg/M8XTd9qUS3wuWcIeYr7zb
	t3kV+RS4nl2jkYSmt7t6bAyx8MGER7lHR5p4FFngljM9cyQr7L5yAeTIbrdpD0yTAKsQjT2rlAE
	H+IQ==
X-Gm-Gg: ATEYQzyi9EB0qjjT7fWjuKqB4kelCrJOuvvlqllSSZl4ln5p7bn279Pgizsn92SG5f+
	JVgCgiNixHHCgN8xzGEPfkDs2PBE3Zt6IsiVenzMvcPBfeOGNLjTSIfrPxp/h6yokPSRx4w9Grm
	gaX/PvpqdzmIR0YlHBzwo+7IRAkE/cqQLBlV0c62s4uxyUm8BqVqKd2bPZ8qVZqSBbJBFXksjO4
	NvmvXz9E+d8QZ+GdVrrr7jdRTinuP3PJRa5n2ltD4IZJdcFukZfYZON+Wskvksn6Lp6cU9st3gk
	JO7bA/USXifDay+wqoCNBt5X4mDqQeszVw04TeVD33Ha3lPFDrsVEgXtqagI31LGf4HvhqhplkR
	rx3c2JdqoG6sHmhl7qpGrxmd28c19lsYZJQco++zmo2XgABXSAkKW6J7kviGkHbTgWKXervfOd7
	n/slRq+SYvbQ==
X-Received: by 2002:a17:903:2305:b0:2a8:ac0f:9aec with SMTP id d9443c01a7336-2ad7455a045mr74685215ad.49.1771829559237;
        Sun, 22 Feb 2026 22:52:39 -0800 (PST)
X-Received: by 2002:a17:903:2305:b0:2a8:ac0f:9aec with SMTP id d9443c01a7336-2ad7455a045mr74685005ad.49.1771829558746;
        Sun, 22 Feb 2026 22:52:38 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm61374135ad.79.2026.02.22.22.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 22:52:38 -0800 (PST)
Message-ID: <776799b1-0af9-4b7d-b04d-29e84e18c4f3@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:52:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <Mike.Leach@arm.com>, James Clark <james.clark@linaro.org>,
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
        devicetree@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ybyYZfrNc2QVW_9_dLqoxC8AmuPz1E5u
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699bf938 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=SasFknx-FDtbUUtTut4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ybyYZfrNc2QVW_9_dLqoxC8AmuPz1E5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX9LCDqzJhQB+X
 ulGjEF+vb00ifT1AotX8AgFuUcq0H2Cc7DXdb/U95JRCCsFOWSQc1jeCapndU+1Lr2XTFvVX0h1
 SEo1ONWPO6IlCEWYZtvAenQaf1qrceefbAOVNiImwZNl+Dqsym9hDhi3ipzsxEQh6ktN8C2Pi4Y
 cx5h0zdIMcpBWSCXzXGaMcWlxu6Lh9GJKDRFISaHWpsiTn684mCQEw3W72Ql2eFwjX2kkZ+enxY
 R+MQYf1M5anQ7iPicfx9pKEr7yVnfSAWLutvSJkpm+A1bXKRPLdyr9cGIGJVTDLCWmwz/1+mUEr
 pvCHYHxNRG9GeNgyQG47CfCj95oSmj4VTOqWnLKZ5AL8/KahXtxiv+H4nUNiCs50MomAdm8EinM
 me4aQXE/VfidMNfRQ7uJOixRzjGEXYvJ8gy30UOmmbacSwSeZan8niNC/nTL2WGn7ca+D3IdsW1
 ocAx2U0RnvElEduptwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_225241_154787_039A9BED 
X-CRM114-Status: GOOD (  39.71  )
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


Hi,

Please ignore this patch series, it was sent with the wrong 
version(should be V13).

Sorry for the noise.

I will re-send the patch series with the correct Version.

Thanks,
Jie


On 2/23/2026 2:44 PM, Jie Gan wrote:
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
> ---
> Changes in v13:
> 1. initilize the byte_cntr_data->raw_spin_lock before using.
> 2. replace kzalloc with kzalloc_obj.
> Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/
> 
> Changes in v12:
> 1. Add a new function for retrieving the CTCU's coresight_dev instead of
>     refactor the existing function.
> Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com
> 
> Changes in v11:
> 1. Correct the description in patch1 for the function coresight_get_in_port.
> 2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
> Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com
> 
> Changes in v10:
> 1. fix a free memory issue that is reported by robot for patch 2.
> Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> 4. Remove interrupt-name property and obtain the IRQ based on the
>     in-port number.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 
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
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <Mike.Leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (8):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  24 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 367 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h        |  36 ++
>   12 files changed, 830 insertions(+), 60 deletions(-)
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260223-enable-byte-cntr-for-ctcu-9ce7487b3a76
> 
> Best regards,


