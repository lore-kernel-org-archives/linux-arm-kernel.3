Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E65C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxfl05rEtPi8TykQ9QWVEg0MU5uCG4bE8pKLfbkmBoM=; b=O7ZAJYAST2lFDfwPk7twHIcuez
	Sx0uDTVLreC2Mk0pFCE0/kXY4K1EDrOYV5R8M5bJccI/RAkQwUZNL5RJRByFU8Jc884kVo/0DBBsZ
	+qboBP68rY0OmlgIgzxl0TRWl+P50zFuvaauhfE8Q7SPFC13vb9Vwk6pq7cjKEQ1IoatTzel9wIMZ
	W/tCEcseb/J0M3JkX6VgeVjzCCcVluihKSgXiuE8uXcjkcHmtZ3sHOHGAr+UvFebhIMM/pIalzwIp
	ZxWpqKK70Yim4DVyblrCGXGOoCSGc7yyr1fP3KTUXAIhW2Q/vw39npNrAmLgLM0TF6nvo7CJvSkEK
	ubsjYDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQkb-00000006W3Z-3ef8;
	Mon, 13 Jan 2025 20:09:29 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQUH-00000006Swb-1vhO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 19:52:39 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBwHMp024143;
	Mon, 13 Jan 2025 19:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gxfl05
	rEtPi8TykQ9QWVEg0MU5uCG4bE8pKLfbkmBoM=; b=B5LUh+VgN3WK/GxgMfApyL
	zDK2JB86xVFtqkh2cISfja7SdVtOsIfkGleQzynw6Piylorb/2us6xzEeoukuQot
	dAFLlcFPUq1Dy4nmJN3LwWPknBMPu5XagwtLREWveMQ8Ja5OVu7SogufvkYi8w1l
	r93va9nGzztbSiS+6nSIEy3MiVOTLcHqBQyWAU3peLOp5LcyOOT74MNka5aZKhT+
	pY3A1y/SdCxh3cPB/jbMtSDqplAF1ENBHzsX9sLyZFrgMN93Yn5jthXy+DnLG2We
	uombPBbmzmebvuAtrUsPTfV2bdOLDT7qGqBK6A2esZdY9TuHPYmiYNMuBnWtf3vQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qjameav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:52:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DJcxT5031944;
	Mon, 13 Jan 2025 19:52:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qjameaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:52:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGREZB016991;
	Mon, 13 Jan 2025 19:52:04 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fjyrwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 19:52:04 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DJq3p520972040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 19:52:04 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB9A5805E;
	Mon, 13 Jan 2025 19:52:03 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2274F5805A;
	Mon, 13 Jan 2025 19:52:02 +0000 (GMT)
Received: from [9.61.105.40] (unknown [9.61.105.40])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 19:52:01 +0000 (GMT)
Message-ID: <a8893ef1-251d-447c-b42f-8f1ebc9623bb@linux.ibm.com>
Date: Mon, 13 Jan 2025 13:52:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] DTS updates for system1 BMC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, davem@davemloft.net, edumazet@google.com,
        andrew@codeconstruct.com.au, netdev@vger.kernel.org, kuba@kernel.org,
        joel@jms.id.au, linux-arm-kernel@lists.infradead.org,
        openipmi-developer@lists.sourceforge.net, conor+dt@kernel.org,
        linux-kernel@vger.kernel.org, pabeni@redhat.com,
        ratbert@faraday-tech.com, eajames@linux.ibm.com,
        devicetree@vger.kernel.org, andrew+netdev@lunn.ch, minyard@acm.org,
        krzk+dt@kernel.org
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <173637565834.1164228.2385240280664730132.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <173637565834.1164228.2385240280664730132.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PvzTUGLChZmlLTohpy8SLvK47px5mEq9
X-Proofpoint-ORIG-GUID: slslK2Na7MpzUMJx3_V1bJjHIgILrmix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=886 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_115237_638910_D34B94C6 
X-CRM114-Status: GOOD (  20.65  )
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

Hello,

On 1/8/25 16:34, Rob Herring (Arm) wrote:
> On Wed, 08 Jan 2025 10:36:28 -0600, Ninad Palsule wrote:
>> Hello,
>>
>> Please review the patch set.
>>
>> V3:
>> ---
>>    - Fixed dt_binding_check warnings in ipmb-dev.yaml
>>    - Updated title and description in ipmb-dev.yaml file.
>>    - Updated i2c-protocol description in ipmb-dev.yaml file.
>>
>> V2:
>> ---
>>    Fixed CHECK_DTBS errors by
>>      - Using generic node names
>>      - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
>>      - Adding binding documentation for IPMB device interface
>>
>> NINAD PALSULE (7):
>>    ARM: dts: aspeed: system1: Add IPMB device
>>    ARM: dts: aspeed: system1: Add GPIO line name
>>    ARM: dts: aspeed: system1: Add RGMII support
>>    ARM: dts: aspeed: system1: Reduce sgpio speed
>>    ARM: dts: aspeed: system1: Update LED gpio name
>>    ARM: dts: aspeed: system1: Remove VRs max8952
>>    ARM: dts: aspeed: system1: Mark GPIO line high/low
>>
>> Ninad Palsule (3):
>>    dt-bindings: net: faraday,ftgmac100: Add phys mode
>>    bindings: ipmi: Add binding for IPMB device intf
>>    ARM: dts: aspeed: system1: Disable gpio pull down
>>
>>   .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  44 +++++
>>   .../bindings/net/faraday,ftgmac100.yaml       |   3 +
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 177 ++++++++++++------
>>   3 files changed, 165 insertions(+), 59 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
>>
>> --
>> 2.43.0
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20250108163640.1374680-1-ninad@linux.ibm.com:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#

This is a false positive. So ignoring it.

Regards,

Ninad

>
>
>
>
>
>

