Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA603C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Obdh2sp1bG/iJrIhaC8nIXFsNSDoTZS3Zoul3eqaA60=; b=Bzsp2zu6wCbmpMuwAnUffr+i2C
	HKlRuoGsmCA694Eci836bJT+iwUbNbmPyKvP49ErKBnO87ioppBAexJYn0dfpIJLrcdBg0RLODRVU
	gtG+WBQCDlCuaR+XP10MpC/sqhipbkJuy0FT9uSo1+BOf1qgdOmj19vvN6cSwmHM0vimbTOIwNcxq
	5cmb0TnHPvXT0X/e/HyHwlHxpXhgQwNPO7mNAPbuw+NQzo2unc8C8UzV7avTMuccPJkZ4KChE+NeF
	TG15GhuCYRy3MDBpXpZO7RAmU00EWL2b5LsJkQHcKKuLusBf+Ska34A3m/dIgGWaZCVr9yrY2Gd34
	InOQa1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhs6-00000008fqj-1aOW;
	Tue, 14 Jan 2025 14:26:22 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhnf-00000008ewF-1yIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:21:48 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E3sZbc007080;
	Tue, 14 Jan 2025 14:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Obdh2s
	p1bG/iJrIhaC8nIXFsNSDoTZS3Zoul3eqaA60=; b=L8ixA7V1onUz11Os0Pudtf
	VEurMailch8RHVvI8JKcx6l8Yc+62G9u9lt4sWdm5mO5jxcidLwEFj/E75biFI+f
	QYk5sPeAIfSje3y/P0Zh8LP0nsds4PUDOVLeGHZIaPDUoWMUp4qAwVMmb8y7TgO/
	kjIY1UE5bnw2c+sLvUzlyfAp/7SMEzALIzy9oC+CfoWX8aGwcvsqT3XhnCAovI0V
	aa/PvbL058LrPCep6fnzpNhfDO6/0htFJZ9NAjNdm1gjELv+CPJSH0d5cmzP7QKT
	Q98Nby1GOLVM6Fx59FEn/S48d8+qiUz0Y4CpJDNijXgnxD7ojiAOpgRtl5ElhuEA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjj8jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:21:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50EEK8aA011287;
	Tue, 14 Jan 2025 14:21:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445gdjj8j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:21:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBAWjW016485;
	Tue, 14 Jan 2025 14:21:10 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1k65k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 14:21:10 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EEL9nj25166578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 14:21:09 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 982CA5805D;
	Tue, 14 Jan 2025 14:21:09 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1945B58043;
	Tue, 14 Jan 2025 14:21:09 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 14:21:09 +0000 (GMT)
Message-ID: <9404bb02-0dc9-4d44-a07f-4a81faaa63d6@linux.ibm.com>
Date: Tue, 14 Jan 2025 08:21:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] bindings: ipmi: Add binding for IPMB device intf
To: corey@minyard.net, Rob Herring <robh@kernel.org>
Cc: minyard@acm.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, ratbert@faraday-tech.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-3-ninad@linux.ibm.com>
 <20250110160713.GA2952341-robh@kernel.org>
 <Z4Fejhd_qPfuVLiw@mail.minyard.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <Z4Fejhd_qPfuVLiw@mail.minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QqwJVM9EO3zAIwPZ75Cabrp2tcIwXDQZ
X-Proofpoint-ORIG-GUID: ILtSGlFoh6SB1BgZa686W1TSIkYX-mNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_062147_517956_304FB886 
X-CRM114-Status: GOOD (  27.36  )
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

Hello Cprey,

On 1/10/25 11:53, Corey Minyard wrote:
> On Fri, Jan 10, 2025 at 10:07:13AM -0600, Rob Herring wrote:
>> On Wed, Jan 08, 2025 at 10:36:30AM -0600, Ninad Palsule wrote:
>>> Add device tree binding document for the IPMB device interface.
>>> This device is already in use in both driver and .dts files.
>>>
>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>> ---
>>>   .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 44 +++++++++++++++++++
>>>   1 file changed, 44 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
>>> new file mode 100644
>>> index 000000000000..a8f46f1b883e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
>>> @@ -0,0 +1,44 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/ipmi/ipmb-dev.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: IPMB Device
>>> +
>>> +description: IPMB Device interface to receive request and send response
> First, thank you, this does need to be documented.
>
>> IPMB is not defined anywhere.
> Indeed.  At least reference the spec, but better do that and provide a
> basic description.
>
>> Which side of the interface does this apply to? How do I know if I have
>> an ipmb-dev?
>>
>> This document needs to stand on its own. Bindings exist in a standalone
>> tree without kernel drivers or docs.
> At least to someone who knows what IPMB is, it's pretty clear that you
> are saying "The i2c device this node is in is on an IPMB bus." However,
> to someone who is not, this is all a foreign language.  This definitely
> needs better documentation.
>
> Why do you have a "reg" property?  I don't see it referenced in the
> driver.  I assume that's the I2C address, but that's going to be the
> same as what's in the containing I2C node.  I don't think it's
> necessary.

Sorry forgot to answer this question. We are setting extra values for 
reg for I2C slave.

I am not sure how it is used in the driver.

Regards,

Ninad

>
> -corey
>
>>> +
>>> +maintainers:
>>> +  - Ninad Palsule <ninad@linux.ibm.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ipmb-dev
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  i2c-protocol:
>>> +    description:
>>> +      Use I2C block transfer instead of SMBUS block transfer.
>>> +    type: boolean
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        ipmb-dev@10 {
>>> +            compatible = "ipmb-dev";
>>> +            reg = <0x10>;
>>> +            i2c-protocol;
>>> +        };
>>> +    };
>>> -- 
>>> 2.43.0
>>>

