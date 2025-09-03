Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B228ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvRBZ8l1soa2w5f7bVMj5H2wpo59ehpd/EgdLHhxglk=; b=Zj+21DROtt30O2b7bCKkStNKo6
	f0cGaW6B8hQZs6RVu3jM+eJf/cK+3UzC3cJc3oCRyJnBhCj3W+xh8hK9gXxzVdgxGPpt8UqaOWsz6
	3BKZm8KEPZaoLKwX8pDpk2iVu7IqwH4ld5sWcfIow5/L+j+iRCvYlc7HNV7C0WEG7faMNwRgSR/lr
	sESGWRa88gKxjvH6VU2uiDVS9jmAO0BsDdt50SD2aGMQzWOW0blpkfBEJE0mlNESpUEcq50TJRhmm
	XwXoO3tePy2DqtRZYZUuOhIXrmBWiESWusVX8lgI+D9AMl7BZghV2hB67XAdwGKVlx6OxIoCbyz+y
	A5EqVb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbst-00000002y6u-3gxz;
	Wed, 03 Sep 2025 01:01:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utboa-00000002x4U-3O1S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 00:57:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqLOZ018459
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 00:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvRBZ8l1soa2w5f7bVMj5H2wpo59ehpd/EgdLHhxglk=; b=j0bz4Hgbhfhw3Loo
	siOeyg0W8pTGzedIHctGIoidzuPdlGDckADqummia5zSpPkuOvVKBlYxVr4LOJmm
	+pEMglmEGv8DcSrJL4FHk9+zzMBLzZW77n2rev0w4Gk2qXH7yyvlpaWBYQvgVt2A
	5AsPLC52K8+gmnRgNbKouk1RM/JKdQMaxLv39Thth2sW/oGcW248/UVhfmpe+UBC
	bIfZq6yxXoGUkklwGacKY/rjj5EGqQSIjCGkURsq/qBAORQ/Fvg0qPZEHm7Rb8Rs
	O2Y7sfLLj/b6ro0DxbxodpsRzFhHvxTd1/nQOAXfdI1EhJNHnk31qqkuE0N0BQLt
	weSkTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvwbduf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:57:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-248f7745075so89653535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 17:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756861051; x=1757465851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvRBZ8l1soa2w5f7bVMj5H2wpo59ehpd/EgdLHhxglk=;
        b=cY6S1tpClnUXnvFyJaYh/BDxrtvcKaCjXEsTqMl/Rb+hfmTTfBpZ5ijE0f19cUzvTR
         wq8uXaw2D8GiP/d0fgHn5JoZ3zbBVNXwuMnie4jmYEVMB27NXk6sfkFwbBMpTGEDsWN6
         uMfnf1VnGtopqhI21z8X1/X/+Qb5EK03tZRRNM0uOPLVFbGFj8BY6v+nPuFlLk+6hFov
         2jb13h7SHzlmAbatYr3H9scQtXbNRzuXIyovqne4dt7ULFzDuXUrWZrycIBLK55CiGIi
         GAoloT0BV01Gg6jEbDAKvncf7ceDxvM36OcezU3DIejaNXCoRkiT2ulhycrr2j9r4o3C
         vJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC3GONlveMbCOUKrLyDPzndrqOfbrQkE2sq8pxcE3FjImxXtUtNrs+p1LCzA151au9bZIN0P/xcwvqFiqVcA5z@lists.infradead.org
X-Gm-Message-State: AOJu0YxYlzIQhIM8yuMk1jZsOzBY4ZC/hZ1r4Pn2ozYvyoMJ4aj7Njp/
	eCfmUbCIvzZqbd8YF9ISOoGGeUvwq1yvZ9KaBH/f4umDkKQHVjUvdflcwa8n0ulBAapwGwEHgUE
	Jnnzb5CZplK/WAJ716N1Ic34+8U+Nq3Gx5b2MRohqT7ytm5o8gq7rD451zjeA+bJF/DBWHNmDEE
	Q5VQ==
X-Gm-Gg: ASbGncsc5xdfMoea79ASTIGxw2KYB2JmcMSSFy3tcML6fNkKMALdtmIX/4MAHSxtRJa
	poMKBz6GRDiv9Qi+fq8/SE3LLW+cCDPTaCxtmFEK4DnF8DPIBz7KPIbW7xGqZDPtymJoKIz+HOo
	sWraD9NMZ16c5t4KEUjviN8/YQipHXSw/Z31ZTW0uL64WtwvPkXg9KWFpeFHg0Ahov1e5PmCeRO
	M3TSVR9vY0hJCYWW0sWiXa0QRb1b/UyzqozDfcA7BRTlW7NPnRCekMJPpHN8v/Kx/xQ5SFef11N
	25jhuez3HCiqdQjqbQKPQH7SGJVKFVuRV/eoKZJLqnahcYyTLvt77/4lmvigAkodnKg/tHq9BE4
	0+YMJ3Isy6XQBmA2kIGIHIk307+69
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id d9443c01a7336-24944b196e1mr173916055ad.28.1756861051323;
        Tue, 02 Sep 2025 17:57:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMWFJ+CC9Sz9EcWuN1L7X1HHC53rBd/UlzzUN3mZNfei+7evwXupqb4deQ1I5sJ5h9nBJvig==
X-Received: by 2002:a17:903:3c45:b0:248:f762:865b with SMTP id d9443c01a7336-24944b196e1mr173915835ad.28.1756861050801;
        Tue, 02 Sep 2025 17:57:30 -0700 (PDT)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249144837fcsm135630555ad.15.2025.09.02.17.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:57:30 -0700 (PDT)
Message-ID: <1a50602c-6c9f-4bb0-9072-f5a6322079c7@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 08:57:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX8Sr3sG0HsHra
 e3MWDyfS6rUMVEPbgpJf3fPfqmEODNoYXMHpciBABq0aXD8pgozrGZY3nz5LtvaT4TLe0wgA6ud
 C+To/mAoCRUq8yvHdBfJzr2FZ1watfC6T3hZl2u2WIIgrEgdhBPs7AOAagy/CE2+tL15c+0jvsb
 kMl4pKKPSdQ3X3LzsDbWS5IrGHdJirZHVTRlsqyNfbzYcZoqYBfLdVuNwaHSrWj6FSMvueS+JQG
 8dXMeVrWA/Hphrg+rAuTKLyj1rLq8RUEUKueqr/xPT7ug+WN7UUijg1uy+714HtyAhk/Anw0NXh
 LZdNQ7P3leSLiDequ6+KTb4nG15p9Pwz/6hdlp2HbqO7891Jc3m33eHh5fxqw0u9rAtiOvEx08v
 Yelv6aNr
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b7927c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=BaEammc9KrtT-KL9giMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hBlzHkvuvNkgqs1W-4HMNjbZ5sgpeoDg
X-Proofpoint-ORIG-GUID: hBlzHkvuvNkgqs1W-4HMNjbZ5sgpeoDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_175732_856881_D9C7C9CC 
X-CRM114-Status: GOOD (  35.07  )
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

Gentle reminder.

Can you please help to review the patch series?

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


