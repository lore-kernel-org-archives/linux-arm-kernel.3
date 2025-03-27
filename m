Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EC7C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbwxFimHjuyQqZmQbnUDmSjTT9QuBUrE9kGrrCegsl8=; b=T931VMihf+seLEV6e+UyencdV4
	ENhaDq/g7OkEwWSCAdrbRK6VzL97+/96XX1uAOQq4uCkTRkB/Z3jBDfiyEt8Nwp+HLQvkod5Xikso
	KWRAqiPfvp0SQB2wrvhOFrv7phfVksAXJRGheQfayled9NPyG2LznqMQD6ZoNjbmfpQWJwVHCd/AK
	VPYxy+aXRW3S1V2gq474By/jDdLVXgR09XPOnbT6ZIZM/wIFRKc/QJkoLcEp5G3X2qDAAbTrMGehY
	kTVk+RxPnUYfi3gsCIH1Nmd9qxStLGWjmre3t8EfUSSAFhJsR5ayXzVDjRBYs0ECxnNcAfrSo9FYb
	Wgq69R6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqVk-0000000BaRZ-3pF1;
	Thu, 27 Mar 2025 16:55:20 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqLF-0000000BYVQ-3wgZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hbwx
	FimHjuyQqZmQbnUDmSjTT9QuBUrE9kGrrCegsl8=; b=PibiQl0UGvs02bQfzYYI
	pkF7He1ovGQgWonPfhrXuPMoW8iOuyZLOUpnHNzzREGLMqHvW9XP70wFtIvAEX5e
	cFMngdPs6iBpu2m3iNe0EQf14Dm/7XsPgTFm/9PzHVh0zJukwfDvxasKDPupxuS7
	OshgLMyM9K0/YzNRomYpV2u/njpqUVhCNLZLcW048GCFkMNU9gMgxytwmKBfQP3u
	f11qEJsnNOOOEEJI/HwrQrzrM57urM8B6hdwZbHXWxcmbpiLJzpKkSMkGJPonHLd
	p8GwEP7/Wg1nVPgGGjJWuwq7xGWLheHbOmzrTo6QTZO17nrAkPe8w1Grbzwf1Vab
	YA==
Received: (qmail 4083466 invoked from network); 27 Mar 2025 17:44:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2025 17:44:24 +0100
X-UD-Smtp-Session: l3s3148p1@gtWOqlUxgJEujnsv
Date: Thu, 27 Mar 2025 17:44:23 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Message-ID: <Z-WAZ_IlMBB3XbTN@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
 <Z-VETFWFT5NksD7J@ninjato>
 <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c/EJiR+H9xTHY3mL"
Content-Disposition: inline
In-Reply-To: <6fa375d2-5ba8-4b2b-8a54-f28b3cbedcfb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_094430_829903_4498333D 
X-CRM114-Status: GOOD (  14.27  )
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


--c/EJiR+H9xTHY3mL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You did not object to last discussion about this (a month ago) - neither
> to my comments nor to resolution - so this patchset repeating the same

Because I cannot follow every Renesas patch series there is. You are
long enough around to know that large companies have different entities,
groups whatsoever. It is quite a challenge to streamline this via one
group, we need to share work. We do try hard, though, and have a
ARM/RISC-V/RENESAS ARCHITECTURE maintainer. Geert does a *hell of a job*
getting all these submission into shape, and he surely does not accept
code thrown over the wall. And geez, the patch series was just sent
yesterday, you didn't give us even time to raise the issue internally.

> pattern from the same folks while ignoring previous talk is
> contradicting "not too bad at fixing stuff".

First, being a maintainer myself, I do understand the frustration of
patch review not being honored. I can also agree that this series did
not work out perfectly. But that does not mean that we don't care, in
general.  Despite all imperfection and possibly different opinions, we
try hard to be a good citizen and spend considerable time on doing
things right. Accusing us of throwing just "code over the wall" because
there is an issue somewhere which hasn't been worked on in one month is
plain unfair.

That all being said, we will fix it eventually.


--c/EJiR+H9xTHY3mL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmflgGMACgkQFA3kzBSg
KbZxSA/9Gqszzc/JQdPg5lFILYUjNMR2rLsA7Uc53vk3WyEcVSWmUaBjeGLU+ZkO
2OkaPe6x+ULk1vXzpJYmHK8J93cMHK7/tXR8YBFXno9cL1s+/XdwWuLWq0xlMfc5
weFwNN/e3mz8emxJWhi8AJ0sMhC6OTBL4qghprYH6ElZfxgpliuGWw59ei1gKnsX
/p5mOmGEETy4DIbiJEYth/Jypl4NrhfZdMmTUWBTqAj7/HuaBvY1psifuwDtAe5F
mY3FY3ES+6Hfzl76tsBQ6JEmRW9E+rZFR4Dv3M8XXaEYsZZ8fR1cwgQ1WXNbdmz/
1QOmex7GF5ceEJWdhEqAVJhz+aN6+Ot0Zxv0BCpxJzEoIGg7SXYpfkVBrTSL66a5
1trcWPmelNgqCRc65t+mvUmAfsELLXUE7h96hKtqDCQ0GNokdbqS0PuRCief56/b
VwXftmqvTstdTB7zMf9qfg9uTCeQycuzAsZQOdNynvDKML9olp6di/+curLvv5BW
M45znbdpzss7Ilwj3qbgIkFT2O0v8PGdqsn+1gQ8mgahnCe9OAtZl1hd8o0WDmnJ
2sbZcCcYMLgZVa+bI8/20Vba8uOnMMLVWZ/jk8c8LiRu8mqtYNAFGM8ClHFfh31u
hLSV0vYp+GarLkjMqXezTYhnugy344QNVLOm2atmMGI69u8dtWA=
=0lVg
-----END PGP SIGNATURE-----

--c/EJiR+H9xTHY3mL--

