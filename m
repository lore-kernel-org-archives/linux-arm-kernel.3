Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DD9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0bR843H3VQ7Rmm291IX960YQ4KDT/hV5fiNWuqDkfs=; b=Mfw642QzQZnLyt9TZsTL6SMUxg
	i/5RIjXLivg8cv+loQ9QLrG+anot+/KDpnQGaWA32YNpHsxXka1/EyBvw1JNKoI1HrYyxPVWvED0E
	brHIsW5m5nZV+FductfxDI/Lu6IocgsFVM43VBqUKmJyCh2omzW5dbcOCADc0FBVgCBT+u54EqqQj
	u/lbLE94LTxMfdzKinywmny2bnkLK6JvFjdqGU1sX9V55GIYCb3ERhJ9SZ03AEDS95JIUOmRM2Vs7
	lpUTECIkeZJj7nHf9nvJGPbD972cepQ2y+22DcHfgUG4+V0Keedy2vB7QTqxcdZc47V7hczqywhZx
	RTWESQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTlU-0000000868h-3a8f;
	Wed, 08 Jan 2025 10:58:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTXj-000000082Q3-34B0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:44:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ad3J9000895;
	Wed, 8 Jan 2025 10:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0bR843H3VQ7Rmm291IX960YQ4KDT/hV5fiNWuqDkfs=; b=FUm4GvmIFJtE7uN4
	pe5WfcCd295p3sLHxmmypVxNEY8cKkDEjdtFW9pjUpKCkyxETjtJ0VCGbUW+pMqk
	5vg8GGI9yKo9Z6qepS2XTPaTTjK2xUA+/xe6lB4oQcU5FOjkXHBw02sxXRpP9wVg
	KGPPvrS9ahDo3Uh0NxEnoidBogta5NeEZb84/2DVLnmCzhtnjxfJzkaCNglIRdSI
	8c3J0YIYuWHdgVZCBv3NfChIiwRD7Bz/5rmFT2aDYf0zbgTSIGxmz0FU3bFpWms3
	P/13L6NQAIP7mHxdasPx7vsX26be3yhOb0TYZdzUojisLRnJ5jUa5A2B1q1kkoBI
	BQKmaA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ms8rgkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:43:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508AhwR3028602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 10:43:58 GMT
Received: from [10.253.35.161] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 02:43:52 -0800
Message-ID: <b035db82-7203-4e30-8457-caa4fa1b4e97@quicinc.com>
Date: Wed, 8 Jan 2025 18:43:49 +0800
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
 <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
 <59590ff5-676a-4cd6-a951-96f66972aad4@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <59590ff5-676a-4cd6-a951-96f66972aad4@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x_CwTAya_QyRJEXsvvGJOqX8bkJFVQPs
X-Proofpoint-GUID: x_CwTAya_QyRJEXsvvGJOqX8bkJFVQPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=720 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_024407_779119_431CB169 
X-CRM114-Status: GOOD (  20.11  )
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



On 2024-12-27 01:14, Andrew Lunn wrote:
> On Thu, Dec 26, 2024 at 11:06:48AM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-12-26 01:49, Andrew Lunn wrote:
>>> On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
>>>> The Ethernet MAC requires precise sampling times at Rx, but signals on the
>>>> Rx side after transmission on the board may vary due to different hardware
>>>> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
>>>> occasion between the rising edge and falling edge of the clock to meet the
>>>> sampling requirements.
>>>
>>> The RGMII specification says that RD[3:0] pins are sampled on the
>>> rising edge for bits 3:0 and falling edge for bits 7:4.
>>>
>>> Given this is part of the standard, why would you want to do anything
>>> else?
>>>
>>> Is this maybe another symptom of having the RGMII delays messed up?
>>>
>>> Anyway, i don't see a need for this property, unless you are working
>>> with a PHY which breaks the RGMII standard, and has its clock
>>> reversed?
>>
>> Please correct me if there are any errors. As described in the Intel and TI
>> design guidelines, Dual Data Rate (DDR), which samples at both edges of the
>> clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps speeds,
>> Single Data Rate (SDR), which samples at the rising edge of the clock, is
>> typically adopted.
> 
> If it is typically adopted, why do you need to support falling edge?
> Because we can is not a good reason. Do you have a board with a PHY
> which requires falling edge for some reason?

It's an RX-side feature and is unrelated to the PHY. As I mentioned in 
another email, it's designed to introduce a half-clock cycle delay for 
correct sampling in the IO Macro.

> 
> 	Andrew
> 

-- 
Best Regards,
Yijie


