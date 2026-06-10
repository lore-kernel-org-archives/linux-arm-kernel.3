Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3426CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=; b=aVJk6kKKJvUqDIu81DevwyWQnJ
	ex7qqKamDYUSFkv/uRKf5UcEmL2kCMFvsHR1orlFUhRXHlmwbipup+kRw8Abs76NfPrexnHXCatXP
	Z+pw/FD1ZbtVv3vHOFvQFINqgf3+qjPxwOiyDl63n92rkor0ziCPbTTIDSlhwteKtzvWcTJtsKmQj
	ja9xZKweaW9ksd1NyhA39DFlKFS9xcxxxiJPTRQRMfRUa8ZNT3NTDfrj+r4+IBf/RlBG5Xwr0kEeq
	JhENQyKWWpypTCmjg+9HT4vy6pFWt/XHfP6WByKPEDBEUU15fJkHMAlFOdp7uYixXJXDIr2hnnLm7
	BV020R0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMGn-00000008ASw-2Paq;
	Wed, 10 Jun 2026 16:59:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMGj-00000008ASB-3HZx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 16:59:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4908b92904fso80528855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 09:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781110748; x=1781715548; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=;
        b=d5iclKvNK0VertjL+SyV0SUsyQtyfzBCQ7uNs0f+IbvgAncQoahc883HG1XkNoBTJ3
         80REkQ/uavx22JVhJHQhKuqWme50IY2E6RlyyBB1THocvUOHsW/wDLTMCv0GJsgQiE+K
         Hyotdrejf8Ru/zbdV1BMsOen2gMkqmGtCnwYaMkkidzX5zdtObtPANP4mbkpZc5dG861
         FzoRcxDd7dAVqnawXF31dGuM83X6rnN/9jmIntdCwhruI5MX7Aw2Hwgf3py7pxkjRM9L
         TvRlvAaeV+QVNIXrtGBKzsenioYZzhUK7G5DhMaQsdhIpn8Usy+EsIrQPX/zNVJrG8Ej
         sPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110748; x=1781715548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVyyrVts4pyEF2ndHUxmpv1aAAxrSJxcFaTJx8fYUog=;
        b=HtY1tI+Pij8cc0/p15PMgqVDh4QVsT1QP/2JwFbh6Xyj2uhchgW2tsPd7iZ1Zb2IPB
         Trjky75gy5mJqupHy4gPHNp4Du8Kt9u48XiYO08nB8xZuyrSUoqiRn5J1bS9F6lZLpJt
         plKxEiaE3YDDikJRK2DgKUpCYoPsjSdz1s+Fyq4Q8T2uUDFRrWl/0APG6qx815mdn8CD
         r1Iy4RIBE+O7vsWFDfnLwtTldeiabTf/DR1IzaNF7H8NkAWtfqhSMts9cHro+H4wdImn
         D1nSoqHA2uur0Ddrq8dfyZGdZSHsqlyV6L1VPoQEA/X7d5qqf1Y+ZSxJiurJZFY2eBCo
         tTpg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZOaKNM0kXuNkAAQX8KPRBXy29Rke2H0LF/WYdNvZ3eRxHYk1B+sFkRQKkzPyTD1CpFqgWcAVFT6Chq7/c+C+w@lists.infradead.org
X-Gm-Message-State: AOJu0YxXvvEnvZDDm5A2+VD6Duz6yl6duYP+/IVQjf8wl/xCvmowWqeT
	Z7G1AIXvHKVz7S4mqgA9SyrrpGVjHbgkydEfGWz/vRuRhvi1uJkP+W261Qs1W9S8kks=
X-Gm-Gg: Acq92OF6FInqKNszkQAUu+qRR8DKte5bslBT1Umawg/4+p+Tt3brU9giUjEd4wyZ9zM
	pJEkj3T5GcbuYnttQpJGMwY8RIQmbhiTX1/SSDt3Pq8RLRha+38BaY3gWW4/Q0ATQKdfE561qOs
	g2oP5Ywtg9XOHhG/VOZR+5hcNabzZABQ3upCJQq6L6MSviiRcoImRiR12Oa0bUbfWfhMa1V8nI7
	7UKO/iBrGgd0rQwUxekA+rk2nx4CaMsSNWYjyg6sD6NPN9MLyB1meU+Y6+jA10wailBobJ6YHNU
	36rC9XCdjZCXn9S3iTbo6PjNP5IWLpug6Zrm8d/2nwg4FBLnKvjuwkY/paX+PZd9/MtUID7bTc7
	1PDIn8JQq4YRiM6d9acPoJ+4e6sDfxVLtkPybhllBcg2kEPwmMUyXNcEocQwm/+xLju++XxAesr
	NASU9NOFqLaXbWeDg263cf06CBt61pIhEOao3p9Xwd8NTzxSXIv18iFIm9s6R7+RrLKxjkeQnr2
	d2OzK6hB1b8nnv90eTTwECXcg==
X-Received: by 2002:a05:600c:674f:b0:490:6e11:c303 with SMTP id 5b1f17b1804b1-490c25ed266mr430620245e9.13.1781110747684;
        Wed, 10 Jun 2026 09:59:07 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f344762sm78016031f8f.23.2026.06.10.09.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:59:06 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:59:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <aimXkX4FC4JVxt6q@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3msjhzytjrmzyqmh"
Content-Disposition: inline
In-Reply-To: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_095909_848760_E5CD04D1 
X-CRM114-Status: GOOD (  18.04  )
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


--3msjhzytjrmzyqmh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Initializing a struct using list initializers is hard to read, compared
> to that using named initializers is more ideomatic. Convert the macro
> used to assign values in the driver's pci_device_id array accordingly.
>=20
> This change doesn't introduce any changes to the compiled array on an
> x86 and an arm64 build.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> this is a preparing change for making struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre=
=2Ecom/).
> This requires named initializers for .driver_data. But even without that
> this is a nice cleanup making the macro better readable.
>=20
> Gcc is happy with simplifying the assignment further using
> PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
> because PCI_VDEVICE also assigns .class and .class_mask (using list
> initializers), so I didn't convert that.

In the meantime I learned that doing that would break W=3D1 builds, so it
was a good choice to not go that path.

> Once all pci_device_id use
> named initializers, the two zeros can be dropped from PCI_VDEVICE and
> this entry simplified accordingly.

Is this patch still on someone's radar? Ideally for application in time
for 7.2-rc1?

Best regards
Uwe

--3msjhzytjrmzyqmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopl9QACgkQj4D7WH0S
/k4iqggAj3aeMF621GTGpJEHIqnNARfBAqngiHflYRiIhmKykwRxpBFaMIbsMmcs
qaS9NHLpxehcieZKUsjtuHpxJ6kc8//qqgRhfwcBdzpgoWz+eFyjxaIXavQ1z87b
k8YJJ6J5VNFnXKiZT4pBl1W7c3eWF+kCoq8UYyNHvI/cE1CCAd7qR5gprTFiZHkS
xH+/9H//w9KQEGL8tDXY2q2s0QSwThwPnABCbIl2gzwsnU/MhM73oQW+DhH1WaRy
rfclH5p/FfkqtITu8CqaDd2hAxtn3KVvBCbQRNHYk6nGHQnxWMnl9fOCSVMu+3HT
mPViuT/eGfETuUtngl9g2o6whmonPw==
=hiX3
-----END PGP SIGNATURE-----

--3msjhzytjrmzyqmh--

