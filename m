Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D20CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU+0R/G/Y3ZsDdgpJd/mLHi/LCaD/2CsWsjDo/mPKwo=; b=u0F4EDoICFm3tgJMaomWTZTUOf
	EL1O9CmwY8OQX0Wqei6KKHKTk2MHF2L437u9Jb7NmW62CzZSJenETlew42PDDkUnIydAWMZjnaGnC
	K72QFq0GJKMD6DISn5iz6gPGt/53SYlyWIntoFr5534XYRiTxOdpKCHyVwpnnrhlGxqn/XnJf0d++
	ZuZGaDcc3wxEr7l4q7XJPgWrlvFwO2pUz5Awr97GKoRLW+orD47YXSRg3cHADQsbMKQSyUgITc8Zj
	UBDNW3hLuNvHC6xKb0q/Ib+PqxgRmNnmUCMlGHWdbMkRufZ4m/PRLlTi5/2TVYW1SdjFOaatfzm5h
	Mz68omrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e2Y-0000000Dpe0-1O4b;
	Wed, 02 Sep 2026 06:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e2V-0000000Dpd8-3GGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:01:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YIv2458756
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 06:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nU+0R/G/Y3ZsDdgpJd/mLHi/LCaD/2CsWsjDo/mPKwo=; b=AGisfQ5YFY5dexGO
	DYuspkyS6dxBqfbg31nB1QOVqpezl0ajviG5tekijqSm8OZFCftNoaFA6uiFdlFp
	BSZp+5tQ6Z1IS9EalU3EUrzVs6IoYUgPZAphhu7D++LxgU8mnZeGwlWPXecAnfHh
	lxAeMPIkEcF4PTpvrJTDZHkMNgnc5D4qnteMGwnuq+QPZKrBfJh9efXARwLWYE7i
	zj1Pn+8BPeYHFhd48dXjsMM3oROy1n6sPaQU2iyyx4wBi5rIzTMm978WZSSlsn+b
	dviWBk+xqPEbAbaW3GCRk8M6gmJrRF9WNH2i847/ffUJO3svk3e/ODPBPgZOT/rK
	0SBQcA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435t407-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:01:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so1712436a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328897; x=1788933697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nU+0R/G/Y3ZsDdgpJd/mLHi/LCaD/2CsWsjDo/mPKwo=;
        b=H32IqBidFP2gnbrXqtzuVPKXFn5irDC95E37phR4OVuF+j8WOutlBduVmr2oLOjWT9
         KnZJHsQv89dwEWlakAkOLbFERD4QhoiO5QQJb7yqXDmgZFFGhjnCYYQfQrkXhnMTDt+9
         uDmbUq18jgbGysrYhwSddee8FEmnoVH5+/iLFnSSzroOMDL1wrhJi1YPVqhQvQXf+7i8
         4xjvczWUYtbVitYYpB5Qr1aR3ouLmpcfDO3vmGqY2DFU0KzX0VHd2XPvV5Fk9LqOFwiO
         M40/dVekfj/3M+lIXlHTSrBvuwsE852h4jBAR3DtkTdLPQ32mvN/Nmthimsb75wMZHvY
         OiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328897; x=1788933697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nU+0R/G/Y3ZsDdgpJd/mLHi/LCaD/2CsWsjDo/mPKwo=;
        b=M3pbufY6uWlAchWVkkTO4vX0fkuPqn6PGemrji45NyjFSqUK6wpBZBegT8uJG3ByGr
         +RhPt4kmfjiS7Y2unVLk80Uh/f6LPp8cqcqyZA7+h4Ws1lAYyOlPR5ZUr8r2KGRtGJ4r
         C23nCb2Hrg8TEDLko13264fMWNVuRIi1Z+uIc1nB/EkSerGrZs95R+zIPB9Zqzc2uwFe
         BeMZ1J0x5R5FOTy1ChQj5DTYeT0I3b9Gf1NGr6GQstcq73DqjfF51rWa52v/1o2pA9Oa
         2ZeK3ghP1y/M8WZzZiG2UMiLBwjETccIx7pkdiSafz1nAgzQPurWQ/IQHkLMdJlsW4Cn
         lwQA==
X-Forwarded-Encrypted: i=1; AKwUvBzhE1V/PZO4GPHnqobyQDGeUJYVnthq9VU+EwvxFdk+p9VnYLkAj7AFKd+5ZVdd+rIK3PuXqZNeanjjmWhXuTL2@lists.infradead.org
X-Gm-Message-State: AFuF++kpJB8piSak5Uwl+8PjMIJ6o7sT7qZdijwKOg4DRuOmmTXk964c
	IzuMQ5Upq9bpbjGV6yTUJuYhPptvMQ/mNrs6IxGo6vOfZNEhFxp04u6JIkelTw2/d3Cfp+AgIhE
	IY8kTceNFROh6mUkMD91KXL8qnQI897QPrBLU8aBGQJyQoEYXN50++m1PQhZs36Rg7xBSIcPStK
	GEuw==
X-Gm-Gg: AYBFou2M4Cq594T2QVIAyOXUPei70K0fTAPpLKoaxnC74w26EiHmEBo2Z5oHmnAQivr
	gJAVI4cw+mPJAgfe4zU0qCY4EoHjJkUgliwDoyb9jllvLnCC6Y8Evy5kw7RIljLZ5prUi6fTT9j
	uC0IKPe4L4bVTw1jER8Ypkj8SjXSWPQZ0/74AdQqlTPns7yL7af8KnrmmXhBFnpeQ/7hDnELEly
	3d83j8TtwDlzUYb2HtMYSQuxOU3macrUmccIhAl9pe3iDz8KP1HCrRSbiZcMDmpqcffsyyDEpkv
	I0rlamBqYzKMpF3uNvH+g7MzIGFt7/xY/HTuprmPvXb5bdCJif+SOu8Ab3jkrZp1FseYPwog1S5
	b5rfiomHQtIMVggp97qbj
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2898852a91.23.1788328896670;
        Tue, 01 Sep 2026 23:01:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2898756a91.23.1788328895870;
        Tue, 01 Sep 2026 23:01:35 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfe665sm3451456a91.2.2026.09.01.23.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:01:34 -0700 (PDT)
Message-ID: <61a8cff1-8299-4348-ab26-de54176cf67d@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:01:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX1qX2d5FTor48
 HODs72qDvjDJneGY06rCV63AV3eGx26NLoqeG/2du7yOJSiobBQcptKf84s/UMb9NskNZvlW0Uq
 X2UfOerHcY1u/ur8Yf6RYT572GN1avaHHCFvmRjySfaC+Skc7gptYrUekl/LUt9EzxRcOxLCuKc
 ZTzVJQCfYZXq5kKe0fJUkTzw95p+ji8ffuBOXDyFbq/rJV6F8EKb3zIxCC9NyTmoT9EictwE1Nn
 xSUmAuG3W03H+iytGKeeJ6nq8OwP6dlQClqYOslzFQVl1tGzP2dWMMyhtY0I0cNZIoGzQp0SjBY
 ahRm1FdkojUqrUWLXTHi4HHRLKhO4ZIXAotv830BfhRNKciB4FXG5on4qOe6T2nPtLuMCBgIb7O
 Qu8kZ6sxgUnUBFHwTW/JasydqKr6UvVNva/cMGvx6ZyNjyyxWzQrCKXcqKennRTPXbH+biaLCOC
 jdYTL7E3uBzYX6EmJqA==
X-Proofpoint-GUID: 7Mc6zNBOO0vXgZBQbrkl4h8QpCUAPkLu
X-Proofpoint-ORIG-GUID: 7Mc6zNBOO0vXgZBQbrkl4h8QpCUAPkLu
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97bbc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fIDE6rAyyWgLbRZLtlIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX4GZevtzghaLB
 t0019vKcrPqiK4h0stZtrzmk4Q7QijbU4DudA3oymjhwDC3IleFokCL5W4ZUHPgg3n3qce4WKq1
 SeY5aj1qGbBlF3SUsLDGG1GOY31yITc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_230139_937350_3C445E73 
X-CRM114-Status: GOOD (  44.06  )
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



On 6/25/2026 6:45 PM, Jie Gan wrote:
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

Gentle reminder

> Shell commands to enable byte-cntr reading for etr0:
> echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> 
> ---
> Changes in v19:
> 1. coresight: tmc: add create/clean functions for etr_buf_list:
>     - Simplified the kernel-doc "Locking:" note on tmc_create_etr_buf_list()
>       and tmc_clean_etr_buf_list() to state only the required contract
>       (caller must guarantee exclusive access to drvdata->etr_buf_list),
>       dropping the over-specific call-path details.
>     - Lock the required code block in create/clean functions.
> 2. coresight: ctcu: enable byte-cntr for TMC ETR devices:
>     - Fixed a stale reading-state / double-free when irq_enabled was
>       cleared between prepare and unprepare: the byte-cntr read_unprepare
>       would return an error and tmc_read_unprepare_etr() would fall back
>       to the normal unprepare path, freeing drvdata->sysfs_buf while it
>       was still owned by the byte-cntr buffer list. irq_enabled_store()
>       now returns -EBUSY while byte_cntr_data->reading is set, so the flag
>       can no longer change mid-session, and tmc_read_unprepare_byte_cntr()
>       additionally guards on byte_cntr_data->reading.
>     - Moved enable_irq_wake()/disable_irq_wake() out of the
>       byte_cntr_data->spin_lock critical section in
>       tmc_read_prepare_byte_cntr()/tmc_read_unprepare_byte_cntr().
>       irq_set_irq_wake() may sleep on slow-bus irqchips, so it must not
>       be called under a raw spinlock. The threshold IRQ is already
>       disabled by the in-lock register write before disable_irq_wake() on
>       the unprepare path, so no wake event can race in the gap.
>     - Added a comment on the byte_cntr_sysfs_ops pointer documenting the
>       single-CTCU-instance-per-system assumption.
> - Link to v18: https://lore.kernel.org/r/20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com
> 
> Changes in v18:
> 1. add a NULL check for the in_conns instance in patch 1.
> 2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
>     previous check for the return value is incorrect.
> 3. add more kernel_doc description for tmc_clean_etr_buf_list function
>     in patch 2
> - Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com
> 
> Changes in v17:
> 1. fix race issue during allocat buffer.
> 2. fix user after free issue observed when remove module.
> - Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com
> 
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 
> Changes in v15:
> 1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list"
> 2. optimize tmc_clean_etr_buf_list function
> 3. optimize the patch "enable byte-cntr for TMC ETR devices" according
>     to Suzuki's comments
>     - call byte_cntr_sysfs_ops from etr_sysfs_ops
>     - optimize the lock usage in all functions
>     - remove the buf_node parameter in etr_drvdata, move it to
>       byte_cntr_data
>     - move the tmc_reset_sysfs_buf function to tmc-etr.c
>     - add a read flag to struct etr_buf_node to allow updating pos while
>       traversing etr_buf_list during data reads.
> Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com
> 
> Changes in V14:
> 1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
> 2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
>     function and restore etr_sysfs_ops in byte_cntr_unprepare function.
> 3. Remove redundant checks in byte‑cntr functions.
> Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/
> 
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
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (7):
>        coresight: core: refactor ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  27 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 327 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 +++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  81 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 265 ++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 896 insertions(+), 73 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,


