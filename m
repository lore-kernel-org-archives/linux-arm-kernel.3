Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2300DC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smRHoEj0Twx20AA+nj0Da054TRsu20UDIY5yl86Aq4A=; b=GGj8kl2FNOJLUtniNNxEg4Epm3
	4KtemtFbUiEz59myE/L4VDQ68gNoc+JXTUX4SaDy0CgpSKu/tBEMDiKFuySXjj9r6YBsQVVtOcmLA
	s1G3SmYQOU0hYV+/g2z4h6BlQVIvy2x2mnsqViM6a/XBrWYqIxv1cmtdhmpgJQ5n7MPcAdzbUR0Uc
	k3ZrlsxZrbAw8mioXjctq0gdQI+u8qktw5iU5yxFIBtezf5wtg64UYPN9VPLcMSqW0mVmOoVSHeZR
	7wJeS/H6BynXnLCk3VBqI7kmZscqVHFRjaTEWg0TSqypK85mGm91+n2E8EKT3JiP6VXNu4D2+goxo
	ZwgLdm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKONP-0000000E9E3-0Bq4;
	Wed, 28 May 2025 21:31:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKOLE-0000000E8xd-0BML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 21:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=smRHoEj0Twx20AA+nj0Da054TRsu20UDIY5yl86Aq4A=; b=vhDUvgUGKpHJX8MckMn6K1pZFi
	0eYhyiinOgak6BcAx1TuEKdJQwOLiPTnCiQ4g4tOS+ZFMlJUSlnTNG2yFMIWzcr6mYVE+gVUKqf7w
	cJgzrSGB8ykanu5921ZUAnmygqK2uZwN8GdwhGo3gq0nH1nP8NGuKD2upm36Hwyw17+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKOKx-00ED7B-69; Wed, 28 May 2025 23:29:23 +0200
Date: Wed, 28 May 2025 23:29:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org,
	netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
References: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
 <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_142940_081292_6267ACC4 
X-CRM114-Status: GOOD (  15.66  )
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

> > Describe the one PHY which actually exists in device tree for the
> > board, and point to it using phy-handle. No runtime detection, just
> > correctly describe the hardware.
> 
> But the boards randomly contain SoC's with different PHY's so we
> have to support both variants.

You have two .dts files, resulting in two .dtb files, which are 95%
identical, but import a different .dtsi file for the PHY.

You can test if the correct .dtb blob is used by checking the fuse. If
it is wrong, you can give a hint what .dtb should be used.

Or, as Russell suggested, you give the bootloader both .dtb blobs, and
it can pick the correct one to pass to the kernel. Or the bootloader
can patch the .dtb blob to make it fit the hardware.

> > Do you have examples of boards where the SoC variant changed during
> > the boards production life?
> 
> Yes, the boards I'm working for example, but this is likely an issue for
> other boards as well(vendor BSP auto detects PHY variants):
> https://www.zeusbtc.com/ASIC-Miner-Repair/Parts-Tools-Details.asp?ID=1139

Mainline generally does not care what vendors do, because they often
do horrible things. Which is O.K, it is open source, they can do what
they want in their fork of the kernel.

But for Mainline, we expect a high level of quality, and a uniform way
of doing things.

This can also act as push back on SoC vendors, for doing silly things
like changing the PHY within a SoC without changing its name/number.

	Andrew

