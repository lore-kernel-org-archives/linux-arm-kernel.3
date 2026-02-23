Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930BBEA4FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRVLFOdotJLUkOs8m3oRzAWyWjr4DZI8alW6mzdpqNk=; b=gLp9s4GilLSvPVwCwMQKUf4nFA
	F/jjTJhDXjVhWRfqR70z+nshEXkcv+woY7EWKrdqXLWIOQcq/bmYMJR5eKxBYF/of0HV7Kg4mDo+0
	cmJMSw83p1f/wGqSpRP3/qyx3unbKz/OYO7hqQEFm8tWICfgPfgO6/S4OTJ1iNe+nLgblSh+x0PA6
	o/RrNXEcNmTZ63j9sJjeZQUV1F7pE9RFrF6ESI0BmWWP/zsNAedSnLAIaZSeRh8xjV+DhZPCCeWRz
	xXAUN2Gqk4eqdtxsDHQmHWnObsEUh5BMJwsYkyBWE1DtICi1gYPU0mvoDqFEF6pzkIoZYXEksKVbI
	/qvJ+8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU4P-00000000Avl-3wqF;
	Mon, 23 Feb 2026 11:25:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU4N-00000000AvM-1MaV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:25:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWMkn3733291
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRVLFOdotJLUkOs8m3oRzAWyWjr4DZI8alW6mzdpqNk=; b=dGxdfy11srfnGE3k
	H50PpCNTA93br2tsalTsyXRDREst/LtyDB2nd7VlGlQBqnpQMRFiesIk5ZBI6KoJ
	MnNgGBRhswXHo5UbLJcE/codef2i3hLZ9acsmU8IE35Qrjb4xe6IyNUNFDApdwPT
	1yxbzVHaUA67hhBH8yH90Z5e7Ja5HH9AfYgib4xYDTodN8krGEmLiKi1ZaYkbhnd
	aW75xqkVrjbhEr6wQCidBhjxeDEgRu+MmQYeU3OgjqbUVje1iTBKyuYc271ncWmd
	NhV+/VjqfvdN+rxhml5uNL70+abf9FhLzRyN8hATmX2a2OcjBxiy7WYDJO5IvpOR
	bLW33w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t851h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 11:25:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so6528201485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771845941; x=1772450741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRVLFOdotJLUkOs8m3oRzAWyWjr4DZI8alW6mzdpqNk=;
        b=aEHrzUOJ1h1c6DAWRSZFgTkZyhwyKYkMPngP+co36kRiPmdlNnPmpERh+QZKO9e5oD
         gvDy9s3cCKjwABItpo0TfnbggbFMU5hFSPdLrr+1u6/iRYQPlPJisndmMRHjrtGtbz7o
         PmTRn/TYD/fx2BB8GNiy39yUXr7fVtpAjtfTF4t8rvvYAqCkOE5AbmfylfSYV792jT6r
         VE0saLkf8mMAs3mHjeVsgolTxzV1hZIuKspL4y6BDVBhIdPqUDFEkOy5lNXhRLmas1y1
         fAtz78TmMS8UuPDwyo1YHxsSXXZRWjr+wcF+ELmNPTx+Tooi8oHO6Y5W0l5zcwVXgaa5
         2M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845941; x=1772450741;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRVLFOdotJLUkOs8m3oRzAWyWjr4DZI8alW6mzdpqNk=;
        b=rr6GPxp5tezHG1bl0aJ0pj+T7K9UYIebqBfJR1j2WdeHgJNN3bD9CNme2NaW/lZOdO
         afr/Pj1rhs1gZ4M2oCjVdXPKCrUYnlDT9IG8QhkO51enAEE1GR1yKhMu6HrBCUYKN67p
         xywdH4bGzm3372ymmjepyNSKbbfKm+Sdd9Hu5gFLpSB5FaQNSez3XK6P8gK7wx9KcbxS
         ZDVtGzHzxk9rEGx+wqA69zhqUvVvq7vSvzohDwpkdt9auCCm1vo3hshyYQMYQxpzSb8V
         Zk6gmvx92Xx0xfX+g9NUOeBPaWMzkIxjGnopvoV4YtW2iurAOifG7ytXJtmKNBAgSS4C
         VW/A==
X-Forwarded-Encrypted: i=1; AJvYcCXu7Ju+cLwudIcOcUkMFffVPSSIN26F0zUUGajWtYCCoaB7nsfaLpNvIgq4EJI13aa4iUUwUjTP3fcM3oTkcg57@lists.infradead.org
X-Gm-Message-State: AOJu0YyCb+/ImxvKtjtCbxnNCt8wiBxvSz2ufLxr3Pw1dSblJFU4IUcu
	cr2HqzyxGuewQDuMscr6DLsT6oUu9vgA4cZ3FRompNG7iLhmWBBXmhXESB9M26o0gC0z37Dqt3t
	Tgrkwveb8lYZHsgzRViFGQMrxH0hSOOgvfyIhaXYOnEeJeUP15Dm6L7HHQQm6JJWjjb2EBGltl3
	66b4GIHL+9Ag==
X-Gm-Gg: AZuq6aIrSnbuzgM02XfmBAaeXeDSiomw4m/AliJCtdiyFT3Nlal5uZ5HafwDZF40tYY
	tBxKY9/p0HbNkHIF4BP8KnQjG3YqlKGEqcqPGvtO7v3A7lJgenRE/4TkvmBCYyqndcE/Tmp6yt6
	L+gqOyYs8ze4jfHkR0x2zHm+1Gq+7VkUMPfELQsKMgwuLu3iSAodOuVsWca35A0WZDAMhZWrtW/
	skdE2mDMfkiD9t2krXNCe5I33vk57itxTqSCJ0n6M0XIcsxPXkFrhoh+C5C5VdPSzSkr3zUiIcT
	VvykAgTtrlH+vC7igCUCWZEHtbhWXdobz3/TKWDDrw26TkOx4c9iG6OAyEVveBdhpdkn9LgGK5I
	EDTovOTBThWJEXq+2sZUAN6g9hkKAzxcRX7y/L5Zf/mlLFIcAHQ==
X-Received: by 2002:a05:620a:480c:b0:8c7:f61:fd77 with SMTP id af79cd13be357-8cb8ca7fb92mr1093595485a.58.1771845941553;
        Mon, 23 Feb 2026 03:25:41 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8c7:f61:fd77 with SMTP id af79cd13be357-8cb8ca7fb92mr1093592385a.58.1771845941121;
        Mon, 23 Feb 2026 03:25:41 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm167378435e9.1.2026.02.23.03.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 03:25:39 -0800 (PST)
Message-ID: <a7784864-5f9d-4403-ad66-841682315049@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 12:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and
 endpoint driver
To: Aksh Garg <a-garg7@ti.com>, geert+renesas@glider.be,
        bjorn.andersson@oss.qualcomm.com, arnd@arndb.de, nm@ti.com,
        ebiggers@kernel.org, michal.simek@amd.com, luca.weiss@fairphone.com,
        sven@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, s-vadapalli@ti.com, danishanwar@ti.com
References: <20260223104650.876632-1-a-garg7@ti.com>
 <abcaae3e-c0ec-4e83-9ec1-016f36212084@oss.qualcomm.com>
 <824b8e89-29b5-4313-83dd-141d97451b82@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <824b8e89-29b5-4313-83dd-141d97451b82@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c3936 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sozttTNsAAAA:8 a=HtgZetzbaF7LgnxRVnAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ndqqdm0rVtsfD3CtiV5YjTg1ARLEjBLE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX9DyP4rSfgPQp
 0M3sv+7FlMCuG+vwA0xpm+VAoBry4g3ZHkugCC0K+x+WguxIL9lO8uNP4+j91ghRrUAPoxcc6pw
 LloU/RLawyj573lMhI0l+5agmHAaxvLDVgPe1mUinEw919MuG/Qd7Q68ufJe1wwLq9RBHwdH9uZ
 J+RBRgvvywlQyo3haWk6VdV22WXjVV5IVZmuMPkfBlk8rwBGpiFMfutv4fgNpAdBuP6Kzs0giaM
 tErUfkx/1PrtIXZzIO0ffBT+wIDAETCbjuYgj3eIhwkDx0YV1JqdHZwKl2yJs3ONrfEGsOqZt3g
 d27Kj7MzFkanNZ4cXwT1ytJJiKgWpQ/Ll/e2Q/jrL7GADkc9VlCt68C1i2/bOgSm2OTwyQwddfm
 u3QEQ2Wo1uGprsElYpcgTujRYv3tljAK6N7emR+X63z6S7Pz/hikUrj51fNBlicYp1671jW1b7y
 G8q6VimuF2wctGw1c+Q==
X-Proofpoint-ORIG-GUID: ndqqdm0rVtsfD3CtiV5YjTg1ARLEjBLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_032543_490941_7F7EBC86 
X-CRM114-Status: GOOD (  14.90  )
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

On 23/02/2026 12:17, Aksh Garg wrote:
> 
> 
> On 23/02/26 16:36, Krzysztof Kozlowski wrote:
>> On 23/02/2026 11:46, Aksh Garg wrote:
>>> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
>>> the Designware PCIe controller in the Texas Instruments AM65 SoC.
>>>
>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>> ---
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>
>> Why are you sending two separate patches one after another?
>>
>> Best regards,
>> Krzysztof
> 
> As both the patches does not depend on each other, can independently be
> reviewed, and address different SoCs with different PCIe controllers, I
> thought it would be better to send them as two separate patches.

So twice more work for us? Why this cannot be one patch?


Best regards,
Krzysztof

