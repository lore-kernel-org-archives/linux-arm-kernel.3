Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F755606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMHPDuC5;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZEyUwzAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnoNYrh8MOVI5Naq9oKQorrqR4sbrLyiz7U4v4AXZCE=; b=cMHPDuC514OWibFHyOtZ0cTVqY
	XSkiq60eXrzCLPZVR8oGJ1kr5Ls3tytJdI2cWJG4CwkxSNqH1JXGjuCTKL25jh7EZY/KWKYyUEJsw
	G+BR8C9GnwZe09tyMLSQA47ZEOTOswN9XU8g7k2eg4x0AJw0cXa8BftOLrBSguudL5211lHGQbcKR
	rJPEbiNvuRcXtx8L8cwIowuuwGuK2u3NkiWWn988CQHHgo9WtZR7TwF24b8WVGQQqhntuJNDjJ/Hk
	vMrrDAoy2xyRuUSjUuIVjWN1q9605FfIGIw/hPpkkg2w5QITZbSUzIlMJEocLpOMU9rget0TjGjm8
	cXJEs68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnNX-0000000Da2F-3Ljp;
	Thu, 22 Oct 2026 07:38:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnNV-0000000Da1b-1HKZ;
	Thu, 22 Oct 2026 07:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WnoNYrh8MOVI5Naq9oKQorrqR4sbrLyiz7U4v4AXZCE=; b=ZEyUwzARHz47EcN8uXbOF0XTuA
	GafSTJMtAMhaWxo68Ky2tAuyNcvr5wuHLp8DWusSyEJVmh5AFDovAInOT1dY1KEDOlvC1A+UBRk9w
	c86FDr9qwHhzcU4JXi/b8SLVWkNRJ2YbVw5O+njeSXd/qp1DU3BTOvxsrYgOinZ/lCArbUsoLJ6n2
	Yzliopu+QLaQ9xrLhbOKATH2R+ktrtbbROzUojDub+NX/69SzMzD0z8EdcRxG5hXIarq8FuTcODk9
	uD2WKRfkLekwmmOazjrVXJc3PUNDowJ5qiFv980+1WoJKn+E6fL/lLBl7FHHwea54zuBJuYW388Pz
	ZdsNgirw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>, Cunhao Lu <1579567540@qq.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, mfd <mfd@lists.linux.dev>,
 linux-gpio <linux-gpio@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-pm <linux-pm@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-phy <linux-phy@lists.infradead.org>,
 linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/27] clk: rockchip: Add RK3572 clock and reset support
Date: Thu, 22 Oct 2026 09:38:06 +0200
Message-ID: <2117228.PIDvDuAF1L@diego>
In-Reply-To: <tencent_791C8CE4050020CEF9E536C9D3B4CA9C250A@qq.com>
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <2339330.72vocr9iq0@diego>
 <tencent_791C8CE4050020CEF9E536C9D3B4CA9C250A@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_003821_436989_438F7F7F 
X-CRM114-Status: GOOD (  17.21  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Donnerstag, 22. Oktober 2026, 08:09:02 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Cunhao Lu:
> Hi Heiko,
>=20
> > As you didn't write this driver on your own and even kept the original
> > author, please also credit the original author in the commit itself.
> >
> > This can be done for example with something like
> > git commit --amend --author=3D"Elaine Zhang <zhangqing@rock-chips.com>"
> > and in the commit also have both signed-offs-by, aka Elaine first
> > then yours below as the submitter, i.e. like
> >
> > +++++++++++
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > [document what changes you did inside the brackets]
> > Signed-off-by: Cunhao Lu <1579567540@qq.com>
> > +++++++++++
> >
> > The same applies to all commits coming from the Rockchip vendor kernel.
>=20
> Thanks for pointing this out, and sorry for missing the commit authorship.
>=20
> I'll review all patches and add the original authors' names where necessa=
ry.
> However, because the BSP I received does not include Git commit history, =
I can
> only identify them from the names noted in the file headers.

Rockchip has published a development branch based on 6.12 on github [0] .
This includes this clock driver [1] and most likely all the other parts as =
well.
You can use this to cross-reference.

If there are multiple authors changing the rk3572-specific parts of a file,
please use the first patch author from that history for your patch, as we
don't want to replicate the development history from that vendor kernel
tree.


Thanks
Heiko

[0] https://github.com/rockchip-linux/kernel/tree/develop-6.12
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/clk/=
rockchip/clk-rk3572.c



