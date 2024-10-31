Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6E2D767DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CYEngcINh3YznzU5GG7+Z6paSZSCs5bVmStIlkx+/U=; b=U6y9T8NSSzlXNz2oNMXvogxcT9
	gi+u5VYDydss9zD1WGqCJcOPxssINIRSzI1wI69brEJeusqFBm3/lMAFHGG+z5z5DHBPkpb6YEbcK
	qPhJ7DUCay4+V3LS4XfiJQfdvgeJiZuDUTJEvaM6kTkM8aRCbh6nyEFSIsAkCUiPoeIXaK89lpuuJ
	619um4FfRkEMeE67h/fsVqUxwCAWVSrMOB/SJ6kqfkqUCnwUGCdiIaoaUk8c17zaIDn4ZJRu0vhLv
	rQcYiXkfEG5tqabAsk1hHY+hFTJexjWbeMgjKnmB3HACnW60YO4YlCRQpYQP94z9J+2DeyE0DAO28
	Ps+HUn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XLF-000000043NY-3YBa;
	Thu, 31 Oct 2024 15:44:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Whq-00000003uN4-1imj;
	Thu, 31 Oct 2024 15:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3CYEngcINh3YznzU5GG7+Z6paSZSCs5bVmStIlkx+/U=; b=rc4NufGuoGCNzo1emNKloaPtTl
	RnqRqVGPJrF8i4rlyw/MO1cy7zYdQo2CvWc9459VI33q2XoehubNv+67F8aw8NL0xy/TnHe97V55s
	eYPbES3obNDPiw9TrCtqZ2uyhuj0I8GIrBXwcJjN1jVHirckHnZcfcr7b4hjCGa7HtQA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6Whp-00BnPZ-2z; Thu, 31 Oct 2024 16:03:25 +0100
Date: Thu, 31 Oct 2024 16:03:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"horms@kernel.org" <horms@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <1b9e9b1a-cc12-44b8-bbdd-6e6777adfb13@lunn.ch>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
 <20241030103554.29218-3-SkyLake.Huang@mediatek.com>
 <7cb014a6-ec64-4482-b85c-44f29760d186@lunn.ch>
 <29352dda1b5c647c30e48fbb31e7781fdab43d9f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29352dda1b5c647c30e48fbb31e7781fdab43d9f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080326_471686_4436D36B 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

> I think I got your point. In a follow up patch, I'll do the following
> change:
> 
> [Psuedo code]
> /* Currently */
> mtk_phy_led_hw_ctrl_get() {
> 	get_led_hw_settings(); //on & blink
> 
> 	set/clear &priv->led_state according to led_hw_settings
> 
> 	get *rules according to led_hw_settings
> }
> 
> /* Change into */
> get_led_hw_settings()
> 
> mtk_phy_leds_state_init() { /* Actual led_state init code */
> 	get_led_hw_settings(); //on & blink
> 
> 	set/clear &priv->led_state according to led_hw_settings
> }
> 
> mtk_phy_led_hw_ctrl_get() {
> 	get_led_hw_settings() in register; //on & blink
> 
> 	get *rules according to led_hw_settings
> }

This looks about right. I will review the real patch when it is sent.

	Andrew

