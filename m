Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCCBD1118A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=; b=wR9p8LVQts4JOvHH/Qo9uroFdv
	8Wnu6ihl5gfZHAnVCO1vGr/QPH5kXpSuFIKUxi/FVR/Gf2UQjB5eZg+qgni5sAStW4gqFXF4ph+OX
	xo5gQeqwOC5qG+8evjnpcJiDBsBdn2APSwNc0pjC489btUzpdYuE8tdxR4uJjC7q2DbUeQ63drXtO
	JDJaGMJATJlFJ+TZVwfKLiTN6h0qBEJTgbSx8o5gLNax4kPcnnurATxDdtMBy+gxtmRi7WOVYCSHQ
	RdtnbqLlbXBW7cFIRrdP+/pOTKAPgYbqqUWuEVphS0MkrSJravWv1THu3PQ1Biad+nyjmYe49Tiu5
	+gZ0N52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJTS-0000000FQCL-2lzU;
	Wed, 26 Nov 2025 17:38:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJSo-0000000FPWe-44B9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=; b=VKk+42LZw4nXTZu/LBloF26dOR
	U4+k3pd9oMPM+/2UzdAokKEmfJEQL9DNd4JPXy+FziFAZbzN4UKRp8v6BAnOBeUKBn+NMClMgwcX5
	YDmuTHvkhU/02LB5cYj5T9R+8Pot300UuBIGrmszqXi1hE6aitpmULJguUImcFtKFdPz+T2T9Z2ZH
	N7GxvW1weKVnYst4SOUhsrxcj4OVmnIFDTalfiJWlj3O7Wm7+SQoK9xlHPB30aKZeixRTCIaw/VN5
	Ork0V2bmtiS2IEFrKnVM4LIpmtzq8E9tjfZvWBg17sRqbsBJHZBXqOAVOVsFsMvffg4k98BfhERTk
	hBJKpTVA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIbA-00000008WEz-2hVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:42:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQB2dIB2121921
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=; b=LalmU56lmZCoyX+f
	d1E5dso1kl7RT5H/DQfhtgqOeySAs9rHAYH9QRnDOxnBvOLNncC3MdlD9II1CEX7
	FJxoc2FGuR82tDW6zr0n2NWyl9a2rT2GdSZdLxPdy8Sv4MOfV/mfhdOaPGP975T6
	E1ZIuUzxkJ4FRYsGXybso6Y9BQwV8IxpEHimpFiNlyEjRIPIX6LtIU4HWLM3HRZy
	XluF6MmGbVFCfx0p0NnEE89cpp4ep9rvBOW9qI2L6rLygBLHjCI2NWIV/MVmQQ/j
	LotRouEuK1QTascPQ43Xdw6JZRb+n3E4SvA0fQOZz5yC98yAnNnGMlniTMbA9Cru
	fd4P4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b313jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:37:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b51db8ebd9so72865485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178672; x=1764783472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=;
        b=Mr2VyUGRsdL0GtapDb1ny9ntewG5FkOkmP0Ok9Hda1gb5qkmxy8WTYUeWCznQSWPYW
         nKpx86UVwIMLhPLeHLSu8oEdq2iycNVi92afz3gkJffsWgOVwsecNylAmmZZN64tQZGN
         6TMfBJA9RDI4zPyqO2kGbuTs4Nooh0iF/BMMlUn0cnexjacPV7iEjmWBRebSK4/5Mg73
         UjszlhYRv16faNXjWKF/gPyNyIkltGGjlw50GNhbTaq7dZREvZcVufjlIBUVVWUne2gM
         V2sLqg50fLrw+MhFqbZLX+VqxS7f2hZXw5aIrR4BA0JT2yxsoPCyTFnuCZLoKMU2EzwS
         kpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178672; x=1764783472;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRiXTEVr/zgoXr+sIyjrp9m7Gn3JDKXdRtstP8uZnqc=;
        b=H67kSXr8CxMMLluJjDc/vpc0yg/4p/DqKMDQsS59wPkrklxiGzN/9/sT5pPHB3bLcM
         T0hSiB6diwcv8R8nJY4kbvM6p1dqRryaahZCMKtAkS8Sz+cbAWHXHuaijUY7kSmpF9Q5
         80nGRk7NN/obeISYGlTtvj+zNNi6ukcjVKdLtwNtjWAtJ3aCLtC9hT7BloQhqOrS5iTm
         oE3p1im25v1TI6Oe8YMgBGWVWvmLkY+X4LllUjCzjCtnXaTQniBZlEnxIWPaGpnHPAC/
         tXvq+hJ3vUZ41xr5dF2KZNw3lIOmpWvgMc9EfNirHz7RUpModm3XtYy1RXQNcF7eMicm
         J/Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVhH1HZkBqzjcCdkHJNLdP3q7cf3Qh1Yi9xpNtfQnr2J5QoH8Z11JmxySZKeZzikUUGDvCO9kShzdocx7Y7akXg@lists.infradead.org
X-Gm-Message-State: AOJu0YyH/UK/jdFQfV9tmVZV4tvq8HJegnO0YZDxWO1dBoFz92kaj0zw
	Lop1Ugk6ccsW25Obm/i+aMQgDIheckJFq1C9wDTPlRuZsM4C7uke1JEikm37YY2Gmk2LqF/CXp+
	mxNkXPy5vCGOQP5ntWBY9E0N8wgIv8rpgu3ERSH6VGg0X7ApnIaDQWe+Qir6Czi4ixD0hdAq96X
	gMwQ==
X-Gm-Gg: ASbGnctL+qo/8iYLmCsc39P79qjWdZclDDhUbpg+DNa487sbJD8eCE7+k8oC+N6ka0C
	pHmJRkWHYwZXomUrsYr9Sl4wdRPX6Vln0wJmy8fl4KR+nX689qG4g51R0c9dZgLvVDInIliBkmx
	HzYtcZ//3BJPYQdpZBtzTSQI5rie+6M2Dkh8H1JEcJQ2hTHItAV6/KKkOzLR1JNvT5Y32icMm5C
	B8tQffLWU8ZMnZfjdwnDcSmjPQMyacNHwkQjxPtiW2cXHrHbgWfdN9Pfjl7rpwFgu2mCog75ss4
	veNSHRCo6jGumZewTTzgBlkWiXrUGzi9fnEkU86YvvcmVmnu/cY6p/RQuFS1qYkpIJbwagwrJNz
	z2Ty8aH/O3yLIsWzhOXmZTk/3CBMpmSIQ6Cw45A==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2579252185a.90.1764178671786;
        Wed, 26 Nov 2025 09:37:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFslc16jWoYmayl/AsoPewbcJxUtciw3UWC/Jm+aYlwNKGO1iQQBZE6p117t40Z9JzALpNl7w==
X-Received: by 2002:a05:620a:2945:b0:8b2:61d6:e25e with SMTP id af79cd13be357-8b33d5f591emr2579249185a.90.1764178671401;
        Wed, 26 Nov 2025 09:37:51 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76a4360a3bsm1033877066b.23.2025.11.26.09.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:37:50 -0800 (PST)
Message-ID: <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] regulator: Use container_of_const() when all types
 are const
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
 <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=69273af0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=_Kw7KroSLUPirhZNgqAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX1uY/1b01KNrh
 RPBhlR+03sz8AYa5l08pYdRka62XBkZzKZAO6pT6nDVQkMQJD4l28b5q0CSlFYI9cWJ8oBTzkn+
 c0a0Gt8zcHBGZvqBLYRx1G1iW8kClW2RMkuHyN6kERNv3TSirytKcfYsD81yFwEmb2f5OlSckxb
 aXv37rtixgFuHgoAopoFOY4c+YCbOGUoBooQlWR4aHpM0R2WJMZDgctvyNaD4QcN+cHmNG/Cbtd
 Ne48fj+e79oBV+3qYtQFNUlk9m5JU0f75adjDp7jkHYipE5rJUOoCvN/pYWpsGIpe+OMrLpj7/7
 0WXTm5tyinG2IcnFcmrYOdhiTwakst4d7gpmw+WPWq4SvEv1yMq0wurVSwf6IgRfLZLEmPes82N
 XnmPrVTUbODi24RvoYIvke5cgi+dOA==
X-Proofpoint-ORIG-GUID: swvIvuz8-zVPcAYMGUGkfTsDCz8NeJl5
X-Proofpoint-GUID: swvIvuz8-zVPcAYMGUGkfTsDCz8NeJl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164232_934517_A7A4CFEE 
X-CRM114-Status: GOOD (  12.17  )
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

On 26/11/2025 18:33, Mark Brown wrote:
> On Wed, Nov 26, 2025 at 05:58:44PM +0100, Krzysztof Kozlowski wrote:
>> Use container_of_const(), which is preferred over container_of(), when
>> the argument 'ptr' and returned pointer are already const, for better
>> code safety and readability.
> 
> This doesn't apply against current code, please check and resend.

Apologies, I will rebase and send v2 today.

The files having trouble are I think in this pull:
https://lore.kernel.org/all/20251021172543.GL475031@google.com/

I will skip them for now.

Best regards,
Krzysztof

