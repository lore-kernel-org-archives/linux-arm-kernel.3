Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB9DEDEC12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tnh4k5gg7ONmrfEMINIzh8amDVJJUP7VpU/aFTOrUWw=; b=umMQINF59bRMNGE2LwjC9iaDgZ
	L11fCtDEr0/n2ERBY7O52I+B3Lm+jzuZvdTrEo4YlnQQEF3jriVxWfCUKJBQVVDJ/AByipMRgXeLQ
	x8kWkTFAlzm3d0fKHxeCkKjQZSGSShkvUIsXmRmUzN+cuosdORnC3owdYhnXKmDlv1Q2EL4OzQ+aW
	u90ytx3Gu57G/+H+ntOG+zo6d0ZWRfo7D3RJoQA2frzJFdcm15O7hUcO/HVjhvEhnAnvK3wJMAzne
	2R+2iNdmEeCdmf8tyxjHSrLNxvH7BKRqDsYWI7/ZjKL8vGQh9V67yjUjTi8CesZrBmElPVd0OJ3z0
	maW5Nm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgTF-0000000GZgN-1s7T;
	Wed, 04 Mar 2026 07:16:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgTC-0000000GZfr-44Ov
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:16:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SWrb152585
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 07:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tnh4k5gg7ONmrfEMINIzh8amDVJJUP7VpU/aFTOrUWw=; b=aaN5OLfmeZlRTDaI
	J3DHDZMFNZNbod4bYHbNiACbdFAC7XHyCPIu4+8exGcowhgs06P6F1bBRV48YH6C
	q+fG+4UZN1AugHgqNyAGcDs+kxSzhMqIEAWw+VZ5E6BOOxB1LG5+NDNiDrpdJkp2
	P/oCoihAbug9GAO4k23ZENrSntseBjBmDvDdTg3c9M0xQs1aOilb3aDf5lkQQjSw
	EUKLfzLhN+bZHJ5KUjeueHbGIfEO+VeiqPbQjbN3i9ml24gD2Oi6RDF4fNxetPj+
	NB8QrUfPqiPXk8i0eLP3hKTij9IcsUW4rwu2kXeStM9jMWoVlgAhkx4TBYg6QtdL
	bcJJBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvjj29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:16:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso4174308385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772608592; x=1773213392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnh4k5gg7ONmrfEMINIzh8amDVJJUP7VpU/aFTOrUWw=;
        b=UozTvuozAStlpfAiKSqwmmHcaL1ZDI0UD30BZsT2Apa67iNHJGFgR+sCQEEglxMACf
         kwc0ZKGm1JOdA285OtQXMH0gjPd9uCn5HdHhdYlSieVt3qMdTLH5H/pwCGCzq9xntttx
         VjmRYjAtg+o1aznSAh8/kKL2Sq517e3R1vsZwm16RyNChJc1wnrqefDvPA6+wGE1W1aZ
         S3SuyuaZ6A1KwFLHoNUQGQGOOmTEUVCJcX/W942b75O7sOPvopWEAO5fEoMABO4XTTwm
         x3gQTrB+p5y8Yolnv0hJEeY0KAn5d6sCWDcC+jlqeuPbqlIQpKAzxIZO71S42x/Lb4Nj
         dSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608592; x=1773213392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tnh4k5gg7ONmrfEMINIzh8amDVJJUP7VpU/aFTOrUWw=;
        b=vDA7o197xyuU6FS/MshoUFFZpLJ7oO6uGwXsavNs14R0atjqYyfDIJ8ZAeCPL03j9z
         OkNT3fCf4VnaYj9fwYJ9lxynU9xFsFuuR+HpeP0uz4by97iKW/O6tjbBjvNXq1QqLdw6
         nDW2Tn+T43QSREoT0gxurkQWEvHmkyCDVpZPGm4cnR6VhikzgOjmPWdkrtxff9KGPzhE
         xo44OEdSILCwY1cZxOTWOaC83ZUaM2jceiE7RHeLKB7RGPt0sMaUaofOpQfmS+M9rp9q
         G5Q1wM5WxwvDvLEyzOGwr8CeE2kJDfzWimJIU6R3PG5xD10HGigHOkGSzyBB5V23rhKF
         mDcw==
X-Forwarded-Encrypted: i=1; AJvYcCW+xha8+6frSopznHIcfVwYXX2d7sjiDa9RruLWkxnep57ehanOi69qJevLOjqIX3q47cOGWNOa7xWcxAZonV99@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHWGY25H6BlwfGh9hv4dVj5V5wBppmPeXQasTURVygrO0jSES
	MOkZbSmkaGmB+7/cesS4ntmYwAmqqCX7NUldD8MY7Cg0pntF98DOwx3IEhy71DU645j9wzJ5k5Z
	aaInwhsNAtIHbETZGZaHFpwyjcX2JmEOhoUU0rn9d4OklGoTCmCzWhODa00+MHi3Cib/KMw5q0Q
	55jw==
X-Gm-Gg: ATEYQzwJxZbgkjqp276QAgBCm2ZKscCecy674jGtOh6xkIlEIwc0iVDNPlcTdBnxrlB
	OtItS+NC5DVsFB42b4oIwIDg3rNMmrHznG2Q/rDjy97pwf0NkRMInVHCtFLGGvbaBMK2kT7SIKR
	j7XnI3dDxGIKOVelXXdAbEEo5CMqsTsw/pJZ5ZLiCoEi3KNoaiFwx8ptGLLNb6oH6FHfSzgstIa
	+FURKYuVkzwG0ewUJRCj3/XiBOmIWLKm01I8wlMez89bO+aeN/8OaXeHyDa8MIxpIbdDuTc3H3I
	iYIWvJTwx2Ds4lKES55psBrdUQ8LXirKnj86xEg9ULq1TkpBE/DqOYtidY/no52sKeQ5x09I+HO
	s2z8fvbLaTID9Nv4CRQXv9VDEYPiPSkWEmBqfizHC8YhfpTmk
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr132830585a.38.1772608592039;
        Tue, 03 Mar 2026 23:16:32 -0800 (PST)
X-Received: by 2002:a05:620a:1912:b0:8c6:f411:5eec with SMTP id af79cd13be357-8cd5af817a2mr132827785a.38.1772608591557;
        Tue, 03 Mar 2026 23:16:31 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c6129017sm4559806f8f.31.2026.03.03.23.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 23:16:31 -0800 (PST)
Message-ID: <d259b303-8ffc-4d29-a8c9-2bdc96fd8647@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 08:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: axiado: Use lowercase hex
To: Karthikeyan Mitran <kmitran@axiado.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "fustini@kernel.org" <fustini@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Axiado Reviewers <linux-maintainer@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        "robh@kernel.org"
 <robh@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
References: <BN8PR18MB29930D52F6533147F65C3CF3C97CA@BN8PR18MB2993.namprd18.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <BN8PR18MB29930D52F6533147F65C3CF3C97CA@BN8PR18MB2993.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA1OCBTYWx0ZWRfX583XlOU5Pitf
 XfVgVyRMLFZl+9VjW8+s+V02JUK1PQcWf4HkBreJhHQpxCbBg2sUKKewFTrpzgKXDeWhHpMeoTK
 V6SBDOKfegOcwfRBbTE9N4S5pjL5R0Ep1vkZPJC2MW/r/0rd5bfvjUaF6cj4NkYLZuSE4GNcqVg
 sXGjAuaQ8XPCaM7EIixSuUM0zjlxSzlzHwuQma6Cr2Je6QN4W7I+7RHZGq9Fc9tkBxfvSV2KFrG
 uaDqlCeRANc5pwgu0I0s9QMFtFV0olqFpmlqjmmQce7m9s8FIDdFKwiXTRfz8g+ghAaxgxL7xjd
 wfkke576ZpSNGwk+WZ2jjVwXipcsJ3+4xcd3UFoqiS9cFJ/CErAKmiYKIA3Ikwzq6Qesv8IQmn9
 A7s3zezoKETqMV7nzebhsNPCd0mdo1y6wLIZ+87nKoP9atQNpLIlqpYJPPnP8NHhtBKRhV+ehLy
 vfgBCEf43JMnymEloFw==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7dc50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=440cDlBIAAAA:8 a=NzJkVhNRsDn4JeGMu-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=d9D1X1bx8dWolqnE4HNT:22
X-Proofpoint-GUID: q9MWTrg04eWzhwBV8e8NjCw1u2vSZ_A4
X-Proofpoint-ORIG-GUID: q9MWTrg04eWzhwBV8e8NjCw1u2vSZ_A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_231635_018725_90077395 
X-CRM114-Status: GOOD (  18.75  )
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

On 04/03/2026 01:22, Karthikeyan Mitran wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> The DTS code coding style expects lowercase hex for values and unit
>> addresses.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Reviewed-by: Tzu-Hao Wei <twei@axiado.com>
>> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
>> Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
> 
>> It is not a big deal, but I just don't understand what are you doing
>> here with my patch. I sent it, it got reviewed, so why are you posting
>> it again for review?
> 
> Apologies for the confusion. We weren't sure if your patch had been
> picked up by the maintainer yet, so we included it in our series to
> ensure the fix was applied along with our related changes.
> 
>> What is the point of this posting?
> 
> If it's already queued, we'll drop it from our next version and just
> note it as a dependency.

Queued by which maintainer? Why your maintainer cannot just apply this
patch?

Best regards,
Krzysztof

