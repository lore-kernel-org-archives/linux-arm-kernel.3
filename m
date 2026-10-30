Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L30EJF9q;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=oN0n3S4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QtGA4oygWFl5CX8vg4imBuTm2I065I8hD6TIKVaKg5Q=; b=L30EJF9qThXNUx8o1i/Tu9KfOx
	c6nyAcY/X4nkWm7GjXAsmFQBZKS7rz5+6es3BnM2hxyuf+1yMoZu8SxHFQEVe9X1iysMQLktiadyr
	fMXkqF7bo9JwFaYP94enL3aaObMu/F80kC9brbS4ZSncC0poTQBmqSsvHfu7K/AvbAbu/EamVAbbs
	IighW3JLR71N/6rpQgI6GNHj/BvzfkV8ZHjYmqaTTRmvVA7Fy7ZKHYwHvUDdf1G4MJHwAfTp7206q
	zh/S6seadKN3u1YwTbuUxvhkQbvcMvo4DYcp6bzGj4iVbw9ehyuYresUq0ODPWhFE3/rKlsw6qGNi
	TaEQd/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsM1-0000000CUr1-0vO5;
	Fri, 30 Oct 2026 19:33:33 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsLy-0000000CUpx-25SZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 19:33:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6F0BA12EB;
	Fri, 30 Oct 2026 20:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793388800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QtGA4oygWFl5CX8vg4imBuTm2I065I8hD6TIKVaKg5Q=;
	b=oN0n3S4Gd2LVGtKCDgtH54i2pOhilG/jMIpjCCAbd3+LpXofGFf61vIwpzBwcPREbEm7an
	p36ug+Vmik11e0AUTxf2NB1yqnHB4rwsnODkaL8EL2UbcvZU3CHWaxhC+neli9Zp9dfxlD
	btxU5LaG2pvvU9A8D7RiZyM3xNlZHkH9KfGP8aI4/N6owHRlg2hxePioLhy5eoVvTdabdE
	bK0stGfaC953F3oRg4QwmORBbTF4u/pCuXaBsSo5tYEXb6scv2o3bpyqX4lzrM+lIAeRpy
	aCYoEn1Hu6NiXRxuyfTYeH0C9anNwX5JSuXWI5QjsnWeABE2TksgvkP93INtIQ==
Message-ID: <3eb9f731c0facedbadfcba6ae490862e7f6e3fd1.camel@tipi-net.de>
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel
 interrupts
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net,  Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King	 <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,  Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>
Cc: thomas.petazzoni@bootlin.com, Alexis =?ISO-8859-1?Q?Lothor=E9?=
	 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Oct 2026 20:33:12 +0100
In-Reply-To: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_123331_053025_CE275129 
X-CRM114-Status: GOOD (  15.41  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-10-30 at 11:22 +0100, Maxime Chevallier wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error
> interrupts,
> and this leads to interrupt storms when one of these interrupts
> starts
> firing :
>=20
> =C2=A0- The RBU (rx buff unav) which triggers under high traffic load
>=20
> =C2=A0=C2=A0 This triggers easily with iperf3 and small udp packets, and =
shows
> =C2=A0=C2=A0 when running the netpoll kselftest
>=20
> =C2=A0- The RPS (rx process stop) which triggers when we stop the DMA RX.
>=20
> =C2=A0=C2=A0 This one shows when restarting the RX logic without doing a
> down/up
> =C2=A0=C2=A0 cycle, like when attaching an XDP program. The XSK kselftest=
s
> =C2=A0=C2=A0 triggers it.
>=20
> Let's make sure we clear these interrupts for multi-MSI cases. It's
> already properly done for the single-chan interrupt, and for that
> introduce an "ERR" DMA dir, as we don't want to touch the RI/TI bits
> when handling these interrupts.
>=20
> To avoid duplication, the DMA TX error handling is factored out in a
> dedicated helper (in the same commit to ease backporting).
>=20
> Both of the above storms have been found on dwmac-motorcomm (YT8601),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
>=20
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
>=20
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=3D1 for
> multi-MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [..,]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

thanks,
Nicolai

--=20
Nicolai Buchwitz <nb@tipi-net.de>

