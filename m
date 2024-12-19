Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2320E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElJue1zWoHt8nvSVMkVrxY1iYyqdjrXkc7YVyvs0eBk=; b=mIlzk5go7ZPJAi24rR416hVzSn
	a0hnChjmqwXv2BbS/y0MU2vRtSp0uXvSlPsjCk2DvhaZT6G2Nf23VpE0GVv9psY47+BWZ8EKwRoZA
	DRyiBpaxVV5N1KavamD61wCEV6xd3KtSJZDCnmPjn6TlQDvlJtteg4ZtEMokBmny9H+QjU0wWFJnT
	7kGNYIA3DwmGY3z3wBUPe4TSIjTN3lDTSbgTdfjkXJMmfQp5sJXiI1+X4oTKLS2RB+xfqnSQb5eno
	et9+bF/f0EVOyWh3qrbYmQFr/jpETOjxByVwfz1sWf0jjAxkdqIWVtXOXU3NT8nbZPrTMRF0loAoq
	Cbrqz+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMRs-00000002szd-2X83;
	Thu, 19 Dec 2024 19:44:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMQm-00000002soY-1gFc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:43:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJG4SUI028704
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ElJue1zWoHt8nvSVMkVrxY1iYyqdjrXkc7YVyvs0eBk=; b=MctMW8Pu9DM5w+K2
	lHE5rbJPnrfiksdV6jwOUdUVKT67Y/y2iHWO9hrhgAh+IwwVcGa2cigK6N3nkLc5
	21yEvJO4MHGoBwNAIf1HHbgqRY9HCFAJxN0U25tnkG9SyBFs2vUBV5I64tck35OO
	y5hVnpOPubVWh+Qxc9EYyMNSOz2H+7oEuLCk8faFZXM3PV+H2BKr0ZNoFQGz4LHm
	DFuTQENuV+dGb6tb+AQlbvOIl5ip5lgAoCLr9uQdJbDCX0n0YpUYWnkHtUNN0ds4
	Iwei5vOmLdVjgXNLkZRQIArg1W8/27pYDoJcsbycnl2Cu2OYfhY+8SrJ0zcdQsHi
	AU+mxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjtes8pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:43:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679af4d6b7so2893561cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734637410; x=1735242210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElJue1zWoHt8nvSVMkVrxY1iYyqdjrXkc7YVyvs0eBk=;
        b=Gkuv2dlXFrabSQMA3u2llVI3JGOlUVCmNUY2lJM8YKwrtmY0iCjngR7tH3CJY67SLK
         CBE8BOlEOl47SVdGs9SXiCi817ENZooZVqGSBlSng/LcHv6hPBeewZL3zd45gEBYyXc6
         EcNqJQUm1leyZ48dGG9m1S9MDlE8A74ChQA2t/I1sUN5c6mKLP/MzR5+555GLaPnzGqC
         mkyGUD9VPWd9mCDB+vUHPE28eIYUp1WlHJVqGotIHrfmllmayKu8tZNrwJy87kWZxoIu
         qBSmAzdOzKiy8lqKj+Rdw8Gj65rHoc1kfI27xw9eXWxiJCiHlb+YvIeP3JP2KvvkZjrA
         fGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUPWiKasRquNA7D80vO70rAiauFeF3x5PK4qyCDrw+q014TdkM6QOqQUZvJ5khrPa6rUIn2ZKh0Ol0UaTmMg4sM@lists.infradead.org
X-Gm-Message-State: AOJu0YzCPRnBJOsZEDMAxC47GhPlcP2YiOkxHIiskspX9chW0yiknc5v
	REbPQe7dVW7K6IUl7uNeIQU9VWhjaAPNQxhpwEx0dFHPbb/QWvlUloBsIbR9oKsy+KPLZtcUbmk
	uwsZydGo3ng6iQGO7YZSjZeN2kLuK61M1qJAH6SBZ3Q8C20uOyoeL3RfQpCqeO6ZwV/5QRaWCqw
	==
X-Gm-Gg: ASbGncvV91c4rM2d97LR1/1yFJGJlfm/n5mPhWHJHxlimJ6rsVxvvKv4WCWEW2guJVN
	QhqVgXI5bUQUyxdOY19Ec6CqZRtdUKmJm5+b1aJW7Iea8Y05m2lYo5mxuIN09fysg+MviRjqoI8
	UFddeap9BLD2HzL342z+AwZKtG4NtDvAe+33eQR8mPVH6iDjKix/7oEtfIMEnK07qlRNRZkLYYG
	dSadsK2eCqLMCXwyZ2vUegFGtP+/573cd6Ac27Ij2S3MJXuZtCTS5h0FRigmKrWx3WPGDFxpTYY
	BHxByjkBqTW6z1tXj692FsFmh2GhIVpjK0U=
X-Received: by 2002:a05:622a:50c:b0:466:88ba:2026 with SMTP id d75a77b69052e-46a4a9a2935mr1263071cf.14.1734637410407;
        Thu, 19 Dec 2024 11:43:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYEQOUAGpGrD/DrXfHSKEFTHgWGm4MANMh46wcOGUyVfn8+5OpwPjGOLaylBbzOx+Atxj8bQ==
X-Received: by 2002:a05:622a:50c:b0:466:88ba:2026 with SMTP id d75a77b69052e-46a4a9a2935mr1262891cf.14.1734637410004;
        Thu, 19 Dec 2024 11:43:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830af1sm96997466b.14.2024.12.19.11.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:43:29 -0800 (PST)
Message-ID: <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <Z1LQOmEfFy640PjG@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z1LQOmEfFy640PjG@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K4YsXGrJsnWmu8ikzha1LXzdQj8tYPpv
X-Proofpoint-ORIG-GUID: K4YsXGrJsnWmu8ikzha1LXzdQj8tYPpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114332_561778_52EE402F 
X-CRM114-Status: GOOD (  24.70  )
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

On 6.12.2024 11:21 AM, Sudeep Holla wrote:
> On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Certain firmware implementations (such as the ones found on Qualcomm
>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
>> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
>> optional PSCI_SYSTEM_SUSPEND.
>>
> 
> If so, can you elaborate why s2idle doesn't work as an alternative to what
> you are hacking up here.

Please see other branches of this thread

> 
>> This really doesn't work well with the model where we associate all
>> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
>> CPU_SUSPEND suspend parameter value that is to be treated just like
>> SYSTEM_SUSPEND from the OS's point of view.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
>> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
>> --- a/Documentation/devicetree/bindings/arm/psci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
>> @@ -98,6 +98,12 @@ properties:
>>        [1] Kernel documentation - ARM idle states bindings
>>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>>  
>> +  arm,psci-s2ram-param:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      power_state parameter denoting the S2RAM/S3-like system suspend state
> 
> Yet another NACK as this corresponds to PSCI SYSTEM_SUSPEND and as per
> specification it takes no such parameter. This is just misleading.
> 

Yeah PSCI_SYSTEM_SUSPEND takes care of this on platforms that expose it.

DEN0022F.b Section 6.5. recommends that CPU_SUSPEND StateID includes
a field for system-level power down states. This binding change only
adds a way for DT-based platforms to associate such state with S2RAM
suspend.

That may be a bit Linux-specific whereas bindings are supposed to be
OS-agnostic, but since we effectively want one PSCI state for deep
suspend regardless of the OS, I would think this kind of hint is fine.

Konrad 


