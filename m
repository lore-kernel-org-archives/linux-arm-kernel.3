Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F955F01834
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIJN0S2i+G1+Zu2GDBS3J5U+WhZtGEP8XGdgr0IxWIk=; b=XMPaxCPqOVveEmckr9EPNbfxXd
	+pDXB1hB6g96Cl56NIOt1cOaZx/JSdvH4adZFzJDW9IweFMmPwptjspGM2etNw4qjHOx/SEYXJOMf
	61nL5HtmstsR6j32vcQDpT8GQ90FlSIywKZZkpIHl8Co7mKyUgvHrlsShbomKHflE2D22AQsNWa6r
	aqP8M6ph76+zfQvYhn1fEsGR91yFZtFUYN6IK1MxvovmNDxRj7VOrKEA0V+VxexCHeHd++CGUneUS
	E4LgX8yxQ9mbf6PSEd4/RYU0ITb8DriqtW52XERNRbPja+rg3y7dgNXovb+mE7bdL/g2nG/HXCNy6
	AE3N3j7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhp-00000003hYI-2M3s;
	Fri, 06 Mar 2026 12:55:01 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUhm-00000003hEq-1TLW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TIJN0S2i+G1+Zu2GDBS3J5U+WhZtGEP8XGdgr0IxWIk=; b=HrTlWy89Hz6c72MYh+OR6M4LLM
	2FFHKmzDxQWJLcolJFtN2Nd6Yf3Fe7OWMJd8GVJv98fsVXHW0O+LnUchsvf38fJJZDyJmH4QgHym+
	Lv4CiT/cMTJFAQCBoNNHft7z1Xo2nZL8DmpUNZo+m4syW/3n4Q6ul44MSk+6CQycjSXcrbmNi4t2Z
	toiVArm/cpuy6BZDDzDhpxQpflKcV1F/ieVQTbyTQK2qG0XZXtdyThoyOgdpG3ZXXEl/505c3cn/J
	xrnpey74NRb3stYvmB0aHo096vk/2N8a8nLLOyfMmQDqVME7ySL4oe+jIkS9Bo24M4df5aRN3DHyJ
	K16vGEkw==;
Received: from [122.175.9.182] (port=42633 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1vyUh3-0000000HVU2-0SiH;
	Fri, 06 Mar 2026 07:54:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id DE4C81B63531;
	Fri,  6 Mar 2026 18:24:03 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10032)
 with ESMTP id UopsSJbXo5od; Fri,  6 Mar 2026 18:23:58 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 95CA31B63501;
	Fri,  6 Mar 2026 18:23:58 +0530 (IST)
X-Virus-Scanned: amavis at couthit.local
Received: from zimbra.couthit.local ([127.0.0.1])
 by localhost (zimbra.couthit.local [127.0.0.1]) (amavis, port 10026)
 with ESMTP id w4wq8x86NNWU; Fri,  6 Mar 2026 18:23:58 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 6A8561B6352E;
	Fri,  6 Mar 2026 18:23:58 +0530 (IST)
Date: Fri, 6 Mar 2026 18:23:58 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Parvathi Pudi <parvathi@couthit.com>, nm <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux@armlinux.org.uk, 
	ardb@kernel.org, ebiggers@kernel.org, arnd@arndb.de, 
	geert+renesas@glider.be, tiwai@suse.de, 
	kory maincent <kory.maincent@bootlin.com>, 
	dmitry baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	prabhakar mahadev-lad rj <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	twoerner@gmail.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>, 
	praneeth <praneeth@ti.com>, srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	danishanwar <danishanwar@ti.com>, m-malladi <m-malladi@ti.com>, 
	krishna <krishna@couthit.com>, mohan <mohan@couthit.com>, 
	pmohan <pmohan@couthit.com>, basharath <basharath@couthit.com>
Message-ID: <553997175.593910.1772801638376.JavaMail.zimbra@couthit.local>
In-Reply-To: <cc704eb9-e581-44c4-a564-5581cc39f27f@kernel.org>
References: <20260228062109.250794-1-parvathi@couthit.com> <cc704eb9-e581-44c4-a564-5581cc39f27f@kernel.org>
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable CONFIG_BRIDGE and
 CONFIG_DP83848_PHY for TI AM57x, AM437x and AM335x
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.233]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20240927 (ZimbraWebClient - GC138 (Linux)/9.0.0_ZEXTRAS_20240927)
Thread-Topic: multi_v7_defconfig: Enable CONFIG_BRIDGE and CONFIG_DP83848_PHY for TI AM57x, AM437x and AM335x
Thread-Index: 6jyGhjqlCmGsDQ8sYXDPICzovmuTWw==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_045458_473182_BF1B3099 
X-CRM114-Status: GOOD (  11.95  )
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

Hi,

> On 28/02/2026 07:21, Parvathi Pudi wrote:
>> Enable CONFIG_BRIDGE in multi_v7_defconfig as a module.
>> This is to support STP/RSTP Switch mode using PRU-ICSS
>> on TI SoCs.
> 
> Which boards need it? We don't care for example for downstream TI SoCs.
> 

This is for AM57xx, AM437x and AM335x boards using PRU-ICSS in switch mode (STP/RSTP).
Since STP/RSTP support has been merged to mainline recently, enabling BRIDGE as a module
allows switch mode to work seamlessly.

We will add the SOC details and post the next version shortly.

> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 

Sure, we will address this in the next version.

> 
>> 
>> Enable CONFIG_DP83848_PHY in multi_v7_defconfig since
>> TI TLK10X PHY is used in TI SoCs and the support for
>> TLK10X is available in DP83848.
> 
> Don't repeat the same twice. Once is enough.
> 

We will clean up the commit message, remove the duplication.

>> 
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>  arch/arm/configs/multi_v7_defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/arch/arm/configs/multi_v7_defconfig
>> b/arch/arm/configs/multi_v7_defconfig
>> index f75d75cf91c8..f0a2971fb57f 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -281,6 +281,8 @@ CONFIG_TI_KEYSTONE_NETCP=y
>>  CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
>>  CONFIG_TI_PRUSS=m
>>  CONFIG_TI_PRUETH=m
>> +CONFIG_BRIDGE=m
> 
> I don't see how this is related. Plus none of these two look properly
> placed.
> 

We'll fix the config placement and address this in the next version.

Thanks and Regards,
Parvathi.

