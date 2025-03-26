Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9714C36005
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 02:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHvdmnGDWmN2+ek+yppcGVoDBmxrqx9exoQKZVIwT7I=; b=sdOm2mXfnVk+n7Q6jRosNyjCNo
	ovhDQBGbY8q+ddcABPZ9GXyWYQhXrP76vDidr+61A89LXKVeWXH2z48xx/5i5MgnyAfBYfw/irsbu
	36M7pbKI/npIv/5ohfhMBxdPwW7pot4iZtEHC9OvJBhJfAK6R8rTz+OhDuD5CrMPtGYBLR7ppPsew
	R+bQZ3n+8A4gbCf1b2UqRbhJGJ0FwWWQx9/NvkqWdOSgR/CS4hLNPnuqLl6Xmlqxfj822CoZt1wiQ
	pGoDnj6yhkHOOUxZJC6adWmmG0yHTrYctX9Mto64Ei6cm/OMJzhMdB5Vy0akud6BdDQlTn8GDUTj7
	ucIwCHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txGTZ-00000007Pkp-01dg;
	Wed, 26 Mar 2025 02:26:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txGRq-00000007Pf9-0IsY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 02:24:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaVig014435;
	Wed, 26 Mar 2025 02:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHvdmnGDWmN2+ek+yppcGVoDBmxrqx9exoQKZVIwT7I=; b=EAIgLZ7tFDGeM8dJ
	lv81bThRQJKNSPJgomw2RQ3z1VdZLDvZU+6KmhWyEti+LJBYH1LehQSVqeHXuRHJ
	j56FiTrwTENzjik3I4ypxfw8t485XWYFJgzOKU8dAP/IHfsvj6R+Z8z6Xr0L8hMO
	cNOsDTCbFwBbarhlR61tvvLQX3sCq2T3lOQrdrbdxhquTibTyPQL59KWv2XjgSF1
	Tnt1jhrLQGvZOvsgB8RiPz8JmsoXeZBBXN+1fvSb0sK+IjXeQn9ZbTk8RrG1qlwG
	dxwvFWp02v3DXW55w5cH08OXy4q2Erz9ahGhtSq/ov243PG+h2DcbzsFBxpmycDL
	r0xoDQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjdcuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:24:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q2ObW9021429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 02:24:37 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 19:24:33 -0700
Message-ID: <a0c0d25d-4004-4a95-83c0-36fc76c35e7b@quicinc.com>
Date: Wed, 26 Mar 2025 10:24:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Krzysztof Kozlowski <krzk@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <quic_qianyu@quicinc.com>, <sfr@canb.auug.org.au>,
        <linux-arm-kernel@lists.infradead.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
 <694b6638-92b2-4ac0-a175-bd29aea6cba9@kernel.org>
 <CAMRc=MfZrRp=VuEOLuMY_04JdyRrD+joGL56LwRFQ-+D-8Z_6w@mail.gmail.com>
 <9ea8fe39-b818-403b-bd69-815e58eb2949@quicinc.com>
 <fbd5c153-b73a-4dbc-a923-4e3d3924e748@kernel.org>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <fbd5c153-b73a-4dbc-a923-4e3d3924e748@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _hdiVxvW5NL98UkZ_7FgRmKcIXS60dLJ
X-Proofpoint-GUID: _hdiVxvW5NL98UkZ_7FgRmKcIXS60dLJ
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e36566 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QgMpMe-T9jvHLLvuksgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=960 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_192454_118961_86DFDD8A 
X-CRM114-Status: GOOD (  16.91  )
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

On 3/24/2025 3:38 PM, Krzysztof Kozlowski wrote:
> On 24/03/2025 08:09, Wenbin Yao (Consultant) wrote:
>> On 3/21/2025 5:43 PM, Bartosz Golaszewski wrote:
>>> On Fri, Mar 21, 2025 at 8:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On 20/03/2025 06:55, Wenbin Yao wrote:
>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>
>>>>> Enable the pwrctrl driver, which is utilized to manage the power supplies
>>>>> of the devices connected to the PCI slots. This ensures that the voltage
>>>>> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
>>>>> on/off if they are described under PCIe port device tree node.
>>>>>
>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/configs/defconfig | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>>>> index 85ec2fba1..de86d1121 100644
>>>>> --- a/arch/arm64/configs/defconfig
>>>>> +++ b/arch/arm64/configs/defconfig
>>>>> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>>>>>    CONFIG_PCI_ENDPOINT=y
>>>>>    CONFIG_PCI_ENDPOINT_CONFIGFS=y
>>>>>    CONFIG_PCI_EPF_TEST=m
>>>>> +CONFIG_PCI_PWRCTL_SLOT=y
>>>> Bartosz,
>>>>
>>>> Wasn't the intention to select it the same way as PCI_PWRCTL_PWRSEQ is
>>>> selected?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>> For sure. I would expect there to be something like:
>>>
>>> select PCI_PWRCTL_SLOT if ARCH_QCOM
>>>
>>> in Kconfig and nothing in defconfig.
>>>
>>> Bartosz
>> IIUC, pci slot power driver is a common driver that could be used by all DT
>> based platform.
>
> You are not responding to the raised problem.

There is a slight difference between PCI_PWRCTL_SLOT and PCI_PWRCTL_PWRSEQ.
PCI_PWRCTL_PWRSEQ is selected by ath11k/ath12k, but PCI_PWRCTL_SLOT has no
specific endpoint device driver to select it. Could PCI_PWRCTL_SLOT be
selected along with HAVE_PWRCTL when ARCH_QCOM is enabled? Or can we add
select PCI_PWRCTL_SLOT if HAVE_PWRCTL in the Kconfig of portdrv?

>
> Best regards,
> Krzysztof

-- 
With best wishes
Wenbin


