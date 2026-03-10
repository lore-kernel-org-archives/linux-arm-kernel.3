Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8128EF3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lsni69Po+pHM5h5UCDeCAT4md4UoGXHUo8pfVC9siEM=; b=xQAeKfSs1QW7OWlbO4QyFVryji
	oHh/mbL/VnLAE/s+VxYfK/KJuJDwLZXRmCFnc0wWvPrJj9bHEIFEiSwauh4Sa6CVjM71PYskRfgV4
	PPSFaLv3UOsYH1gNOHV9vbzMdpa3lsGAp2N4oSFIgsfqocjGALJDoXh8JQBG537Jyebsh3WNpJg9M
	5my81ZKr9WU4Cm70YWfib1Og7HVicw769Xc4OYfSR6Bx8Nv2/amoTVvdRdWPiMnzw+wINoqdm6xy7
	8Q5oQMmk+EzKmcgn0RBFYOx7kE7xHmCQewovnlZR5Xxcnfmmdz3SQeu5x9KcczOyR4QtHm3thUiB3
	s934zy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztxN-000000099fS-1NBc;
	Tue, 10 Mar 2026 10:04:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztxK-000000099ex-0eCf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 10:04:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8psLF3691782
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsni69Po+pHM5h5UCDeCAT4md4UoGXHUo8pfVC9siEM=; b=JNlVwaOfNPIFmr3d
	FERtjyztOKqH37mnwf2FF1Xl7umFEz9hA9BrGFb/kwos5OIKvITZibJm+kuuKce4
	EhPY2CzAbyFMgPI3oyLxat0CvzZou68lb+sr6L7ChExZX21AMg8DQsTrrNE7sVT/
	IhRuarllH7ECARiN6vcgvHJt1990zbQBqwWywALb20v+5Affqgyv9IxFCkDgxhSm
	SN1G/eTgvORqvLEeLCgaxxD4Xfb7ABZeNmSXRAv3ZkfxDh0VlMavlVVTNOJJ9KsU
	BUmmE2HbhERKGCglKEKVTN7A99OnDI9jq8b8h3/2CxS6p9mASx5E+Om+gd80OiYZ
	A+JqXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ng9s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 10:04:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso10622171cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137088; x=1773741888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lsni69Po+pHM5h5UCDeCAT4md4UoGXHUo8pfVC9siEM=;
        b=LDApmFvdutQVAoCpfLr2Sk65hpoLXXLqf5DwcSUWjgoigZtc5LBvHyJEAnpoyKp8hn
         vUk5xNgdaCepfA8eAsk/ePMkCwd/peWtuckt60Q+ei9NHkbkbljL44dPl78M8tQIBM5/
         snE4j6c1u8Y7YhRB4SIj9fNoAbat5fH1FtZybQZUImUqGgkTDlh87tKsd+ItbWgp1jfT
         lvK+e12xFnC8OFZrvHi5Q5d/jmgp6zFUCzZ9fKTGX7RrhVjcI5hDp1Y6kAG7noEQSX0S
         ypY0jr7rQx0dF3XC4JGvnaJBThDi1lvkgZwjDWQD9Jn+HkuMj4NaoI78VGdPrBaZh391
         o8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137088; x=1773741888;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lsni69Po+pHM5h5UCDeCAT4md4UoGXHUo8pfVC9siEM=;
        b=gdfrScJa5i2ALjhZ3Zsz7Q7PLW+Msz3ZN+KiGNLMB8xOwVNEtBR7cilkx6EmIBAFV5
         OoUMFCeR+jYsL7+/Fe3QrPNypf/RpoY0UtJGhYD4RF50Ojmy2bByCee3TkhljnCp8UWG
         MpNnCBG9eLaHFYfTSnQsKoYtVC7Wuf/ADVaKKowRq3jVqMhBtRq1tpvnvofGtZBcMCVU
         a9W6rudLORC96zzbEx7gpOWnz1qiXfNeR+hmMefOralMXJVhq3qeeh2dOEdoKhQblpqC
         QoJav9tgQ6PlMd1eAMucv+5Rr/tcKd/QLY2JMb/9Z+jUFcWofgXAP8J2OGeIDe+dYj48
         UcfA==
X-Forwarded-Encrypted: i=1; AJvYcCUoA7VHJQ3AVxNf3WB4J0tv/DEeKyfb3oukTZQsTXzmyovL8sErULo13/QgpMh7QYRQsGbyr3iMoSkL9XMkAM6S@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0e1PfJibMws5jskoNNZi32MMo2Ky8ciMWSiypksEAcvAYAUUS
	N6+T1UTjsr3LvIAX1wyMkfggmTotY9OPezOHIKiwohz4oXP6tt3zRSTVKBAwToW3bJiGuoAksGv
	NJaqcHSEr+DffqhVVFlA5IfNpP7cc3ri7i7ydK1zVKN5tkOiq/VDPSxxZVDS6LCPfvYO3bQa6Eq
	xDkg==
X-Gm-Gg: ATEYQzzPhUY4rXWofNRNaSvvqmOtUz/ECi3ClEpRsRiK6u50LbulLNiFAcGi5+9f1s/
	W6UP9cR4J74GjVcZI4iR0Hkba5z2fpdZsBFVflu/RfXWXaq7pVDpU2CFCB/XED4L6gxEGjnMqkx
	GZUNKvRC72/XMOC4Vpjhgn6rJIR5IVMmEKsXnpnHr7tQQ8A13NbalwnmswBMknGK44nedQFJJ5U
	Q/xz7+R8m5H7LUYO/vBtFxDFQHMb6vT2966riG33vULmNHXD3crZeupSuG4x3KFyV1/GrGpcPpI
	HEhdV/gNiYb2LKNwbVTLCeOfrglVQJucUaSq23vOgep6bBjh238U7Em+Uv0TkmTgbAI1yR8vgt0
	PeW5e4P157MSUh15Fo+g7JgpQ6PTV+2sorElObkJdT/tsPMZ3
X-Received: by 2002:a05:620a:44c2:b0:828:aff4:3c03 with SMTP id af79cd13be357-8cd6d513470mr1746364085a.61.1773137088410;
        Tue, 10 Mar 2026 03:04:48 -0700 (PDT)
X-Received: by 2002:a05:620a:44c2:b0:828:aff4:3c03 with SMTP id af79cd13be357-8cd6d513470mr1746360485a.61.1773137087973;
        Tue, 10 Mar 2026 03:04:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853616a085sm96699075e9.3.2026.03.10.03.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:04:46 -0700 (PDT)
Message-ID: <47eb0935-7dfe-43da-a93c-9ef172ded260@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:04:44 +0100
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
 <a7784864-5f9d-4403-ad66-841682315049@oss.qualcomm.com>
 <385fee0b-5cc5-4fca-a109-47c47ecae6d4@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <385fee0b-5cc5-4fca-a109-47c47ecae6d4@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y8BSXzCKgkjfN8WJxQO4_MmFBpYtzBvB
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69afecc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sozttTNsAAAA:8 a=_3wtw84zKy8Uk4012GQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: y8BSXzCKgkjfN8WJxQO4_MmFBpYtzBvB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX1DSbCFhj76v/
 rGEG5k/qISs6kmK9VHFaVMocO4wUo+rcJqC6v1FAT9UQiiZX1yOgX06Rda2r8Jn+nV2aP84d8OA
 iFoz2oGFNW9p4SHizJZHFgFWdWNP+LnP5PWXFjE06fq9cQI0ylGlskbFzhnw7N2yueJawnQkVCh
 JIo4/LhYwD68Gbii9KDz+jjQV5oBocl6uyHTe24qAWBxqGJJI1kldmOP6Qv0EE6mDqA5/vzXysR
 OlzRo0Xb8jIXAJcwfzJE7+D6xdbR9H0+E4KXUGGh1SZFbzpQjIu4YxKUt4WdXcKrbzyqS3nLuDG
 1wWArUlzTgp7ySpHksRNrJXFJwm9mhl8EimVS4/Y+mdWjOQTkxKsivaIi9oB6mYClXrtTdtkEYp
 m9kvnkgw6Coiqw/PEJt36lHA54nKvfrOUAzlOLMUV51tJLvoaPILsowbQ9U4d60ShfGVkDM5o4f
 S5ZxTtWdiaKaRrDOVsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_030450_313236_5A6F5317 
X-CRM114-Status: GOOD (  21.25  )
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

On 23/02/2026 13:01, Aksh Garg wrote:
> 
> 
> On 23/02/26 16:55, Krzysztof Kozlowski wrote:
>> On 23/02/2026 12:17, Aksh Garg wrote:
>>>
>>>
>>> On 23/02/26 16:36, Krzysztof Kozlowski wrote:
>>>> On 23/02/2026 11:46, Aksh Garg wrote:
>>>>> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
>>>>> the Designware PCIe controller in the Texas Instruments AM65 SoC.
>>>>>
>>>>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>>>>> ---
>>>>>    arch/arm64/configs/defconfig | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> Why are you sending two separate patches one after another?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> As both the patches does not depend on each other, can independently be
>>> reviewed, and address different SoCs with different PCIe controllers, I
>>> thought it would be better to send them as two separate patches.
>>
>> So twice more work for us? Why this cannot be one patch?
>>
> 
> The only commonality between the patches is that they both enable PCIe
> drivers. However, the patch for J721E PCIe driver only enables the
> controller for EP mode, as Host mode is already present. On the other
> hand, the patch for Keystone PCIe driver enables both Host and EP mode
> of operation. Also as I mentioned, they belong to different SoCs with
> different PCIe controllers, so I chose to keep them separate.
> 
> If I squash both the patches, the subject like: "Enable PCIe drivers for
> TI SoCs" would be too generic, as TI would have more SoCs in the future.

What's wrong with this subject? I see nothing too generic there.

> Hence, the squashed patch with this subject might mislead in future.
> 
> If you insist me squashing the patches, then would the following subject
> be acceptable: "Enable J721E and Keystone PCIe drivers" for the squashed
> patch?

I do insist. I insisted already.

> 


Best regards,
Krzysztof

