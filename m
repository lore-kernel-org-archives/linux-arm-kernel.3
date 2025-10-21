Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F8CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; b=nFIG0V3dOurQ7X2FTNopkwkJQx
	tqjIYiWyzmgHRHh2/cJVrXgZnZp0M9sjxWUcYhzYc9qEknHTlgsVkxFwETCaHwKT/4XU/ftUuhfiz
	8Dl1rw2Ob/iQMl6viqTL9LXYx14g50Ig1bhlZ8ibbCBZmYWdN8tAGPHlPOIq7eMybJYQclqvQafrd
	ffODZXbSygcqS44cd7zPKfkb0Vb8EQlc6LSwVZi61He/bkctzZ0tTTAFBbHNsPu7tIvRfDMUwGvNL
	vkzFYoVdnQWIZPkx7IuVsXr3pdo+1nXEw9DLd99TBZ/tKUoo2NRkRTOVj2jWzSCV6FL9llYyJk2jB
	Zlf3+BAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9HZ-0000000GZ10-0J0Z;
	Tue, 21 Oct 2025 10:07:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9HX-0000000GZ0Y-1iJY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Oct 2025 10:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; b=RMXa4xsrFdoT5w9r4ywHbQ/XIe
	F55QjxMv2sPlPIi+WIkgzFBhO8eX9l3COIjjkdprK+UDDprUjSPnfuLozT0Cxs7AOlvIO7VQv7hhL
	RkVe3gZ7al3KfvaupJqBLqyBB7ySJzCHYSvIhn01eOdWYJvrT5VzYXxFfVYzG9ZHM4NvlGoGUnENC
	1rBN4wcIhY9RcDpDxcT9F20v3zHug69wTVYhXcb2Yf+qJiDAQ5OotEradKQfyTs6RkJpROL8/53pW
	AcvtaNiFxTWCpFdG/PGyiNe/O1bytDscEjp9U/oWqwCbynPvM0kzt5BgPGGzyx/gfy51Gi0qr8n1p
	2xJ042rg==;
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Pl-00000000f2a-3PXb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:12:25 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761041238;
 b=SxjOl36hVI4WgcjLtqBnhmTc4vwxUdWtdcGubiy7L1/lKlhJzC9WX6ikwcZzpIO26W5nMx++
 089L5jgq7FCcmcCOHWfOLYaYWLOEVI385Uk97G9PjbK99g69CK605Wrhi/ZSoLSSTGMxJlxgiEe
 aRzGywlCqwtAk7NUy0uLskqzitATO2CqW+eMoFdQlDD2resfaKcCpXw0iSlrNTrD+AgssjPfzoq
 FREkNV9IoECz6MwxCGH/rbhrExk8we5DAjuRH5TT7d6oi5/BGKRe095pbBBi97LZeS36T53p2HY
 GhqJiiJ9XRJbCXjjdZKTJ5uFGoRFX28HN6WZU7TyyOLHQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761041238;
 b=ff1QtYxtzs0zfHWKbKlZZXK5cF8ocUOyHgqZ+x4pGyG/WhyM7sY1C4aI+fu8iZwYUzYbuw5v
 hNsxuceb6BShBREe+8RDSE6EdEx2DzN6J8fkmkD/MHIxNoPEhTf0nh/UgiUxuZEh29IliA8luIe
 ddDJTDBAV+5zX3Eq0BszrY8pyerZ4VIpGTL9f1m5E7gZp3XIyWtkJKEbGKwe0jwBXaHA4eNmab9
 7X55pidnYkeVugXcGDcqipr1S/byeBb8DSdTlOs1HGizBT5JDLLgu318gZRoWAIY4VwIpIoh3aO
 0FMVYD/08oA7aoXe8wVTZh02Gp2d4rzfC36uadn3Hvrcw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 21 Oct 2025 12:07:18 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D25185A0EFE;
	Tue, 21 Oct 2025 12:06:32 +0200 (CEST)
Message-ID: <1a849a0b515c77faebe28456d6537d39d4ca32d0.camel@ew.tq-group.com>
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Francesco Dolcini
	 <francesco@dolcini.it>
Cc: Hiago De Franco <hiagofranco@gmail.com>, nm@ti.com, vigneshr@ti.com, 
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
 jm@ti.com, d-gole@ti.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org, Robert
 Nelson <robertcnelson@gmail.com>,  =?ISO-8859-1?Q?Jo=E3o?= Paulo
 =?ISO-8859-1?Q?Gon=E7alves?= <joao.goncalves@toradex.com>, Emanuele Ghidoli
 <emanuele.ghidoli@toradex.com>,  Francesco Dolcini
 <francesco.dolcini@toradex.com>, Logan Bristol <logan.bristol@utexas.edu>,
 Josua Mayer <josua@solid-run.com>, John Ma <jma@phytec.com>, Nathan
 Morrisson <nmorrisson@phytec.com>, Garrett Giordano <ggiordano@phytec.com>,
 Matt McKee <mmckee@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, Max
 Krummenacher <max.krummenacher@toradex.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Hiago De Franco
 <hiago.franco@toradex.com>,  Diogo Ivo <diogo.ivo@siemens.com>, Li Hua Qian
 <huaqian.li@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Baocheng Su
 <baocheng.su@siemens.com>, Benedikt Niedermayr
 <benedikt.niedermayr@siemens.com>, regressions@lists.linux.dev
Date: Tue, 21 Oct 2025 12:06:32 +0200
In-Reply-To: <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
	 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
	 <20251021093420.GA28462@francesco-nb>
	 <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4crScp6Fzyz4MZyc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0a2fbe90152789f9a2452f0c191400a4
X-cloud-security: scantime:2.520
DKIM-Signature: a=rsa-sha256;
 bh=jofrQ0T7wEpqVhNL9sL4aUoJ4MX3kqIvOomYczAKOzs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761041237; v=1;
 b=RSF7OA7nTt0mCG+6D9qCAy/DmgdVzey4oMinm2hxmBzVc7D49WyNvWE1eFN9hsdtVMt0JndP
 AbEfEERnwz5Sg3Ey/jB5ISKWgFXFWqMh36MwuwNhJ/Slmyn91jotCcJsGuC65CoMDwa5tcwOeL1
 Y5SDxPEHUsSVSeFKcBUxVZecG1VOuyuKfnT7rfc9c3QhtJWmPMdHXkIFJut44YwTsVhcOp19Orl
 qJQktQle/I0mjGvfZHD66PflftA4qnFeNGU1PoimDYzNlAsKqNpRb/RU4PKUHnJibl+D5fdmP+J
 eZCSjL9AxbH8Ig2Pm94z45shYiKa2PPQAKmyEHyPu4yIg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_101222_574380_BCFE632A 
X-CRM114-Status: GOOD (  37.59  )
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

On Tue, 2025-10-21 at 15:26 +0530, Beleswar Prasad Padhi wrote:
> On 21/10/25 15:04, Francesco Dolcini wrote:
> > On Tue, Oct 21, 2025 at 02:33:10PM +0530, Beleswar Prasad Padhi wrote:
> > > On 20/10/25 19:47, Hiago De Franco wrote:
> > > > DM R5 sends a message that is never consumed, since no firmware is
> > > > running on the M4 (the core is offline).
> > >=20
> > > May I know why you are not running any firmware on the M4
> > > rproc? If the intention is just to run the DM R5 core on the SoC,
> > > you can disable the IPC by NOT including the
> > > "k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
> > > refactoring.
> > Verdin AM62 and AM62P are generic SoMs, that can be used for a multitud=
e
> > of different use cases. And not having anything running on the M4 is th=
e
> > default use case.
>=20
>=20
> If not having anything on M4 is the default use case, it should
> be marked as "status=3Ddisabled" in the DT.
>=20
> >=20
> > I think having the node in the DT is the correct way forward, if you
> > want to start the M4 firmware you need such a node, so this is enabling
> > a valid and useful use case.
>=20
>=20
> Having the node is fine, you can still choose to keep it
> disabled by default.

I agree with Francenso that it would be nice to keep the node enabled by de=
fault
- whether something is running on the M4 can be controlled via sysfs after =
all,
and may change over the runtime of the OS.

On our TQ starterkit mainboards, we'd like to provide the option to build t=
he
BSP with or without M4 firmware without having to modify the DTS (which is
supposed to describe the hardware after all - I'm aware that this principle=
 has
its limits, as the DT also needs to reserve memory ranges for MCU firmware
usage, but having a few unused memory reservations isn't as disruptive as
breaking suspend when the M4 is not running).

Best,
Matthias


>=20
> >=20
> > > List of suggestions/solutions in order of preference:
> > > 1. If no intention to enable IPC on rprocs:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Do _not_ include k3-am62-ti-ipc-firmwa=
re.dtsi
> > > 2. If intention is to enable IPC on rprocs:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Make sure rproc firmware is available =
in rootfs.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rproc would boot up and consume the mb=
ox
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg, suspend would be successful. Test=
ed this
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on TI AM62x-sk with commit 1d6161617c,=
 works
> > > 3. Add support in mbox driver to flush the pending
> > > =C2=A0=C2=A0=C2=A0 queues.
> > 2 is not applicable here, and 1 to me is not a good solution.
>=20
>=20
> Why not? Why would you power on the rproc, enable
> the mailboxes, carveout some memory if you never
> intend to use it?
>=20
> >  So this
> > means that we need #3.
> >=20
> > > > #regzbot introduced: 1d6161617c
> > > Would not see this as a regression, but rather a new
> > > bug for the omap-mailbox driver...
> > As a user this is just a regression. It worked fine before, it's not
> > working anymore now.
>=20
>=20
> Isn't this partly dependent on the filesystem as well?
> You would not see this behavior if you package the
> firmware in rootfs, which I assume you did while
> testing a49f991e740f
>=20
> https://lore.kernel.org/all/20250908142826.1828676-17-b-padhi@ti.com/
>=20
> >=20
> > The fact that the solution might not be in the same file that introduce=
d
> > the issue is not a reason for this not being considered a regression.
> >=20
> > Francesco
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

