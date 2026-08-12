Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=; b=nrg83K4Amc0RY9NCXyhfZizqle
	6MKt+YHD0Tyk6+MHT0EhcLT1ZYBU275cMODzKnrxTsA3XMrTDuyYKWmXrGTYM3zdl92nBglgi5XOs
	5Gz4/o6mdmqwbLoXAqRAL71eSiA4ntL/c5ii1DEFAmqHW9xIxDyNPOJYsmydRpT1bySzVGPZopEJk
	OgFP7/OVg0gTlJRC5sftmsKpomyWO/aY/96jS6/grmppkgTMShuws8C9cBZSlLz/rLPeVvHgRmKJQ
	lT3RwWG5+dFbcTotmpSY2PpXKNgv0NG8R/5tUPADQ5zFCMkpgxl3XcZYzhHEv4akOYjbNX0yTIwLT
	5lMXWFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8PA-0000000GDul-2klM;
	Wed, 12 Aug 2026 12:50:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8P7-0000000GDtW-2YrK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:49:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4tnK3620451
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 12:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=; b=X54XlddIwvi/tlsX
	r7IYyYTOIUjTPpiaigGBuw4QvBCS+iBRoc5cooAOwy5cz7VIBu2X5OMYtCT4+Bt/
	83oaX4pP8gnhJGR9fI6aznCrSnMyHbmIUjziS7zkZQ+DXbH6OORbel5MKoQLmL8t
	QFsA0alNQuyIKOq3bwYf/rsI2HUhyLhyx4jlBkok0PhjbA3w98Xhpx8S+0JOWa0a
	TzDgeqw6Wp4/r/yyslKQWq7XXkpc6fJZoFlVL9Ihgz6UGJ3++2TkPWUtDvdkWpxY
	xf4MmjddngZAucQOhx2+RF95hdTksFdKa9NnaJv3C2a9vNBKGj2+9laxJmj+trGF
	qzkV9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2svgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 12:49:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso7756361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538996; x=1787143796; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=;
        b=LYzRMiCR6uXPyjmuC2Q4MU3k9LsAhRTfGtARO6Sow4t/xEEPtB9ea5hsxWFZb17YzO
         TX/SuWZG67tk2zuYUUmb/8UftMJQNIFKG03ZP3gXfaUD8ZHNK4QFK9X5NkaiHkjYfw/p
         l8HT4rWsceARaQd5XW1JVEyFu7ykQBoCzVRskftiqeifpfPczdwKnFmqnN7hEwfFo3X/
         PERC0E38f+pHzDlWENG4NiT+jBV/e29zkE/I3HKtb1sBbEGd2GBzz3RMaA4ztNGxoAfd
         s22ADS7umFI1i9wLCE9hI38z4nACbc57gSD1Zps9+RmuFzZWbfUzDdbDeYNxdchs+mRm
         30VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538996; x=1787143796;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRO7cQGeILqoNuN9rQ7IoY9cU4C+obAiiKTkESKbsaU=;
        b=Z788igenMN9VrD3sRGFfdjB/wEaau2PdLpTcemJbNaUnjEgRlW9x769natL1HWa0Z6
         C8w6svm0DRrcy3OZg7ac/uULcu1thHF6Xq8QfguJU8y/XDrvGwZphE+9tFii+qb8SI+t
         P8MhCoAWqZxFYFntvEB8Cf5WgQBLzDG3gGuXXCz2UAx51Wvq2b0rYQpVU2AfhgU9dppK
         ur01J3oC+IErvdJ+eD2TGuEc6b01CHhH4p4fQD1b2OTOiwRSsNIFwLn4W/5vmYQozhQO
         jHJDTeU3HX4YnvPOWzhryBAS4EQTtzNIwSbJ/0N6caivVMu0LM7hjkdfCCwFJ5uMlV9F
         OahA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu6uMgg66jwMntxiZd51WrqAKvNtLn5hPQD0U4wUw2e0EQ4aVIbSoBKixwJ0ObQ9UEmG9mg9HDC/vjecnXk0D0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7OE+FYTVQU0lG/wuoGdEFnWKp97EcIYWf0AkDLxXZC0Tbqk3H
	83wY76Cjb7Q7jZ3O2wCBA2g0CVEEwLlP11AtlYhZMhYSbhBFAnnS4GN4E0blbLb1yhyW2qvIkmG
	uAxKJCHubNJyhZdQDlF9BfNnIDvsIv1UmxHOzRwQOA3zrmTi98/zQblr6jLrjjoBsncrJJfhw/3
	4zCA==
X-Gm-Gg: AR+sD124/IgL0Gjf86rwcHbApB7bCk3fjGgM6Rn7IGoib0t9/OEsTvmhpLDDkY8uQGU
	347IBno8sr2MB5WgaxHlhqZmX95j1H6BVihoq1WosBrsvLzE07u/gnCIKNQa8Jwp8cJNp58SVyg
	V7Svy9ia++ITI0sPjgrV0sqYWy4vPfIhzNqL1uUUqmipF/PTVgQl5ydZ34FUX/ousDSuz6oODCv
	LOgOkFMi389p0kVRftt7Q0KMl2MN3/QVTWXTEaOk+6YuG06/cZDIrYvYQDn6iFKgrXKdcXIgS6N
	lVWEGxoXfGIQbsoveZpFUS9mTUWp6gn/7J9ZtdtmFjnNrCsNVF/HK1yWaz24my42fRvEt/0QVLo
	7i8QPZRhNMNLjqMJ8X6V6fI3DUpzH6g==
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr37551231cf.28.1786538995892;
        Wed, 12 Aug 2026 05:49:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2d1:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-52d6486aa8bmr37550611cf.28.1786538995411;
        Wed, 12 Aug 2026 05:49:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c94f4c0sm41673635e9.8.2026.08.12.05.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:49:54 -0700 (PDT)
Message-ID: <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 14:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c6bf4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=_thU5h4BxOvQXo3MrM0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: p6SKNCRNNmSoMrvN1NDrAsv5cbbtro75
X-Proofpoint-GUID: p6SKNCRNNmSoMrvN1NDrAsv5cbbtro75
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwNCBTYWx0ZWRfX3wVE85euTxfE
 00GFQqcJRC91oNOKdjkSlrshzuEKtYf5ZaCBmgNSkNPCGjaUSsqmlDU53l5yODKi1Ffr+YWmLOJ
 ioDI00erXbLNbCteG96H4ZcknDDV5tg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwNCBTYWx0ZWRfX/R+ctj0Lv6WJ
 E15JDhlci/UPiJs9A4/LdCUP7Vc8DtxFo2g0LW8kIJxg/YznPvqcCtnK2qU7+BfCOVncV4EB6cN
 XjsPNMRXTFlIOlNObc95DD/p5RdJwFK9O4goPWpEwgnlXdOz2QE5Q6xhUPx663SZmU6bKNgfOHH
 CakQnYXVZVSXkbkR/EdJG+JhbRoU917fTVT/9Yl6Lt2bqXicbkG/CA4Ia5secS8Z8Q9R2/gnzbZ
 5voM2RpH+XJgqPszfBTfNMIQABtIB50gFDAqNUwSsCqplpColiP1CWGCqX3neyndKnqmCoX+hx1
 +zWinYE8H3RH8DRsnzWF2yTh2twIfdMA1aQNXFIl/CNDXas6spDi5urFqTgjqCpdtGtaDYVET2+
 o0ngKjbl4IHN4boluFy8e0f9q5QKsDmd7MlgUbu7b66EycuFSO0ZKghXm8D9uxJXjGBVNefDCR3
 SEc0gH2Cq64cMaVXnOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_054957_771661_A45E1B34 
X-CRM114-Status: GOOD (  15.91  )
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

On 12/08/2026 12:22, Yu-Chun Lin [林祐君] wrote:
>> On 12/08/2026 11:41, Yu-Chun Lin [林祐君] wrote:
>>> Hi Krzysztof,
>>>
>>>> On 12/08/2026 03:59, Yu-Chun Lin wrote:
>>>>> Add DT binding schema for Realtek RTD1625 clock and reset controller
>>>>>
>>>>> Reviewed-by: Krzysztof Kozlowski
>>>>> <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> How my tag could appear here?
>>>>
>>>> Look:
>>>> https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@rea
>>>> ltek.c
>>>> om/
>>>>
>>>>> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
>>>>> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
>>>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>>>
>>>> Who added my tag? What is the actual flow of this patch?
>>>>
>>>
>>> You gave your Reviewed-by tag in v5. However, after that, Stephon
>>> provided additional feedback. In v6, I modified the patch based on
>>> Stephon's comments and made some other changes. Furthermore, I added
>>> the clock ID
>>> 144 in v11.
>>
>> So how my tag could appear before Cheng-Yu Lee signed off the patch?
>>
> 
> Ah, I read the rules stating that "the last Signed-off-by: must always be
> that of the developer submitting the patch".

This is correct interpretation (although some subsystems will interpret
above only in respect of other SoBs).

> 
> I mistakenly thought my Signed-off-by had to be the absolute last line of

This is correct.

> the entire commit message. Therefore, when I inserted your tag at the top
> of the tag block. 

This is odd result of earlier logic. If your SoB has to be the last,
then obvious choice is to put the Reviewed-by tag BEFORE your SoB.

And in any case you should use b4 since it would do the correct thing.
All patch submissions are supposed to use b4, so you don't make trivial
process mistakes.


Best regards,
Krzysztof

