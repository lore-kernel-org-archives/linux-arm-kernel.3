Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DDDCD8C81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRTi43Pb6AImbXcZqNNb2NBaT6asbEas00SHcRQI/Jk=; b=OR6IPiYI392DNn2Lo4ju++6PCU
	aFD8CqIVnoVSBHbQqtQohubQUtKNPVyOzvtgGl1fEE6/rmUUz9fTyL0SS/Tr74X4P0+6P++kinrzi
	cnBWL3hYpaI5EgW2TglBD0FbuCNAgaR9ngU7/Xvu12Iz3pOqBBZfdxdMEN9Ro/lcXSLU60H73XlM+
	0o3+xAL2/QSeeOKLj1AwmMYBPwT5msa7yEcBe0xTm+RQVsW2bvF+wPgiB7rbBIGMwxwpk6zp/Loyn
	97FEun8ZSF/n52IP7IYsGH+IVb6MISiqNnmq0pHa69cYVg1cYLTfrlU9qTmL65+MhJc3y6VNIGOPI
	gADfqVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVV9x-00000000hje-2ZeZ;
	Fri, 05 Jun 2026 14:04:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVV9w-00000000hj0-0PNI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=lRTi43Pb6AImbXcZqNNb2NBaT6asbEas00SHcRQI/Jk=; b=Bo
	3VVqmr3FpceEM4tORBT6wO8rikO8j3wHa7c9gADrtbV4FxlrL8L9PoUEeXkLTITLrmt0oq1ccrvIy
	4nlmmPG4GBj2P7yyoithnBxwtq1yUQ29ZSHb84f931utJUCAO2FNrcCfsgcwcRK9fKZ3B+gpmwsrN
	jBAoJUfr/G+S6qQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wVV9h-006Ezu-9y; Fri, 05 Jun 2026 16:04:13 +0200
Date: Fri, 5 Jun 2026 16:04:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Nazle Asmade, Muhammad Nazim Amirul" <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
Message-ID: <334ba778-e004-4e63-891a-c8cc8ea352b2@lunn.ch>
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
 <ed1ead6c-0505-4e56-97e3-b8e32e3e8e2b@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed1ead6c-0505-4e56-97e3-b8e32e3e8e2b@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_070428_136345_AEB579FD 
X-CRM114-Status: UNSURE (   6.46  )
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

> To reply on Andrew question - As per what I'm seeing, the XGMAC2 RDES2 
> only defines L3FM (bit 27) and L4FM (bit 28) — there is no FILT_NB_MATCH 
> equivalent in the XGMAC2 descriptor layout, unlike dwmac4 which exposes 
> it via RDES2 bits [27:26]. This patch covers all filter match bits 
> available in XGMAC2 RDES2.

Thanks for the information.

       Andrew

