Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F1E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ex0xZqZ0k83RfTjakfiVSjrcogOZMcDKwtDMSk/NpAU=; b=a2oFCeST8yh/FfomVL+hcbn0bW
	A2M/MnZPceUN1Q8wxxn7C+heQNSzQq8Y0ugahqInlWx5J/zArKidSevA3DxZkgeeE5mUCxUvt3qGl
	+RuhtMpkD5hghfXv/DoF8QJUcQDuHESu1zbmru3L9OoeMHHV5VKuK2Z8x9SjEhtlvMCsZ45goOBfn
	V2PbSe4V8KuIiya8ympD7RB9bJ+2ftTGZfM1IX3Zoi6as02TfPgfaYeoLBfT2svdZN0xQg3SkZBcN
	9j+4rFlWUSEYHEitJSQiHa7eMUs4qUszB9ZIrn9UbG1VDXNTa5trlUmYRkhX4h8zuliZRoZMUb6Db
	fZr2WZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcXH-0000000Eoew-1zDi;
	Thu, 26 Dec 2024 01:19:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQcRM-0000000ElFd-1eDi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 01:13:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNxnFT000561;
	Thu, 26 Dec 2024 01:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ex0xZqZ0k83RfTjakfiVSjrcogOZMcDKwtDMSk/NpAU=; b=f7BSTIsphjx/sWzJ
	eXuQG/MKC7y4CSxuVwfdGxv+mdkILFdKibWW3U1nA0xAUAafc44nuLeVS/OTMfUc
	YkkDclTpC1x/MN14GCb7bO27K1fQLgNhoL70VJiSTS54KFI2D2nUYgiRYSs8Lghk
	VeOACgLYmcooq0aDt7g5gyLGkSnNmfmGj0hWalpItYKR5hGu6gHaDupij3knpUwD
	BJVTpAmyJtNCG19iTAx+QFjS4RXVXyQiQPWl5XRgB+HoOZ7H7a2hc3s2ZmVq7qIA
	gD8RqI6tHmpUBq8jsL7SvHNyFHlpKEmcb/X05eSrYkXv1ftfok9zXY/vF67/YGBT
	fsL9Fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rqm4919v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:13:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ1DG4G032253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 01:13:16 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 17:13:10 -0800
Message-ID: <b0a079e8-943c-41cf-8d07-71087d08356c@quicinc.com>
Date: Thu, 26 Dec 2024 09:13:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul
	<vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
 <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _FgBTisBsoUT2T2pCE7PWbSBH3s23ulI
X-Proofpoint-ORIG-GUID: _FgBTisBsoUT2T2pCE7PWbSBH3s23ulI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_171328_556133_12E2F220 
X-CRM114-Status: GOOD (  16.47  )
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



On 2024-12-26 00:17, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 04:58:20PM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
>>> On 24/12/2024 04:07, Yijie Yang wrote:
>>>> The core version of EMAC on qcs615 has minor differences compared to that
>>>> on sm8150. During the bring-up routine, the loopback bit needs to be set,
>>>> and the Power-On Reset (POR) status of the registers isn't entirely
>>>> consistent with sm8150 either.
>>>> Therefore, it should be treated as a separate entity rather than a
>>>> fallback option.
>>>
>>> ... and explanation of ABI impact? You were asked about this last time,
>>> so this is supposed to end up here.
>>
>> I actually replied to this query last time, but maybe it wasn't clear.
>> Firstly, no one is using Ethernet on this platform yet. Secondly, the
>> previous fallback to sm8150 is incorrect and causes packet loss. Instead, it
>> should fall back to qcs404.
> 
> One of the purposes of the commit message is to answer questions
> reviews might have. You were even asked this question, so that should
> of been a clue to include the answer in the commit message.
> 

I will include it in the commit message in the next version.

> 	Andrew

-- 
Best Regards,
Yijie


