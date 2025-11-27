Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9CD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=; b=CoDoViceHoJGzdMLeBp15IUtPN
	wumcyFilrhpFqFpxnLGcfqlfeHjU6ane5mNd0KHmL6WpuprjOpc2yGG5YtY9dtJYyB0v3bdDQSKsY
	gnvjHkp7AH8RbY6B67cOqP0MAXDlGScEFt7JYWzl7Tlw7zAZpwqCIdusTn4mk/X4tiDMJqMaK0ibr
	raZRwJYc84u6dV2c7L9vxZ1eC54cBqHridpLLgyr4ia0j5i447reI3Toj1PaihdU/HKGISCnIxr+H
	qfiZw0sJxAsgIhBecCSuCM5Avg+yrSWxDwBvUBzSW9aLQY+eiBeRWO1l/itlSszAM/EIsLtPv//lN
	1Q+V4K7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaOF-0000000GTVZ-36Zh;
	Thu, 27 Nov 2025 11:42:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaOD-0000000GTV8-0W6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:42:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9UFsB685271
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=; b=IRkc8HwRf5t7IjA0
	RO3qR4JTom9HCGU4kHWfC6UTBxTo28ohnb89ooAe58qMUN75GeLNPD9951+i26Ep
	ttU/L5I03AxHOKkdT/TtKr4xz5maA6x4iCN5jOPA+ERGodQwVV9kYEQzTG+++fH0
	rLvRPW1h/eFLAhCPjsWKEOW6Y+ktEAElJe+CmEppq2CyTSh1AOqpLmUWQOs4613p
	Zzs9JNDvZnCg6eG/RyjT1fAh8SwsnpQAX0PU5WXMMeZ3LU/M1vbhuoIU4/GD6h/z
	Y5LVuqMQ2Wz1qa+4GaIda0HnGsT+dXUg27SPBC7zz/th62uhUdwk6OyZgvK14mNw
	bVTM/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rrbq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 11:42:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e4b78e35so140318685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764243738; x=1764848538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=HcN6nxyUlZCyxzp/UoF09cbBudXCRElYz0HRGUcMF5Nj7VJHhQdzjG45HrKXMFmQuR
         MyAhL5qtsaMqhtcEE4sRiFnxHhCvS/8p8pY0KlAoftHFuRWfFDhmUED0WF1aHgZrvnyH
         5enlDDRM0twK9v6N0uCH4F3U3QRXdxe7OXoNixfl1zYvzvzMlnNiva3Sa90Cn0AqqNHz
         f5TtldVDp2r4/QpqGGt8U335msowy4L2ZiiTwJhWZsmVDvpBNr5LzlHiKP5Tft/FIVxO
         1DKo5IaXo8o/s2tOafqyVDzl6/dP2nHoxRUBVphgRtbGKCzkyUEFpzvtV+3bB9qe5c7Q
         iTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764243738; x=1764848538;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/92bqtvgAxvIabGbLUTwTlYWV1H5f0gHUXTStPmWSTg=;
        b=vX9biILhE3d1QGKdvovGY8xU5/CR5SK+WB+82J4QZASM1CRdmq1R3f570g3tpTedUa
         eGPA3fgDHEgv2Vh7ZuqiVVdCs3QvsRVMwmSLjg+hHguJF4ls5Zmj0xg3I9eUoDvUElCV
         JuI861KIqm3JZi5Ib/CIDWU7QOxcuXRYtn2CPBp3Uma5iL90vB/94dzHqJfQQvb0dRYS
         JzyenHHAjAtmm7K3Yd2UT9vBPi1ztkpbKJysu6nN1FMqiVr5U/UqUS4mxeM+eseskHuO
         oSSL3hFKTzWFpL9BI+S62O/HNkWduMUpzWcf3lCPoYcRM2xkXFJlaGofKDf7++yNxW3T
         1hcA==
X-Forwarded-Encrypted: i=1; AJvYcCUpIyoiJxzfVN3SCO0PrgmNSXXgM4wTZfXmcdnlBFYRxiKbZahqcpffRGffqp7PbkDt1ZogFsRyMpBPXcBaeGRC@lists.infradead.org
X-Gm-Message-State: AOJu0YyCp/HwO2Cwqpo0xk2zUcT+aPmkzwJL34/pTwS3bBtcse3HGUsY
	AIinD3EJ6h2abQrlLpC2tKSpbNPuChmz1yzZiAEd8ZmK8RWejw4jrLD959VMdmmCgZfL+rymHN5
	ZvRlGBBFbIQIlARzmMkIj7klMp8yl1dziwzukwN0LLHM/6XjWxadWJVukRnYh/UyR0tdT5t25og
	exqg==
X-Gm-Gg: ASbGncvph80jyYO5JcaVpevwpqEoTu4/zyzckocoYDKHiDHOnjX/mmn16fMwhOZpeP6
	+WvRdeBHsI9GQyD3gQoURKQV6BPF5QQry1FfgRLpZzB9FDv2xGA/O4F74DYCYe3jaiz7/CnVfeg
	Dajr9J06acYEvQvKIMAnX8zTtuBpCtH5T6XOFXhmP+OqM9BHIxTMtjeX5n/Jw3AgCPrys2H+Zre
	vPUnbhUPXNJD+74Lr0HBUJZjTD6GEqiQFI9fqLIf3Q7q1b4cCf7dZP68ll1M3sO+UsbI/5vkfwG
	90pDSHkeFwb7WRpbHlgMD/F47ldozfetCNzkgFdm/1tk9gqd7M3DNbo+ytPs+OTdP2bXB7kuYIa
	/D7VGAO+Poq+iFPEV0z9VNLHxdiLU3uR74LrwJA==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333096585a.37.1764243738278;
        Thu, 27 Nov 2025 03:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLHuJkpysrZAeyvEty4uFC8IBgU2xb/kZ57e2oHNqTYOlrQ2/iZ42+5b2yAz3us3STsiX/Pw==
X-Received: by 2002:a05:620a:4402:b0:8a3:f8c2:5ee4 with SMTP id af79cd13be357-8b4ebd821bemr1333094185a.37.1764243737838;
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a48c7bsm137242466b.64.2025.11.27.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:42:17 -0800 (PST)
Message-ID: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NiBTYWx0ZWRfX7EqOiY8RHeM/
 IniMpnl5tIk7GymaSvFKmWH0X1g0mHOrdrtaQbGAIc0aHOL9vP21PRKPWAbOlexkJlKfu70pDef
 qJ5ZXhdbujzFk/UslldCvU/9URpbTK4vI2Q0A2yWZlys0CMzAxnqkBhwRzGi6ae138DJ7svuVzb
 PubzbORcL6rtFN7X9SUhieKpAyzgtH1r7Kq8xjh45AOSpCooPEQ34sJfHnMEL2XLW8XM0T32cDZ
 UtXnnt7Nfh1dWE7etqyvn991sZlWxHcSzQijTK6n10QZoPHXqANfU2pm+5wV67xrPvkGCD68Uzd
 ZoZpwVJJDvYviasEKBFyZsvHCPQbVciJaVvOnDS7y+j3vvDTNbJLME7BETnEHNLV/VrnNqYpTpl
 ph8BGs3vJle1HJL3FtuoLJ+70G6wyg==
X-Proofpoint-ORIG-GUID: 0LZQHab03_ffmzbwKwqz8BN7y8zY7-KL
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=6928391c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l25Wfm-L5A7WpkZik0gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0LZQHab03_ffmzbwKwqz8BN7y8zY7-KL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_034221_209695_9ED8F23B 
X-CRM114-Status: GOOD (  20.41  )
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

On 27/11/2025 10:02, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
>> clang and W=1 causes:
>>
>>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>>
>> One of the discussions in 2023 on LKML suggested warning is not suitable
>> for kernel.  Nothing changed in this regard since that time, so assume
>> the warning will stay and we want to have warnings-free builds.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Thanks for your patch!
> 
> =
>> --- a/drivers/i2c/busses/i2c-rcar.c
>> +++ b/drivers/i2c/busses/i2c-rcar.c
>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>         if (IS_ERR(priv->io))
>>                 return PTR_ERR(priv->io);
>>
>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> 
> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> The former seems to be the least common option.

As I wrote in the first patch, because to my knowledge it is the
preferred form for holding driver data which are in general pointers. We
do not store pointers as unsigned long. It is also already used for the
driver data types - see include/linux/mod_devicetable.h.

> FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

Because it is discouraged in the kernel.

https://lore.kernel.org/all/2023081004-lapped-handbag-0324@gregkh/


Best regards,
Krzysztof

