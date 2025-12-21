Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077D1E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=; b=gMhc18mpUU2hxHYScVAWcjiOSM
	Bd7kqUtdbFBcTjSPS2Vtzza1n7GNF4gF3Lmh7IJrZRCF/WOa7VFSQnwMD4G97hgLAqves6a5JNSe2
	e5FOyW8QSHIV8jY74+42DMurhWU0VQ96iMBlfQ4w86QSQ2EvdQmV8KGn/u1Jgiz7Woh+Q0wPlyvZH
	b/Y7hNn7VZeBo8Nq8rO4E4GLu00HSK/JkOJV7A6L5zuHchJmw4pn9GO5/er1lZiWMdTT6RFc1+6Nv
	RY7bWeWQ3vmmZM14EB8F3T+HWrabmq487tmRgWcJdXUSc8PMchVSrpm/LFJE5kGjfAoHy9YDoKYnv
	NL3qK5JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXK4E-0000000CUsp-1NS8;
	Sun, 21 Dec 2025 14:05:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXK4B-0000000CUs4-27cR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 14:05:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL7ZxtS2301292
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=; b=l3KIxPl5kIN4xNib
	myQ4HNQYCI5ceHdtPJpnvoXePGxZ2ALz/v36TDFMiscfK2cleq3yWzGnv4yA1sFz
	XzVlg00q+fnP0eOssShHUZbtAyANXY0sTxsf45OiR8JHuq7YBh4iVuLP4MvLZj61
	LG/rmLO/tsthe9Zz/dyeM57m8s3JY1ktS9dBgJQsRWKdKiU4a3TgUvIkZ4LG8XBx
	3F38pHhC6QePZMfGY6dtM719T7/4/22pIk3nqeskQ6XofIQAoGDrq5TidY2Wlhsh
	rNRzIM+WbSWJrCL4GngMPsmpTWGT0SczvJllVHHqwKsTx5oKQvCp4rtSDE+Z2v4D
	tJplqg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux2c3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 14:05:44 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78c32de3643so39354917b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 06:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766325944; x=1766930744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=;
        b=LFPkarRoSPRBqyCDVSt/Ssly6lPk+yRxXi6gr3x/4IOlCa9gNZKnwRr4ihF35HSRe+
         UecYYWCQ8RIcj6d4c1/MTsu6GV+HvIB0AxoDEFsp/RN90MmAWBefk2+/tlSDJYjhTd+n
         ZEpV7Gi2o3Eno2qI8utkjTkfgA2s6uD2jlN3oBkQBIUKJ5uQh5foREIJdzmKQl2Un/fR
         VhnhwTJTyjQBNFsHNqidR/UMaCz6KFbvQXkI+jPnmJOgOMJz/YNwJKwLncHlUW5TLpvF
         CmMMsjbKyZKPRK0hh4/oPcukbVtaAaQC/QgdPSoGN7bV0qOM4IO3zg3Fckww/VXaTkKw
         oZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766325944; x=1766930744;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihJ+Ec5j0Wj03PL6tGf390iLLMIjjv5jteMD9vvDTUQ=;
        b=w1wH3glEv/AlMRVYR1buxcAdLgR+Hwvo+g68jG+xzw7e+PTGWdSMEBzfEF/e+GmoGO
         //PhDpjpCjDLN3CSvTuNPBSsQBAP5gOaQbysVyICEU1/GhM2Ge3fAjXX6fIXcu2LZOUB
         vX492I7K+s/Kf4uIscOCS8Df7x5ZiYm2RxmImv7knv6qhtb3/8KjFGnIUTXm2N7mIwGo
         j0mtvlK0Oheh7AyGvYjupxrGCqhcGezgw1dWFRdk4upIBy0n809RF6pEjqCAjy/hUcIX
         Fhq/BRzRFRiy1Jc13q9HNrJZJfifslAU8tNSGJ4fGsN9nQ5cbUWSr9rYN6XIme5Bm1DD
         C7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWEzzenJjA1IdC3jLbQLVg1QuaOB0pCukmUwDqTO4xQHbJYnSL6mLbQ7ZfHjVg+KtVjnPZp4vZR6iZARr6bM1U@lists.infradead.org
X-Gm-Message-State: AOJu0Yza0rlEJmtdMNek16+uDRSW5DQ6V2kcO5JUl3SpTiJeofyLGPzM
	lkFPonnpLZ6GNlpHmGmT9Ik/Zq3Dxzb7NxkFRXX+iIAc4JOwqarBKgGbxerGnU/fVGcrv0xcwwr
	d9hzzbyygF4hosgX4EOAfORCBTnD9OXWp4GoVCFsBd6O85NDZ12y/xwTIGdRa2aujgy8LT822V3
	YLIg==
X-Gm-Gg: AY/fxX5xpcilk2gyitoYuKKai8DIcmuu/WHYiSO0opCkVmAJIgB7kTGzU6XsjgNANws
	aSNfKs52Y5N/m0o94M1fzeAt8Ukg9vkuT7hLUK2xey9FifTxlRjhthRE4sW6VMC6v1684CLpwS4
	JON3bDb47m9MGDSnVjSlacA7/NMocuBVX2SxYE3Nevz6kelSZ45zw4BdAL6RX0htSZxWs1tAqa6
	nY/yfoKEgPdcJG71ZcF/B+DAKNDGLDXUpWyiJsFkZzFg4ydh1/dDboK+0xlz5u0CYWvInZ2p/5d
	+caIm6qELKOSWWEXfFxyhFrREbXp4EYrt/B9ce0GWgGVs61vYgwx7nBiKJb8kMBmj5TB0SRYp89
	kr3mNGjq7H2DtSrmA2o5dRigUNmul/eHk9qDqORIClTwMWUAgx1VtVlE7isZ0/1pXA94+Sp+8
X-Received: by 2002:a05:690c:6511:b0:787:f72d:2a5d with SMTP id 00721157ae682-78fb3ec5208mr65067717b3.2.1766325944091;
        Sun, 21 Dec 2025 06:05:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENen467K+vyMFnVky42xzDMgtlkejuduc7jpwaaPmkE5REAaPMsWT7W1gXzapvi894bzqQ9Q==
X-Received: by 2002:a05:690c:6511:b0:787:f72d:2a5d with SMTP id 00721157ae682-78fb3ec5208mr65067297b3.2.1766325943596;
        Sun, 21 Dec 2025 06:05:43 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c16sm7312426a12.1.2025.12.21.06.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 06:05:41 -0800 (PST)
Message-ID: <9b363736-ac88-45bb-a428-7d3bccdc4d12@oss.qualcomm.com>
Date: Sun, 21 Dec 2025 15:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
 <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
 <20251221120413.7f1fa877@jic23-huawei>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251221120413.7f1fa877@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H6mD-6_jrWDClmCn7TlXdOkcCB-sp_De
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6947feb8 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8od0x7llD9z3EFROJlsA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: H6mD-6_jrWDClmCn7TlXdOkcCB-sp_De
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDEzMSBTYWx0ZWRfX8rfy0mdBEnIe
 qno2+ORtBu7hEMprCDBv7F+tWE3g4438OK1lG0294e8IwucnbOEC+hrvbwxLrPd/3TWdEH9mzpl
 3gZ+yHl3kGNRfcMxpqxb4Eu4PEVkD2KHcoQYbjqALI3lRBFGz+L8Wc4mtWMQVnhadJ74i9A+yaC
 VpOtCd/zfMTPlCFQfgScttbxC2A3UDQTkKpGrKwSCBclitexrQakGItT54Q6hLZCljMXVuJvgO2
 3kGpO8+/qWm1E9t3/V81U0VXOWTdz3UcQpIadihfY1pEAYhKnzwiFOYcjeRuc9t99mRebKNAB/x
 Q+2MBZNAA3RQP1GVU62sxB8Ab3i5wuuvcFTRIff4N0pNvIxPxDu3nwItQaZr2qD7RH+IpvPoh+Q
 TuJPZQGDvL0dNnJfZ/tMcEs1Ghk1kMQL3C/EjeiOWKxiKGQvu/omLDkEE2fQgciB6pRzIvR+ynz
 PR18kRdoDKDiCgAgUHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512210131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_060547_728032_2CF8444A 
X-CRM114-Status: GOOD (  11.58  )
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

On 21/12/2025 13:04, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 15:31:50 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use dev_err_probe() to make error code handling simpler and handle
>> deferred probe nicely (avoid spamming logs).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Not a comment on this patch as such, but this would benefit from a local
> struct device *dev

Ack

Best regards,
Krzysztof

