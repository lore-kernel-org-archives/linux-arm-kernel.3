Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF4BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=; b=ocxaYLiQzGvRF9W3J8JnCEgPcq
	XNCHdM9Ilk0aelxsxOEEfZ/y4fZelfKTrcnE05A/R4Rhm87Q8V2MJTjRIIQKlDHuHFo2Ar6/Xl4G1
	PphAAkLZpNEWFQ7+sYAWnykFrZxf6bnsx741O1vAGjWlM0sdw+J5QOhEd8rYYf7vxn6aDNfuq3odU
	x5BUTTXV4dPFponIE1cqBpec68/I+2iuRNFWTdOghOlScOM6foMZuplOlcZ6rVDR3wvGR/UMorGf1
	f2t1zlDgLFgvThgX8wI06s2gNqgDGQvOiKC81wujXE+WBNawvO53D1eiU9H9/zKkpd90cyKvi0UTG
	1jZmlH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu71m-0000000G2hs-0zSz;
	Wed, 12 Aug 2026 11:21:49 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu71j-0000000G2fc-2xLM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:21:45 +0000
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so1409910a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533703; x=1787138503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCCZvy6wBuqHUxauMraEzIMerW1TTEAMcJhR4qIYKD4=;
        b=rgQMkBXV3mM9B9ZXQGr6Tm5gC4KW+cTJsoZHd3Nb9F0FDMHHlTa/VrerrXW/5ZGtcu
         mPSmk1LOsvm1WWXVGgUlP4zYoXDsc6+nUmPP6MMp7ctDx4tnaotNhVZ5Z9XCbqad6sB/
         tr3UHRFUj1+wb11T3Huekb4U8yvcE0tu0OhNIMAOWHqG0aAWXvHpzEyAUwnI+oYynPOz
         xTZhvTp3/OGiKH9GqmDb5VpiVBx4RvFNosgOtwRrZ41FQrLT8AklLzDVD7bdqED5J3/c
         rkth2jR/wGvmXjUkKa1v0y+6dcIKMR0esQ/uxYQZS2Bp0S8WTfqxXsELAYIXHfjLe5tA
         w+Xg==
X-Forwarded-Encrypted: i=1; AHgh+RptbEkrlXg44EDKN/kRERWBETdqa0bFr61jR9rIIqaCez6owKW2htBUUHypmhuwiIT13RJ3F7y7FHA15vyDI5iT@lists.infradead.org
X-Gm-Message-State: AOJu0YwE4c6ysuxaJm+cLn8bdHSMFde9l7kGT5okB0cJXMSVb8lsA1Xd
	5/DXqGEstrN1qk+LohPeYHXLeQNVEoBih9cWjG24HEBSrgB1a6YYBqqVHDzHFZUp
X-Gm-Gg: AR+sD10eGnzcortEd5uDKZEUTL7M8p5Rv3n2N8vpXUix1a07K2xV5nXmsp3iLE+eLpz
	5TAF1DSZD/8U4o0GLwPch3qB/UTy1HpvfsRLC9pua+3osoFQoqyHybBA5v3PmJgNcU6Wd+9XzLc
	Z5kndB0qBXt2Poz6PAF84F4D8CZPH7WHBlM6NgNRT3iHNSrRWKPojnYjYmGKlEItVPxSpEgyL/N
	ev1DX76lr5eyvhAo3ZQBT074mT8xB6hQm8LD1Q+6dQkYs/qu97dcnJtGD34GNeHl6qGuJFW0V87
	ejh+0Sn5pxt84GcYpWUHHZ+OJ+Pt6xFTxG+xG80dp1D7BARwLkIi46jiHzAJ0N4CWO5VW/SPetU
	WTsQTNtCAlxqWoT3ao1JhMUBqWjqFTVSR8yxlKM3t5rq6DqU1OV52Qyk/ceSiEIYfmyVgWjnt/q
	0v5jcINxXdZhU44yXsW3nhmX742b/zWp7JO5V6eTtE0VvVvA3k9qGMU+aUtopO2vTWvPz3Psgli
	DBpGKGNvODKphTGDfcjWtFHRw==
X-Received: by 2002:a17:90b:1f90:b0:380:fead:448d with SMTP id 98e67ed59e1d1-39301416e89mr4753275a91.13.1786533702715;
        Wed, 12 Aug 2026 04:21:42 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f9652561sm1118251a91.0.2026.08.12.04.21.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:21:42 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so1409898a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 04:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUJ/lb/vx5xgRWeUW73Rv6lgm5SQ/EdAeXXx1b28DT3X094fBaZ86B29Ns3b+WjqzSRXO5Gecc/Sys3bKvGz7l@lists.infradead.org
X-Received: by 2002:a05:6102:5692:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76c8d1f94a9mr774665137.6.1786533275732; Wed, 12 Aug 2026
 04:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org> <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
 <20260811163334.GA2354701-robh@kernel.org> <CAMuHMdWbzg-QpFBzzDa2hC3HzAmWUkerESC5O-cSVxmWX3_PkQ@mail.gmail.com>
 <45dfd858-9d59-47e6-91e0-ef9e6e909af6@kernel.org> <CAMuHMdXJFdJQP1GVXrOWRuYO8Si_WF5X+vpzmAgTZY+tQstR1A@mail.gmail.com>
 <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
In-Reply-To: <7b066c1f-20b7-407f-9268-e9dbeafab004@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
X-Gm-Features: AUfX_myBSrf5rDcsVRuaQc_or0Um_HrH3WBYGhc9bJh3otQ1_zgZw-LE1s1AUdw
Message-ID: <CAMuHMdVXgNcxDJf8XsSjXhC5+Pq6+Z+mcn6Hn50u8KwimKt9RA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042143_974012_48FF9723 
X-CRM114-Status: GOOD (  38.07  )
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

Hi Krzysztof,

On Wed, 12 Aug 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 12/08/2026 12:02, Geert Uytterhoeven wrote:
> > On Wed, 12 Aug 2026 at 11:51, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 12/08/2026 11:47, Geert Uytterhoeven wrote:
> >>>>>>>>> +  firmware:
> >>>>>>>>
> >>>>>>>> RPi is doing similar, but I have doubts. It looks way too close to
> >>>>>>>> generic "syscon" which is disallowed.
> >>>>>>>>
> >>>>>>>> I think this should be vendor+purpose specific, e.g.:
> >>>>>>>> "renesas,scmi-transport" or "renesas,scmi-firmware"
> >>>>>>
> >>>>>> If you can tell me the resource that a 'firmware' provider provides then
> >>>>>> it is fine, but you can't.
> >>>>>
> >>>>> It provides a firmware API, which is not available until the firmware
> >>>>> provider is initialized.
> >>>>
> >>>> I don't know what "a firmware API" is. What does it provide? I know what
> >>>
> >>> It can provide lots of things (everything we are no longer allowed to
> >>> touch directly from Linux ;-)
> >>>
> >>>> a clock, GPIO, reset, interrupt, etc. provider is.
> >>>
> >>> A clock is an object you can access through the clock API.
> >>> (s/clock/.../ for the other cases).
> >>> Firmware is a service (virtual object) you can access through a
> >>> firmware API.
> >>>
> >>> In all cases, the consumer of the object or service needs to know
> >>> which object or service to use (there can be multiple).
> >>>
> >>> In all cases you cannot access the object or service until it is
> >>> available (initialized and registered), for which we have -EPROBE_DEFER,
> >>> and/or "[PATCH v2 02/10] of: property: fw_devlink: Add support for
> >>> firmware".
> >>>
> >>> Thanks for your understanding ;-)
> >>
> >> I think that's the difference here. Clock is not an object, but a signal
> >> on a wire or within IC coming from one device (provider) to another
> >> (consumer). Firmware is not a signal, not a wire, not anything which can
> >> be provided from one to another.
> >
> > Oh yes, it is a service provided by the secure world or a different
> > CPU core to the application core running Linux.
>
> Service is still not a resource. Not mentioning it is way too generic,
> because anything can be a service. We have entire services-based economies.

Do you have a suggestion?
This is just a phandle linking a firmware consumer to a(n optional)
firmware
provider.

What do you suggest?
Perhaps "scmi-parent" (cfr. "interrupt-parent", which also does
not point to the resources consumed, but to the provider of these
resources)?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

