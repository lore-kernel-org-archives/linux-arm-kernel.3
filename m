Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5296E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWaRHTtVbmK4IJGdoyqpW+GmjdnLJECmOOkFb8wysIg=; b=n+zAys7m5jroKa62N8nIm5ohny
	UcifFqQspK6++LHYlONYdg8UkWNGiMhdQ41tmcN8ji8e2b0jaYNRdUcF4ee/rHT3+OJIBJw56U/H2
	glV151FeF5ij4tQFJikqwJW9LbmxJvAWkbgIw+gP3W9YB5pslQuhLYzqEaDjucZ5gEMYJPMGIxcma
	2crn5VNe2HMZxJUcKrsP27Cw7BIcvqg5SWNGomSYAnwJfmXRZjKaJcEOrmRA/pgbGT+WVhmuSFEl7
	ZNoV6yL/EGoRP63/bUO2MWyxNi60/1SgdN2NugnYN4w3RObAN0gnC3wOs2FzO/+jkHw4+sEFDIOrv
	mY5ezwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ78y-0000000FAFA-0u4m;
	Thu, 05 Dec 2024 08:23:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ77q-0000000FA2R-2Zsy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 08:22:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56WQ90010083
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 08:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWaRHTtVbmK4IJGdoyqpW+GmjdnLJECmOOkFb8wysIg=; b=Te7OWJPZinloN6J0
	uRVTa8Cyn12VLWn/rJaYyDjHZcSRZHYD3R5uZHCBxhWEIAZRVwx6D085g5jPJStB
	DW+SV24X82KPLxesBbz6gcBgxYXjvuUa1tG15zHcE9SZG1HPmSvZXNxWlh+4+0sJ
	1h9vNHtIrltdfh/y33g1vHW+M8opxE+fo+3ymnhBKxrfOE0JAdYP11cjpm/HN3qQ
	WQs5Bn0XiYtFnNG+202Gc+28/lp4Jrpvo4siTFej5opdtbTRBd7uKr+KzZ2rmMD6
	UF2R9Fb/XnvxBl3MuVDkFjw+Dco5fVT55G2L6z6UhJYyLy8x2BTaFDYGyKCkDqlX
	AtQRUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a4by5hp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:22:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-215e578b971so9969495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 00:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733386934; x=1733991734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWaRHTtVbmK4IJGdoyqpW+GmjdnLJECmOOkFb8wysIg=;
        b=LrqwvaAes1g2m+KKH03DTMTO7vVtH09IarD4CsBhLwBOpt1pqEroArE8+HQiotP28x
         hezKsxSehiGiWJDWzRt43CHNb/vyIobGpK8WMqPt+DMLcZ5lC0uTERh8OBeDSu8OITnb
         PLBuKVoGjFGRkeZAdim6trJKjIdqMtK28WjMZ5Sm1HYe2oZGMf+Pd7ReXZLcs9YNefmG
         qvM4MRa0/HF/HnbMmDYaFAbaBQ7EW2P/ikErszUwH66jT6hkykTzmsuglkEivRcys1FQ
         xpWSiM5Hf/Z6UbDBpchHiXtQrpSXEQLLafRfmKPBmKu07bA8F87w7hpKoTmuWaRMIBVK
         irTw==
X-Forwarded-Encrypted: i=1; AJvYcCWPFJ/Tn4eGyguV+k9yDVK4biDzJ8qjSkol7XdnsMLtpZnkkQ5R/XtPQ036xUHTPq/h2/2+DmqwlQFYJjGH0LTr@lists.infradead.org
X-Gm-Message-State: AOJu0YxHMdCdOBdqQuh46qLvnsBU92Z5qA3ZP1lzyh7BNJDaM12VqFra
	x1sNMbjz/MPZYaIwMyDvguT8AKUVWOG4KfkEokU11nFekYhc59VZVm1v0SYIe0ujqg6PV9UtxWS
	mXNrKAgl8ZVM0Vwvg/wja+IR6LTcKRB5bGdk6+W7TDIVa0zy2Iaj6xmpVVn3tIXjeWTPjeYKU6Q
	==
X-Gm-Gg: ASbGncuO4lyL6/fM46g1dRDvnnyjy4ll5PLfv9eYzDkmd6Z5rokKYKNjyw+B2Lx+6qo
	u7EkEx2vdtazrYFsSBgONw8pz1EnwvEsfXKVtRJL4qd9mbKlSq963tqQe2dzsn55RVI6osKD1Zq
	cHJrSQBjjf8x1Jy0TBMVovE0X207raBqq53T/I/yk5CCtppOZy3er8BzN3d+neugQKLDx9Be3uY
	Hi4YG0KUf7ruEkIHuajLnAgSylZul1BcYk5ZEagq79DLXYDonl7cc5c73NGII6MgLFMFBsSCPYU
	PGEAmQ==
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr127418115ad.46.1733386934486;
        Thu, 05 Dec 2024 00:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcRbCkAcP5idjPLoolO7JpL2Ap2RjFZcB3DOTS1QrZrQiXx+rK9bxRV3fLK3OocETika1fcw==
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr127417835ad.46.1733386934119;
        Thu, 05 Dec 2024 00:22:14 -0800 (PST)
Received: from [10.92.169.167] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9ea6sm7453955ad.141.2024.12.05.00.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:22:13 -0800 (PST)
Message-ID: <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 13:52:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Johan Hovold <johan@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
 <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S3VHK4ECZ3EjLeXrqkt1RMG4-FMPSN-t
X-Proofpoint-ORIG-GUID: S3VHK4ECZ3EjLeXrqkt1RMG4-FMPSN-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=685
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_002218_766649_1E054933 
X-CRM114-Status: GOOD (  28.79  )
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



On 12/5/2024 1:46 PM, Johan Hovold wrote:
> On Thu, Dec 05, 2024 at 01:32:29PM +0530, Krishna Kurapati wrote:
>> On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
>>> On 12/3/2024 3:50 PM, Johan Hovold wrote:
>>>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> 
>>>>> +&usb_mp_dwc3 {
>>>>> +    /* Limit to USB 2.0 and single port */
>>>>> +    maximum-speed = "high-speed";
>>>>> +    phys = <&usb_mp_hsphy1>;
>>>>> +    phy-names = "usb2-1";
>>>>> +};
>>>>
>>>> The dwc3 driver determines (and acts on) the number of ports based on
>>>> the port interrupts in DT and controller capabilities.
>>>>
>>>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>>>> that would still be there in the SoC (possibly initialised by the boot
>>>> firmware).
>>>
>>> The DWC3 core driver identifies number of ports based on xHCI registers.
>>> The QC Wrapper reads this number via interrupts. But these two values
>>> are independent of each other. The core driver uses these values to
>>> identify and manipulate phys. Even if only one HS is given in multiport
>>> it would be sufficient if the name is "usb2-1". If the others are
>>> missing, those phys would be read by driver as NULL and any ops to phys
>>> would be NOP.
> 
> No, the core driver still acts on these ports (to some extent) even if
> there is no PHY specified (e.g. updates DWC3_GUSB2PHYCFG on suspend).
> 

Yes, since the port count is obtained from xHCI registers, the 
GUSB2PHYCFG/ GUSB3PIPECTL regs are modified regardless we use the PHYs 
or not but this is still fine. It can be considered a NOP AFAIK.

> And IIRC I even had to specify more than just the fingerprint reader PHY
> on the X13s to get it to enumerate. I never had time to fully determine
> why this was the case though.
> 

This might need to be checked. Did you attempt adding each phy 
individually ? Just incase the first PHY is not the one corresponding to 
the fingerprint reader.

Regards,
Krishna,

>> However do we need to reduce the number of interrupts used in DTS ?
>> We don't need to give all interrupts as there is only one port present.
>> We don't want to enable all interrupts when ports are not exposed.
> 
> No, the interrupts are still there, wired up in the SoC, so we should
> not change that.
> 
> With runtime PM eventually enabled and working as it should, the OS
> should be able to power down any unused ports. And we could also
> consider marking some ports as not physically accessible and not
> connected as a further hint to the OS that they can be disabled even
> sooner.
> 
> Johan

