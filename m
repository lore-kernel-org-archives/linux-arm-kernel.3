Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6698D3EE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkhVBB+QgzcCgYyqL44Qur19CLLRdKf0hGWKGZRHDXM=; b=vNKSNjbvMm+cuQtIsC09lTY8tf
	hvb8ll+dQr5qsn8t1XaNyySw0hBTbLUqtubQrcfy2oEVAAlbUOHFA4Ih48i31IG4aJ9MZdCCZFdXt
	eqNhq8DZCTaUwTyIOr7n4MK3QtEQWjuhl5xAF2xXjoayKPFPS9AAyeq8ue0AgbMwEaueQe4lP+rdR
	Kt3PErqQkHvSaZuJKqQ0PBssUd2QonLR4yWvKZpbFEK0MC7ALTG1JVMDNWPQovG6TH3cwIZJkO/kL
	3AdUH2DzTEQBLo7UacJsWuR87/gOWz9Yx2efoYMvS4qbkPzRz28yfjciQ7nYGaCxcls5hp4YuCxSl
	agSALr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuRC-000000076xm-3DpH;
	Thu, 22 Jan 2026 13:09:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuRA-000000076wy-18J1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KkhVBB+QgzcCgYyqL44Qur19CLLRdKf0hGWKGZRHDXM=; b=3wbYFeC4l3BuZgViSmTjQ/upiU
	dBWtE6sepWEKwD6lbSg8mRK7p26bIka0HVof7t/10AMQrdbIO5y8JFcbLVA319b37CaMPRi7FeKcT
	TX/GWvVdkBXLRZ1Xb+iIo0rrO9sySy3HvUK95WGYquFBA2tSAjxiRZ21T91QCfGPoXmo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viuR0-003yGm-Mo; Thu, 22 Jan 2026 14:09:14 +0100
Date: Thu, 22 Jan 2026 14:09:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-imx: keep preamble
 before sfd on i.MX8MP
Message-ID: <96f2c395-82f0-4399-be3b-6b0e3f07f90e@lunn.ch>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-4-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120203905.23805-4-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050924_310664_26ECB59A 
X-CRM114-Status: GOOD (  19.94  )
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

On Tue, Jan 20, 2026 at 09:30:04PM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The stmmac implementation used by NXP for the i.MX8MP SoC is subject to
> errata ERR050694. According to this errata, when no preamble byte is
> transferred before the SFD from the PHY to the MAC, the MAC will discard
> the frame.
> 
> Setting the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag instructs PHYs that
> support it to keep the preamble byte before the SFD. This ensures that
> the MAC successfully receives frames.
> 
> As this is an issue in the MAC implementation, only enable the flag for
> the i.MX8MP SoC where the errata applies but not for other SoCs using a
> working stmmac implementation.
> 
> The exact wording of the errata ERR050694 from NXP:
> The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> be no preceding preamble byte. The MAC receiver must successfully
> receive a packet without any preamble(0x55) byte preceding the SFD,
> SMD-S, or SMD-C byte.
> However due to the defect, in configurations where frame preemption is
> enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> byte, the received packet is discarded by the MAC receiver. This is
> because, the start-of-packet detection logic of the MAC receiver
> incorrectly checks for a preamble byte.
> 
> NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> they show two tables one where the preamble is preceding the SFD and one
> where it is not. The text says:
> The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> between transmission at the source GMII and reception at the destination
> GMII. Table 35-3 depicts the case where no preamble bytes are conveyed
> across the GMII. This case may not be possible with a specific PHY, but
> illustrates the minimum preamble with which MAC shall be able to
> operate. Table 35-4 depicts the case where the entire preamble is
> conveyed across the GMII.
> 
> This workaround was tested on a Verdin iMX8MP by enforcing 10 MBit/s:
> ethtool -s end0 speed 10
> Without keeping the preamble, no packet were received. With keeping the
> preamble, everything worked as expected.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

