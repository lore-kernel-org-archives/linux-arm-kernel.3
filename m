Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9D5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJA4g42En+uawhKwJGlWNJO+UAjw8o7TK6oQsEIEysw=; b=sFZ7lRzEDfsCbTOvvW13BuXE64
	ZmCHiFygDy8rHANUFrB/xOnXNDJdVGs2j+PPmgcdFUILIm7feUoVLVGLDxwRy7utSEDqmIt8iFiaP
	aFEjZjz/SinS3JdegSA/xJ0/O4cP0q6nE7dbXX8O2hhfVqrbdHZzHK/C7rnedUTEwQGGAltQULaOv
	98vjmrOj92KEAU3PaNL3hz9+Npx8DZ9LS4GoHr9TyE124rbM7JrH663Fqe2ffTcDNLNDxKjvWZ2gX
	H6l15tipvZ0AB2CXu0N81vfZhoqrdgyDFwDXqVPQ9lAzMf2QNyExhkYVEPItWfo5V0agO7CSa5Th5
	Wym0arSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb09B-0000000Cpl0-3zfx;
	Thu, 23 Jan 2025 16:33:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb077-0000000CpVJ-48Li
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aJA4g42En+uawhKwJGlWNJO+UAjw8o7TK6oQsEIEysw=; b=FY0aipgKoz6hdW9JmVzyeCWzs2
	JDQrGtiEjokG0h0MAqwdRltMqbjsiTBI9wAkNypiJnZx5SQ4PLQ/UHEKu7hrmiKPTF1Nx2l0vbbo2
	iYXBhJQ7arITeTtpl/QqVDfCYBOv9F6FGKYwwUelCHzRL7koyrGsN5ZKQgLjfx8dOS7XZdLlodnZq
	jRSUtSD3YiFO9hranwGYWMSxO3k8lx9yy+8x/ejZZ4Wv2H4X4C9TRx90lydy/m5OvQxZftaplUsIl
	wyne/41MJBGeXP4T7iXjDe9ZWKoq6XxxOkOR6zgkxo5kqyWG1/c1ueqvV7Jed3KMqaMyM5WZ76N4O
	Roaak0rw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36832)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tb06u-0001HN-2h;
	Thu, 23 Jan 2025 16:31:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tb06q-000659-1t;
	Thu, 23 Jan 2025 16:31:12 +0000
Date: Thu, 23 Jan 2025 16:31:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Furong Xu <0x1207@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
	Vince Bridgers <vbridger@opensource.altera.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/3] Limit devicetree parameters to hardware
 capability
Message-ID: <Z5Ju0DtNDwj_hO0F@shell.armlinux.org.uk>
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
 <Z492Mvw-BxLBR1eZ@shell.armlinux.org.uk>
 <ea845c58-ee2a-4660-bc13-7e05003de5d0@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea845c58-ee2a-4660-bc13-7e05003de5d0@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_083130_027052_A583C19A 
X-CRM114-Status: GOOD (  25.61  )
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

On Thu, Jan 23, 2025 at 02:25:15PM +0900, Kunihiko Hayashi wrote:
> Hi Russell,
> 
> Thank you for your comment.
> 
> On 2025/01/21 19:25, Russell King (Oracle) wrote:
> > On Tue, Jan 21, 2025 at 01:41:35PM +0900, Kunihiko Hayashi wrote:
> > > This series includes patches that checks the devicetree properties,
> > > the number of MTL queues and FIFO size values, and if these specified
> > > values exceed the value contained in the hardware capabilities, limit to
> > > the values from the capabilities.
> > > 
> > > And this sets hardware capability values if FIFO sizes are not specified
> > > and removes redundant lines.
> > 
> > I think you also indeed to explain why (and possibly understand) - if
> > there are hardware capabilities that describe these parameters - it has
> > been necessary to have them in firmware as well.
> > 
> > There are two scenarios I can think of why these would be duplicated:
> > 
> > 1. firmware/platform capabilities are there to correct wrong values
> >     provided by the hardware.
> > 2. firmware/platform capabilities are there to reduce the parameters
> >     below hardware maximums.
> > 
> > Which it is affects whether your patch is correct or not, and thus needs
> > to be mentioned.
> 
> I think scenario 2 applies in this case.

In light of my other reply
(https://lore.kernel.org/r/Z4_ZilVFKacuAUE8@shell.armlinux.org.uk) I
don't think either of my two above applies, and the driver is designed
to allow platform code to override the hardware value, or to provide
the value if there is no hardware value.

My suggestion, therefore, would be (e.g.):

	if (priv->dma_cap.rx_fifo_size &&
	    priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
		dev_warn(priv->device,
			 "Rx FIFO size exceeds dma capability (%d)\n",
			 priv->plat->rx_fifo_size);
		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
	}

if we still want to limit it to the hardware provided capability, where
that is provided.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

