Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB6C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4odthgpL669trIYuGSc79a2PbDMDTzqM0a0YUOGgrG4=; b=WrWv9j3onT0u2IlGrhK8xcq/hB
	FI4R2/WHE1xNnmj3656aCNJClkihCGLnhnrMK9izdVAKW43hVU9lcaxp4Mw0CyjuAz13XAdy6smmn
	+C+0CjHKiy17/rnpJ7gDt5Fif7RUfaYIoiiDslny1G2xC1Ezjld66ej0jcjvDkICIp/2rLfEnwQo1
	DyNJP30TXx5mygJjwmHJA+6lmvEBHqnsbqMIzsoctPrcBArJts/tg9Guu1h1VESZKuJB1BZXMUMHM
	/6dhYMPYYu26yLytfg5I9XtRLc9bpFrnJH23uJf1Jlcwj2gahwGASl5Z2Focu5AVzn4iwTwKn9wdv
	wxYA6D/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQv3-00000003Pps-0BQp;
	Thu, 31 Jul 2025 10:53:53 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQpF-00000003P9d-3dey
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 10:47:56 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1753958869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4odthgpL669trIYuGSc79a2PbDMDTzqM0a0YUOGgrG4=;
	b=qIN3qzqyLEa3z9iZDs4OBiMyEkwfOUm9Rgo0ugEyNNN9bQxGrV7mMmEe7UJSpU2oEYInKA
	kXO5MgJsKXAsjT/ZVYgAxzSdHgrLstMXufy/zJIML0jm1K5GcgSCskrDrRb1VPkibOvLqX
	yQhgIv7EQHp3NYwluIZ2zZ40zpaT0sYyEEoeQkqEfwB3jG4nuJDmd9BNp2PnTkkXn/aTq8
	mD49PYVQmnTWzczEcBPucD9wKrC+VJzmCo0/J6NFqq9x4FvnWon/5NljRHsntow0ithW7Q
	Gi/6M3de/t7h9ADLPGf5p2lYEQ2U8QFdPaK0Ew6QE8v9wQyJswlZbZroRG48Vw==
Content-Type: multipart/signed;
 boundary=0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 31 Jul 2025 12:47:31 +0200
Message-Id: <DBQ6ISOKV0XR.22W3OAALUKIHQ@cknow.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, <linux-leds@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: BUG: Circular locking dependency on netdev led trigger on
 NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dragan Simic" <dsimic@manjaro.org>, "Robin Murphy"
 <robin.murphy@arm.com>
References: <DBLBPIBKFCJV.36AVW8JY88L7H@cknow.org>
 <6817efe1-f2c2-4686-bdf1-fca11f066e3a@arm.com>
 <475ee9ae8cdca5ce86b708fe0ade7c9d@manjaro.org>
In-Reply-To: <475ee9ae8cdca5ce86b708fe0ade7c9d@manjaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_034754_719129_21B3C15D 
X-CRM114-Status: GOOD (  11.03  )
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

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 30, 2025 at 9:50 PM CEST, Dragan Simic wrote:
> I've spent some time digging through the LED subsystem, which I'm
> already somewhat familiar with, and I think I've narrowed down the
> root cause of this deadlock.
>
> I'll send a preliminary patch soon, after I make sure that the root
> cause is identified correctly, and I hope Diederik will be willing
> to test the patch.  If so, and if the patch checks out to be the
> cure, I'll prepare and submit a proper patch, of course.

Sure, but AFAIC you can send it to the ML(s) directly as well.
Please do CC me as I'm only subscribed to the linux-rockchip ML.

Cheers,
  Diederik

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaItJxQAKCRDXblvOeH7b
bi5gAQCxYSZt1DjQ/NWu1cowGv/jz0IMEd2jlu0r9jnSjHLQuAEAo0Kmyapy/Pgp
ro+OUyTrc2A4aBmU2frzWFW+zmcZtAc=
=jZT0
-----END PGP SIGNATURE-----

--0b38981bb829eebfafe48a04f99efa1bdb4b30b7bde156f6b84f4be44d26--

