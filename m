Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CCDC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBniFFc5/p1IPtlwHJOG5fqf0eKdncuC7yttR4e44n8=; b=Ykk4kHDPK+/XjYvDwDBYn6chhz
	kLaoU8PqLx/GB5bQ3jTLOpOtnzILcU7l7dEJAF3+hx+tJfH5jKeeZsOuRjYeqEMdihH4By9nWcvOz
	IpJ/Q98Zfu9qKqK9lthP7+9d5eIzw4TmV9t0+JGvS8nC8XQgInBaYbJtiG5ysyhzcWk5oYCHdr6d7
	EldH18RJx30+PPEVgsoyGMZ26SwOSz0ILSdgR7zV7SI26lm5tR1H7HrPOloxPD9/eZmQ7EzvLzWc0
	IWwxoRU0dbFLiUjG0uSC9qTmhGhgQrtceTSsKkGQGN8E5rhOQdwqy1nmGJaqVE8VpfqIkKRERTiVs
	Ow4Mnlfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Ee-000000020Uk-2aWH;
	Tue, 22 Jul 2025 09:24:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue92O-00000001xP7-35nA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:11:54 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M96AmW018853;
	Tue, 22 Jul 2025 11:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	eBniFFc5/p1IPtlwHJOG5fqf0eKdncuC7yttR4e44n8=; b=emrs40NKUFiOHe07
	UKXpZ3p5RlKp6YDSqSzhyJq8BEahW8MgEAUZFFKO0JBr6OUU9WNLPRqdpV5ribCz
	e/M227uIfWHcPwL8zGvLAaCDDSjZV+SAOVsXipBxfNIOMhEbTWkXRMGosqea4fNC
	0soau/20fRmFQgfb109Zd3/Ug5TzWJ+SeHC88HNUXET8HxBIQoEPpZDFAVq+qwca
	Xys6yBDsvbYvyTU1+mAk4A1Zht2XwWrwMRdasdqUdAh9OxNaDZ1ar06YY0l5bGre
	KwjxxSXsBzxqxrm2SBmJJaB0jPXgqF8O8NOqZmhkQZGJfp1/TDe4XNDjgle/5pRv
	DGHKaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g4spn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 11:11:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5CEFB40052;
	Tue, 22 Jul 2025 11:09:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C95F769739;
	Tue, 22 Jul 2025 11:08:32 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 11:08:31 +0200
Message-ID: <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
Date: Tue, 22 Jul 2025 11:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simon Horman
	<horms@kernel.org>,
        Tristram Ha <Tristram.Ha@microchip.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021153_275331_8FD23453 
X-CRM114-Status: GOOD (  27.35  )
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



On 7/21/25 19:07, Andrew Lunn wrote:
>> Regarding this property, somewhat similar to "mediatek,mac-wol",
>> I need to position a flag at the mac driver level. I thought I'd go
>> using the same approach.
> 
> Ideally, you don't need such a flag. WoL should be done as low as
> possible. If the PHY can do the WoL, the PHY should be used. If not,
> fall back to MAC.
> 
> Many MAC drivers don't support this, or they get the implementation
> wrong. So it could be you need to fix the MAC driver.
> 
> MAC get_wol() should ask the PHY what it supports, and then OR in what
> the MAC supports.
> 
> When set_wol() is called, the MAC driver should ask the PHY driver to
> do it. If it return 0, all is good, and the MAC driver can be
> suspended when times comes. If the PHY driver returns EOPNOTSUPP, it
> means it cannot support all the enabled WoL operations, so the MAC
> driver needs to do some of them. The MAC driver then needs to ensure
> it is not suspended.
> 
> If the PHY driver is missing the interrupt used to wake the system,
> the get_wol() call should not return any supported WoL modes. The MAC
> will then do WoL. Your "vendor,mac-wol" property is then pointless.
> 

Seems like a fair and logical approach. It seems reasonable that the
MAC driver relies on the get_wol() API to know what's supported.

The tricky thing for the PHY used in this patchset is to get this
information:

Extract from the documentation of the LAN8742A PHY:
"The WoL detection can be configured to assert the nINT interrupt pin
or nPME pin"

This PHY proposes several pins with alternate configurations so they
can act as either nINT, nPME or other type of pin. While the nPME
is dedicated to raise a signal on a WoL event, WoL event can also,
if configured, raise a signal on a nINT pin. However, the latter
case expect (extract again):
"While waiting for a WoL event to occur, it is possible that other
interrupts may be triggered. To prevent such conditions, all other
interrupts shall be masked by system software, or the alternative nPME
pin may be used"
therefore preventing other types of interrupt from triggering.

Today, the WoL is statically configured so that the nPME pin is
asserted on such event in lan874x_phy_config_init(). For it to
be functional, the nPME pin has to be wired to a wake up input of
a wake up capable interrupt controller.
On the stm32mp135f-dk board, e.g, that's the case for only one of the
two ethernet ports.

Overall it's both a combination of what pin is asserted on a WoL
and what pin is wired to a wake up capable interrupt controller.
What would be a correct approach to get the information from the PHY
driver that the WoL is indeed supported considering all of this?

Tristram, can you tell me if what I'm saying here makes any
sense?

> Correctly describe the PHY in DT, list the interrupt it uses for
> waking the system.
> 
> 	Andrew

