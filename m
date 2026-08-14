Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A16C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JwlBuMq8aFK6CuuLr9F6ZHKz8oh4YzfzcNnm8tFJaE=; b=MYqFILbn7xN/hhMQf3kr3mn3Tl
	iSMmuOZtTWAScmx+FRuLxvSu8ih9TSJf19TUSLdUc/kmNtGByjcMwU4TsoqulZ1Y04tXXDmZh5Vw6
	BDjkOBNK2QgdwRgVQ1sq9TNr9fzbvJDAUdRNhXdAItSQkqHqE7zUu+qsTBB2wwpUdpKpAQqLj6r8/
	6ple/60SJJCJyfdEtdthdGQpnK7qeEDdioeMb9sJMDCjdB99Cy9dd9/YdAThl8lkzxg0uOJFJ8WzW
	8ZsjbqzJmMr06+X7Qp6gOYn0FcfGUOE+7SkuWmehywgKQjui7ssL9V9G7FuvAmUbL/JlIiIHtNV7S
	xbXxXL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wum2E-000000025bs-37XJ;
	Fri, 14 Aug 2026 07:08:58 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wum2C-000000025bM-06hH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:08:57 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4W6Sl3237725;
	Fri, 14 Aug 2026 07:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9JwlBu
	Mq8aFK6CuuLr9F6ZHKz8oh4YzfzcNnm8tFJaE=; b=NjDYxFlSzm2PSGTMROWPCM
	RqFKnvgymgJ2IscMXyjbF5/gGcXhBscCSdixQpRJuqTvyhUfNPgmwp4MfeEeO7fd
	Aw1puLIdH3y4YF15ARlytxpi1QByZ27utFMScNdEtIV9gD+RfnT8AU9VxKwvy4Yt
	NBffvVl9qMBllncB497rve8AtWxa6HnTVhJwklo0ti8Jyxhwvt6IHIRA//SEcIvU
	rfKSwgemjL9M0mz5ISB+C7YhxEBjIww3gOYQwPHLfddljo3zfGo2fKuG1LLbja4k
	k9tPDz3Q14ccGa3qlmq1ADc0w6fREZICd4gmlCIjp+Ssf+CZEUql86NRyw9WMcBQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fyb243vxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 07:08:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67E6uNn2030574;
	Fri, 14 Aug 2026 07:08:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxg9he86a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 07:08:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67E78YRX42467754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2026 07:08:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D5B820043;
	Fri, 14 Aug 2026 07:08:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C463B20040;
	Fri, 14 Aug 2026 07:08:30 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Aug 2026 07:08:30 +0000 (GMT)
Message-ID: <014a7724-4955-4fb5-b331-ab5fc9abf806@linux.ibm.com>
Date: Fri, 14 Aug 2026 12:38:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: locomo: use put_device() on device_register()
 failure
To: Tarun Sahu <tarunsahu@google.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>, djeffery@redhat.com,
        Nicholas Piggin <npiggin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, dmatlack@google.com,
        Pasha Tatashin <pasha.tatashin@soleen.com>, souravsgl@google.com,
        skhawaja@google.com, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20260813095421.1700945-1-tarunsahu@google.com>
 <20260813095421.1700945-2-tarunsahu@google.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260813095421.1700945-2-tarunsahu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XqfK/1F9 c=1 sm=1 tr=0 ts=6a7ebef5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=1XWaLZrsAAAA:8
 a=VnNF1IyMAAAA:8 a=uCD4N2YI4OkgVMcWFWUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1NCBTYWx0ZWRfX9eL7khLqTpsz
 H9mU347g0+6t8AubXsC+IdnMzvGvVj1JPyVoc6bwspDLgyykecXW4jbXAPLrfHYrL7L0psDid/L
 gyZMu2eDW5worrAuTf9zUqhvxY/3rEIEkHlLBoyJzRIDXWGsj1/ppziMcszWeLu1z/mtQEts0Dd
 iDd5WTlgxKxUS31IbkwuzkjhA7x/ICpCWzWLfKnazv5tQf0URxxnrya1ZaHxZIKf74ecUA2zJol
 Lc5AwNwtxW47dg5M0tzrB4MIupmKStXDVbzkrVP8uKUqldnigCU45b/X752wU9GHaccuMWiGW1f
 S6ZmkFuZAZ92tybdKK3mE4GGsQoFv0NoRd4DEDyYRCANysqBGXodyFmp7MRvjV2R4Yu+D//SUXt
 fru7HByrpfNqvM6ZrDhx8CFVodgT6hQ8BxFSsULJcJyKtd6+ONOhkxFqS/Ma4e8oe4esnviFhro
 Y+T+OEizBLfyUj3fpjw==
X-Proofpoint-ORIG-GUID: oqNk42v34wyTHQGK2XQV_4jNpEaF25LA
X-Proofpoint-GUID: yVKkax5Z7IlTCXG2MEVswgh_oYrze_6h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1NCBTYWx0ZWRfX2Dp5/Q+fZtPN
 /Dy2Ldcv0ZmgEmPeJH/1/wChuuXbPg/tV7+NuZcfI/y6R7yxPHtnJ0hKQA9appoZsVRYjOblJ3d
 l0yxHm3G4bCFC1+rTmr2837fRr7wzQk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000856_204113_4AE3BABD 
X-CRM114-Status: GOOD (  19.94  )
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



On 13/08/26 15:24, Tarun Sahu wrote:
> When device_register() fails, calling kfree(dev) directly bypasses the
> device_release() callback (locomo_dev_release) and leaks internal driver
> core structures allocated during device initialization.
>
> Fix this by replacing direct kfree(dev) with put_device(&dev->dev) when
> device_register() returns an error, ensuring proper refcount decrement
> and cleanup via locomo_dev_release().
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>   arch/arm/common/locomo.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index 55e360452828..0f6689d343b0 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>   	int ret;
>   
>   	dev = kzalloc_obj(struct locomo_dev);
> -	if (!dev) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	if (!dev)
> +		return -ENOMEM;
>   
>   	/*
>   	 * If the parent device has a DMA mask associated with it,
> @@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>   
>   	ret = device_register(&dev->dev);
>   	if (ret) {
> - out:
> -		kfree(dev);
> +		put_device(&dev->dev);
> +		return ret;
>   	}
> -	return ret;
> +
> +	return 0;
>   }

Changes look good to me. Feel free to add:
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

>   
>   #ifdef CONFIG_PM


