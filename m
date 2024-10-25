Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15BD0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbDacs+phZXwUZfEmiSz/UQ0arF9t20M+M+9HrSqDHs=; b=y1atL5dY7ZhQYInNkhxKzP/ct1
	ilKn5Y4Tca5qZ1MUk3WO5Neza42nnE6PYUlLoqNJtAlRyhXO03x1ywgGzKBh1NCXIclcpJJ/sAH+T
	GAhg/LmfxsuvifMfVCzteTCWgI+PTAxXUz3ngtjEp2uYq95QrbGsm3fhSfVdOno0Jml+AuW1SQWtp
	nsRlpB33e04I6E8YXQQEEsLvLcfoGQSedSy5iYp26uLMe1/188/rEi/bsEydgEi+dT3H19B+vySQR
	izEoSO8gzPVQbwnnStNvfnpuqt54WZ6oPchXC39u6IAWahEN5F3Ezag82fR8lCVsY4wTqkzH4d0Lp
	zinRVnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KcT-00000003rG2-3u8V;
	Fri, 25 Oct 2024 13:44:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KGY-00000003nx5-0WGu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dbDacs+phZXwUZfEmiSz/UQ0arF9t20M+M+9HrSqDHs=; b=5YTw7mINuAK2FjNLppS5ZX1TEu
	wA7kxuyX0b4aVDS0I5chb9XbMsSEgxdPDM9QWZBhTMG0EI4NF16Qn73OzYILoGRDGwLo+Mgz8fxjH
	XyEomNde5QB1IVSoQRG9X7xuYpm29P2go4s9mqYVtDGCv+aWJPzlUtTsdV61mOIfzyHE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t4KGO-00BFR4-A5; Fri, 25 Oct 2024 15:22:00 +0200
Date: Fri, 25 Oct 2024 15:22:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, horms@kernel.org, jan.kiszka@siemens.com,
	diogo.ivo@siemens.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <2288a9a9-f9d0-4414-80a2-e11ba66fad50@lunn.ch>
References: <20241024113140.973928-1-m-malladi@ti.com>
 <1a0a632e-0b3c-4192-8d00-51d23c15c97e@lunn.ch>
 <060c298c-5961-467a-80dd-947c85207eea@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <060c298c-5961-467a-80dd-947c85207eea@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_062210_186750_A3CA2A23 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, Oct 25, 2024 at 11:17:44AM +0530, Meghana Malladi wrote:
> 
> 
> On 25/10/24 01:25, Andrew Lunn wrote:
> > > +static inline u64 icssg_readq(const void __iomem *addr)
> > > +{
> > > +	return readl(addr) + ((u64)readl(addr + 4) << 32);
> > > +}
> > > +
> > > +static inline void icssg_writeq(u64 val, void __iomem *addr)
> > > +{
> > > +	writel(lower_32_bits(val), addr);
> > > +	writel(upper_32_bits(val), addr + 4);
> > > +}
> > 
> > Could readq() and writeq() be used, rather than your own helpers?
> > 
> > 	Andrew
> > 
> The addresses we are trying to read here are not 64-bit aligned, hence using
> our own helpers to read the 64-bit value.

Ah, you should document this, because somebody might do a drive by
patch converting this to readq()/write(q).

Alternatively, i think hi_lo_writeq() would work.

	Andrew

