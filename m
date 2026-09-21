Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC5C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BgkS0X3pfARD7xlPenzZAzHbcH+oYWC73YWsvir9Bw=; b=YPiAY0ezNlNQowAq//lAjAx/7k
	yG6r7tqh7VsjlUB6T8rXQOmy5TzErRQC0PhyHmV0XXTLwckkDEq5/ymAjPssjtNUZNaA5JPGARaoR
	HlHxWCwRSGdeCWhabqFQdy15fyXxWqcU0ZI2A6uMr/ncrLTP9RZOGcxaEqfFWLgv6T0IJ+usA/XYC
	AdAUWY+0v7uqR/No/YH0g5WTyOCXO0tGK6Cr4QW55+4r41hZxFSzQzMwBHtzmXrDISVtQJCMt6GWa
	x4rstNYJKNyN+rLJ3Dvi1WqfHadc/OTTgtPpJpPEk9qpFkD7XjIToCjhOaWqb6abaHPNDxDoc9y5a
	LszG+00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dQa-000000028Nf-244I;
	Mon, 21 Sep 2026 12:47:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dQZ-000000028Mr-1rl8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0BgkS0X3pfARD7xlPenzZAzHbcH+oYWC73YWsvir9Bw=; b=ekgK6w4QPot0sb/7XH4x/H6NFV
	PcjGh32oluwksl89m6GDF65e9NEk7oUGUPGs5etWpPuHDtUWS2maUlcQkL9E2cOU7OqeyaqTM7qYB
	6+yo6vqUHgoDhP9KMxtBFQVo1le1Zag1rpmD+aZFXFWAH+AUQIJk8/guBDpQuQPHpsIZiaasEz/Ii
	VAf67HSGV1k3I9fMiVagrePs1nSik1W8O2Q6JbbWkbJ5Vq4tRPwHFhMzV3Pzt9tJqZBx7p+0fHCkT
	Z/xRJ++U3KNgJ4RGwYDFWBECV8Muzjy1hcb5QhToDIV3eW4veupcrfW8V9WLMeJtKy5Hu8f++/Omr
	O7Qr7Z5g==;
Received: from 0001.3ffe.de ([159.69.201.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dQK-0000000CIOY-1Dux
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:47:21 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 81CD85C;
	Mon, 21 Sep 2026 14:46:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1789994816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0BgkS0X3pfARD7xlPenzZAzHbcH+oYWC73YWsvir9Bw=;
	b=16B29EEiIN7cXTXUo7NzjnOQlc9Z/B6M+jzDkuHerC8x+2EwsiJsS5d5nS1yHEmfeEbpvX
	wMpidef3+45QsFe7iH9uztbUcXIYPB94b/lY6MKMn5dpk03jqcjmesWzIFi1x7iph9u5pK
	IVnASkXaOeu2pO6eM65U7QDhMRaquaPrnYEYX/krt+VF6Xdeu6ADFuyplkIy4lhO/FXL/c
	37yCEwV5A0agJWfclqLKBw4gQn9mbDNF6B1EARHjhVIr5VgRRC24V0oybA/z5PBzltYDpe
	riZh4xwzOn+IC7NyduPSQ29HGPTbD/o8oTtD+/O9Sjx1O6MvmZ3e6IJrBkPjyQ==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b0aecd10d4970feaedd7d33bf060515ea13a2a83f941c6cf988065fda9d0;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 14:46:54 +0200
Message-Id: <DLL07DMYQ9EN.3I5OQJ93M8J1O@walle.cc>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Long Zhao"
 <zl020895@163.com>, "Lee Jones" <lee@kernel.org>, <mfd@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
From: "Michael Walle" <michael@walle.cc>
To: <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, <soc@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_134719_910674_B1015BE8 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
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

--b0aecd10d4970feaedd7d33bf060515ea13a2a83f941c6cf988065fda9d0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 1:15 PM CEST, Long Zhao via B4 Relay wrote:
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.

Well, not really. I wasn't CC'ed on any of the gpio-regmap patches.

-michael

--b0aecd10d4970feaedd7d33bf060515ea13a2a83f941c6cf988065fda9d0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarEnPhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+JbDAYD5NzUis6sH68krurEUmfZHPET63flmrmwz
18rKy6cs6l45m6clXLvKPPfU15T+MEIBfR76IBYbqIHCrqRx0hg58wcEk/4iVesC
afNRcTi5Hg1HbPYc3TajUdBjsycsnRCLeQ==
=D+KD
-----END PGP SIGNATURE-----

--b0aecd10d4970feaedd7d33bf060515ea13a2a83f941c6cf988065fda9d0--

