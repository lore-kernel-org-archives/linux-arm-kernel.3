Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C2ECA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=; b=sniuR8i2hxWiWE7mOjPehlegkY
	BkgtoPnylcBQ3SkBXVkalYBYYeieypiPGx2JLeyP1g2645KfVOrHMbCG5+jDk3JTdVZV244ICM2Ge
	ayutkMH6WLMNCZ2Qy49Gxo7Cx4KQ3PVfGCJdjoq4bvRrFS1c/QcFdCYUoqjSYvw10ijFLG82aIubT
	wj1handRrPV6JojoB4egmyRRbGdsAHysd81Cg9Gc2LJ0w4gZAjErfUVDZcnhTkjHMmewUmFLWoGrK
	asY1n1RyY6935yXQW2YCFvyzRJL36F/I78lLph/FKFcKBgFc0tG4SiYdRInKDbviEBnn2N1jA3hln
	4t420XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsQi-00000008zi4-2cW3;
	Sun, 11 Oct 2026 12:13:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsQf-00000008zhj-2QqD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:13:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4956869750eso8701645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791720803; x=1792325603; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=VRW13cV5HrbAL8GJjYWUt6eJA1FcR8HhyX+qT15MEp6zC2Nzy4/xcQVi8Eooq2fHKE
         cagbUtA2Je76TcybTd0+ONWLtITgO5HRxGGhl1i38TaFOHLVDLQDXBmBP8QwblrQTJsu
         JCDVLkRXkm+acqYtF/mAUPBUrytOi+L3GApC93XFBqiDJG3XnW5uW5j9pkgvd7VwhoTn
         P1r4D8EzUyCpop0qDM2lNQHvEMuUcvpEKDrILiKyBOvheVangtdvkJNkwM04D/2sqfWF
         yKpypdOkHQNmJPawmXEcUCvstUynijafXjDlwt9LMe5AYLAJLRG0gXkz8LjjnyWwsbZ9
         MkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791720803; x=1792325603;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=y9nXHjBN4/n1jZa89UHoU2OCTmb5v3rtAjcKObSAPLr7HRIX1o2WdGuZLy22wwmy5c
         g02Fn69/fKGn7YYlnuf4RD7xSb0VW/YWAE2OupIPiaT5+KsMQugm+m9Nhtlt/oxVadAc
         thIHGa8ufPp7vEHM8QgxOitVRk+tTaC649/yPsEig5SLO8cB3UwuEBxcxxpzvt5AjKaT
         E4cmeJR3uIZQtiKW3qdVPrH/mQLxJfSp2nYig9YXozEeZkNSUXCe4jlRYLNrw8wQNNNY
         bttJKtuw0XQYPIYZ8+o0ujCXt1W5QlRsbc7tyTkldYlaEMjVhJOxN1FIZoNmZSJrqjDE
         lfTg==
X-Gm-Message-State: AFq9FYJQH/LT1YEM2/7olRSMMOYDhF1Qd862GHU8iKpSExy+IoGZg8AL
	9PMhejXDumn+JVVFpdp63dozW0U9BPT30FMM/Bd0/FTtkeSsdll5vqOTkVQUYZzp
X-Gm-Gg: AYBFou1oSbC8LxWXmN8q7QYJhvo3y3CQ2YdQadlBM60sNkrkkLT50c9rCblnJy599bM
	Z3NJj09J1poaE2TJJNhmTVdP5jwcXOcD7g4TZdC9ZG4OIe3UAhtcbnJocLFrhArUlk3Pb6l6ya5
	LJ8PeuO+m19G/81P7eSJYI3wu8TfCEafRntw6QIwCJXWMl+2CmFwboKPY25zSOKJWafvhpmTtvR
	aottZGHZeafmryMwszt7jv2hcJDq6koRupmYehwEDVx5fIkak7SznbSZCwv7Yb+GWuXTziUUAJo
	v/3ydT7WECkNAJNpPQm2plN8JBXMm1P4yn3e10GkwzcFBzSD+WnbIt+ED51y92wr3W3hkhuyjJu
	AqVrpCeZ5NEFExG0hYXTTZxete/7RUjaN3EL9IRg2+pRBNbXY07bogZ5Ie3fZW5OnBr1W5x8Lsm
	L5OHoVU8qJsdVJdr1zkdAvaOqeitoLiSxmv7NbAT5aVYS1jkiiRvuv+NhFi8eO6+HvzDVX/En6j
	mF/17V+OahNg/rNIk5XSX1/qmqRRpjsh/7y+PzmReTdufRAN360YI5J
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr106551865e9.3.1791720803247;
        Sun, 11 Oct 2026 05:13:23 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm328215565e9.4.2026.10.11.05.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:13:22 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartK_YJ80XiTvajPgjPcZKRXg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_051325_640009_0FD4FEF7 
X-CRM114-Status: GOOD (  15.16  )
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

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Samstag, 10. Oktober 2026, 14:59:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieben=20
Sie:
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> supported + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */

This looks identical to mine, which itself matches the old zx29 GPIO driver=
=20
with IRQ support etc that was removed in 89d4f98ae90d ("ARM: remove zte  zx=
=20
platform"). This old driver had support for IRQs.

My hardware has the same register layout, but no IRQ support (related=20
registers are always 0). So I wasn't planning on reviving the old driver an=
d=20
just using regmap-gpio like you do here. If your hardware has indeed workin=
g=20
GPIO IRQs it would make sense to revive the old driver.

My hardware has one annoyance: There is one GPIO line (not one block of 16,=
=20
just one single line) that has an inverted direction bit - and this line is=
=20
necessary to run the routers on battery. I don't yet know what the nicest w=
ay=20
to deal with this is. If we have a good reason to have our own zx gpio driv=
er=20
then life would be easier :-)

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLcLEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoijZ0QAIYvFbnd86a0BA4vB7p5
HZW7/UnHb9Rd8bwaNM9LhFgFYmTeQPLzMoVsSUt84V+JUge57Kw8nPV0Iux2YNkz
IdzhQiShuW4/7oRjYqDSPStnkxVSeFDPOTmMJWLxqVXDvgWr5UMdCq4btlpYiPaU
mnnG9uvEjFCocDCxhCQpoMAx7HUCy+EnNge9vMPmXezh6+S4u1dYYE0Ap1u9kp1w
9yOd6Joq6hldxa8Rf+IVb8k9aFOz34eK/3HCBUuni0/zIIMiSj4EhUosmD7LxtMp
9GQ0bmuDTognLxJQHVRG2mH11ihkfvtEW25D/Dmb40YQsepPvjBAO3aq/DkoVWAc
+jc5MaYUCIZkiKvpU51Yyc4dWrCPr8mBZLDhGE8mT1kt2a5Viu4E4q7aePEqqmrX
7BxuiP6EDWHhdlvd0twIv4QjP6j+qE6+RbtGFSypOUQ8r5U83qrBNXid7MWXKwEA
zyMF2uh2oFdGAap3RK07ohCigHiuWkbk0HYdDt/VUP/pZLD2OR7ozZ94ResxbsyG
9ymGPuuDHwzHy+ULVHiaeHWygV0AfO3/BdAh+IfbbU8XgLQNve0f3ouodUN98L9M
NZAeS7Kwtpt/55jvyJ/ZxDufW+xIHnHrqrW0HPf/asAchms/6+TkScZFgcJRA8FY
2yHKUduoenPY8vgxk+nADhIb
=xhk2
-----END PGP SIGNATURE-----

--nextPartK_YJ80XiTvajPgjPcZKRXg--




