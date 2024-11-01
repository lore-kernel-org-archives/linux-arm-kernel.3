Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4F2E674AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovhgDWrMf5z56w1aAHROlrv9Fuapjcb0MG42724dH+s=; b=rQtmVZSe2GysOAjALruAW6QRKi
	zDMSX8jM+kB8KcFk2cr7BDIK7RTFt5Z0lFT7uPcpahtErZeoQriwUwqLANRgYBQc0lpCm1T60dsnD
	elM9VSPwVDUWBKGKEXR2+vIncxUr/fAWUPNLeZJQxzn8yTX2adbtkNGOJd3c3RZ17r9GgwNFD8xuE
	sWFkwt95zsFez1Czjx5OqSsdoQTc71uQVGOPr+uv6ijNXSUWwcUDkiEYJW4Ae6Rbz6BjMYlWG/t+K
	429soz4By8Zq7xeT1dZ0MJfS7LN7M55Zw8H3Ledj2BLqaXyqEtYV+krvVlBBGsK69nMuHirgOSOOd
	qlmiFaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m5E-000000066oq-1ljL;
	Fri, 01 Nov 2024 07:28:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lsw-0000000652Y-3wLc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:15:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A175Jje026701;
	Fri, 1 Nov 2024 07:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovhgDWrMf5z56w1aAHROlrv9Fuapjcb0MG42724dH+s=; b=PN8b1S1tVqhFnKeU
	KIuRzfWScZJjnAh0bArxZ3mqiVKpaNV500tJVd94regqI982al7cdJFwFj4swQBA
	aH65gCeaXITANmJRmxFSmB8G3Fa4fBYKNeWQOi98KoSZC2+cHHjsSytMXCFPzH9h
	aIG2F8cy8HZhfrR8k7Lhd+nbk+8BZfE48++0nrVZAxK2q0VOm+g9RaxoC/stEiBX
	sDdOcEy9xjyiYMIUztHfLEhA3yCpOQv4H+r5xziGew5WaNIh0Ci4urS+uCDQu+t8
	W/88b+MdDOVNTYQ3khmTJl/tgWJqoSD7ZUQ4CAxWJvLOBIisMSsmN7x8W1OqH+Hw
	7EV9sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p39gfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 07:15:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A17FGXl012862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 07:15:16 GMT
Received: from [10.216.44.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 00:15:10 -0700
Message-ID: <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>
Date: Fri, 1 Nov 2024 12:45:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
 <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
 <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uc-jdeAzzNGQkuQbTjeYeVb1f9QNB-N4
X-Proofpoint-ORIG-GUID: uc-jdeAzzNGQkuQbTjeYeVb1f9QNB-N4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=670 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_001555_141250_29B1AF68 
X-CRM114-Status: GOOD (  14.96  )
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



On 10/31/2024 8:44 PM, Dmitry Baryshkov wrote:
> On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>>
>>
>> On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
>>>> +static struct gdsc gx_gdsc = {
>>>> +    .gdscr = 0x100c,
>>>> +    .en_rest_wait_val = 0x2,
>>>> +    .en_few_wait_val = 0x2,
>>>> +    .clk_dis_wait_val = 0x2,
>>>> +    .pd = {
>>>> +            .name = "gx_gdsc",
>>> .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
>>> this platform?
>>>
>>
>> On QCS615 the GPU clocks are directly controlled by high level OS.
> 
> Is it one of the gmu-wrapper platforms?
> 

Not, sure of the gmu-wrapper, but this platform does not have GMU.

>>
>>>> +    },
>>>> +    .pwrsts = PWRSTS_OFF_ON,
>>>> +    .flags = POLL_CFG_GDSCR,
>>>> +};
>>>> +
>>
>> --
>> Thanks & Regards,
>> Taniya Das.
> 
> 
> 

-- 
Thanks & Regards,
Taniya Das.

