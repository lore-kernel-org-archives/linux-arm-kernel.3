Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB6CC79FA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNAp68+71SOrhc4XkrCjpRdxRU8+RksdS+2nj1HGzYA=; b=AmXxGw4o5W6j+DFIldlRCKeosV
	dFWY1A+J0kv7msqKSYD1xQGvUNnyv7t794B5Dk/tFAdaJdcVtkvDK4xiFiHo+v7+iIzAAZ3qpFssK
	0w/qQOwPefAxACm5QEdt/hZUfV4NTnDJfsFLsXfhAvdmJABYslEBNgqU0al/nrKjK6WkQneWBGmjR
	42VdiphA30ySsvnuBbYNaiSc/DZukTSsioAjWI8XnDIyYgvWU4v9H0+k9tMMuEOED5O8L/pOf9JCM
	kkk3pNXBb8KTPFtFv+mz6cjJWTCfxsyLQTBo8hRCD6mYjpV4efiH8MGDGF0DAIxvsPdPxJc3bcEmw
	5lzZsBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1IB-0000000CVBv-2zQn;
	Tue, 06 Jan 2026 07:15:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1I9-0000000CVBV-022X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:15:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QAJN3073053
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 07:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNAp68+71SOrhc4XkrCjpRdxRU8+RksdS+2nj1HGzYA=; b=A/exXuR9w5k/orIa
	JsSYfC712GVoCj/bNRtmJVs2urbVhzYRXqgpLz9/soP4/bgXdeDybZAR5dMzt3mu
	cFvUzxv87aVs0g/re3MzDjkqNyFHOU+PE1VU4XAYQaPqscsCzdXZVhUnlDcf7nPg
	zhFyIr0jqmRSbmpkDOmQUzz6iUiKF3E2gaMrRkdR/bKrgr63xGc/y6qhQuemG5nE
	IZGDIeaFfQ1Ukp+xlism7+cfzqRubjLAdQ5IoiQRvoes4i5FrwZ9mnNUTOZUp6IU
	TvIT5gK63oOY9K+jaQ11etfnd4B5YVUxRnTjP0VaZ810MRLOk3+FM86dz52NZSau
	9bOuTw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7gvgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:15:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso1705987a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 23:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767683743; x=1768288543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNAp68+71SOrhc4XkrCjpRdxRU8+RksdS+2nj1HGzYA=;
        b=EyHmlcUGyGGjob4qxN2kYC6xMoeJiO5kfDXGMoI66QhtKAoBBEPlSvo0HNlffI/Xyy
         UMPWEwkt/SuHlnzXQeqMjfESnQGEMtB24Elk/FOd5qXIyMewxquS+eyWP/X0U2P61DAq
         Im/poiamy8nAU7J/QOpwM2zVH3+1sBHs+n81SZxuFURCipXdybs7POHIOEUqdnG7ipgc
         dpTwnPMiR+cRMTtkl7BbuvYngXIGs8KTF/ct+/uCwOSvxZhB+m3h0uVM97zXXDv2aODM
         84974NXaG1oj/flCSIUIBUQ++jF3nHfj12ODB4ekw6iJzZdRQnocZfooxlrR1nTG83uI
         eyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767683743; x=1768288543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNAp68+71SOrhc4XkrCjpRdxRU8+RksdS+2nj1HGzYA=;
        b=hkOHRCIeNqRrVsds1PA5GyHAs55PYOuZFc9OLJNO2rSmKPLb7f0QVNI2yJXNtlSm+X
         oUDzAkOn/usQo/baBL7Xvsz3KF15NjsCG20Fansdi+7AV4wrE7CeJzcEusBs0p81GWDy
         nMCxF76bjPpQObiUaIyKq9MYv2W2iD/0MwAV3lKihy0B2gyKmRQ2K+dej/6ExaNsJcVm
         ZFkzdhagQCw9BBp9teaohgJ4CJf+5KxE+F2HBP38Mect9Fu3f3TX3MB86w7ZevmGOePY
         EYPMTfHL77ETQv+4znGyGErgQ6qrUzdXYhT5K2kLRPvqELQu4Z9ACpL7hqcEWFVyxw2o
         5ckA==
X-Forwarded-Encrypted: i=1; AJvYcCWG/EZfOO1KXT1U6WLU9R0EkZSJCf8qj44r8RSmZTvQDGssTcNS/gTS3E2SJLGR3/wDVJ2bfO3dA1Ye3JyCcA8r@lists.infradead.org
X-Gm-Message-State: AOJu0YwhB1uyakR7J0HIe0Wu/nfLcn+7m0Qc4y2XGCmyWSlhHeHliyBq
	6+oqIIMxSUsNpjtujG2oNzbmauvC7D/A5E0AUXrIASRDbsyiRvScUdWMm7b2g4QEWUi3jjwGTAc
	I6l/GOyDb2P+vzL4sa3tImilwadNEU+b13W4/5vee5n/5T45jJxpbOdwsTQMuXTQnd150RLgJTJ
	CeiQ==
X-Gm-Gg: AY/fxX71x4NAMnEO1qocIYWKntZO5+oDEU++LW/XXJ+9uIdp36SLqpSEHubEmmMIfvX
	rbh4/rTsLt5vKtVTFPuKlozcFvkTEfvGj9Cc7bs6FYACZPwtToFhEqMlJjx+WFIncGj6Udpm70K
	gPefst+Go1v55w5Wa2FZOv5qvdqKesRUyzZVFauvbO3TI9+v5Dxry1rX8kaQrc0NdgDvMLKxKUq
	hBs5Kf9a0+16qGnTXwDBRmg9xIJ4gx3z6WUHTA5Txzw8Z7EKksHTzyP48ZIL9FSRVWkGBKq76R8
	d5hHU+Rs4nkCMG9ClLaWQgfwINw8/H6DhOKjKsHbpL3vNoNp/y+6iKeLg88IDXu68oZdMXHWZ0E
	wpaik9flZ8ipg6ahFg/wAOSeobQaiQZ3y6ZCPUA86dUOlMlMuhyY960MnXxF/WD558XlH1Fh59g
	==
X-Received: by 2002:a17:90b:3d45:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-34f5f2fb2a8mr1570060a91.28.1767683742938;
        Mon, 05 Jan 2026 23:15:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsY4a1SQtAYcnGDTYCjULHoa0MO6FMR3sJMo1brUZBDzVHDTbS9hjPkeveMU8haIG15gnKpQ==
X-Received: by 2002:a17:90b:3d45:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-34f5f2fb2a8mr1570032a91.28.1767683742389;
        Mon, 05 Jan 2026 23:15:42 -0800 (PST)
Received: from [10.133.33.93] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64b3esm1298770a91.10.2026.01.05.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:15:41 -0800 (PST)
Message-ID: <9464872c-fd87-42fe-bcc6-1b87a0b21843@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:15:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
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
X-Proofpoint-ORIG-GUID: QtQnMy9gaoEGsjvM4bK7vu3CeLC9u4hR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA2MCBTYWx0ZWRfX0SbvxHeqlRtF
 fqXPqqGkOOmrNwhYkvFF6K258DuLlykTr7atIuAnnou4ZGCP12SR1+VJ8sTaYn6tziGRaBrTp1d
 n8psX77Jk8cSf3rr88AYC77QAB7jAw8t8nA96MxlZcOMsHKbcxuaevJMvcpvPlkX1SVVFwoy3Hm
 /2xgro4AIStcz3NEwcaH8BmXbFLlGsgwX91sC/ztn+b+bzdFLGsG8YZ4+P0NFJ5WdbJKR9hk0Hi
 TsItxxl3+hmtmWf3txsBGLyVbIwEdF9Otzt4AaW6RBotMmOKh8cSBShKX8pOLKBVJNyOvTuyo4k
 LL5MblFsonmvhyzxPEK2VoXDjWQ31oG4C75ij/IePRoOTR2/UgsBXY/O1I3guvUejyKKV4akO6k
 dwr19p89mPH7YHbymjSoWsQ70mGOan3fedW45rMTpznMp9F5EThZ1W+mgdLSNpcJyd70s2Rj4Wd
 je8/HYTD5PB050lHb/g==
X-Proofpoint-GUID: QtQnMy9gaoEGsjvM4bK7vu3CeLC9u4hR
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695cb69f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=hyi39RYjpJE5wifr7rwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_231545_064349_7F633545 
X-CRM114-Status: GOOD (  36.90  )
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

Gentle reminder.

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


