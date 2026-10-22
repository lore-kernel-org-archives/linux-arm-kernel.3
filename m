Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DK0X6d8T;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Efe3Tff6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YMGU50rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUoz53K599fZhg1OLTYQwz8gx2AgSV9orfVTwiVXc3k=; b=DK0X6d8TV4IENErCpCxhNVp8BK
	J2enjmxGOGjodkLwRogFXhpmaSFzAScyfryyLB7LFGTbnwZ6/5i5f0uehYiC3b3vzMvosfW34t3Gm
	inyx2K1HyAGQWWoALOUi3KFDWkUXvw7zZztR4+FzZP7WhvJGEe+CXHyKvWawekStPnDXn7Dx42S0a
	P2IUZtOnY+I2mcusvYobrN6dMo/DVkSnrAPmhVosK4ElmADj9A4RQOrxRPiyHQreFypsl3OFlckiL
	3Xsij3otwE6Ed7aF+U/Bvu48m+Gtub63ErnLjzXF3f6nW6oYzyZ4bX7AU213wJxXsEhCkWZDHE9ww
	n3l4Nn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmsW-0000000DXOJ-37xm;
	Thu, 22 Oct 2026 07:06:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmsU-0000000DXNo-1p6J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:06:19 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792652776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUoz53K599fZhg1OLTYQwz8gx2AgSV9orfVTwiVXc3k=;
	b=Efe3Tff6ZTEtxF9tszPXm6bbUZ1Lv3XAyKsB4DB9FJk9YGaReK7modBV0WF600PniLUD2X
	lzu82V68WXDSW2XQ6ejJdg2MATbWENz+l81g7jjqTDq5vgfDkop+cr2ns4CpfBrkB7hhnT
	uJCO21+J2ADMMh4YHc3/DlW06RPqrmlGo2pV77KIkeR2aBCdAnXZ9kbtKHmaaljLE6lQ8j
	VddytrVKHagcjzn7Rp8YzAsw78TnYEqJ+o3o70OAmOZpiqbBxlSpOA4h8OOIrGgv1MXJLn
	Xxe4+ECGXupl07drIsjtU1NYE8lCwR5So0VrWuvx1KPUFb+2c50yfSPBRLffQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792652776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pUoz53K599fZhg1OLTYQwz8gx2AgSV9orfVTwiVXc3k=;
	b=YMGU50rgv8rAoPhVWhm2yHhmxu47Lc7hl3Gjl8o04pqCgp65LMQoOdWjqHiFfwIhQbJAPO
	d+8k/n5Gz5jFH4DA==
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>, Mohd
 Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 0/2] net: stmmac: Fix XSK crashes on stm32mp2
In-Reply-To: <20261021073306.61972417@kernel.org>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
 <20261020140849.12fc79ef@kernel.org> <874iefjjan.fsf@jax.kurt.home>
 <20261021073306.61972417@kernel.org>
Date: Thu, 22 Oct 2026 09:06:15 +0200
Message-ID: <87fqxymcyg.fsf@jax.kurt.home>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_000618_617429_03B7A497 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed Oct 21 2026, Jakub Kicinski wrote:
> On Wed, 21 Oct 2026 15:05:20 +0200 Kurt Kanzenbach wrote:
>> On Tue Oct 20 2026, Jakub Kicinski wrote:
>> > On Tue, 13 Oct 2026 10:57:20 +0200 Kurt Kanzenbach wrote:=20=20
>> >> while looking at the TBS thingy [1], I've noticed kernel crashes. That
>> >> happens when opening or closing an AF_XDP/ZC socket while parallel Tx
>> >> traffic is going on.=20=20
>> >
>> > Let's respin this against net-next. The merge window has started,
>> > applying this to net would give us an immediate conflict and pain.=20=
=20
>>=20
>> I'll send this against net-next when it opens again. Thank you.
>
> I mean that you can repost it now, just rebase on net-next.
> By the time we apply it net-next will be net so to speak.

I see. Rebased to net-next and posted v4:

 https://lore.kernel.org/all/20261022-stmmac_xsk_crashes-v4-0-15c0c750bb96@=
linutronix.de/

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmrZtecTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgrWQD/9Jq7mtMI/GNzuGLA1ndFrh32qOiUHN
N1AsHtaEzUP74uGRgY0nSbO+93zYdhYFkZDMsN2QwU3EVP+TNm47EZ51UpDVFJA5
1OaxBUHcHi538uRGtuMGRjuclxMWFbZ0wJB96V9epyS2QbwiweGRN0qIJcLJ3kiZ
Lh27kMjai9NjlgLwbI8tdbfTrOOgCUK1McL4EDeYVkXw7R7ubgTZq0NpIlxGmppc
bak3br0g0QGMu6AxENEui5LkEb2XnI7UYVWgXdyMkzhYMmkN3106sUP/wfF0GAjd
e1zKcum/vaWgGnaYpf6XVgpVpPcFud7hkiWWAXihmBHrRwaSPCRvPn4HHVg2Yuda
R9lBMW587UybrQI9pO2vH7jJqvj/FLVviT+XsYLr2JR/csfgLrOIxKeTlsCVQTSe
JTML+JiOC2z0mHGnjKJQ67sZ2dX8SoAiyz2k5n/DJegzbONuuSCNt6ZJswpIDglf
l1O7IO5PrmJ3nGyc4rvJev2a+Hi4i6+yj76jeRaFOpESyle258/I7BdpzL4Qq5wp
ll2H2x32dUeoZw+tSY5XNoTUx3YntDAFTcNGuLl+S21rC9GE0k0X4EvN+Lsc3mzE
bx6SyGtX7Qrhzm8JLxcFX9GIZAQj2muF2jd5gs+otuv/FvrPhAU7+XAHToxtMiGQ
a4QEpY65nsgcxw==
=3vSL
-----END PGP SIGNATURE-----
--=-=-=--

