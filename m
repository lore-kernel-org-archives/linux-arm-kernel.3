Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE263CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=; b=iVPnPAL7zXrDnZa76ZqEJrE90/
	MT0syDF6kButkzMMbvyOUUxTGnjvnpEJQLqG4HSzRrGAMgS0hIp600+EmrBXuWxm0kC/vid5iu6W8
	5n1QVlWJl4usHDbHc0NIITADa+Lx3j1U3pkJZUxyMHNQ1Z31VP2i/MyFBwkxbnoCwAMXEdFN53Kgq
	HRs9WVy9BRcEaTK3QVihUhqeQn/P40TBBPXHvq1id7DOqpAK0x9QvRLFuxQoosTqK0HA6KFNYKL3W
	r3x+Hh54oHoRwDkRJQGhFxd8RhNdXIsVDprU6CDU73P5KlTGMDnjC3GGlzqfD+8wb+axNu7J9l8nv
	RTt3h0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLZq-0000000BNMf-2XcX;
	Mon, 12 Oct 2026 19:20:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLZo-0000000BNM9-3YBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:20:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49ff680331aso17888975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832846; x=1792437646; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=;
        b=Q/B58gZKL1WsqEOK/EA3+s8k3j0X5cTKfntR/I9Yb4HpxxldF103bRZbvFD9XbqdDT
         XjjJamBjbj/gfFuKrqM4+Byy1Zmt1ifCv5BnvFpSYF8CAdkYu8jxxEuhcLyUt2fSUud8
         5oZwRCH52ZZ8ppIUJxvo99d1btQQggIY5iwLMVERIoTUipljsLh0bo6rbxprCYVdtLUM
         GA4oWzP8BeRX8JV8bNGXY6+BTNQysQB/OxOK4ffZt4zuzmcKYnn/dy8F+bABRkA0wwjg
         y7XlEzrphM6Qcc7M2k0r4Rdf3gAfQZU7LL/u9Q39Awqlw7Xume04zOSZNj5fj+17dUn8
         mtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832846; x=1792437646;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vua/rEuSC5nNbdHzcHkyGo/1ous9FXPDxfCyfc6JXZo=;
        b=tAlojDZnQxjmV0CcRBuxgdzeHIMAF86LSRRaukAD3+Dmq5nE2o7kByv/Fso/0RHG8x
         lF29oNrSLlb4zJDpvtAPkzE1/olfSDQ/DUGfEbscCtPgO8nbHwQu1GsSCqLLpNwccC/R
         NzsQEyJYTZpcc0Wx2S7k4+r4P0vW8cgiTRWWg6AZJfVCx+yv6bqfX8pzYewVouYOEK9o
         yLPqrqQfYIQA93wgs5UMf8laT/8fEqPcECrxwm8hUp1S4TYbZrRM9IGjdxDsgSvu6QD+
         IIorWiAzvqsEe7y1eRUIlhOKaIjNNqDnrOkcJRpzsewFXTLmog5uTawfBFOOu8HmmLVW
         k0sg==
X-Gm-Message-State: AFq9FYKJZjHmKqxkktCrkpEUESrrb7p5/KvqxCs2x0gR3AJhLI7ClnYA
	ak7Mk7BxXVnq+zhXRS2EHYnLlPN4IgS9oz7BeJ/su2k6qt2qkZYfvyI7DgOf+CQp6jw=
X-Gm-Gg: AYBFou08hwPHW/706l+ReIEKJX9fB0QCRszD47AA7y8NLx0uFH2qP089LOStyH28JRF
	KSjIG/TDaRp+UlRVfrcm8lUeFK87wGVXw5vgRnDHxqOEqgVDwHzc8l5N/D7okPn5juKOtAHyKUH
	vk6rgEnbjXnLcKePsBbWgxRdSHICtDplIIfjjWBXWUtJrpoCzJ8vxcEoIey2D2xR7DmhoVWPSE6
	0R5Ceuw29lyoYR0bEbhUNlDt9IVnEAz38KcJq1+WL0EIpTdB3NCHh4NBCv2V9KLJ7+MlRx/DN5F
	mwbo9zeqt9JumLwcyPRctS326Y5nNy0dd4Ld7+4LYNm9Vf8iRgL6qtv4W5Yg+APb5GQvhsjbGd8
	yASfmNP1C8A5sHQkPzbI5jyofgIWchmQpaX+VlXoMz8V3bYofkQ4Z0ek+DWQrJgWNtSg7w2Mx8h
	SooDR9WNUY+j41K+0BavUykA0v4yY8MDXKe7QSA19L+l/EzXzqbgvITQGAGcM0BNVjBux3k6n47
	5pSEm+flGaLv8ltQiNbEdqbMsL7fBoLLx/s/HHMs2bmLRdhe68lsiCq8WKYwgTXHZk=
X-Received: by 2002:a05:600c:e556:20b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a193fd0b12mr95118415e9.4.1791832846219;
        Mon, 12 Oct 2026 12:20:46 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm182472605e9.0.2026.10.12.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:20:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Mon, 12 Oct 2026 21:20:39 +0200
Message-ID: <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartgYuGsmX0Q9y6iZp1YqP84g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_122048_908852_9AF1DF4D 
X-CRM114-Status: GOOD (  16.04  )
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

--nextPartgYuGsmX0Q9y6iZp1YqP84g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 12 Oct 2026 21:20:39 +0200
Message-ID: <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Samstag, 10. Oktober 2026, 14:59:38 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> This series introduces mainline Linux support for the Sanechips (ZTE)
> ZX279128S SoC and the ZTE ZXHN H3600 Wi-Fi 6 router.
>=20
> The ZX279128S is a dual-core ARM Cortex-A9 network SoC with an ARM PL310 /
> L2C-310 outer cache controller, dual PCIe interfaces, a 5-port Gigabit
> Ethernet switch with hardware packet classification and flow offload,
> SPI-NAND flash controller, and DWC3 USB 2.0 host.

=46irst of all it is nice to see more interest in the ZTE zx hardware and i=
t=20
looks like there is a considerable driver reuse potential between zx27 and=
=20
zx29.

I replied to individual patches with technical points. For the PCIe and=20
Ethernet/MDIO parts I can't say much as I don't have experience with these=
=20
buses.

My overarching concern with the series is that it largely looks like an LLM=
=20
translation of ZTE's downstream sources. I don't see a problem with LLM use=
=20
per se, but the question is how well Navid understands the hardware and can=
=20
handle cases where ZTE's code is wrong or misleading (I certainly ran into=
=20
this on zx29) and make independent judgement calls.

What I'd like to see is an improved clock driver that fills some of the=20
hardware understanding gaps I pointed out in patch 7 and a pinmux driver th=
at=20
goes beyond a few hardcoded values.

Cheers,
Stefan
--nextPartgYuGsmX0Q9y6iZp1YqP84g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrNMwcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiD6kP/3dsABTCbqTpLj8QwVZf
wwDo+Mtm/Z6jC9QhNG1HcYuq1+/r8K2bLixqEC6uLbbFs9de5oZCiRsJmkLJPS01
1Yh1NXi4pc8dRoNMTmtsl3SfaQcHwB8ZmQd+ouxW2svc0cdk1knJn+XN1a0itXNC
0S0ocrBZZzg8f7olpzw78tEDHTmYnzr0wtzBS9PToG7ytdGJu3srIz8Cgv5TWJgv
2MovfWuhqhgKWj1aMns9LW5P1DnCpta4zEHEav7JNv7GKfUz5rJifnLVy1ILzqEo
6O2B9vQMDuh03vPNXSWHwper4S/8S64/loO2PeXluyiWSg6thjWrboVIBr09rdlx
VPAE8taO9xTT0DShNA7Fjdoy7rYrvbFrDK8FHcggcgt+fCFdIgZ0rdZ9qhaRX57i
udz9Sbm3Lhf5862HhJNsz6CpIwZflBNSyZqNSmyo1eUpMCTvMOHeDhKM4mFUsw7U
1G8Lb1BbmqihgkYC7NfMK1c7z6hxuIcUWSEJPn10I69hwy3XnP/hKOQGLMa/p8C3
r4V611KUsCMDTvnC9z4tzjypVZy0ZvjqLiWHexLMKSAy8MEhfvfuBPsmMoJTXGsp
bySs9usMYeIKlvJnDtaES9lvdm7K3umj8ZTRHJdAqp0TnaNi5586F/v5nPI5UjpJ
KV+ZXscQ3kiY3gtKRT/yJ+EM
=vU03
-----END PGP SIGNATURE-----

--nextPartgYuGsmX0Q9y6iZp1YqP84g--




