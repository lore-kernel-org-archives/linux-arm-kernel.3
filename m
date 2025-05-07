Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD6FC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sPVrzUiQ+hehg1asUBhs/XYvzKveDurKf1FDpj71eU=; b=eDJI8cKFATiH0GR90V0H6JsOrj
	6NtTFFfeAbLmZMD5+7enT3jMIVaP8pR0TS9CBstccv0awzgzlKAF8o9VPstzBeO3HSByzrdOp8Ox0
	giE/puWF6dF5cBGgiWRzDP+HfYR8ZJf7XxlyX1veK/VpjyhSok7QAon26ePJUx0JXxuwoe7NwVF7k
	a3zJ1s5aWc3yVZhlFXCfz5bQvucWkidT4MQtk6wZYyUi2a72xDLzbYms9kE09qA1Te8A5PvweHCVN
	sZXnSO/MW3Po/zCpHE51f3SRhqc4Z6G4YZdgexmIky62+hd08lXvdb2zOARq1R8rb6DSkxilOBPug
	SOcsTgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCe6C-0000000FRY2-0p56;
	Wed, 07 May 2025 12:42:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCe1x-0000000FR0X-03Rt;
	Wed, 07 May 2025 12:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5sPVrzUiQ+hehg1asUBhs/XYvzKveDurKf1FDpj71eU=; b=UxEUkuIlcl7krxdT+42I9uKAVB
	YsgHWsOYxgVRqKwf7S8mlsuYxgynUv7Q9dX/JaEovXdfoebGLpb08RSV3kTRj4omig7NyEb6+V/rw
	UceXPNJzvFZKjLe9487sxOqbkwnHbCPN4zSyyKGVVC3kyRHngUxW7FK4rGWfa2nyHZr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCe1T-00BsZW-F1; Wed, 07 May 2025 14:37:15 +0200
Date: Wed, 7 May 2025 14:37:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for
 SG2042
Message-ID: <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
 <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_053745_051741_3255428D 
X-CRM114-Status: GOOD (  27.06  )
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

On Wed, May 07, 2025 at 08:01:29PM +0800, Inochi Amaoto wrote:
> On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> > On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > > tx clock. Add device id for it.
> > > > > 
> > > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > > does not expose this device.
> > > > 
> > > > Do you have a patch for this EVB board? Ideally there should be a user
> > > > added at the same time as support for a device.
> > > > 
> > > > 	Andrew
> > > 
> > > Yes, I have one for this device. And Han Gao told me that he will send
> > > the board patch for the evb board. So I only send the driver.
> > > And the fragment for the evb board is likes below, I think it is kind
> > > of trivial:
> > > 
> > > &gmac0 {
> > > 	phy-handle = <&phy0>;
> > > 	phy-mode = "rgmii-txid";
> > 
> > And this is why i ask, because this is broken. For more information,
> > please see:
> > 
> > https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> > 
> > 	Andrew
> 
> You are right, the right phy-mode is "rgmii-id", the delay is not
> added by the PCB. It seems to be better to ask for the vendor about
> the hardware design before copying params for vendor dts. Anyway,
> thanks for reviewing this.

Please do figure this out. Since you are adding a new compatible, you
have a bit more flexibility. If the MAC driver is doing something
wrong, you can change its behaviour based on this new compatible
without breaking other users of the driver using other compatibles.

	Andrew

