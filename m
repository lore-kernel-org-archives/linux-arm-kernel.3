Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C76C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 22:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kpkg8ZRNaBCx0LdYq1kZUif9nqPGH11+aM8P8oFUIdg=; b=meql7xsmiICthEtW4tf5WF+2i2
	q2+yBwisCu7t+IJ0QU15TRGc7ZiT7DN54fv9R2Ae+81z5CPSG53hO/wj2flz/mhOc209ItpPaIeuv
	SQ8hnna5xK1h3PQqtNFwmkwAgaTsVyn0tN/q0VT/pXcMenc8hO5NlnsUyuZ7t+7toXKWSJim0LiST
	USKEf4gv6BfHuIXVDbX8F7ejCPw1Aod7U1Ip3m2wzrgiJvwdjeOi8/wPIdjg1VAkcx3dXzcB/WKGG
	TD8Zc+9HgVkaelv9LTikUX+IgGbVM4KXBIbiNrYiu0hb44jckeQthe2zXIhrTBTcSWZ47unhw3Fmu
	0VmJ5TQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpFS-00000009v62-1a8G;
	Tue, 14 Jan 2025 22:18:58 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXp7E-00000009tyP-43r6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 22:10:30 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EFURub005899;
	Tue, 14 Jan 2025 22:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Kpkg8Z
	RNaBCx0LdYq1kZUif9nqPGH11+aM8P8oFUIdg=; b=JlyNEdumOpmggrw97leKDB
	O8aD3t0oXfYBT3JjdZhzcCbjPJoQ+plOjW/OGBZmZnlKnvNIEw0gjGapr8gh/IhM
	ci/fqGGAgSGkAXMJo05HriUArsKMHv0w7rLNsd+ukmZqADGolfNivZPbcJvHkwAy
	DR5ZACXVMOPYpj7lwEsFCeeomEvs+zqUOpBXFEdfMrZajc9TzkgQyJA/o1hUsIT5
	B5o5EB3Mjr7+/zY80rEExurmz9l/RDVYhoT2YGMyBjQpdF6szegyX0HVF63/y8ji
	/oJ8pnBR3VmambmAo/Co/qvIflRzqWo6xNO9BCwSW2b3LP35yA2wNJoMwyB4w/EA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445tmghp5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:10:02 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50EMA2Jh032360;
	Tue, 14 Jan 2025 22:10:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 445tmghp5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:10:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50EKYumK004526;
	Tue, 14 Jan 2025 22:10:01 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4442ysnhgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 22:10:01 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50EMA0md54723054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 22:10:00 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78F1958068;
	Tue, 14 Jan 2025 22:10:00 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EB4058054;
	Tue, 14 Jan 2025 22:09:58 +0000 (GMT)
Received: from [9.61.120.113] (unknown [9.61.120.113])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jan 2025 22:09:57 +0000 (GMT)
Message-ID: <c8fa4a3d-9cbc-49ce-9d76-85e57453fb04@linux.ibm.com>
Date: Tue, 14 Jan 2025 16:09:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] DTS updates for system1 BMC
To: Rob Herring <robh@kernel.org>
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
 <a8893ef1-251d-447c-b42f-8f1ebc9623bb@linux.ibm.com>
 <20250114000727.GA3693942-robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250114000727.GA3693942-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v_6PYVa29mNhrKAYYwhcM5Xcjd6o3IGx
X-Proofpoint-ORIG-GUID: wZefgua35hP2KPe6COMauRr6HOrmFlvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 mlxlogscore=859 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_141029_019961_666207F5 
X-CRM114-Status: GOOD (  12.90  )
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

On 1/13/25 18:07, Rob Herring wrote:
>>> My bot found new DTB warnings on the .dts files added or changed in this
>>> series.
>>>
>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>> are fixed by another series. Ultimately, it is up to the platform
>>> maintainer whether these warnings are acceptable or not. No need to reply
>>> unless the platform maintainer has comments.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>     pip3 install dtschema --upgrade
>>>
>>>
>>> New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20250108163640.1374680-1-ninad@linux.ibm.com:
>>>
>>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'
>>> 	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
>> This is a false positive. So ignoring it.
> No, it is not. You need to define hog nodes in aspeed,ast2400-gpio.yaml.
> See other GPIO controller bindings that do this.

ok, I fixed it. Thanks for the review.

Regards,

Ninad

>
> Rob

