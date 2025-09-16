Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE29CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X4Oo9dw265PURxeYMUaHsX4sLsJPuBPvb+0hPhB0tw=; b=NOM/Y6oStXQa4GTrBQLUEkw1TB
	eBEsmJt/BsSXfsIFauIfDavMfLGkep6r7XrireEO03hZ5KQVivTc/+vZJmZdWKG3p+RzHc2aJG3A1
	ZYGPvjA4DdYv/MPZaN2komKNuc9ign9xBROPR616ea7BUDwS7HQsThNycsmxYtcbdwygEUZMyTxBC
	01vlWR7P2exWo4yFvI1wzxi7txqoVodhp/knsHo5hMSr9Y/lk3AAGcbeLu6397AKTJPSpg0Qr6yYo
	4ynAjs7TMY1IrolmtKT/VCMsjsQeMeF8EpkHE7wwxe0f16uSQAKNcUjx7zyuvLlGkFYiZBiFzlnxA
	+3/qPQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWHY-000000081a1-18XH;
	Tue, 16 Sep 2025 14:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWHX-000000081Zn-0IDV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 14:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6X4Oo9dw265PURxeYMUaHsX4sLsJPuBPvb+0hPhB0tw=; b=fH95tRGrXHQMHsbIgFCuXh9T9C
	uXsP9fMkgb8tVFYMY6rn2awrHDUCuRf9Sj41s3yqR81/HHDr+yAyERuqKtyUO7JdymdHxWt/jnUV1
	ZxkeWqQ7lyi585TCgiHONP38EMyunrm7sdaWluErg7f/8h2d5H7OjnZXS59y/EvQtWcTMLfTxRe7A
	nh05IQJOA/fGlf+7dUDJaO8w36UDskF5yOBxD/kV8UhFc/hYTXA8e+JQbk8Uuvgthcqyg8YHQXgWE
	uCxpJfSSYgvkZtgU1UYBRCO2LE4djHUb2izWC49MF83QDGVWZNoyFnVCmXIKVOqVfsHTEjOKTdoE5
	ou3npLfQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWHT-00000007DEl-39p1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:03:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAmwKL021429;
	Tue, 16 Sep 2025 14:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6X4Oo9dw265PURxeYMUaHsX4sLsJPuBPvb+0hPhB0tw=; b=X03ZJERAb6N+nykO
	fRhY76URm/EZRth1agRZGE+rmcUE0A8iieizzc7LMY61aORwVFv4jx5sPQiqn8PM
	LB3F3scF2PRfbAxdef75VtJFXwB9TUByWNjGmUdT9HDx3J/PPMSZQa17gJNT7w9O
	ztT31JoyjV/2tAQ24qj3EwzKu8cWXpenI/qJSGPtMfXnS2YZsMBw4Ztm1jsQ6Wdm
	UEMAanrQ4ZjdrwPXf17KUbxwLXBo9BVremMaIRqhOYxpwMh4kt8llEVyGD6YEdDg
	Fp6Ehbjyrk7JBL1YqIFhuINTmzto00p3+U05za7REZLW+kP//hoDurAu/3cgrJ8K
	VKyS1g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma92qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:03:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58GE3Ppj030456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 14:03:25 GMT
Received: from [10.253.73.4] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 16 Sep
 2025 07:03:18 -0700
Message-ID: <1e7d7066-fa0b-4ebc-8f66-e3208bb6f948@quicinc.com>
Date: Tue, 16 Sep 2025 22:03:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] dt-bindings: clock: Add required
 "interconnect-cells" property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Varadarajan
 Narayanan" <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
        Devi Priya
	<quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_suruchia@quicinc.com>
References: <20250909-qcom_ipq5424_nsscc-v5-0-332c49a8512b@quicinc.com>
 <20250909-qcom_ipq5424_nsscc-v5-2-332c49a8512b@quicinc.com>
 <20250912-nocturnal-horse-of-acumen-5b2cbd@kuoka>
 <b7487ab1-1abd-40ca-8392-fdf63fddaafc@oss.qualcomm.com>
 <0aa8bf54-50e4-456d-9f07-a297a34b86c5@linaro.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <0aa8bf54-50e4-456d-9f07-a297a34b86c5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX+9fniE3pPWHB
 OK1mPcvWK39tjQpXeg8MT+BqotrnwWTpPXA47FselkKhjNIKTmvcDr6saYw99d/BVXIJhsDfVHF
 etU73HHUoARWi+cuEUe8kEn/BU/2eceCg7Dbb0SjbIcoVuKZE1W1IK8KPMGTthcJmUCAYXaTF1g
 CmoetI2YNTVgs5IaaRvgpKChIoq4svHTMffGrXGdZIM0MujvmF6vY7J7V3QxNTTGFqDPzFmCGEI
 FHPXtmj2Ll8giOhyYfxfJVLYTozy2RMuteHsZySMVg/01HkUkCTYqjMQEWhrDxlCKGaIePm2pnm
 H8rVrDGCmQCoIF0paiVaQAAOxAw2TzK20GcvInI19G3+HEPn0mvLaecbopPySZGzt01qjn9umyu
 9KiSVr3P
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c96e2e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=gKVqG3yGxRJGUVRL1-wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LvqLRf81n_ETBpixAjO1G1xzpO7c-pka
X-Proofpoint-GUID: LvqLRf81n_ETBpixAjO1G1xzpO7c-pka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_150340_168778_FFABD6B3 
X-CRM114-Status: GOOD (  16.29  )
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



On 9/12/2025 5:16 PM, Krzysztof Kozlowski wrote:
> On 12/09/2025 11:13, Konrad Dybcio wrote:
>> On 9/12/25 9:04 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 09, 2025 at 09:39:11PM +0800, Luo Jie wrote:
>>>> The Networking Subsystem (NSS) clock controller acts as both a clock
>>>> provider and an interconnect provider. The #interconnect-cells property
>>>> is mandatory in the Device Tree Source (DTS) to ensure that client
>>>> drivers, such as the PPE driver, can correctly acquire ICC clocks from
>>>> the NSS ICC provider.
>>>>
>>>> Although this property is already present in the NSS CC node of the DTS
>>>> for CMN PLL for IPQ9574 SoC which is currently supported, it was previously
>>>> omitted from the list of required properties in the bindings documentation.
>>>> Adding this as a required property is not expected to break the ABI for
>>>> currently supported SoC.
>>>>
>>>> Marking #interconnect-cells as required to comply with Device Tree (DT)
>>>> binding requirements for interconnect providers.
>>>
>>> DT bindings do not require interconnect-cells, so that's not a correct
>>> reason. Drop them from required properties.
>>
>> "Mark #interconnect-cells as required to allow consuming the provided
>> interconnect endpoints"?
> 
> 
> The point is they do not have to be required.

The reason for adding this property as required is to enforce
the DTS to define this important resource correctly. If this property
is missed from the DTS, the client driver such as PPE driver will not
be able to initialize correctly. This is necessary irrespective of
whether these clocks are enabled by bootloader or not. The IPQ9574 SoC
DTS defines this property even though the property was not marked as
mandatory in the bindings, and hence the PPE driver is working.

By now marking it as required, we can enforce that DTS files going
forward for newer SoC (IPQ5424 and later) are properly defining this
resource. This prevents any DTS misconfiguration and improves bindings
validation as new SoCs are introduced.

> 
> Best regards,
> Krzysztof


