Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E83FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPLBEuuhIxrHhRwVX/zuYKW/i7YKx1Cyd/zAXxeOPcU=; b=VCENaZmjgy1Lh4wITqAIwdu0k6
	aUtVHMRNyKU2bTXsbquc1EUMyYEXP698/wWfm14Y5V+1CANjROIDAFm5OUGKIS1J3Ii3PrJnwRSxJ
	N8mZP+oWQMBZJdyHDGoiW6uvdxh/EwIGtegLfoZNnPMJyTvTXB34MXfTxrhLIHpAc3xuW9nIHZmwZ
	mRmGy6V1tkwo5KjR9jyfRP1UiUlHUkqF3L/89QymubjGYmweBgJ1afOeC8RHwam4VfsMToNHdBEz3
	vxyBBOMaF4LJeLoqq4dpVq9VhzfoykgZ4EoT9fJkooiBqriUdugMQICWbA/V8QIqQ9cyV7QeV1F0z
	RvpOHkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3IN-00000007vh5-3MiV;
	Wed, 16 Jul 2025 14:39:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3E6-00000007vDc-0Nwo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D9C45C2753;
	Wed, 16 Jul 2025 14:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14A3C4CEEB;
	Wed, 16 Jul 2025 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752676517;
	bh=m6dMr4mmc+ehuhuOcxxv5TIdC9hKtCvMg4Uo67cqnrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dt45FC45lr4Y5Yj3uPvtIZIp6ciObQ9O2GVHJqBWqI/DLPZcpWsBg+1utqSq+YDw+
	 TTJ19/zC3kTV+soJUz1OQg6F20EoxtqkYFznrlG07TYT9OwefLF+uUOoxgh73ZfBBh
	 8SLneOMyK6P6c1iwB2WDkSzSjY245qEG5+H7F2QqcQx2Mh9mjqPlZFwKhRcF5+24Ct
	 cNsz5f+KIF7vHtSZJm9SAA2iNaGsi09yJS4bgJ5Rq9l9ZvQpLb37Tq3YiEMeKhwgUF
	 3O9gxF1imLn9OunEnp/rcY/rLf2AqX97EG5ibd/BdzyrfVM1RgO08vlXbJqogYNczt
	 9YD87lNN0ufMw==
Date: Wed, 16 Jul 2025 15:35:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Christopher Hall <christopher.s.hall@intel.com>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Werner Abt <werner.abt@meinberg-usa.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
Message-ID: <69499cb9-b13b-4eec-a7c4-c219a77c6260@sirena.org.uk>
References: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
 <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
 <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
 <3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
 <20250716152041-189100b1-7f5e-4388-8ada-b79ec09d18f5@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BuIqEQ3Xb0IJOloe"
Content-Disposition: inline
In-Reply-To: <20250716152041-189100b1-7f5e-4388-8ada-b79ec09d18f5@linutronix.de>
X-Cookie: osteopornosis:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_073518_221714_2A2307BD 
X-CRM114-Status: GOOD (  16.70  )
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


--BuIqEQ3Xb0IJOloe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 03:23:24PM +0200, Thomas Wei=DFschuh wrote:

> Can you try the following?
> I missed this despite the double-checking after the last reported issue.

I needed to fix that up a bit, it was missing an update of the final ret
in the function and didn't apply directly to -next for some reason so I
had to manually apply but it seems to do the trick, thanks!

Tested-by: Mark Brown <broonie@kernel.org>

with this against -next:

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 97aa9059a5c97..487e3458e536e 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -365,18 +365,18 @@ __cvdso_clock_gettime32_data(const struct vdso_time_d=
ata *vd, clockid_t clock,
 			     struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret;
+	bool ok;
=20
-	ret =3D __cvdso_clock_gettime_common(vd, clock, &ts);
+	ok =3D __cvdso_clock_gettime_common(vd, clock, &ts);
=20
-	if (unlikely(ret))
+	if (unlikely(!ok))
 		return clock_gettime32_fallback(clock, res);
=20
-	/* For ret =3D=3D 0 */
+	/* For ok =3D=3D true */
 	res->tv_sec =3D ts.tv_sec;
 	res->tv_nsec =3D ts.tv_nsec;
=20
-	return ret;
+	return 0;
 }
=20
 static __maybe_unused int

--BuIqEQ3Xb0IJOloe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh3uJ0ACgkQJNaLcl1U
h9CA4Af/Tjt27XD+sH0XsHGiqrvVkfVxva7ofqhkGScEh/mKgfSbmkbXHANzMMcN
i0cqh+YA1JvkdO9PRMQKygFdjOmHF6f8fLJ89tv362PI4fWlABSmiorpUwrX/J76
1DnAJBk3+BI/Ea4E5KVldzfU+figgDJeX1YWeicBcnGCnMrdHPub+24Wgclm4MIs
mxPCfZnczo7mLioF3QxjetxtWIFrsPNxoRJp7kJN0Kyz6lGJQBmZc+dY1UzEVtyR
GBCX/hWkjFxJzX9EBQ3d7C/LgP6AuvykylzYC2M5AZC9TOzvRpEhjp6WGJHCRrwa
K72ju7AAJ/9Vit9ykmOIMbQUpAZUYA==
=rAsr
-----END PGP SIGNATURE-----

--BuIqEQ3Xb0IJOloe--

