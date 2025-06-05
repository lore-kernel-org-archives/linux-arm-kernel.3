Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51472C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd4ORy4qs2zF7lWHMN546s19RoxioNK3m5rogePSzFk=; b=RBvB00nptl2c6IPcf1nFRmuPVq
	XUQCkXbyzNzvp0WEf4lyamJNNrmC0VC3suHP1OohSDsUgkSYrTSu+xCh/eNiWgEhMfo4zZ+0qhJJ8
	iiNnzoy7eFeOZVENuRk+ESsMcUXjux1EgPVfIEAncrklnYvgT8h96omgOu1mU+v2fT5+P5rvK9eAc
	+hj7xZg+ynkQqb9wc4oqF10Xs3FkV+p/8ieZNePinm2ZL5z17k1zbKOswOT++MTD89DytBP5qV2YO
	a++Z1WzyuQ1CILmzoPHojX1QQARUGZk3745pZTFkTeezcX4/srRYGIlgF4SkGKc4UdSzV8hBd0CF7
	gXh+pnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGWQ-0000000GWUT-1E2y;
	Thu, 05 Jun 2025 19:45:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGTS-0000000GW40-32gj;
	Thu, 05 Jun 2025 19:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1317A5C696F;
	Thu,  5 Jun 2025 19:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424BCC4CEF0;
	Thu,  5 Jun 2025 19:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749152521;
	bh=/oeOikRCVc75mRYlz60dHqs3VC+0eqPN2O3dFH58FeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs4vplCNxnMotvO+YBSEbYEggdm/N7gei6jp7DyncaYzVGxaTpTcMNdz8P4T4ECIT
	 YeA0hr3Xz5W1RGNyVuPGwVBfGpqHVRZj8ezwhcPdjBbDEtGoRusvLu+cLUrsCa9moR
	 7ObaPX5SG3U7DaJ3JLiGj7rHbTDjw7u1MATAi2isa/OsKn5A30DaByjrqqCRyRurWl
	 CdUS94cwsVc633dF5knLvvljR6ghRm/kgA0BtT+nwTKYzFchEuVer2x5qqlCwp5u3w
	 wro77pFw0mnRG0XHNK4tUnhA9WWwD8iUsS7xwul3pOK9okOIOYhiOY/8BNtMySfGo/
	 hcjovGxHrtTHw==
Date: Thu, 5 Jun 2025 14:41:59 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-rockchip@lists.infradead.org,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
Message-ID: <20250605194159.GA3039863-robh@kernel.org>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
 <2577051.irdbgypaU6@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2577051.irdbgypaU6@workhorse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_124202_852444_DE03BB1F 
X-CRM114-Status: GOOD (  44.60  )
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

On Tue, May 27, 2025 at 01:18:20PM +0200, Nicolas Frattaroli wrote:
> Hi Quentin,
> 
> On Tuesday, 27 May 2025 11:26:49 Central European Summer Time Quentin Schulz wrote:
> > Hi Krzysztof,
> > 
> > On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
> > > On 27/05/2025 10:48, Quentin Schulz wrote:
> > [...]
> > >>
> > >> likely a purpose to it. Especially if they also change the
> > >> silicon-default in their own downstream fork AND provide you with a way
> > >> to change their new default from Device Tree.
> > >>
> > >> We can hardcode the change in the driver without using DT, but I wager
> > >> we're going to see a revert in a few releases because it broke some
> > >> devices. It may break in subtle ways as well, for example our boards
> > >> seem to be working just fine except that because the PMIC doesn't
> > >> entirely reset the power rails, our companion microcontroller doesn't
> > >> detect the reboot.
> > >>
> > >> If it's deemed a SW policy by the DT binding people, is there a way to
> > >> customize this without having it hardcoded to the same value for all
> > >> users of RK806 and without relying on module params?
> > > 
> > > sysfs, reboot mode etc. I don't know what is the right here, because you
> > > did not explain the actual hardware issue being fixed here. You only
> > > described that bootloader does something, so you want to write something
> > > else there.
> > > 
> > 
> > We have a companion microcontroller on the PCB of both products which 
> > needs to detect if the board was reset. When the board is reset, the MCU 
> > FW does a few things, like essentially resetting its internal logic such 
> > as the PWM controller (so the beeper stops beeping), watchdogs and 
> > reinit most user-exposed registers so that it's like "fresh" out of 
> > reset (even though it actually wasn't reset since it's continuously 
> > powered, not from the PMIC).
> > 
> > To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
> > on our boards) from the PMIC. This power rail is only "restarted" when 
> > RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
> > 
> > I assume it is possible other boards do not want this (all?) power rail 
> > to be quickly interrupted when rebooting? But that I do not know.
> 
> I agree that this sounds like a pretty big change in behavior, yes. I am
> somewhat suspicious of any silent mainline difference from silicon defaults
> as being the result of cargo-culting from downstream hacks to make things
> work, and are unresolved technical debt in need of cleanup.
> 
> On the RK3576 board I'm currently working on, where an RK806 is used as
> well, then DCDC8 cutting out would wreak havoc on warm reboots I'd wager
> as it's used for a lot of 1.8V IO voltage supply things, including one
> instance where the DCDC8 rail going low would feed into a downstream
> regulator that's being kept enabled as long as a different supply is on.
> 
> If you don't want to deal with DT bindings people (sysfs for reset
> behaviour? What?) a workaround for this could be to add the necessary
> register write to your bootloader's (probably u-boot?) board init code.
> 
> I do think however that "what does this board hardware expect to happen to
> power rails on reset" is a pretty strongly board specific non-enumerable
> hardware difference that belongs in DT as a declarative property, but
> perhaps in a different form than the bare register contents for this, so
> that it can hopefully be used as a more generic (even if vendor) property
> for future PMICs going forward. Think regulator-always-on but for this
> specific case.

I don't have an issue with this being in DT as it would seem to me to 
be based on how the board is wired. However, how does reset work before 
you run something that parses the DT? Seems to me it needs to be 
initialized early (or power on in the right state).

Rob

