Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA83D6B6B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7vaGGF0ZQrdZ7T28DJe6eUEwES7PAilGNP9n7e2Pvk=; b=3UuS7ndikUVFaAlIqj7wxelUXZ
	MRdoJ+yMGIK0CjxafOLHeecKmsQMGtfj4dz5fl/n/5dKqAxGa67jmzO+gUIbUJffnzjpIHupeKS1b
	Toq/hV9vXLhEVTEi6wLEeaSVs74DN6I5tgt37ix7IPUzuRxtoI4SaT7vhzaCyXaqgZ054THp+qtd8
	J0j4bzJp1mG+98pZCXyCf2gJWJAlwRppSI+VSFIxFO5+drJ0LLRbUr9HD0Rk1Un4rgHHyWXSVfDBT
	MQX32AJtbjNm9cJqN89gXcqfhZB6PeEiigR39YuhgYnk6boEIXmMcbHK2tfTe9xKRc5rpjKs5lqRa
	tKHhGC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ctx-00000001LFq-0tr0;
	Wed, 30 Oct 2024 17:54:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CsH-00000001Kvb-40lq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 17:52:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UCHO4Y020417;
	Wed, 30 Oct 2024 17:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7vaGGF0ZQrdZ7T28DJe6eUEwES7PAilGNP9n7e2Pvk=; b=IvOfUXPNyWHiHEmk
	F0hhAOVfy3G2/LgOBHDctw0mdpH/FNyr57DmUrHHTD+6NaHJadBy8cUNjgs44lKi
	h4UdXa4LYRggh9khKx+tWRkLzsL2nA/b8an7AsrqNraHr724gU0mpdIkT6UB87JR
	ECaMGRdnAHcd4v2g8sTJX9sTn4CZNLPCXrp1dTQuFfpKbEndLMq7KdpHgsflMQ/S
	4QaS4PmU0xiIsHqJQsXodV9dxR8i4i5HMevXh5tOzSAN++iDzP1CJktKxvHzrQ88
	PCPJNaEP2ArTV3ukGGetEkYN3bz6MUqJm8q7F7gNoXJGyv3cLgqgle07CoMPo9IH
	zHO+Dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0gxta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:52:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UHqGi1015906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:52:16 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 10:52:11 -0700
Message-ID: <b1e9f8ce-b8cb-40a8-a69f-9433073922f3@quicinc.com>
Date: Wed, 30 Oct 2024 23:22:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] clk: qcom: clk-alpha-pll: Add support for dynamic
 update for slewing PLLs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Stephen Boyd" <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-2-4cfb96d779ae@quicinc.com>
 <f78c5fce-4d7e-429b-945a-8e62cb9a2350@wanadoo.fr>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <f78c5fce-4d7e-429b-945a-8e62cb9a2350@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2NVBuc5c9uwG282KIp6GcXxW4_gTJ8KA
X-Proofpoint-ORIG-GUID: 2NVBuc5c9uwG282KIp6GcXxW4_gTJ8KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_105254_028007_54887CB2 
X-CRM114-Status: GOOD (  12.85  )
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



On 10/19/2024 1:50 AM, Christophe JAILLET wrote:
>> +
>> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
>> +{
>> +    int ret = 0;
> 
> Nitpick: unneeded initialisation
> 

Will fix in the next patch.

>> +    u32 val;
>> +
>> +    regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, 
>> PLL_UPDATE);
>> +    regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> +
>> +    ret = wait_for_pll_update(pll);
>> +    if (ret)
>> +        return ret;
>> +    /*
>> +     * Hardware programming mandates a wait of at least 570ns before 
>> polling the LOCK
>> +     * detect bit. Have a delay of 1us just to be safe.
>> +     */
>> +    mb();
>> +    udelay(1);
>> +
>> +    return wait_for_pll_enable_lock(pll);
>> +}
> 
> ...
> 
>> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
>> +{
>> +    int rc;
>> +
>> +    rc = clk_alpha_pll_calibrate(hw);
>> +    if (rc)
>> +        return rc;
>> +
>> +    rc = clk_alpha_pll_enable(hw);
>> +
>> +    return rc;
> 
> Nitpick: return clk_alpha_pll_enable(hw);

Will fix in the next patch.

-- 
Thanks & Regards,
Taniya Das.

