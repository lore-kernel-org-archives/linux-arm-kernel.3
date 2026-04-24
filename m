Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1290FE5202
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 11:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=; b=skgwByb4r3m09bCIex6qIRiCtp
	8XcOG2VYygYvegRPC/cJ6X/I3137oFMmti9ZSgITCcxDECEDXnVUVN+adMN1GQ5OZX2l8/8zrr6Bl
	by+dU/SZ0oSxz1nckmH5Q2gj2Ct2zLbEuAWjdvvwEdarnoFG3wv5z5Zu9RYXMb8APoJsjjiAzIBUw
	bHrIYN+n0XuTpOkuzYN900A2rd18jBWN8Yoaw+N6/iIaCKjwunjhamgH0CNOlu6IVxzYKvMDeLwBh
	9FTdjcBeufobrzmpeyniBABvGdJm5CtpYAEATkYO8AXSiFqlrwPWOvjNqLz8IAp4Jc9hpK8jXFUiT
	jcHCHKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEdU-0000000D7hI-3ZB6;
	Fri, 24 Apr 2026 11:23:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEdS-0000000D7gx-3P5T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 11:23:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4411e1eba51so4260355f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029828; x=1777634628; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=ej5cIX7OGGRF1aEdfziql9pePIN8TbtR7iMQR2+bbsY0FXo7DfgJ9AFNXYd5IgQDec
         2nn5Sz44sjhhnfIfOsiQx3eE0h5UK5UXuQ2MGMTKOyuQrWowoFkFHu/Lez+HRd867U/f
         DAsFUw01S9sses5whXo+Mtd/jpjHO96sYO1BY9K1ofCyeKAGw2vGjnRzl5cQ7fzV0WaZ
         JE7fpPs51QJTg5BIFBHDYxjsAph43C2K+YodZqAHR9mrCKWTeBLBPXo5apjA3hWix7Q8
         vzcaVXVFtRCG+qnYl8CnBamcM0w2jYNCxEYZtkQuFHdhjhOKzr7U9/zbU1oI+lhMBs7m
         wlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029828; x=1777634628;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t+DJdjmBiSqlx1/PpjPe0tKhCBDYlA3fqYW1n4w00o=;
        b=I/bgQCdMyMaas9RuXOsqYLLXbolJfiBqLClrbSXb5GhpKVuUs4FS7hjqFH3w/OneO/
         aQ3kZJ4YTx5cabNeUtcuXAx23Xbz5Wg548v+ZZHO8QL2h6byg/a7RGllrMClQYiQKfjU
         I7yAtGTsJsKNBvY7muS78V+Tff/EcerajZ92/337IpYhT2/ZekkLOHbC+jycmgq/y8LY
         PhcdsEK8Af2LApA6YHkwrMsStVpvAOskOiST8Rlyb+oPz/2jtwpgFOX7fjYg+cnH+MK9
         WR4+Cvz0w3d2LpdEwA6C2t8c83bnCUs9xOR89LEqD6+fggNxT4HIoaMj8SwdgW74Tr3f
         tEhA==
X-Forwarded-Encrypted: i=1; AFNElJ/kCscsipWSGYUOfmYyY5jKOR9qHm3pLieyTeFN/xOmqC1+zYjQ9SizCPNdup87k/P7huIQr+bn78RIQkECakE4@lists.infradead.org
X-Gm-Message-State: AOJu0YzBBVtyMiEZuqZmdxWLHovtOFwKYNAY+nVYPAIRxGN8kODJwIQb
	0ezf9e2WXFeU+lYGQM2dXCdlNfj0oCHYR2HaKauTq2FaXOx7gZht/8aj
X-Gm-Gg: AeBDiet8UIKUhrzqTfCzQjcgnBChNGcHmTJBK2R8PoQSm6tcM9TZD1uXPaXwVet5wmv
	kmOBgT2rUUgVYgE81fEFQ9jEoQE0Rvatu379Qcc3CspkYyAEMtjdAMBIHRtjPeEpgKwuaCjAq9p
	rhbuhKn2Q8oefMq5Ec7o4N10c1PqKC0FhlRipVwPR7shgBAcqGBVzGyJMGWf/dcYkwAKMHqBlqI
	N84OjM0sBfmitfHDMzxES/ocqo3XDr/ovj1I6t6OIAVHvTQneuH80icUMrS/Ku+WK7Qa16IHXJv
	3HQdESdxm8IT/v5iE+PU0vG0xpsIXSKIwrvBFHqHF3NIOIRICsR4+I1p1sKCUGWd3h6t0Y5NX9z
	xggHJqso30xEDMrt6xWPzhe6cwVPuSgkn8eMUM4s/Su9YIyauXQMin4I7etLh2cBySwtvlNtSrN
	HqdtNMomVARjoBUuR0azrjmw8NEOvfUzq1jxuloJ9VrP63
X-Received: by 2002:a05:6000:240e:b0:439:ae2a:755e with SMTP id ffacd0b85a97d-43fe3e0b606mr48159269f8f.23.1777029828055;
        Fri, 24 Apr 2026 04:23:48 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm63645843f8f.7.2026.04.24.04.23.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:23:47 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v5 1/8] ARM: zte: Add zx297520v3 platform support
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
Date: Fri, 24 Apr 2026 14:23:29 +0300
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <BF5EABA2-3168-48A2-AE2D-D8EE2CF88E9F@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-1-ace038e63515@gmail.com>
 <CAD++jL=am0f+sgBSFYQCdcFOvFWgPETn_pSgVdzETJ3_yUNqgw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3864.500.181)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_042350_890351_7AE31766 
X-CRM114-Status: GOOD (  16.15  )
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


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> Am 24.04.2026 um 10:06 schrieb Linus Walleij <linusw@kernel.org>:
>=20
> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
> <stefandoesinger@gmail.com> wrote:
>=20
>> This SoC is used in low end LTE-to-WiFi routers, for example some =
D-Link
>> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are =
branded
>> and sold by ISPs themselves. They are widespread in Africa, China,
>> Russia and Eastern Europe.
>>=20
>> This SoC is a relative of the zx296702 and zx296718 that had some
>> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
>> platform"). My eventual goal is to enable OpenWRT to run on these
>> devices.
>>=20
>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> Didn't I review this already? I don't remember, anyway:
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Yes, you did, but the previous version, and after I sent this one.

And if I understand the b4 docs correctly, the Reviewed-by tags are sort =
of handled client side: I have to tell b4 to fetch trailers, and then it =
will add it when I send my v6 with Krzysztof's request to squash =
patches.


--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnrUrEACgkQPRO8yFRP
GiKRrQ//d0i3JtN4eqnwGJS0KDoAetBNQXiNUwHJGszPaUlMzi1beDOdsTFk7Who
t8GNv9VvwjuR7Agxy+B9vNltnZanU6djJKQhm1+Qd7AvlC86ueKD2tGZUxpmuipl
37Poxi+E1zUTG68RTaJz1p0utLhaZkiCjVJzmTQgJJq3mAfYp8ycFI29IgdGHJCN
612a3nSFm1l6vz8a+qSX9kQG1UnTYQjsavu1ACxQp9Kk1Xga1G+atLgfXTTY3Aav
LjzHpAl+B0szQ84Zb05ZpJ1jiZYnMrDrIlNu1hv9/PTddXHyL2ISI+0um5OCvJ6n
61iXnVpyJlrscV1Iqs23VwxKx+y3rnV1JIlf/j4n1nwkJ5LQLxRWuYUpmK71uwKt
8WtiK3AD9VxnQvfVtAn2ltUaCLeeE+pZpSwnOvI31AOrwwZQ3ckSqkYRYVwnxVZZ
hkYMk1IfqjRPdMgMjyAqKEPZ5hOqYC5eqd68uM0HAXpYnUT/FNxGw/+sV7oX3qyY
eVho0WqhoeBEAezLTQ+GeCNlLirDpHwT2Y8NHYxSTlIQuwhwClwRPjdXCyS9adcF
eCz32rEZFS75z0LG701LB+MlMhblYEkGiAm3DEsFo4778ft7kfWC5N3GJLbu31SX
1/xC0sqkBY5zF5gvLXwtw0kEniW7PzEgc3oc2N3T37x4mk/WGfo=
=+4QJ
-----END PGP SIGNATURE-----

--Apple-Mail=_EE2E18C8-0A52-4302-9DA1-BBDF2F1ACD26--

