Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204D4FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3FnaIBp0espZORVL/rfnjBPdcVtbw4VckmuHvIfsjM=; b=PIWgRrFDy0+1z63KmzhGiP701X
	Hx37bsqbiQq7Pr4e4p9uVetWTiirtpdS93m0OlC/p7BKxmBG6Rc9Ss/Qh49q7gwFC5/kWn6VRBsw5
	sFnVFmzUznySXT08VB667N33swJ59/2aVzMP/++VW9qj32kMzHk6aYnf3xZIgngtN6LivKksiOIBU
	H7HM4ylgyeZxgl4OzXtUvTOTmFobup3KBaaNbYW84j5wsg87vFoA9G+KdWHQX+nAPNHP/djHJel7R
	7N6IoeR/7ghxPPcy20VR+ywO3OlswWDtLvSThoufTxkhR0y5q21xBFkI/k1kwYPKAYOVfNmAJZyCO
	SnYZ+IRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWh7-00000000McE-1WKd;
	Tue, 28 Apr 2026 00:52:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWh3-00000000Mbr-44T7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:52:55 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82f69a286dbso8153942b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777337573; x=1777942373; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3FnaIBp0espZORVL/rfnjBPdcVtbw4VckmuHvIfsjM=;
        b=UPbBdrsKEM9j+eKY6gKplIWAZi/+G/doqpb/m/Th/d5PG9B4si4s3ModAK81wfTMvr
         Fl0bZIEQaIMzzkemPZRuWUx8pm7bYrI4zz9EyQI1WQotG2/+COTBcjo9JP+vXDjIGo+m
         KizAjK1nUaVGTrDGEjQSfWCE4wxDIArvc8I8zoMkT+TTISRsJNWRTTXhWxCDqPuMTDdx
         r8r1M5Fyy1RNEipa1aqkLqDPAOArKoCXo42f6Fj0erONMzoYvh8XdDKbXPqqJ13OS/3e
         ZV5r/3nTUWWXXYpq4EenMf9LXgAQgEYw0W9cEToC9IP4r9xkZO0E/ccd56r/Z17YD7CW
         TPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777337573; x=1777942373;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3FnaIBp0espZORVL/rfnjBPdcVtbw4VckmuHvIfsjM=;
        b=X1qYkFg9l3DiVZUdR1oCj0zu179SlyWl/6TNLYLqS3kUuyM6VsmXTrdOOQnMJnd6/L
         QswEgXlaiFiKq1El8/ZyC5+jFtVoD2lLEzwrtAiFANH9VuMnpnRoX7VivJiU+MMu4FMs
         8rtecZik5gz/AU9AGYeAAMANg9hiKYp4rpf3eGImaynZQ+bRHzzR3XTYoFjc7UWYUMv8
         NeStnzXl3w/M31ok14C4L3Jdpmo/VhfT/broXx0JMVsMt7Y3u9dvTDAPaKvh6wfPS8lB
         WChH1rPVq+TFgWjrfoGmUfqPBEvUzgUePu8kl3DwRRiwPJBYtG+61sLlWz4a9a5R3XbM
         pX8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+RpYtIInDm56HgVEy/1T2SuXHN+WLj3JsbBnN8NAQZq2rDlDbGKffhnWWIqfceFJCq1ZDbxNlQUMJjZI6co3dR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/tnZSN7atclrpir9JJIA3Ad5QwCw0N+X2itSqllQfI76Vor59
	1Thvo69FKWQU9wGTdKQ9BMHYwUWRimjKCZ35aXbdxL0tWS3kp/JMaplznAG5lB1Acdg=
X-Gm-Gg: AeBDievuS+unQFkKOwkr9xQuBeDraSCP3H11yHdFTnPwSsOYTlTcDB+eGHenfD9Td9V
	Tv6cgAk+zUkm8xyLeJ31uDLtiqFX4UtAsTJjNpHrV9oKe/sGXKWPMGLeDlMInN4/EPtJ1CiiVLK
	WGnknQPf0MJYIg9RLAGLGk5MWMshZJwlLauo6oPC9Pl5SojTwJg1ZM0LdNHNdryyXABdEIjJVMK
	X8U3AHeqwaWVhU/isICFpd3d1YGbI2jtwLF/keGCipqao8OK5q6zgBgwHmKdjHWZC6mAyZ8bWLu
	CH0zGa8ARiDPv8jPrYLURSJPPg6WK/2l4lXLmc0D6peJv+6P7Je3SDpNXp1fsXBq1U97V8nUWFq
	Zr7CEBm48/aLZxOvi7bGijH9Qtth849NCNXsppjS1k3gh/5pJnAMQ0R4xd9ekbAn1UoTSBmgDxq
	UUclsqhg1fzWyPM3n8tBMJ6lwFZF1RKA==
X-Received: by 2002:a05:6a21:339a:b0:3a2:ecb8:56f0 with SMTP id adf61e73a8af0-3a39c214537mr1036677637.33.1777337572752;
        Mon, 27 Apr 2026 17:52:52 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae1ff95sm798672b3a.17.2026.04.27.17.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:52:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi
 <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson
 <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <7hcxzqr4qi.fsf@baylibre.com>
 <CAMuHMdU=3AN8wHbnO2Cx4WsLuYWhv_fRfTA50fmrqyREO3nrbQ@mail.gmail.com>
Date: Mon, 27 Apr 2026 17:52:51 -0700
Message-ID: <7hcxzjewik.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_175254_282210_7ABAD312 
X-CRM114-Status: GOOD (  23.21  )
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Kevin,
>
> On Thu, 23 Apr 2026 at 00:48, Kevin Hilman <khilman@baylibre.com> wrote:
>> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > TL;DR:
>> >
>> >     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>> >
>> > The Renesas R-Car X5H-based Ironhide board is the first Renesas
>> > SoC/board combination that implements the ARM System Control and
>> > Management Interface (SCMI).
>> >
>> > This means Linux can no longer perform various system operations (e.g.
>> > clock, power domain, and reset control) by accessing the hardware
>> > directly.  Instead, these operations are abstracted according to various
>> > SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
>> > firmware running on a System Control Processor (SCP).
>> > More specifically, the R-Car X5H SCP FW SCMI controls access to:
>> >   1. Core clocks and module clocks,
>> >   2. Module resets,
>> >   3. Power domains,
>>
>> I'm very curious how power domain hierarchy is described on this SoC,
>> because one more issue to add to your list is that hierarchy cannot be
>> described for power domains in SCMI.
>
> So far I had no need for such a description. AFAIK, this is handled
> inside the SCMI firmware, which does know the hierarchy.  Hence the
> firmware can power up a domain when any of its children is powered up,
> and power it down when the last of its children is powered down?

Yes, but this firwmare behavior is subject to the normal list of 
limitations/quirks/lack-of-bugs/etc. that we usually run into with
firmware.  So if there's ever a need for linux to understand hierarchy
for those reasons, you may find yourself stuck. :)

> I think the clue lies in having a PSCI top-level domain, cfr. what
> you wrote in [1]:
>
>    "But... how do I describe the relationship of this hierarchy? In
>     particular, when the SCMI-controlled PDs are actually subdomains of a
>     top-level, non-SCMI PD."
>
> Or am I missing something?

Indeed, the tricky part is when the domains may have CPUs/clusters in
them, and in my case with the TI SoCs, the top-level domain with CPU
clusters is PSCI controlled.

It wouldn't suprise me that other SoCs have similar features where some
domains are children or siblings of domains with CPUs in them.  This
kind of dependency is pretty complex to manage in just SCP firmware,
because it involves TF-A/PSCI as well, so it's a likely spot for
firmware "quirks".

Kevin

