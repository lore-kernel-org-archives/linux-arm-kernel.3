Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93469C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZOnwyJc/z92LBdcHXh09X96k4RSZO3Wfpl7wZweE1U=; b=HpgoROsQWzEN7CLpQ4WQoqIQIl
	fBNMN7L1r0oCzwcrL/DD+3GH6A4uaLouaNtp8Mf9O94TLxlN8/RZ2MxJfrXT6kfnBsb02wgMunzvG
	17JceszyIpVb8KQpgUtFJAFOLrjDSLL7yofdR7A1m3ay924Kr4Kg4qdQn4wAwLwl9wHY2TaXzoE8x
	8a/GqfTOfT8vl314BSfPJNCFSLYVin72LAU/lG5Eja+YSH6RSP4+yA8XQ0TJ4PCJrpku8lw5Hgs97
	nLgOQceY9OPtSF5ePZnyOGV3l6J54WPRO9L2/qoH6jWOI30qT5ZLLcab8FTu71EBzI9OrXCgfBYGk
	rP+8mxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg0s-0000000GIA6-2QdI;
	Tue, 29 Jul 2025 08:48:46 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfyN-0000000GHiV-1WMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 08:46:13 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8YNat014089;
	Tue, 29 Jul 2025 10:45:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dZOnwyJc/z92LBdcHXh09X96k4RSZO3Wfpl7wZweE1U=; b=XwF5dllEtECZLCeq
	JJifgyRlhmk9xDJChmramDEt0vbuK5xkHgtWAt+3NgJRIN5ptXyhNVShV476LLg4
	Ee384LrKR+nfpswuEJva/XjMRNXgsvo8hbbP8LVl9MEDHrSmFyqzQawtuzsnCBjW
	3tndnxRP71fnGUcb/gyVjYA66+Zh5ibkl7EA3Dwq1WXEiz+S+B4vFuf6ZYMSZY4a
	q2laWBj7+d7G208HtTSG+/dDfiFNciLpIqJn7mK7GVivJFGpcouiB626sSwu1a+Y
	57NhNXArM0o9iq4tAasVLMKdxTWdv5qOCH4m8r6AcB4fgaYCSQk3rJK517Rg2EFg
	7ivAsw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4858k51a3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 10:45:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53DFD4004D;
	Tue, 29 Jul 2025 10:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DA065F4E65;
	Tue, 29 Jul 2025 10:43:33 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 10:43:32 +0200
Message-ID: <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
Date: Tue, 29 Jul 2025 10:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andrew Lunn
	<andrew@lunn.ch>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Eric Dumazet <edumazet@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        <linux-arm-kernel@lists.infradead.org>,
        Heiner
 Kallweit <hkallweit1@gmail.com>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014612_186842_B014431E 
X-CRM114-Status: GOOD (  20.52  )
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



On 7/28/25 19:54, Russell King (Oracle) wrote:
> On Mon, Jul 28, 2025 at 07:28:01PM +0200, Andrew Lunn wrote:
>>> +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
>>> +{
>>> +	return priv->plat->pmt && device_may_wakeup(priv->device);
>>> +}
>>> +
>>> +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
>>> +{
>>> +	return !priv->plat->pmt && device_may_wakeup(priv->device);
>>> +}
>>
>> I agree this is a direct translation into a helper.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>> I'm guessing at some point you want to change these two
>> helpers. e.g. at some point, you want to try getting the PHY to do the
>> WoL, independent of !priv->plat->pmt?
>>
>>> -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
>>> +	if (stmmac_wol_enabled_phy(priv))
>>>   		phylink_speed_down(priv->phylink, false);
>>
>> This might be related to the next patch. But why only do speed down
>> when PHY is doing WoL? If the MAC is doing WoL, you could also do a
>> speed_down.
> 
> No idea, but that's what the code currently does, and, as ever with
> a cleanup series, I try to avoid functional changes in cleanup series.
> 
> Also, bear in mind that I can't test any of this.
> 
> We haven't yet been successful in getting WoL working in mainline. It
> _seems_ that the Jetson Xaiver NX platform should be using PHY mode,
> but the Realtek PHY driver is definitely broken for WoL. Even with
> that hacked, and along with other fixes that I've been given, I still
> can't get the SoC to wake up via WoL. In fact, the changes to change
> DT to specify the PHY interrupt as being routed through the PM
> controller results in normal PHY link up/down interrupts no longer
> working.
> 
> I'd like someone else to test functional changes!
> 

Hello Russel,

First of all, thank you for taking the time to improve this code.
What exactly do you mean by hacking? Forcing !priv->plat->pmt?

