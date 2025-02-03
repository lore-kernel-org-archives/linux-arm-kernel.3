Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027FEC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1beuisn9wdEKP1QdS1UhUe3+GT+LqGgI15rKS+Adds=; b=06lK1DuCncZxBoWI10f2glMuYV
	FGEMutAujob3pjVBd9hBhSoVzPVZ2449fu53dZVk59fXSxltUpjj1xKlTkdv8/+TkJnbTAo7iXKjw
	kDH170+n2DGVLmyvZ1A+PnzYbQAsKq2wyBZFX9SxgFq/tlHUSGIAf+a4mal4Cnf+VWbQG09ew6mP6
	0VjJb4EiPtJtwNc8HslsYw5M8QDmvgRYBfIb/RXF7/viPuxAHtgvvek7iywpiYCL82HP8VJ/CN508
	zGuY2cYUF74OWQnxlss3Gj6pb7nvuSlAnyT8q+9ZpKwcj5Xv8eEjWtt8s/6aoFVWY1qIcTZb2O9Gv
	I3sEPfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ter9Y-0000000Ejh3-2RWl;
	Mon, 03 Feb 2025 07:45:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ter8E-0000000Ejbc-2c7H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 07:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=x1beuisn9wdEKP1QdS1UhUe3+GT+LqGgI15rKS+Adds=;
	t=1738568672; x=1739778272; b=ASbHZaUnJeCN6ppG1th13fhj3E8qWUqb03N6JBelg5gXCJW
	1tgum4LWKY2m12WU/KLYsv2qBvqyAWw7sTtwe9lrNAiAuEP0o1wK6gAeI8UzqeMfr1eC8eWzVeacU
	BBeP+jGa2gqfT/g6rInvGIMtJJfvmXEssC8w9ky02pCLLp6ehTryXCk+CkzMbHz1QkLwSzW7qUK38
	DTRgwDDNH3q6tIcqKFeX9gR7emeM9gINSeH5oIMv0NJfaJFs/NEQdY1OEN3xC3FF5WkEjxbR/ADnC
	KjqwtAu8HlLnXYeCT2D86lmT04j6ayoCfMhITcLmPOh6Bqjn275AmMmNuR9ZX6fw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ter7q-00000001RTp-38Nc;
	Mon, 03 Feb 2025 08:44:11 +0100
Message-ID: <74cab7d1ec31e7531cdda0f1eb47acdebd5c8d3f.camel@sipsolutions.net>
Subject: Re: [PATCH treewide v2 1/3] bitfield: Add non-constant
 field_{prep,get}() helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Yury Norov <yury.norov@gmail.com>, Vincent Mailhol
	 <mailhol.vincent@wanadoo.fr>
Date: Mon, 03 Feb 2025 08:44:06 +0100
In-Reply-To: <Z5-xMUqrDuaE8Eo_@thinkpad>
References: <cover.1738329458.git.geert+renesas@glider.be>
	 <1824412519cb8791ab428065116927ee7b77cf35.1738329459.git.geert+renesas@glider.be>
	 <e20a177a-30cd-4088-89e1-b479aba1356c@wanadoo.fr>
	 <Z5-xMUqrDuaE8Eo_@thinkpad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_234434_944089_389C9659 
X-CRM114-Status: GOOD (  14.23  )
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

On Sun, 2025-02-02 at 12:53 -0500, Yury Norov wrote:
>=20
> > Instead of creating another variant for
> > non-constant bitfields, wouldn't it be better to make the existing macr=
o
> > accept both?
>=20
> Yes, it would definitely be better IMO.

On the flip side, there have been discussions in the past (though I
think not all, if any, on the list(s)) about the argument order. Since
the value is typically not a constant, requiring the mask to be a
constant has ensured that the argument order isn't as easily mixed up as
otherwise.

With a non-constant mask there can also be no validation that the mask
is contiguous etc.

Now that doesn't imply a strong objection - personally I've come to
prefer the lower-case typed versions anyway - but something to keep in
mind when doing this.

However, the suggested change to BUILD_BUG_ON_NOT_POWER_OF_2 almost
certainly shouldn't be done for the same reason - not compiling for non-
constant values is [IMHO] part of the API contract for that macro. This
can be important for the same reasons.

(Obviously, doing that change now doesn't invalidate existing code, but
it does remove checks that may have been intended to be present in the
code.)

johannes

