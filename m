Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F9CCC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wdgF2BDQf2rF/BhRn+nlQhMcqxcBjtWlSkaY+Ug2V4=; b=leYk1GHLPgRgeK2klofQ1FvcsZ
	r4+R97HGF2FAjz4DEes/ngou6m3H3DwxaGv0gqqYiimsY6/orc92ecwSG9nL2Mj86/07HK8ywmaWN
	h7nvb0Ut092ghxI17GZzd7JCmQyFzpgrrFu0+K7GzarEDah0CfexC6MCTBUZUX2G8GJzjmDPbU7hi
	RDhXOIbvf70RD2PQpK+I/xe1G/VKkDl1l4Q3nNE9LuYn62GsRAMwbFtdIpQCGigRFweIOGsM2nHSB
	0MxX3VbnH2S6o5WS8r8rVyvJGLMOZb/InXBRGJKGa+ZzcnNCeVEzQFii460vyuLXJaIanoXhTbtct
	w5gaW4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6GL-0000000GJmc-0fD1;
	Wed, 14 Oct 2026 21:11:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6GI-0000000GJm9-3FQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:11:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a16c399641so44672665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012305; x=1792617105; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wdgF2BDQf2rF/BhRn+nlQhMcqxcBjtWlSkaY+Ug2V4=;
        b=b23UxDFyqdL5pcccZ/AHef/mxgKL/Flu9F7qZlr+S2aLu7sEldN+vnEy8EzLDuLoDU
         MrBemoFkGCSx2uu00gek5DGqkKDPdJWGnCLdhZmC0POlAuSUZ2kyrP89MrDfMLlgwQtI
         xlmOcbpzDNVsslFzI5QsGx7e33OtNC/t2mXwRQ53faC8AL+LA45ObGT0R3LNCzPpMhVV
         C6bbb5qwEQ6pOqAaNCe0baFj4gLFWOzC1QyvEG3ivkhn6dYrVZFNrbKXt+1E7WLmhOlY
         ZCmNVTcEfKP6wdcn1X4ZkiX4t227wOWs+7bm79eg6wJLg5G6YHf2Oci6r5aOgbeDRDW/
         XF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012305; x=1792617105;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8wdgF2BDQf2rF/BhRn+nlQhMcqxcBjtWlSkaY+Ug2V4=;
        b=RkgIruYTauq6Yy7MiDVRPdU3GPE9bIlXK1Hw0TDBHH8yivrAjiQ5wRfFzVbsncCIIr
         oT9cgj87ACr8k7MLLnhLKnbXDvh4S47xYimFpZ6h9AX8Xfs81akaAi38oz9CJ4MnUH3t
         jWtyAOIZ3m8df4zD0R+N/f9BSyVFGzb9jnanfAnf2w4uCaRkwTvxQhuqDjsG7UbA5pVN
         TD04QKMflKyRyJqA58ScS7BNxFynfC4vT6/1thQgEVmFbum9RPFbEiPSBB0p/kobvCR3
         SUi1ZWyKbsDGd18VqtDVLsAMHSf4nD+TFrqwha7CyprS0jQFxcLkHavT497hKTt/604/
         rvQw==
X-Gm-Message-State: AFq9FYJ9bkIRj7TfxCBwDRxLIRUjXeOdzCb8ETswgqqsLN4XyFr2OVEP
	CGHIvnMOVxTg2Uix8SOTRuhe1UEjrExdGtX0AKDudY4z9Ok5l+XhVbCKLjRxZp5s
X-Gm-Gg: AYBFou1WrOX/8UmrcW98Bf5GOAL9sra7jUYzyo6Ls+GX5VFevHFN/tFGEDkjxTsBqPD
	8vOYMfOI5yxDs6sD0eYtQMSuvAlNzEtEhxwWj+By1H2oJU9oQ+uSNNRkR59vHjFE5TEXnpvbctw
	v649K9UVJZLzZmJ7+fRQx8bFQpLHw54x0rpEvGsBCppfJuWS9lJz2SYLCgeAX1qPhuC5ZCOKj6c
	WpuTtc6fsUD5BXHp7yCMnbjIVbzHIneFDqwYGzDLgwEWX6W0CbmUC3arKxiXVlMU/sVGwA3EmCS
	BfKqQIfmmiuJEuZxj8vefjDdfJrQQdAEOM3UXaIfaQKnShLd1oP62RM/tCUdiSyU3yVhpGI+FKo
	a5+JxlxL9PFrKWy2BzOIwfFGusC6L75yxQI1QH/AakK2GNnuL0RVvr/fUlBx2K8c3j9uvzsVXLc
	vw1JzoNRGCvq2F/zaT+ySHEoANOj9ieg2Tkli+I8bMTTWpzIu1irRRC0mxgl7uKOuoLQq1brQUG
	hHfiz/m3x7+Myu+UsRe3FLTHrBNyc2X2iY7SGkcaDUnn1E9itG6WQf7Z0lLXw==
X-Received: by 2002:a05:600c:8105:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a18e483818mr364919115e9.12.1792012304648;
        Wed, 14 Oct 2026 14:11:44 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm15124324f8f.26.2026.10.14.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:11:43 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 23:11:40 +0200
Message-ID: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-9-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParttNiNcatGTRe0X_MNundQow";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_141146_832243_CC7A505B 
X-CRM114-Status: GOOD (  11.57  )
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

--nextParttNiNcatGTRe0X_MNundQow
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 23:11:40 +0200
Message-ID: <PSg3JObRTl2eiB9vIwNJDQ@gmail.com>
In-Reply-To: <20261014072109.1759502-9-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> supported + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */

=46yi, there is also Documentation/devicetree/bindings/gpio/gpio-mmio.yaml,=
=20
which allows you to put this directly into the DTS without a driver shim.

--nextParttNiNcatGTRe0X_MNundQow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP8AwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi6lsP/0RJ+uVDbDDI0O0CKlkY
BUNsbFtSFFTvMf6KMJlT8cFc3twEamjPapWShtEPN8tAIcT2Ckzdn3nETcIhVpMk
f5vVb/X1Iljo9FFz6dUyXW9Lkc9DalGhVptpyXH/9vHKBq1HRhCU8VWa0DvHblKg
8lEVD4Cz0BOS+aEtcvn0vVxKAGw9X49ieKEvAkQtkXpd4Udfdm4gDcrAmlFvMPEF
zwRPzytJWCBFawDhllbT7fsUoHYnOl1E1BqQ/tBld2IA1YaahqbEQh6BqjjTvZLv
3Hg2qKO64Ln6ojB5MMi2rXlEXh+pgpqilL7OdPjZCfNCi3jFl3a+G4rXoJu8R/jU
9b6mezwNP5JMI59U+jK8yPTNJP1/mNZUocju7IfytjfSIzS0KB9AD0WypDB28O38
MVM75siRiT8cNStVwZbx+Cbe/emKQmE86yVAB93JwUPN3Kp4GcFIxjTnaDqV8mr1
Y7/axwKCTTcY3U5GfqQ11ZOMTN64b80Ku6rWpiiVzBMx0JcgADPZGReeJ32CirAm
Mj6Ll9G64U+MDEuWnjRhJ8O9foB6tw3ATsC+I+cDk+lfVLwf5i6UXoX5RQmnP7MT
3MCd9yLyyUWKgwDldBW5DIxkmEl9dfB7MbzEA9vplbDQ8rCj3y/0uvadxWZLPAs/
zjQYkcM9a0llpm/KSAf5MlsK
=mcKA
-----END PGP SIGNATURE-----

--nextParttNiNcatGTRe0X_MNundQow--




