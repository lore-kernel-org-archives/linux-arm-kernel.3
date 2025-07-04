Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6605CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNTzHXYxvUi+S5whbil/t7reDlkzq6JrDXXo/hSiZPU=; b=pyCm/EwvBCC7ppaZTsXVj37MTY
	Q2XSyk7HHepazBF1zjLb2ZT+2nTUsxF5CYMna3vmH1W10uW1R3ucKZCyGID3Dz+af7Z/hssX1c77M
	cUHCZHvllHV5Q3Drc3PRby2JAKbAw56D4oU9U4hGkWakBjiYN1uHskvUqSiksGySizIlSPVTY1yZt
	A+M1+UhnWMXows2JEOf7Q/9qR77f5TJMTQiaMS88KTGVyxtlmC//IGHSXAfBIMg+3FXSEI/BlCpaJ
	Z11hPdyxcM32Uq0nBDW779vQY1O+xMoZSL5RmM6xrXKY+gR0iQN3SeL0vUXANJyFmh47rLae3RrMq
	0Ze9zj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcI8-0000000Dqgt-03lp;
	Fri, 04 Jul 2025 09:01:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbZJ-0000000Dgmz-0J09
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:14:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563KD072029559;
	Fri, 4 Jul 2025 08:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNTzHXYxvUi+S5whbil/t7reDlkzq6JrDXXo/hSiZPU=; b=cXDVDzkU5j7WPM8l
	II8u6yU8l44BlPA/t8gacjAVog5T593g/Rxrf8pyLqvEjACxdphncvuqBwu0irT+
	vaUMik0bzxJfB8spew21qoGCJYqiOzurYjca9BorUCF/8KUtopvRVLt7koo7uHBL
	RaxNgy2orqqGIAtwzwILlD4mddLNPOnioLJ6dVoOPSj2WnzFu7s0xMU3Ge4xc/8u
	co7fE9JUWFDp8k8ETCZLzsZIKPPrfmXkLNrcpn4kADVrvFnbUGPSC5pG5aOSA0Ug
	VRZcSjVMuBY4TqysUfOQ//N95omesY6ZAj+tuFM+n+J2EwMtMdTtnhJW6a5AsvuI
	e+VnAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4f9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:14:43 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5648EfGP001395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 08:14:41 GMT
Received: from [10.133.33.146] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 01:14:38 -0700
Message-ID: <cbfb9159-1c80-4db4-b5d7-036980a1a44a@quicinc.com>
Date: Fri, 4 Jul 2025 16:14:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <338a9ee1-10aa-4bd2-9b0a-5006ed571bb9@quicinc.com>
 <3551dba1-0c5f-4000-8b95-6a04cd81a027@kernel.org>
 <2e8366b3-c060-4bb8-9704-0a8f41901706@quicinc.com>
 <9c11bd92-ff2e-493f-8e71-fd8d3f8b32e6@kernel.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <9c11bd92-ff2e-493f-8e71-fd8d3f8b32e6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68678d73 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=7HYVpmGVIpDqLF0RwCgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MyBTYWx0ZWRfXxRR7voGWv7uU
 CpaFbWjFY0Iir5YzELYhFGQ/eMGt538QWCkaNYLHhQhWShdGKuLLq4gemu7NDM2DYECRgNM6+rr
 Bl6tceDvN77gQAzL9cYCV1h/yGr4TKkusajuDq31/8t5ZrGuEy0u9EF4mqsOmPe0RZhVoBzRrOf
 AH1fAg3SA1nl9SfDbvyxaAlzNKAK7VHLk0N3F64tvaW2R6JppH8vnUnVDyMta15y3z/qIxu4aQS
 wiXQNq+Y5F1M0FgTqQ9ERlhwkw36QXr+IfMcB2U4p2FWCZ/6iXAxQM84bZMSSVn/7L68OemwFyW
 vSb2+jo9usVz4gjGEJhFe1cjS2aFuWDqY+5tEXPYIqaiU0lajj0N2ewDF+IdHvxAbMc+h4WTput
 TafjpCUFsr77uGULq3xSt5gOVRL5BiPsHHvuDvzZ652YzIib/wGX1AAdJyorOCeYGCPizfPu
X-Proofpoint-GUID: TOy7NGq_g_Wx8dmL4YxGZcfs2YJJmPHE
X-Proofpoint-ORIG-GUID: TOy7NGq_g_Wx8dmL4YxGZcfs2YJJmPHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_011449_132823_60704A93 
X-CRM114-Status: GOOD (  11.37  )
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



On 7/4/2025 4:10 PM, Krzysztof Kozlowski wrote:
> On 04/07/2025 10:07, Jie Gan wrote:
>>
>>>
>>>> offsets for the ATID and IRQ registers, because they integrate the same
>>>> version of the CTCU hardware.
>>>>
>>>> So I propose introducing a common compatible string,
>>>> "coresight-ctcu-v2", to simplify the device tree configuration for these
>>>> platforms.
>>>
>>> This is explained in writing bindings.
>>
>> Yeah, explained in the code lines..
> I meant explained in writing bindings document. Please read writing
> bindings first.

OK, will check, sorry for the misunderstanding.

Thanks,
Jie

> 
> Best regards,
> Krzysztof


