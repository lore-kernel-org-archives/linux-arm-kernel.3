Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1488C61DDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=; b=tnZrWD1SPiP5KnsXMFcbdSp+5h
	Yv19GGvM1EjJNRldGznLRLlzagGWcEqFFcK+kXjkK0fqaZsUnC5q9z8rl7RypOBzdMbFH/OpBNSjy
	Zzuk2VeBXS8EgghVKfQkiwY+gXJHTJFhc0tMyb/5gb7hrGuH6r6rmjJh3d1g9ZSGsFgTcgKDMXl4R
	z2j7YJ9B+7regSeFl9ak6j5oQNB4HI9EPBMbZgPoVMZAALFtHQibQ0xOo4ZpkOoXvDU6YoWFImLIJ
	T/t0tt1dTh2uP6POMIKMUtnhU+TluOP1LYSgwgvjzSCF5pDJtXXVK4ukTz/WIA1knrkJ44AL92tiW
	0/fS8GgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTI-0000000Fwmz-1o26;
	Sat, 21 Feb 2026 09:40:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTA-0000000FwgW-3rLI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806bf39419so28145665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666811; x=1772271611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=XJyJaWpJa77N3Zv9NxqRIGseL1KSsI5+bf6393CEUhwbL0m4ROFpz6utxtVj46dsby
         SDyepPvFuQ/EqGRTRRKbOYCkbCI3G/MYAdxZ+HfBrFF8rrDyB4d7w9CSU13qU5G2K2XS
         zbr9bsf6VLzGuhVai01zm/FDqSbZv1cKiCc3KySobevz5ZBmhTKiauyo4frUcikFQbLd
         K/LDK6Kt3ibyjrjFg/CSjGl3u+01rwwFUJHptghlFTiyCB8Wvm4ET3+Mr1Y4CYXXRSFp
         qPeGE9Y9ZXJsQUmHS5eWa2eCyIOJAlLHFeFKiI4kNrvor38r6VtPYtBc3M+AN0Qnfk/y
         c1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666811; x=1772271611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuF5x3a6e11GI4kifXt3xbSibryG5QrOhbEp/FvY8E0=;
        b=EUYIUSto2DzShzMFkrlMjXjJiNxky6QNRQS2LSh0o3aQyZZ6FbzJTiY6qegBBjKRBZ
         fX26lIvnBkMfhj1E1C8NpY2Xg32dRGGW4eueVLrV3lKdCid1FfeYacdx6ksNwf94JGho
         WBZNLTQ6JCxRKiBp0FIQRMaZN9cHlKFnjjutOkpyZyMZmMBZt4RoVTP/gHTsu1m6E88j
         UyXjxBaPt1wBoiezPuvD6FDTLN2JM2k4PVB/GnHcygV8ru6JaNLqYMIYtwRPJkX7lRAd
         ohKyBJGJWzOkGJp/XX+ZXbF2jwtfqF/KkhCCsPQImNvcW9ZJ4nXqe5JGgSGXUT16clho
         z3ow==
X-Forwarded-Encrypted: i=1; AJvYcCXuyNrJWDyg+GWvxezH9DYHIWfT1bPZD89x5SQVmcbDSsutI4SdO9CnLvkOgMpSpbCUSyqDG9dcO/r084SApEA0@lists.infradead.org
X-Gm-Message-State: AOJu0YzrmeuTMi+TOMibXZb3Z9D7UhbKIwFqDi22KcpN6Rrtl+AUga4R
	NRKwNOL27sr6ssYa+EEEVyySmpQVX+qhOo+wzxARlX+oW+K1/QI4eqRz
X-Gm-Gg: AZuq6aItv5hwGUmGtJobSMv6ERo70c22G/m4436v9tuC3kiGldzpxaoRvhhrtsnB0EP
	ux0BERkHv30at6DP9nRRYoVwmZvY6hFXMrv1PVcTfy1CI/u0lSZqQBCg6fOWH5MsgRMuH/ydtro
	M1IpgX8Mks9cvzxMjYsKpeKmnCCtlZvLaM0r/AF612HBDpyfhgjESTFD+Lkj37iFQeAnrIluozo
	TiS4pIHFWorvPyImsUoLQO/bt9dicXr4N/mTKMCBOzzJSDRIBCAVqCequ0ZBdVXPICo+sRASqU3
	EO3W34OUZ/t41CAztD8ln8zVGisMgfLF2Pwe2hLrXFtw7uHeWFyXSbVdvO/JWViTjWMtF1vOMFR
	M85mBdOkxKVUmEXQV78sNj+1sQpEVCueOTBAt+G4gaBb6VEEt4RGKcBuIgBOvbqecdSw7R781oy
	tlzuZw41/DJrEkPJqsB5F/LKDfrGBQ4NdFpHyUgoxw0CyU9nif+G8t0fqhvj6F9lhBx5Rva04Oc
	/1vjOGnwYd+BV3/5g==
X-Received: by 2002:a05:600c:1c29:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-483a949e5edmr41113355e9.5.1771666810853;
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm133439895e9.3.2026.02.21.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 1/6] mtd: rawnand: sunxi: fix sunxi_nand_ooblayout_free
Date: Sat, 21 Feb 2026 10:13:16 +0100
Message-ID: <5967652.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260220161011.999642-2-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014012_979338_6EB82BC3 
X-CRM114-Status: GOOD (  17.66  )
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

Dne petek, 20. februar 2026 ob 17:10:06 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> That doesn't change anything now, but if USER_DATA_LEN changes, it will.

s/USER_DATA_LEN/USER_DATA_SZ/

>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

If this is really a fix as subject suggest, then Fixes tag is in order. How=
ever,
this looks more like code refactor as end result is the same. So maybe
reword subject?

Best regards,
Jernej

> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9dcdc93734cb..c420909b944b 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1761,12 +1761,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_i=
nfo *mtd, int section,
> =20
>  	/*
>  	 * The first 2 bytes are used for BB markers, hence we
> -	 * only have 2 bytes available in the first user data
> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>  	 * section.
>  	 */
>  	if (!section && ecc->engine_type =3D=3D NAND_ECC_ENGINE_TYPE_ON_HOST) {
>  		oobregion->offset =3D 2;
> -		oobregion->length =3D 2;
> +		oobregion->length =3D USER_DATA_SZ - 2;
> =20
>  		return 0;
>  	}
>=20





