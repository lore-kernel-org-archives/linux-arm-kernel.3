Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C831C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpyC3Ong0XEw6yUyjbMxYLFRBftcrZnvgjpAJ6L3cTc=; b=ai65Tr9GZgG1I6tzMQzjmEJTgM
	HuODAO6oS94HrTsagt/qb+/srcVN05oWlme2BohpGw/nRj67BHnEvH8wMg81jSLeH4U5XI8IfAmgh
	yWdWc+VH6CTza+B6rISX0WoP2pxuEF2jRC5Ykdh6MfIuE2cwnLKYpCHYm18mmyCPEDfUeKbZzK84I
	Shh/RMRqz1V3M7W2Qng5depeGMwQVcUzGgNzfE9rgP1mRtBlWjE4FI9NWUJkn4+CYSb1M5abi6a0K
	HKDdsi+pU2Nwk1NP+1YTugN1H16qr6iAmBWu1Z2CRTbPUEQDun60W+CAZGFQ22lSO7GTd1M1936tf
	QEX9IWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1er-00000007iSJ-10wc;
	Wed, 16 Jul 2025 12:54:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1ah-00000007hpO-0Xhy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76039448B9;
	Wed, 16 Jul 2025 12:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03F0C4CEF0;
	Wed, 16 Jul 2025 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752670230;
	bh=PbBIYKj8a/DhaiHCqQ0+OmhTdUwsQip8rGJvIcX1TpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Es7KLKRNP2SKOx0Ri4M994NG+tynvzW1d+7SwEfzYzSZoq+V4OAy/+oX15BBNlZ5d
	 yJz/vbVxZLi+w99DAPZUX6NuLfnsvR3x4l8E3zKn2Sa5tYaoHJddimLDs1L03UXfg/
	 7J5HofYlNMtND7M296kuLs/Bze4OKA3ogXD7dqGf/vise6f++any8r5UhGVXsNY53L
	 Y2+RW5vf18zXVlzpogliFFent0DVWcz5MLU8n+vUdE1tyklFDOKGXY74S5TKaPdqRd
	 nic2gUlE2k5dzLq/JQNfMP+SueV0cbfmydFOlQfwl02Dg4Y1DyRr1c3dgAXFy42JV+
	 o8d+4HMT5feTw==
Date: Wed, 16 Jul 2025 13:50:22 +0100
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
Message-ID: <3a9504d1-2c6a-459a-a98e-3010d34b546c@sirena.org.uk>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
 <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
 <eb5feef3-0a7d-438c-9dbb-00d1d72fad66@samsung.com>
 <6bee5ae0-2a9e-4793-a5bd-9e6c72b03f27@sirena.org.uk>
 <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x0KSMljrFH4DixiE"
Content-Disposition: inline
In-Reply-To: <20250716142933-41089f40-0628-4821-83a3-fddbd4c4f9bf@linutronix.de>
X-Cookie: osteopornosis:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_055031_208703_DF6C3F7B 
X-CRM114-Status: GOOD (  17.77  )
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


--x0KSMljrFH4DixiE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 02:34:52PM +0200, Thomas Wei=DFschuh wrote:
> On Wed, Jul 16, 2025 at 01:25:06PM +0100, Mark Brown wrote:

> > This issue has been present in -next for a week and is causing a bunch
> > of disruption to tests that end up relying on the vDSO - do we have any
> > news on getting a fix merged?  Perhaps it makes sense for Marek to just
> > send his patch so that it's there if needed?

> That fix has been in -next since next-20250710.
> If you still have issues, I'll take a look.

Ah, sorry - I'd not seen followup mails in the thread and was still
seeing issues that appeared at the same time that had previously
bisected here.  One is:

| INFO: Generating a skipfile based on /lava-4170058/1/tests/6_kselftest-de=
v-errlogs/automated/linux/kselftest/skipfile-lkft.yaml
| fatal error: nanotime returning zero
| goroutine 1 [running, locked to thread]:
| runtime.throw(0x132d83, 0x17)
| 	/usr/lib/golang/src/runtime/panic.go:774 +0x5c fp=3D0x42c7a4 sp=3D0x42c7=
90 pc=3D0x3b740
| runtime.main()
| 	/usr/lib/golang/src/runtime/proc.go:152 +0x350 fp=3D0x42c7e4 sp=3D0x42c7=
a4 pc=3D0x3d308
|A runtime.goexit()
| 	/usr/lib/golang/src/runtime/asm_arm.s:868 +0x4 fp=3D0x42c7e4 sp=3D0x42c7=
e4 pc=3D0x645dc
| ERROR: skipgen failed to generate a skipfile: 2

I'll just kick of a clean bisect for that and see what it comes up with.

Full log:

  https://validation.linaro.org/scheduler/job/4170058#L2215

--x0KSMljrFH4DixiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh3oA4ACgkQJNaLcl1U
h9DwZwf9E3TvH0p7biRSX/IC0rBSEc74B1Z8w9/tFm7w3pkwqx9Bi9cbfN7bl95N
XOCtYoDsnXINhVSynYuPURgHY6hKbntS4r4UaS1e3+3Z+TTgjfbvvDp/3s3Aj0tO
bdu/c6Ip8Zy22FmmcZJKm1PoPwDG0OZrl0dgCBy1xCKCj0jkxRsiu+0q+oAxDHl9
8K0V7oUITUtblhOVc4ADk3ESHRXuNBhPqRBGFS4E0CgVunCpOdND1T1jg2AqLDad
3hVOXuoe1FcKXPd9+6Cvq5bQYEZtALZDoWl/Re4gVc0c2N4CVyzPei/29w00gBO8
3TKIiTL2tMB/0gkgpIGv2gqsHILS4A==
=NGo9
-----END PGP SIGNATURE-----

--x0KSMljrFH4DixiE--

