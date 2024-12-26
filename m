Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF60E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 03:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BlyQlB8pk/3M5PIzpsR1wJKOX8inruSQe6WtELhoos=; b=KN5W6r5xmlkMVqm4DS1MPmsk3R
	/LAlkbZ+p0gTSKsNH13A6M5uASOuhUc2vJA81FyV2rCDq6FBvXRNvhuXGtoZZB9XrUjNkqRw9P9LR
	PGvEEx9DokPPFwq7k6DDHw6mdS5ltyNOD80j3/8ykKOWx9736s2KPB65fqs/tawfcc34P7JQ+Y90m
	fDlhXnqEsKsfsQWYJrxvQ17p1Q2veMtxtwI5qoDcmAnP4uIdWCU62YR9tVZqK7tTxDF1Fvpjd3wEE
	DVX8jfTTu8W5ibG8kccBQSKWJ+l7QtEZysN12EtYBmHP5MyJ6JAklab/ilk+vJ01mfsAW1qyxzl9J
	p8S9rs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQeEa-0000000F14c-3LRm;
	Thu, 26 Dec 2024 03:08:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQeDO-0000000F0xl-1tZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 03:07:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNSuvJ014378;
	Thu, 26 Dec 2024 03:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BlyQlB8pk/3M5PIzpsR1wJKOX8inruSQe6WtELhoos=; b=b+K2GNc0TmYVOO2t
	NuSRFG/ttrH4a9qzp6DqeEB4QMfX3QkEk9JT4rZbVKckb/ImFoAbAuceK9OexkEA
	4R+boVcziUeINfZgNB0U2dM88WrFk34mdI5dLJ0iNmq2E4MVQvS/cp4YpuGWdWk4
	+aNYk/X0MBH1hHbOXWCBZOSp//uSqeIchUP7BO63ATf79YjcVbHd6+Qy3ucxFPG/
	Joy5MoG6JokXXiczIbnixL6sJNkzePQEDT0xsO/amuWxpRzYB99Igmn2B+T0BZrZ
	mYDNCNxo6D/1+UTzTeEL51g+bAOX5ENvdovS/1RztqzXb7MY8ldKM/YZz4KXkyzb
	yCP2Wg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rmamsvuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:06:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ36v4h002066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:06:57 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 19:06:51 -0800
Message-ID: <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
Date: Thu, 26 Dec 2024 11:06:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aT-qbS5--U28yytijSEuIIvt2WmkGe8Z
X-Proofpoint-GUID: aT-qbS5--U28yytijSEuIIvt2WmkGe8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=527 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_190710_621231_9497D037 
X-CRM114-Status: GOOD (  19.78  )
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



On 2024-12-26 01:49, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
>> The Ethernet MAC requires precise sampling times at Rx, but signals on the
>> Rx side after transmission on the board may vary due to different hardware
>> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
>> occasion between the rising edge and falling edge of the clock to meet the
>> sampling requirements.
> 
> The RGMII specification says that RD[3:0] pins are sampled on the
> rising edge for bits 3:0 and falling edge for bits 7:4.
> 
> Given this is part of the standard, why would you want to do anything
> else?
> 
> Is this maybe another symptom of having the RGMII delays messed up?
> 
> Anyway, i don't see a need for this property, unless you are working
> with a PHY which breaks the RGMII standard, and has its clock
> reversed?

Please correct me if there are any errors. As described in the Intel and 
TI design guidelines, Dual Data Rate (DDR), which samples at both edges 
of the clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps 
speeds, Single Data Rate (SDR), which samples at the rising edge of the 
clock, is typically adopted.
This patch set introduces such a flag mainly for 100M/10M speeds, as 
described in the cover letter.

> 
> 	Andrew

-- 
Best Regards,
Yijie


