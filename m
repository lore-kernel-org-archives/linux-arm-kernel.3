Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A17CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 01:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6E22yah7RSaBBMqG2z+3SW7CvB325/vsH5zTcMNA9Q=; b=NlxUUYbXrLAuAZAIw9Db86Jcle
	P0UlPOKacVzRG9FGwAyyiQzPENExzNQf2MCKLSil2lnaSYpGZ+eJCxyq+YydDO60GVRG9APOxlnu4
	d7fpk1Uo/LmsV7WGpprD2PxFmfCIYsYGihGGF3B6VomRf+xAScEd/RM9MZrZAhJpoX3dlMfyLhQ46
	7fL2LA23/7PXAfUgw5QISPiTwm1KP9AJHzuq2fiTCMR7bF2NC0B0r/QfXUnTw1Xgk2WR/CQnqiw7y
	YVoMjnKVoW3RhDRpEgvKIbowj1CMmu7M96S7wJUY5PaZ72DmmE0ENVL/1JA4SulYju1zztc0KM1hI
	bFywZ9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqM7x-00000006h9f-0lxv;
	Mon, 25 Aug 2025 01:36:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqM54-00000006gsm-2vnu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 01:33:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONZO5a030514
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6E22yah7RSaBBMqG2z+3SW7CvB325/vsH5zTcMNA9Q=; b=W9KN47ch+CdMX9XM
	MP7DMdWXixwcEekg2jQ1kogTdnBPsM6//cCJVzKzGoXNggSXYcTIwzRTAesfC1R9
	ebmxW2ujk5pR4O5HAMUpnprbBnn9q1pk6bagr3GW/Qxe2d3imsG6gGOxzJmKrm0Z
	vXabB3r61hRyM606cAe87ZO53ewpZSptRMbNTzh8V+9ns/b2s+JrrczBJpeqtOEk
	lQUL8JAJyrR6QrCiLQOo1KJiBuYetCr73jB4Ts4M6Q9oiIt/jOsYHNBWl6xtIOnj
	nECZM3J/Y07kmbY6vrr/76knhY1MVyzL/Thf9sl5Jxfo9XsxT5hMWWxXhT4dcI2e
	UreKDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thu7rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:33:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-246164c4743so67810545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 18:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756085585; x=1756690385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6E22yah7RSaBBMqG2z+3SW7CvB325/vsH5zTcMNA9Q=;
        b=eQO/XDDpPUspvtNEKjtqb9Z6+dw/nX/biKhhptbLM7pKZdrZXdKcHwVOg/hFDyHglh
         wkNLY7tSP4Wm4HY49mrwIlfhEK+xh+K8Vp8XxnP8m2v1xLjureaaywWrxL3p9ZPBnXLK
         JhlkkNVI+p8WjcWskTbwYnRXgEqp863Ouf/wmb32X+fBR9TVaPvc9+/R31aIp7WJqarQ
         8wlvGeDNMmFzbxItWgm4xfieJJ1x2SwGd0nUPlohnMfkWN3qSOoVIkQ0i5QX2QvbnmSN
         Gs3kteU14UmngEaBFG64JFv5IpztLtBkSdfEQJwjRgN08E5bb8kg+lcGMRKc6KmIwPmY
         pUNA==
X-Forwarded-Encrypted: i=1; AJvYcCUGacgTwU5arVldaz9QK8mTEZT3XRwsevQdV2JQfiV7BVq8lCyWJt4xfdPEfiL7ifRzyVOmEFjfwgK63O6UfJuy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp1dtTf3Qw2ODlKWBhxumIjwtmwWdXqVzDNuJ4lMLCJ1QUY8OU
	QQkVeY/2j41BkWHoYdNEkmcrGgXKCkVK8FupsJviMu54079V5S9bjdXWSNLpkZXqPWLvZVakCTm
	lfYuFBEC5SGePd7Z+zYoG4zwpTUi847Y2Y/UexRkr+u583GsOT6BeKVNn2En/Zm2dmpXlrGbIvO
	Aobg==
X-Gm-Gg: ASbGncupCYz9uwYZiQMRmx47nRW1C0j9rhTfLSLSLVnSrB5/G06ZZ5AUDgDN4IS6Zdl
	ra90ctFvtufzYteeRmR8b/VPQm2cHWn4/R/V2dlhNuhfzvS4oaLPcyskCgFtpxrsBjcgcJF0xw6
	ZOh7OcXuWPNnJOk9bQmbaDi1CN3U0ZzO7co1J1m+NOfxmZUMKo41o5bDEGqrheKJdVspxrTu1cZ
	Bton382imv5CvqjZ4bXF9tsgvsaus68Gmc2Z3VhtMQV3hKqG4VVkE2suTs0W6x+Dr4pGziJzIqz
	IBDqbJrarvWMgZ5eLHiCm50iRp1EY+zltRfzwOru78b+YFRT8MAUvXw5TabNqr0Dz4+ibYQBwR3
	xg7TUdES7sNo9XZz3Es8PyyEOJ6EtiA==
X-Received: by 2002:a17:902:ecc6:b0:243:38d:b3c5 with SMTP id d9443c01a7336-2462ef1564amr146761625ad.47.1756085584626;
        Sun, 24 Aug 2025 18:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJHNnP7iSIPuTBnCfkd1kHAo6DmPEz7vDeIdsiBninAkHPKiPmI83toT+uDqJlo73Uw+Et1Q==
X-Received: by 2002:a17:902:ecc6:b0:243:38d:b3c5 with SMTP id d9443c01a7336-2462ef1564amr146761305ad.47.1756085584073;
        Sun, 24 Aug 2025 18:33:04 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b0feasm52811395ad.46.2025.08.24.18.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 18:33:03 -0700 (PDT)
Message-ID: <74038a79-8c59-496c-9a61-08dc786f9c10@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 09:32:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
 <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
 <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
 <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
 <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX6YL0DbShaS5V
 xRb8PDyTbiZi/6qZ+YNIooWB+aic9Y1bBZdLcR/oMRPf+TLA7qVqauFeSxympvGKyJc15nh/AKA
 CX6tB4XKt5iTMTZneax//ifzbWcaNIZLYSZEQBUUgLGKmA5EJyHapzTNHRb99afBcUFAAXoG3U1
 90E1UTNFSsNRKdbq7qQ/MjDOrKPZM/HNK4PfOFZ6FWIBA7bs3oy5Vh1poNNwedqseNQYUgk6sZw
 KqpXPSG3PeO5BE7/eX+xduDqwxGjsqotGBWB8QERdYq8UX5jb2s0AlCI21oPYtfh3NJWgcbFGzY
 P/b/I65txLhzGpNPNhALehqHpNq9tNAgQ2hOSmi/vOh8eZj3bx7MH7VNqmSia5UeB42Li7q+ns4
 V1kjpIVO
X-Proofpoint-ORIG-GUID: MX-H9T2Ece5zC9RfkhA70oWIDKcHWBZt
X-Proofpoint-GUID: MX-H9T2Ece5zC9RfkhA70oWIDKcHWBZt
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abbd51 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KrWnKaeQ6KOPjblB_ggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-24_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_183306_741678_57D762EB 
X-CRM114-Status: GOOD (  20.48  )
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



On 8/5/2025 6:25 PM, Jie Gan wrote:
> 
> 
> On 8/5/2025 5:53 PM, Mike Leach wrote:
>> Hi Jie,
>>
>> On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 7/28/2025 9:08 AM, Jie Gan wrote:
>>>>
>>>>
>>>> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>>>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
>>>>>> binding to utilize
>>>>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
>>>>>> shares same
>>>>>> configurations as SA8775p platform.
>>>>>
>>>>> Gentle ping.
>>>>
>>>> Gentle ping.
>>>
>>> Gentle ping.
>>> Hi Coresight maintainers,
>>>
>>> Can you please help to review the patch?
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>>>
>>>>> Hi Suzuki, Mike, James, Rob
>>>>>
>>>>> Can you plz help to review the patch from Coresight view?
>>>>>
>>>>> Thanks,
>>>>> Jie
>>>>>
>>>>>>
>>>>>> Changes in V2:
>>>>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>>>>> 2. Add Konrad's Acked-by tag for dt patch.
>>>>>> 3. Rebased on tag next-20250623.
>>>>>> 4. Missed email addresses for coresight's maintainers in V1, loop 
>>>>>> them.
>>>>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
>>>>>> jie.gan@oss.qualcomm.com/
>>>>>>
>>>>>> Jie Gan (2):
>>>>>>     dt-bindings: arm: add CTCU device for QCS8300
>>>>>>     arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>>>>
>>>>>>    .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 +++++++++++ 
>>>>>> +++++++
>>>>>>    2 files changed, 160 insertions(+), 2 deletions(-)
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
>> You need to send a new patch addressing the comments made by Krzysztof..
> 
> Hi Mike,
> 
> I just proposed an idea to add a common compatible for CTCU device, its 
> not about the patch series itself. We dropped the idea and prefer to add 
> the board specific compatible for each platform.
> 
> Thanks,
> Jie

Hi Suzuki, Mike, James

We already have the tag from dt-binding and dt maintainers. We haven't 
additional modification for this patch series. Can you please help to 
review the patch series from Coresight View?

Thanks,
Jie

> 
>>
>> Regards
>>
>> Mike
> 
> 


