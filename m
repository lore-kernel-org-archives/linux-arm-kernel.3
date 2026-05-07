Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86804CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGD8JspjmSP80eMiWCiz+GZtznF5vZ7uaGhPmePdXwA=; b=i2ygCcnsyzRWGxAac2G3GfOmqG
	xbQMgfLSrn1g2YHhwfwGU0CXC34lm0W5ExhEEYi9opf80Co9hsRJnEJw2XEZ3vyMwpUaryvgWHNxP
	f6mfszPhRRsp3ctQ2bY/QS6XcfAdzvlyV12CqfCLJQvSiKn6hLll7LcCfR4Aw/IQe8D4DR9y2Vlli
	hF9InmoyKtVQgfeiRXrEv5JGQA22oPlU+DTnMwz85+Lpg/w8tRabFv21MOk8I8W8jSJrFUzYLqMKL
	YFwxClF9mLWKLWIg/drRFN+kL/1xKbPtttT18Lvfj/tXThwgFU3Qzkd1CWrmBJeraDXJwIUBzm9k+
	I9DpMKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6OS-00000004xHl-3mSD;
	Thu, 07 May 2026 21:36:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL6OQ-00000004xHA-2rbS;
	Thu, 07 May 2026 21:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=EGD8JspjmSP80eMiWCiz+GZtznF5vZ7uaGhPmePdXwA=; b=ax
	2WpD9Ob8DtriFO3GDwHPYC3Ncwa+gpynnAQ+4hmtkSIpOyUzG5g0UVfxxXCg9p6MguhSVilkZCaTj
	aW/gry1sjeMoGSCmIinzbRZPPgvV6wv9Iw7VyXF1xpz8v3y72HK7LaKta313siWMhGgP9d3EKuySO
	IwLHdeLowl0KnWo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wL6O5-001s1n-AV; Thu, 07 May 2026 23:36:05 +0200
Date: Thu, 7 May 2026 23:36:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
Message-ID: <d7580b92-f165-4135-85b9-ec89a2568949@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-3-1a42d6b6050f@collabora.com>
 <3bd7803d-4c4a-4f61-9434-a6bf25627b58@lunn.ch>
 <9f569ba00b959b701a7a51bcd7347c1a108a15ee.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f569ba00b959b701a7a51bcd7347c1a108a15ee.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_143626_721711_3E5B6A84 
X-CRM114-Status: GOOD (  18.06  )
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

On Thu, May 07, 2026 at 02:11:54PM +0200, Louis-Alexis Eyraud wrote:
> Hi Andrew,
> 
> On Thu, 2026-03-26 at 13:30 +0100, Andrew Lunn wrote:
> > > @@ -480,8 +287,8 @@ static int en8811h_wait_mcu_ready(struct
> > > phy_device *phydev)
> > >  {
> > >  	int ret, reg_value;
> > >  
> > > -	ret = air_buckpbus_reg_write(phydev, EN8811H_FW_CTRL_1,
> > > -				     EN8811H_FW_CTRL_1_FINISH);
> > > +	ret = air_phy_buckpbus_reg_write(phydev,
> > > EN8811H_FW_CTRL_1,
> > > +					
> > > EN8811H_FW_CTRL_1_FINISH);
> > 
> > Is a rename required? Is the namespace air_buckpbus_ used somewhere
> > else?
> > 
> > 	Andrew
> Sorry for the delay.
> 
> The air_buckpbus_ namespace is only used in the air_en8811h driver.
> It seemed better to me that in the new air_phy_lib, all functions (the
> buckpbus accessors and air_phy_read/write_page functions) started with
> the same prefix. That is the reason I renamed them, even if not
> required.
> 
> As an alternative, to avoid renaming those buckpbus function calls on
> air_en8811h driver and reduce this patch changes, I can add macros at
> the beginning of the file such as:
> ```
> #define air_buckpbus_reg_write(_phydev, _pbus_address, _pbus_data) \
> 	air_phy_buckpbus_reg_write(_phydev, _pbus_address, _pbus_data)

No don't do this.

If you want to rename them, rename them. But do it in a patch which
only contains a rename. That is easier to review, and more obviously
correct.

	Andrew

