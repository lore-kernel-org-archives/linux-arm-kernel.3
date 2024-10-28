Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED4D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PobXzPGGnjLtxgHS3B4nk270t4SMrzqU1Y+YvIFP7Vw=; b=LbayFTBgA1TdDJLz1KY/QmqDr2
	HeFya0iGn5W/L1c0lAfGnjzukRf8QW16CWg9aw7X72wf+XqrKwiviANa1iRUBdboaGnpQcFRDSlRe
	M78t6c0j2z2swPBZ3xLHr+lbsGzqpVZQcIZZmTHC0mv5gylhN4G1JBwcq28YVuFRqNGkL0VNutpsW
	DL/ugKYYLZpMKFQYWKR5aavH2Zu6G1DtPmASlU9VhR5zzrohGv0A2r9gwPKDCErzEjkvGoXNYk+Vf
	l7flBy0+c602e34sUEaipCWTGJ0Hn8fakdHKU8L4CVagCzPeqcjBSpgaKBN9HdqrFZJ4pc2mYtbo+
	YdJIqLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KUe-00000009xQe-1qr9;
	Mon, 28 Oct 2024 07:48:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KS1-00000009wZn-13F9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:46:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RN0OG6010456;
	Mon, 28 Oct 2024 07:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PobXzPGGnjLtxgHS3B4nk270t4SMrzqU1Y+YvIFP7Vw=; b=Bi3RkSbDc7A892gc
	pyMeJPC3Hob/hxOxDhrNLvf1wvhb8uFzE0CkC8DKjY6+zEr9acONf12+AXYH9NmC
	PBReXXGYoOBT5wIneCkKCZU6LmP7nm3HtN/CbA3yESqUsHbLTlPNyY1KZ5x0iOZh
	XkZJ1VyWT8XbEdLtpsWRJ4JxbQpqdSIVidTC3umUgEI1n+lMX0I+CG3DXLUQjCHq
	/Rb7bTnM/5d8cyRJDgX+8Okm1X6c5pLW4RBnwkgos8oNvs6mGubIO+2q21qBJlXK
	0KIYFAKCuB6JLAdnC7JgRuehPmNDNmtQLnc+1gqYsbCiZI3cj2qSfohcNOpDT/Iz
	fauHuQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x40xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:45:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S7jqO9014587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:45:52 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 00:45:43 -0700
Message-ID: <5862062c-8c52-421d-94b3-6b6000b53616@quicinc.com>
Date: Mon, 28 Oct 2024 13:15:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-5-quic_mmanikan@quicinc.com>
 <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2B14fMh6JTJ678YrLvHL2MnvQnTUs5Ax
X-Proofpoint-GUID: 2B14fMh6JTJ678YrLvHL2MnvQnTUs5Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=703 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_004609_818384_E4FED7D1 
X-CRM114-Status: GOOD (  16.43  )
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



On 10/25/2024 5:30 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 09:25:17AM +0530, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V8:
>> 	- Replace bias_pll_cc_clk, bias_pll_ubi_nc_clk with CMN_PLL
>> 	  NSS_1200MHZ_CLK and PPE_353MHZ_CLK
>> 	- Remove bias_pll_nss_noc_clk because it's not required.
>> 	- Drop R-b tag
> 
> That's not really a change waranting re-review.
> 
> I wished you did not create here dependency, skipped the header and just
> use some number for the clock. Having dependencies does not help anyone:
> neither you to get this merged, nor us to see that it was tested.
> 
> Please confirm that this patch was fully tested.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
> 

Yes, it's fully tested.

Thanks & Regards,
Manikanta.

