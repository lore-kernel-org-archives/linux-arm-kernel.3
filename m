Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA59F531E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBVWguG7RdZeq+1mTENU3jp7ImGFi/k9ptHm/Np7hXs=; b=bI8Og0M33vN2u5TrXb1EXE2Ho8
	e6XgVYHlp91bdp7E3oEX/4pDYvCLdpzWGOhBR+2CmhPhZOUgP1XV8YnvZrq3MwL75+TI8u/ZpJ9HR
	k2plHZTFc59TsXnb09qkw51MwHLaH7cFI3JAB8efMmEuYduUftm8m+phbpzvozccdUXd8He1IgWJK
	iQRn7YNWhMiGAd1pirAg50LKf1IH7zwGQ0t8n0LJfyBj56+Fge9IgGd9wXa6ZpIBXFB6K7l6p2yqC
	79A+jiEhIjB7PLxPBIy3i5ry2Th6vzN3mydA9ABNDMNNflvl63yZh+C9UhdVTN1ElOez27nHd1iYD
	kdTz4Vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwDa-00000000sCu-22Lh;
	Wed, 15 Apr 2026 09:07:30 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwDX-00000000sCY-2ayF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 09:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GBVWguG7RdZeq+1mTENU3jp7ImGFi/k9ptHm/Np7hXs=; b=Tefzh+47t6l6/khyFeSKGS/lcJ
	QJmitHEa6gYvJZ/aRnkk+C/TDK11jfN+M1ErYLE5EiP9jjlnl3g+uQ3fS6+l9GJfKGmb9GObDNPIP
	7K1B8mZCbDoFjUVeacG+sNRY5yS71xQvuMTYFd3k2sNTRDy7S9y39j7gAFGnMnYtDbj/QaADSznap
	Ub3FT+H5tF6in7evc6KVfUYw61kB60ZtYKeYtuv2Ug03bdb6bGEw6OBbhef4ND1zMb2NAF/HDp8wY
	EvPa0yvTkLZho/REcEmHJ7I6pmND7rBUY9p1FFv17tG+oTvixJjNIFSFFZYn80SZO2EG825bTObaI
	wHKie+Og==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCwDR-000ET6-1f;
	Wed, 15 Apr 2026 11:07:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wCwDR-000KjI-17;
	Wed, 15 Apr 2026 11:07:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the
 hwcaps
Date: Wed, 15 Apr 2026 11:07:20 +0200
Message-ID: <5941978.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ad9H0BiD4le07P-a@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <8745494.GXAFRqVoOG@steina-w> <ad9H0BiD4le07P-a@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27972/Wed Apr 15 08:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_020727_788527_05848975 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Catalin,

Am Mittwoch, 15. April 2026, 10:09:52 CEST schrieb Catalin Marinas:
> On Wed, Apr 15, 2026 at 08:24:22AM +0200, Alexander Stein wrote:
> > Am Montag, 2. M=E4rz 2026, 23:53:16 CEST schrieb Mark Brown:
> > > Currently for each hwcap we define both the HWCAPn_NAME definition wh=
ich is
> > > exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definiti=
on
> > > which we use internally. This is tedious and repetitive, instead use a
> > > script to generate the KERNEL_HWCAP_ definitions from the UAPI defini=
tions.
> > >=20
> > > No functional changes intended.
> >=20
> > Somehow this change causes to delete and generate kernel-hwcap.h on each
> > make call. This results in compiling essentially everything each time.
>=20
> Does this fix it:
>=20
> https://lore.kernel.org/r/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@=
kernel.org
>=20
> It's queued, it will go in before -rc1.

Ah, I didn't notice that. Thanks. Works for me.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



