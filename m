Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1109BD232C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwK/7HWLNZdkoZbc3509z1EnYSgWBHAg3nkDVt2PhWA=; b=ZkJ8YINsIqNkVaCOQjLLuWlTvS
	UffdJ0t5eScGYQPkx3grsDqEXOI8RQaFkOoFibZVUQJ+vgVM1OFpH+tcPGCGr5h/gQ+aJDfjl8Wr4
	fZQy7l34tnwbeWKmkt9HjCdLDQFSKUcUwqZfxNaeG4S05lDGhW0jkBBJ072MJUZimu9VRl64zIlsu
	lY7Ov5StQmOJrR8Cc/e+8z2aWJAe06GeljFVe+UkcJSUgekJGoBFyj9HN7QVZo9Zh2pUwWUSRflAT
	/DPeEeC/ItXqLeKEGxwlUTZVWsMhHylnxhoZBDvxnnMaxcbauoEb3LeeEJPYZR7cfhW/0amYMCVNR
	dGzScxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve18H-000000013oR-2NLw;
	Fri, 09 Jan 2026 01:17:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve18F-000000013ny-2KCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 01:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767921457;
	bh=LwK/7HWLNZdkoZbc3509z1EnYSgWBHAg3nkDVt2PhWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FBjtDv7pUlyQuW0vTX7EesZslU0r4uFRyOYi3Pd0Wk1zqc/bokiLlqYR2AXRqdXQk
	 un0pBO2N1yEdS8OFrG7NJALuJBb/q23oequJ5ojCDahrnrnxx/fmtvfgnfgpeq+2Pz
	 qEJlRwU+TSyYDQP5W9AiQXE1h71pfWaL/iiHY0PtblZi1OuGyc351stq1fSiAlWHKA
	 2IiJlURKUoesVvWjY+4dLPSRfNwBOhZBpsYR7kgqWUkClGJFtqpfpiPAJdFrhG2i99
	 uR4bvL5JVJU9D5mkJh8dRa22b3yH+faWEKPL+wFc9MPp8AndVUW0P+zAGOe/ukAKVp
	 gg1TEqZF5zEhw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 081A87E142;
	Fri,  9 Jan 2026 09:17:36 +0800 (AWST)
Message-ID: <0b94a728bdee2483d0e963bdae69178539ed7721.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Fri, 09 Jan 2026 11:47:36 +1030
In-Reply-To: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
	 <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_171739_788584_924836DD 
X-CRM114-Status: GOOD (  11.51  )
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

On Wed, 2025-12-31 at 22:38 +0100, Linus Walleij wrote:
> On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > There's currently a wart where the Aspeed LPC host controller has no
> > binding specified, but the pinctrl binding depends on referencing its
> > node.
> >=20
> > Allow specification of a phandle to the parent LPC controller instead.
> > Fall back to testing for a compatible parent node if the provided
> > phandle doesn't directly resolve to the LPC controller node.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> I guess when this is non-RFC I will just apply these two patches.

Yeah, no dramas. I intend to split what remains to be applied into
separate (non-RFC) follow-up series now that many of the changes have
been applied.

Andrew

