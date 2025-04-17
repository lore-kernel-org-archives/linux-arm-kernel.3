Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B8DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE4JWE+8eZzNTxMrSC0k6gJEb4igX4fhxodY5PL3rpg=; b=ExAxAbuTyR8FtgmOCNYuygLSZ4
	Vo3Rxa23cEz0XSiJnkT3Snu7xbpHUpVNALQGPHGqIqNLqmSd27yj+axRraGZivtT8/gu5NeYo6iYZ
	ZQRwqIGgQYwQU+pa2NANavFULlT7HqCmQqvC9lro8QZwx9c67IN5o9RPm5cGrpME0J2q1D2Z1WbIs
	nU97B8uNnrEQNe5ADybygSaTVsLtbgcHUNitoJRpaX5TwSZVucZw4K7Lhq+YJXeESmYKm6vEIDPuY
	NSM49hJ4LAHquSUrZ5bmpFJXnY0pMxq3gsTZtSRenhVQGRF2v/QT9BsMQQhkbuiG6J/FciajFS033
	qwsIx7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5S5W-0000000DfPX-0IFJ;
	Thu, 17 Apr 2025 16:27:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ReZ-0000000DbAp-17ar;
	Thu, 17 Apr 2025 15:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D42C4A141;
	Thu, 17 Apr 2025 15:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DC8C4CEE4;
	Thu, 17 Apr 2025 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744905590;
	bh=hHSlbiPaRGPDFDdALuBGMJLctXSjXushS0Thr9FD/Zw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SKKDzDFa8yz//vN87vlFbNealPS3RLJ8/IeYYoE/jxcPJqA9v7cTkd7J6AxzsO/Nv
	 SK3KnF6MDlGl2yM8TXsAF+hB8FfzOIL1ncZnOmTEuoTiYVF/l4Lezbcre9F8MvCsge
	 8CIKfGV1Y3zG7kyfSCfQYFt/tTYAQhSjZ3N+BH4HDcdAybxH6d3i/N1Oqpm3LgizXe
	 94+0ObpQDBGx0z1z34t9XGYj5YTpiguRIS94Xs/EtMwMkC0NqgPXGrn3NcBI/Y1bR9
	 0+0OtUSjhS8HwdDxZ8+Gt9dnfQ+1sv0L9E5aQgqyOStp2KaWMFejEUuLMR9GdV0O+p
	 gP+zNb10VHHSw==
Date: Thu, 17 Apr 2025 08:59:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Florian Fainelli
 <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 4/5] net: ethernet: mtk_eth_soc: net: revise
 NETSYSv3 hardware configuration
Message-ID: <20250417085948.35b0ec5a@kernel.org>
In-Reply-To: <aAEiCjdJdsqH6EAU@makrotopia.org>
References: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
	<28929b5bb2bfd45e040a07c0efefb29e57a77513.1744764277.git.daniel@makrotopia.org>
	<20250417081055.1bda2ff6@kernel.org>
	<aAEiCjdJdsqH6EAU@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_085951_330591_8DD03E72 
X-CRM114-Status: GOOD (  20.94  )
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

On Thu, 17 Apr 2025 16:45:14 +0100 Daniel Golle wrote:
> On Thu, Apr 17, 2025 at 08:10:55AM -0700, Jakub Kicinski wrote:
> > On Wed, 16 Apr 2025 01:51:42 +0100 Daniel Golle wrote:  
> > > +		/* PSE should not drop port8, port9 and port13 packets from WDMA Tx */
> > > +		mtk_w32(eth, 0x00002300, PSE_DROP_CFG);
> > > +
> > > +		/* PSE should drop packets to port8, port9 and port13 on WDMA Rx ring full */  
> > 
> > nit: please try to wrap at 80 chars. There's really no need to go over
> > on comments. Some of us stick to 80 char terminals.   
> 
> Too late now to send another revision...

I only applied the first 3 :)

> > > [...]
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > > index 39709649ea8d1..eaa96c8483b70 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> > > @@ -151,7 +151,12 @@
> > >  #define PSE_FQFC_CFG1		0x100
> > >  #define PSE_FQFC_CFG2		0x104
> > >  #define PSE_DROP_CFG		0x108
> > > -#define PSE_PPE0_DROP		0x110
> > > +#define PSE_PPE_DROP(x)		(0x110 + ((x) * 0x4))
> > > +
> > > +/* PSE Last FreeQ Page Request Control */
> > > +#define PSE_DUMY_REQ		0x10C  
> > 
> > This really looks like misspelling of DUMMY, is it really supposed 
> > to have one 'M' ?  
> 
> I also thought that when I first saw that and have told MediaTek engineers
> about it, they told me that the register is called like that also in their
> datasheet and hence they want the name to be consistent in the driver.

Hm, maybe add a comment ? It confused both of us, probably going 
to confuse most people later on

