Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF3CF854A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNaP7Q607cOb5siBQiPOtij0E1NZqriqXz41/3/+zaY=; b=cu0KbL6xVtw+LsYbZJvvqNRx6G
	z0Uz3eMSvgpKe92xzUyvhcDBpqZCPD6yYYnIr8uvw6T/GFw8cRMtbG8JSYVq4HFb5AyE8O4Blla0v
	mnBWf0/YrDHwpppZphhC1jMgBz4sn/BQ3/cq2IE2BRkyMe2lx9ujj1+AGT+ptoB4J5wZacpegPCz0
	kYLld61mWka45nMdXG/jA7jAaP76A+WMgnMpsZH7Ugmj0tGyKrCxAWHhbAIOuj4secGoQfFKi+Bv5
	0Q9OnE17ggLI5W46zX3q5PG2tH3cGH8mM3qj5F5hBYG0JXtc2pb96T+0x+cOuu6SgmXP0XZSOVxq5
	KLUL308A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLypQ-00000006HF6-1AYi;
	Thu, 20 Nov 2025 07:11:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLypO-00000006HEP-0z8b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 07:11:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK50FQ24104949;
	Thu, 20 Nov 2025 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNaP7Q607cOb5siBQiPOtij0E1NZqriqXz41/3/+zaY=; b=XLFUhixT9zXAcK5o
	5Z2MS9Xqa99cgm6RYzIt058QfZUsSWw6ti311uFB0JRSejf6tHz+GauARdZUWzXa
	W9BuCecuWEudNJil9Tguj3EyyhwnHrthz6pjBaU/RNv86Azh1hWppI9TAtm1bdDp
	14/PVNnbZpK0FH5dvZAG0GTeMZf5FBbdpNqvxKJc+3oMnLcjcG1FVjWhGRw24r4o
	4eW4SPTf59ONB9KrkRjilciyMToo/fe6rdIYCGMmhFXsjd4ON5VG40cdeEB4yvPG
	IHDatZVrwZtYByEGGv6jMa1mn9wzs0xNAwb/R7Dp/dSFcxk1en1+Bou0XUnjefs6
	HGtZ4g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver0b06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:11:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK7BMg2028326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:11:22 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 23:11:14 -0800
Message-ID: <e6e081b5-4a7a-425f-af24-98e93cd1a60a@quicinc.com>
Date: Thu, 20 Nov 2025 12:41:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dp: Update msm_dp_controller IDs for sa8775p
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marijn.suijten@somainline.org>, <swboyd@chromium.org>,
        <mripard@kernel.org>, <abel.vesa@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
        <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
        <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_riteshk@quicinc.com>, <quic_amitsi@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-2-quic_mkuntuma@quicinc.com>
 <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <c4o6bcvl7cgmvklvnwj7togokawvaiqmiye3sgdlugwftz45bh@g7vfktowo5hj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691ebf1b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=xgBnMW_o2ljmifkhbjUA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KZGMStxDDC_AK_i7TTseNbxFFiy92cxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MCBTYWx0ZWRfX3WeHMYDE2USM
 EJN2ixcz2qWLs4gMqd3DQHMSkOMr3rzhtrJrdhzJlpxQiOdGlwG/a1HUrSM325UCVRVbVTv5jsa
 YT9At5LyJjR5uZLhr2kh6mKDJrss3tDQZCvaa/z8qUY9Ob2MnZTC+ju2PzaEE91dlcCKkGFSbNe
 3PXuqhyk8FJebRLXYAtY/HsdHExDbJhZi2Cl+MUxwUtRfedd4bHlfztzoXdYdDyfXaU9vVjEDeQ
 eI5SyydXRS0g9rbxsI6P5HZC8Y+yKwk1ecJo5c1Uvgfa01N7oEOF8lRHKFuA7xeRjvkdNiGQioZ
 Q0SttKOIcUtCevHKwEbraaNDED6NY0IOHlZlvL8g4u1bi82RY0AKl1vZq/6AnspF1D7cfcSx3Ep
 Zey+KvkrE24oUirt20iRw5FzRn9/kA==
X-Proofpoint-GUID: KZGMStxDDC_AK_i7TTseNbxFFiy92cxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_231138_394894_01313BA1 
X-CRM114-Status: GOOD (  11.53  )
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



On 9/26/2025 7:21 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:53PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
>> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Missing Fixes tag.
> 

Sure.


