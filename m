Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B91C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw+9abg65qtzhopcWRW98RquusMS7BgzR4MlvBoonYE=; b=aNAGBGsGHs59jQqwFVK3OQe9Ty
	/HhplrsrjtWWN65GumQ+mIeqNuoubeet27anSy1qbXgKwGtZBxrwkNJrpuHyzTOUfRbFL32ktz1oE
	AW0ZPBMxv7sKk/Wo3u0UdcyrHTTYj+h1GzyPUWQUoZh8QC+0wUnVbqSfJZrQos83RIAecdKqy9Bno
	ZGVSrQNrw91gp2tbUzSlhKwSmXdkAsSYA2MMggp9sNFpn9VLiO2LSyPYJIvdaIkfK0zg5gL0KVLdO
	klSaksQbw1x39skxQkCZWr7D9lp4Ae4hDHi1UEOK9A1viZGKO0AiJqd7klbRqWlK3EUIdIFkFC1u3
	GqDeN0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9H5-000000020sE-1VlB;
	Tue, 22 Jul 2025 09:27:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue93m-00000001xkl-34KC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:13:20 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8r4kG007617;
	Tue, 22 Jul 2025 11:13:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pw+9abg65qtzhopcWRW98RquusMS7BgzR4MlvBoonYE=; b=XvNedHfmkxe2wPK5
	udHnCKBe65lKGJ/EmrVyk+X4ukBk8VCa4AOgxvwLVVYCc1eTGh2AeBx1MjKEUejr
	qHXSFJHOIPEujzDGikw4mpaJEZ7drJvlj55iOPTjNy/lAJaDeCDvcy7H5VCW1YMg
	HOu4UWZ5u5IXVD964KBVN0/dawCOcx7O0mI2Ep5wMymr/+sQngCM9Py2Zj9gboc/
	mVpsh4djFXgZzKuT0NcTGfT0R51ezrk65713VYY0tE29KIAfSGhwrL8IFCR9GkQO
	ytYY1FBVo9ELsJergwp0f9mVufzD79O7fult2etdIesVrT2OmYhR3/xYk6ATmHjn
	yn56UA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800skwnmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 11:13:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 18F3540044;
	Tue, 22 Jul 2025 11:11:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5702376C468;
	Tue, 22 Jul 2025 11:10:41 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 11:10:40 +0200
Message-ID: <cb006404-e7d1-4a08-b2b4-460ede971799@foss.st.com>
Date: Tue, 22 Jul 2025 11:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Simon Horman <horms@kernel.org>,
        Tristram Ha
	<Tristram.Ha@microchip.com>,
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
 <aH8-nQtNVuewNuwU@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aH8-nQtNVuewNuwU@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021319_158240_173F8C60 
X-CRM114-Status: GOOD (  16.98  )
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



On 7/22/25 09:32, Russell King (Oracle) wrote:
> On Mon, Jul 21, 2025 at 05:56:17PM +0200, Gatien CHEVALLIER wrote:
>> Here's an extract from the Microchip datasheet for the LAN8742A PHY:
>>
>> "In addition to the main interrupts described in this section, an nPME
>> pin is provided exclusively for WoL specific interrupts."
> 
> So the pin on the PHY for WoL is called nPME? If this pin isn't wired
> to an interrupt controller, then the PHY doesn't support WoL. If it is
> wired, then could it be inferred that WoL is supported?
> 

For this PHY yes, but it's a bit more tricky. In my response to Andrew,
I added a bit more information.

> If so, then it seems to me the simple solution here is for the PHY
> driver to say "if the nPME pin is connected to an interrupt controller,
> then PHY-side WoL is supported, otherwise PHY-side WoL is not
> supported".
> 

If there's a proper way to do this, sure!

> Then, I wonder if the detection of the WoL capabilities of the PHY
> in stmmac_init_phy() could be used to determine whether PHY WoL
> should be used or not.
> 

Yes, sure.

Best regards,
Gatien

