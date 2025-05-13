Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D760C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8HvFU+C7sIo5Yzd4dl6ojrhAT/ghV8MpikwHZzYzPM=; b=C6uW/LcYolDy6Nb+ZdDlfihAXz
	zbXsci3J9w+ZwGM2o0xqjWJ2B2dPgk/S5067JQ9nwzeOkQj2ut1Ecrx653XFUHchNHnelU4RrbG7h
	pVBOYP+nf+PTnJpta048B9zFMGmHlci8KyWUT5iotUuvl03fJHWx3dc7cL4LXQbpgmGf3M4qLqJBH
	kfYjGqQj/QCtxKL/NrCfRY0uQoTtU6oFusiyl7Wu+BUkEXuMJeCRQ4baSJF1WJf9D5ynH0j+rGLmr
	w77GvxLS6e4xKEhLlcioGvQ9DpBTLj8V4lOJwL8HMQHXsy9iIxrzf56lYGMMsTq8lsBU/yvDPNOBC
	1E2LwZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqi6-0000000CckP-1aju;
	Tue, 13 May 2025 14:34:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqbR-0000000Cbme-3LLe;
	Tue, 13 May 2025 14:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1747146434; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ANqNFwZEb+ZFYow3aFAQoyO/1Ud2AXpFUIBSle0bCo8FVYBcNiP+i1HJVeS9GxYppl7HJpmC+qZl37HtRPkZXcPEOXkDBCQ/zrr8dgKo5uei6H47cW+QVV7ZXJHw8+jUnBeKS3gYXF9OXPTulAsAQCmtDNFdp0Tbw/DhN5W4wsg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747146434; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=S8HvFU+C7sIo5Yzd4dl6ojrhAT/ghV8MpikwHZzYzPM=; 
	b=juo7qhHanaIrojtSIzpy4DRVsL0LxCZof/Ml9fpsJ0EWTj5tH9ljTvKL658u060IhnGxO0kOeBj1jr4KDs4a0RM2Ff4rELQ6Xo0dB7Amhs30S12gFTnGp+viG8MZG4T5h0EJuFWABukZ5OjIvp4EG54KMCC1prBrdmXWOVtR1t0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747146434;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=S8HvFU+C7sIo5Yzd4dl6ojrhAT/ghV8MpikwHZzYzPM=;
	b=TL9bA5j1wnQEzElGt0exkEIhE0Vo7i6xr6vp0qX6xbOLsv8oU234w/eH/ZX6PJJ4
	goH3Vq90j1+kAQio1s0ScSTAfdctQvB99CVnqDrQkokNPU2LuRPEm7T3kvOY7xyhf0T
	oVg9Lwl4xwFaLP7+KQ2QJZqRJPmFWFuGHhXf4uT8=
Received: by mx.zohomail.com with SMTPS id 1747146427338952.0201359300785;
	Tue, 13 May 2025 07:27:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH v3] mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
Date: Tue, 13 May 2025 16:27:02 +0200
Message-ID: <6154950.lOV4Wx5bFT@workhorse>
In-Reply-To: <CAPDyKFp5N23KCZwOTba6vGyk9eaS1-SjSqY52FfPDng-bahn6g@mail.gmail.com>
References: <20250423-rk3576-emmc-fix-v3-1-0bf80e29967f@collabora.com>
 <CAPDyKFp5N23KCZwOTba6vGyk9eaS1-SjSqY52FfPDng-bahn6g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072729_903604_75BF40CC 
X-CRM114-Status: GOOD (  26.21  )
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

On Tuesday, 29 April 2025 12:06:16 Central European Summer Time Ulf Hansson wrote:
> On Wed, 23 Apr 2025 at 09:54, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > RK3576's power domains have a peculiar design where the PD_NVM power
> > domain, of which the sdhci controller is a part, seemingly does not have
> > idempotent runtime disable/enable. The end effect is that if PD_NVM gets
> > turned off by the generic power domain logic because all the devices
> > depending on it are suspended, then the next time the sdhci device is
> > unsuspended, it'll hang the SoC as soon as it tries accessing the CQHCI
> > registers.
> >
> > RK3576's UFS support needed a new dev_pm_genpd_rpm_always_on function
> > added to the generic power domains API to handle what appears to be a
> > similar hardware design.
> >
> > Use this new function to ask for the same treatment in the sdhci
> > controller by giving rk3576 its own platform data with its own postinit
> > function. The benefit of doing this instead of marking the power domains
> > always on in the power domain core is that we only do this if we know
> > the platform we're running on actually uses the sdhci controller. For
> > others, keeping PD_NVM always on would be a waste, as they won't run
> > into this specific issue. The only other IP in PD_NVM that could be
> > affected is FSPI0. If it gets a mainline driver, it will probably want
> > to do the same thing.
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Applied for next, thanks!
> 
> Kind regards
> Uffe
> 

Hi Uffe,

I was wondering whether we can get this into 6.15 as a fix as well, as 6.15
should already have the genpd API additions this requires AFAIU.

Fixes tag could be something like:

  Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")

but may need some more flavorings to keep the stable robot overlords from
trying to apply it to 6.14 and earlier and then starting the robot uprising
in your inbox when they notice the API is missing.

I originally left out the Fixes tag on the rewrite of this using the new
API because I wanted to avoid those awkward backport scenarios for a fairly
freshly supported SoC, but it'd be great to have this in 6.15 because that
will be with us for a full release cycle to come.

Kind regards,
Nicolas Frattaroli




