Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02327C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+Hoq1Q2ghT+Yzbwx2x+tVHCRBFJXtSQo3dmfZQ0ipo=; b=YI1gB1wv7pB3mLvkvhZeIIIcpC
	JfbvAJlZ/FOKN1o5x713ZvvoFDysuOkY8uIzKZWmXRqyfDyZW4Ub+43rz6hSqhkOpi+/Qq1IcxHAf
	NHp5bMfHZhAdnXceCaDUA57opvP8B4qf+wZUb+qT8u15mrO9UeqrvJVvG75JBdbTGY9Zpo2LYLe9s
	Fn9DOeHfLnfP+x9960h8mGH26yX4dTL0rAeFm+WH04GGH6B06VYz5KbiDtpYj1rAbPiInUxobwbGF
	Ry+bsUM9FC0i6kL9cgZOyDQTNtHGsGn1+cTmB3AEN5e8741fGZsGwcOe0mhb47xyYI/0dBNjHmn0v
	KrvDUyiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraIB-00000003r3l-3DXo;
	Wed, 05 Aug 2026 12:00:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraI9-00000003r2F-16NH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e+Hoq1Q2ghT+Yzbwx2x+tVHCRBFJXtSQo3dmfZQ0ipo=; b=mVyXbkDzQx8Hyi/xdICLU/SAyZ
	MnAppDd5RLzYDQDbzkZxULvzoptjO1PTmEREgiM+bp2dM1Asi6CH37DQfKo7rWWIQNnYSxM4c/IkR
	rQTfg2k7ZumFf8QRq/FsvfDgIhcaBI6Itk6EpgEou65SOeyawbXh9qBv+Bu/zEOsebgs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wraHt-00GA7J-Bo; Wed, 05 Aug 2026 13:59:57 +0200
Date: Wed, 5 Aug 2026 13:59:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, linusw@kernel.org,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] net: stmmac: manage error case during
 stmmac_dvr_probe
Message-ID: <707a0b37-ad52-4b58-b95b-6f500220e779@lunn.ch>
References: <20260804132052.205273-1-christophe.roullier@foss.st.com>
 <20260804132052.205273-5-christophe.roullier@foss.st.com>
 <17bdf6d8-a31d-4601-bbc9-4d7b78897272@lunn.ch>
 <080e5ac0-cb7a-4871-a312-1b60459ab5d2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <080e5ac0-cb7a-4871-a312-1b60459ab5d2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_050013_303198_7983AD34 
X-CRM114-Status: UNSURE (   7.03  )
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

On Wed, Aug 05, 2026 at 08:39:12AM +0200, Christophe ROULLIER wrote:
> No problem Andrew.
> 
> https://lkml.iu.edu/2602.2/02822.html

Thanks

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

