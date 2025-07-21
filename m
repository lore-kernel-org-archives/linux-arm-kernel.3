Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2C8C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqiwAVutR1r5EQfU0bWFAUEcQiPbqDN4nQ+mORgbmZw=; b=lnRMvYaYUCWIpJObSN1APb0f0W
	gK9/bZUovbZTFBNA/M+q2xtbv26w/5J9gD0d+/fdj+C0f7gydN6CNs+MUyxByzcLAJCv2Ym8zlohm
	lg3m7FQPI6Hkhr7Oi3OHnQRPufPbV/ejA+LINyEMbxm976JL09t6nBGWu05HML0r0qxmfWsFFg4N5
	xG5/eFcMgc6/URJjxfS5c2NNEBr54qmTQgXJUYz2zZNKqu8cMZ+CERbTUik/0FqVSrdEKUU2IE3bH
	fj9D/3ksnGtXP1vPsF6j22/Drp77Q+QmdVXrySEQ1aYd0+xU8M3WDmPtN1/p5MQttRjXwL91lSUzm
	5TwKEWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqkT-0000000HPYh-0pm4;
	Mon, 21 Jul 2025 13:40:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpbJ-0000000HFkm-49Ke
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:26:39 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCB6IN007054;
	Mon, 21 Jul 2025 14:26:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fqiwAVutR1r5EQfU0bWFAUEcQiPbqDN4nQ+mORgbmZw=; b=DAyLPBEAplfXgm0X
	o93LZeJwbDtNejaod2Dtz+F0rJSKVcNuTfA8NE1KghKatYoZ3/0IcygcXYkoASoe
	zEN/P+q4CSd4zAqlViY2B+SC3gd82JhjD6eY0nDP+zDwI+9VHZQtpMx64ghQ8G1z
	7GlfFqfrDZ1b8QpSZanCAOI/VykHbgASaUp2DbRXvaaVFCu+6kO0LMlodu08HsSH
	MTJY9ox9uug/nPb/MrOkP1kxXx7+zdjn7c2KQLqh3C0ZK7yHRzo5UC5DiV4cm/28
	HVMXPWAZCEfXT+PvLJd7Ls6uk3fzkEjiiF8EXa+at4Mfdd7r/Esojzkev0DL+s7l
	shNFCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028g0fh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 14:26:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56DDC40047;
	Mon, 21 Jul 2025 14:24:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CF5B7A4C92;
	Mon, 21 Jul 2025 14:23:30 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 14:23:29 +0200
Message-ID: <1fc9d75e-459d-454f-b8dc-1fb7f59d09b4@foss.st.com>
Date: Mon, 21 Jul 2025 14:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>,
        Simon Horman <horms@kernel.org>,
        Tristram Ha
	<Tristram.Ha@microchip.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
 <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aH4kVBTxd4zRYv2l@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_052638_295501_76A9ED41 
X-CRM114-Status: GOOD (  19.33  )
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

Hello Russel,

On 7/21/25 13:28, Russell King (Oracle) wrote:
> On Mon, Jul 21, 2025 at 01:14:45PM +0200, Gatien Chevallier wrote:
>> +static int smsc_phy_suspend(struct phy_device *phydev)
>> +{
>> +	if (!phydev->wol_enabled)
>> +		return genphy_suspend(phydev);
> 
> This should not be necessary. Take a look at phy_suspend(). Notice:
> 
>          phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
>                                (netdev && netdev->ethtool->wol_enabled);
>          /* If the device has WOL enabled, we cannot suspend the PHY */
>          if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
>                  return -EBUSY;
> 
> PHY_ALWAYS_CALL_SUSPEND is not set for this PHY, therefore if
> phydev->wol_enabled is set by the above code, phydrv->suspend will
> not be called.
> 

Indeed, thank you for pointing this out. I will remove this callback for
v2.

>> +
>> +	return 0;
>> +}
>> +
>> +static int smsc_phy_resume(struct phy_device *phydev)
>> +{
>> +	int rc;
>> +
>> +	if (!phydev->wol_enabled)
>> +		return genphy_resume(phydev);
>> +
>> +	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
>> +	if (rc < 0)
>> +		return rc;
>> +
>> +	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
>> +		return 0;
>> +
>> +	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");
>> +	rc = phy_write_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR,
>> +			   rc | MII_LAN874X_PHY_WOL_STATUS_MASK);
>> +
>> +	return rc;
> 
> Note that this will be called multiple times, e.g. during attachment of
> the PHY to the network device, when the device is opened, etc even
> without ->suspend having been called, and before ->wol_enabled has
> been set. Make sure your code is safe for this.
> 

If ->wol_enabled isn't set, then we should fallback to the previous
implementation so I expect it to be fine for that matter.
Then, I expect flags to be set only in case of WoL event received.
Nevertheless, I will double check the phy_* API used in this sequence
for V2, thank you.

Best regards,
Gatien

