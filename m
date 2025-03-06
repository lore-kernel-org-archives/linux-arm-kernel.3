Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFACCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL3Agxf9Ba0dlLS2KwRSPU0vAvDtKDUloz/3qH5bsbE=; b=VAFRX0LpduYCLsnSR55O3RLCS1
	BXljs9CTrCdPH13E5jDKp5NSlHhxF0DYrCR/EJNH0hA3Z4ekLkMLQ8vxwpwDnb1UaV/EYOpsWyo4X
	H5Dy92xw80pMYXA3A2Ggy6NUWfITohf+ad+8K0SRSASwhnoslvwyJSQpxZvtgvDO2nTrEXUsikNc7
	OMb1wEHrcIDOXFBFWJlrti7MPvXqe0BYSUF3qhlgAhcUkBZfH212AQPK9bzI95u0ffRPYw3q0+iGH
	UPD0GQosZmTBpk2kJtHOeXoLH/iXh+gsLj7CAym5vZj+r/bQ3tF2I4QovtIzH+MZk9TjLQQbJIgGs
	HOGwGo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEQN-0000000BZwI-37nW;
	Thu, 06 Mar 2025 16:50:19 +0000
Received: from mail.mvand.net ([185.229.52.35])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEOj-0000000BZRM-3E4l;
	Thu, 06 Mar 2025 16:48:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.mvand.net (Postfix) with ESMTPSA id 13FB91FE54;
	Thu,  6 Mar 2025 17:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=martijnvandeventer.nl; s=default; t=1741279714;
	bh=SIUt61OEmPLOReb3UFOpiP9TLUmxG7qMn3Riz8VOTPk=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=gI4G9Y6WO9bg9HFoC/7y/9XVn1Tk6u0Wo01917PgF2/eMzceuorFNUip91ecirwE2
	 f2VZYiZNvVSPh3/LDNLbu5eVTo0Mj6jCPrzYHplbxCPPlwbgcKMlJyhhqNzu4JiBlB
	 Po0CR+oyPPgQBkbmaWNEyjEj2A1LDjNPTLXkbDRxZmIRD9C/QedNxrW2xPTX8hzSvY
	 Psvgxx63C7Rcer4WVgV3+uWsJj1L5PaqqXPGbDSpwbcWW8NTr9OA+J4SDxx2+dge7H
	 RgV5EhsraXg8ZALKpXs+ffPVTGmDxrrrD8G2Ni2b9vFth3GnRLtK9wGfnqkLnltYu5
	 jyY/HNuQ7adRA==
From: <linux@martijnvandeventer.nl>
To: "'Jerome Brunet'" <jbrunet@baylibre.com>,
	<linux@martijnvandeventer.nl>
Cc: "'Neil Armstrong'" <neil.armstrong@linaro.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>,
	"'Kevin Hilman'" <khilman@baylibre.com>,
	"'Martin Blumenstingl'" <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250213221702.606-1-linux@martijnvandeventer.nl>	<1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>	<003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl> <1jplj3g21q.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jplj3g21q.fsf@starbuckisacylon.baylibre.com>
Subject: RE: [PATCH] clk: meson: g12a: Fix kernel warnings when no display attached
Date: Thu, 6 Mar 2025 17:48:33 +0100
Message-ID: <004801db8eb7$99808e20$cc81aa60$@martijnvandeventer.nl>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Thread-Index: AQH3Houg6kGqwWGxu7A7A+ZA83tGEAI4axMrAfruu2QCUs8BLwKsXM3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_084838_022921_3B506005 
X-CRM114-Status: GOOD (  37.80  )
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

Hi Jerome,

> >
> > Thank you for reviewing, and apologies for my late response due to a
> holiday.
> >
> >> On Thu 13 Feb 2025 at 23:17, Martijn van Deventer
> >> <linux@martijnvandeventer.nl> wrote:
> >>
> >> > When booting SM1 or G12A boards without a dislay attached to HDMI,
> >> > the kernel shows the following warning:
> >> >
> >> > [CRTC:46:meson_crtc] vblank wait timed out
> >> > WARNING: CPU: 2 PID: 265 at
> drivers/gpu/drm/drm_atomic_helper.c:1682
> >> drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> >> > CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
> >> > Tainted: [C]=CRAP
> >> > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >> > pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> >> > lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> >> > Call trace:
> >> >  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> >> >  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
> >> >  commit_tail+0xa4/0x18c
> >> >  drm_atomic_helper_commit+0x164/0x178
> >> >  drm_atomic_commit+0xb4/0xec
> >> >  drm_client_modeset_commit_atomic+0x210/0x270
> >> >  drm_client_modeset_commit_locked+0x5c/0x188
> >> >  drm_fb_helper_pan_display+0xb8/0x1d4
> >> >  fb_pan_display+0x7c/0x120
> >> >  bit_update_start+0x20/0x48
> >> >  fbcon_switch+0x418/0x54c
> >> >  el0t_64_sync+0x194/0x198
> >> >
> >> > This happens when the kernel disables the unused clocks.
> >> > Sometimes this causes the boot to hang.
> >> >
> >> > By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> >> > clocks will not be disabled.
> >> >
> >> > This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> >> > make VCLK2 and ENCL clock path configurable by CCF").
> >>
> >> It looks like DRM needs those clock enabled regardless of connection
> >> status on HDMI. Even with this change applied, you would get the same
> >> problem again if the bootloader does not take of turning the clock on,
> >> which is not a given.
> >>
> >> CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
> >> enabled at any point.
> >>
> >> A proper fix to this issue should be done in DRM, IMO.
> >
> > I know and I totally agree. Unfortunately, I don't have access to any 
> > vendor
> > documentation, nor do I have any real knowledge about the DRM/HDMI
> > subsystem to fix that.
>
> You have identified which clocks are not properly claimed, by what they
> are not claimed and even when. 50% of the job is done. Thanks for this.

You're welcome, no problem.

> >
> > And I guess if it were as easy as adding a clock to the DT and calling
> > clk_prepare_enable on it in the probe function, Neil would have done
> that
> > already.
> >
> > So, all I can do, for now, is revert to the previous situation when it 
> > did
> work
> > for (probably) most boards.
>
> Maybe so, but it does not make this change appropriate. The problem
> is the DRM driver which does not enable what it needs to properly
> operate. This should be fixed.

I understand. So I guess that is the end of the line for this patch.
Because this patch will not be accepted and if someone else finds the 
time and has the knowledge to fix this the proper way, it will be a 
completely different patch.

Although I, of course, agree with you that it should be fixed properly, 
I find it a bit difficult to accept that if we accidentally break something,
while trying to make things better, we are not allowed to revert it 
because it was already somewhat broken. Resulting in a more broken
situation than before...

On the other hand, I also understand that if you, as a maintainer, allow 
that, chances are it will never see a proper fix. :-)

Cheers!

> >
> >> >
> >> > Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock
> path
> >> configurable by CCF").
> >> > Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> >> > ---
> >> >  drivers/clk/meson/g12a.c | 12 ++++++------
> >> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> >> > index cfffd434e998..1651898658f5 100644
> >> > --- a/drivers/clk/meson/g12a.c
> >> > +++ b/drivers/clk/meson/g12a.c
> >> > @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
--
Best regards,
Martijn


