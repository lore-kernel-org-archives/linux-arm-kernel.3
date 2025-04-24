Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1337C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=; b=hyaPI09Z6NQZ0VB/MgSVJFddGk
	OgAM0VPownw5fWaZC/p+sy0EAmBqeyv19CBVM0fA5Pw58nCopI+Ojourl9bYEr1fi3BAnOX2oG3qM
	7QRizR2wG8YZKr63okL9eC7sFXSdbLgvpHwu1LGRFk+s7ZhTpWbEzZnAFmLdpXKSZdj5fgBuc3zwZ
	OkDZOBKd++y6uSISq6TBg1cG4B6ES1sFJ6VXWEOcBXZi2ycoeo6poDAaKGtQrguehpRn/NHH5CdPy
	6Dhxb4ir7HHmwsdb5MqjmEDtPkRAgdQBHVJ23TSoa9vVmWUqIQhggWbnz3IwKwaBoEHiGMC18Gr+G
	jbxuDAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80AF-0000000Erz1-3ORx;
	Thu, 24 Apr 2025 17:15:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u808N-0000000EreL-0QjP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:13:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3CA3011256
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 17:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=; b=AA9O/wDPa+nYPvVI
	R4eEslFYfvLM1An7w3T8bZ2pTX0nBASwy5MwVVj/ZIIKaap1xf9/E/v72dJuPRTR
	Sp9cJAALFzkQOOkV5rK+7fibzQU6Y8qid9x22TpViRoVywQHtGWu8lhfBkZ8xTl0
	1ya2vrJ2FnWNnATs4a3fwLtbXL0GBCedyd4Ot6orEGPQzIa510z8ktjSywE1imU2
	NObbwy9H/BQT41Y6TvVdPX3kM8ATat3sSEFEdj1TqBb0OUmixgnEsAyCDqwLvP88
	zRq3wBSX26DpJkxJAGdaxxqTlWQeeOI0lgyFGa0qKu/NiIvxqH6bL7o/Vu89YopT
	pS35bw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ecmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 17:13:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b00ce246e38so1207332a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514788; x=1746119588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQE3mBdHEHFMQzAYutq8p3AN1+1LsUeaQd7+qm3qC5g=;
        b=aVTSkIo5a6Gz7ULUEOUc6y+eEYq7U5HxgvGKBLpnYUiRkHpQ4bgqvmXe4qvvP3QQw+
         JyVirlUAV/BtPJvACJdIzQ5MB36CsKAOsGUh64RMcR7CPU/IeqKMMNeqlP3poguP3izo
         5/mEkMlmnxHu8tWFqJNxqgM++A1dRm6ACgBHsqTIPBNUXyUoq0O8vmR7Q9Xg6B0gSuCO
         ouZytpGVSUHP9oYVG4rYgeXcllZqfr1ZqqLfTgdzq8l/NleEg1iUbFkI1Clw+u25z8bt
         TvwfbahjfEFjZ8gNc7TVF+6lI8KrtzuU9IkPu9JkhOQUHy2i3wY+SKDQ6FNoMvxC0P3e
         crEw==
X-Forwarded-Encrypted: i=1; AJvYcCXz1NGiZjrh/PrR6kXFvIjL0mwoxNFOWnIDobr0m11cTZChC1modegStFQ82/Pcw7bm1jczY/HGxCeKBO25IJMe@lists.infradead.org
X-Gm-Message-State: AOJu0YwPgeU/PZXI7PLuzWgLt1kTXowBtNpKjmwEyYrCXK9pf88yEaTp
	BI+ChtHUqhZKqjwCnLNh3UCrf0obVKbruBFGknTOBFBg4FtR4A8/41cGGDOrN09VG9FCkNUdFGd
	HVhz41cXWkH0yueORTQLeUEDi6wazsVnpKJvCybpez6IwzorrSkfDpSaIWfK4j7f68UUE4O5frg
	==
X-Gm-Gg: ASbGncvdjJJaly0CYT0ZNm2wdIJUB4GBxZMflVUKEQ46PBMaoZbN30bUPsrYxECfa2k
	y/i9jv4xIdS8EjpKmOoAgqFkD/zaGF8ahdOkLWWwtQ9LzurAWiV7ksSxLRqOnO4JhpYrIR0n5FA
	uYp2If2KRAm7osg43yZZ51E5RvkoynC4fscypW/+Ttih32hNwwnm3tBJnDkMuSCF/K9BvLCcLBG
	CeHjguyJUjuRQ74n69xBD8xY3MohoteDHjabeL9NxQ4KK0/n+TAJWVdD5WGuPPhKSMK/vDoVlHy
	PWvLd4sXIzmBjVqdy2L4zmpaSVJMH5hWINlXX2dD3e6HCfMuznDr5PMdnxSKrnRzbgA=
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151669637.4.1745514787719;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBh6UbSZ7iBiPgDos14/2qpkdyV9G45BXz0sSqA0pmze/jGYg7FVG3UwSnpX6n3qo0KD+Oxg==
X-Received: by 2002:a05:6a21:6814:b0:204:4573:d856 with SMTP id adf61e73a8af0-2045658d414mr151627637.4.1745514787332;
        Thu, 24 Apr 2025 10:13:07 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fadec8c0sm1502146a12.68.2025.04.24.10.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:13:06 -0700 (PDT)
Message-ID: <575d63e7-f390-46ef-8687-30112849b442@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:13:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
 <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <2d01bcd6-80e1-4c15-ab23-b5ea5b90f2b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xRijgJXW5v-ehI6nJbfHygvAfebdzIiM
X-Proofpoint-GUID: xRijgJXW5v-ehI6nJbfHygvAfebdzIiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExOCBTYWx0ZWRfX7OSj0vLv4M8h 0dAQ6ute4TANcqiCppneE7nU7614VSITsY64uepcou+WtAGE0QcMiLtR+iYIoKZSXnquLcVC1hA +OfOOuRkso224ubQJKKIhOff9H3NvFeV7vQZekmcOT50HV7AOJvK8wVTnJWQYhTdr/c15trRH7z
 8JjdVRw2qzpb14NpwdYZemNcHomJYyz7X61wV9YOM15sL+nJQqfzkmhendGj3YeBNE66vbmnnHw 1dlCegrW2scNmOlmrg4rTprtNtvn7evU1AR/wBVOb1Zsbf48o6i9RuzXHlKxR/2LnJ6dHKdIngu e3z6/LC72qZ7n3R4JxQvCCKkvZEFlk1sje9gAjZa8CUp1ywVgEn4c8gw2GDB7f69HmoIDMgOmEY
 wURjQwQKE333AurEZIQPdh7y9n2NoyJhBIfd4yVFtLZ3+V4vbqETfSy9LgaCzR9vT9d6sUQg
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a7124 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=SMseXh0oWhwDNy9TrckA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=822 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_101311_165219_C0AFD5C1 
X-CRM114-Status: GOOD (  13.08  )
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



On 4/24/2025 6:16 AM, Krzysztof Kozlowski wrote:
> On 22/04/2025 00:00, Melody Olvera wrote:
>> The SM8750 SoCs use an eUSB2 PHY driver different from the
> Qualcomm SM8750
>
> That's a defconfig for all vendors.

And...? Apologies, I understand what is actionable about this comment.
Please be clear what you want done about this.

>
>> already existing M31 USB driver because it requires a connection
>> to an eUSB2 repeater. Thus, for USB to probe and work properly on
>> SM8750, enable the additional driver.
> Commit msg should mention which board uses it.

Sure thing.

Thanks,
Melody

