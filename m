Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18164C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXCsVLwTtddatg+nn+pcyJHYSBYGcU3WP44kyBfV/K8=; b=Hm2IHRtSK+WUB22iyDZjigSXqG
	HRJIPfPRi1Yh/CXoU2rFbUzG6SCn5LR3r6DuOCSXMdC/KQgoEu3k/6da3gJD37UB9cTZQGqYX1btD
	0vv5VDSdWZlqNIjOj0TEICUn0DEVU3VjnXnWO0dXLSxCLm0cEx27182XXJn6bNpjClyabRzclaXF4
	w4AWgoHTrGHN0156YT9tX5DHlZvuD4eGBjwj2byylqFIvlsrn0lndjo6RnMHYPmrJsmpXakMsPoxl
	uokIqJ6X9F52NkTxDQvZ8bi6scYkm3Mf37OWam8n7+wpFy8s4UzsTU5yZZGsPzbrTtOMtOAkBJcVK
	/4o+MgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUg4-00000004J7L-258n;
	Fri, 23 May 2025 15:51:20 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUO0-00000004GDI-2ERp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 15:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lXCs
	VLwTtddatg+nn+pcyJHYSBYGcU3WP44kyBfV/K8=; b=ccPDq27SAn7ldyn9CPTD
	E3xioQFuovavzDi0UY5Ia9ggxOfslp/pmVhJZ0+L2v+JCpNHMr3D89Fy9YXbPjn7
	stUwmqTm7hFdG3WaR3GNYlHA1wICBqOcj5RjkZvlk71ZOmnfswjPxmWnZEVnocZH
	9SW21fMfycnvTkIN+T+xj5sqW/Nkb0vJ/VSotxVCRaDOg+IBVkCf3yO48GmjKMyU
	7lbbqSke8owu560YFEAA89yiIg+0T8j0QfVnSQpFHdYBd1QkPIt51Ndam79Ta54l
	A04eF+zRHnKYm+3UxHoBqLzRGSpNMkdYrz8AYh1KD/1B1Ri27VQIgauwbFqkgkJd
	8A==
Received: (qmail 4090207 invoked from network); 23 May 2025 17:32:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:32:33 +0200
X-UD-Smtp-Session: l3s3148p1@EwSaTs81rlJtKPAL
Date: Fri, 23 May 2025 17:32:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: long.yunjian@zte.com.cn
Cc: andi.shyti@kernel.org, codrin.ciubotariu@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, till@harbaum.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
Subject: Re: [PATCH v2] i2c: Use str_read_write() helper
Message-ID: <aDCVEYGdRnl9YfoY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	long.yunjian@zte.com.cn, andi.shyti@kernel.org,
	codrin.ciubotariu@microchip.com, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	till@harbaum.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, mou.yi@zte.com.cn,
	xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
	ouyang.maochun@zte.com.cn
References: <20250523165445002hUV3RCqhv6Xng7_bbUxlJ@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mg4ZxSxuCsqHtK15"
Content-Disposition: inline
In-Reply-To: <20250523165445002hUV3RCqhv6Xng7_bbUxlJ@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_083240_844641_7EDAFCE3 
X-CRM114-Status: UNSURE (   8.59  )
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


--mg4ZxSxuCsqHtK15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 04:54:45PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>=20
> Remove hard-coded strings by using the str_read_write() helper.
>=20
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
> ---
> v1 -> v2
> Fix this in the whole i2c subsystem.

Cool, I like it this way. Andi, I hope you are okay with me taking it.

Applied to for-next, thanks!


--mg4ZxSxuCsqHtK15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgwlREACgkQFA3kzBSg
KbZJxA/+NYenoREEfGYRWIuwdVOcGcf+fweviT9dtESxyjspH4kZB/81bh7uczZl
mJ/xnxXFrBjuMrMMhtMt+NcTT1VF/3XhoWogXE4GQJ+X50rsxhjsDZdtWIZIQhVc
TVZlRUrXPkTj5kke9sy+8qocdeyrP4hDdDKEZp4R8G2YC0B83v9Cadhwl4ClxIoL
hne7FAoazJ1LEpHCmeUQxrJD9A7sjUr4fiZp0aFmgeSzViUAEJ5oO5Wtlq6T4yBB
F9izay1neHNuQsjgRGpe8nx/Zkta1EtfRKM/TTgJxC0+M33h2QTvbG5O5jIFYhHH
USsQTxajeJY532ZgAII1CSdGHC7FLFwwn+RsCFJtUF5helhqzdbxNtPnzwOPRoji
UeTnMwGGza2PN0USrtgy/5kxco7JxYuSMJxIj0g7J0IV4M+3fB1p9qU3iRnfGxrY
HtgTvmfnP+ONkPhzDq5sN3Ne8Q7CCsAdfk09UX4yDR13g6YFnpenVhHvDdT1wQ6H
C2X2OpYyzuj+tpozPiqfADjMXom7ekc3QT4JaNLA4EcQgPZP1jOslcoRrfwdzf/W
ErbVzYC1BddlmHwUDUNg3Erq/LjLOJFFg1ZkTlt4VMDLPHK5sZlH0aTVprMOmLL/
jmyg/5VA8XI+jseDwWI3+TP1GKIz/nkxaDl+WVw/t4lLxtHYWVc=
=8apr
-----END PGP SIGNATURE-----

--mg4ZxSxuCsqHtK15--

