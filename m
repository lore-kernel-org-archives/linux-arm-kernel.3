Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A5C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+9FHX6rBVj88oLrVg3eeFc6dbE26aHLfHIwgVKUO0Q=; b=y2Ti3OnRYzQEHbpPxbZNtui24y
	+McVZiG1GkEy0NpwzPccAVJcaFbToyMj+0dArEmv+VYZn7MjuOJDSSodPLeI16tFeMk+WX1orxMKn
	lvTgHL4f780oDs4z1NdixyObf4HDZ07/mIt4YNK0DqKFyEsWbjfkYRv2yxZ2tNDL/csUakUkSKpiS
	hwYGOfyn/1SpIzZzrbnczMCZ46uqGe5sQYCt9LmeoJ63j6iV4liMe0vkPkBUYXG7xm+418Hj6ItHl
	mXjXe/YmoI/0TCdBqwG5N1Owh+xBpwah+kjA/il9Kg448WkgQ4CzDdMSVFVE9YX5sBJ78hwulnjpO
	VcdlgYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFbv-00000000Uar-3Lhs;
	Mon, 31 Mar 2025 13:55:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFaD-00000000UNl-3ThT;
	Mon, 31 Mar 2025 13:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J+9FHX6rBVj88oLrVg3eeFc6dbE26aHLfHIwgVKUO0Q=; b=1crgzpiphNYZZMz+GjSnJxI47/
	e/wBQT5YUXA7IQOngX6lT3BH2o0OmevomoPSt24xcmo7AMdDP6sMxOlA6msEwtKg5lTNecEG3zBgP
	kppgV+v1toN5MnPPbjcNc8K2ELoK2CkqXTB1HvrzthnCPpRohtI22a6DtieBEq8MfrDhz0macOk9N
	wTq803aLg3b+QshUhTKj9IsTc5NzR9vUROvprRfSmGp6ZE43yY5SIEQYUVpakDRz7lznUpX/5x/Dx
	HXS94PFQ4trFXKc9RzXNSyekPMQqCmn+TmhszUYebpK3nMvTs4dd6gq+EnBfXDllAf/utSY5SkQua
	FGUJoobA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzFa4-00047M-0c;
	Mon, 31 Mar 2025 14:53:36 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzFa0-0001j6-2N;
	Mon, 31 Mar 2025 14:53:32 +0100
Date: Mon, 31 Mar 2025 14:53:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Da Xue <da@libre.computer>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_065345_867500_0C74F735 
X-CRM114-Status: GOOD (  21.28  )
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

On Mon, Mar 31, 2025 at 03:43:26PM +0200, Andrew Lunn wrote:
> On Mon, Mar 31, 2025 at 07:44:20AM +0000, Christian Hewitt wrote:
> > From: Da Xue <da@libre.computer>
> > 
> > This bit is necessary to enable packets on the interface. Without this
> > bit set, ethernet behaves as if it is working, but no activity occurs.
> > 
> > The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
> > sets this bit, but if u-boot is not compiled with networking support
> > the interface will not work.
> > 
> > Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> > Signed-off-by: Da Xue <da@libre.computer>
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > ---
> > Resending on behalf of Da Xue who has email sending issues.
> > Changes since v1 [0]:
> > - Remove blank line between Fixes and SoB tags
> > - Submit without mail server mangling the patch
> > - Minor tweaks to subject line and commit message
> > - CC to stable@vger.kernel.org
> > 
> > [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/
> > 
> >  drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
> > index 00c66240136b..fc5883387718 100644
> > --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> > +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> > @@ -17,6 +17,7 @@
> >  #define  REG2_LEDACT		GENMASK(23, 22)
> >  #define  REG2_LEDLINK		GENMASK(25, 24)
> >  #define  REG2_DIV4SEL		BIT(27)
> > +#define  REG2_RESERVED_28	BIT(28)
> 
> It must have some meaning, it cannot be reserved. So lets try to find
> a better name.

Indeed, that was my thoughts as well, but Andrew got his reply in
before I got around to replying!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

