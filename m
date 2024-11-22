Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28916E65D0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 01:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJY+C2OrUNq8Cv/RftLal0ztMq2TbuzpXQ7+SdQmAU4=; b=iVI2haB7nklnOYznom2wRyk9vN
	dWofw3RZtOQfpOFL2zRyHswuY2/fnkk+L927P3dc9zoln63SdBoRkV7W4DkVMXAcHnPW6gzYK0NSz
	jJqu23UtjdW7wHGHpidLlT+FFvTn0g8Lh5R+B1AyBXuMK1JFg4Ay+v6z5Q9/MgkFz5IPM8NLoxMrq
	0e/txaiPvQ+TrgpPhmyyBK5bEUkGa7YL0isFC2R/N7cW5PHEtQl8J1CezLn6i/uOHpQPEUL9JFfCY
	oPGHXmAAo1kivzbk7pRluQQW3PXEtuMJfM5Xqv5gkU0NGr5Fc2R/28OS8fexlDCpI7ikFayA1+UHJ
	gkAd2rtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIN2-00000001J6K-3Lxb;
	Fri, 22 Nov 2024 01:22:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEIM6-00000001J1W-0Nls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 01:21:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALKxwOE002369;
	Fri, 22 Nov 2024 01:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJY+C2OrUNq8Cv/RftLal0ztMq2TbuzpXQ7+SdQmAU4=; b=CTc6EXIKke9fSPk7
	mcmffX4yJhwHbTI1K7gXt59cXgLZ4DFcRqS6aLyP5DItJ02+V5Gam/067tg+Rf2l
	LKbi/5n4f88FOTmotPeEllpLpNIRVKoUUyQCVtvCoBrpg6JE1J9igZDcgb95DING
	YxzK0+76mXPzM/PdFSSoO9PrpsiCuoNIYKid4IET26kNLQtfrvtXgMW5Sk4nbRO7
	Ax1IR3AhTdhram6z7UtmTs+Cwzu/POGjzH1t7irzh/p9hKi51oB6JMajm1eVKl4D
	JvJfPBXgVNV5ElO+wBi5nyKRTLyPYI9g4iDD1IslADgsH7q8Mkb3+v1OK99tO7L3
	NulYBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea75cwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:20:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1KrKK021474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:20:53 GMT
Received: from [10.253.13.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:20:46 -0800
Message-ID: <32eb38dd-1176-4356-b36c-00aa34a07040@quicinc.com>
Date: Fri, 22 Nov 2024 09:20:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add standalone ethernet MAC entries for qcs615
To: Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        "Andrew
 Lunn" <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-ORIG-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=587
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_172106_159191_C3F20A8C 
X-CRM114-Status: GOOD (  12.04  )
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



On 2024-11-19 19:18, Paolo Abeni wrote:
> On 11/18/24 07:16, Yijie Yang wrote:
>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>> compared to sm8150's 2.1.2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ## Form letter - net-next-closed
> 
> The merge window for v6.13 has begun and net-next is closed for new
> drivers, features, code refactoring and optimizations. We are currently
> accepting bug fixes only.
> 
> Please repost when net-next reopens after Dec 2nd.
> 
> RFC patches sent for review only are welcome at any time.
> 
> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
> 

Thank you for the reminder.

> 

-- 
Best Regards,
Yijie


