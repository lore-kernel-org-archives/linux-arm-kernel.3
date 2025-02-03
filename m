Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE4C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAvOtJHsIMS59RfRzFfMyl8id23TWAECc7EwAHrUKlY=; b=fJcTU6mJspNeSvlRLPofX05M+s
	rBHBIDDyXhZMebAUWeW0WUazmwKZaawcKN2xmXPeCvyTzBj54ARmrEMXmjLNSYBgjTxxqtjFdKLd+
	ZsVyD2U2wzjbY+fvgLxIzfK/IeQoGaJzNKEf3++sh9cpwSbgVjIkox9Aqf1UAYaqK87s0d1IlHlI9
	lGrMzLO7+HgAU2yDlFlaRJYz9VWHtiaGwcQ1CQRBJKTKiq9F9WX9qKCPNmUmVL6bOZuZMyiE0kema
	Rq3eCGQ9OntpjJpYJtmgPMYixl5I+Qo66ghtHRPxyjzPOCD47Wbk4q0vQ6Sv04fupfX0DnBp8IOdN
	dC5Ay24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teySs-0000000Ft2O-1CnO;
	Mon, 03 Feb 2025 15:34:22 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyQO-0000000FsWJ-0y03
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=PAvOtJHsIMS59RfRzFfMyl8id23TWAECc7EwAHrUKlY=;
	t=1738596707; x=1739806307; b=fIaz1gfHvcYHuO2i9in32PIUFvHhlraZrhUM8XCIsmIxw46
	76QsyeWXAZBDJ6QMabi73sU7qiR2xTULaEaumQyUvpRCtfkN/ABW05j37btIxdKBWDrDof8BXOYCr
	BVEVkBuhK0mM51NUG+Bg1GwhpgnR20KN5tyyPTU3cZReVzLAbrhgye6T5/Y5TuMiy7Jzcfz3Rx24k
	4UPoNu5c6JvkZY8LeGJ+QowP90XB6cd9+1HkPJsD4FEFM3uMZZRdqC1jGVhfkR6r20SevPqJEKFBR
	h6Lw/TVDIhEgo/chvWHNTB+GGREYbbs8u6MVL1pCEma8YUOHCjB/eIzYzPERp7Rg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1teyQE-00000001gus-0LFB;
	Mon, 03 Feb 2025 16:31:38 +0100
Message-ID: <2904baea9188a4707d4b5a9a6bfa517a54323f8a.camel@sipsolutions.net>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Yury Norov
	 <yury.norov@gmail.com>
Date: Mon, 03 Feb 2025 16:31:36 +0100
In-Reply-To: <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
References: <cover.1738329458.git.geert+renesas@glider.be>
	 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
	 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
	 <Z5-xMUqrDuaE8Eo_@thinkpad>
	 <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
	 <45920591-e1d6-4337-a906-35bb5319836c@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073148_266337_3B81A07E 
X-CRM114-Status: GOOD (  22.74  )
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shan-Chun Hung <schung@nuvoton.com>, linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>, qat-linux@intel.com, Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Jacky Huang <ychuang3@nuvoton.com>, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Alex Elder <elder@ieee.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>, Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 2025-02-03 at 22:36 +0900, Vincent Mailhol wrote:
> > On the flip side, there have been discussions in the past (though I
> > think not all, if any, on the list(s)) about the argument order. Since
> > the value is typically not a constant, requiring the mask to be a
> > constant has ensured that the argument order isn't as easily mixed up a=
s
> > otherwise.
>=20
> If this is a concern, then it can be checked with:
>=20
>   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask) &&
>                    __builtin_constant_p(_val),
>                    _pfx "mask is not constant");
>=20
> It means that we forbid FIELD_PREP(non_const_mask, const_val) but allow
> any other combination.

There almost certainly will be users who want both to be non-constant
though, and anyway I don't understand how that helps - if you want to
write the value 0x7 to the (variable) mask 0xF then this won't catch
anything?

> > However, the suggested change to BUILD_BUG_ON_NOT_POWER_OF_2 almost
> > certainly shouldn't be done for the same reason - not compiling for non=
-
> > constant values is [IMHO] part of the API contract for that macro. This
> > can be important for the same reasons.
>=20
> Your point is fair enough. But I do not see this as a killer argument.
> We can instead just add below helper:
>=20
>   BUILD_BUG_ON_STATICALLY_NOT_POWER_OF_2()
>=20
> But, for the same reason why I would rather not have both the
> FIELD_{PREP,GET}() and the field_{prep,get}(), I would also rather not
> have a BUILD_BUG_ON_NOT_POWER_OF_2() and a
> BUILD_BUG_ON_STATICALLY_NOT_POWER_OF_2().
>=20
> If your concern is the wording of the contract, the description can just
> be updated.

No, I just think in both cases it's really bad form to silently update
the contract removing negative assertions that other people may have
been relying on. Not because these trigger today, of course, but because
they may not have added additional checks, or similar.

So arguably then you should have BUILD_BUG_ON_CONST_NOT_POWER_OF_2() or
so instead, so that all existing users are unaffected by the updates,
and similarly that's an argument for leaving FIELD_* versions intact. Or
I guess one could change all existing users to new ones accordingly, say
FIELD_*_CONST_MASK(), but that's pretty annoying too.

johannes

