Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155FC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMPOvCeFAGL1Bzwhnzo7bfHBjVlXhYB3RaP4/eVOF4M=; b=b/HT/eroCOq8nNxRFBAVBAZah1
	qswOQNKp0E06R5he7c1rARWL7NXuLcBgXma9ckIEYHAMlKLtV/Q7vi1/TcHYCr3ANKpD9oam0e9vv
	LauKJEInT0Fv2LyO+FAjbS/I4RcSwHzO2XuvBYESopJOKrrPXCzB16hnbku4pv6B4lXgY22hq2ClD
	2rFgL0EsF2OeVUogD6GXkjmjXRmMQeLQegikqorpyLB7JO5Bk55WLJr79KMUpbvSApmSB6J/rgNjC
	VGRwSlsuHT8vT77QxIxTK/qmqFqoFTkub7pdcqHaJEfK4NnTNhcNpFqxLZxolOL4hvw0yxE+sand6
	YzHO2SIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJ5n-0000000D3Fu-3oXW;
	Sat, 01 Feb 2025 19:23:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJ4T-0000000D39s-1CNn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 19:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kMPOvCeFAGL1Bzwhnzo7bfHBjVlXhYB3RaP4/eVOF4M=; b=qM7VuuqUUsNGS3N5O4A2GXpxCv
	ve24WUI2D4ycBprLxsKCSju4KGq+f6lzghmCeBb4inmaasZI6Jze/50/AExlDQAXVX/GZy9vECx+R
	9CLOQo2h2ZmxB99Uv7WBDlmoKK1wzcmfes8ZzGdAWxRNUsPYXwIzxD4KAzBCPMgy93+E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1teJ42-00A2uZ-LG; Sat, 01 Feb 2025 20:21:58 +0100
Date: Sat, 1 Feb 2025 20:21:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability
 value when FIFO size isn't specified
Message-ID: <35ac46e5-1a5c-4416-a6c8-1fd42ea47d37@lunn.ch>
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_112225_326230_6B496E9A 
X-CRM114-Status: GOOD (  17.19  )
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

On Sat, Feb 01, 2025 at 11:14:41AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Jan 27, 2025 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
> > When Tx/Rx FIFO size is not specified in advance, the driver checks if
> > the value is zero and sets the hardware capability value in functions
> > where that value is used.
> > 
> > Consolidate the check and settings into function stmmac_hw_init() and
> > remove redundant other statements.
> > 
> > If FIFO size is zero and the hardware capability also doesn't have upper
> > limit values, return with an error message.
> > 
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> 
> This patch breaks qemu's stmmac emulation, for example for
> npcm750-evb. The error message is:
> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size

Hi Guenter

Please could you try the patch here:

https://lore.kernel.org/lkml/915713e1-b67f-4eae-82c6-8dceae8f97a7@arm.com/

	Andrew

