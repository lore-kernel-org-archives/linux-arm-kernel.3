Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70328E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxPAWL+xin5vhaohLcuT2Ap42giFDWZcynaNDWdW+q8=; b=t+bVsgy9BxKVWpWhHG+K6tZkq7
	BA0zbZAdSxuNuGBSqoUJKFTBGYF8NZuMByVlALPfXhsQ+1G5wPdJLCxD1B54oqw9E5Mavn754DHOx
	E01ofjaN8EgHaKss3BX0d1ZYOut4/D7DCvMWTZ6iVyAsLM0ozIetaMUdUMLXjQhca1Cq1GO/4UvBG
	lS3AWC/FhjhffLgI3+Pw0f35MDEmoXfKov1AkGjn8J9sAJDNSsawP2seFs0zpOc/BY9t1MYe+Bk1l
	NLEAq1vf/uGgymiGTbsMF4fEHtwnvr8bQOeXY2d/cbJzIb3mViTcbE9R/Lqj6F5WEHzWYShgbsykk
	UKg/fM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAwm-00000005JMi-3XJJ;
	Tue, 07 Jan 2025 14:52:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAqr-00000005HgJ-180W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:46:41 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507CSl8Y022183;
	Tue, 7 Jan 2025 14:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cxPAWL
	+xin5vhaohLcuT2Ap42giFDWZcynaNDWdW+q8=; b=e+K3y++tUnqNiNA9nBLNVW
	gx6CXe7emtQEL0KdWn8Iwyyk0FFaBKLpgeNkcq+pKe5scB5C2RKeH6yMgKa4DWot
	kx7e9aoutEAYKzwZLajtW/8QSmH4sY/dOwiYSo6Tx8otiGxLW70dhBRW69cT113F
	9w16nnuYWCAPMLZZ42NuMgz9hKHmKbVB3L9CeVhTBtAjJbp7QuBX1r/amhy7hQrd
	aoGEAFpKoEr8oh1LPyygeb3fpybsUxbaJIy4TEkMr+4B4cPVN9clOh+KOOYoEjT4
	bZ+U0Wsx4Pe9DLNVP5bDDtUH+aQ+NgGBcMQLwRKVvRsA01X5M1b3ufYso0RNpjjw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440sahkg16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 14:46:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 507CmmI5008866;
	Tue, 7 Jan 2025 14:46:15 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfpyu1yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 14:46:15 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507EkF8M24052330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 14:46:15 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC95858062;
	Tue,  7 Jan 2025 14:46:14 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66C755805E;
	Tue,  7 Jan 2025 14:46:14 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 14:46:14 +0000 (GMT)
Message-ID: <3ffe898a-6146-4001-9d7a-53b45fbc8945@linux.ibm.com>
Date: Tue, 7 Jan 2025 08:46:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] DTS updates for system1 BMC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org,
        krzk+dt@kernel.org, eajames@linux.ibm.com, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, conor+dt@kernel.org
References: <20241213145037.3784931-1-ninad@linux.ibm.com>
 <173436597537.264948.12611164276777551472.robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <173436597537.264948.12611164276777551472.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OWui3oiuVa11k1Zs0pdqjBoTK3NqWjdc
X-Proofpoint-ORIG-GUID: OWui3oiuVa11k1Zs0pdqjBoTK3NqWjdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=948 impostorscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064637_316838_0C533A10 
X-CRM114-Status: GOOD (  20.55  )
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

Hello Rob,

Thanks for the review. Sorry for the late reply due to vacation.

On 12/16/24 10:29, Rob Herring (Arm) wrote:
> On Fri, 13 Dec 2024 08:50:26 -0600, Ninad Palsule wrote:
>> Hello
>>
>> Please review the patch set. It has various device tree changes for
>> system1 BMC after hardware testing.
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
>> Ninad Palsule (1):
>>    ARM: dts: aspeed: system1: Disable gpio pull down
>>
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 178 ++++++++++++------
>>   1 file changed, 119 insertions(+), 59 deletions(-)
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
> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20241213145037.3784931-1-ninad@linux.ibm.com:
>
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: ethernet@1e660000: phy-mode:0: 'rgmii-rxid' is not one of ['rgmii', 'rmii']
> 	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
Added rgmii-rxid mode in the yaml file.
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'fan_controller_reset', 'isolate_errs_cpu1', 'rtc_reset', 'srtc_reset' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#

I am still not sure about this error.

/home/ninad/dev/sbp1/linux/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: 
gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of 
the regexes: 'pinctrl-[0-9]+'
     from schema $id: 
http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#

> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: rtc_reset: $nodename:0: 'rtc_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: srtc_reset: $nodename:0: 'srtc_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: fan_controller_reset: $nodename:0: 'fan_controller_reset' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: isolate_errs_cpu1: $nodename:0: 'isolate_errs_cpu1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
Changed to generic name hog-0...3
> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb@1e780000/bus@1e78a000/i2c@280/bmc_slave@10: failed to match any schema with compatible: ['ipmb-dev']

Documented IPMB device interface.

Regards,

Ninad

>
>
>
>
>
>

