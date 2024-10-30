Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64657D6B6B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DGMEMnPe14tMN1h50lsqpL8wS50+hsWQ2+3K1ttIWQ=; b=hAtM+nKChfAtTVOrlj+BF0XdNR
	IXdGsdKwHrYelEGJSX90BrP0bQX4S6goy+LI99mU7lmsdj++h7raRaxoiMQOAobg6QKrLccl4NgYh
	PzVG8EcTv5KcrpLt0594VNUk6g1yyYVVdQIlJE8C5Z/Fr7Wlxywc8exIauN4SApB+nNpJIhD92hTN
	A6DeiJbO5GO47gEbnvxzJMcc/rPPC2Ybtq/ShK2y4i9Z/pFu2OkOjc5UfufFCpos0rK3g4dqz42j1
	owqLROlLqK/MI1kZ7XP6XkGV1qeAoCIJx3ESbDH5wYb1SFajO9SyKsOg6Ml+FME37jJSctI1cxU9Q
	+ABO93XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6D0S-00000001MDx-0f03;
	Wed, 30 Oct 2024 18:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CwJ-00000001LcM-3LZ5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Oct 2024 17:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7DGMEMnPe14tMN1h50lsqpL8wS50+hsWQ2+3K1ttIWQ=; b=Z1FNb5rlwqYT8iY3m66RQw+qas
	szMYDnvwJ2lRqk8lSItM9LzxUGD90rKiVHk4b6SsuJi6EJ3NI13a9hSx8WU3GHeQq3fM7TX2ooTrm
	Z3VAwp7SKxpcVL9NYegbc+UdZe0t6LSLUhGfs7KGm2Et9BNHUEDUfFwYOP5NYD2XvXpdVLB8BI4kM
	FGz/ABagLHSsAKmZ4Y5LVpXy5mkh2pkOJXxxL0g8r988bKq9TFQQe0qGTA0UVxYzCvYbSsiV4Q1ud
	S8r5J7TAhLnUNzRFbfNrMFCyDHPsAnkchE8mQfF+4kxAob9q4nJoKkvB3XDWw6XxiSe+YrKtne0yA
	ZXetKRMw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CwG-0000000AJrr-1JQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:57:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UDqNS3000334;
	Wed, 30 Oct 2024 17:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DGMEMnPe14tMN1h50lsqpL8wS50+hsWQ2+3K1ttIWQ=; b=N0zhlC3h3yf77wB8
	ujtPmVzcLEBuuLFMbUR3kCJTDytzBCMdH5WIMd94MgoQwSXj4x5VyOtus6+4W1+W
	qIEc/4iRolMMspMZ+Z1y9THjLZpiXo/OGNhXKRFVBFmZICks1LUVjsO51W1TLj3U
	6WiH0XQGSk+4YKrPErMfqz0X8BrvNbTvMj3dpN5E2xNxXwmCt7Cw3/cbWjxn6N9u
	CPVGQahy2sDfQmmzo5SbSy1Yi+XdRK5eSKQculKxnoqluMeXp8HI6V6MJrnIhIZz
	caBaK0yrOGSeSepDvgctkrCGlO9aAT5JGK7uwL3dozZss1iIQYlZGnsbJJvjOVyL
	awhYzQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kp2g8pem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:56:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UHuHUn005844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:56:17 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 10:56:12 -0700
Message-ID: <4c4d7b11-36b1-4d86-91bc-8bcb8bca0a00@quicinc.com>
Date: Wed, 30 Oct 2024 23:26:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
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
 <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>
 <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ql71PkICb3kDMqTD6nefwc_Tbirt6U7t
X-Proofpoint-GUID: Ql71PkICb3kDMqTD6nefwc_Tbirt6U7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 mlxlogscore=724 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_175700_825412_208826F2 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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



On 10/19/2024 1:52 AM, Dmitry Baryshkov wrote:
>> +static struct gdsc ife_1_gdsc = {
>> +	.gdscr = 0xa004,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>> +	.pd = {
>> +		.name = "ife_1_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR,
>> +};
> Shouldn't IFE GDSCs have titan_top as a parent?

Yes, I will fix in the next patch.

-- 
Thanks & Regards,
Taniya Das.

