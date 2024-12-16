Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2A7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7DgLXnkn+eNvQJd57QfXRdqmzsuVaNQOQYrYyGFANM=; b=JtNgsyxZ15ovDcNN54SAhfMCJT
	7dHHLMv48UcU2manQnmaW91UifSnn4MMgqIZhzezB+qXUyv7vCyTYBhwuPnQbtA014hIKYGUIaXaC
	2f8k4h+eiHfLAWjKu7OSyz07fM6Rr/TRtYIpBhlS3OzBoYii5+/9kL/eW+xewsLgyhKgvYtiBifne
	SQJE44FAhcgZDT+ArBcCE1rD0X98XyFyJ3i2CN7p6HeodcxiOFDI3HyKqJUbFOMidW4twy4obUcJm
	0tVWUEUuFy9NIkAjyLNDmG0eOEy6NfDAEzazDc84sYI0D0McITa96nHXhnSXvzTwTNvF17FfJ6AFc
	FZTRyGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9y2-00000009w5N-3LFj;
	Mon, 16 Dec 2024 12:12:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9ww-00000009vps-3XsO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 12:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734351107; x=1765887107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/uPilcPPSkM0vFf7CZp7ih66ufLi2xO3rEUxtf1Dzh8=;
  b=AvEz7mgnA8QDnTyvXhbj1cgm6Q5mMzmXV9oVNBYa/sswpoxsZYQ3KL2h
   SoyeFFrqaTMsxhgvmY8uiqWwaALZ5Sp/UO9dDMDYaKDTlVoyBtv/U3ikP
   LYii1QTG4orh3IPOwKWxY8ITcbuu8iTQ2H4o/RdAMUd1TvRo+QOGlKdrt
   b39bFs3wX/D+bsnPLEw/uvyRP9v6XT5gfaDmsfbclsUyLX7Fqbxt5a3T8
   p0vUJULK3bzp1nvQT2bE9jW+SIHKFUMYqnd4EMIkgfMyxUYbIqt2UkyGQ
   Rbapm9WxOjQO1k1q2QQWc4nfmFRL+4dTl6bIKaTxm3JF8Kge1EffKxYIz
   Q==;
X-CSE-ConnectionGUID: pK+G4L7kQ0aeZKZcimCaNA==
X-CSE-MsgGUID: AxFEMPyOT+abSUdbeMU9OQ==
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; 
   d="scan'208";a="35580346"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Dec 2024 05:11:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Dec 2024 05:10:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 16 Dec 2024 05:10:41 -0700
Date: Mon, 16 Dec 2024 12:10:40 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, <jacob.e.keller@intel.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
Subject: Re: [PATCH net-next v4 6/9] net: sparx5: verify RGMII speeds
Message-ID: <20241216121040.2dpxb7mv6h3u3r42@DEN-DL-M70577>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
 <20241213-sparx5-lan969x-switch-driver-4-v4-6-d1a72c9c4714@microchip.com>
 <Z1yPq6OEziTNjWHK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z1yPq6OEziTNjWHK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_041147_101293_85747F89 
X-CRM114-Status: GOOD (  19.80  )
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

> On Fri, Dec 13, 2024 at 02:41:05PM +0100, Daniel Machon wrote:
> > When doing a port config, we verify the port speed against the PHY mode
> > and supported speeds of that PHY mode. Add checks for the four RGMII phy
> > modes: RGMII, RGMII_ID, RGMII_TXID and RGMII_RXID.
> >
> > Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> > Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> You do realise that phylink knows what speeds each interface supports
> (see phylink_get_capabilities()) and restricts the media advertisement
> to ensure that ethtool link modes that can't be supported by the MAC
> capabilities and set of interfaces that would be used are not
> advertised.
> 
> This should mean none of your verification ever triggers. If it does,
> then I'd like to know about it.

Yes, I agree. Having an extra look at phylink, these checks should not trigger
at all.

As it is, the default switch case is to throw an error, so without this
addition, the sparx5_port_verify_speed() function will fail when the PHY mode
is any of RGMII{_ID,_TXID,_RXID}. This patch just follows the established
pattern of adding the new PHY mode and checking the speed. TBH, I think that
all the checks in this function can be removed entirely, but that is something
I would like to verify and follow up on in a separate series, if that is OK? 

Thanks.

/Daniel


