Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE95C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3t5xZS49XjT5IHZqDdWvkf/l+hWK8lS0z1Xx2S6w7M=; b=Qh9Uuefdhy5KX+EKWMXq0ThcBN
	ZGleTI7RNUR9tFUfKa41AHWhpGdlU7wCjHY4q7FEtbXo851qFMkAF2ZFRVmHUK7T3fVnt3GsGpx9j
	GDIKThlVtI773GkKzZzJfi9wzc/uEfsg5XW5T5Wz3JRXmcGXexwa55w04GK8RHPCOOUobIeN08hLl
	qy5DiK7Cd5SR8dsJ+r6UYYE2ArKAtEOmWlaBQ7i+/lWA11/sH8iDjl+zBZ+9fVUaS9/A7+9oTkLs8
	xG3K59LZRdjmfa2hlCUX68fAzWVhgwOHUA9IGm7APF73fsmPUwc8iRxj4XlYyZxxdO5IMIRoyQ+5S
	hXAIG0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XHE-00000007fJt-2b03;
	Wed, 09 Apr 2025 15:23:44 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2X6Z-00000007cxC-2wfB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 15:12:45 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e6e1cd3f451so4800258276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744211562; x=1744816362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3t5xZS49XjT5IHZqDdWvkf/l+hWK8lS0z1Xx2S6w7M=;
        b=ECS3M1vEF1uw1oTx8IMN6ZIPmDKvmZfVNS2TEV2Nw/tBN5uqYwqfYbXsHHp375fYq5
         bRjsCuTE9yQ2CDQ8b8WeBeg98HU9ABrrxaOovUghijiQ0ZKExbDmqmCeJyi6eb4Ex3yw
         ejbkD7I4j+706mt3HH41rcKf8IUUYQKkUHRPvgk6ESMFM9iiYeEceXfVLfTPD01UxxDe
         JLKeiHZ0CHTWk6eTpEf5Dy8CV1HgPh+GLxa8H25/JapPyN4ixjrA2K+ki2KKMV30N7a9
         1kY3tyW7m4uv3wg60nQr5hY+bVrNVGkqHcrBhg0cb3oFwSaD7lrVNciwAg3onYgrV99/
         mamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211562; x=1744816362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3t5xZS49XjT5IHZqDdWvkf/l+hWK8lS0z1Xx2S6w7M=;
        b=HHIPxcFFUpyzaWDJyMpQABQmyjEhHqi36EQz7I6f7c81q3e1edQ77ccvTHS38n37W1
         T/XcQlYHmLZyUQDxLHqW5AAPy5/u+QSSL6ILshyqLhYBa29eGIXNUaKCDxxyTTby2GvT
         Cn1Nr3dvZLj6iiZba9qRXRCcCYehOcUaLhdDdv/EkpySOhz8R+wBWHVTNfDQnF5X/TL5
         +3KDf/fTBjtJe2jXlOX627+C2RayP+c1aJXkRe6SetQ7kIcqkNfhzHOObb81CvzanGZ/
         SmX/XuL8eSw0vAp/DwCnlyWr/Y+OWM3anutQBNgt/Qu6MO8xtDK8ZYzVSIyDIk29+Rnf
         tHCg==
X-Gm-Message-State: AOJu0YxWNLe36+RS0iWpLotSuZy1IrGwF4c1i/vJHza+p06toarcInao
	Bg9mGRgNphfwNvEf1ES0KTgKpxlfR3NoZZiTjAAzIdWeSlamSkV0Fb27CBP/bGwtcv4LFhq/2da
	SWmAOtuJ59yBaDOUe2gVWrs9yFio=
X-Gm-Gg: ASbGncsaWvn2A8D6J/aZWW5+c4ABPEQ0ZMfJ6h9IeaQXUql4fzZqpWhOTAr5QITN5CI
	LhAd94cmjii928qTeuU/bFGTEbgs57iBWfW+CP3lWt6KRujKyuco60E0H1GRcmXyHewpoAuvOdW
	UbchVVpaGCfAxKoRsah9oAs7A=
X-Google-Smtp-Source: AGHT+IEtbvGJrrFXv25Gz57HIgc1gLvZRGhMj8AoGDVCzx3Fj69chrAsSUhsTsd9FbtyZvKBVg6n7dOfUO6WzMaeVGQ=
X-Received: by 2002:a05:6902:490a:b0:e6d:f3ca:3e0b with SMTP id
 3f1490d57ef6-e702eefaa45mr5087126276.5.1744211562312; Wed, 09 Apr 2025
 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com> <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision>
In-Reply-To: <20250409130918.d3cyzv3to65oktv2@vision>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 9 Apr 2025 10:12:14 -0500
X-Gm-Features: ATxdqUEC0KlsZO8TP_kymKqCuyolVUFgP7e-PUwC17eiA6gRnsKRAKv1w5DZHMo
Message-ID: <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Jason Kridner <jkridner@beagleboard.org>, 
	Deepak Khatri <lorforlinux@beagleboard.org>, Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_081243_752033_BDE4D77B 
X-CRM114-Status: GOOD (  16.72  )
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

On Wed, Apr 9, 2025 at 8:09=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 18:19-20250408, Robert Nelson wrote:
> > On Tue, Apr 8, 2025 at 6:18=E2=80=AFPM Robert Nelson <robertcnelson@gma=
il.com> wrote:
> > >
> > > BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> > > PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> > > Its dual or quad A53 cores can provide higher performance than classi=
c
> > > PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> > > JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> > > MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery char=
ger.
> > >
> > > https://www.beagleboard.org/boards/pocketbeagle-2
> > > https://openbeagle.org/pocketbeagle/pocketbeagle-2
> >
> > dmesg:
> >
> > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1
> >
>
>
>
> Any idea why we are crashing?
> https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#fi=
le-gistfile1-txt-L311
>
> I don't see the same crash in beagleplay:
> https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752

On 6.14.x i have a little more, info...

I've got all the CRYPTO stuff enabled, pretty sure that comes from
CONFIG_CRYPTO_MANAGER

CONFIG_CRYPTO_MANAGER=3Dy
CONFIG_CRYPTO_MANAGER2=3Dy
CONFIG_CRYPTO_USER=3Dy
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set

https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x-arm=
64-k3/patches/defconfig?ref_type=3Dheads#L9578

[    2.940076] alg: aead: authenc(hmac(sha256),cbc(aes))-sa2ul
encryption test failed (wrong result) on test vector 0, cfg=3D"uneven
misaligned splits, may sleep"
[    2.940183] alg: self-tests for authenc(hmac(sha256),cbc(aes))
using authenc(hmac(sha256),cbc(aes))-sa2ul failed (rc=3D-22)
[    2.940191] ------------[ cut here ]------------
[    2.940194] alg: self-tests for authenc(hmac(sha256),cbc(aes))
using authenc(hmac(sha256),cbc(aes))-sa2ul failed (rc=3D-22)
[    2.940276] WARNING: CPU: 1 PID: 207 at crypto/testmgr.c:6026
alg_test+0x4f8/0x610
[    2.940303] Modules linked in:
[    2.940317] CPU: 1 UID: 0 PID: 207 Comm: cryptomgr_test Not tainted
6.14.0-arm64-k3-r10 #1bookworm
[    2.940328] Hardware name: BeagleBoard.org PocketBeagle2 (DT)
[    2.940334] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[    2.940343] pc : alg_test+0x4f8/0x610
[    2.940351] lr : alg_test+0x4f8/0x610
[    2.940359] sp : ffff800083e13d10
[    2.940363] x29: ffff800083e13d10 x28: 000000000000000e x27: 00000000000=
0000d
[    2.940375] x26: 0000000000000000 x25: ffff80008151ce08 x24: ffff8000826=
25e40
[    2.940386] x23: 000000000000000e x22: 0000000000001183 x21: ffff000004e=
37880
[    2.940397] x20: ffff000004e37800 x19: 000000000000000d x18: 00000000fff=
ffffe
[    2.940408] x17: 636e656874756120 x16: 676e697375202929 x15: ffff800083e=
13900
[    2.940419] x14: 0000000000000000 x13: ffff8000825c3ad2 x12: 65742d666c6=
57320
[    2.940430] x11: 0000000000000001 x10: 0000000000000029 x9 : ffff8000801=
4d9e4
[    2.940441] x8 : 0000000000000029 x7 : 0000000000000002 x6 : 00000000000=
00029
[    2.940452] x5 : ffff00001da6c508 x4 : 0000000000000000 x3 : 00000000000=
00027
[    2.940462] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000004e=
e4a00
[    2.940475] Call trace:
[    2.940480]  alg_test+0x4f8/0x610 (P)
[    2.940492]  cryptomgr_test+0x2c/0x50
[    2.940502]  kthread+0x138/0x220
[    2.940518]  ret_from_fork+0x10/0x20
[    2.940531] ---[ end trace 0000000000000000 ]---

Maybe enable iwd support will trigger it, as iwd needs built-in kernel
support: https://git.kernel.org/pub/scm/network/wireless/iwd.git/

#iwd
./scripts/config --enable CONFIG_CRYPTO_USER_API_SKCIPHER
./scripts/config --enable CONFIG_CRYPTO_USER_API_HASH
./scripts/config --enable CONFIG_CRYPTO_HMAC
./scripts/config --enable CONFIG_CRYPTO_CMAC
./scripts/config --enable CONFIG_CRYPTO_MD4
./scripts/config --enable CONFIG_CRYPTO_MD5
./scripts/config --enable CONFIG_CRYPTO_SHA256
./scripts/config --enable CONFIG_CRYPTO_SHA512
./scripts/config --enable CONFIG_CRYPTO_AES
./scripts/config --enable CONFIG_CRYPTO_ECB
./scripts/config --enable CONFIG_CRYPTO_DES
./scripts/config --enable CONFIG_CRYPTO_CBC
./scripts/config --enable CONFIG_KEY_DH_OPERATIONS

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

