Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92A4C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU3efWVliT7Ng6aUIvmaxEMKUL6PAE+AGErvv7t6gzI=; b=ifHIYNANMCr0TQNeVrVZ1dQpyh
	6pK4pssk27vEm0SQ6ex/+GnyUYb8VozGbv2KdTiWWYjaML706AIPjxN6oQ9O2rofLwCcsfasoz4df
	YWZYMjO/YEIGj9hNxWviA/flfH3h76ngaRZ6Kl/uPAgQ2uB6/Ts5FKj62QzOwCRD7GuZ0jHepYcv3
	GSRxQYNZxVRdXLEXFl1aNXWyCmK3X2pRBf3e5ow4nsFq07gR4A1iyFkGHo3w0MRbEa2C0owOUvwB3
	yfN2/8tDWOiGK+rUbkDzXs7uQIirHbaEVZjtQMCRT/nisQgXCHjFJSgKoQI/+c7jakeonEDqIWek2
	QbL5zjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB91-0000000AWDA-3W2G;
	Tue, 06 May 2025 05:47:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8kF-00000009vmp-3ZPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 03:13:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTd42029787;
	Tue, 6 May 2025 03:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sU3efWVliT7Ng6aUIvmaxEMKUL6PAE+AGErvv7t6gzI=; b=JYY/lp2qOSvFHzoS
	ZAVffzskWA/PqZdHoG3iKJhDrr4hef94WHuF17sAH9WMckaPHtMDjNb1BiXNGM2u
	bXPUWlMVC9oakXn0RtYXg7OFVDWl4uawVeZsM1AHNaDQoeAs08mEIhFJEnWhVdyN
	KUnnc7CtYVgfJ/0FFB/Mu/V+JRJ/Vn/zBiFP30eBSQQTn7ZgKAgXb+CfZDfztaLI
	brGn9KHA9/C3X4jABoF62XDSfIscdyxSiP6a9NX4su5mhoy69NXNL0opp6Dlf/NR
	f8kLVwBOPJV5KpI1wD0eY/++AxckUtc0uwKheIczCtFghe8VLrhAusfpUF/ON5sM
	GhSVuA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rx3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 03:13:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5463DEnP022137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 03:13:14 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 20:13:12 -0700
Message-ID: <5ccfe939-2764-4aa3-a485-e325333eca36@quicinc.com>
Date: Tue, 6 May 2025 11:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
 <1efe761e-964b-4b24-b1e3-dc33bf1749b7@arm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <1efe761e-964b-4b24-b1e3-dc33bf1749b7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zAgIivilVMH29bjhCRD2wf523Ut6yCB-
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68197e4a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=i2DyZzPZDq6iBzlmnYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zAgIivilVMH29bjhCRD2wf523Ut6yCB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAyOSBTYWx0ZWRfX2E4LXUR+j1gB
 STwUG/rkVjCeRtKXS65fT7WzFWGJ7qedfj6BUAq3ZPDuL9EnVpP5EBERg8uPJu7MwR/gID7uiUi
 6SM//LpPWbdJVmbNL5kJca3V2yrAcrpUYByVC2XncLZu3oOmPg7HrPL3SxJ4HafLgcKvuzbueJ6
 NYoaNGC+bDPkpuOM+8pVudOW0D87u/yNijCKU2Nc5EVdDE7f7ATuaNHQUQLP2cU8f/rBCtQmelr
 PtTQJO/BfF8Ytck2hV0JheVRQp53xyWxGUMgfHtJ4OaEcaV/fbT7ly+hXSPQzc0c2hLLHJpL6wa
 JC721nb5T4cfTI9bAh0UOMGi1EUkbZOH29IphaHh2VRmWGRbH06cIxtx6SM4sXHjGH+dHoUt9s7
 OE6JC0haaVrcGy6wCTXIbDVtxSzNFp4CfJZOdplr0UeVPVbj2KQsOK+82acsKZhMLBFy9NKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_01,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_201323_951321_925205C2 
X-CRM114-Status: GOOD (  16.88  )
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



On 2025/4/30 21:51, Suzuki K Poulose wrote:
> Hi,
> 
> On 30/04/2025 12:03, Mao Jinlong wrote:
>> When read/write registers with readl_relaxed and writel_relaxed,
>> log_read_mmio and log_write_mmio will be called. If mmio trace
>> is enabled to STM, STM driver will write the register to send the
>> trace and writel_relaxed will be called again. The circular call
>> like callstack below will happen. Disable mmio logging for stm
>> driver to avoid this issue.
>>
> 
> Thanks for the fix, looks good to me. However, I think the commit 
> description is a bit cryptic. Could we say :
> 
> With MMIO logging enabled, the MMIO access are traced and could be
> sent to an STM device. Thus, an STM driver MMIO access could create
> circular call chain with MMIO logging. Disable it for STM driver.
> 
> Suzuki

I will update it.

> 
>> [] stm_source_write[stm_core]+0xc4
>> [] stm_ftrace_write[stm_ftrace]+0x40
>> [] trace_event_buffer_commit+0x238
>> [] trace_event_raw_event_rwmmio_rw_template+0x8c
>> [] log_post_write_mmio+0xb4
>> [] writel_relaxed[coresight_stm]+0x80
>> [] stm_generic_packet[coresight_stm]+0x1a8
>> [] stm_data_write[stm_core]+0x78
>> [] ost_write[stm_p_ost]+0xc8
>> [] stm_source_write[stm_core]+0x7c
>> [] stm_ftrace_write[stm_ftrace]+0x40
>> [] trace_event_buffer_commit+0x238
>> [] trace_event_raw_event_rwmmio_read+0x84
>> [] log_read_mmio+0xac
>> [] readl_relaxed[coresight_tmc]+0x50
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/Makefile | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/ 
>> coresight/Makefile
>> index 4ba478211b31..f3158266f75e 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -22,6 +22,8 @@ condflags := \
>>       $(call cc-option, -Wstringop-truncation)
>>   subdir-ccflags-y += $(condflags)
>> +CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
>> +
>>   obj-$(CONFIG_CORESIGHT) += coresight.o
>>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight- 
>> platform.o \
>>           coresight-sysfs.o coresight-syscfg.o coresight-config.o \
> 


