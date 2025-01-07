Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7m3abbkpDdb9eQXWEEq1svl/hSfpML5qL076vGL1Lk=; b=cQbkqHYOH5K0/AKF3XC1hHGeP5
	MYT1TGbbO33ap6HNhQFNav73Y4bbXDVaDxPM5e7uSnzT6cnBox8IFtDQKWYc6NmzRf1MUSwdQC3In
	KYeVF/xamv9MPoqRCtqEzQgrTwN2l8MXtEYXd9eCuKfUeyhxWCCzTspT2WY4S47j+SzUHIeDyleTi
	BtzN7IagYISHFcL5Uv6sQLz14DI5DWTunX8UG+wlH/3DzyROCM2Tfv0epFEP5ToOOffGhZUBrD4Av
	2YHVYnV9qYYpt0erUkPOqgqu4hVQMJ0F+oci7QROK43wFVmsHczC/o5W+JYC8L4FPhtWAoxA5L/nb
	oJji1Zmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAbR-00000005DiA-45Eg;
	Tue, 07 Jan 2025 14:30:41 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAa2-00000005DKg-0EQm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:29:18 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507BlsAF007894;
	Tue, 7 Jan 2025 14:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=K7m3ab
	bkpDdb9eQXWEEq1svl/hSfpML5qL076vGL1Lk=; b=Gm3t4nQEgqV59eqIRdWHFg
	ymNeF11SfrI27aRnuaLEBaUUM1V1tQRUeKvSgXr6wwqBOWueXWd/pg/VwHhM1N8M
	mvZ4HKTANdyoyWms2jVF2zXW4qWbEAPW69+TzE2t9WXhuKSqHWolRw8fbARfsi5J
	UQA0cACY7kti1rOOJJGJttdEKOPO5Zr212ZLErntNNg5MdkqQVkLBW31CaGrRt0U
	8ySxKClrddfjdTEYOHc3qAdYaldSuSdRJf44lgO6F9/uOqpNtmM7MVnK4f8JH4wM
	Iibpy+0PQOuHa9fvedfD2ocBAyG3/N3nLxUKsx8etmwouGZQRE/eVYV0owVRC8EQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440s0ab8su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 14:29:00 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 507DCHdD013698;
	Tue, 7 Jan 2025 14:28:59 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygantthr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 14:28:59 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507ESwlv3605168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 14:28:58 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F53E5805E;
	Tue,  7 Jan 2025 14:28:58 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B38BA5805F;
	Tue,  7 Jan 2025 14:28:57 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 14:28:57 +0000 (GMT)
Message-ID: <4848ab93-9c01-419b-a399-e27c65f7032b@linux.ibm.com>
Date: Tue, 7 Jan 2025 08:28:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] ARM: dts: aspeed: system1: Mark GPIO line high/low
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: NINAD PALSULE <ninadpalsule@us.ibm.com>
References: <20241213145037.3784931-1-ninad@linux.ibm.com>
 <20241213145037.3784931-8-ninad@linux.ibm.com>
 <de59078c-8410-4c4f-bfce-db402e92635c@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <de59078c-8410-4c4f-bfce-db402e92635c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l1ldtfkN-mUNA0bbnC0CAVISwv2LSV_j
X-Proofpoint-ORIG-GUID: l1ldtfkN-mUNA0bbnC0CAVISwv2LSV_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_062914_231524_63EF000C 
X-CRM114-Status: GOOD (  18.58  )
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

Hello Krzysztof,

Thanks for the review. Sorry for the delay as I was on vacation.

On 12/13/24 09:49, Krzysztof Kozlowski wrote:
> On 13/12/2024 15:50, Ninad Palsule wrote:
>> From: NINAD PALSULE <ninadpalsule@us.ibm.com>
>>
>> - Mark following GPIO lines as input high:
>>    - GPIOL4 (reset PCH registers)
>>    - GPIOL5 (reset portition of intel ME)
>> - Mark isolate errors from cpu1 gpio (GPIOO6) as active low output.
>> - The fan controller reset line should be active high.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> index ca2d4a292687..be0cd6152c61 100644
>> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
>> @@ -383,6 +383,34 @@ &gpio0 {
>>   	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
>>   	/*Y0-Y7*/	"","","","","","","","",
>>   	/*Z0-Z7*/	"","","","","","","","";
>> +
>> +	rtc_reset {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

Changed name as per the requirement hog-0...3

Regards,

Ninad

>
> Best regards,
> Krzysztof

