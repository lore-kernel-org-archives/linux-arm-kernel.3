Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A333CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=; b=nWhaH35FEu5Yz4MH42oSp6JD1u
	g0LAneK4Y2GDLeQykn7pzSIb2NSF5hVv2xba6CUsEUm1sIFfVXaOSkxSsnQvJef3Wh+yfxuPvaEbX
	kk3epfuIqn+J3Lb63d8E5y76tD3PCeImbNxVONCfBvZnsrcBm/Ju3uSHoXOyrX3dUBEXacl8cfu2+
	qt+ujjtxV+ZMOTkSNKICWgwgpRr4eP8gFXkRZufJtfwdVwF5lhH1kZ8ep4nAjH97LEiJ9/AuuqSTx
	fHdDd4RElfsUWOA4WL5gfVCMmeb9sHfS4QAFvVGMsISKicnKIFm1WMXyhatXJkln6L1cBoR8nLAh4
	FVjeg+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RS-0000000DRvE-0C0A;
	Fri, 11 Jul 2025 01:20:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0uR-0000000DImz-1r0M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
	b=Syg7dlfq0fc2NtwTL2wHQJZRivsOVu8TyZRqic01i8zkGwll58nno+8eYCVW3su7EIbhC+
	EgbF7fkhfN4hlXyUUbRFOuYgbrs+fntHmsp2dDrPgUrFlFn0r8MevaHlXO/zLJk08SMpTx
	jkElJ1D3fbeScu21orEv2oCVRfHeAMs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-OXO3BLmROty2m7_uNZrM2w-1; Thu, 10 Jul 2025 19:42:32 -0400
X-MC-Unique: OXO3BLmROty2m7_uNZrM2w-1
X-Mimecast-MFC-AGG-ID: OXO3BLmROty2m7_uNZrM2w_1752190952
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3654112fso26112886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190952; x=1752795752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
        b=cAoL/sFVXwr+XIup27EOVl70sNCMPWbMFF+8BHMNRsuVrGcfA3qQNFoH/XcSZX4w7m
         dPObQWVbb9f6OhGeULVSZonuErOhFW88e0S4Nb3LV3wlv/Y95pg6Tg6tGkd6bliDR+/u
         PyaAjNu/96nINQeTYZjGJNgfg6SeGAMmF6rk6utN22JtueIgo7v1r7quPYORsWySpX0j
         ux70QmSZf9QAfuunjp4OfhSliS9EoxUoFTUP5pto48Z8NOpDISs+8AlAK2SywyB+GbsI
         tE8VLzen+nii4VR7g6td1/Rd+gXVeexcTjFsp/2qcJygjdCs5fFRDQR7gOO711kBpzi5
         TBNg==
X-Forwarded-Encrypted: i=1; AJvYcCVwroiCfeIvRHohZ1Tgj8byTfqbmAUm3fRGLtfZbLc7+RNvEmjmAd0OnBieALCjx0W6EHiYHI4+4J35KWQDSeH1@lists.infradead.org
X-Gm-Message-State: AOJu0YzYJ82Qg2TDFwE2tJ2NPMjdtkSCHDePLfVdpTVlete+vF4j9X/X
	Dc8uqOf2C8zlyWEh4O4UUAOVlWoi/CVT3hdlHz3hf+F+M/fFBjzugP9/7v347ZATBuwIXijGHrz
	dcDvQmt491Xth8pGCUHdzZQjH9vmKIwM5X/wvdprpv7abcp1sQ8PM4qBIHT188jqsq+SSWREnCs
	4k
X-Gm-Gg: ASbGncsqF3slVXOpR9NEqLpEyp+hJ3D42p1bxbN6sDI3l7O33FX6wEL44J+CRkXotUa
	wuj/nHgwV9b19KjARnmcSVDTXlCgdv/EycPXqaYoSsa71ApR767ki4kaKeYleushll8ndPQWPGH
	pMeUk9ZgrNzkJ2QDnG7OmhbrYHZXPqsGDQjI1JHyrLZVzEkVNoEqRu9sU+qlMN9V9W9HMqRqceM
	GiSe8Gye5t4c1jdepQJDg9VCtgzKdQtDsvCMJwdnQ/QBzEKg5SWiwfDufOJFCAqKm43jKbYKJ/N
	Ef/s0eekbfoL/9e1C5UeT+Jm7lX0IpNS112AY47uoegSLKRrdCHOyQbXJ6zu6Nv9pt+d2i5wq/2
	noNE=
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570896d6.28.1752190951838;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPET4l5Q7pb7AJesD0qMFA+J1X+JY68upvMvP5yWTEV64eVycbSgaCQEqLya1yThh36Ihxg==
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570546d6.28.1752190951467;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] ARM: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 19:42:15 -0400
Message-Id: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANhPcGgC/x3MQQqEMAxA0atI1hOo0TriVYZZlDZqGK2SOiKId
 7e4fIv/T0iswgm64gTlXZIsMaN8FeBHFwdGCdlAhqx5lwadzhWhn36oyz8GVLcxsqXQ1pabljz
 kdFXu5Xi2n+913bQdPmNmAAAA
X-Change-ID: 20250710-arm32-clk-round-rate-e52d845e682c
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=4739;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=al6nz9adATLIR7FYrUCMOsShOW+3Oeiwsw0ZybmNjqs=;
 b=3Q0yi8DRBblqOemRVD6yfPZ3j82f3KJqt3sROeWm+I3JnvzPuG213PuuABwJdF06b5Zc7bIdB
 TQ/efS5E36aDaYQpeIWnskVhTOg8xT7IYWoLqgf2UhPz/Z0uU8VOGHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jZT6HH2MNfSDrx0reNYvrrMVhrUfpedQ27YDH-jnE38_1752190952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_164235_909981_A00AD5F1 
X-CRM114-Status: GOOD (  16.41  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the arm32 subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      ARM: versatile: clock: convert from round_rate() to determine_rate()

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-versatile/spc.c                |  9 +++++----
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-arm32-clk-round-rate-e52d845e682c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


