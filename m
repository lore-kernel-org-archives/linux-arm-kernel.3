Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32CCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL/s9BaV7zaTxsqmUo1LrDXYoClwJBwlRVE6OKrf/cc=; b=uw7z4pYWcOqoCeOwj79PCBEtVC
	K5Wt/IIXeJVhLabPnDWDnbcVoLlrAL+zAyd48MGeFftfMhdVCzCyxtXWHHBUFh/rVCv9sVHD2wZWn
	EgtzO3j/5z6vg4KguXa4QZLxPiMbI1g/5vZH/THSvcVNLZypCgWQOl5ZiVSSe6Iu5Z51BCm+Bf6hu
	DF5fo+OXGmD/rMxwRxWwsONmF8udlgoZJ0ns+GgrXw6vkUuQJ/62eyt+izulURRZA49k7Ug/FzcT1
	hzsUPMYAphoOzubHj0E8cxuPdt5fCYbOhmusHWOeFyPgq2UGjvhkVfqz+Js7Cqxq+vQwwZu7kRfJ+
	1FXpI9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVcuo-00000009oiB-28Sv;
	Wed, 08 Jan 2025 20:44:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVctY-00000009oQQ-0Qwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 20:43:17 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508DXA9J028918;
	Wed, 8 Jan 2025 20:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NL/s9B
	aV7zaTxsqmUo1LrDXYoClwJBwlRVE6OKrf/cc=; b=eNflmo6SvxUT0BrJA7hQ7J
	FkF9So2pLcLA9eVZqXDTGW/9YLnkk5c1p/oKlmfcQumcxgZcyLedR2TkiJcqmWJJ
	tANBa5wyvicB9wAwflQVAcC8D2gfnNDRlZhyCXNqfk7WFaA8axghP53szr27Dez2
	Ju7yCNCEFiOSerFe6mGd/rpVhH0S3tnjlQ9Rh/x+F3y+Mdsuq+fTPxOVhHl5musO
	o7/d0Jnqys48h1B8rB0r8I4IXe+F5dQxIlVmHo5+4cHUWRgjxApEfWh3tHF/1I9g
	ch5chv8Zs+thoyxslTA98TU0q5xBQmoGtRPORle0bFsa78U257ItHPtKn4sHzRZw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441e3b504h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 20:42:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 508Kgf9C023841;
	Wed, 8 Jan 2025 20:42:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441e3b504d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 20:42:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508H6MFx013698;
	Wed, 8 Jan 2025 20:42:40 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygap1mk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 20:42:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508KgdEJ32244282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 20:42:40 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2A9C5805E;
	Wed,  8 Jan 2025 20:42:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E114C58055;
	Wed,  8 Jan 2025 20:42:36 +0000 (GMT)
Received: from [9.61.139.65] (unknown [9.61.139.65])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 20:42:35 +0000 (GMT)
Message-ID: <ffcf60ec-1096-477d-a176-8e0006e19537@linux.ibm.com>
Date: Wed, 8 Jan 2025 14:42:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: system1: Add RGMII support
To: Andrew Lunn <andrew@lunn.ch>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, ratbert@faraday-tech.com,
        openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
        joel@jms.id.au, andrew@codeconstruct.com.au,
        devicetree@vger.kernel.org, eajames@linux.ibm.com,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-6-ninad@linux.ibm.com>
 <1dd0165b-22ff-4354-bfcb-85027e787830@lunn.ch>
 <0aaa13de-2282-4ea3-a11b-4edefb7d6dd3@linux.ibm.com>
 <b80b9224-d428-4ad9-a30d-40e2d30be654@lunn.ch>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <b80b9224-d428-4ad9-a30d-40e2d30be654@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uuLbOCNnCqgmUzbDmEULaBTqgYB73fYD
X-Proofpoint-GUID: jiNFDMoRHnfifok2G5gq4nJjzYBletlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_124316_274835_5BE8894A 
X-CRM114-Status: GOOD (  19.78  )
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

Hi Andrew,

On 1/8/25 14:13, Andrew Lunn wrote:
> On Wed, Jan 08, 2025 at 12:43:07PM -0600, Ninad Palsule wrote:
>> Hello Andrew,
>>
>>
>> On 1/8/25 11:03, Andrew Lunn wrote:
>>> On Wed, Jan 08, 2025 at 10:36:33AM -0600, Ninad Palsule wrote:
>>>> system1 has 2 transceiver connected through the RGMII interfaces. Added
>>>> device tree entry to enable RGMII support.
>>>>
>>>> ASPEED AST2600 documentation recommends using 'rgmii-rxid' as a
>>>> 'phy-mode' for mac0 and mac1 to enable the RX interface delay from the
>>>> PHY chip.
>>> You appear to if ignored my comment. Please don't do that. If you have
>>> no idea about RGMII delays, please say so, so i can help you debug
>>> what is wrong.
>>>
>>> NACK
>> I think there is a misunderstanding. I did not ignore your comment. I have
>> contacted ASPEED and asked them to respond. I think Jacky from Aspeed
>> replied to your mail.
> You did not mention in the cover letter, or the patch. I asked for a
> detailed explanation in the commit message why it is correct, which
> you did not do.
Ah, ok. Sorry about that.
>
> Now we have more details, it is clear Ethernet support for this board
> needs to wait until we figure out how to fix the MAC driver. Please
> either wait with this patchset until that is done, or drop this one
> patch for the moment and submit it later once the MAC driver is fixed.

ok, Thanks!

Regards,

Ninad

>
>        Andrew
>
>

