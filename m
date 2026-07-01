Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E6EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MErk0SB6y7nvDuzL2sNtUk9wfZP7Spym0Y2C6C35Ids=; b=v+1kY26YCM9o8505DuABIi/sqR
	40KZ4XzGRBlc+hSkCPoF5EwzyMPm6Mccdvcwy0dqQcfRJpAwsxXpS3ZYSnhU2B8qWTl2xzM60tVze
	0KJPPEWosVvNawPdVbQ3CsDZeyyml5dV94KqjFAZrxmkbSBQ6FI+Jf2ulxb1IFva1jlVjJusPPIM5
	xIXBlhp05O0L8bf0exYkyFAffZS0Xi+gje9tJtReDkYci2ii7OWATooxK1BduPD4S2uO4GjW5RmK8
	4M6HJmKeMPzpkNgbMeJzb5YXQJ3RFug3d480DunlId0b1Dv//+09vKCorP3u+m3EWchJhSX58eVc6
	Pc7QRUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuOw-0000000231k-2T2w;
	Wed, 01 Jul 2026 12:50:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuOu-0000000230x-0mBn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:50:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493bab44440so3564915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782910246; x=1783515046; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MErk0SB6y7nvDuzL2sNtUk9wfZP7Spym0Y2C6C35Ids=;
        b=CJ1TLTKswdEPyi1sSFLU9US5J9fOQfcpvDQKrZRifGJBNpaEeKchtMRX3TIROSQ8RE
         S5FevBTtAc8QCVB873g+7kxQfbZEfOeqUKTjct/8zrNdrlcLn8aLGyC0vHqdyQgA1wSY
         HwcGnkK+STYgkWQys6MthnE82RgdpQjkEXKi7xZhUxQMWZRXmSA71MiWidbjgsmZIoV/
         dUd6Gxq7vhqhBhxAmksJQUEvJCKo3kmmOdwlI7V5vZ4XleD7DRP+SC2399ZlCDKwQLOL
         L4ReGT9V8gxpYAHXr/D50DmqD9VS3GwELhLx3SmDrHlx9EQIajmYNDcdZbqZ4tl2v9S7
         hg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910246; x=1783515046;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MErk0SB6y7nvDuzL2sNtUk9wfZP7Spym0Y2C6C35Ids=;
        b=TfIDyurfQpZiS9+wZ1xnBasohjFIz9yw6cL56ePvoqgW9iihcU8mKthLfD/UpRRN5C
         9FSIFoxLrkCs4HIvpp+tK9Olmsysb9Q71IOaZ53miqeBRpRJVr3kbFC4eEtuVWErQTOX
         RD+0RzIOLyIETipLG+P3jMmsMXwsuWmy9VgtK1dreqrEsn3kNFFkcH/0HZ2YUs2WuwOk
         mkjImZu/0QIzFpEleohPjqWQhL8PbWrWo0ZMhgd2h2ypDNeBIM//6cB8tB9eSgmWv7Ib
         2X83vBvM9mVt9OxGyx1Xjln0l6Cv7/+o/J3nb3vmWtMezTTL3CdFMQ/ls/TsQSGGX3zs
         yvnA==
X-Forwarded-Encrypted: i=1; AFNElJ9BBm44rN3cCfCl44kH6xlxwt7JlPrpNPvxnP2/IPbdeKYeymwSPCeGLbzWwuYqEulWrbNwJ/WwHziDoaoKfuYn@lists.infradead.org
X-Gm-Message-State: AOJu0YzLrPP2Znp5F6mVVdfhLdp2MAi4ob0U7R1l/WdcFZCZaPVCug8z
	F/SmVDkw0nPT7fqphyciEYL1Ekx2w41/o/M133N2YPiHEID3cM6XVIv6geDameifsgg=
X-Gm-Gg: AfdE7cksBdsEaKsYQUXvdLag2bJkSZFFIjKt2EnA9+p3tuDOBfeMewY+lGbQkgjh8gX
	3h9NMba6HyZSXdCIb0q329hPa81djy1/IPgWPX9gTgbYTNRbjIQgozXTlqrisSx84ROqCstbUcL
	8i/f5lEXYqxboEs9AEuaL7wCM+DFB4cfvbnVqkja09d0owKYS6ICUQZRt1NvvyvCHy0gcFycVxg
	7HroiAfvIObkP3UbeJ8QQK1sOX1609aP8Yh4QKhdgSCzQ9ovBhD5KEzsfYwqlrv9UHD+hX7d4f+
	pZlsoyEWGkCRp2mKeQk28DdWfHZ6s7FsRlRdMk8XRICaEE8m4qRV4RZTNW5Lz/BSABg6A6Um8Of
	1jrTerfcZCwv7nadz8WmE2CgApdiDdJTXty+HZnukb8IhGK6I/w752oSOfSn/pkhgmmiFJkU3AB
	9aFG1qCRTW
X-Received: by 2002:a05:600c:3501:b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-493c230baabmr23336985e9.2.1782910246414;
        Wed, 01 Jul 2026 05:50:46 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:9d68:67c1:6cf5:ad2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe616f5sm34364775e9.1.2026.07.01.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:50:45 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9bb7aa0e7bfaf132bd9bdf17c0d5ffceccec2a4b8d712d499eeac40c7796;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 14:50:38 +0200
Message-Id: <DJN8XK5EIKU1.3FAVGBD6W2L2B@baylibre.com>
Subject: Re: [PATCH] arm64: dts: ti: Rename DM firmware reserved memory
 nodes
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Paresh Bhagat" <p-bhagat@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
Cc: <praneeth@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <v-singh1@ti.com>, <bb@ti.com>,
 <u-kumar1@ti.com>, <anshuld@ti.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260630150919.457160-1-p-bhagat@ti.com>
In-Reply-To: <20260630150919.457160-1-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055048_241205_194138E6 
X-CRM114-Status: GOOD (  12.13  )
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

--9bb7aa0e7bfaf132bd9bdf17c0d5ffceccec2a4b8d712d499eeac40c7796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Paresh,

On Tue Jun 30, 2026 at 5:09 PM CEST, Paresh Bhagat wrote:
> Rename DM reserved memory nodes for K3 devices.
>
> Example:
> memory@xxxxxxxx -> to dm@xxxxxxxx
>
> This allows U-Boot to identify and resize these regions using
> fdt_fixup_reserved_memory() as done for TFA and optee.

How will this work for the updated detailed layout bindings that got
merged here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D91ddd97e1bb26937a5c15fb51ec8f6b65dbe94b8

This splits up your one memory region into several memory regions. Here
is one patch that uses that new memory region:

  https://lore.kernel.org/all/20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db=
8b16821a@baylibre.com/

This basically breaks up the one memory region into several regions.
Wouldn't this break the fdt_fixup_reserved_memory() that you are trying
to merge into u-boot and make this patch unnecessary?

Best
Markus

--9bb7aa0e7bfaf132bd9bdf17c0d5ffceccec2a4b8d712d499eeac40c7796
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCakUNHhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNa
9gD/RaHbD4yV3M+ODYbnqHOmPvOHI4Bgvy3v44f5zEBwHesA/1OoQNGICWQsmQsU
W2DtMnel9cjfAM+hs/vWQ3uB4ZAJ
=WZES
-----END PGP SIGNATURE-----

--9bb7aa0e7bfaf132bd9bdf17c0d5ffceccec2a4b8d712d499eeac40c7796--

