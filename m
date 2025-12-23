Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA16E6F09B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=; b=341HsulOU3Nhf1YWhawyMvbFgm
	BhT/uNtD2jdLoSxjSAvhr0XACFmCTO9umUpVBU6yLOyFXRuK1nm1Sz5jVAtpnYeFN78aF1+VzFXJe
	gqFcw1fLB1v+L7eL/92CRil8cpKKKjxC4PLJsoxmfT/CqVxISrKIDO9sv1rOZkkPoqx528OOhq62k
	7Pw5StUngr6MqEc3055E6AhGbpTIhYuQk8mMFuIUpjmjS/o+jWHrbhCAiIffJAWDdpLOuZgrSwgiH
	rf/C8dyIyYidBgRr8EazuY3Vcpr9w27mRl2664gMdei6PKV43o4j/YZRv0VtXtiJoPHpMDqvfXzjf
	jkxOmISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Ms-0000000FhkG-38Tz;
	Tue, 23 Dec 2025 15:32:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Mp-0000000FhjF-2EAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:32:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCe42B561263
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=; b=UQTK9+nEi9Oy41IL
	zGIhjxrMKeX0hq+nM5ddsuIoDvLdfwqh7UtJ+ieyrc3uwCiSAQfojeI3v9smLdjS
	e6yQctwq+8Dz2mZ8bXufCymwAxmivICHfTocn/0Z77I7IXoXY4aw8N0T9VGn+Y/9
	kByYDWETi7uSPnDpH4QrwWZlArWkkIVIk37S7UyH9xHbFO7oVBETFrD1sresKdQ+
	EY7OJQzhiMQQaFJBIpnaQvKfzRtkkkz26mflCfkKTho4tzZ3fjo0s1G18eXJiCin
	5eBoOOFteJyZ6PhNc7FYiZLSjyC93WordQ6eQWS+n92j2N9oda3cfB4oN813+kwQ
	akCyhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9crf38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:32:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso55435541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503926; x=1767108726; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=;
        b=fMmV8fiWHlPB3GV7BjyhC7rabXC17hZPDMd5OeRzzyoitSKi6blJHGVGjCNQ3dsEvg
         dieOnouBSM8R4qAbaYkITKUJDPsT1ZXZMRJJMR98YBy5/lqINEj9lTga+/Yo53gG+W0i
         uCcaM4Sh/vLFpg3aPzleT+7OidaLW9mZJkSEd/SHu+9TLtqOhsCsjjR6wL0umAJd+ZB0
         jb5Kh6DOZFRt6fCLv+eP/ExH+HnhNMoQtz13V3DLV6BvQAF9PKe4Zi0/t+gEUJyn0xzA
         PhttwIgbqdcR6D/FX3kdsRfRyCbW6fPb4FqR1zbsrKNDncHldVnPZxtnx6k7LMaX0jNf
         iRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503926; x=1767108726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=;
        b=Akd2OIpvI4bkdCNTdWiV3MkTs6VSLJAQGFi05JoOZoUNQttd7SlzFvIE/OBbOVWys+
         zaBsqaacZmypR/eDBWbMAMHOQabJJRIcBPxDLitVQG2CmFVV59tPdGuKeijkbVtnSeXU
         xh7h6WiHSeWYQeI02+OwaOW54THvRTUmloCTy8Z8csToKYX0Kk4lYWErJlvn2UXPdNVM
         nQapNvFTZtoV6eLPwO3jGug7hrfRgBOAoq1TDhyYS/9WU+P6DcxO7gADiQXR/PI5y9xu
         KCKOvdeHAtzI3pF4lc6FQlzbOakGkQE0ZE0QZG0W8VqtNgdAe4wX5soZTr5qWrtq8VkO
         Hqfg==
X-Forwarded-Encrypted: i=1; AJvYcCWxabh61CL73SANe4mnXTT0govKFWRzzNDeWnu1fmwFShLJgiKlRuN2pjGUjRUr2DV7sq5S5+XDtVYI9fvlA68m@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4sg4HLrnrI05ZEoQ9jnSW/Z4L3bwvA+ppB917dOTR++wJOCRb
	0imRGR7mu+Jdzc2Dkb7blv/8fc8eYcwZETG/V7rIQR8pVPGPcPN0PoL4aHfHvqmnTrRkBOh6XLb
	H+2+HkVW2+QFAS1BwgtPwqDh/s6pTTVLEI2wNgb4H/E2v+Irf5ZSC+j5IL1vDdhmFNhbmATmJa2
	MPaw==
X-Gm-Gg: AY/fxX75n+uUutKKz/pEa/dMZnMjh+GVN90Fk2foEXnMs/Ij/938kJSY4gCuyLO2L0H
	ss+2qYAsT1shNl2Slp7eF1XKie5ralVNGfAvfg2BIfyaHkOXv2OQDNa10uLu2t/DE65cNGRV8yW
	G+8/SjlntqEhs/7V54wjK2FssgKXaklTejAkWpsG5YcNUPQXcIJcB+oiuf9HSZjjcDkVBhs5Vbq
	eJrwpAVqgbk+aPkL/i0dAEaup97fFJXhZImGlFyLJtGsdatcg/roV6LzsPqcsBwvInlYIP63dke
	51KoZU/eERukbtGF169kWS3bgOJ2E60iKDECHWbpA0CGyg3jUEMWW4GwPI8U1sJtVVeBjq9h8Ug
	gexxrYSUAXEAXw63LqYN/hzDsycEsdJlk0gtPc0ThrBup87h9hkv2uzw+zmBjAXR7dbkyzl4Y
X-Received: by 2002:a05:622a:5a09:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4f4abcb5fd0mr249603791cf.3.1766503925533;
        Tue, 23 Dec 2025 07:32:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHod4HXSgSLTvIVjGk5APCt5zB+ut9QFHLoarx1zOShGL7dW1do7ikWwGzBadtd5p3cXxJ8Ew==
X-Received: by 2002:a05:622a:5a09:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4f4abcb5fd0mr249603221cf.3.1766503925089;
        Tue, 23 Dec 2025 07:32:05 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm1296719866b.30.2025.12.23.07.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 07:32:04 -0800 (PST)
Message-ID: <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223150256.GI9817@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251223150256.GI9817@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5CVPVH1SuSmuaADn-h7-iGKIWTcMco47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOCBTYWx0ZWRfXzOGCkvBQCQ3u
 /Da0w4dtIbgPKcsKlYEWG7JmwwLPFbSgZ2lfrDeTVkaEihoRMi5ccZC2+zaBPKYd88M6UtCallk
 KAH+T4Pc04GLXFGbMda3gEtafj2JnCVZxKcbSgKmG1F1rlxKANgPV5+hiKXOwzSk+EFiQIIYPEx
 109EN50XymH8/sz0bYUQmY6Zax9wokmtxNR4+rMCM7AvVQ2XwIU68O51Ud/stqfE8EH6hWbZZmu
 NHCs12/e2w89UVYhKuR4OgzvEgyVajAqW+FLLF4OyQEvZfX+25ygPEqURAe1TR6cNxqeftkNLDH
 WU3X2M78CrpDrLaktMz3TSbqUEPrChqaTRu75tjKoPMGX5Pw8UemB+siDIryjBuNTidBKEdYlIF
 EC3PDX67xU1aKt+5UltM4iO0AJ1pUBDtp8NVMCL6NkqPnNx00kWLjgLeYHvOemTPhHUeqqvBI4O
 /3OvvbJMtO4/FxpQ5Zg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694ab5f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NA6n-xKotOlSH5BGWq0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5CVPVH1SuSmuaADn-h7-iGKIWTcMco47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_073207_695834_4B6EF732 
X-CRM114-Status: GOOD (  22.17  )
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

On 23/12/2025 16:02, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
>> It is already documented but people still send noticeable amount of
>> patches ignoring the rule - get_maintainers.pl does not work on
>> arm64/configs/defconfig or any other shared ARM defconfig.
>>
>> Be more explicit, that one must not rely on typical/simple approach
>> here for getting To/Cc list.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
>> ---
>>  Documentation/process/maintainer-soc.rst | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
>> index 3ba886f52a51..014c639022b2 100644
>> --- a/Documentation/process/maintainer-soc.rst
>> +++ b/Documentation/process/maintainer-soc.rst
>> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>>  
>>  All typical platform related patches should be sent via SoC submaintainers
>>  (platform-specific maintainers).  This includes also changes to per-platform or
>> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
>> -addresses in such case).
>> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>> +correct addresses for the shared defconfig, so ignore its output and manually
>> +create CC-list based on MAINTAINERS file or use something like
>> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> 
> I fear this will be another piece of documentation that people won't
> read. It would be more effective to implement custom logic in
> get_maintainer.pl (or at least output an informative message).

Part of the logic is already there, but I will not grow that - I don't
want to touch Perl code. It's pretty obvious the tool should be do it,
so feel free to fix it. No point however to stop proper documentation.

Best regards,
Krzysztof

