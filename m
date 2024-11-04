Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF9AD132CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MrI4+M+kKHAd3Sup0mRHUENnMs265A92SHE5aq5rS4=; b=ZN6u6mwr9WfqfDQ3buoLvhYgeQ
	EcDdq4j1NtcBV77XmgnxROxVICYmzQVewkkUZrh6p4KBs7McQ00i5IOUoiNJbceCXNW0bVMhOMdxP
	AOzdnJ7iACqUgvt2zSdqCkx61Kj0CPXiKfs00deob69DyaJmlw3IfYYaIGrpO8AaXIgVlX2kCIPle
	KXm5lk3eYj8xW3H3xUZYQzuhSzJLKBvEEsnyPmqd5+oxI2OUs4wtvYrn1HUf5lAMfdxI1NWjTlKN1
	tA1aWJHBdf0x/v9pDXlHzFb8uDvpOtExgPCvmk524DeTJANx+6YCPAYE9qE2XKE/379DcsaPUhUfh
	6yOENQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y5E-0000000E38c-02vq;
	Mon, 04 Nov 2024 14:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xUa-0000000DwPE-2qwU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:51:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bj2Xf004768;
	Mon, 4 Nov 2024 13:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MrI4+M+kKHAd3Sup0mRHUENnMs265A92SHE5aq5rS4=; b=QeFRtVxWbA5wlaYD
	Mi5icSlVBSOTUTsvC4YJneW1skCW7Uu5SZDqCPHrpwBnrd3dwL7puGo2UNp7IygD
	kDmKSx/3jqgvi+pcfaUN6uTkhA2yy4V0Gf/jAgiingblje8qhXgXRDq409ALKWrl
	zvBBDC3W2iBBgkokSumcythPDOyiLoMJxJZlX5MfTjvfO63lvwzpz08QfgtCSPjl
	d3c/ZcMGfPTelCcGBZd8MjVizsUGEOgrTqqA2WPcwLouuimlyzYUmcTYXyYX3t93
	ssV8bPpuK3mPwGX0Rq9S9zAn3jLCMqshSVXafVXZwcd/7smzI9ksjusXAUo+v8ln
	Jm5JbQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd284ejh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 13:51:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4DpUI4025073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 13:51:30 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 05:51:22 -0800
Message-ID: <e173058b-57e7-7fd0-dab7-7398bf9d66ec@quicinc.com>
Date: Mon, 4 Nov 2024 19:20:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
 <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZyThAFbOHKaBIgLg@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N9dkp-hFPldnpkGgKZ0fDSY64p2Ut9pZ
X-Proofpoint-GUID: N9dkp-hFPldnpkGgKZ0fDSY64p2Ut9pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_055140_897359_41D61D25 
X-CRM114-Status: GOOD (  21.04  )
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



On 11/1/24 19:39, Johan Hovold wrote:
> On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
>> Duplicate opps reported by buggy SCP firmware currently show up
>> as warnings even though the only functional impact is that the
>> level/index remain inaccessible. Make it less scary for the end
>> user by using dev_info instead, along with FW_BUG tag.
>>
>> Suggested-by: Johan Hovold <johan+linaro@kernel.org>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   drivers/firmware/arm_scmi/perf.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
>> index 32f9a9acd3e9..c7e5a34b254b 100644
>> --- a/drivers/firmware/arm_scmi/perf.c
>> +++ b/drivers/firmware/arm_scmi/perf.c
>> @@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
>>   
>>   	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
>>   	if (ret) {
>> -		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>> +		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
>>   			 opp->perf, dom->info.name, ret);
> 
> I was hoping you could make the error message a bit more informative as
> well, for example, by saying that a duplicate opp level was ignored:
> 
> 	arm-scmi arm-scmi.0.auto: [Firmware Bug]: Ignoring duplicate OPP 3417600 for NCC

I did think about doing something similar but xa_insert can fail
with both -EXIST (duplicate) and -ENOMEM, so the we can't really
use term duplicate when insert fails. I can add the perf level
though to the message though.

-Sibi

> 
> or similar (e.g. as the current message looks like an error, with errno
> and all, that indeed warrants warning level).
> 
> Perhaps with such a message you could even keep the warning level to
> make it stand out more (if that's desirable) without the risk of scaring
> users.
> 
> Johan

