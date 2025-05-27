Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970CBC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/VHCtcXRMZriu1nB8uzMBAKyPh887u/wlS2pjs87xE=; b=kg5gXWSnQE8E/vzN2OYEcG6okn
	+bfruUFklJ8Qdpgc124/nUQm3yunCcvBoEr5OBXSLS2gKMDZQL1o1w5Tkv7aB3RUbQitwcZwOz4Wb
	x8dKL6i1Y71ugJ9ex2JR7L3owVljhjeGvHC8RXFVvEtka9+7xUOpPx0VoKewuD2mhKa/9oGyi8wYr
	lKRwDplZYBSSn0smLqLrAIoMnTved3JBhO2K1PnowyUM2LTNP4VNLjOo4Iz4i1DIfP5Kvkq2Xkggj
	ohlFmHlT1rE3sTWw2DufTn8K0CDwf0w8vXZS60lij+VB/NUg5Y81oWZRfVl3WS5O76IUxDkk94ex0
	jDp59k1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsMU-0000000AYbu-3tJw;
	Tue, 27 May 2025 11:20:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsKL-0000000AYM7-2DkL;
	Tue, 27 May 2025 11:18:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1748344707; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OjEgOVngOzj8l+dowMDZx9/zcZW/KtH42PWDJWw8aQbd/7Jq6g+VqwWNFIzDTy/YcFXA6AT4rdZuUl8BKNvIimCkrlvftz6d3YEE3pBNBEcKecEXWpNKNJkA/hqfQTU8Fxli5f9DOrIHiDhkhyrrFfAGdNF2J9gF40bZpg4g0cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748344707; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0/VHCtcXRMZriu1nB8uzMBAKyPh887u/wlS2pjs87xE=; 
	b=Sq6VJK+ZnGPTNH2DmmWQJcryqNc3hr+8bYcmBNEGQVWv27LkfR1ue6ZIM4k0VB8kCjJ9M0U3/REg9a2X/f0Di8fbsoMZn6itllu+uNLx2p1y42s9stRIZlWLJ9zDLL+ERXDVG9+ymrs589dj1HOuz/69+e9IIlCn9I61V1XEC8s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748344707;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=0/VHCtcXRMZriu1nB8uzMBAKyPh887u/wlS2pjs87xE=;
	b=NLKCZ8t4vuGbM54XFGJE0/ez8Kivmga5chUE+jTrPesByu7GQVHYEVmNkU0O5tPp
	BKqL9OsQL6eMCmCLJTK4kiQFBrfKAm0QGYnNxsqNt//5XUDLEZtIUKmNaSfbDDnaF4F
	opzoZ/T6vDt8sS2i8iAeJBjvqJ5XYmgfAEG3QlzA=
Received: by mx.zohomail.com with SMTPS id 1748344705103666.6724010540661;
	Tue, 27 May 2025 04:18:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-rockchip@lists.infradead.org
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC reset method
Date: Tue, 27 May 2025 13:18:20 +0200
Message-ID: <2577051.irdbgypaU6@workhorse>
In-Reply-To: <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_041837_646275_1619E536 
X-CRM114-Status: GOOD (  33.53  )
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

Hi Quentin,

On Tuesday, 27 May 2025 11:26:49 Central European Summer Time Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
> > On 27/05/2025 10:48, Quentin Schulz wrote:
> [...]
> >>
> >> likely a purpose to it. Especially if they also change the
> >> silicon-default in their own downstream fork AND provide you with a way
> >> to change their new default from Device Tree.
> >>
> >> We can hardcode the change in the driver without using DT, but I wager
> >> we're going to see a revert in a few releases because it broke some
> >> devices. It may break in subtle ways as well, for example our boards
> >> seem to be working just fine except that because the PMIC doesn't
> >> entirely reset the power rails, our companion microcontroller doesn't
> >> detect the reboot.
> >>
> >> If it's deemed a SW policy by the DT binding people, is there a way to
> >> customize this without having it hardcoded to the same value for all
> >> users of RK806 and without relying on module params?
> > 
> > sysfs, reboot mode etc. I don't know what is the right here, because you
> > did not explain the actual hardware issue being fixed here. You only
> > described that bootloader does something, so you want to write something
> > else there.
> > 
> 
> We have a companion microcontroller on the PCB of both products which 
> needs to detect if the board was reset. When the board is reset, the MCU 
> FW does a few things, like essentially resetting its internal logic such 
> as the PWM controller (so the beeper stops beeping), watchdogs and 
> reinit most user-exposed registers so that it's like "fresh" out of 
> reset (even though it actually wasn't reset since it's continuously 
> powered, not from the PMIC).
> 
> To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
> on our boards) from the PMIC. This power rail is only "restarted" when 
> RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
> 
> I assume it is possible other boards do not want this (all?) power rail 
> to be quickly interrupted when rebooting? But that I do not know.

I agree that this sounds like a pretty big change in behavior, yes. I am
somewhat suspicious of any silent mainline difference from silicon defaults
as being the result of cargo-culting from downstream hacks to make things
work, and are unresolved technical debt in need of cleanup.

On the RK3576 board I'm currently working on, where an RK806 is used as
well, then DCDC8 cutting out would wreak havoc on warm reboots I'd wager
as it's used for a lot of 1.8V IO voltage supply things, including one
instance where the DCDC8 rail going low would feed into a downstream
regulator that's being kept enabled as long as a different supply is on.

If you don't want to deal with DT bindings people (sysfs for reset
behaviour? What?) a workaround for this could be to add the necessary
register write to your bootloader's (probably u-boot?) board init code.

I do think however that "what does this board hardware expect to happen to
power rails on reset" is a pretty strongly board specific non-enumerable
hardware difference that belongs in DT as a declarative property, but
perhaps in a different form than the bare register contents for this, so
that it can hopefully be used as a more generic (even if vendor) property
for future PMICs going forward. Think regulator-always-on but for this
specific case.

> 
> Cheers,
> Quentin
> 

Kind regards,
Nicolas Frattaroli




