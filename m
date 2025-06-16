Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03933C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FOuy9xi6e8CVz3Z7cBJ1M6xKJrOzvKMVGlmvrYdEeU=; b=ehP3W6FwLWtUr/KRXieC9s1E7z
	RePzvWXne+N3yUs8cOYlVDv/DE0dAKdJMUF2TI0yxB6gXgfHcc/Q7G0k6uCAbhsK3GAtVxo4Tix7/
	PaTick5sEzKxEe+5kz3X6Rd/46vMqULvc5uBUeChdbP8P5dXSEdCUPKhBnEyCmIFVobsVj48TkOyX
	j76ncmDFhLni/8Bvb/R9X/rpFqbAA8LjTYjJ6K7U71tIiD6D7pSiIOmt1Txx3LEAbZHgvZ6iqrENl
	eMoNARqKmczliXrzSSnXKMGZNpJjx3IgfAHYbpAauWDM5PD244Q12SEz9OnOBppdZx9k8Qw3Oic1f
	DAQFd/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBid-00000004p0O-2LYu;
	Mon, 16 Jun 2025 15:25:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9QW-00000004SQi-3qkU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 12:59:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8fgK0025415;
	Mon, 16 Jun 2025 12:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FOuy9xi6e8CVz3Z7cBJ1M6xKJrOzvKMVGlmvrYdEeU=; b=Kcw7brqQYLn2DjuK
	O8Edny2PTUAkQRPKKNONA1AgQIwhkcqu00LDrEmd9pYrBY6eiT3MtisKtzgnY+R0
	uo3SiYq2JEJUwZ3jek127PW6gIIoK+RCJq8PN4GBhJ3Yk73O+6Y8moyOFEqIuOKq
	Ts/cCIC4to+2bF+UcMcrTGtuWQGCeAYdnY8BeTRgpZLMTgLrDeYIrI3fr6wUT8FZ
	2cX8mS33X52domoS23ESqN9foZ1ZauF3s10EZn0viu1+rg9TXs5RVQRhs2XdyZyY
	rY2z7VW72qJcToTjGDMoGM9RDQsm+Y3je0Vdkv/X4PYY6oqzGrmS87kJSZLmOARh
	wf4axQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5k4kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 12:58:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GCwlTp012312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 12:58:47 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 05:58:39 -0700
Message-ID: <a01c10b7-859e-4eab-be8c-e486a97e6ad5@quicinc.com>
Date: Mon, 16 Jun 2025 18:28:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen
	<akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rob Clark" <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        "Abhinav Kumar" <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-pm@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
 <29f1de05-0e55-42b2-9bf3-894bf4f07808@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <29f1de05-0e55-42b2-9bf3-894bf4f07808@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d9KelrM7jgy1ewN4E7QXp4Oj9uuatklg
X-Proofpoint-ORIG-GUID: d9KelrM7jgy1ewN4E7QXp4Oj9uuatklg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MSBTYWx0ZWRfX5r2R4coKec99
 /S6CLLkdBtDTkpNgGa94gtgjBI1VUHgQ/FSKgy9BeC79Yqmpny1xpuL9LS9Zw+m4YhKqCrgJYh6
 pGe9JRioXp0JfbjI0WEtcCnvX/EXhCB4zUZHqUtfSYcoyQSiZKwj2DIIwo9od9m8rwWFgt5HKGo
 p3BlJOsdFyxXfCskXdpTHmsy/8IbA/ronz1PUzmAEVcCtTka6f1Jqp3tqOHjcwWdjSfp9F9+Khf
 3Hy0/VTHvF03VL2yxbhCp23bNiXKYD4dp5aqrsHTVu44fmxCY5y/v4bMMZTyj3yhYjE11vevGc3
 FOCUGmc2KkiMZPkbijd5OaFfb3uyk6GGA5NKNBpi7BNVPmd2x0uZZOjo55Qwjieyko+pcy6iiz2
 kHjo/GDsqD2uswGp5FxEVhnKLrIpw7rQ+xZ5NM77SiU9M8GBjdY21Rwe0sOftkxen/8dWaCh
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68501508 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=8rcTDYuEkznLuHMLCrUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_055904_960342_F9BCD621 
X-CRM114-Status: GOOD (  17.70  )
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

On 6/15/2025 12:12 AM, Konrad Dybcio wrote:
> On 6/12/25 11:19 PM, Akhil P Oommen wrote:
>> On 6/12/2025 5:32 PM, Jens Glathe wrote:
>>> On 6/11/25 13:15, Akhil P Oommen wrote:
>>>
>>>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>>>> version). X1-45 is a smaller version of X1-85 with lower core count and
>>>> smaller memories. From UMD perspective, this is similar to "FD735"
>>>> present in Mesa.
>>>>
>>> Hi Akhil,
>>>
>>> when loading the driver (still without firmware files) I'm getting a
>>> speedbin warning:
>>>
>>> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
>>> missing support for speed-bin: 233. Some OPPs may not be supported by
>>> hardware
>>>
>>> I've seen that there is a table for speed bins, this one is not there.
>>> Tested on a Lenovo ThinkBook 16 G7 QOY.
>>
>> Hi Jens,
>>
>> Could you please try the below patch?
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 2db748ce7df5..7748f92919b8 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
>>                         { 0,   0 },
>>                         { 294, 1 },
>>                         { 263, 2 },
>> -                       { 141, 3 },
>> +                       { 233, 3 },
>> +                       { 141, 4 },
>>                 ),
>>         }
>>  };
>>
>> With this, you should see 1107Mhz as the GPU Fmax.
> 
> I see your dt entry takes care of bins 0..=4.. this oversight worries
> me a bit - are these values above (post change) all in sync with what
> you entered into DT?

Yes. DT is accurate. And with this additional change both the driver and
DT will be consistent.

-Akhil.

> 
> I'm not saying they necessarily aren't, but I want to avoid
> inconsistencies
> 
> Konrad
> 


