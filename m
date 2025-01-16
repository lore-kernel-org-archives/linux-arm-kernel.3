Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9263C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kMsm7jJrAx1IN2gYEC8j2oi13whyI4ysY2MoDYfRaw=; b=yRnoWZ4hjQNYh5jpyxSgN59xYK
	8FhdqU7KgqsborBTwOThaTrFNuXGloPKwAzsoxo86gf1O+rUU1ETFa7JNq6JLA/n7sxadmAoc0N0Y
	7CD5vviN03S1/Dh4s0o/ZRW+Ov6svtozDV2JZAPuxvrdp1munMPoAWm6rAfaSjmiD97i0IhDnwDuB
	80GdNqhEog4YaECnW+vGCVBBl7lpLHjzgp9QEOzEmc4JAnehPpHxzhc+CneOqO//HYvYjnmR+t3Kb
	nYfWrITXYwKD4Cqtq7qK29NRt7EeEhI7VcJLJT3oW4DzD8tfSofLl0SXiTYWmx+q2qA5NeVHf7deh
	vpTl7C8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRXw-0000000FIXL-1Uk9;
	Thu, 16 Jan 2025 15:12:36 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYRW4-0000000FIF5-1BkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 15:10:41 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDcZFT005641;
	Thu, 16 Jan 2025 15:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9kMsm7
	jJrAx1IN2gYEC8j2oi13whyI4ysY2MoDYfRaw=; b=n0efISJtYoPTmwZACD9/JJ
	XR81H59ZXaOeB7D2dq086jXjSvKCxh9hP/TFVOnwxlEbQsW7CHOpMvtOzcVHauv7
	jFhouCJKKMDGucfkTuOeZERwV3IKAqvdy/Rraw8JYwg02apXtvsLP655zsCxLkAX
	22ee1523s/7IDZrB7UOOsR0D8vMV0bdCd80YBqnsQIbCrbHK/4WUt8V72eLmGTya
	v05WwLOmklixfCXLaRWxPwFjR1BqvGyefx8zVF8CmPFuGLmmUXfRW0dcsrEly1hW
	j4HphjMFuzUAWs3oXxVE3rEMJH+m717ZPb1PqnBazJrZXf0gV9o1MPogpQlT89tw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446tkck4b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:10:16 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50GExBFG017832;
	Thu, 16 Jan 2025 15:10:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446tkck4av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:10:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDCw1w007994;
	Thu, 16 Jan 2025 15:10:14 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443yned0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:10:14 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50GFADIJ21299764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 15:10:14 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E665B58054;
	Thu, 16 Jan 2025 15:10:13 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1A815803F;
	Thu, 16 Jan 2025 15:10:11 +0000 (GMT)
Received: from [9.61.59.21] (unknown [9.61.59.21])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 15:10:11 +0000 (GMT)
Message-ID: <8a9724b0-440f-4647-9505-058717f7ee07@linux.ibm.com>
Date: Thu, 16 Jan 2025 09:10:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: minyard@acm.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
 <20250115142457.GA3859772-robh@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250115142457.GA3859772-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TC-QwuyWLELS3rwujChq29wvqC7RmVnh
X-Proofpoint-GUID: vg3ZPGERppcMA5dqf5ZuhwOkDOxlsLVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=717 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501160114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_071040_331974_196A7B7F 
X-CRM114-Status: GOOD (  12.50  )
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

On 1/15/25 08:24, Rob Herring wrote:
>
> I was about to say that, but this matches what gpio-hog.yaml defines.
> Why we did both, I don't remember. We could probably eliminate
> 'hog-[0-9]+' as that doesn't appear to be used much.
>
> Long term, I want to make all gpio controllers reference a gpio
> controller schema and put the hog stuff there. Then we have the node
> names defined in 1 place.

Ok, choosing suffix.

Thanks for the review.

Regards,

Ninad



