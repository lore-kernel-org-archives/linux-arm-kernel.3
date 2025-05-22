Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285F9C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=; b=3EQtyLii9oG4YrfNT/g/IxkrcL
	o4r/0e0szdYyFSVaA9e3m2vaD4wMmnUz/9o+IWYENakxlNUNNlJsQZL+7V1OQgdSRNn2GA73u+V73
	eCJ1bAAidK/a1dy6S6lyuEhlrDEmQN0IG1HE2ORbJZZ/nNQcNU9PlmZzXQR3qNWLa2q9On2y24Vlm
	/tKizudJytU3t3j+SlfBXJTHcVXIsOD8pBdeDrmglul6Ozv8b9oKBV7CR8F36yo1tegZSmD+u06VO
	pFqr6YcmPYJtO2VlbrGtIXqD3ludYrAPDwJWAegGNJ6Oax6HxIGM3BNosUT57CTneEiEUsg1IMjLd
	Hcef0VtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICBV-000000025jW-3WsP;
	Thu, 22 May 2025 20:06:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIC8S-000000025A5-3sSH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 20:03:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF9AST020602
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 20:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=; b=C/wBmMOc0EaTf82X
	Hkwa9K5RpXrO8NvvPOqi+yXeIkOHEOBUO6SvSq3qIqH2ftW89TWV+1EPTk/CfXIc
	A6PQIWlVF0YXyMHJJsQLH3wwxHvESvQJ0bA/+ioTQC+WaqSaLDDZsZZPTJNm6kpp
	Le+zwfBr8gP9K8dsvoFF4DwYzatUA+HWNV8Q8y2CA/+aQu+o94onRbB9VVMbQsRS
	jREeA1PvcpdZD9//f5poEmetxz2tH46W8HD0TurP1HSsjTUhvjPJA44s/6RIPJok
	vmp3g5pkdbPH0rQypJV+RofaugKTeADLjGQtLp9F2wFbhDb5i3iyc1dQ7O5bo6Ur
	yuiVfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb6047-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 20:03:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso206265585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944202; x=1748549002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=;
        b=GtZjp4+/ZOqFcwM39LpizVl3cZs8aTfHLCXAFp6fj5NqAvt5+YbNKieb0V5PBaZhXf
         Xmgu9vbNwtkvp5pC9s6JOsauI0OUPN3c1D0TalQmEI9JHe/cv4qws6AaRW9dZ/3qB5LR
         5Tosxs//ZJNqBD31E9PgEQHDoL030HduHxqxypEIlP2johAKdoAmXOXAnz9sp1EZqJIX
         YGAGb8V9+Qd6QJC8DVh5YEVxW7usqWAkz5j+/gMuAee6goqwoMKjznX6V3wESDCz8EaI
         2ZCzTVa1zfrjUC/FeQiPwT7FT3L2dZGsdkLLcGUv+vKaEiy0OqmYU9Pohnp7+8VUOGz3
         AGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuPuPViyGz5EtD5cKbtDfMCEm/mqxkErPoPhX7fRT+EEiQ+xYM64zx21zUnUOEKqWuMM3sPOEgD59HoiaICyWv@lists.infradead.org
X-Gm-Message-State: AOJu0YyguptCU0+ClKw5dC5DU7yNVi2BwjEMYUWvAQAtNfl67nj9xrhi
	ZwyOjf1va7mpV5/CEA5hRIJpIIfZXZZZZ4prXhpViWbXMRi0Yifz1fbuXGYMO5sXcdlHkIsOvsM
	zdXnoljIe1ozBOzPGkG7T9Ee4ip14BBuHyNuGxHsywESWuXbjdBDAv030czKQZWxs1ZbJqrpDD6
	P6Eg==
X-Gm-Gg: ASbGncvK2Sw7HQKJdrm1EnH+JNOEb/YKXar0RPFRY+mjJS+3q62VODLpiHnZaQ/t6CS
	0xa34kEOF/jX+vUTRNpE18IrZp67amO8/wHu695pkZ21GfbJZ6XfgonG0Bf7C9VYMz2SZGXhEMR
	sPOZq59/YaFTG4rlLfvGGGsmd8TCDKn6Akyi/MqBIEXFsASp36WwcFvWir3hD56fy90kdjgJxtc
	NChsClWHJ54oOEq/UjPuKP5c8BA6NZ7gScocvqdakmDeBarXQJuF4O7MrfWFpv6qkCkxT7tsdec
	rJ9L6as8WjuPQNYmqR7lqXSgqi8KGVhEmgD4XZ81JqaRiYTsg2c+ri7eISLMRUPKdw==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598392985a.0.1747944202598;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdPVBb/3dMa+Oth0RFZpbRe4D5jwSzHxL54HpR9/3qg8beQB+fbLvxl1KJ7Gfry7w44GjJvw==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598389385a.0.1747944202183;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d0717c3sm1134397266b.65.2025.05.22.13.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 13:03:21 -0700 (PDT)
Message-ID: <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f830b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=COk6AnOGAAAA:8 a=lzpFBSrVIYugpwGNuwEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y8x-cOnKAokmegOUStPRlwbfypqLYmWL
X-Proofpoint-GUID: Y8x-cOnKAokmegOUStPRlwbfypqLYmWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIwMSBTYWx0ZWRfX7o4cl5RRfHKG
 DVZQdS6QSCd8UnA2i5QZni8KCRCmVuC8EX+N8HU7X36mlTweWguFrmGewqvuLExMRR5Sj0sPHfN
 qHIYXPJBWVfdsqszLrPjwsuHgHNgr+DAnUaItFELSIxMTnxF1jOT74AEslMxlzxYKCttwNLOH+f
 jHPvjrKA/vvT7NM7k3h3F3HL9tywR9s51Ydzb7hjX7Ypb4dKT9Ad8tMR5/RpvExRQScbLvYlyCV
 HLwfOoAnpg7UUCYT0goj4MXb6m+yi4CuPwftIkHjIC5gytoDILwGqRIAWLbguG76MCRuofQt1tk
 Z4TXX6QdohOE6InYBAkacgnH7equb3Oh9+Hr22ie3/YZONYtHrcw72LEDNJe6+DTctR1RoJEsIx
 Y4M2UO6mxASlYNIFzZ1qlkDz5hhz7YKKNBcr9ytse5era6SxpTZWqZUMU1ZVLmZSSJvvwOzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_130324_972414_9156A209 
X-CRM114-Status: GOOD (  22.93  )
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

On 5/8/25 11:45 AM, Johan Hovold wrote:
> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
>>
>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
>>> On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>>>> clocks provided by the TCSR device.
>>> This still looks wrong and you never replied to why these supplies
>>> shouldn't be handled by the tcsr clock driver that supplies these
>>> clocks:
>>>
>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> 
>> Sorry, I thought Konrad had convinced you.
> 
> IIRC, he just said you guys were told to add the QREF supply to the PHY.
> That's not an argument.
> 
>> If the TCSR driver manages these supplies, would it be possible for tscr
>> driver to recognize when it needs to turn vdda-qref on or off for a
>> specific PCIe port?
> 
> Sure, just add a lookup table to the driver and enable the required
> supplies when a ref clock is enabled.
> 
> As I mentioned in the other thread, the T14s has the following QREF
> supplies:
> 
> 	
> 	VDD_A_QREFS_1P2_A
> 	VDD_A_QREFS_1P2_B
> 
> 	VDD_A_QREFS_0P875_A
> 	VDD_A_QREFS_0P875_B
> 	VDD_A_QREFS_0P875_0
> 	VDD_A_QREFS_0P875_2
> 	VDD_A_QREFS_0P875_3
> 
> and it's not clear how these maps to the various consumer ref clocks,
> including the PCIe ones:
> 
> 	#define TCSR_PCIE_2L_4_CLKREF_EN
> 	#define TCSR_PCIE_2L_5_CLKREF_EN
> 	#define TCSR_PCIE_8L_CLKREF_EN
> 	#define TCSR_PCIE_4L_CLKREF_EN
> 
> That mapping can be done by the TCSR clock driver (which would also take
> care of the 1.2 V supplies).

So we had an internal discussion about this and while it may work, it
would only do so for some SoCs, and maybe only on the surface, as the
wiring behind it is rather peculiar..

Plus, not all QREF consumers have a clock expressed in TCSR as of
right now.

Konrad

