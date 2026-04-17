Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472F3F8E4B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBacLVtaDD+BG01rHO7esJaLs6bAfvaO0ht5I5JeJ5A=; b=1CGL40nRFHGonbknADmIvx065h
	kbjg9uCTclzJJRalFc9jUBz6JzPfd0UDg4/88D5C8pStLBplR04Ed8f7urfrrOFoua80s40j8unQD
	n8PGV8UThZA4c21yFDVLF6IP3n0/8hFcUwhs5I5x/ZUVWPj5xZEO3Njj+vgiMpGx4xh9RqREe1Kf4
	JsJn9e46F3KYHeUMwY0sTcge6/DI1RUi9gqYCyF+RW0HhjIE3aN1lbzQjB/rsHhnIaoYU/0tCrFPw
	ASSvcQwuWKL0EULP4+caxtmrkaEBa7Ua3sSy+r3YB1E0MyKJjaxOdP9pnV/mk8tRcW0pNiRV5hGQw
	6FNDrCbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdNE-00000003ZfL-011v;
	Fri, 17 Apr 2026 07:12:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdNA-00000003ZeS-1MYJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:12:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31E1C1A32FE;
	Fri, 17 Apr 2026 07:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3C4F60497;
	Fri, 17 Apr 2026 07:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 722BA10460946;
	Fri, 17 Apr 2026 09:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776409931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IBacLVtaDD+BG01rHO7esJaLs6bAfvaO0ht5I5JeJ5A=;
	b=1qZcnU3FfRAWiLLrD9RvQE+7jqFv5N4MZhKuMyPs+eKII4hMWEOQgP0ZKUhr7VlDVEQXQl
	+r63/8FS6j054YsoP9zacr6dF9+AX2D2U1plFSffabMCcn6XjMmjJx7SQ85e4sNdjhb72a
	Fd1NB40UEspXATaGNYE+s3Sbumr8TA7M0bwLbfy9rvwJUXc6jqko3Lv8fZZCqAfZJOso11
	s8NAL8gvRFvyKD6KhFa9IdrxzYweb+RhIi37cX+rrpborQe1GGPL0mILxVpNLoX8OBph6g
	+FFRILrQPDXucWndO02cJI09Jvzk1QsnCHlrf8mUsxi7P6Wo5x/wl6CC0P7rJQ==
Message-ID: <680c384c-135f-44cd-a2cd-7e4fd0ec4bf7@bootlin.com>
Date: Fri, 17 Apr 2026 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w> <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w> <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_001216_845359_5068F63D 
X-CRM114-Status: GOOD (  23.18  )
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

On 16/04/2026 14:13, Russell King (Oracle) wrote:
> On Thu, Apr 16, 2026 at 02:02:53PM +0200, Alexander Stein wrote:
>> Hi Russel,
>>
>> Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Oracle):
>>> On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
>>>> Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
>>>>> On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
>>>>>>> Move the PHY attachment/detachment from the network driver out of
>>>>>>> __stmmac_open() and __stmmac_release() into stmmac_open() and
>>>>>>> stmmac_release() where these actions will only happen when the
>>>>>>> interface is administratively brought up or down. It does not make
>>>>>>> sense to detach and re-attach the PHY during a change of MTU.
>>>>>>
>>>>>> Sorry for coming up now. But I recently noticed this commit breaks changing
>>>>>> the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
>>>>>> $ ip link set dev end1 mtu 1400
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
>>>>>> imx-dwmac 30bf0000.ethernet end1: Link is Down
>>>>>> imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
>>>>>> imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed
>>>>>
>>>>> This basically means that a clock is missing. Please provide more
>>>>> information:
>>>>>
>>>>> - what kernel version are you using?
>>>>
>>>> Currently I am using v6.18.22.
>>>> $ ethtool -i end1
>>>> driver: st_gmac
>>>> version: 6.18.22
>>>> firmware-version: 
>>>> expansion-rom-version: 
>>>> bus-info: 30bf0000.ethernet
>>>> supports-statistics: yes
>>>> supports-test: no
>>>> supports-eeprom-access: no
>>>> supports-register-dump: yes
>>>> supports-priv-flags: no
>>>>
>>>>> - has EEE been negotiated?
>>>>
>>>> No. It is marked as not supported
>>>>
>>>> $ ethtool --show-eee end1
>>>> EEE settings for end1:
>>>>         EEE status: not supported
>>>>
>>>>> - does the problem persist when EEE is disabled?
>>>>
>>>> As EEE is not supported the problem occurs even with EEE disabled.
>>>>
>>>>> - which PHY is attached to stmmac?
>>>>
>>>> It is a TI DP83867.
>>>>
>>>> imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (irq=136)
>>>>
>>>>> - which PHY interface mode is being used to connect the PHY to stmmac?
>>>>
>>>> For this interface
>>>>> phy-mode = "rgmii-id";
>>>> is set.
>>>>
>>>> In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
>>>> Thanks for assisting. If there a further questions, don't hesitate to ask.
>>>
>>> Thanks.
>>>
>>> So, as best I can determine at the moment, we end up with the following
>>> sequence:
>>>
>>> stmmac_change_mtu()
>>>  __stmmac_release()
>>>   phylink_stop()
>>>    phy_stop()
>>>     phy->state = PHY_HALTED
>>>     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
>>>     _phy_state_machine_post_work()
>>>      phy_suspend()
>>>       genphy_suspend()
>>>        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
>>>
>>> With the DP83867, this causes most of the PHY to be powered down, thus
>>> stopping the clocks, and this causes the stmmac reset to time out.
>>>
>>> Prior to this commit, we would have called phylink_disconnect_phy()
>>> immediately after phylink_stop(), but I can see nothing that would
>>> be affected by this change there (since that also calls
>>> phy_suspend(), but as the PHY is already suspended, this becomes a
>>> no-op.)
>>>
>>> However, __stmmac_open() would have called stmmac_init_phy(), which
>>> would reattach the PHY. This would have called phy_init_hw(), 
>>> resetting the PHY, and phy_resume() which would ensure that the
>>> PDOWN bit is clear - thus clocks would be running.
>>>
>>> As a hack, please can you try calling phylink_prepare_resume()
>>> between the __stmmac_release() and __stmmac_open() in
>>> stmmac_change_mtu(). This should resume the PHY, thus restoring the
>>> clocks necessary for stmmac to reset.
>>
>> I tried the following patch. This works as you suspected.
> 
> Brilliant, thanks for proving the theory why it broke.
> 
> I'll have a think about the best way to solve this, because
> phylink_prepare_resume() is supposed to be paired with phylink_resume()
> and that isn't the case here.
> 
> Please bear with me as my availability for looking at the kernel is
> very unpredictable at present (family health issues.)

FWIW I am able to reproduce this with imx8mp + ksz9131

I can give this a try as Russell isn't available.

Maxime

> 


