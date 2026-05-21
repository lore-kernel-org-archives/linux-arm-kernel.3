Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D49CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9PrdA31q5x8SAejtf+3EF1jeBrhc3Rg2VGzoBKR6RQ=; b=3lO3sU7ZcU95tQbXOM5iF5vI8C
	3ot9VL8Gtls7ZQMTnES5/LrY7+yg2uQvoTTYtnPTDCqSkghrmiXKSiZUKU8TER12C5Otc915RDak1
	3glgcyk918NbDld0XmcoQWe0iFyb8eel5wzI+rFxawgocF0b3FQB9u6BHgd86qCWYFUTWY68GgzOr
	BKUI9AxaXHXKfprb2Hv+PihWiSbk+ipMo1PQcxfc+PJzNJHdd35gcdhTRoMkpNo/hKlTLUGpv2yCd
	BFADFZbytKHWItJAJ3ecOnEo/ecwA/1M6eSgKdqpspKREskhtGJzkYXAfFqZgBzeZInpB7A9Ptq+F
	Wapf3edg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyKQ-000000072GI-2qbB;
	Thu, 21 May 2026 08:00:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyKO-000000072Fd-0vAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 08:00:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-44e1860558fso3684143f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350422; x=1779955222; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9PrdA31q5x8SAejtf+3EF1jeBrhc3Rg2VGzoBKR6RQ=;
        b=LF3Xlj3iB3mPazXDXyoD9JSYVna6/r/7e4YQtpnSM0uXKE2ybCAYqyTQB+ZoQIuPxQ
         3eYcCEoIxUTWrUsXvQ28llB73xkom40bVtJGUTIi+16JdYxP4BzOvebZtUCdWCF6U5J9
         L4oEuNbAQT7EQsamIsJOe0AQRYzzah0odc2f4XLRLB1gf+b1LutgN7Ce8bkYEeMuM8S5
         BOr8WJNrymk2aBCBVgUn0HoK+5glRzNCvkbHWkflvjDQn6PTpcgDTbhqyeEnp2NcBJ8s
         46xywYpKM/ZT0eu6l2ltHy8JCs8Ox/aT2o1SZ2bN2HscrtSBmDJvMiRBUaGucKP397fc
         f61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350422; x=1779955222;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9PrdA31q5x8SAejtf+3EF1jeBrhc3Rg2VGzoBKR6RQ=;
        b=hFi52J+qqTUvvYjGIwLkKIOytYu1ZHgHgNH4bMgYofIcbZtMCaG33skj87e3A6SFir
         KLrQqxz1rnZswhLSGAtk7O0kqBibLzk+UxO7R4KRszHBcBl0ee7+2VpkLZOdjuAMNNyO
         QPoGXTcSSLXBjuYrlOm2WhN/PQVWdZ/IBXI7LHX6b8Yzf0IAmRKgJq288WDbO1l8PO0Y
         oRaOoND621OULjQKeeGKNTLOofDsE2LPNVdNm2pBwHWs6dzUe6wPyQxzGBFokoSZnIoi
         pZmw1KxAWy4qd9Jtvct1IluKhyjE3WqvSV/1HsVjgOQ9hyFp8THd2Xb2GAI8BhYvgjYa
         1OOA==
X-Forwarded-Encrypted: i=1; AFNElJ/UhFJiPWVcms8Tyx+FcT5fmdTooeSRJKybqHLqOz1FrMmp7/8ZMx2CQ2laT8gM9Q2rvxrl63b4x2D78z36KRgy@lists.infradead.org
X-Gm-Message-State: AOJu0YzUStHsevPMhpSl+WrrjYULMl3cu28F+uw7q7PyfPukfsnyt4Bw
	aiLDnqHN/NeiAl4tMQnVvhz0oThcpaUUe52RRzgfIy5ltqONfX191NTK
X-Gm-Gg: Acq92OFt7lZOJ3pz4noZKFjsUVwLMPkaJu9Z49kqyZlWJC+cTbcyxIT/GGSBTxGiovn
	Gz178kgV3xbGczOdBVWSpfuRstoQjTgqM8dUGo8UDWGVo3BWIM4DnrEt1A8BxHbGoX4vO1PQEcz
	De5LlfTSCrIZtj5xFCTzwA5i8BiNPuEBXiZNbWjG8vCAjNWdDB7O3XsqfngP9rXijs8VCfc79Ay
	Upv7FNk6wgO04gJDVZ3VLDm6mmoKjrXTeoKYZ1DPf1tyLue2QJFN+QE2HRXI5IYMzl4RHmYHukW
	+YtSg86yccy5Yk0uZp6WNw3/rJaToD67FreFUqmeHD1KlJJvs2/BM76JaJaMjYgKKYADJGvH+Rm
	x4yZ2EEpie/cbKVIkGnbOCD12JA0Bwh3zjamGgnS6nTdrt+90A8EPLz7V6mIxNsYNc44RFJ8fKB
	9gr5sqgFsD+b020RwkQs4UepOy61I5zizCew==
X-Received: by 2002:a05:600c:468b:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-490360c12cbmr24099035e9.26.1779350421276;
        Thu, 21 May 2026 01:00:21 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca96sm726769f8f.19.2026.05.21.01.00.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2026 01:00:19 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <30b96e0d-f296-4c31-8701-a15c568ebffc@app.fastmail.com>
Date: Thu, 21 May 2026 11:00:01 +0300
Cc: Linus Walleij <linusw@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
Message-Id: <3B300E28-8603-4881-8A47-E9B86A355090@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-8-ace038e63515@gmail.com>
 <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
 <30b96e0d-f296-4c31-8701-a15c568ebffc@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3864.500.181)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_010024_293196_5D694A3B 
X-CRM114-Status: GOOD (  35.88  )
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


--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Arnd,

I saw your reply to my defconfig pull request, but apparently never =
received your original reply. I only found this mail here. It looks like =
I have to look for a better E-Mail provider as gmail is choking on the =
volume of the linux-arm-kernel mailing list.

To answer your questions I found at =
https://lore.kernel.org/all/61452117-0cdc-4ec2-83eb-dc03ccbd410b@app.fastm=
ail.com/ :

> Either way, the patch description above should at least explain
> why you think you need your own defconfig, as we don't normally
> take those.

It was more cluelessness / being new to kernel development that gave me =
the impression that boards should have defconfigs. Since then I ran =
across scripts/dt_to_config. I haven't tested it yet on my DT, but if it =
does the right thing I don't think this board needs a defconfig.

>> +CONFIG_CMDLINE=3D"console=3DttyAMA0 earlyprintk root=3D/dev/ram rw"

> A definconfig should normall not rely on earlyprintk, just add
> that when you actually need to debug the super-early boot
> stages. With "earlycon" it should pick up the right console
> from the stdout path and work almost as early.

>> +CONFIG_BINFMT_FLAT=3Dy

> Are you actually using flat binaries? I wasn't aware that this
> is still possible on MMU-enabled kernels.

>> +CONFIG_BLK_DEV_RAM=3Dy
>> +CONFIG_BLK_DEV_RAM_COUNT=3D4

> The old ramdisk boot is going away in the future, please use
> initramfs instead. This should also save a good amount of RAM.

I'll fix those in my tree and keep the defconfig around just in case, =
but otherwise drop it from the submission. We can revisit it later when =
the board is more complete.

>> +CONFIG_DEVTMPFS=3Dy # FIXME: This is specific to my initrd. Remove=20=

>> before upstream
>stale comment?

I believe I removed this in later versions though :-)

Cheers,
Stefan

> Am 24.04.2026 um 11:54 schrieb Arnd Bergmann <arnd@arndb.de>:
>=20
> On Fri, Apr 24, 2026, at 09:13, Linus Walleij wrote:
>> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
>> <stefandoesinger@gmail.com> wrote:
>>=20
>>> This enables existing drivers that already are (UART) or will be =
(USB,
>>> GPIO) necessary to operate this board even if they aren't declared =
in
>>> the DTS yet.
>>>=20
>>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>>=20
>> *I* personally (as SoC maintainer) think that having a few more =
defconfigs
>> is fine, even helpful.
>>=20
>> But I would defer this to the more senior SoC maintainers because I =
think
>> their stance is something like:
>>=20
>> - We have multi_v7_defconfig for compile testing
>>=20
>> - We know that binary gets way to big for your system: it's for build
>>  testing and perhaps booting in QEMU or systems with many MB of
>>  RAM, not for actually running it on products.
>>=20
>> - You are encouraged to keep your own defconfig out-of-tree.
>=20
> Right, we clearly need to do something better than what we are with
> the general defconfigs, as I'm sure many of the existing ones are
> never actually used for booting a machine, and are horribly out of
> date with the Kconfig options.
>=20
> I wouldn't object to adding another defconfig for a new (or revived)
> soc family, but I don't want to have more per-board ones.
> Overall, we have about 70 defconfigs and 55 soc families that have =
their
> own mach-* directory (plus a few without code), and the number of
> defconfigs alone makes it hard to keep them up to date.=20
>=20
>> However I even challenged this myself by adding a defconfig for =
memory
>> constrained Broadcoms a while back (NACKed/ignored ;) so if it was =
all
>> up to me I would merge this.
>=20
> I don't even remember that discussion ;-)
>=20
> One idea might be to have a tiny base defconfig, plus platform
> specific fragments that add drivers. The problem is agreeing
> what bits are essential enough to still get enabled in the
> tiny config.
>=20
>       Arnd


--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoOu4EACgkQPRO8yFRP
GiL8IQ//Zm20DYooaVaVCuklde82UX5X2MHKLX3bEwoqFm8OwrwK1a0bu61uKXRd
TTj/RVjingjzc/MWqbhSiDLM+1tvrMaa8bhi16TRYn5upIa71KlieKL5Kd/9cmoW
fqmI+HoIIq6mQTIYJ2GMCp0/ciADEXnE41buFWzPiu7BMeVInJMaYpX6NKyXd7ZG
oAf3t5tCMMxrRfBq7bv4JV8TAjLdibq+SNyxH6xYoZwrW7J6pLYGeHJcbUNNHJFD
Vl5PgpflnmNhfcQk7nTKufpY44szSAwB9GmiuOemwzmUEGv3V0e4t8Rni1FlHQsR
gAUiB04OMbDSDV9kntSrZwbEUR4UkJLZhKanfJOTv/Sy6pNZLpcS0TB5YY7TEfcy
lr1oKB9HXUka9mhPKFmGrC0TN7jkPKmkTLK70RXVtNX/pU4dFSsm0yP76XL2KrBA
rfvH0At+i5cU3nPYvoOm56VkiOfHsnQB9adNQ5l8GeAUpQB6HI4jr23IhD8BYvsB
yKxccCZ4tkD05c9InZqE+lsxvB9esDjo4gKZzFWhuXY/+4rOcRowbxsFGHt/TCWn
9U7SU0cAsuce6Ex+oPs62EkqM0yyZ0FMVlmVGI9PJ5O1sJ5W6xYOlxwnLGH6TJNE
bOIJ4WxSJmZra+QaQXak7qAOxAV92+Du/IioWZnoXjGc0BzTjhw=
=rcPP
-----END PGP SIGNATURE-----

--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628--

