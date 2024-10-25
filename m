Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9AAD10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0+1oLZauET+j+jh09kk+YkWrDtNFJkeHnfbIQSJpwvo=; b=bWV9qtMSRRy2WrvKx+0e1vSY16
	B1HmF8EuByHNHhyTVLhkNgPUvx9K7JFv4f1jAtDz+NsvCzQkE8zFCZahSRmOq9qtGX4Uen07jH8IM
	WlILWog7oKUDRL7vgQkleNeCrzRmUrau2LbzuQGV2HcCLtkL5RoFc7mqr2qKJZwenVx35Dk2xuHzK
	Je42SRWw8+KgsAW+leORkzWXVkHyaBNYihlqgEom5QaMgBq9BeWF/hHIHnajzVUEvt1ny3JxqYR5V
	dZeVJ0p9Lv1aN5IRb2HZIblt+85Nc76NgGEEWgB94f97XAXe3OItxc1HL/7aNvznlm6BWvo3Sgo9V
	Xk9gbKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48ql-000000028WD-0wZ8;
	Fri, 25 Oct 2024 01:10:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48p9-000000028Hd-3Iwk;
	Fri, 25 Oct 2024 01:09:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM4uA4016005;
	Fri, 25 Oct 2024 01:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+1oLZauET+j+jh09kk+YkWrDtNFJkeHnfbIQSJpwvo=; b=W4vvwOLPzOGaas9B
	jLSprNxIjvObGraTCmiF/1exlX2OadCSEfpI+huU9MpUlcDGnsG+k+sBCoIy9Y/0
	BekzNapLtjx2wj9geo0YUmMxEyiXQ+JwQBWu6pv8GVqt6GO5j1GGCRsocVyGTGj3
	6SkTFSMyvNnfens8uKFS5ZKXaCU8q7iLGXIUier6OV3HjpYFkJcokirgmRPHusoT
	8Q04Sh+QOVdUNKZkZyrWDS+UzsH5DWpVBRv0mYa4iuAeAaTRJlBZuzBYLndYqobV
	zBEVp45X82ccGByKYuPk1Ge43Ne0ORh9PevtaOeU4cZsSgdTe209UHBucV4H5XnG
	q5FajA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xqb1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 01:08:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P18kTV030019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 01:08:46 GMT
Received: from [10.216.22.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 18:08:40 -0700
Message-ID: <77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.com>
Date: Fri, 25 Oct 2024 06:38:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] RFC: dt bindings: Add property "brcm,gen3-eq-presets"
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jim Quinlan <james.quinlan@broadcom.com>
CC: <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi
	<lorenzo.pieralisi@arm.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jim2101024@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "moderated
 list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
	<linux-rpi-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20241018182247.41130-1-james.quinlan@broadcom.com>
 <20241018182247.41130-2-james.quinlan@broadcom.com>
 <20241021190334.GA953710-robh@kernel.org>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20241021190334.GA953710-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bByYqpBSH2WD1znRWTx9ptXkLbDecWdR
X-Proofpoint-ORIG-GUID: bByYqpBSH2WD1znRWTx9ptXkLbDecWdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_180907_892001_01C79877 
X-CRM114-Status: GOOD (  17.04  )
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



On 10/22/2024 12:33 AM, Rob Herring wrote:
> On Fri, Oct 18, 2024 at 02:22:45PM -0400, Jim Quinlan wrote:
>> Support configuration of the GEN3 preset equalization settings, aka the
>> Lane Equalization Control Register(s) of the Secondary PCI Express
>> Extended Capability.  These registers are of type HwInit/RsvdP and
>> typically set by FW.  In our case they are set by our RC host bridge
>> driver using internal registers.
>>
>> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
>> ---
>>   .../devicetree/bindings/pci/brcm,stb-pcie.yaml       | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>> index 0925c520195a..f965ad57f32f 100644
>> --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>> +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
>> @@ -104,6 +104,18 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  brcm,gen3-eq-presets:
>> +    description: |
>> +      A u16 array giving the GEN3 equilization presets, one for each lane.
>> +      These values are destined for the 16bit registers known as the
>> +      Lane Equalization Control Register(s) of the Secondary PCI Express
>> +      Extended Capability.  In the array, lane 0 is first term, lane 1 next,
>> +      etc. The contents of the entries reflect what is necessary for
>> +      the current board and SoC, and the details of each preset are
>> +      described in Section 7.27.4 of the PCI base spec, Revision 3.0.
> 
> If these are defined by the PCIe spec, then why is it Broadcom specific
> property?
> 
Hi Rob,

qcom pcie driver also needs to program these presets as you suggested
this can go to common pci bridge binding.

from PCIe spec 6.0.1 revision section 8.3.3.3 & 4.2.4.2 for data rates
of  8.0 GT/s, 16.0 GT/s, and 32.0 GT/s uses one class of preset (P0
through P10) and where as data rates of 64.0 GT/s use different class of
presets (Q0 through Q10) (Table 4-23). And data rates of 8.0 GT/s also
have optional preset hints (Table 4-24).

And there is possibility that for each data rate we may require
different preset configuration.

Can we have a dt binding for each data rate of 16 byte array.
like gen3-eq-preset array, gen4-eq-preset array etc.

- Krishna Chaitanya
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> 
> minItems: 1
> maxItems: 16
> 
> Last I saw, you can only have up to 16 lanes.
> 
> Rob
> 

