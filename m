Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B803CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw+0Jo6k4Z3EOsXxFg935D4YRKUNuajiI//i23E0Ynw=; b=ddONDw2uyRJDSMWG1X7fdwpQ8D
	IKF2Q1PwEw8wUwO4dgwoKsH0rYBGsYnbzErv4INt+nZboZIpDKc1l4fa9bHYB3xw4aPTQNdoXGQMv
	SIaRrMZnmozi/wG/KAEySyqHEFPdhcz7RTul0gj+nZ9R8+NTgIJK1ZA2UTTh8amkDearHgD6PvHmO
	2Sk2GkOKqraqcIcHybnnNaxPnEuaOfOJ1oSzr6gSAyF+LBuvZ2vco3cqGpdwDjiCXfOxZ3Z5aUFjP
	4jl8jWl5/1JEzIiMW/Rt0+ZJjPQq5BBYGPaNN6F5b6NOarEminnlVB279Lo0/snsfjwmqn80BIZZ4
	voOVrS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5jS-0000000GbIo-3z96;
	Thu, 04 Jun 2026 10:55:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5jQ-0000000GbHc-1QRm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:55:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 176943297;
	Thu,  4 Jun 2026 03:55:17 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E95C3F7D8;
	Thu,  4 Jun 2026 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780570522; bh=d4bP0wMj8a3/uR7atdVyxMeW3EzT3BnpkPvm3mnSwRY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MVw3ZEV1sbJtFTRPnYGc6Ua9Xwm6pUOD/dpSkK+1o3NqmWhUsVg60ic6L9HLUZDKr
	 mQ2UmNCUJChc6voaH5jw+TjQM1pURI+UZVq4qrfGxLH4c0EEF+1l7e6wQikUXn0oC+
	 3ku3KrnusebqKMOYJCkTuhQChXfiOlhe23KIL7WQ=
Date: Thu, 4 Jun 2026 12:54:14 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 0/3] pinctrl: sunxi: a523: fix GPIO IRQ operation
Message-ID: <20260604125414.0e361fcf@ryzen.lan>
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_035524_463135_35D6D6FE 
X-CRM114-Status: GOOD (  21.85  )
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

On Fri, 27 Mar 2026 11:30:03 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> this is the minimal fix version for the GPIO IRQ operation on the
> Allwinner A523/A527/T527 SoCs. SD card detection is broken as a result,
> which is a major annoyance. Those patches here fix that problem, and
> should go into v7.0 still, if possible.

what is the status of this series, please? We missed v7.0 back then, but
please can we take this now, for v7.1? There are review tags for every
patch, and this fixes SD card operation on all A523/A527/T572 boards.
The series still applies cleanly on current master, if I should resend
anyway, please let me know.

Cheers,
Andre

> I dropped the more involved fixes from v1, the risk for regressions is
> now very low:
> - The quirk flag is just dropped from the A523, not the other SoCs. I
>   confirmed this again with an experiment, for both the primary and
>   secondary pincontroller. This avoids fixing the workaround code for
>   now, which is more involved, but for now unneeded.
> - The DT patch just adds the missing interrupt. The IRQ association was
>   always wrong and never worked, so this can't make it possibly worse.
> Together those two patches (plus the required binding change) fix the
> problem, I would appreciate if this could be taken ASAP, into v7.0 still.
> The generic pinctrl code is now untouched, which makes this also much
> easier to backport, and drops the dependencies on other v7.0-rc fixes.
> 
> Bases on v7.0-rc1, but applies on later revisions as well.
> 
> Please have a look and test, especially on A523/A527/T527 boards!
> 
> Changelog v1 .. v2:
> - drop generic pinctrl fixes (for now)
> - drop quirk removal from other SoCs (for now)
> - add Chen-Yu's tag
> 
> Cheers,
> Andre
> 
> Andre Przywara (3):
>   pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
>   dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
>   arm64: dts: allwinner: a523: Add missing GPIO interrupt
> 
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 ++-
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c             | 1 -
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 1 -
>  4 files changed, 6 insertions(+), 7 deletions(-)
> 
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f


