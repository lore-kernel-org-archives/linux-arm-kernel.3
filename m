Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01636C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GajXLDN2685pWJo9xC0Nx2+rK1EwQ+K75rt+Q/4qOCM=; b=NDcjtDNzulp9r6o4iNgTIIbxmS
	su2Mv5TDgYLdhW27usky/EtzvL9jH8Fj+5NX1P1aZ9Pesgc7opho6JHn4Fa1jXSQXRpERQog6PB22
	+45IIM8kW4ymQNqlx0DkyyETLl+SFe72BUr1mrghxYNBicmEPhTNau+x6DvJmDtUGYpLwATxM0TbP
	vkMI16DJOndcKa9SN62myV2sq8wgq8bwPcqKt1+rRkS9yu0QtbEXQ+UbM1BW1XY+RH/kvpfiVaWk3
	QNioiMF5e007B6c7aufla4Bgg8se0OC1hhZeqQvRa5bWimMQNbdUi3UzLJX9p2COGQufTMlu7yWNh
	g3hEMhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigFu-0000000Cca5-2u90;
	Thu, 13 Feb 2025 20:56:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiedB-0000000CLqj-03nu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:12:14 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739473929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GajXLDN2685pWJo9xC0Nx2+rK1EwQ+K75rt+Q/4qOCM=;
	b=NSpbBFE1aVWv4CUyVIyy8riKxiF2EC4/siz5rBzOHmG4U22DSfCQNKAOgi5C8eirgRh1ho
	bdpnUTW+2fqZgg1d0EoWomTjaGjCwh5DIOwHQ5uGOq1/YlWZ5OknnB3V+krWU5WnUPtR3C
	pQFv81WdqqMu/IaTr2hh7HjrZGpt+4lhh10WpZ699NXQMnaOfdymm8laArzpbRDDVjEsqb
	sTYUQsP1twvZz3YYXV6FwkT5Tb+ao6OTO3e5FJtp9tpsq5tsXzJaH78aGxs6IN++967t/y
	w8qHULwNTJ4XLP+NKRGHBOBJxV3Xn4wRNTLAiYbmOnmxPp6UzsSfdyCH3nwUnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739473929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GajXLDN2685pWJo9xC0Nx2+rK1EwQ+K75rt+Q/4qOCM=;
	b=iZmKUni1dH4kiDDh/0GIAY089sWMZeS0ib4L4RxdVqhbyRgXwwEqBZ/AkFhfj6lhFMoShn
	QVU77G37xaLlkyDg==
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Kory Maincent <kory.maincent@bootlin.com>, Gal
 Pressman <gal@nvidia.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
In-Reply-To: <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
Date: Thu, 13 Feb 2025 20:12:06 +0100
Message-ID: <87v7td3bi1.fsf@kurt.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_111213_197185_D9C4B9CD 
X-CRM114-Status: GOOD (  14.01  )
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

--=-=-=
Content-Type: text/plain

On Thu Feb 13 2025, Vladimir Oltean wrote:
> So, confusingly to me, it seems like one operating mode is fundamentally
> different from the other, and something will have to change if both will
> be made to behave the same. What will change? You say mqprio will behave
> like taprio, but I think if anything, mqprio is the one which does the
> right thing, in igc_tsn_tx_arb(), and taprio seems to use the default Tx
> arbitration scheme?

Correct. taprio is using the default scheme. mqprio configures it to
what ever the user provided (in igc_tsn_tx_arb()).

> I don't think I'm on the same page as you guys, because to me, it is
> just odd that the P traffic classes would be the first ones with
> mqprio, but the last ones with taprio.

I think we are on the same page here. At the end both have to behave the
same. Either by using igc_tsn_tx_arb() for taprio too or only using the
default scheme for both (and thereby keeping broken_mqprio). Whatever
Faizal implements I'll match the behavior with mqprio.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmeuRAYTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgoNMEACxHuGRV1xo/6Yr14uiqR7/m6lnJfHO
VTBNS6156eY78HOjVVIf+0xjxVFobt8kZyohcfPY147TRWrpHMg4ZQ1uLu+YGkEi
xDmY+wpwU/CN+/8bbfQwijBQ0fHYGPmP7k0x416USYh3v1pw4nS8jOoZ/jOyV8PG
fM9g5geb8hVNqHwqTSMXA/YUBsZWLHyU21KZ0HPHsw7bADdXLEMWyFhRJaVY7FSD
SOdNfVqqjS0JZVDjq9VG2ducxhT7pX+3eWvtbXQE389lfGTmksx/Y51OFlIbRmpj
pvWvsxdQbD1/eAhnf5KBUWekuFLuGnJfvWI+cj0+Bm4dHiICIQHUgPj7Hg7xNiPs
eF1MfoS6N0ZDoO5RvHRB8DxzqUhBIOtDnEhBSITVraGkvH7C6tmtOHWrx1NSnuAs
d6Ia/wwRTeCKvUfMWkgFdIAJU+FFWSAxbOjNEDPzzbrACs+/M7m6O0tpmZUWnYbN
pXmA3a8EPGgkWxVgXBmQkqaPqCp8idSlLE1K7n7vIumuHfxTkg3QHa8EU7lYogkk
jPBMvornSEgDfvotXaprSHKdW+J0kiGTwZ7xDX3tUcAofflSmtbxFhOeXa3rs8Js
v/GJW2S0mWcjeCRbJePDGeg1PSQwXGmV2PL6WBzNOhjSBvwluBguSQnrLhfYwXtK
icCpedLirXUfiQ==
=C6Aw
-----END PGP SIGNATURE-----
--=-=-=--

