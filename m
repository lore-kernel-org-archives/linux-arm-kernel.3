Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF0BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J49uDkCb9HKOce56BSBOkcrkK/RKgG1QwXA27OlhT64=; b=Z7OUV3PnF3Rmlppjqz1wsyAVUS
	ogExVhDq2FdN+KY3hrGtUQ2X6ewy5B2XpwLt8LHkpi9TFCx1aHDnH4kk02E0zpFupnswEKgYH/BSe
	8GCC0PLn/QRt9TJPa+GeY2EFa0e2ame1sXE2Osah3wq06EvqTmfC+ANTfIXNSQdWoQ5WSPShZzhh5
	N/goe9rK7wp+VTkRJsA2hM0o89J9HQDbfKCia/FDmygI+GeLQ8kjFxmRtgQV52Drv8f33PoWLM6h0
	i/9KDqC/eGIWB5gTGDMB+oEoyxDPO0/ugFq//Ln/mmrv3mYDBSXKMhdBzDlGLoaRM3Q+YRhTVCysK
	vdS1hrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDf-0000000G5dS-1Oh9;
	Wed, 14 May 2025 18:52:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGmu-0000000G1Iz-3gHm;
	Wed, 14 May 2025 18:25:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAug9i020138;
	Wed, 14 May 2025 18:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J49uDkCb9HKOce56BSBOkcrkK/RKgG1QwXA27OlhT64=; b=fXq7yA6qg3X9LptV
	4MUsBu3fv6pYXkzdpX886aCRYl7rz40evf8YpVgY4Lv3HPZynN8rrcwM1K19KOtu
	A3+a8r/+k2Bg9jex7GogUNc0U0bF0N1SPBXnlPSMJk4h46dKfCXFPneTgszGmv3U
	mGqmV22doQk8dXtRet/Zf6IbgzIb/LMQZEKNFRWrxAOO5P9t/ylV03lnVu+FUuF4
	0eChBUsGUQ/fFMFgA21WM60PePO4zI+rwkNsq05zH7nc5Gj1R4nzhIjOVGVTa51T
	PwMhfUQdXBsnqmgwZc823/yhz1VD4TdbTG771ysuEGL4ePE2ijf0HhclvskY9duw
	+dItcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnknqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 18:24:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EIOsvs026769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 18:24:54 GMT
Received: from [10.71.113.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 11:24:53 -0700
Message-ID: <5183b76b-8043-4309-b25d-e1ae505f929e@quicinc.com>
Date: Wed, 14 May 2025 11:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Vinod Koul <vkoul@kernel.org>
CC: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman> <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
 <aCRVaNDQP/PdAXPR@vaman>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <aCRVaNDQP/PdAXPR@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F8I7biqEH_-DftRpl4rk57BfXlJJqFGt
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824dff8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=_9SOoMVj05wlhOc5M30A:9 a=QEXdDO2ut3YA:10 a=aM5GUTHLM7wA:10
 a=AkvdQnL7tdoA:10
X-Proofpoint-GUID: F8I7biqEH_-DftRpl4rk57BfXlJJqFGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE2NyBTYWx0ZWRfX4isQh/phoKL7
 gNDYG3ctyr8fuuqzZFPj6IggNXhjWBDL5ogCgcNsGwC5wuF+88+7gNzdLw6ayLccV+mT3DjgQls
 q5FJwXv5IjmwnnKB+bjItELeLBl3E0HuA8FM5mv4PzZH8goauI610a46plxlu2bVGmgmBmC1xY3
 BBLUhgfJOrB0pmILepR+8HMOwaJ5eVBHslVs0Lq9ouIg+blN+QljpxL4Q3WslkpHD4/TM4JQmgp
 mNlbsbLaYxiLV+PRn9OxC1hPkXfHJn8v1QOCSNM1FeCBd6SkrA9fZJ8eZLb7y6uud8boMHxBt3I
 NgbWnscTxcheU1x99B9dCiesQF/QaCRpgU+jVh5hwd7sldVgBkKUlYAnh9u/UWJ9oVFsE+80asp
 3Ko7aMXimriZxwIetQjAUS2CM4ZpVb31IK0YKwgNdGFb9SCDTnD7asGXB9wjpl2oemknpOhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_112505_047368_E0F0A97F 
X-CRM114-Status: GOOD (  14.58  )
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

Hi Vinod,

On 5/14/2025 1:33 AM, Vinod Koul wrote:
> On 16-04-25, 15:45, Wesley Cheng wrote:
>> Hi Vinod,
>>
>> On 4/10/2025 4:53 AM, Vinod Koul wrote:
>>> On 09-04-25, 10:48, Melody Olvera wrote:
>>>
>>>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>>>> +					const u32 mask, u32 val)
>>>> +{
>>>> +	u32 write_val;
>>>> +	u32 tmp;
>>>> +
>>>> +	tmp = readl_relaxed(base + offset);
>>>> +	tmp &= ~mask;
>>>> +	write_val = tmp | val;
>>>> +
>>>> +	writel_relaxed(write_val, base + offset);
>>>> +
>>>> +	tmp = readl_relaxed(base + offset);
>>>
>>> Why are you using _relaxed version here?
>>>
>>
>> No particular reason.  I think someone pointed this out previously, and I
>> was open to use the non-relaxed variants, but I assume using the relaxed vs
>> non-relaxed apis comes down to preference in this case.
> 
> Nope you cant! There _needs_ to be a specific reasons!
> When you are doing read, modify, write, it is very important to know the
> right version to use...
> 

I mean, its a write readback, which ensures the bus transaction is complete
based on [1], hence why **in this situation** it is up to preference.

Otherwise, w/o the readback then we'd need to ensure writes are made
depending on the required sequencing (in spots where the sequence is
strictly defined), and that can be enforced using barriers.  If you feel
like using the non-relaxed variant is preferred let me know.  I can replace
it and remove the readback.

Thanks
Wesley Cheng

[1] - https://www.kernel.org/doc/html/latest/driver-api/io_ordering.html

