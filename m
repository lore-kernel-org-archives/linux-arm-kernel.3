Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60657C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 01:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GytfrVle3ILQWADnYNTelXzFoz+GMb/Nzm6XgJiXcyU=; b=dNtwlbtFO7++4Jv8OvKBLEfyBI
	wpyeB59/Wu7DHJ5JtgPGVn3uKM88LCu+a/Q/TlExJpaW+4FwVD/nJZd0AKym451rLIyCytjGO8wP7
	kaD6n/xbdXgiHI/pyGOiHz8SxEYGq05MF4zmMt8ILBMcSbnF9/Y4+KWX1SZitik8n6hE+MQ3SyeIk
	oxWGVvho4i34QfkxAbNm7CSZljBaRP/ukWf7Zg5yhRmqX41DUpIToXX0fYRkZv2ASw8idcq+/+rly
	hyOx8g6+s6GvZlKHcfxiBFcUSZkbS6OAEUqc/3Kfu4/geSKSO34xRR+1Kt94CdE/2agSPSLlz/Lpo
	B5q8NFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOI9-00000003mWB-0WKk;
	Wed, 23 Jul 2025 01:29:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOFc-00000003mKg-18Ve
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 01:26:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMPagX013172
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GytfrVle3ILQWADnYNTelXzFoz+GMb/Nzm6XgJiXcyU=; b=Ls86somYWdbDbnpn
	QFBqJejSiZyNFrpOvedFjpcyQqspMCymEvQ5Zv8uoTH+yBJvm0jmmN8kTJyruisR
	nTj9JuP/gq6oRLSt6XlJLMBsWstGFGSKZny/QYpcbBR1S860caBGkuwFKNibNNZZ
	Ajadv6Gkm90+SWHF4xwQYrxUAPFpqW70N1MRWsXdZ6c07SR6xq6n/WWcCB1FrFdr
	eJJ6/Ju9EWsAQOxay3osysmhFV2HaA61oXj5Zi7Bd+xVzisB7YWmSqKUMhbCRkQ8
	kP0zJXZs8ce/hQpDmQ2oosEp83Ac+2UYxNqyIiOQVw3i9ciME22renbn5byK3r6r
	0dAZkg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hsdm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:26:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so5115397a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 18:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753233990; x=1753838790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GytfrVle3ILQWADnYNTelXzFoz+GMb/Nzm6XgJiXcyU=;
        b=xKjGZvJC/i7Ju6kwy7zkB1CoT3bU2OKKVsQH52Ksshau/rlE+4cHCfbcsNLrTtDDn6
         KY76RxrAE/r+Qe8VXMbZp4Z70xPhBNEQiVT58PyeiaDV8T8D60ULInmMgAe+HJ66AKz2
         +ujcWCaODa0xhLKlnPy+OyhRDsV14+Lfx5rHInY6VKBqKPVmIhQ285O66XO5tENst70F
         xxX7flBivzhTrfrtq+wSXoggqtsWmOj4gZk9EGYIi6Tr9mWpTlQ0Dry/8PBaddgzHLcc
         aK7rYPnjxTEghsFrbyhjnuD/PeI3UJZcZvG3aKLcoZM4Tmq3X4cgq3EdRFLCwswVng8k
         MDUA==
X-Forwarded-Encrypted: i=1; AJvYcCX2W8uK2Q2dPm1XFfblmgAcwVlCZspwWMGTNLUbZFRREs1qNVom3nFtGPgi9nHNXcOlLBGehzexTUfSmKdpZkL/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcn2X5+e+GKC6p/vcB+vtU1Dz7+oX1f+sOlqeAlgqLk60TfdDd
	chj6GnJ1+IlXkihXmPOjJl+djRn+nXi41HJf/hbzjCblJF8rQN0XrSYqaBBHSAJQwN+RufeVDOd
	ZagLW3vL2ggqxQmUnGnP8ekB5omRAm/beNxFtm30PFYep4EPYRCKJ0qYTjQ+UMN2OwajNpAy5Va
	j7xQ==
X-Gm-Gg: ASbGncvbD9nbw2cq1aQTxAEIL7btu+KwDgNoW0aEb4j3/z6MdhPcdVfzTawHCZo/Q0S
	U8bMg1+EXPsJzrvOQYlol6vWlGD3RGSKdf7t1qzmXxlNIhIh/E6EsON0fLKZ1XlGhUBIaoTZT7E
	T4e1vqMUO62UhtxyRGml9ml/0LNE0VCcOjhfuC4QyOO2AV27Vq1ieFj+pV6bNngy2b+Gx2MVmIl
	sfi3i+dqgQHIOEg4Ka/K+A2oh2Uj7iOWRKDvjcfQ2WcOodO2a3yc0IJ7CQ80RuztLc0nf6XDdmg
	tgB9pbSCU5lDi184uyDtf3hj5k4MezDel1VEPzPuIzUMfiBW7htaLrDYbHCACJ929m5hI845PZo
	2cEYanjbPKzziyfYJ30uZHMQ=
X-Received: by 2002:a17:90b:5448:b0:312:25dd:1c86 with SMTP id 98e67ed59e1d1-31e507c38f0mr1929448a91.18.1753233989539;
        Tue, 22 Jul 2025 18:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4PXhrm5s8sQWNmDBwncqbspLsfxjBdqDsY1USrfL+suPo/bCsRTBTtIyqK2QcU0YlP/HD1A==
X-Received: by 2002:a17:90b:5448:b0:312:25dd:1c86 with SMTP id 98e67ed59e1d1-31e507c38f0mr1929412a91.18.1753233988997;
        Tue, 22 Jul 2025 18:26:28 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519e16cfsm322575a91.12.2025.07.22.18.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 18:26:28 -0700 (PDT)
Message-ID: <4752510e-dea8-4258-a7c2-1d8e1b50384d@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 09:26:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 00/10] coresight: ctcu: Enable byte-cntr
 function for TMC ETR
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <CAJ9a7ViCf=_wmLX93TzgT82vjZvbKj3XLbr8takyfC1niQESsg@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7ViCf=_wmLX93TzgT82vjZvbKj3XLbr8takyfC1niQESsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68803a47 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=HGROPD1eyzCyC6u9zXUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxMCBTYWx0ZWRfX7Inh2NLAFfUf
 uLqjgRjAB/XW5c/yLkAt2RMhJYZYtsD8xF2KTbuBpxQv5usxgAGOe8gfJToUcWmZrGa/eq1Ijyp
 IyMJefw5i9jvFaqbPSjh7Q4Yz9aNs4S+dv3BVM1guXiu+K2nREzrpYMwaMGk+u2KMDzrnKBBgYK
 29lY95CEnKBrB5xSANFnIDxYYNXwHXWiCqY9XwqdwHU09DprbFXQsJ8q0sJL8t+W8SneSoU59cP
 cbbDVi7d2gVsdvt658lISlxtySWiCtCl990NmARZ05iSaqHOkW5qYrBW4pGz6ti1HChaFsJoxkK
 TW9xQOgb69yUc9gicoqiJRTPZnTJsKnY9r4Bp6fKY11mKfoh0heEJabSsPT7efH52bM27yA8NX7
 CFqzzlDy3qVY5jI1RDPP9hwuYcoCvD61+v9I+IXvd9XO2NUTlzGv4WeUOEU0udpqmFC60XhZ
X-Proofpoint-GUID: d7BLdUJrUtoVNDwdVBCZ0k8Bu3YeMl6u
X-Proofpoint-ORIG-GUID: d7BLdUJrUtoVNDwdVBCZ0k8Bu3YeMl6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_182632_438512_B346FC84 
X-CRM114-Status: GOOD (  38.65  )
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



On 7/22/2025 11:09 PM, Mike Leach wrote:
> Hi
> 

Hi Mike

Thanks for your comments.

> I have had a look at a few of the patches. The buffer swap mechanism
> appears to be good.
> 
> However there is a lot of byte-ctr code in the "core" tmc / etr source
> files. As much of this code as possible needs to be moved to the
> byte-cntr specifc source.
> 

I will try move byte-cntr related codes to the ctcu-byte-cntr specific 
source file.

> I suggest having a helper function such as qcom_byte_ctr_in_use() to
> call from the core code, and if true then call back into the byte-cntr
> specific code to do the specialist functionality.

Sounds a good idea, call the prepare/read function regards to whether 
there is a valid helper callback defined. I will try this solution in 
next version.

I have a minor question about the solution. We expect enable/disable the 
byte-cntr function at anytime. So when we jump to the byte-cntr 
function, we have to check whether the byte-cntr function is enabled or 
not first, jump back to the standard workflow if not, am right?

> 
> One other possibility is to have a flag / enum in the tmc->drvdata
> structure to indicate a variant. - e.g. TMC_STD, TMC_QCOM_BYTE_CTR,
> set at initialisation stage to remove the need for checking the device
> tree every call.
> 

Also will check once, see which solution is better.

Thanks,
Jie

> Regards
> 
> Mike
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> The byte-cntr function provided by the CTCU device is used to count the
>> trace data entering the ETR. An interrupt is triggered if the data size
>> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
>> handler counts the number of triggered interruptions.
>>
>> Based on this concept, the irq_cnt can be used to determine whether
>> the etr_buf is full. The ETR device will be disabled when the active
>> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
>> be switched to background after synced. A new buffer will be picked from
>> the etr_buf_list, then restart the ETR device.
>>
>> The byte-cntr reading functions can access data from the synced and
>> deactivated buffer, transferring trace data from the etr_buf to userspace
>> without stopping the ETR device.
>>
>> The byte-cntr read operation has integrated with the file node tmc_etr,
>> for example:
>> /dev/tmc_etr0
>> /dev/tmc_etr1
>>
>> There are two scenarios for the tmc_etr file node with byte-cntr function:
>> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
>> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
>>
>> Shell commands to enable byte-cntr reading for etr0:
>> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
>> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
>> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
>> cat /dev/tmc_etr0
>>
>> Reset the BYTECNTR register for etr0:
>> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val
>>
>> Changes in V3 resend:
>> 1. rebased on next-20250711.
>> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
>>
>> Changes in V3:
>> 1. The previous solution has been deprecated.
>> 2. Add a etr_buf_list to manage allcated etr buffers.
>> 3. Add a logic to switch buffer for ETR.
>> 4. Add read functions to read trace data from synced etr buffer.
>> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
>>
>> Changes in V2:
>> 1. Removed the independent file node /dev/byte_cntr.
>> 2. Integrated the byte-cntr's file operations with current ETR file
>>     node.
>> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
>> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
>> 5. Optimized the way to read the rwp_offset according to Mike's
>>     suggestion.
>> 6. Removed the dependency of the dts patch.
>> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
>>
>> Jie Gan (10):
>>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>>    coresight: core: add a new API to retrieve the helper device
>>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>>    coresight: tmc: add create/delete functions for etr_buf_node
>>    coresight: tmc: add prepare/unprepare functions for byte-cntr
>>    coresight: tmc: add a switch buffer function for byte-cntr
>>    coresight: tmc: add read function for byte-cntr
>>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
>>
>>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>   drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
>>   .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  49 +++-
>>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>>   .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
>>   12 files changed, 688 insertions(+), 32 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>
>> --
>> 2.34.1
>>
> 
> 


