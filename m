Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61342C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RbAHSbae8Jj29ZSVUOTUguuPqjViFL1e6ZVXS1jCfM=; b=1RiKrpjlNpwo2QHKg+TQwYNYOU
	7bgafBPNnIB1tXmNYyZCaUlOZR7c0CYXKtXd7r+w6euaREBhNA8i5BiQThIPO3hAnw1+nrVgHus+2
	iBwjrsC/Yfda5AphiAlux281hYBE96X2m5h3xno+mCp5U8juJgkbNOs56LSKn+i1iltMtULyC+oPJ
	0KHCkSYA4j/P7WUBd905Z3W1pG8oD4S3QkIzIZ0S3vB/WdIjUvvMyPL9ROPcSqgNJykRwZhQNIbrD
	R/TocgzWJkMBlbv+uRq2AIdJQhWCjgpxUUiWUCXDwLAeI60BM5PG+9nJRgBCqrkYNIgykqpM1fXtT
	uIzK7TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWt6L-00000007e7h-3ulJ;
	Wed, 02 Jul 2025 08:45:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWt41-00000007doM-262E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 08:43:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5622U1Sk020544;
	Wed, 2 Jul 2025 08:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RbAHSbae8Jj29ZSVUOTUguuPqjViFL1e6ZVXS1jCfM=; b=OnKdYIJOX6kzgIG8
	FV16+1iUUADbnb2TMJxRqharHmeXLLVOUrxS7d+YgGmVfKsXerCrndtTsDldyAvz
	kxumGv5iYwwat7kIxw2wulzNc9VT8Zp5Zrk1+/C1UUSx2zThH/20yt/rWonQE3Oz
	k0f6W5XaOi7lJK352QnAcjtoP1X8eB+BNiUsZXzWa5HKRr+uBLVXtw73bO4gTZ+4
	7DQ23C2tcEaRtctCutfQBom1elKcfPwJp+sHGG9iAEFuF8LoYehusXtydKbUEv+7
	LVYR19vjPc99RLUeYnnmGsr4VO2pHpFY8hN45HuPRe54LIIq5NOXlPCwfUZTaAzR
	kilxNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2h0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:43:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628hOmg031410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:43:24 GMT
Received: from [10.217.217.109] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 01:43:19 -0700
Message-ID: <4884d189-e43a-4932-af52-e1987bd7106c@quicinc.com>
Date: Wed, 2 Jul 2025 14:13:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit
 Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
 <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OSBTYWx0ZWRfX8VcgtUhyolYE
 VzR1RXp2VdwzTnrCopUKekm8qLZdpBh04QtuOXo8dJbDQSw6Xdzy5vJXf0uwXBd0gE1aa6GsjHo
 Eq+UP46sNtfjAeq0r6rmQR+hFAGW8QHhIQPsFG02d9wVQjZEnsWHUlimx8kgUQDz2Tx5T08bBWz
 uNuIKtPGXHKOL3uraFUOsUTvmz3poHoZ/yUzl+H9asmRwnfqfQeWF1I+IZP50hIQ6VxFYyaAR5E
 wHEV9PYb8SU80DNxm+H//JlkA2n8jatGeYH2Ki3+D62sWbv1C1iLh3PLNmC2LKwriw7ZwchtZJ3
 akOnR5a/x4eHFOkcnUDFkP2mUp9EVM0qKDSMkb2FV4YNUnZBDbCmxJ22apKKaBEJCiPm6e8Oyip
 1H+wf4BEMLPTPrqbZXcRldcfRexN0Anbj//UTVeDhHD33hH2BmEQxNhIAj9P1m0NaToa5yMR
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6864f12d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=O75FsbJ6qr0OxAJT8SUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z_qDogjY66KuJUuri63Fz3YxX51oqibx
X-Proofpoint-GUID: z_qDogjY66KuJUuri63Fz3YxX51oqibx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_014333_657510_C2D507C6 
X-CRM114-Status: GOOD (  17.11  )
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



On 6/27/2025 6:07 PM, Dmitry Baryshkov wrote:
> On 27/06/2025 13:13, Taniya Das wrote:
>>
>>
>> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>>> The alpha PLLs which slew to a new frequency at runtime would require
>>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>>> which can support the slewing of the PLL to a new frequency.
>>>>
>>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++
>>>> ++++++++++++
>>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>>   2 files changed, 170 insertions(+)
>>>>
>>
>>>> +    /*
>>>> +     * Dynamic pll update will not support switching frequencies
>>>> across
>>>> +     * vco ranges. In those cases fall back to normal alpha set rate.
>>>> +     */
>>>> +    if (curr_vco->val != vco->val)
>>>> +        return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>>> +
>>>> +    a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>>> +
>>>> +    regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>>> +    regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll),
>>>> lower_32_bits(a));
>>>> +    regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
>>>> upper_32_bits(a));
>>>
>>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>>
>>
>> Dmitry, I was thinking of implementing the following as a reusable
>> helper since it can be leveraged by most of the functions. I'd
>> appreciate your suggestions or feedback.
> 
> The code below looks good to me. Please use 'alpha' instead of 'a'.

Thanks, I will use 'alpha' in the next patch.


Taniya


