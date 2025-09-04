Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB0CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjjY66RcfO89xgSgq3BI/Zi1XnS61E6x2hm5O5e/pcM=; b=aQX71arWlVU2IwnQvtBgiovCR/
	L52sdsxr7kkjyxRNPSXtz3Sz6PShevrCkWlZzL/2Qi0asByUcaZesRkz4+C2tyj/NQ/II7x5LnctB
	unXsQvKEcH4mT6GGu3IsYHuLpGzObrwleausIMKVjug0Wf/UyfU1P3nnSdBYCt4SdsKgFAePa3glA
	dxjNBClG7bSRuTnjhdW338RXC7rSPl6EM/rJPhc0SuiDXsQwFaUCILSgJOFfcwfPiLMBxwBNTiQZE
	AHdK/+9N+pHbPWbWlfkJpHWVaA/WInlyjJOPIiB91530fdrx5wHdLUb8RZ8PuwSKLV9hO/yuU6e4d
	ApUqCMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1A-0000000FyYl-0yEC;
	Fri, 05 Sep 2025 02:17:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF7x-0000000DlUV-0FIA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xjjY66RcfO89xgSgq3BI/Zi1XnS61E6x2hm5O5e/pcM=; b=lUlOD1PkTGxanSr7AKvyXl8irJ
	J0gSgg248DiESUGkemYaDyC0CGalgiBh2QKBPxkVuQvH3KXixAHvWJCy2cDHpkkIrcv1UOXPg48bf
	6/FdAVdH97UqdLXuQe+qQzfzwClHRrYwceo5RKKMbfUfatzwU1sgBq9IrAVzgMGMLpok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuF7o-007G0E-VD; Thu, 04 Sep 2025 20:56:00 +0200
Date: Thu, 4 Sep 2025 20:56:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 01/11] net: stmmac: mdio: provide address
 register formatter
Message-ID: <d961d42e-e539-451d-ad17-b29fa5cfab9b@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8ns-00000001voU-0S7b@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8ns-00000001voU-0S7b@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_115609_094927_B5D69FA5 
X-CRM114-Status: UNSURE (   8.17  )
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

On Thu, Sep 04, 2025 at 01:11:00PM +0100, Russell King (Oracle) wrote:
> Rather than duplicating the logic for filling the PA (MDIO address),
> GR (MDIO register/devad), CR (clock range) and GB (busy) fields of the
> address register in four locations, provide a helper to do this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I cannot test any of these patches, so please don't merge just because
of my review. Russell specifically asked for testers.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

