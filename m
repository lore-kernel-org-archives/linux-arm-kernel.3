Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B382CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qP87JigH9w3cESkF8N5cnJLXmDva7bVQRI9ZccgkIPo=; b=qR/JQAefRpqmY9JkmK6Gi92GZe
	iSYhoIYD9nbpbi1vasshdn5BIiFLgRQSesuLocTTyyNohdWmD1qP1/WGbbz3LBHsekHQjQ37kbVU1
	4CvIA8oqN2NJtqdjgUAKJMT7WjVGfQD6Xc03sNd1ZMistydlEhYyGL5Hs5sD+icWW7KEi+/GJHDLN
	4NbdC1k5L7PRmjIQiwE3QPIyfPmz/f/GbboAOXYuO4Whk5tNe1xTyZrKnly/ZVA6KzSq7CvmhvMW6
	arXhxke7AS7gxvu43Mw2dbvlmPDaMG7M35/59+2PyKzRyYKYv4rHMgYXad8uOb5zLx2OXaPaGYX4z
	x2+bHCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0h3T-0000000Aaif-3rjd;
	Mon, 22 Sep 2025 13:58:11 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0h3R-0000000Aai3-04mB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:58:10 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-887745ee814so136710339f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1758549488; x=1759154288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qP87JigH9w3cESkF8N5cnJLXmDva7bVQRI9ZccgkIPo=;
        b=J9yZ87lzkS234fRiZLbsw/4YN1sX3UXhf2WHGyo73k2U+/P/qyCrmArUDTnjwn/yMt
         3bfSEgar7Y7BEqwCYc+lay7AiwPqQ/m6uJBLcjX66ksts8W8hDdTkUDkEMBZ1Fu7ZIoN
         lbdhlWWLEd+zJqgjcGg6cvhZkcDm5XNWvLPfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549488; x=1759154288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP87JigH9w3cESkF8N5cnJLXmDva7bVQRI9ZccgkIPo=;
        b=msTB1GEzqOT2SEV6cb7nT1fkZ6wld0mxPFGNplnG/2+SNMGU1UvTrtfXV7lJqIID3n
         XyNY8K5zVshs/XXoBBh5qqY9XYEbZ0yE1naBQ3E5+6Bh2UrOHyVcQlzO5FZGD4o9SmaI
         DvlS1T/ydt/9Vo3FoEvfYbf02MQ+E+kDOyMy7aM2xhvV10okifibu/YPKouYy14vnKLJ
         aT9GvL+4xC8kF433pxGBNS0oLOJSMSinspj8LoNVsy+7FeEnYHnNC/AAYMwSZEmt0sHe
         OXznvOUe5nF7pUCsYdx8BGYi8zWmePuB74K+TBz1aJvurETw9SsI9Vcaa2op689y5pRh
         QRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfNtgusZzj6YSaiR9hJi++TIRThkTbYoijmhpX/vyNYZl7DRwHeL2zdVBjB+IL7KWnYi3VboVaiz02xKs2C+0P@lists.infradead.org
X-Gm-Message-State: AOJu0YyW57whtv5vNplmUR76KOygxVBh5uA+57ORoJ6ziFc6J+chu4H5
	aDcdgWhL9liuey+LK4dozEG4pQED5V/ZLPOTej7Yoz8meo8gaMKgzX+PyEaRhLXy9bU=
X-Gm-Gg: ASbGncsVnTv6Ho6nletygIowBDXb5odyHOgdS+lzw5QOgb8W4eSz1Iipda9InLJpear
	4UjDhnFOAD/k3e8b/BxEb2j8Z/ZhbjyS1DoQutP+X4N1+yoZwD6vF1k+PeDrbFtcS37wWDwV/YH
	OpZN37SUmXGehei7trz2q4ZQhZ2DEkNIRpcT1bUM9UN0Q4IRHwfZgzqKG32NIGfwbQnKtoST6h+
	RS4n2z6i0mNGGgtKMV/OaS+rfUL8khruMqboVIPNhqQ752G30JMEq4IFW+illVlaQjv6z3h/eEx
	3pBuIE/beBWpjkfDC1mFtkayla/fMeBZrFQ27wjnVoQ23rWFZjAQiibOXsG1bDmaKvM7nNYlWdT
	ru28uAlRE59OP+UGXaBkUb32I+TA6V/1Nar+SmLR+nBt99kH0imbMLVXp
X-Google-Smtp-Source: AGHT+IH8EMB15PYxcBuPL2NYgVxhRe138NFMfR7r961S2ZQFsxef2uERidjsotlvIOx9aFYgUCCKjQ==
X-Received: by 2002:a05:6602:154a:b0:8de:1f2a:8367 with SMTP id ca18e2360f4ac-8de1f490876mr14201839f.19.1758549487477;
        Mon, 22 Sep 2025 06:58:07 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8d7f8f481bfsm31892439f.24.2025.09.22.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:58:06 -0700 (PDT)
Date: Mon, 22 Sep 2025 07:58:04 -0600
From: Tom Rini <trini@konsulko.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] scripts/make_fit: Support an initial ramdisk
Message-ID: <20250922135804.GA124814@bill-the-cat>
References: <20250919211000.1045267-1-sjg@chromium.org>
 <9cafbc70-7235-4e49-928c-4d68a57b7d46@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E7czkW5eDIll3KJ9"
Content-Disposition: inline
In-Reply-To: <9cafbc70-7235-4e49-928c-4d68a57b7d46@pengutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_065809_074106_432D1ADB 
X-CRM114-Status: GOOD (  26.41  )
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


--E7czkW5eDIll3KJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 09:14:55AM +0200, Ahmad Fatoum wrote:
> Hello Simon,
>=20
> On 19.09.25 23:09, Simon Glass wrote:
> > FIT (Flat Image Tree) allows an ramdisk to be included in each
> > configuration. Add support for this to the script.
> >=20
> > This feature is not available via 'make image.fit' since the ramdisk
> > likely needs to be built separately anyway, e.g. using modules from
> > the kernel build.
>=20
> AFAIK the kernel supports multiple concatenated separately compressed
> initramfs just fine, so it may still be useful to add a target which
> builds a cpio with all modules inside and the rest can be then
> concatenated.
>=20
> What do you think?
>=20
> > +        fsw.property_string('compression', args.compress)
>=20
> compression should be none as the kernel would take of decompression.
>=20
> Both U-Boot and barebox should warn about ramdisk compression property
> that is !=3D "none".

Agreed. In U-Boot we've been handling this correctly since:

commit bddd985734653c366c8da073650930fb2e9b5003
Author: Julius Werner <jwerner@chromium.org>
Date:   Fri Aug 2 15:52:28 2019 -0700

    fit: Do not automatically decompress ramdisk images
   =20
    The Linux ramdisk should always be decompressed by the kernel itself,
    not by U-Boot. Therefore, the 'compression' node in the FIT image should
    always be set to "none" for ramdisk images, since the only point of
    using that node is if you want U-Boot to do the decompression itself.
   =20
    Yet some systems populate the node to the compression algorithm used by
    the kernel instead. This used to be ignored, but now that we support
    decompression of all image types it becomes a problem. Since ramdisks
    should never be decompressed by U-Boot anyway, this patch adds a special
    exception for them to avoid these issues. Still, setting the
    'compression' node like that is wrong in the first place, so we still
    want to print out a warning so that third-party distributions doing this
    can notice and fix it.
   =20
    Signed-off-by: Julius Werner <jwerner@chromium.org>
    Reviewed-by: Heiko Schocher <hs@denx.de>
    Tested-by: Heiko Schocher <hs@denx.de>
    Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

--=20
Tom

--E7czkW5eDIll3KJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaNFV6AAKCRAr4qD1Cr/k
CnGjAQD/vmuAq3ofEv1kMg56vhno1TytM3a+z+O5XKpKGYMIWQD/QQs0y0YpQT9i
kJycivHT7DiRwR+v9g47p3ibeMyePQo=
=Fyyb
-----END PGP SIGNATURE-----

--E7czkW5eDIll3KJ9--

