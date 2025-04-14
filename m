Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A62C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Puvc1JtJ4EndPWc5A0w8qF4xlf4Ob96CxrifJNdC1Es=; b=PppNgX1+11Lw7QE9X5XKYl3hq4
	MB4t42PymwOy1paWarXJxeb5ERrWWSzcou4iEmfaS67zIToWeGIx4D49rPrvi68lWhrXpPqEy/4Zy
	oNojrMwHijOo+dYwGg2pyffSYJ8tTnnxvMEwII1wakC1DWiVDUleeUm0NeKNfPXcIVr4bHmuOoCpd
	zfOk7v5bXAPorpZh2qBzfNrn4QG9Ksza7wIrRgNSBAGm7KZr8jkkN+Z6UFx2pH3QTrRm5gHAR9P/1
	Nsnjrz6S8TmYbZuX0KOZvFRetgASw165UtQD0rzrPwR8nkKrdriQt6KTDGphBJumcR3t5dBUuENCQ
	9oQwWfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Mhn-00000002ns7-3J4y;
	Mon, 14 Apr 2025 16:30:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Mfv-00000002ncg-0JmR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 16:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85D686115E;
	Mon, 14 Apr 2025 16:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C61C4CEEB;
	Mon, 14 Apr 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744648126;
	bh=P/fa8u8mypyH0+6vdYrtZjJEaFzYh19+DjXazRmCLPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sK929LWNbvs845GbWY+rfc/M02ZlGNFxZwVDINnN5mSSEZOVzRx5BbM9eiPNLwD8W
	 VChZqkmLlSEFvE002cJO/oAZil7ruyP3ou8ywNsmPTUr9U+KvFoTT7byucRGAgYYlJ
	 3EzZvxi/TGFTic4AqyIL3GIrzC4L/P7jfKTEhAJyXKi2cTafz1/KXrppnOyyvRrfVF
	 NeqVXmnJNA9Gf9rxd8wW/13nU5uM4BDkclidQoiC4i2sLxuxrq54NrpHxfodDdyb/I
	 LCNHQaUuLSSDP4ke82MUU/9YDqui7lhAO1Bv2W3wzoUoHmTnpHKQmc4DAwuE2FIhPw
	 9wZ39T/yFzK9A==
Date: Mon, 14 Apr 2025 09:28:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <20250414092844.77999958@kernel.org>
In-Reply-To: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250407104447.072449cd@kernel.org>
	<CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 14 Apr 2025 09:52:03 +0100 Lad, Prabhakar wrote:
> > On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:  
> > > This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> > > driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> > > the Synopsys DesignWare MAC (version 5.20). The changes include updating
> > > the device tree bindings, documenting the GBETH bindings, and adding the
> > > DWMAC glue layer for the Renesas GBETH.  
> >
> > This was posted prior to the "net-next is OPEN" announcement:
> > https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/
> >
> > In the interest of fairness towards those who correctly wait
> > for the tree to be open I will ask you to repost this again,
> > in a couple of days.
> >  
> Are you ok for me to now respin this series?

yessir

