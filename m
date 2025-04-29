Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0568FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAXVC4rrpa0qDHPCRL8wgE48l9h5WxCcZKH1VJB9QZM=; b=L1wyEn/HrV13HCuzbVZjpoEQV4
	BMubChiK/L7awsNOzkvTi3zVq51MPTyheu3krKD+KBGjlUCAOLneM4ILyRsWuOFg/OUPVdvGmL1uG
	8xB6f88jAwBLNfZMt0+IPI6LHzHMHF55gI/t6YDOBjh8RULGub2dCe0B2sSuzveYRqYONByQwbR9w
	ibDvHJfde6j36cwxrlwxNBwOgdvM0EE395dt9iRQeyW7t++/ppjQVDXszIEKElrVkAJrruxSlcHvT
	K9cmVXU02kepS5yppho/spSffT74u7nD2ClKrxZ8oxPDjWgzkSHyFFNy+KU2nPQtJ4LNKNiDL1pBg
	TVtx+Dew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qFZ-0000000AckD-0bij;
	Tue, 29 Apr 2025 19:04:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qDd-0000000AcNi-2osg;
	Tue, 29 Apr 2025 19:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDD1C5C4485;
	Tue, 29 Apr 2025 18:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D66C4CEE3;
	Tue, 29 Apr 2025 19:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745953332;
	bh=2nAjN+lDJpPG/3AFkNBwRGaeoQ2au71DtIzMd+k6ns8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WR10Z9XdtTt53b6JY3mS283JRh2MzxwfiXpdUtmsSCjRRfAn29RhPFZaPbIS/KT8d
	 uror/Fcz/WeEbnT4hlZbC1Qirj3pOHbRNwLMxjFN7BITpKKEeBzhWSnpwvP/T7eOAz
	 3NSGUnanz2EQzMLxpkzKkreVeOGalwgg7SoHtHB4FpFXI7QyfEPTQ88JmOZB0pEzMC
	 J2jD4crcvbTYZdCZOiEFSXq0sFiwfi1UKDVxwm/ijx8Gkw4q2fXQtzrSeez6rJVnHQ
	 RyZYLqQZVN2ZTdq3kFOfppcv+/FBC2KunYVwuueiwZCg78RkGkC/2h8td2hhBOj7pW
	 Y+3HHlLGCPQoA==
Date: Tue, 29 Apr 2025 12:02:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Da Xue <da@lessconfused.com>
Cc: Simon Horman <horms@kernel.org>, Da Xue <da@libre.computer>, Andrew Lunn
 <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet
 <edumazet@google.com>, netdev@vger.kernel.org, Jerome Brunet
 <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, Paolo Abeni
 <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit
 <hkallweit1@gmail.com>
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when
 using internal phy
Message-ID: <20250429120210.0aa6fa81@kernel.org>
In-Reply-To: <CACdvmAhcBmoDNyuu0npZzyExfhyLKdyPw9HvHvV+OdADxEfJJQ@mail.gmail.com>
References: <20250425192009.1439508-1-da@libre.computer>
	<20250428181242.GG3339421@horms.kernel.org>
	<CACdvmAhcBmoDNyuu0npZzyExfhyLKdyPw9HvHvV+OdADxEfJJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_120213_761855_BC2777B0 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, 28 Apr 2025 20:44:14 -0400 Da Xue wrote:
> > On Fri, Apr 25, 2025 at 03:20:09PM -0400, Da Xue wrote:  
> > > This bit is necessary to receive packets from the internal PHY.
> > > Without this bit set, no activity occurs on the interface.
> > >
> > > Normally u-boot sets this bit, but if u-boot is compiled without
> > > net support, the interface will be up but without any activity.
> > >
> > > The vendor SDK sets this bit along with the PHY_ID bits.  
> >
> > I'd like to clarify that:
> > Without this patch the writel the patch is modifying will clear the PHY_ID bit.
> > But despite that the system works if at some point (uboot) set the PHY_ID bit?  
> 
> Correct. If this is set once, it will work until the IP is powered
> down or reset.
> If u-boot does not set it, Linux will not set it and the IP will not work.
> If u-boot does set it, the IP will not work after suspend-resume since
> the IP is reset.
> Thus, we need to set it on the Linux side when bringing up the interface.

Added to the commit message when applying, thank you both!

