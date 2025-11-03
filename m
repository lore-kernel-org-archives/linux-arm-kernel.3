Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB624CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT9RtigCr8SXNb36gcbFehyubQYXLfyyxsU6nQOAO4g=; b=ZakRWe55wLbq1+ePEBPGrokV3r
	YIrkJHc4tVrVjG9HA7ImdfyYVoGzwR/GeokS152Pnxf6JcpSHsSGeakNeuzBAwqPHSx/YSBtSPbgf
	OzlA4+Z5TmX7MqdfqAjKEC1Pr2bFL9I2J4Bt8EN5yBSWCOdKotAZfABQZTZ7jMqJHmMl9zf54MJOi
	eB7sdmesd4RwmvOuTgWbpoFe4nx+3RwNDl1amcSeALH/K/ew19DryjjKwMHg72vy3gN2oE9HQDcxO
	oTjsk6NLMU2XJnlT7RDsdAETU7H32dhq7QVkfWn3I3282geEmj4fkbU8fMi6Fdl8wepyKppQhmEdR
	3PyFhYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs6v-00000009eyW-2UdO;
	Mon, 03 Nov 2025 10:48:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFs6s-00000009exp-3WN5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:48:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42844985499so481111f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762166905; x=1762771705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9RtigCr8SXNb36gcbFehyubQYXLfyyxsU6nQOAO4g=;
        b=AQgtdi5fhIkKVNl4QTWCa1FTtf7yzb9JZj9C9yke52qHtWHOpc9FX6rxWjzYn2MW53
         7lKtdLNojFfXClLWAxkrz4oz0hAqLSm4phIpQAF+3IEvnmTbv23KeP6Vkk3fhDHnAk2h
         KftbFZl0FzP5Dq7bu1RsZo0rJexk/aCrLfVO4hqpVxQRCvqT62/Ysw0oKtgTZ4e20bsA
         7boCZ3kR7sS8jbB7zn9c6PtXXUyu2rVuAMDdTxX1sad3CBvsa3pscRIii7h+tD2cu94q
         xhxJ3MXxaBt9QqL4fh4PbV027yIbIWoFW0sOnaIBoPZpwdPJtMXbvQ1wOb0AuMkPG1bE
         Pmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166905; x=1762771705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT9RtigCr8SXNb36gcbFehyubQYXLfyyxsU6nQOAO4g=;
        b=tBDvGlaMNKYM6FLpyiIAg7l6mC6uGKvfI4ESjeAgy0HuTahh/6lULUhFEsbjBd8kZG
         0FKoaIC5jLwMNkZQOT5wi/8VjpbLdRuizSeLxoOQrV7sBsUbQ7gjmRqpdUt4j4ViZZec
         9GsNVPBF4ApvavUDHxjB5vTSjdNvWFzoMItRYF49XD10UFCEyuyZ014FAuAHzLRYvGd4
         ok7cr5fcdr/Zldyf+wuHE0vV0N2KmLNK2WGcOXX/2o9XH4HvZal+0EPAMueJhU6naunc
         3jqIcb7SvJzJfTmi+PXh/PjDbVWhn7PdK+1Ia6Xpdpn88MUHwgzGyGiS2raczJ0UE2+U
         gtAA==
X-Forwarded-Encrypted: i=1; AJvYcCVd0g1faTDolFZifrBrkbDhweh09f0s4rXa2trs8NS2Y+ahJ8tktc5O7Da4yV8qaoP/YPmp9lU2uc7htEDWFhBX@lists.infradead.org
X-Gm-Message-State: AOJu0YweiFBnm2W5Yjqj2FdWIEFUDlmr93jcMrtnV1awZHaMQFh86KdU
	An3WMJWjMwdULKXyb2Gf0pm5HbF66vY0Y8zzl+1ZeCSGvsvr9WGEgUiw
X-Gm-Gg: ASbGncs+yfqYv2Tg0gkG2IlJfDMkzxaVundOu85mEq2u58XjZISw7xP5XT0EttGl5nG
	MYzXhT6Fq2OxNnJTZBSXUxqnRJlzme3rbo9/xydZ18zdN1w+h4U2o9Xkp5sdq4hKLuWSdljW9+N
	1fjg3n5I31afLAAZ1KwUtfl+jx9ueHK4FMhNRspZ/8BoKzTFHVavTsJDJ/4ibyZPZsYLL/RDExj
	65qP5YFi6FLbnPiesnDFGkSZSjTSJEsnE9IRPWBkTmxJu2Ca1VsRFQ4ItmNNzpQSpML+9I+PE2q
	ypTKr7Dsh52WBLDAA4Xn5x07AQHSZf/ehXLrNURq22flR0NeCieJYzKeDmNd/88WCO1kUosjP3T
	WgPcBO1gFBf7FVdo9UhJe0NGZ4OONg2mZCPRPzCsq8SWtmuLSjwatW1h9X0wJzbdfxdTS
X-Google-Smtp-Source: AGHT+IFDkHIlGH+UICeedNY8tuFUMLJ68lqu5VoPcOTjTIWj9r93aVIljpR0UjzUe74VKQmlKp+fEQ==
X-Received: by 2002:a5d:5f50:0:b0:429:b4ce:c692 with SMTP id ffacd0b85a97d-429bd6a77bcmr5661427f8f.7.1762166904243;
        Mon, 03 Nov 2025 02:48:24 -0800 (PST)
Received: from skbuf ([2a02:2f04:d406:ee00:7144:c922:dc8a:113d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429d12e1173sm7767173f8f.42.2025.11.03.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:48:23 -0800 (PST)
Date: Mon, 3 Nov 2025 12:48:20 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <20251103104820.3fcksk27j34zu6cg@skbuf>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_024826_906388_3377D6D5 
X-CRM114-Status: GOOD (  34.61  )
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

On Mon, Nov 03, 2025 at 03:48:53PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Nov 03, 2025 at 09:52:38AM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 03, 2025 at 02:28:24PM +0530, Mohd Ayaan Anwar wrote:
> > > On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> > > > On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > > > > 
> > > > > > This is probably fine since Bit(9) is self-clearing and its value just
> > > > > > after this is 0x00041000.
> > > > > 
> > > > > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > > > > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > > > > "okay". Nothing more.
> > > > > 
> > > > > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> > > > 
> > > > Note also that testing a 10M link, 100M, 1G and finally 100M again in
> > > > that order would also be interesting given my question about the RGMII
> > > > register changes that configure_sgmii does.
> > > > 
> > > 
> > > Despite several attempts, I couldn't get 10M to work. There is a link-up
> > > but the data path is broken. I checked the net-next tip and it's broken
> > > there as well.
> > > 
> > > Oddly enough, configure_sgmii is called with its speed argument set to
> > > 1000:
> > > [   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
> > > [   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
> > > [   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
> > > [   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
> > > [   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
> > > [   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
> > > [   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off
> > 
> > If you have "rate matching" enabled (signified by "pause" in the mode=
> > part of phylink_mac_config), then the MAC gets told the maximum speed for
> > the PHY interface, which for Cisco SGMII is 1G. This is intentional to
> > support PHYs that _really_ do use rate matching. Your PHY isn't using it,
> > and rate matching for SGMII is pointless.
> > 
> > Please re-run testing with phy-mode = "sgmii" which you've tested
> > before without your rate-matching patch to the PHY driver, so the
> > system knows the _correct_ parameters for these speeds.
> > 
> Sorry, I forgot to mention that all the recent testing is being done on
> QCS9100 Ride R3 which has the AQR115C PHY.
> 
> My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
> putting its testing on hold until we sort everything out on QCS9100
> first.
> 
> So, for AQR115C, what should be the way forward? It has support for rate
> matching. For 10M should I remove its .get_rate_matching callback?
> 
> 	Ayaan

As Russell partially pointed out, there are several assumptions in the
Aquantia PHY driver and in phylink, three of them being that:
- rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
  PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
- if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
  pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
  that interface
- if rate matching is used, the PHY is configured to use it for all
  media speeds <= phylink_interface_max_speed(link_state.interface)

Those assumptions are not validated very well against the ground truth
from the PHY provisioning, so the next step would be for us to see that
directly.

Please turn this print from aqr_gen2_read_global_syscfg() into something
visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():

		phydev_dbg(phydev,
			   "Media speed %d uses host interface %s with %s\n",
			   syscfg->speed, phy_modes(syscfg->interface),
			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
			   "unrecognized rate adaptation type");

