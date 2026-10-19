Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD56CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=; b=G/yun5lc1gXx+EQ4MfxiDEWxEc
	P6B3TKCgE/1YD3nEbdkuG2NvHaCQXqJG9Hkkjb3dgfeaS+jJoC01tfizdl8wACtQEuVbaB2nOSjMW
	uJfwaRj5bw1thmV1IaZAPdT+H0Jc1ENqwoKNWH27wt2Js2+edPuF8J8/AH6KZH71SGFslbrt8GJOr
	IWgbd0Hp6bhMUjcl6aGsVoG27lxEbcOmeKkJqyQ/CqQB4J4UFBmmFSPmCsc84jQoIuBn8tUlzVLoP
	hZqMlwjcRyGXBZHGS6QXufQXUX4qq9msibBAirxiUZg4+7LMD513Y1nvSbGwD+M5/qMdwx44vFoO/
	zlMcqr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi9v-00000006n7s-3JNT;
	Mon, 19 Oct 2026 07:51:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIi9q-00000006n71-0qJX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 07:51:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso19156345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792396304; x=1793001104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=hzAI8ZmuzqNyPcK8nrA/G843CQJB1MXVs82OeIsDV4Or3C2zavz3Xd5DpPylx06DTM
         vcaJ5UcUBGJioVuAQ2LDVX1R/jMxWAx0rOuMhY7RpSMEUuO1J8AXB+0sVLjdVDKKVaA4
         94918F1Cho0vt7OtFM4aYEBLjxUvkHGdUdBi8qqNs0N4BHAWDUZBPIWLoWRM6WnPcMe7
         Xb8o4lSnoM1PNIs6OsT86zZKRQJh0wfU7X9wb4LtoyGP8i7WWUJmIph5opadyFM2y7cz
         WvI1ezM8ANUh7Nv7EvvdTPS5BPkAndgDKwy634T4lOKXJ9YGXhtzss5h/fDoOj3LxwWq
         n3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396304; x=1793001104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=2vRFtWhf5c8LMDfzUaGLBkxWIrL0PUw0qlEK/fjuVo8UkKhV/0eCSWBeYG7xMDBcBR
         YUs9pXWwvIlpkC17of7eqMKw8VgArOknctHHeHeq7eemBUOmvdZYhzuREA22rWsmi6up
         Vxfq1lXPYo0jWdWVkrNRKk0tD4v1PngHmffJE80kizEb8un7M7dMmPQ6AT5QhHHvPqZB
         e/cC4cPsiteIZXBYvSz/9DTXx5BPjC+q+80AKv65QDBs1Nlp+J1/+kTVmWaefD8cgkMa
         T5C02VUiIU2eGTggInNEbcp5438/MoU31nc81Aa28nTE2lfZwQnQ7xN4l7vlCbBaoCh4
         d9aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgJG9CN6eaICyxHJUtuTLNeW9ourFDTB+2UoD/wOxiIJIDzHxqiNJCKzL0PkV1scCCa6KnudjRTSrmRluRsgzp@lists.infradead.org
X-Gm-Message-State: AFq9FYISHGsSir3n40jGktWx7/8/sJaE4C+MMU0cvS6Fp+7IaRumHxtJ
	HYdMGF1gFWAEooKdX+qrRaE5PPlFnY3gv6khOAc5sh42Xof1oLvIeLx3Lesx5t4TCFE=
X-Gm-Gg: AYBFou2S+RgpweuzrEvz49fDiQSjtsWdEP3eDvU/WJMgvYL51Xuu9KxbfMoL6qpYJ6D
	KAerGPSf5bDN+RodGnRyX9qKTTAnHDbHdKzN6vu0f/CpxbLmfh7GnYzI3dE4AD6GzndQap70iYs
	P2ldiKqJvYNx+o2a/M7WqUb60AppkMnfy8nhCtQCloyIiuCd3w5enJiYy/nXTXkpsxnWpfVkDSz
	qg5GGThdSAXuudj3L6kEmNFGvoLs41+lgpkjw+g/92jdxIlzbtMXAvn2EXS5wRny03UmCgQPmnm
	WgTK19iW3a/V6w1+x8nBVYOOI/fbbajpVx4fCzEDKJMv712YiC1yUNLUI2e2i3spTLwrKAIfna1
	CuhpUixR8jojq6pSvu6cg0A+WJFEOWqiCjRxbNDqD9k4/yE7hdyDlpM8nJt8NIjOmidTTbhk2id
	irLfANx5i29gPHBEmj5zOGLIeWhfh8FFyKlFRPUwPihdyWJ4yCDpN4+d1j9a5epVQ47/Gk1/Fow
	JDCY+bJOQ04hSqbPR4sMFgYI2dOLDeklKLMLbOSPjbmftyLBq/JEtMe+USsdg==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr173850595e9.4.1792396304053;
        Mon, 19 Oct 2026 00:51:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1cc642573sm209959665e9.2.2026.10.19.00.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:51:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:51:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atXLd6SdHNr0UcjI@monoceros>
References: <20261016130328.1037616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5tdsywsd4xqnlzl"
Content-Disposition: inline
In-Reply-To: <20261016130328.1037616-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_005146_254062_E3CBFD97 
X-CRM114-Status: GOOD (  20.60  )
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


--u5tdsywsd4xqnlzl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> hub6 support was added in linux-0.99 and the hardware was already old at
> the time, being discontinued in 1990. The code for it has always been a
> mess since it adds another dimension to the I/O addressing in the driver
> that has leaked into many individual files.
>=20
> Hugo and Uwe have attempted several times this year alone to isolate
> the hub6 handling into the 8250_hub6.c file, but I feel that none of
> this has been a real improvement over the original standalone loadable
> module support.
>=20
> Any machine that would have used this ISA card in practice is likely
> 30 to 40 years old, and with i486 support now removed, it is clearly
> safe to just kill this all off. The only bit that has to remain
> is the ioctl interface, to ensure the serial_struct field is always
> zero.
>=20
> Link: https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.un=
ix.sysv386/1990-December/007174.html
> Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
> Fixes: c526404a4a92 ("serial: 8250: Fix corner case for port matching")
> Fixes: 7ab80d1e7243 ("serial: 8250: fix compile error with hub6_match_por=
t() when compiled as a module")
> Fixes: da7b5fd4e17f ("serial: 8250_hub6: add missing include for hub6_mat=
ch_port()")
> Fixes: 3d406299d882 ("serial: 8250_hub6: add hub6_match_port()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Fine for me. I wonder about the amount of Fixes: lines, but don't care
enough to check.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--u5tdsywsd4xqnlzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVzAoACgkQj4D7WH0S
/k4iJQf/V9G3FkSyYROePlk1XfrPSUEEaa8TTie3oEy+xPCSy0gTbErCq+RHUo4D
GxHAkavC95XGxxdZLoXmp7zZUrmdWASZLB+8Zx/zQ4uY474FnrmRb9wWmxzzt7s/
nYDE6veRDWeoi4Lcszow8rDX0uFISAaAjrBfAd/JE1t+QpkcNrYBC/PoT2BBUz6M
q1WbGxPxjSTmmYnqV3IT1Xp83J6CnJVVBme8YP4cqXBmMC0t7JZ2TEYeu42aTSFb
40v0k3I8d5pHzBl0W5c/DRH23ygvmgBFxaqFv+7uJovkvfnGmqATfNGCKzXM0lLy
P5TeqJWAB+sq7IQV0tkv0LpgWGVN6A==
=VH96
-----END PGP SIGNATURE-----

--u5tdsywsd4xqnlzl--

