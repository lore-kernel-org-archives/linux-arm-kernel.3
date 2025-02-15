Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whfttpy3sYQ6iKxEh1K2lzapOgmvl8L18ErwsGHvbkM=; b=vKDZYvJ/TkbHwznurFbcN/6Isp
	fK5We6FyO9xzWp4slMDBfL8DX4siBATOM0JM7i+Pc9A3EylaiX3ezOwa4Lq+SfEDukA0LCI8LhXju
	/Fx2bhVtFLFobw7DCEE6ciuuH1xTwGGZ6yawb3iysb2Y6mjhtZ3FpzSJFkL48Q/HkdiZdKYsSysAT
	IwNHIkmCs8+QRqEg7xbVSZu49SvnQ/YQgbJUWPZ1TmXYSwCjl3TIbvU/JdZhaGHzAhgz6CCL7lz7h
	rJsWwd+hlwst4rp5ubnlsah1fOoJM9CqGAmqBTFoOV0RQoZnu9MVR+0JWIkw4FBRvIe4c5H3B16qx
	aePl6yYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJPO-00000000FcY-36Ie;
	Sat, 15 Feb 2025 14:44:42 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJNw-00000000FXe-2FFq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 14:43:14 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso5416104a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 06:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739630590; x=1740235390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Whfttpy3sYQ6iKxEh1K2lzapOgmvl8L18ErwsGHvbkM=;
        b=XtTrR7jaCQnrfcmVv0aXxNmZTADwlAW7rVUDBMdICy9VoOErNomGC8viSJ0Az7W/DF
         IQ1rQ9MMJed4DLXPIJeXaQCyurFEdDblfzzDDZNK6HlpIlQN4SPp/RUAM4GgN5PpFmrx
         cHObcPFMfDuyukAn+QShOb9t2vbYqVg1NjxiE/hMMqb+Dh2x15/uU3LW3kIKXfHzjCZi
         XzIAn+gCOCNX6BOrLeuQBZ3lARPdz2kN83XIz9aEB5uc/u7uuCxcB9269Vwz2t7JDgRS
         3TbWd7mOisdnoq9o4PlGpAJOulJemZUIiNEfyYA/mGBf3oGMYsE+3RWQkBUGXgp1AiYS
         thEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739630590; x=1740235390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whfttpy3sYQ6iKxEh1K2lzapOgmvl8L18ErwsGHvbkM=;
        b=HgETS9vxwp+HShVTq7vFhwXMkaUBRJoLSZdFjc7TpcPhM7oTTZAo4c6fwzuvsLo3yc
         nGF9M49kLbkwoX0m/HJ8PmwX2V/bqgX+bWHM3Q7rca28lBTUMLV4grGRnctfFOB66v1b
         DgknpyB/XTLNbgpXTy9BHXyj660qN9fzDXjpw5PgA9l8JuiO46nyFDfaJ0mlfiK+SYp1
         m66Ao3/yAsoYRrU4S0g3HpNYsGYqDHIrXFDMlA+iqpbqFA8B4LBc6UnGrSUZpKLjunAT
         dy4rRj6ZcKo15EpjiyJzmiwF1XmdpBh6CpUqiEKIsfoy0RGWhChkbjU115aWZp3N77cl
         9V0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPRxWe7LKt45uGPce3US93GGD3//pzm8yQhBq8MBD99C4ZaN5pJhkWXkysrqPsal7bsnEHjsEOpAzBVsGtz+sw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0RQyG/dgVx2biLqqq+wlZl9uD8Zu68mAzsa1KOez3SfYFMkru
	IKtrycbnWFmoEGuZVx34vIoEVfLyAhh9z3DGMkVbEWeVpZCi6cG+l4yBsWu65LI=
X-Gm-Gg: ASbGncvpKlFHGlr+mPPeNk/8oDutbqETme4/MA+78JlnJBhe9xoLs5LdSIwOPIEbMca
	gfFuJm9nLuy0VMLKO8KLAWyBQb4jyzmcRqMuqt5tJBq7J8/mT86ISDv9Ikp5tv5lYrXJWbiVYYE
	3clF/YEEJGp+QC7gtP8qIy8LNZKZPxsemWFlPJBebQiFhZ4T6fE0CmNT9w93fXxEEVt0QRiNl2Q
	uQW4uAFr6Kt7xSrrSjStlDVrNSBKqwRK6pYZIoT0pTdF5U4iLGDB4d4pStRAQEPMUHwuu755R7A
	khuYFMyhx7rn67PtO1wy
X-Google-Smtp-Source: AGHT+IF9V3ZdK3uwfUNuA7uzybMTFs3FPandYOZajnIJZut2oXQyf0jdir87Qtobw/I84l6+TOD4xQ==
X-Received: by 2002:a05:6402:4414:b0:5dc:91c6:8096 with SMTP id 4fb4d7f45d1cf-5e0361effd3mr3920532a12.30.1739630590587;
        Sat, 15 Feb 2025 06:43:10 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e03aa0b1f7sm1128324a12.2.2025.02.15.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 06:43:09 -0800 (PST)
Date: Sat, 15 Feb 2025 15:43:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: clps711x: Drop of_match_ptr() usage for
 .of_match_table
Message-ID: <v6zwgjpo5wrikbrmyxhuhsrux22sfblmog2x2pupy2shobf4s2@mrlc4d564d3n>
References: <20250214163442.192006-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7coxxkyjdk6z5vhk"
Content-Disposition: inline
In-Reply-To: <20250214163442.192006-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_064312_575415_ECC0C49D 
X-CRM114-Status: GOOD (  14.32  )
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


--7coxxkyjdk6z5vhk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: clps711x: Drop of_match_ptr() usage for
 .of_match_table
MIME-Version: 1.0

Hello,

On Fri, Feb 14, 2025 at 05:34:42PM +0100, Uwe Kleine-K=F6nig wrote:
> The pwm-clps711x driver depends on ARCH_CLPS711X || COMPILE_TEST. With
> the former being an ARCH_MULTI_V4T platform, there is always OF=3Dy when
> ARCH_CLPS711X=3Dy, so in practise clps711x_pwm_dt_ids[] is always used.
> (And in the case COMPILE_TEST=3Dy + OF=3Dn this only increases the driver
> size a bit but still compiles.)
>=20
> So drop the usage of of_match_ptr().
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---

Applied with Andy's Reviewed-by tag to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards
Uwe

--7coxxkyjdk6z5vhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmewp/gACgkQj4D7WH0S
/k7GAQf/WgwmIsu4X0Zr8vKY06z6s90Tzj9k6Rhn9CutP0YvJrWlW1XWN/wGGRzX
nqlKAOBI9J4yMAA87y8r7jRZzujvIIHjkve+ATIurEM0SXXhJYmpeABIfE+yXjub
QjLbQ/hhVrYvNmrlK9HM9YwAcXjq9vrB2d+ATNbTH1txT3o3b/cDrzFff0mwPdVx
2h9HEezHEMmZr7QltXiFt6Lec3qJkwO4KnKT/LTSCW/mAzPRkKza3FKi2moSgptu
C0YlUulOi+Nyb8lJS06spA+1MR+lwNIP0fQMF1mrWcxMXAp8lNCMnPivUC20Si/a
0l26OtJk5N50ODUFXXPU0lb7poPbSQ==
=EQ4N
-----END PGP SIGNATURE-----

--7coxxkyjdk6z5vhk--

