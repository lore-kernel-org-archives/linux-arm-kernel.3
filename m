Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61732C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlPUcJGCX9eGUJmog410SGdHvgab8UL6u6jJvem96Jg=; b=ATy6U49f9WqLxyhUd1ukvy5O/v
	VSe7rlgTLugsad9RVTfBFNplGiobZBBV8rN6CC3vVniuuwknZt5nI7ifadgER8EZ90bs2yJF9UGVD
	zbTi5LrTr6L+dqDklbe1w7j1gdhquhbW/XytFM3hD4LBjQzqfV5bv+3wPieJHDYX1m/uI+ZsVYOZm
	9mw32ceFBTHbkSg/GVc+L+B0VUG5GS/hTzAlK/xGf3zCTx5ZrNVmBV5D/N62gshTPTStpYAIvc/lL
	D+8TL3VE8z6erhE90T1aWJrCJoroF653aBQ5tEhWMZYk9QeuWpUC0CybI6Dc5KqwUAo3ocNKmY6y+
	EhlcINjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbA-00000000Bxs-2HoK;
	Mon, 21 Jul 2025 16:42:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrPT-0000000HVPs-3kOl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:22:33 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCPm57020352;
	Mon, 21 Jul 2025 16:22:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MlPUcJGCX9eGUJmog410SGdHvgab8UL6u6jJvem96Jg=; b=5iIxQfL4YWN2yOno
	Nav6nT0ot5lu7hhSPyXgIerU2aur1+pWl2zGqeVjwo5/MoRbNadUTCrznjLT6TA2
	TaNHCcQbUg79u4zgfZ1O9g9Vzdl9kvccvLpIX9bvOJJaLruoh8epwg9EXkyX5bZI
	HBffxDudJzyO/nBTZnXGGRTuIBlzLysZ8qs1DiKVOZiSbSdG/gSZSIL+QQcDwfNM
	8lHkW+sNsPxrhPb3JUzOj/Fg5nvwoylJ3DKlGL8PWv6cyARyZE2P2qxSoGTxpeJ8
	ClX+EVBlHiLtWapJDla7SIQTQ2zQW1eT6/lUrBSu7KW2M741cnudg2Mve0D671uW
	QvzB2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q21em4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 16:22:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B30240054;
	Mon, 21 Jul 2025 16:20:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2988376EA8E;
	Mon, 21 Jul 2025 16:19:09 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 16:19:08 +0200
Message-ID: <b95e3439-717b-4159-acf9-7ce76d1c43d4@foss.st.com>
Date: Mon, 21 Jul 2025 16:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
To: Andrew Lunn <andrew@lunn.ch>
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
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
        Tristram Ha <Tristram.Ha@microchip.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
 <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_072232_239495_1772D86E 
X-CRM114-Status: GOOD (  14.20  )
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

Hello Andrew,

On 7/21/25 15:26, Andrew Lunn wrote:
>> +static int smsc_phy_suspend(struct phy_device *phydev)
>> +{
>> +	if (!phydev->wol_enabled)
>> +		return genphy_suspend(phydev);
>> +
>> +	return 0;
>> +}
> 
> Suspend/resume is somewhat complex, and i don't know all the
> details. But this looks odd. Why does the phylib core call suspend
> when phydev->wol_enabled is true? That at least needs an explanation
> in the commit message.
> 

As stated by Russel, this callback is not needed because phy_suspend()
will not call this suspend() callback if phydev->wol_enabled is set.
Therefore, I'm removing it vor V2.

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
> 
> Please don't spam the log. It is clear the system woke up, there are
> messages in the log...

I wanted to state clearly that the wake up happended because of a WoL
event but sure, I understand that it's best if log isn't spammed. Do you
prefer it completely removed or dev_info()->dev_dbg() ?

Best regards,
Gatien

> 
> 	Andrew

