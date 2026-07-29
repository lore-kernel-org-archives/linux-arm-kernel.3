Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD8C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=; b=mJyCDRr0GWrmbAr/MsB+QRA3m0
	GI6iQTfoxl3N7qjXQicivmFHvQOUb2dSiTiIsfJWPs+aF7i3DqzWQZN39BLUE5ijimxLy0tIMLDay
	2f6u5Vc7SzJrp1TAFQip8UZgEq93zJNwzJkrXMmgRy+TZmTZpLfV7KNBoYugpgLfb61rflWLu6IAe
	OHGdRFy/KyRAAVYF0jmfMvmT5TUjejGyZ3YU/1VnMrSbxmB0y1x8ozKy2Hjd6/6pyX4vmY8J8V+J/
	Oa1dPRnlfwxpDddcK453e0vsWmzCxf7F2zab132LRqUGbx+GUn/WATFOCaimPUtAaWYqZkbCsy4eD
	e6/339AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp50K-00000008DSH-2yLa;
	Wed, 29 Jul 2026 14:11:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp50H-00000008DQg-13jS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:11:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD822c1691941
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=; b=h6nm73XbwpLX9H6R
	zyvd4CXHZRTjWPq6bWYo8kmc82tiDy9Iql5U4QHlajWUr3A7XYeq9J9/e0tKqzMS
	WOsGzvOPWilUeXFF08v5jjfFEzd9ooLV8zW0HM0jckGYvewtS/HT8r4KeH6dwuG5
	ydBbM/QoMdjXBy6ZvUb0YEkl1f6+iKher/1Lj+BUyOK7hh4OrZRjbXC0u5INAA7O
	6JgMSvNZuXtnyGyRnd2dcwxiHlDfDkpeqsX2+A1vK11jXlz6lDPhBq2MMc7GHSa2
	PMGZSVn+E1TdK1laSA8zj7uiqj4B6qEaUa5YcGY5h8fZ2LLyLUqUaF05+AxaU2S7
	axA+Yw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy90kx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 14:11:24 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f3c871fd7so37513007b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785334283; x=1785939083; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=;
        b=TTg0bt+S2PM8pb9Il0GQkIaHrFevl67BWv30lMFntcL393Q27zEIYd8k3aPVFugwnS
         14xjmNGfEWpMQChmOtjYjV0VNvqExOWj22VVAJYfwc8GtNh3Yxgqlzb7eUZOOcXlYRNs
         uqSCFHaGHv62s7p5EWkBDFdpqhvfyvxgOGbmjPZLA5A/3Sl1lrTuzuKhH4gueYjOfjPh
         uXF3Gkn1eOVZ6zvSFa/8Nvaqpa/cU+9DEZ7Tdep95BExUV7UrqKRyRcjQM4K6e96/FLs
         2seXRmfnIyLUs4m98y8aLAbi1lmQxalV62BWLagKhy+CI7lBnMt/QeUwOWo9W2KGrc8m
         yRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334283; x=1785939083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7+OTVTEZUP1wM0Ujf/KEVFMFUrvZ/Yv2lNz8KnLtck=;
        b=fKExteOIYHuZ/K0+sshHidj6JTJneT0K5CLGL44I//xVLiNyMMTEsRjhuQnUl3LPr0
         vs0tCVwJL9J9zHUuS22CY/1YqyPUAWxDXhi/Flz9sas6fiX7CbYRUFXu4G8DdBUfIVci
         5biSkY0eTUj/ox0bc48uM4oAcN3KL+D/C/kYmikqOW4bEX758Ry3lC1rfS+M/h22biqK
         l0CAkZu5+na6JgjjYt4DxZvEHdpqmRmYFLtnRxU+OvI8HVsdwKTSe7wkYXtbjQpr9biL
         NDZ9JUdQ5gzK6nMfS7+j8+5VCVfj+v0bLC0FKJQIavP779uC+BKZotF7VFN/Fm/3Gts/
         HYlw==
X-Forwarded-Encrypted: i=1; AHgh+RrQ5rrXzud//hD31WA5DEHitY48RRUaZrMuHsD8VdZV8YvRLiMK7pYz21qa1dT1aMvmtIe0rc+zdWam6pQeLMeD@lists.infradead.org
X-Gm-Message-State: AOJu0YyqU66Oz+a7RfgNeSRS7O8D0lFx/Zpo6clzRO1j1CMgc4E2nnnn
	pjiQi9+1+4Jf5OL48vRMZf0Umrj9API1udf8/xhA4mFyFVtQeX9YJ3ccGhsNeZQ7bd+6U+qmy3Y
	TwA4TNXPubkxI8eBoe9Fa/ydsnppfFUv6ZRR777tXkMlfBc+QjEpHJ3ba6AoVENdzx7GX+f5TXt
	TPLA==
X-Gm-Gg: AR+sD127DYZwGiSjWgLqS9U+UAhux1GyYSrkbpE7YYUSkXlDH3HgQFIg8JhzU/2FfX0
	mN6KYblaRJQysumn7eCDYWMJDDGvCvzOwG7VgU3EdCTF/2AalJ7qyg2qPrUou40pEhuINNOBxHT
	CWdAyJ2TRhny7oN3SGAgffPRbzng73KWEVKziVK75H5QvawpdA2goAPyBqVSqDvQT2M4YtADBx5
	N8ClAzblorCicH0QgEQKeg5cAXaDUMYOywMFo/i3y9i7LwVWltOcT5//vO3J4rCsKCw2IxQXRoS
	17ymblzBYWjeXFohJVaO8YBPNbflcxxLVMopRysxigLvEcvkKXK4vqDmlk7tCtYNuGnWl9bUweX
	/IgGNSq0b8P2QVB2li+HFac1TtkL7bZcG0E50anqph3o+J5GH845mw78mLyP4yocr
X-Received: by 2002:a05:690c:4b01:b0:80d:c24f:b790 with SMTP id 00721157ae682-81f991fab62mr37843207b3.5.1785334283176;
        Wed, 29 Jul 2026 07:11:23 -0700 (PDT)
X-Received: by 2002:a05:690c:4b01:b0:80d:c24f:b790 with SMTP id 00721157ae682-81f991fab62mr37842977b3.5.1785334282588;
        Wed, 29 Jul 2026 07:11:22 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:bc31:6b08:4ac6:465d? ([2a01:cde0:108:24ed:bc31:6b08:4ac6:465d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa25ed2bbsm18607147b3.0.2026.07.29.07.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 07:11:21 -0700 (PDT)
Message-ID: <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfX9ZM2jZdQWCxu
 mOUqat+Ylr7/Ih0e7rI9xFvtRuwzUmBANzk/vIJ1WOMsdYT2tuCBLq6oxkevLaJh6DOG0LjOw9+
 veYV7wWTzhdDQX5VBrM5A1Ybg5ZBscE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExNiBTYWx0ZWRfXxUI+gjdmch21
 T2L19SQ6EUgEjkyIKllnpe9leb8jqCq0K7PCLLfT6Indi35ku8irWZaFreF3LSLHQ9k3XVCxyds
 qfrWKk1TkI6pqJ622DtkPLTIywZh5BNqjAXMviR8D7hS1MokcGhFlanE0V0nfQSVxHVft01I1XM
 MgoKODPg15L5Reo+mQo/s2HaGcusyV3qRHgAu5MWG6QdewIX8d8buSlOn18Ty39OujcJb5eC3SZ
 vjm20ahAESS2WC0FedxsL0Ubft2qYgs1YAliBF7TlJe7XRtBDbly3ycPjtKC2ce7FnbqOiK0TgQ
 vmRmEGXPS22S+p6bJXlpoc4ONsBSzHD/CToMxzhscvhDCas+p2giwPmnVQsXZLPeXJRwMeW+oXP
 FmypinW6cllDubiEOMvL/snTMD4HMvtziib1WBY85Qztrq3V7h0DlSCERP8FDqp1g4486SEayPD
 3R4eP35E83wE94dZxYw==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a0a0c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=dr1Y8-9SNSHxNSfogBUA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: qeZWZEFMhCxIlRqG0f3UKLvTWE8VxuS3
X-Proofpoint-ORIG-GUID: qeZWZEFMhCxIlRqG0f3UKLvTWE8VxuS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071125_296659_3C8EE510 
X-CRM114-Status: GOOD (  13.83  )
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


Hi Cristian,

On 6/9/26 11:01, Sudeep Holla wrote:
> On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:

[ ... ]

>> Thoughts ? Plans ?
>>
> 
> Just repost as non-rfc after next merge window and we will see if there is
> much interest to get it merged for the following one and take it from there.

Are you planning to resend the series ? I can test them on my laptop



