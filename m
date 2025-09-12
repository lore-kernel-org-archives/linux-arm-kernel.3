Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92867CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jgluz1VB/1G/DYBTfp7Su1oyZjWlvzq3TKFpkBLruI4=; b=L9jXxTp83qXSYmUGAABWdPMu+c
	3xOZWI6zzzESpHBdqr/edvL5mU0c7v2dqejG57FEGfCrbdsU5xxkEN3JGmKic1Tt7sW89VzhhGI7f
	unsPm4D7EJRmPVHAAkRJ6VSFftgcskX2YLaQIYtu+OwAk9FBzwR0TM8ZxV+vEMGbcAtm6MPHwzA1Q
	/OA7oMwHxLYLKp/CmcjOrYBkqWwYVD5JduUSPMh2vORwDUVitay+nP5arv56Vr7MhoRa/axl+zSkp
	UJQlU8+2P3aPCfAlsFpzzuRE5MiUYaEhgWEWduRrmy4bCht6ukyntSzr4zdkb3+Z/3/7Ncx7T3Y6c
	pNew7rkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8qX-0000000B61r-3BAJ;
	Fri, 12 Sep 2025 18:50:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8qU-0000000B61O-2mKn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702987; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MMStU+3hRtzkLorSu8cvhj4yj9QKVpW2KU9+rsL9jBT5Moof9YaOUbirSYeUkrghwp/a1hkQLMuTeonRBEN8NBKAGE49gePu8sZCHHfA4XCbnAEryr0NfjpLRoTVekNkGRH1m/LD5p6nnpZ1E8tYDvgSHl4h5FhVoemmVsFA96c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702987; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Jgluz1VB/1G/DYBTfp7Su1oyZjWlvzq3TKFpkBLruI4=; 
	b=EYCCAVE8Ab3G8NQ426QKbnwxGKRv15FuBpSAWhzZLkuuNqhsiQiKzXitaK57+GL5tWdsIv+AOhloG/OWpyknYxowmsk8duOTrqYSmxX9VoagJ/bnqesTMUA6Y1oWa0s3bGEg4iso4ST76BlrcOvqP8mgCgiXkcdve4NIVBjahr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702987;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Jgluz1VB/1G/DYBTfp7Su1oyZjWlvzq3TKFpkBLruI4=;
	b=UA9KyE9azmnLUmH9Qs86R/QKJcGr7uEhTtfLYk93StOiilKYy63S+sO12DWsWm6P
	Ftc6S5o0hrpM1vB51UgiByP+yAaxIBHbIkTqCjQDgmC8b2U5J/M0ushryPcwzrrB+Vz
	Ks8rmtfLWnMlVtLsw3+M79+fRHMkXDaooFTRhJWg=
Received: by mx.zohomail.com with SMTPS id 1757702984518937.115502131544;
	Fri, 12 Sep 2025 11:49:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebin Francis <sebin.francis@ti.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Peng Fan <peng.fan@oss.nxp.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Michal Simek <michal.simek@amd.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] pmdomain: Restore behaviour for disabling unused PM domains
Date: Fri, 12 Sep 2025 20:49:37 +0200
Message-ID: <3919643.KlZ2vcFHjT@workhorse>
In-Reply-To: <CAGETcx9W5MXyHA2r1kDh9=WJiQWLF1xdPaSCH=jXYeAHqQW60w@mail.gmail.com>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <CAGETcx9W5MXyHA2r1kDh9=WJiQWLF1xdPaSCH=jXYeAHqQW60w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_115006_775300_D6367A5D 
X-CRM114-Status: GOOD (  24.78  )
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

On Friday, 12 September 2025 20:36:35 Central European Summer Time Saravana=
 Kannan wrote:
> On Tue, Sep 9, 2025 at 4:11=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > Recent changes to genpd prevents those PM domains being powered-on duri=
ng
> > initialization from being powered-off during the boot sequence. Based u=
pon
> > whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd rel=
ies
> > on the sync_state mechanism or the genpd_power_off_unused() (which is a
> > late_initcall_sync), to understand when it's okay to allow these PM dom=
ains
> > to be powered-off.
> >
> > This new behaviour in genpd has lead to problems on different platforms=
 [1].
> >
> > In this series, I am therefore suggesting to restore the behavior of
> > genpd_power_off_unused() along with introducing a new genpd config flag,
> > GENPD_FLAG_NO_STAY_ON, to allow genpd OF providers to opt-out from the =
new
> > behaviour.
> >
> > Kind regards
> > Ulf Hansson
> >
> > [1]
> > https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.=
org/
> > https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0=
c9daeb00@collabora.com/
>=20
> I'm surprised this is happening. The default behavior of sync_state()
> is to never turn off a power domain until all the consumers have
> probed.
>=20
> Is there a consumer that's not captured correctly? If so, can we add them?

Yes, and unfortunately, not trivially so, no. In Rockchip's case, the
regulators supplying a certain power domain cannot be acquired at
pmdomain probe time, as the regulators themselves are sometimes
SPI or I2C regulators that depend on powerdomains to be up.

So we only acquire them when the power domain is enabled, which does
not happen for unused PDs. Acquiring them during PD disable also
wouldn't work, as the genpd idle check may run after the regulator
idle check.

>=20
> Also, there are already sync_state related kernel configs, command
> line options and sysfs files that should allow people to power off
> devices (at different levels of granularity) even if its consumers
> haven't probed.

This series is a stop-gap solution to get us through v6.17, so that
problematic drivers like Rockchip pmdomains can be rearchitectured
to declare their dependency in some way that is not racey. This
will be somewhat non-trivial, hence the current solution for now.

>=20
> Thanks,
> Saravana
>=20

Kind regards,
Nicolas Frattaroli

> >
> > Ulf Hansson (5):
> >   pmdomain: core: Restore behaviour for disabling unused PM domains
> >   pmdomain: rockchip: Fix regulator dependency with
> >     GENPD_FLAG_NO_STAY_ON
> >   pmdomain: renesas: rcar-sysc: Don't keep unused PM domains powered-on
> >   pmdomain: renesas: rcar-gen4-sysc: Don't keep unused PM domains
> >     powered-on
> >   pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains
> >     powered-on
> >
> >  drivers/pmdomain/core.c                   | 20 ++++++++++++++------
> >  drivers/pmdomain/renesas/rcar-gen4-sysc.c |  1 +
> >  drivers/pmdomain/renesas/rcar-sysc.c      |  1 +
> >  drivers/pmdomain/renesas/rmobile-sysc.c   |  3 ++-
> >  drivers/pmdomain/rockchip/pm-domains.c    |  2 +-
> >  include/linux/pm_domain.h                 |  7 +++++++
> >  6 files changed, 26 insertions(+), 8 deletions(-)
> >
> > --
> > 2.43.0
> >
>=20





