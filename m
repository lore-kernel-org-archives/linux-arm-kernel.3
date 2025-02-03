Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ4RqG5wX63XHkwCiEdYMzRbUoNudhkrKOhuQwdpm0I=; b=ZppsRS2TIKLut6yhuiuf2WqRFi
	x76Ad5+Hbz6Q5q6ozc3tv5tPlE0boOWxM2zRdnY1KbUGW29rAstg3cS3ElI9mD1a1nrVj8g6A/ZLG
	yg3eeWAOXv7zeQANua58+O+7jF5f/dxu3F1nWS+yDhkVZ8wWqg5Q1CVvb1cYEjX3tCIW7UAfzACyR
	VxPR8Jx2G/SqveVQLQdTT8xLkuO1AwPZycpvsSiHBd1fH14ymUzHwIvTiqGMSOrZEFXcN9BQg9qWL
	e4T6mEsbyWbCPLAfFlA88cmJBn6oFFL5F1M3QNwlwIJu7DD5NJY9Ir94sPDZizRWcmra4paAsF6w3
	P3N1Y1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyEN-0000000Fqh8-2GGa;
	Mon, 03 Feb 2025 15:19:23 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyD1-0000000FqOk-3twf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:18:01 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5137X6YA014781;
	Mon, 3 Feb 2025 15:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VQ4RqG
	5wX63XHkwCiEdYMzRbUoNudhkrKOhuQwdpm0I=; b=Nlc1VyEiuQjiYLbh9pocM7
	CLzpw0KGTWnPjmqHhoJdctttDND+tQK9HnMGI7+5OzI4UOPiC2g1jfxT+E/4BtIV
	sRXuqVCYEY+QMYpq+kzCJlXYPJJKcC/jr+wBiAnRpFY1GMFrD3kBYJg2cRwGp8VN
	3vDv5GV8RucvxRppCS/1GVFpv1u6Bscij0K+xur3Wb5seNOMbt1BYWKIU0Ts97yT
	yV9Ttyl3qwNR7zYjITItgwJC86BAgbspV7aWTEhxK+vwY8P2JFALSNld4SwgDHCL
	AU/IXMdkZIM/eZ4ifT84xINshzb+HcutkwCXvamEvqn+VMPoIEEZ7wRGln1XR9ow
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jsgnj3w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 15:17:40 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 513FGR11024317;
	Mon, 3 Feb 2025 15:17:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44jsgnj3w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 15:17:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 513C7pcF024493;
	Mon, 3 Feb 2025 15:17:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxmxxnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 15:17:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 513FHcae18088686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 15:17:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F3EC58059;
	Mon,  3 Feb 2025 15:17:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 301B95804B;
	Mon,  3 Feb 2025 15:17:37 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Feb 2025 15:17:37 +0000 (GMT)
Message-ID: <c06056b4-db8a-4c0b-b061-aa596d3519f8@linux.ibm.com>
Date: Mon, 3 Feb 2025 09:17:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] bindings: ipmi: Add binding for IPMB device intf
To: Krzysztof Kozlowski <krzk@kernel.org>, brgl@bgdev.pl,
        linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
        netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20250203144422.269948-1-ninad@linux.ibm.com>
 <20250203144422.269948-2-ninad@linux.ibm.com>
 <6def1c5d-d1a0-4a6f-9db2-453692d5423d@kernel.org>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <6def1c5d-d1a0-4a6f-9db2-453692d5423d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bmeP0_XdLDJr4zTpejIH4blsVibc7Jc7
X-Proofpoint-ORIG-GUID: LEkVc5s_HyeQNjFOjksxZRwmsKHp-Du9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994 phishscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071800_092169_7372FB6F 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Krzysztof,

Thanks for the review.


>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> You still need to fix the subject. Why patch #1 has bindings but patch
> #2 dt-bindings? Why can't this be consistent?

What is preferred now a days? bindings or dt-bindings?

-- 
Thanks & Regards,
Ninad


