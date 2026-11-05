Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA805606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0k8hzkIJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=fUNscaPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kxFI2GFVoJa97jcX7ipRojoEPGOqoDfgUs9THsIEv3E=; b=0k8hzkIJuryiJhAggLE0HaWz9J
	mSqrI3CBJmM2KRO29fmJyZoHPnRBqUHG7ItmC5++w3ZW1CKtCfuobI0ReNmrfPkmirAn4eW32xfAJ
	BN029wyD+pazHDhoXvGM57jryg4Y5oPa89HBfV/GmDsif3xXmxB8jQlIsCaM0AVHec92Z6H7aaYsm
	RXCQeIMSKaVUHmV35EPyDwQQC5obdEIJ8qiXWmD6U14Hr9+zC6GqlUYa6oUKJsh14tFrdMthNCtrP
	iMwcjU1h37goITO03u7wJFOmlcSfBAezZ6s3kX/EbbQoGNfWkMFSx3yP+tLT3YKXEgqEBKoJlhEoI
	rWdXZ6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5FU-0000000Al97-0qb6;
	Thu, 05 Nov 2026 21:43:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5FR-0000000Al87-3SEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kxFI2GFVoJa97jcX7ipRojoEPGOqoDfgUs9THsIEv3E=; b=fUNscaPYoByuVDnvTWOJzI2t3P
	tQfqYdoz8/jhSoNjaY448mxxGESPJHSlLJqdLbie+hgCqO1wCuvza/inNNzl7HXZ/zDVvxoxUb8/g
	0/LAdYqf1l5U+cjyDNEW6UsawkqeNjcv7xRJBqN/tyPOufxVNNBCAD5WpgBCOHbTYaOo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xP5F3-00Edw8-No; Thu, 05 Nov 2026 22:43:29 +0100
Date: Thu, 5 Nov 2026 22:43:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890
 GMAC
Message-ID: <7b4ab738-85c9-4747-bf89-1a5532af6901@lunn.ch>
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev>
 <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
 <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
 <ba32cd69-23a3-464f-a74b-68a29e7b8202@lunn.ch>
 <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY4CJ6mCc5HgQUZd2Mq3C=Tsmwp=-acAV8dsWcpO_J87Pr6rg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_134353_953868_ACC2DE91 
X-CRM114-Status: GOOD (  23.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 03:57:45PM -0500, Joseph Telaak wrote:
> > Do you have access to another board which has a PHY connected, not a
> > switch?
> 
> No. The GL-SFT1200 is the only SF19A2890 board I have, and the only
> other one I know of, the vendor's evaluation board in OpenWrt, also has
> a fixed-link on this port.
> 
> > There are unexplained delays here. Is it the switch, this MAC, or the
> > PCB?
> >
> > We need to understand if tx-internal-delay 0 really means 0, or it
> > actually means 1065ps.
> 
> I can't tell that from this board. The sweeps measure the sum of the
> MAC's delay line, the switch and the PCB, and I have no documentation
> of the line's own delay at step 0.
> 
> What they do show, in the MAC's steps: the windows repeat every 8 ns,
> which puts the start of both eyes about 4 steps (0.2 ns) below 0. TX
> ends at step 51 and RX at step 28. So with every delay at 0 the link
> works, but right at the early edge of both eyes.
> 
> Until that is known, how would you like v2 to describe this board?

The delay value makes no sense to me. It probably works because
something is broken somewhere, either the MAC or the switch.

We have to be careful with what we accept, because we generally
consider DT blobs ABI, old blobs need to work with new kernels.

When we find out what is actually broken and need to fix it, we would
normally have to do that without break running boards. And that is
often very difficult and messy.

So i think we need a get out from backwards compatibility. We need to
be able to break running boards with old DT blobs, in the future when
we fix whatever is broken. Maybe the best way to do that it make the
MAC glue driver and the DSA driver depend on BROKEN.

    Andrew

