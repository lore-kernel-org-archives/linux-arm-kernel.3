Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18488CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YH9LQ4opbrfuJGfdLV9HqMypIACkhbjKtURAqLKFt/4=; b=kcHzEji/CiEJdXnpDwkQK3mMFY
	vcMnG+S4k9wyi4mn+H7qkPfrxUMWGjHjl+p6E/yRtoBX3QnyvyM69O+v0IwrZsFr+r90O6GM1Kc6N
	B0Qke2M0tSo2auDaBxJeyCSNVRf4gJURYU5DZX6EtttL2FAta6xotXWlqs/L+9WwhEeOw1q8oj4Z5
	8M93H4y0E1eF73qWwTlp7x4+Fbfi3YI9OJIrgTgIvhI/5MZYBxQFYAEr/rOqZMNWwLD3DLrg5m74e
	7JqNE4/TAQgYb6V/yF3Jzq9zIVRiZZH8oQdo53cj3IZ0fRzHZbVXD0eTpRCPhx1PkVCSJbl1FJlk3
	6Ei4HlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fcR-000000072wT-0KgW;
	Fri, 17 Oct 2025 08:15:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9fcO-000000072w7-1zhe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:15:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8FFJV001706
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 08:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YH9LQ4opbrfuJGfdLV9HqMypIACkhbjKtURAqLKFt/4=; b=Mkvkb1I3MlwPJEBQ
	66u9AJqRdeR0TJJZTusSOV1YG0xjxHB4yJynHCeVrX13u5Jm+wc3jNUgPKHhNql0
	hEN5cci28Sm0oilDpagXP/GHWfFag4ocpucieEkYggw3KcLas7FovdyDy8GiQA3J
	rusFchAchzJPSt3qvBSvxpeAgwl+CuW2PMHhbkY6jW746quObgtTOpEJ3C036VzF
	ggIKD+zLw4kKsBW/xizl+XEjHd+5dOOqOOt/BIl1qYlI+sE0J62C1NoOtUtahxw2
	L9H7MHOilMzOsE97oKL5v0UlIhm0L1P1jVKl6YCag79XCXLc30EySXaAaP+NBdhE
	Lsj7jA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9bgdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 08:15:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88fcdbdb598so64117885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760688918; x=1761293718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YH9LQ4opbrfuJGfdLV9HqMypIACkhbjKtURAqLKFt/4=;
        b=CjTFNu6Ii0c/6gqIEAgwqZ26NJC1YvY+eeIr0Fotonul77OtE3EGRMsiWzXJnuk2i4
         8E6dnT9CCKOM8PO4x6BNE+x51q5a0Mz2mQdwplezn3QYEz3khenoPis0u72cMAHBUNfR
         kb1IYBrcgeWvuo1LIyusjcIUU6iU82hXcUjagHXic3poPLU3pjgNVhj1c7YnTGjadYtK
         Dw3Yf/ogepHLXNwhnAxlDHg9PhHBN5Qjjqq+fvfr9mFmgGMeidngr3fxu7zcOCOEKWXS
         osWlu8hovOMt/4lGnCrUp6/4GwMvU9MpReJvSX5bjKxs5nUUctJgYtLRPQDhgYRhZlCB
         I8mQ==
X-Gm-Message-State: AOJu0Yw5DqwGRfkekZcyAyU2KAein9QVQmX20H0kN48BT7ilLGmNR8MR
	RunabZ0+7GaAWr5nold/oV13qxbQ5+JB8uWUoEGPib0FV+QPrQdZDCxb+KiFfhJfK/XZ2v4390k
	kbepWhjDBfPwiWQRtEha6+wzD3p1jwb+fNLXUs8iOD5mjiawe7g4ksP7bEyGcwCfeyCJJ9aeBxt
	Vb2w==
X-Gm-Gg: ASbGncuNYpp59Zn0FgbQJne0paTM2c9l8A7Vi2ZeqmWGGyOVzeVObpZ4mO+x2T0DXu1
	IyddHU0bb2pplpY6b6Rv/qtL8/005FxQNGG83UmOA/gwkOIHQPihS4idJQuY91wq0C3YDZGXTOo
	4SJvhbaYXVBXQhqtechY3RLTPlHEvPxBnNzSjjbVXrIopRHpj/7sDqk200j4IFwraYrHtJue9mk
	zbB8rMk1Y5j+ApiG0aiQWYkOZ1QoLyAu6tyOFz7/eXYE+aw+lihXXdCe0OU70+OBpgFiX5qyDam
	kQy6FvoH8peap850ilstQjooCzhL7h9K4PZJDTEo7nRjO0Ml/8Hts4IfiCIf6ZZ24xJG6ljYs3N
	HNcjtLTAS9d/mMSqxywqMvxh5lEMTG8bTpH0v8480fJMfnN/evzQNP5SV
X-Received: by 2002:ac8:5fc2:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4e8a0012877mr15378961cf.7.1760688917695;
        Fri, 17 Oct 2025 01:15:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW30Y4pQiOAyQMWLPe7O4NJYBXWqsckHtEv47TZ7+NBWOm/H3wXN4WXNlx4940VABaCGsNSg==
X-Received: by 2002:ac8:5fc2:0:b0:4e8:a001:226d with SMTP id d75a77b69052e-4e8a0012877mr15378691cf.7.1760688917157;
        Fri, 17 Oct 2025 01:15:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c2955aff9sm1041827a12.7.2025.10.17.01.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:15:16 -0700 (PDT)
Message-ID: <0a9874d4-29e4-477e-a675-c4534658f9d9@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 10:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das
 <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
 <90c8dda3-f753-43dc-8bb9-d03a808c8704@kernel.org>
 <38b8468f-5006-46a3-a4ea-28e6692ef14a@quicinc.com>
 <03ac36fb-a227-438e-bdf6-f787e26008b3@kernel.org>
 <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8580ae8e-50e9-481c-b9f3-125b6d1cb494@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ww0vOxApmfo0gBdA75sD8lWW6_ZG4ijg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX79K6+3YCoJzc
 uUJTgLmzx7lfghG3hJwz1JdMyG9ZbOFX88DyBt1S2L+upQfN2UbqlXTah1r0TARajYjkaVKVXVa
 OX9gvQwWMTcC0I8WelYv7oLgiQ3LtyVa+JH35vWFdxktzqHPLsufBGoSjijx2NWB40qyjs6Liz2
 Lg/rGM2YrVBft5ju8b4klMEP7p/JAxmmp24fd75W2KPilvRgHoUaXpFbvQY10OJMTzAGscSGH0r
 ClqFgXz/zx69UHsz8tCfscks0FflvcAh4iNWAk66jJ0m4X5r6S+9zxzsYisPDtgH4DdIrzX1TmV
 mP2JSkRZYoF2QPslWeI+lqkll+misTSR2HLrc98sPuGx9iTRCzjUkUHZQqwZYiutkoRDUWQToXa
 AWWZwJw58b7kpsJ4j+5rsEhg2f9Zyg==
X-Proofpoint-GUID: Ww0vOxApmfo0gBdA75sD8lWW6_ZG4ijg
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f1fb17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cKZz56y0KD5bUEMw3qMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_011520_522001_893D2A3B 
X-CRM114-Status: GOOD (  17.29  )
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

On 10/17/25 8:54 AM, Krzysztof Kozlowski wrote:
> On 17/10/2025 07:56, Krzysztof Kozlowski wrote:
>> On 17/10/2025 07:49, Taniya Das wrote:
>>>
>>>
>>> On 10/17/2025 10:51 AM, Krzysztof Kozlowski wrote:
>>>> On 17/10/2025 07:16, Taniya Das wrote:

[...]

>>> We have tried booting up recently and and that is what we observed. The
>>> patch from 'm' to 'y' helps the UFS probe is successful and the rootfs
>>> is picked from ufs partitions. I will add these fail & success log
>>> snippets in the commit text.
>>
>> That's not enough. You need to explain why UFS fails. After explaining
>> this, I guess bug in UFS would be exposed thus that one should be fixed.
>> You just provided band-aid without fixing the real problem.
>>
>> NAK
> 
> 
> ... and to prove your analysis is wrong (because your setup is likely
> having issues) I even tested now linux next with defconfig. Works all
> fine on next-20251013. You did not share which kernel even has this
> issue, maybe some downstream tree?

Is there a chance you have the TCSR module packed in initramfs and
Taniya doesn't?

Konrad

