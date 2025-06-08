Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A14C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 20:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMqwClsGucxOnCvIC7ieB8B3Zk2MDDXeIyx8pwhbeik=; b=FOwexvjbCYZTixWJzfz8bwRIAY
	ub/8lgjWcn2+SqHZ/m0sGc/wengAEkJo/X04ovfByPo5CoUEoXoeAgdKZvlHoXlXj8HSTVpLtZLP5
	lUDLdNSCMIzhEKK5wGJ1d0VXcnxLLrUN/nTnouos0ybPDt+0EW6JsO2A/09VNPkaNkDnuz1HanWvJ
	rbhzgwBVjQDgJu/qjAQL7eFJJ6ixyCyOAu82GWNLUgup8YeBWGR+87iGK8V+kpPmTEPuZTGZYX/w4
	xSVTsifpwbU3Q/dS5wLB/RZgqz/29PbWgmwB9NfTrY8AyxfEjry6M8dmJS8cpzXEd+yTowsDl8ZQK
	FoeYuTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMO6-00000002wJz-0TxK;
	Sun, 08 Jun 2025 20:13:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOMLy-00000002wAu-1kKM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 20:10:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558JvfDA013294;
	Sun, 8 Jun 2025 20:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMqwClsGucxOnCvIC7ieB8B3Zk2MDDXeIyx8pwhbeik=; b=GJ4Sp6wmMdsUKdSu
	7XqPo69suRCI2VnCm7g6IliYhqnccb16OjIL4/cDiRS/25F6MOJ4FbOM2m8VjYpK
	crH+93b0DmUeKWbPssRaBl7g80xquR8lKr4H1UxJHHynbr/8BCsWme20mrrZLC2c
	iWgIn0QICd/exWbG+Kpf3qmds7szksYVVeZ3APJvnHwB78SjaDtuFpJZWzy6RqmJ
	2SCdjM7/gEnwxjdkPwJQw6r3OATzMk2YYw1ouw+ldSQHWl43DxJY1ly+xKWQw6vM
	YlJrvw8xqZhRg9AFpH9yUjFLgS7F9hzODjR6F6WwUI3p0w5H38akCwvjDmK5NJ9L
	h+bUSg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9m1rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 20:10:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 558KAY2n004996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 8 Jun 2025 20:10:34 GMT
Received: from [10.216.51.238] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Jun 2025
 13:10:27 -0700
Message-ID: <421aadf3-9e2d-4028-bfe2-e29d2ade8432@quicinc.com>
Date: Mon, 9 Jun 2025 01:40:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen
	<akhilpo@oss.qualcomm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
 <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BszDk49latyru2SxwMd1H6DHiNz1f0QD
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6845ee3c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=XhjLoxLiZ051MZkV3CIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BszDk49latyru2SxwMd1H6DHiNz1f0QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE2MyBTYWx0ZWRfX7gpHMqsCA/Mu
 SgkW+NQvexJf4ppn59QwKvLVTctgDptCXm1Go0AgfDSQVF90IF7qQZt7UBidbrznfHjyYjNmfea
 BC5/m9zYvXkr7oqpvn/nvX20CMYZ/AxivdZapB0eu5gdQIY6CsPL3dkXvq+KC2VMSOlradtXddu
 iEOyfA2gUvZrQyBjQ9CoNm6Y13MabNwtmoHPojmZ2gOkiRrGh7QyOxBVNPhmz0vPvkiBway6Qtg
 fg5ApBxl+phdBN0AoplyHwBzZIaSXPi8CciPYFHOK39KF4SG0yhEn9pdd9uXb9Hukyt6ECvWvG1
 x/nm6LGK6cCqi8qt+eAmO1o6d3RMt+rRwhr75e6Gm3UCZkJJc/cN0dPa/jpu8RUPrsHxKgTioOi
 K1qG/EJmzaQIuBPXDdVvgNb5OL/d+Rtv8OEjSMYN/mujHypnzbx4un5ICQIDHTPVkbycsbQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_131050_581127_65B1613C 
X-CRM114-Status: GOOD (  14.47  )
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

On 6/8/2025 1:44 AM, Dmitry Baryshkov wrote:
> On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
>> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
>> series of compute chipsets. This GPU is a smaller version of
>> X1-85 GPU with lower core count and smaller internal memories.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>>  			},
>>  		},
>>  		.preempt_record_size = 3572 * SZ_1K,
>> +	}, {
>> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
>> +		.family = ADRENO_7XX_GEN2,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
>> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
> 
> Any chance of getting these and ZAP into linux-firmware?

Yeah. Haven't got the legal clearance to publish the firmwares yet. Will
post it in a few days.

-Akhil.

> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 


