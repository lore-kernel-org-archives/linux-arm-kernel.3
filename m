Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59899D6B6B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFZ4jK093/hp1fs+vI48bsmNhl76L6FBa4yfekgb5f8=; b=DIUBCdovA3UdeR8NhREByulIOC
	WZZVzmy9TbHDV8P3vSx+vpbwkbaeVF6nLHPMqBvTFDvgQP5w7mutKEPfObC3HbQscPkFMEawXN8+3
	8/BmZVqmxOnWn67Mcfs/+E98yv4LVXi8FpG96J9NZXNRY1YJoiSLs9YLggq8Ak6rXtcPkLQPL1z/A
	o0f15on0Ntq/A8IKC4fp1905zUdI4g5G2IJlZZDQKwkOPZhvMSxIEOWs6JThHqd9PEAhuNlIHLTra
	+DJIu94zu0RgpEqk68tRVZCJinneiIOJ7LiyW8iKsRnHkpVxOEu0K2W1HPFTVeHo1XJMdha5QjvkY
	ux8oYPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6D7E-00000001NCm-1BQs;
	Wed, 30 Oct 2024 18:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6D40-00000001MiL-3TWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 18:05:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tGmv007054;
	Wed, 30 Oct 2024 18:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFZ4jK093/hp1fs+vI48bsmNhl76L6FBa4yfekgb5f8=; b=fyap0UUwDO311313
	Q2hNuyTOvdPYm6UYbqYUh51k2yIbTEXeo2hM+eElNs4bN084C0qWHoEV3SCncPlG
	h6a4xjK6NWZIjLwgnr++AKLUQqhkHIEu1VkxLl1B+HPzuze1wqoxUoX1+pIv3xms
	2nIEWYFofNwDuCw7WKxyB7sT4Eh+4gBpWWb65ZaqriRyEyMwDw5R+ju0BgndTx/b
	GFqCBS/cOLX/syuNCUnW193c1ROx5X2d7bspqJT/1LffXRS5C6SvAdN06FEx83xJ
	uez/9JeKYTmXbJbYALeu3rHE6SErIDZD6EVPUM358mjzRvMXp10/cqlMCu40Hqgh
	M3a8ow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbsjan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:04:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UI4U76018017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:04:30 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 11:04:25 -0700
Message-ID: <ed81fbc3-7a15-4468-963e-e81c668f8978@quicinc.com>
Date: Wed, 30 Oct 2024 23:34:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] clk: qcom: videocc-qcs615: Add QCS615 video clock
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
 <20241019-qcs615-mm-clockcontroller-v1-10-4cfb96d779ae@quicinc.com>
 <ig4hdtslj3qpu4arke3ejdensc5rs4jti22h3bpduub4uzglrc@gjirgpwgfvi7>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ig4hdtslj3qpu4arke3ejdensc5rs4jti22h3bpduub4uzglrc@gjirgpwgfvi7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l3yYrY0OePqyDmKlqysudVL238msHozk
X-Proofpoint-ORIG-GUID: l3yYrY0OePqyDmKlqysudVL238msHozk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_110501_018119_E6F247E3 
X-CRM114-Status: UNSURE (   9.57  )
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



On 10/19/2024 2:01 AM, Dmitry Baryshkov wrote:
>> +static const struct pll_vco video_cc_pll0_vco[] = {
>> +	{ 500000000, 1000000000, 2 },
>> +};
>> +
>> +/* 600MHz configuration */
>> +static struct alpha_pll_config video_pll0_config = {
>> +	.l = 0x1F,
> lowercase the hex, please. LGTM otherwise.
> 

Will fix in the next patch.

>> +	.alpha_hi = 0x40,
>> +	.alpha = 0x00,
>> +	.alpha_en_mask = BIT(24),

-- 
Thanks & Regards,
Taniya Das.

