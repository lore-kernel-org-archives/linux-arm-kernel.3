Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180DAD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=; b=wj6cwcIK2ricCG9zaZ7VD1RQ92
	PTKR3ZBTOFE7zs88ZemMfUpXCziwyWKKQHokdHclU/3yYL71/bHkt5RUe0HR2XfIjLAxDmGNPSJDK
	Z+9rsrJqPsIg8rxsMCSMAlUV6kTik1BsdOFCMNJbVrpFrb9uwR5n684U83bHGNQn4gmuX7IaBGbbB
	eq2Nvrcl9GBmFwBmmUrgELaktTUIbgTwC4y8h42Fpn7ZaA3tlBN/tSVjbh5mtV6F88I0miXUKQ0dZ
	Fj2yft1vQSTxB0bD61iJ8tB02YWcLEn96bQgdER9ajoGV+M0WdOI0lcU0Cg1ouREQo9YZjseUKLCx
	Bpy6TSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaTq-0000000GUDj-1hCA;
	Thu, 27 Nov 2025 11:48:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaTm-0000000GUB6-2B5k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:48:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5oh1e2855048
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=; b=Ir8pvPzjvFpmI3Qj
	0jIZnpxA3DEwegMteN8JROxPskNkQc3lQnleuAnXf9CHemvf/7w7Osz664I3c5yI
	5EQEQrHBUijbciNdQNdnhZYfyLTBubdqssdAfd7/XE4HOu380ZFGtT03cOIihB/C
	A2LPYNczLg4j8v5EflWz7Kz9jv1XW5/ratAuI48hyL2KeMkvNWnnoz+LJSTSgp/P
	ZohEIzqALKyjdbBsHFZaf2W7JDGJn3QF8xtx/bSuKRJW5jvg9Y1z7bNQYfbglXqF
	HF5B0bNkjzTmwy+y26sGQgv62N5clU4enjYbHBLPLks0jgrGdlY4Fv6a/Hx0GIjY
	I+nyQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vhasvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:48:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823f4666abso15991666d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244085; x=1764848885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=eqhKEAWercU9l3q4Mc+xX7ZmCPco+2BKsNhWiw6yBy9Y03IrS1vDXYH/8kv1dxBrLg
         kFfSA8+zakCkY93n0E0hy7zb4yAUpATceYUmT1IWBDLuY7mVnjeK7zz0GRMEGtER7doC
         Z20jmNwXAMWphGW/nuKksPWGxaM4T72xAD92zexd48PdqbM8XCvEVkxRfPnkjq80jtW7
         w8UMiVxjwICZP0vtEFSDYZ5t1urST+jxQynxM2OPl3qKmxN30OFOh1bzDgzrPOij5qqv
         lC2qe8KSw1YT8yxtdS15b0J6TXFerGyFOJUHTptgtfNBqVzNCNU4UCsbRv3KBKbYZy3H
         y3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244085; x=1764848885;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=RLbt3i1zAajyWdPbBLArFZS+4kuutCnxUy7CTXSXG19wOhWB+/zzGPVQ6DoDX350uI
         NW6W2c/j0J1lR3hA2LWCMDvdObFZ4h1ChMHdYb3x3aUn8duCO8m5x5b67v5C4U75M2dj
         9qB3Aocp13O5mcYd+hslxIZgvI7XkP5xqrGL8LGO9NOOVyFxWLOx2N5c79FT8prVET0G
         aPoyxhH3S7dm0+Qpdw/ziy5uK3z/WKYMWXyZi/a9mvrq0szoDgci4/zy3dYkE3GL3Ff+
         XrRt73R4+QIY6UzQfYt3Bf24mcJVPMPPoY4xFGWAlFaFwOB1Q9nLlgy8ZuVDyVxX4URM
         EC8w==
X-Forwarded-Encrypted: i=1; AJvYcCUTMvwGpdR5ShjinxtujaPnvcUAK2e9fnOD5Iss0Ji+uRwTCDJXNLC6QsBbKoBJGAmX50NFhxfIIvFP4VQaYK54@lists.infradead.org
X-Gm-Message-State: AOJu0YxiNm5l4C1VrTyToThJoOB57s1w5g5xSzpIceSCSj/J1cDuWQ+i
	nBSFSRmdrmSBBvrn8Q/i+DiJMs6+Vh3rI0iUxHjbw27toinqvnhbhNeyzYSZbnR6t+lsxIWAnTk
	dUeKn93nKpy8o4KbzGSpHXa882sn9higMQh9lLdRImfr1L+42e/5WHWgc7PXl6Hi2jBMawom9Vm
	n9cg==
X-Gm-Gg: ASbGncsrxOB+oxf3hfbDVPb8ZgzOsC18+t8y+r0jQX8UXZrtCUbAcUnX/8Mj9DE6PU2
	Ma0PjV0vFDstfOJMdUeR3/2XU98TgJC7X9bVNEh3P8inLnOAvAiNUAb55HPjwwz6Tv91kDwgTxl
	9kh4G+SIBIg6FcRv1Uxzwz+aSZ+jTBUXeoNMVlCOO8smazXdiui53ldp5NkOZrNRtrRS/Obwupo
	tRVmtrzCNSQcYN7sNDa2M2DvmXbfGA6CGy4DtCCEDteXo+NPh2mEd25fHUB0KZ9eD05MRQ6ciPR
	n6vAJb9IWTWVaQlZvdOMQP7Ugnzg0s9yFI2rVTRl3h1IfyF6qFUt2BAeS+TlfeGWq1cb3eT8zEw
	cdMyDryNbS/nxebdmkWtjMLqI65lxbPNZOGBHOw==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423751cf.4.1764244084828;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnK3g/Js45TQqWNMcc2jVyW7gCrAWjZ1laKZXs6iAR7ymEJl4EhBft8ZMZWlF9n0vQcP/u6Q==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423421cf.4.1764244084319;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751050a63sm1383268a12.24.2025.11.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:48:03 -0800 (PST)
Message-ID: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfXxjmmqjyYp1kl
 kWzVwfzznEwZ3cLHkBlVe9D4jLydXjVz0SACywgDVcEonzK0lVxhNU5F1P+i1bp5cA5cLCjmZ1b
 VGrtF0dJipRcJUdj1u1KhprArvI3HOBzHqQRTLSFInz3pxFholIlbit0f858dKvVSHWpDykZWMd
 yqOP+LKS635rZuDARt9zs3KkHWAhpIeK5k2hTXNTZPH45+Hu6cRIifKr5a4cGK1rMlh8QeT9Mhp
 kR92+FKzvvti0v7Ud6v6RH77Q+wM4Go//Xx6H51vt3cPwK/995LeNKwnDiVBTeZtPFuglfCmFMw
 yHgd6zz8SexiK5rJh/MYZ0lYN6NGAco2eLkz3MfKeX5PchhYM95J1wMiwVvfNxl+IMvcVi7ai2K
 +7Zl92J9uyQ8Mv1qAG5+1jtVGgZP4A==
X-Proofpoint-ORIG-GUID: Ne6RmlKEhKwLUxV1c9dcr5fuh67C0M-D
X-Proofpoint-GUID: Ne6RmlKEhKwLUxV1c9dcr5fuh67C0M-D
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69283a75 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BwDcOSWodqSW4K7DrzcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_034806_677631_80E6A14F 
X-CRM114-Status: GOOD (  17.56  )
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

On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
>>
>> =
>>> --- a/drivers/i2c/busses/i2c-rcar.c
>>> +++ b/drivers/i2c/busses/i2c-rcar.c
>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>>         if (IS_ERR(priv->io))
>>>                 return PTR_ERR(priv->io);
>>>
>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
>>
>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
>> The former seems to be the least common option.
> 
> As I wrote in the first patch, because to my knowledge it is the
> preferred form for holding driver data which are in general pointers. We
> do not store pointers as unsigned long. It is also already used for the
> driver data types - see include/linux/mod_devicetable.h.

... and in case it is still not obvious: I do not cast here to final
type, because that cast is the reason for the warning.

I cast to an intermediary type to help compiler suppressing the warning
- to integer representing the pointer. Unsigned long is not representing
pointers in the kernel. Integer type representing the pointer is
kernel_ulong_t, I think.

Once you have integer type representing the pointer, you do not need
further casts to enum.

> 


Best regards,
Krzysztof

