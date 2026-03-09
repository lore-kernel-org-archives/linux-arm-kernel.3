Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6488BEFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAkRjP9jYISvdMSyBJJw0ajApQvAkfVgmNZbtMfYkuE=; b=Gdf0Kelf5f6XgSVDQb+iHNpBnx
	v4znVbS7V+LWkhhq4NMN31OWO3iL6ONIiBhfqwxpeDlA12qy/NyW+Zk9kDx6xQdHHdlw7/hPzBY6M
	biUXHD3p9ZXbagl+q+mO/4eA2QocXrhGcnVbef+bIAyjSNTk6a9FzWcsddjaEbsmJeuWYBpbH423O
	9DI4TH0eA89+pbAcfS62nSxyHSC1fCxnugjrE7tQEaWF9/WxniIMpliO7XnrpHFisW4WRB/2Iqy/Y
	VMkcl3g5OMIPT+jdxjCyChaG+KTm9Dk+zrp36OOpw/GOf5NDMq7mYZgitJUAzsn++egpLi0DTpoSX
	BWgYWF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYNs-000000077ys-1Yku;
	Mon, 09 Mar 2026 11:02:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYNp-000000077yK-396X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sAkRjP9jYISvdMSyBJJw0ajApQvAkfVgmNZbtMfYkuE=; b=kQnBDvz0laLdm0pWRVN8e4/E3s
	IgESKlZ6AMDuT1IePF3BZzZWkfTma4/fS3zWrngtkKycV66UO8DR32Z8ppv8fNyqJB2NcNvhn0/oA
	b37FxopH4vF7Q8NVEulkxinLjgcyzw6sEVaMb1BnM3FvouqcBdLAoibT5BK39sQNi8URpXjSpHNmJ
	PFh5V5zYBHZKMSKE2tfdnaiq4OQw1KvkuoQNg+Scb/k1AF//X2KqmHkEDJeNaz1l4fBH1e/fAV9Qs
	hER0s+tKnKBpcebWKfkEibAqcTdfrKVvcFI0lO1YB1A22xf72DsEBrDHexqtpnCLr5Oj9q66wM82z
	XPom7/Xg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46846)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzYNj-000000003dG-0zT3;
	Mon, 09 Mar 2026 11:02:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzYNg-000000004FS-1Hwk;
	Mon, 09 Mar 2026 11:02:36 +0000
Date: Mon, 9 Mar 2026 11:02:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aa6ozPBP_OlayFs9@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040245_795493_4ACFA39A 
X-CRM114-Status: GOOD (  19.08  )
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

On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> Resending this as the original RFC now conflicts with net-next.
> 
> This series is the next of the three part series sorting out the PCS
> support in stmmac, building on part 2, which was posted yesterday:
> 
> 	net: stmmac: qcom-ethqos: further serdes reorganisation
> 
> Similar patches have been posted previously. This series does away with
> the common SerDes PHY support, instead using a flag to indicate whether
> 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> time, I have no plans to resurect the common SerDes PHY support - the
> generic PHY layer implementations are just too random to consider that,
> and I certainly do not want the extra work of fixing that.

I'm intending to tweak this patch series slightly. First, reordering
the patches, moving patches 4 and 5 to the beginning of the series,
followed by patch 1, 3 and 2.

The first two add support for reading the SGMII status from hardware
which we don't currently use, then we add support for BASE-X and
start using it for 2500BASE-X for qcom-ethqos. This should result in
no change at this point.

Next, I'm intending to add a new patch which sets
plat_dat->mdio_bus_data->default_an_inband = true; which will enable
in-band mode, and thus start using the SGMII link state. This will
be used where the inband caps indicates both the PHY and PCS suport
inband. For 2500BASE-X, because the PCS reports a value of 0x01,
that will switch phylink automatically out of inband mode.

This should mean that phylink will switch to inband mode for SGMII,
and outband for 2500BASE-X, which will eliminate the PCS configuration
change done by qcom-ethqos.

I've also changed the "report PCS configuration changes" as I
suggested, although this should no longer trigger.

I'll post this shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

