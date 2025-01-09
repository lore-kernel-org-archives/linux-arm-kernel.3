Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4WYV/lBqDuwS3x6xguYcEfUiXeq4SXjFmogzAE4jlY=; b=lebaPGSCge+0p1rsFjAOW4X12U
	UuNInRygWaHEIL7NNfI5NV7wYUdFnGc5GrcU+Cf4XiRQHyR611/RVAbqZ1s9VhXi+OcM4zom7/pyi
	hEq4kqESjoUY/SriR4yE9+7duIbpBT0KRnfgEFxBO6IBD7SvaW/DMCuxbPUvaPkleuLUrj5js8noD
	KZk8xKBEUqtCIRFRUQBU5l/pefDqugQraVjPaoanWe5aKrHWFM4Ubc/ZajY4SPJwn9xe1hLM1IFzm
	x+C9/7FvzUiag5QiY0DJIiphsNIrxh5YpWrzXmfOf2U9C9toM8SN0pVpzvxoCxSqTEBq5fHIi0Sli
	VCK34wVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtcR-0000000CFgs-06pN;
	Thu, 09 Jan 2025 14:34:43 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtak-0000000CFCN-1UIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:32:59 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50985ZkV022344;
	Thu, 9 Jan 2025 14:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a4WYV/
	lBqDuwS3x6xguYcEfUiXeq4SXjFmogzAE4jlY=; b=D35v4VwvI1M8HpJsAPOasd
	eRruPQqZXqyJ3WhcCy+1kV6fZMnmxpu77zFS/dz+AJCA/cwwldDnkUESVzSkIdXa
	X3dOeIYO7HiD2dLeHTdQdSJzLcTeYLaC0e1bJs9Uh4qiMjaGOsq1SNj/qk2BC/Fe
	lPGrWYuifpNnalP+5rpCV58S5RiDHJGzj1XmozxSj01OBRSE2Q5ot+Hvl26rdr/7
	RQS94A14lVPvKTc5/imLR8zz5fBf8nLoT1EHClzJ0BCIzKYe2zje0YAV7ttYT958
	PKluzbXSlvdV82p8RlR2Q7dfJCeMPUxiGIcfTJO2fo5Vu6ZsCykGFWOPdDaLl/VQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442an2hkvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:32:22 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 509EOrxJ010500;
	Thu, 9 Jan 2025 14:32:21 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442an2hkvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:32:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 509CG5VP003593;
	Thu, 9 Jan 2025 14:32:20 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatdqdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:32:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 509EWKN847776206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 14:32:20 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 404F158056;
	Thu,  9 Jan 2025 14:32:20 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BFCA58045;
	Thu,  9 Jan 2025 14:32:16 +0000 (GMT)
Received: from [9.61.139.65] (unknown [9.61.139.65])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 14:32:16 +0000 (GMT)
Message-ID: <6ac77e5d-e931-494a-9777-6ed0bc4aa1e9@linux.ibm.com>
Date: Thu, 9 Jan 2025 08:32:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] ARM: dts: aspeed: system1: Add RGMII support
To: Andrew Lunn <andrew@lunn.ch>, Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "edumazet@google.com" <edumazet@google.com>,
        "joel@jms.id.au"
 <joel@jms.id.au>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "minyard@acm.org" <minyard@acm.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
        "robh@kernel.org" <robh@kernel.org>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8L7sZPoUTETvRf7B5TvBSMQ-8W5xEmny
X-Proofpoint-ORIG-GUID: py666dZ04-ObN4IbDM5590QG7o3LXVlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_063258_601258_2794FB2C 
X-CRM114-Status: GOOD (  33.58  )
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

Thanks for the explanation.

On 1/8/25 11:52, Andrew Lunn wrote:
>>> Does the mac0 TX clock have an extra long clock line on the PCB?
>>>
>>> Does the mac1 TX and RX clocks have extra long clock lines on the PCB?
>>>
>>> Anything but rgmii-id is in most cases wrong, so you need a really
>>> good explanation why you need to use something else. Something that
>>> shows you understand what is going on, and why what you have is
>>> correct.
>> Here I'll add some explanation.
>>
>> In our design, we hope the TX and RX RGMII delay are configured by our MAC side.
>> We can control the TX/RX RGMII delay on MAC step by step, it is not a setting to delay to 2 ns.
>> We are not sure the all target PHYs are support for RX internal delay.
>>
>> But ast2600 MAC1/2 delay cell cannot cover range to 2 ns, MAC 3/4 can do that.
>> Therefore, when using ast2600 MAC1/2, please enable the RX internal delay on the PHY side
>> to make up for the part we cannot cover.
>>
>> Summarize our design and we recommend.
>> AST2600 MAC1/2: rgmii-rxid
>> (RGMII with internal RX delay provided by the PHY, the MAC should not add an RX delay in this
>> case)
>> AST2600 MAC3/4: rgmii
>> (RX and TX delays are added by the MAC when required)
>>
>> rgmii and rgmii-rxid are referred from ethernet-controller.yaml file.
> O.K, so you have the meaning of phy-mode wrong. phy-mode effectively
> described the PCB. Does the PCB implement the 2ns delay via extra long
> clock lines or not. If the PCB has long clock lines, phy-mode is
> 'rgmii'. If the PCB does not have long clock lines, 'rgmii-id' is
> used, meaning either the MAC or the PHY needs to add the delays.
>
> The MAC driver is the one that reads the phy-mode from the DT, and
> then it decides what to do. 95% of linux MAC drivers simply pass it
> direct to the PHY. If the phy-mode is 'rgmii', the PHY does nothing,
> because the PCB has added the delays. If it is rgmii-id, it adds
> delays in both directions. This works, because nearly very RGMII PHY
> on the market does support RGMII delays.
>
> There is however a very small number of MAC drivers which do things
> differently. Renesas produced an RDK with a PHY which could not do
> delays in the PHY, and so were forced to do the delays in the
> MAC. Please look at how the ravb driver works. If the PCB does not add
> the delays, rmgii-id, the MAC driver adds the delays. It then masks
> the phy-mode it passes to of_phy_connect() back to 'rgmii', so that
> the PHY does not add any delays. If the PCB did add the delays,
> 'rgmii', the MAC driver does not add delays, and it passed rgmii to
> the PHY driver, and it also does not add delays.

When does someone use rgmii-txid and rgmii-rxid?

Regards,

Ninad

>
> So, your MAC driver is broken. It is not correctly handling the
> phy-mode. First question is, how many boards are there in mainline
> which have broken phy-modes. If this is the first board, we can fix
> the MAC driver. If there are already boards in mainline we have to be
> much more careful when fixing this, so as not to regress boards which
> are already merged.
>
> Humm, interesting. Looking at ftgmac100.c, i don't see where you
> configure the RGMII delays in the MAC?
>
> 	  Andrew
>

