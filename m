Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC1CC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=; b=z7h5jfqekWnfQ97iod1i4BRun5
	9/RD8LcoNBenq6ekatq5+sCcdty9QBAxPouO6WcKz5PJm6BOh3b8MWJUAetJY+bcjejBmTM4xnZie
	7wWZ++HPu1Ve/gDwJumlqnLtrQgW3ywHoMjVfKGZ+tWXKRjlaUHQZm44xg5hwkuR6rNALRI2LOq+i
	1BbNFp+lYv0WnZe+BU/txRnNn0fHGEB2UOOHbRqHmhFq9sIRP31su784/tzzvmbgOjt72gdiRjUAP
	6E71IgbS8wgTDoNQ97Nsz/GMI1jb2TtLPpDJvcnB4+aBczhOKUCxMVfFlPhwMuKPmlIVmBdwxYC1a
	95uZoljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e4y-0000000Dpsc-1gkV;
	Wed, 02 Sep 2026 06:04:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1e4w-0000000Dps7-11WH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:04:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YGO1564851
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 06:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=; b=ReBNEIfrdyXShGa7
	p52DjJb4zJvnMmbhLP3R++XNz2S+RTWimhKws1LkOL7F3YU+49oYQ3y82GN+U/Ap
	ckTP2npv/CD8JCgLcWyluk5CW6ilPUMkzWz/oQgXE9pyW89h+fSv6GtRDDBIFlHv
	mxm0Gw7QKGWhixiISU0NKgiMIybKWlG7Idup8SSgngOpK6PiSEgLemD9iL3aM+Vi
	UM1jmLWr0cdo5YLUuCmKIaULlG4HQ0RWgShiayrBlcfB0OM9H3minMzM1I8sXH4V
	n02OQzNaK42dHVh5roAXskSBFUQ+l/ska6ei1LXMycVdOHpSlo/OuV1hRICu2rCQ
	PUBPYg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb560mj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:04:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so980219a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788329048; x=1788933848; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=;
        b=jzmyZ5WxSuOSongEzCb7709DDlaU9L7gw9uAIeR/XIxiKBU68w++5YYDGrNjiuLEom
         YKy4Xg4s9FyZ4UmhDbcq26XK5jWbNhdDxs3xUZ0a1PVF5WGTeBUGfbfMBJLmeSQwJvXT
         IxFjboLPzoS6YoDbWClWAkMgbWH3ia7sGkMQzC/NctPaR96PRfAlCeZkjvOyuTgIFAHh
         HZdwjWX2f0T6JAx6IKTOBcXHkdkXUo+4vt3mA4TsK8uQC5uHPx6pefCsqZmtgLX4g0I+
         1B2WIzwJilSl9wkGVVWDb0wC6GIWLDXX4pgzy/TMltMZo9N8nVEzS4V+IUwCuuVYuwTL
         MtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329048; x=1788933848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ET/maoaamnCBnWTRUAQoiVjvEy49DBpiUkyDUca7+Q=;
        b=gCuMZWqcTUNxA6G++QE5Ai48usA1rT9O+nRGPmeBPq1Sm8lfcEYZgElsYMPsonLx4v
         IBIU8h34OsfNXiKNybZarOR8WGYNbJMkEIsBno52Mjr1L9AeQgrc3N3mY7bZiIuxnUYJ
         C0Xp6GIGkaBMUosfRy/4u2xuUErYcfVo2YJroltNIItjRq++0rRRoaIhxAR8/u/vZ+Df
         QfkDxlr1Y1zgCb8RIZi3iUIRB00JyCx2cEJ2KPx2LqGQzqIN9MWHc3bry2CjIPvSqKZ5
         ntOzKv/1g9B397PTUsult5eVQZI0a+WrphegsPDd9ItQNCUmi9dbR67NFUgXA+x8X5XD
         56ug==
X-Forwarded-Encrypted: i=1; AHgh+Rpu5far9n/4cUklYTszoBWrmoAxtG5gHM3NcHueT/7TXtzVBtEiC+/C2cqgmb/XWyXxzduegPZibJHtfMz3v3vA@lists.infradead.org
X-Gm-Message-State: AFuF++nS4F1L+zBuYXRsG0u2DGjO7/o50QHCB+sJdpK7uQbmwKyUYJxF
	+gIQ1OvnFKaBXw1V/UFk+38wETTVxINuyu3yQIc3t+ZthW59LcnoIkH2JNW1zfMIobuHPMSYK/A
	+piS6rJvYHHK3h8XbxlAk31zB5UF2fKOeFe8VUXZeLg/U16Nx4qiWcpsZ4VrW92nuGp4oqVKmV6
	yMEw==
X-Gm-Gg: AR+sD10WblPGi+7yX5eRYVFOkkanDjvjIfef2mPwCfi7JOfVY/QNbtKYpsSN34QlIf0
	UX3wnirtwXMrtc20pUgOSHSFf+rmuNTFZSXd8Wk20hV++kzgnulexA91DGu25IIModesREIBeIx
	8pGHR8bSumJBd06HTWZ4jdHtkY1qRvQk504kkbmOfzZnxyinJoikyyxvdXHyouSLus39nhHmgUR
	6X4rwL2rgNsae7zGmJwl8poMp6LY501Ht6lA8hRw+9PmRIu7T2qi67T3rpxAYqzYq9+btNn9vWZ
	QeCHSG82y7dQdsCtVkRo8U+lo2OqkU0ZwQOkSU7VM/lM/abjV9r2r8VdUEFCcqpJb0PNdd9+ki+
	py1YG2j7+b8laj+N7GTTm
X-Received: by 2002:a05:6a20:2591:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3d9aca491f4mr3675115637.3.1788329048025;
        Tue, 01 Sep 2026 23:04:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:2591:b0:3d0:8abe:9e08 with SMTP id adf61e73a8af0-3d9aca491f4mr3675045637.3.1788329047539;
        Tue, 01 Sep 2026 23:04:07 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc34d036d0asm528281a12.27.2026.09.01.23.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:04:06 -0700 (PDT)
Message-ID: <fe4ff38a-a102-4ff8-a745-6ccb115e33ba@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 14:04:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX6jU1G6kBAYOK
 6EUUIPP0R8uC5ym75AYnX0iKWmFkYF65oUg5zhgpWdmKzqdvMTAJWjFgKKzkSvt3DC0DpcooKHm
 ytbL6p7EXv+vo3seBi8q3Mfi5pWYSOYYt5hNOYUryq4H8Wgm9fJIUvG+VHnb0FtUv0dXSD7sJYy
 ffKFafFqd2g8QMRyDlXhbEK/ouA6LMWBcU8jOCihaIJAjw+Wp7Bsk98Ly1QihU4YxLqt456iOct
 WA8j2lLXTup6CWM+6N8iUNOzXacf4QKwM2H4X07DKuxn20/meZLON1jb1Lf950IrNDiSRK01+c8
 L/RJmZkq5hGKNyUcP7sm/1zQcw4Eez0ys/kE6jTvGll1MNYMvHBO/qQotiCr48LDtESY8xPOZZp
 vX+F0Lj58sYFvYKetBVMnFsv/GLe7A2vBmdoUvtGAWYthv+UprJGGKMBkGyqncHo0m6LoZy5DE9
 d0Htljyukj7084+GrCQ==
X-Proofpoint-GUID: VktAiC2CKYgc1XzQdLysW0oBqqfw8tOB
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97bc59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZywOREiRFUGGO-y_rKIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VktAiC2CKYgc1XzQdLysW0oBqqfw8tOB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX+25HfoYVY+HL
 ijM742sVcJKomCB243RCOhO6nzzydjSL4JIgzMS4PmaBfe2bL6xjEWoDHv5ZKgbgXhoHwpPVdP7
 XIxmjL98wk+AbELBiIGz6SgZdcpyw8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_230410_464434_A5F64058 
X-CRM114-Status: GOOD (  29.30  )
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



On 6/15/2026 8:32 PM, Yingchao Deng wrote:
> The Qualcomm extended CTI is a heavily parameterized version of ARM’s
> CSCTI. It allows a debugger to send to trigger events to a processor or to
> send a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs.
> 
> Qualcomm extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
> 
> The commands to configure CTI triggers are the same as ARM's CTI.
> 

Gentle reminder

> Changes in v10:
> 1. rebase on top of linux-next-20260609.
> 2. patch 1: Add a bounds check in cti_allocate_trig_con() to guard
>     against in_sigs / out_sigs exceeding nr_trig_max; carry forward
>     Reviewed-by tag from v8/v9.
> 3. patch 2: Move __reg_addr(), cti_read/write_single_reg() helpers into
>     coresight-cti.h as static inlines; add cti_read/write_single_reg_index()
>     variants.
> 4. patch 3: Replace the direct CLAIMSET clear-to-zero with thin wrapper
>     helpers (cti_claim_device, cti_disclaim_device_unlocked,
>     cti_clear_self_claim_tag) that early-return when is_qcom_cti is set,
>     bypassing claim operations entirely for Qualcomm CTIs. Fold qcom-cti.h
>     into coresight-cti.h
> 5. patch 4: Add Reviewed-by tag.
> 6. patch 5: New patch. Document the banked trigger status and integration
>     test registers added in patch 4 (triginstatus[1-3], trigoutstatus[1-3],
>     ittrigin[1-3], ittrigout[1-3], ittrigoutack[1-3], ittriginack[1-3]).
>     Also document the previously undocumented base integration test
>     registers (itctrl, itchin, itchinack, ittrigin, ittriginack, itchout,
>     itchoutack, ittrigout, ittrigoutack) introduced in kernel 5.7.
> 
> Changes in v9:
> 1. rebase on top of linux-next-20260518.
> 2. patch 2: Replace the "encode index into offset high bits" scheme with a cleaner
>     __reg_addr(drvdata, off, index) helper; update cti_read/write_single_reg() to
>     take separate off and index arguments; add u32 index field to cs_off_attribute
>     (moved to coresight-priv.h); drop CTI_REG_SET/GET/CLR_NR macros and
>     <linux/bitfield.h>; update commit subject accordingly.
> 3. patch 4: Add three index-aware sysfs macros (coresight_cti_reg_index,
>     _rw_index, _wo_index); replace string-matching visibility logic with
>     cs_off_attribute.index field check;
> Link to v8 - https://lore.kernel.org/all/20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com/
> 
> Changes in v8:
> 1. Rebased on top of linux-next-20260424.
> 2. patch 1: Use devm_bitmap_zalloc() with nr_trig_max instead of per-connection
>     signal counts; add bitmap_zalloc() for filter trigger group.
> 3. patch 2: Add #include <linux/bitfield.h>; move CTIINOUTEN_MAX expansion
>     to patch3.
> 4. patch 3: wrap CLAIMSET clear with CS_UNLOCK/CS_LOCK; move CTIINOUTEN_MAX
>     to 128 here with comment; fix macro alignment in qcom-cti.h.
> 5. patch 4: Make qcom_suffix_registers[] static.
> Link to v7 - https://lore.kernel.org/all/20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com/
> 
> Changes in v7:
> 1. Split the extended CTI support into smaller, logically independent
>     patches to improve reviewability.
> 2. Removed the dual offset-array based register access used in v6 for
>     standard and Qualcomm CTIs. Register addressing is now unified through
>     a single code path by encoding the register index together with the base
>     offset and applying variant-specific translation at the final MMIO
>     access point.
> 3. Removed ext_reg_sel, extend the CTI sysfs interface to expose banked
>     register instances on Qualcomm CTIs only. Numbered sysfs nodes are
>     hidden on standard ARM CTIs, and on Qualcomm CTIs their visibility is
>     derived from nr_trig_max (32 triggers per bank), ensuring that only
>     registers backed by hardware are exposed.
> Link to v6 - https://lore.kernel.org/all/20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com/
> 
> Changes in v6:
> 1. Rename regs_idx to ext_reg_sel and add information in documentation
>     file.
> 2. Reset CLAIMSET to zero for qcom-cti during probe.
> 3. Retrieve idx value under spinlock.
> 4. Use yearless copyright for qcom-cti.h.
> Link to v5 - https://lore.kernel.org/all/20251020-extended_cti-v5-0-6f193da2d467@oss.qualcomm.com/
> 
> Changes in v5:
> 1. Move common part in qcom-cti.h to coresight-cti.h.
> 2. Convert trigger usage fields to dynamic bitmaps and arrays.
> 3. Fix holes in struct cti_config to save some space.
> 4. Revert the previous changes related to the claim tag in
>     cti_enable/disable_hw.
> Link to v4 - https://lore.kernel.org/linux-arm-msm/20250902-extended_cti-v4-1-7677de04b416@oss.qualcomm.com/
> 
> Changes in v4:
> 1. Read the DEVARCH registers to identify Qualcomm CTI.
> 2. Add a reg_idx node, and refactor the coresight_cti_reg_show() and
> coresight_cti_reg_store() functions accordingly.
> 3. The register offsets specific to Qualcomm CTI are moved to qcom_cti.h.
> Link to v3 - https://lore.kernel.org/linux-arm-msm/20250722081405.2947294-1-quic_jinlmao@quicinc.com/
> 
> Changes in v3:
> 1. Rename is_extended_cti() to of_is_extended_cti().
> 2. Add the missing 'i' when write the CTI trigger registers.
> 3. Convert the multi-line output in sysfs to single line.
> 4. Initialize offset arrays using designated initializer.
> Link to V2 - https://lore.kernel.org/all/20250429071841.1158315-3-quic_jinlmao@quicinc.com/
> 
> Changes in V2:
> 1. Add enum for compatible items.
> 2. Move offset arrays to coresight-cti-core
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
> Yingchao Deng (5):
>        coresight: cti: Convert trigger usage fields to dynamic
>        coresight: cti: use __reg_addr() helper for register access
>        coresight: cti: add Qualcomm extended CTI identification and quirks
>        coresight: cti: expose banked sysfs registers for Qualcomm extended CTI
>        coresight: cti: document banked and missing base CTI sysfs registers
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-cti    |  90 ++++++++++++
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 153 ++++++++++++++-------
>   .../hwtracing/coresight/coresight-cti-platform.c   |  26 ++--
>   drivers/hwtracing/coresight/coresight-cti-sysfs.c  |  89 ++++++++++--
>   drivers/hwtracing/coresight/coresight-cti.h        | 122 ++++++++++++++--
>   drivers/hwtracing/coresight/coresight-priv.h       |   4 +-
>   6 files changed, 404 insertions(+), 80 deletions(-)
> ---
> base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
> change-id: 20260611-extended_cti-dd4971ef98fa
> 
> Best regards,


