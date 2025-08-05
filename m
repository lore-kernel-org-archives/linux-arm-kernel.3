Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ECBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iReZqZKlVGY8y7fQQol3sCZdRqJvzzuk3L/8zG3n1M=; b=tkLEaHACOr9J3hBNgBXwDAqCvA
	NlDFvC6Ytg7bIgKOEltWxbTcAhJMmrSFW5qIjTOYjyUPF3152rmbA+lzTT+LYsTEfeHg8z1mxhc9C
	QWZVSAgGSAk/RBFoB4YU/cTZjR0+Bmh3CFIWFMmiBijF8Z7olK+GDlJOohs4BpbM8vIeYgmVEM6Kf
	Nd9nKmyrWfmGZNjbGAv9wCtqZDYjYCch/HGmdP4JOp50CwHqeS0VWmsQCBCGrEoqLqbB9Thl3vlLe
	Or6SLzsyyTX0iAAdhyXAsGtywzKPt2jTyb+rmcoTNqP6xOMHEPQfNJL4rbV6uf4cKX+00WJmStRqG
	sjuUTC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujF9l-0000000CWOK-1Ibx;
	Tue, 05 Aug 2025 10:44:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujErt-0000000CUDO-15RM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 10:26:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5759w1f3016967
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 Aug 2025 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iReZqZKlVGY8y7fQQol3sCZdRqJvzzuk3L/8zG3n1M=; b=HH5EKlCuPgatJRIU
	5Zibas1QYow0eYSJ0f7wOnVI2bp9iHdaVM3aSCbzqDFhbFsbupdo+0ow3yPvMCEL
	tIu4FqxhSMbgP3A1KbUMJIXf2R4zHpN9YAif0QsM2sxMKYUDIETPSyiiazoVRrMG
	o7ZzbL6o6Z6B7PZg7l7TklKCZza8iCjlCYDtO5bhnPSBQsXMUzYsHzS7DpnzUfM6
	iNEx2MQ2SspfYn3lcph5Aw7T6Qko90TfocMgo+geoLRThyHm8Y5vrmCKG6tR1W7q
	ymeMHVRAeF1xTEgcP9OBNl/lSdeJHAKYbBDv+16YmuqYmtwcsZUFIjevYN5qMra+
	/E0pHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv4che-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 10:26:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76be7fe3d65so6624681b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 03:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754389563; x=1754994363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iReZqZKlVGY8y7fQQol3sCZdRqJvzzuk3L/8zG3n1M=;
        b=gwBcMFNC4S+ZWjouh8naOfCV1BgNkqfyXXsclliaG40Xa3/s+Ns6QMpxsI3QYWsUD/
         Zdotc5zIAAmF4Lzl1J9DMEUxcwg+YNtX+ywKOvKWTTaUem6uho0S4eNdEhCXilLgDD43
         /prAYY2Tda9KDiAmqq2/sVtGZk9TrIKKDDYSsUbcf2y8nWV6forFP81AOH0C4UJsCpfL
         XcaXly7sE6C7EXP2VHM4NqRzc8sFMz5lycdXZJSwlStgmec+yuse7p60pkFR6tSzVF8I
         MW8GC8KnzNadyREzsaEDd1bqVyVpydPzPnF38VoKCH6Wv2irWvjZ3u3pU9iwdPz63CE9
         KDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/g90b4j9fnhhe6acLzqhtU2XlYmZL7kj6yZpOENopNpn0XoSS7a2MpiBKayud4KIiy6fUqTpx0z17hfSrK49D@lists.infradead.org
X-Gm-Message-State: AOJu0YwN/RjsNSVFGCfolMv40XamiXy5OGn5nW2VEhxIe6QGxLSJXzT7
	G7HNQj3PRuyIIz6nCAB0HkkidQ9UuqSNBeGaLbX4Qasavl0ic00P+W5GZ3BH7fuVj3SOOxPH+fS
	CWSyzakXvny/ECJBFf4cuz9jkKek3Ez6PqBccOAUceBSQJay6cPa8Pbl6Ydlyt4f26awMBzyk+j
	mzAg==
X-Gm-Gg: ASbGncuqwmEK7cLgvGJ64xDKAKxN/0K3hLaiRpUOY0XkShEuRb0Ya5eqa5BuMk+55jF
	5nW8WTNgRPXyNc1cpP5rwr0tl0RIyaFbmjXmLqWbCCm0qDp3jvZqZ3OKFJVOKGZ/es53cNKNzR/
	m5fADsckSUl9U61qaNEGQIvdAqjTT7pCtYYDHIyHmyRwtMbDqs70pKX4CZ4/IlDupR6CPtkAwfX
	zijrxM5Llf5CIiaMkZnzNlUn+YheObZwOTnTZ0CN3P+7oz1HZA2ubcbJZfMpvV8HvnJ7rn2MYSe
	/geUyw21XaFgS7/WWHHjdrZE6HaDm8RA8ozzuNKamdxl8/+e4sqQouIXRbw2aEtIng2rRPh2P7N
	yrkILBAoCcl1pVjawi2VldsjO
X-Received: by 2002:a05:6a00:2388:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-76bec303a23mr13892091b3a.1.1754389563410;
        Tue, 05 Aug 2025 03:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESg1QFvv8hqMydjVjeIPEnGudPbS1WSJiVGghbXmiPTDC16eHCWIdklQfsaZxXv+e/uQi36Q==
X-Received: by 2002:a05:6a00:2388:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-76bec303a23mr13892069b3a.1.1754389562974;
        Tue, 05 Aug 2025 03:26:02 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcfa0sm12547422b3a.75.2025.08.05.03.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 03:26:02 -0700 (PDT)
Message-ID: <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 18:25:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A71VUGJ6Dim2pZ6X8N5BbyGVKOzZB0ao
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891dc3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f8PP91cPUXlTVnoGj10A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: A71VUGJ6Dim2pZ6X8N5BbyGVKOzZB0ao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3NCBTYWx0ZWRfX2IN90ZMVnKGO
 bgI/9rZVZM5D6SkDQLgeKs8HgIKKnN8hIxcT7MASjjqEAHyPIQrf9ihZ0siOYdi55n/GSFGoR67
 z9P3S9hQlrzuP/Sm4/PylmGK0wsK8LEvCe/BInTr7nnC/CBlOA2wJrf/h2pmI+BUHnDHVEV+927
 EBvpLergO9Kj4NgGnn7GVCyRRafAkQ602GJFTnG5SPASpVVTzMx0I3rowX7rfZbfrugnJ/nJcIB
 f/Sf1+GnVnA6ZXMaSfq8c5raw29WC7Te7CXLrr1SnwzL3bxEAClhbkK8PXdj+0EEzPN8KeYsmIn
 xOg4hd7q0R2EXCz7Qve1Xfo4lylWdlvATpuKY1TfKIpbFEJAY5O+x2eAKa/oJ4nfntIq/McZVMt
 EZcWx0agIRk3yLNEKO5DLrIYO/dCVss9SdZKvYNDm2glsZPq3GJ1+STNWjqyiY0o28s6XOhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_032605_316154_2130CFC6 
X-CRM114-Status: GOOD (  19.84  )
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



On 8/5/2025 5:53 PM, Mike Leach wrote:
> Hi Jie,
> 
> On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 7/28/2025 9:08 AM, Jie Gan wrote:
>>>
>>>
>>> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>>>
>>>>
>>>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
>>>>> binding to utilize
>>>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
>>>>> shares same
>>>>> configurations as SA8775p platform.
>>>>
>>>> Gentle ping.
>>>
>>> Gentle ping.
>>
>> Gentle ping.
>> Hi Coresight maintainers,
>>
>> Can you please help to review the patch?
>>
>> Thanks,
>> Jie
>>
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>> Hi Suzuki, Mike, James, Rob
>>>>
>>>> Can you plz help to review the patch from Coresight view?
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>>>
>>>>> Changes in V2:
>>>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>>>> 2. Add Konrad's Acked-by tag for dt patch.
>>>>> 3. Rebased on tag next-20250623.
>>>>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>>>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
>>>>> jie.gan@oss.qualcomm.com/
>>>>>
>>>>> Jie Gan (2):
>>>>>     dt-bindings: arm: add CTCU device for QCS8300
>>>>>     arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>>>
>>>>>    .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>>>>    2 files changed, 160 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>>
>>>
>>
> 
> You need to send a new patch addressing the comments made by Krzysztof..

Hi Mike,

I just proposed an idea to add a common compatible for CTCU device, its 
not about the patch series itself. We dropped the idea and prefer to add 
the board specific compatible for each platform.

Thanks,
Jie

> 
> Regards
> 
> Mike


