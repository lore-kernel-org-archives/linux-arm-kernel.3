Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55D7CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCCOIzOkC3aMYU18+NM+L3w+mXvUjU56+VWPG5affHY=; b=NdK3ranX5K+bckUTNR9J9N/aNP
	rX9VXL9lQ2nBQjWdNB/MCpaRnd7lG51uo3wUjzDCYpiI0inGR7xOOkclGZiCT62dysQVDdzvLKMAV
	Ax7Fq3M5Y4HldjuJEWNrIEqpvXReGAHT/LS+WUqg35ylb3YBQ0H78B9U7ZAoJYMYzLxu+Xkril+N0
	c5UMw5pGwBbE+wNUPgxbKYTP42KHtV1UA0nt52NqlfJv505lB3CZBxuDry1bxblkWUhy1KQZR7qP5
	JpnJv+xiit5jkM7/uHF3HPAMuss2OF929xbJ1rJRE/id0Prk+7pIQ2okRSX88hsLOXpwG+aYUQ8eM
	fgiUq73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGK1-00000005xdB-2PXi;
	Fri, 08 May 2026 08:12:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGJy-00000005xbs-3bPX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:12:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48909558b3aso19895005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778227948; x=1778832748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCCOIzOkC3aMYU18+NM+L3w+mXvUjU56+VWPG5affHY=;
        b=SuxV6GdjC2lRkFTOqlSQV6aAq2yFitPXMgE2i4vPKCspapE9JbcSR4rsV8RiV6YGkN
         jVMw8s//ehOKRaVAKpUP9f4eBXRGW9Dlnsj/6DUvl8X4Io2pcU3bzyPE58vX4shDei8m
         zNGMvn0JTIPLK7nbkwe85wjGvB3f1jlTz7DcKTD+ZTOMbcWpsTeeFxmmeAhU8japF7L7
         Zxam69W5Qf5nM2q7np288Zy20rW6KV2JqIAVKelJ1yojxrdXJklB+GB8V3FIb8x3BILr
         CHILSydUSYJ28E1iYifrttgnddKHLEibgFs39hoNfJROGMPhy/OZmsxrm3ZO9v1t7pUU
         7Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778227948; x=1778832748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCCOIzOkC3aMYU18+NM+L3w+mXvUjU56+VWPG5affHY=;
        b=VDYTwo6Dgni0uygDaLgzeFQVokm4b7ubov7YgO9vq188CLXiS89oC/zlfoPk9RsYjH
         +T0sucUaiC851NflMTz4q11I6VWdFK94OTCfOHVHnn8vjTfM9PY24PTwK2hDJfZUDGfT
         0pXXbyoZZac7hOcnnFMIfXrsm5WEJSrZEHq6JU9f+OLh5UCYLCoowjyA/HOfE4jRxbop
         eJ1GUEFyvNuc+RK/wicXFgDjQ8yyAiSXkHHJTlZ3NxLl46v8oAlrX0F3mhQdaeCoE0AU
         3+Z0eN7kMjzLaNWZ2TyKb+rZAsgGyWlpxAwx63dDBD7vauNmXvh6ppnxwMBaEz4gAW5I
         fjTg==
X-Forwarded-Encrypted: i=1; AFNElJ/A7Z8wIC2K6YLLPnm5HJ/Nglwi6G3uRuJ0+I+QR1ADCo0DGW+Ps7vl/mXykzrZmyyxwHtNQAPT1r0slgyR/Byc@lists.infradead.org
X-Gm-Message-State: AOJu0YwgXIxvGdvy0xVziCqayYNeruEo9Ue8QxyJHXCxbuaaH+gM+qd6
	n68Cy1TownxBjy+kMj93GKe7WtYSgdLj+VW2FOo000XDOstvhljoo2FKBhYZ/68/oTA=
X-Gm-Gg: AeBDiesm+GCmp33pfSV64ZRT/oX5N/lyQapNzOsurNjLu6RGzLFFq34jMAkDIstvsKb
	1c0fHe/lqjpz4BF2VPj2dQu0kO8jeWvjry90fERGPCXj9nztSutqVIQpBM3h57UnBxJLkfK0Ub5
	DEKnbzQvkPHqPzNqWAN9/P9405Ufkqo5Gr9ztL6ZeY1dXn/ndLX18tN1CtZkzE5M/4vpVAfublm
	8FKxk8sv/fWmdXWK8ebpfoJrVnv6D7mgCWOqMGhMXk4qOFOE9KNjZQ21ZbVyxVXMyS5ZqkVl3Np
	fi66oN1+bLWrZuW+PvGsIFcKC3wnMI8YPGW5rUHQoNObi7F+6AQLESd53L80E+M/gVQcd6CmTze
	vV/hSAnmr47QRBHtHuhM4G1TIet9eBUFmJy2v4/0+BrdVNZkwGAE0/dGbTLD129QfY4ekwtzrrX
	FKKjkERYoFMWaxqduooArt
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48e51f220e7mr136524945e9.12.1778227947995;
        Fri, 08 May 2026 01:12:27 -0700 (PDT)
Received: from localhost ([195.94.150.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eaf237sm26988245e9.6.2026.05.08.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:12:27 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 8 May 2026 10:15:44 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v3 0/3] Add RP1 PWM controller support
Message-ID: <af2bsEdAhYY9c4rb@apocalypse>
References: <cover.1776932336.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_011230_929668_BF88D661 
X-CRM114-Status: GOOD (  30.24  )
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

Hi Uwe,

On 10:30 Thu 23 Apr     , Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware 
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which is then exported by this driver via
> syscon registers. A subsequent patch will add a new device
> and driver to read the RPM and export this value via hwmon.
>  
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea
> 
> CHANGES in V3:
> 
> - Refactored all the register macros. They now have RP1_PWM_ prefix
>   and follow the register name.
> - Dropped the tab alignment in front of struct declarations (use a space
>   instead).
> - Added a check in tohw() to test (and bail out quickly) in case that
>   period_length_ns is zero.
> - Probing now returns an error if clk_rate > 1 GHz.
> - Added a check on minimum period ticks. Return 1 to signal round-up.
> - Fixed inverted polarity detection on edge cases.
> - Fixed rounding errors (in both tohwi() and fromhw()) in inverted
>   polarity calculations.
> - Dropped a redundant check on period >= duty.
> - Replaced memset by inline struct init.
> - Disabling a channel now is faster, skipping the duty/period/polarity
>   setup.
> - Fixed an error string (s/Fail/Failed)
> - Used %pe to signal error string instead of an integer.
> - Added several new sections to the Limitations paragraph to better
>   explain what will happen on edge cases.
> - Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
>   selectable periods.
> - The hw period register now takes into account for the extra tick at
>   the end of the period (subtracted one to wfhw->period_ticks in tohw
>   and added 1 in fromhw).
> - Added .remove() callback to free resources even if the driver is
>   not unbindable/unloadable, to avoid accumulating tech debt.
> 
> 
> Naushir Patuck (2):
>   dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>   pwm: rp1: Add RP1 PWM controller driver
> 
> Stanimir Varbanov (1):
>   arm64: dts: broadcom: rpi-5: Add RP1 PWM node
> 
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
>  .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
>  arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
>  drivers/pwm/Kconfig                           |   9 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
>  6 files changed, 500 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 
> -- 
> 2.35.3
>

A gentle reminder about this patchset :)

Many thanks,
Andrea 

