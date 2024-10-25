Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB11AD0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkk5ZSyPcxaL6A+xV84EKq63bfDmIqcaz//n9nMPm4g=; b=CxU9RiX6crI/d4Aio6gvZ6Zn71
	kHUJX9YflYLQ4cmg0evd8G7x375z+NL4BUo/1/ImlVoDKKvMc+MypdaOkZztjCfCX3LrkoLF+n+Q5
	SuAJt6cFdo+t7Pp6yA98LTmrIL4b3AiW/+zMLu3U8N4if5fG7QSo50my15XGoq3fSZOSEGoJf8Vmx
	NjFM1JHdF6+eKKdIb8f8pBJdpuhhzRxPNzfjpLu2v/qSUFBfQuKmckdv5ZJ2OMwnaz812Q6ESAxem
	5azd9cj/ZXAlGinRV7Mx9iuqO/LfIx/FEW9ZcLl2bE+2GWDJfLWOkIHYwKtW6uP90XgBqmwdcrpxk
	EUgsocWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LEU-000000040G6-1Mlc;
	Fri, 25 Oct 2024 14:24:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kyw-00000003wFN-0Qr4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:08:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBurNX004988;
	Fri, 25 Oct 2024 14:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkk5ZSyPcxaL6A+xV84EKq63bfDmIqcaz//n9nMPm4g=; b=TGi/SKeFZ/tRqUWC
	sbvuu9+F62fz+eqBX9CdNPLB36SBJdB36Nd3tdwwwM13g5FhI1E03zuCJc5PB31o
	7J/xjbLcn6r/jWkyvqwi4Y19KQWRxWyHdY6fxK/hO+LnP9/jYW/wWFAC9zlVUOQY
	fYZXYZxovaeAzR3xRHI7OkW04JWGrJRyGh2ujRCcURn4OV7MMaciIIe2S1BzirHN
	/H44LWEcgyKWez5hG9tZ/rGFAnGezpiReGfe61F5nnmySgKL5XAhEijLqLYx6RHB
	yqCdr6H1EUZdreO608qatMDsQ/gku2rQmCefiET/ngdVGSw1yN5yW9sESgL+0ymk
	oixFwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em689ant-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:07:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PE7qL6003944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 14:07:52 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 07:07:47 -0700
Message-ID: <99fe6e85-aed7-fb30-e0c4-9812667cd0e4@quicinc.com>
Date: Fri, 25 Oct 2024 19:37:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/4] firmware: arm_scmi: Ensure that the message-id
 supports fastchannel
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
References: <20241023102148.1698910-1-quic_sibis@quicinc.com>
 <20241023102148.1698910-2-quic_sibis@quicinc.com>
 <ZxufoL3NjYs8Lyq0@hovoldconsulting.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <ZxufoL3NjYs8Lyq0@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1J-w4zd-_qt8A4RcmPqmaCa1AcdjxHEZ
X-Proofpoint-GUID: 1J-w4zd-_qt8A4RcmPqmaCa1AcdjxHEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070802_334233_C4A62DF9 
X-CRM114-Status: GOOD (  13.29  )
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



On 10/25/24 19:09, Johan Hovold wrote:
> On Wed, Oct 23, 2024 at 03:51:45PM +0530, Sibi Sankar wrote:
>> Currently the perf and powercap protocol relies on the protocol domain
>> attributes, which just ensures that one fastchannel per domain, before
>> instantiating fastchannels for all possible message-ids. Fix this by
>> ensuring that each message-id supports fastchannel before initialization.
> 
> Again, perhaps you could include the error message I reported here so
> that anyone searching for that error will find this fix more easily?

Ack

>   
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
>> Fixes: 6f9ea4dabd2d ("firmware: arm_scmi: Generalize the fast channel support")
> 
> And, also again, should you add a CC-stable tag here to get this
> backported?

Ack

-Sibi

> 
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>
>> v3:
>> * Pick up R-b, T-b from the list.
>> * Move scmi_protocol_msg_check to the top [Sudeep]
> 
> Johan

