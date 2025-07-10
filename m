Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5872C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnL5YbMxSPSCfxzFYvbsE5MYDIzNe44c0R0LoWDUaW4=; b=1i+uc5Fp6a0B3+7OPGN2quiUGx
	FMxBWnnnR6A5M7gvml3qtZgt61WIqUYXntmteb94DCZ32YawaBpX/3oQ27jOrM+QHLSg6zKPLqp/O
	gJdjGqI8chlCH9L3D11YoNTlQGuljpsGrnMJ8IrsPD4EEviUNSeqYdM+hSCgPPQABJOhjo0gHbOCA
	8IKiVgwwyXBx+EMmAe+v63k1pHDgQOh7dCvaTSM/SS4/TzIjA72xxGtW/xPbLylZrGM5dWp0X1/XW
	DU5TdVBufpwDyfvGshLIyKy5mjhb6XFHppXFqnbWx8/BDGO+RgTsLhtsOLJvanQ1NkvNgdGpjFLz0
	5+a4n6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqST-0000000BmXD-1u7B;
	Thu, 10 Jul 2025 12:33:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp40-0000000BZZ0-3nw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 11:03:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8FGRs002166;
	Thu, 10 Jul 2025 11:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnL5YbMxSPSCfxzFYvbsE5MYDIzNe44c0R0LoWDUaW4=; b=G4km2LB+jPUaqiSb
	ZdyBxreb9JXvCUx7+hh0FKR1a5wX7TYvTW7srRsfVCxTA3pVBatB2ABtnYE3n43W
	LlB+LFY9hzxRVbBjHwJAeBgg0zzbXmuAb90JmYO2EtErnwbNJML4w6isLX7kuGCG
	MOwkOWVb64Cnvd2aM/94H9q5XUVvzSKMg3UGaq73tMcggv8BWa0T9N8Ia4VlYntT
	z7+c06yctqQI4xlmKEpV4hSi+lMRh8NZQmQhZJ+2ZJzVZXnj5VE8FaJxuHw5IGng
	ZVbGlaZpW4WZK55oIS76ldWKYGhOqUv3HruJzL3P2Was/RHVD0JYh40ugJfyYUgp
	fGuNRg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap4pyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:03:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56AB3UIv010622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:03:30 GMT
Received: from [10.239.133.49] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 04:03:26 -0700
Message-ID: <aae21139-a4cd-4c5d-8147-56c2352ae195@quicinc.com>
Date: Thu, 10 Jul 2025 19:03:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: Add CoreSight QMI component
 description
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-2-quic_jinlmao@quicinc.com>
 <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <6b286132-1c56-43c1-a61e-0e067a73b615@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686f9e03 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=AF4Fs5PTzvYx14FSdpIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CB1oC-9VWWKmjzPlSedjzmHG81GMqJcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA5NCBTYWx0ZWRfX52zLSLsHsSBY
 OJaAhhYeS3iaYRfC5uvTaxajjcZCyGguADkYMi0IHKzRn9/3nem6dAz29lauf+RRUF6RSxpCWDw
 PDdGzrMm96xvioMAmkpK0cCDiZQ1ZxhieIuMuBdSxBLGju59UNg0QkHvvH41hEUG+XV6s1w7bG8
 8v6vFKGov5+zDjHCvkzMiG9YGyhk4q8MWKrWBxM9x+1IQTjoj2j9dsc5z5SFhHIpag3izDDru/+
 MPobh6jLsM5Hr4BvGLumEqprPxjF06vg46xSgw+aP4nz4oSGFqTmPg5RbtnsTuqPA5hyMNfZUve
 vSKaqYG1ghuRTjKv1YZIbhvcmRlCZSeJCV5MI2JG/JJD5Tpd/Bo+cNcDY+NGp98BbgjGQyiO8sa
 QnZ0hOaq+tmSDOy3YI1Uy/LLgHCWSQEeZZP8brEPsNi7/tN7OPrnXcbpNJ7PzjuOaP0djw9h
X-Proofpoint-GUID: CB1oC-9VWWKmjzPlSedjzmHG81GMqJcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=878 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040341_065119_A64D8212 
X-CRM114-Status: GOOD (  11.10  )
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



On 2025/4/25 4:30, Konrad Dybcio wrote:
> On 4/24/25 1:58 PM, Mao Jinlong wrote:
>> Add new coresight-qmi.yaml file describing the bindings required
>> to define qmi node in the device trees.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
> 
> Is the service-id hardcoded/well-known? If so, we can drop
> this devicetree node and create a new platform device (& probe the
> related driver) based on the presence of qcom,qmi-id that you add
> in patch 3
> 
> Konrad

service-id is not hardcoded. Different qmi connections will have
different service ids.

> 


