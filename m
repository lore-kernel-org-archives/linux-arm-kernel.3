Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038F2CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/ZMfLGs7bSbR/zLo9REdb0DGA2A9TTnVxIecXKcFpU=; b=Q8f2gg+D/uGf15otKh3ubqwYGq
	sk7owG3B+PrbXB2lOlV2uNLjMZ6fSRSt9I0pFGvvrCWsyaKu1hGLu63DiGRqhm1TrlCh4n6k4UsYQ
	FAFPVrxGmNo4VcawN4CXkbM6bT045DPnp3sgxuSvxSNHwidV28Dsct2SV0cr9Ab9xsr2v/+V2f81c
	5QmIqndkYOKz9n2pGXW8iqWnRh8TevZDjdY+HjTJxYCo7UrG1arin0sGqCWgVGUDIj35GZq/qkL8O
	XfRvw/gbsDkTgM3+Xa0eFeR4uFacpSuYfrvhsSuzDKlLpdP9xfQgrz+m3oO/LFmXZ17/m6u8dY7tM
	kpZDKSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNb-00000001Z8F-1NVA;
	Tue, 02 Sep 2025 19:09:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQdk-0000000HUWC-1X34
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:01:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AlBAt020481;
	Tue, 2 Sep 2025 13:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/ZMfLGs7bSbR/zLo9REdb0DGA2A9TTnVxIecXKcFpU=; b=heWvlY09TS8Dodcj
	nDk1axW8WKeKESl3t7YB57gIJl02SHSstPuUElQGK0bO3hNDMPVnWck5iAyy1UZD
	5P732GpB1+1zQ9B9Dmg4HMFENXcUvWsKJeb5FMR+t6ZHfqUCh0feSR6IaJ50szS2
	FgslHdsDSqN4AcUcQlYdFNHqOii3RdbDAsOdi8ooPKJ6luBd9rAnJYP1dlZtyNki
	W83/HBHjei/tUnqmD6InohdanoKKtXReS/rgTf2a8xGtrkgXx+UaXED/e7ciUHk9
	yxK9ptGLgVM/Wht31Awsp5evF0QG/1uXjBTgvPtnBKxqaB3rQrULLxv8nllKdA0r
	OUBwqw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryx05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 13:01:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582D1JZk032156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 13:01:19 GMT
Received: from [10.253.38.125] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 2 Sep
 2025 06:01:11 -0700
Message-ID: <245522c7-f1ee-4e49-a08e-b23580b06939@quicinc.com>
Date: Tue, 2 Sep 2025 21:01:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH v4 00/10] Add Network Subsystem (NSS) clock controller
 support for IPQ5424 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250829-versed-gazelle-of-tempest-edfbf1@kuoka>
Content-Language: en-US
In-Reply-To: <20250829-versed-gazelle-of-tempest-edfbf1@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX1SN8rVCyPQ7R
 F3UgAARSuC2l6oJiDKHLASUcXlk4yTM7FtZed1OHGuaZnYy80VpBcCHlsyOUStQwfdcwB7/+084
 iaT9KrBvwvEHhLrxcrnHPJlR2GC9m5oFK8qbY21CyL7ORqMucQTx4qD93dklYmZKLyezMyX1vco
 TVtBQcx+DbH/hongVxkZIqY+OImQsc83SX8/tHee2MYYVkXt/Bh8iJ++wOLsa6PET5/8X4B+MMy
 D0bf6QZk0aLlTK8ua+r3nmijEq0efmKQMfQQMOpvQvEat9IgHussWT7iVtiyOKvWnEKszxDy1H7
 dxlLjIho1kpXpCn823hsow8SerynUyoCY48MvNVcfeY8BqXwpyUbEXgfvoVAsqdOklUCwPJo9EQ
 KhIqWd0w
X-Proofpoint-GUID: ejD3hXgXCiC0sQfAFAvD2HL84P8N7eIO
X-Proofpoint-ORIG-GUID: ejD3hXgXCiC0sQfAFAvD2HL84P8N7eIO
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6eaa2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=cUcCN6izRAiZHZspSPUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_060138_992916_AC85A612 
X-CRM114-Status: GOOD (  11.63  )
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



On 8/29/2025 3:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Aug 28, 2025 at 06:32:13PM +0800, Luo Jie wrote:
>> - Remove the Acked-by tag from the "Add Qualcomm IPQ5424 NSSNOC IDs" patch"
>>    as the new NOC IDs are added.
> 
> So let's wait for v6 with acking :/

OK. The next version should be V5.

> 
> Best regards,
> Krzysztof
> 


