Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PW1LH2F8Qxvgif3YU5Y3z1CGnrmFPIED3xPs36aiFdc=; b=gIKvhAUN12Er1BjlVM7NCHWwEI
	N3XXd/fQnMGtG928qW5qq/M0HyHc21arLN+hnfa+k+e6b8XLHuTig721/UFfrv/Lo7wA6s02m+YG8
	2GDllf1PLlTsor28t0nAN8pD0NaBnmYFyIdEqVw8g7O3KhC8o2/bBQXtNsti47qnoV7i8dTjLX6KM
	7keYJSl0R7sh28qSk2Jg67Ao+UctrqhVHw0rZB4vHoK6v3QFguYKUY9kYRYNB6p0pxwI2uImSwIdC
	R3dy6i+b6GbX4mAhkPhf5JQBntj5/XR1jTOawE9PnvhS45VeaNSAUo8evAsia/hvuUPWD0/cxqhL4
	f3FB6Rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Jt-00000004MyV-2SYN;
	Fri, 13 Dec 2024 16:15:13 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Hs-00000004Min-0VVb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:13:09 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEIuv6015637;
	Fri, 13 Dec 2024 16:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PW1LH2
	F8Qxvgif3YU5Y3z1CGnrmFPIED3xPs36aiFdc=; b=IFz2XB9KxBQc8Ujd8Xiybl
	y8j268CsM6r8SqPK89Jql5bAhJZxtMSNtBiguZWzNpe3UOGr2OUCtFDu6cgcLzWx
	J90QX0C2oAH2PnsSFLjsC59qkkvX4dKReP8JOI639+rpZ686znUFKOiXcbl933rS
	rHjBO3icTzSSwF6ZdzL+iNxVmbGov+xLbe37GDK6jfliaLszFkZ0bz4bcWGbFmOj
	+2pGrlEelsjg9HOKuGahLSwcYDucIr8Nl1wq776HawnE5yRb0Bl8f12LxTLDBRJE
	6F40wT06m46cbatgGlY1uIb1kdsg+uNe7E6ciLDo7alYl3EyOtb3tp1xIw/uu2XQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43gh43a73g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:49 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BDGCmio015273;
	Fri, 13 Dec 2024 16:12:48 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43gh43a73d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDFWlBq032734;
	Fri, 13 Dec 2024 16:12:47 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0psxx0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:12:47 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BDGCkHw53936584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:12:46 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC53158058;
	Fri, 13 Dec 2024 16:12:45 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F91458059;
	Fri, 13 Dec 2024 16:12:42 +0000 (GMT)
Received: from [9.61.68.160] (unknown [9.61.68.160])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Dec 2024 16:12:42 +0000 (GMT)
Message-ID: <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Date: Fri, 13 Dec 2024 10:12:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Guenter Roeck <linux@roeck-us.net>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        ninad@linux.ibm.com
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
 <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NzpH0gdcpRWbYIcxxx5eotGsIgESifCn
X-Proofpoint-GUID: OxreHfqoC1Ht6a91pdGiYTk7dSHkFhRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=718 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_081308_268426_05863B00 
X-CRM114-Status: GOOD (  16.36  )
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

Hello Guenter,

On 12/12/24 16:06, Guenter Roeck wrote:
> On 12/12/24 13:49, Ninad Palsule wrote:
>> Adding label files for fan and temperature sensors in the power supply.
>> The openbmc application dbus-sensor(psusensor) requires those files to
>> consfigure those sensors.
>> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
>> as dbus-sensor(psusensor) application calculate index based on last
>> digit in the name so we do not want to make index double digit after
>> appending page index.
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>
> We are not going to fix userspace problems in the kernel.
>
> Guenter
>

Thanks for the quick review.

Sorry I am not clear on this. I feel that it is better to support labels 
for temperature

sensors and fans like other. Are you saying we should not support these 
labels or

I need update in the patch to support them better?

Please let me know.

Thanks & Regards,

Ninad Palsule



