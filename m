Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DFC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqyfQxOJ5oYKECoyFJ2sTY8rhlGKLhZCB19orskKgkE=; b=A3UxoHJpGPrjImU/N40kj4bKwp
	523qqxhn0aynwWnZJwC/+neCwQN48YLEHoIl0YJKiycQLJDbstRIvr6imxHapJ4WoFoTKp2aZvrus
	QtmT/zI/8c8jXXZUiOqEg7OKqrTj+ShZiafqFFz3z9pzMnyu5AovGskJlF0NUIqUlcuZGxgWA1UD3
	hLTpTdhQ1b9tar7nQTHQ3SMSf9PJvl16tbiIuc4nicTXlRb3klq0d5vk/iZw1+Cdz0uo/ysQ+aJz1
	CaQIPyp4jPemRsynsYj33UVhBzsl970dlOwCGjt8TyZQoFOcEWup79UqHBUrwAotUgxFTWOTYqeKc
	2q1Mgw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRRp-0000000FHjQ-3DTz;
	Thu, 16 Jan 2025 15:06:17 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRQY-0000000FHXk-3x61
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:05:00 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GE6dxf024817;
	Thu, 16 Jan 2025 15:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YqyfQx
	OJ5oYKECoyFJ2sTY8rhlGKLhZCB19orskKgkE=; b=UxP66y8y9OT9RWoBkaJAU3
	GfkhR0rxzN94Sk3KjZdvONvMmx4MlGUauBsmpyNtxtfo9KsmiQ/vlL4sTwTu0PUp
	vSgHgFEUTdaYxWr5udXMn5OuCFAKUgZmhgqqdZXmhSbRgbyIL/niU4TL3c2jdvNf
	JKm9g5qc1RNZhAlhCgqZZfTUt1wUqEkOtTjEW+RtI7hw42FNfOhojmhcvNdT9Ghf
	NRClsrSRmKedtjTt3g/a7plBN2KUb96ivAzsTUh9yeLcs/N7aqaQhcLDZSgCdMpN
	OCTYiaxdVGb8OFOq3q1Ybs0ULTgnYv9RIYl1MuLXe/id0QVac65LfSSLwk/XfFgg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4473k58ar8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50GERMrc012914;
	Thu, 16 Jan 2025 15:04:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4473k58ar1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50GE6SP6017400;
	Thu, 16 Jan 2025 15:04:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4444fke98p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:04:30 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50GF4URL28246688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 15:04:30 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA8CC5803F;
	Thu, 16 Jan 2025 15:04:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5565C58056;
	Thu, 16 Jan 2025 15:04:23 +0000 (GMT)
Received: from [9.61.59.21] (unknown [9.61.59.21])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 15:04:22 +0000 (GMT)
Message-ID: <35572405-2dd6-48c9-9113-991196c3f507@linux.ibm.com>
Date: Thu, 16 Jan 2025 09:04:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com,
        linux-arm-kernel@lists.infradead.org, edumazet@google.com,
        joel@jms.id.au, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
        andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
        davem@davemloft.net, kuba@kernel.org,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, conor+dt@kernel.org,
        eajames@linux.ibm.com, minyard@acm.org
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <173689907575.1972841.5521973699547085746.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <173689907575.1972841.5521973699547085746.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: owqPtG7sXawqZszVtmUCKpylao6OtTOR
X-Proofpoint-ORIG-GUID: y3OZyjeOsP0uNqLC9wmfkr7B2_zgRWNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=666 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_070459_104699_86D059A0 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Rob,

On 1/14/25 17:57, Rob Herring (Arm) wrote:
> On Tue, 14 Jan 2025 16:01:37 -0600, Ninad Palsule wrote:
>> Allow parsing GPIO controller children nodes with GPIO hogs.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
>
>
> doc reference errors (make refcheckdocs):

I am not seeing any error even after upgrading dtschema. Also this mail 
also doesn't show any warning. Is this false negative?

   HOSTLD  scripts/dtc/fdtoverlay
   CHKDT   ./Documentation/devicetree/bindings
   LINT    ./Documentation/devicetree/bindings
   DTEX 
Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.example.dts
   DTC [C] 
Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.example.dtb

Regards,

Ninad

>

