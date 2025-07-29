Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9AAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUnLUSkkHQ0KtmeifxLqpV19mfTPS/23h/uc9Q4JzE4=; b=Whzhqq8Qz5LN0Sr2Hjeov8reGH
	i29khuNfXeZ0z5/fQXhYcP42vY2s37TGh/TmO0kxbirxyjlDlgvjL/rvMePbeRUEBLLBn913TpZtH
	iZUVjhpve2Qv9jaJw4OaUzLO4l9TkCR+Mg+YLRuQiw6rrRrGXiHW7X1xl3VPQkqdUTWm/oytlLSB7
	qMfvNj9v54mcR6kcVyTs7WF+p3tR+H3OGTpBMQStBEGHJE12CFLvqsDfpCO2AKGYkREDWtaIvs0+Q
	26HkyE+nXoMS0z8t3iGvawrZDIvKXLDhMBPh5W+fE9JsUOOTb8WgliQLyyRzbVlXo/i2F2gUfvkGL
	Mj8rMX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnYx-0000000HJCP-1QUX;
	Tue, 29 Jul 2025 16:52:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnIa-0000000HHZK-3HYQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LUnLUSkkHQ0KtmeifxLqpV19mfTPS/23h/uc9Q4JzE4=; b=Yn7TvtWASbRMJEShmmX8wbGU29
	w8cc/jSobrXubE6LcPAHIPHD9MOcuyRGTOgzRIWmlbJiaK63XqQRuZHIMOiNnaCdff5y/+k2l4ENc
	ThplDkSAXq+0F0v8DHWd13z4lrPwaS38uBIDYnZnukOfuGD/GC+ttx64ddeXSfrZLVip9jFeMxQl1
	LC4Tmzk3E8g9Jz/o8dsvL8yB12YZQ3oyzzBYzJSTZuvJQHdYvS5hpYksPkktYsH+k3ybGhKIJvt+j
	4Zyrft+4Mb2JQD1RJXAFDNJWFDLUMEOLhETH10NCigvvjMY0dlP8BQlup4QnZDRuftMd+TcTdBcmn
	P4ZJ9Shg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ugnIN-0002Cl-1t;
	Tue, 29 Jul 2025 17:35:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ugnIJ-0007YC-2w;
	Tue, 29 Jul 2025 17:35:15 +0100
Date: Tue, 29 Jul 2025 17:35:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
Message-ID: <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_093533_100312_4857C6FC 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Jul 29, 2025 at 05:34:49PM +0200, Gatien CHEVALLIER wrote:
> For STMMAC:
> I'm a bit lost there. I may be missing something. I thought that using
> PHY WoL (therefore having STMMAC_FLAG_USE_PHY_WOL) superseded the MAC
> WoL usage.

I'll simply point you to Andrew's message:

https://lore.kernel.org/r/5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch

The PHY and the MAC are supposed to inter-operate so that one ends
up with the union of the WoL capabilities.

stmmac gets this wrong right now, but (as I've written previously)
this is going to be a *very* difficult problem to solve, because
the PHY drivers are - to put it bluntly - "utter crap" when it
comes to WoL.

I'll take the rtl8211f again as an example - its get_wol()
implementation is quite typical of many PHY drivers. Someone comes
along and decides to implement WoL support at the PHY. They add the
.get_wol() method, which unconditionally returns the PHY's hardware
capabilities without regards for the rest of the system.

Consider the case where a PHY supports WoL, but the signalling for
WoL to wake up the system is not wired. The .get_wol() method happily
says that WoL is supported. Let's say that the PHY supports magic
packet, and so does the MAC, and the MAC WoL is functional.

Now, with what Andrew said in his email, and consider what this means.
.set_wol() is called, requesting magic packet. The PHY driver says "oh
yes, the PHY hardware supports this, I'll program the PHY and return
zero". At this point, the MAC thinks the PHY has accepted the WoL
configuration.

The user suspends the system. The user sends the correct magic
packet. The system does not wake up. The user is now confused.

However, if the PHY driver were to behave correctly according to what
Andrew says, and not allow WoL if it can't wake the system, then
instead we would program the MAC to allow magic packet, and the user
would be happy because their system would wake up as expected.

This is why we can't simply "fix" stmmac - not without all the PHY
drivers that are being used with stmmac behaving properly. Can it
ever be fixed to work as Andrew suggests? I really don't know. I
suspect not, because that will probably involve regressing a lot of
setups that work today (fixing the PHY drivers will likely cause
user visible regressions.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

