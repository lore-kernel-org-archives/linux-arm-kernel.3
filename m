Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98681CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR3Y4U+9jEsROKJfJw59rI/EkalzjoLUt+5BWaKi6Y8=; b=CvoKWB7eLt8gavpJX8/mey+tFG
	iYMD5UfbRhKgzJoGuNUl2izO0h+3o4QUmxHTfjAxRSNHt4wzRae7ORsyZUiANdEPcyjH0pVS1qyIC
	k97JaeACn9Jx3JE4fcisRBU1/rGtfNSCzUvnGo5Y4xS6QyneSnMIfZspUhOew9cQdGCPm0lj+66UV
	HYRfc5QfZN1gBVZ3iSScQ1nrlaeifv4JdTD0qu4o0eacxNlctv1kJC8aSfKIni/htIdlX2C0wlog1
	b+rIrMZu7FQYX/oA3VN2ORUAoPjPf0k+oWLe0FXr0KoIg41wLsb2vrRSL2OxxLQgtmFgBh+X7gQh7
	IgljDQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySmm-00000007Urc-40lO;
	Tue, 16 Sep 2025 10:19:44 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySmk-00000007Uqm-0v0E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 10:19:43 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-557a2ba1e65so3578121137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017981; x=1758622781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR3Y4U+9jEsROKJfJw59rI/EkalzjoLUt+5BWaKi6Y8=;
        b=YzW+6WVO1Qe9OmUSTyczle8YSdiNwTZzvRU2191zFawglHn0XGACQrMfvT+G5bd3sf
         n5RmH5H98gE3Nlofg1vW+VEbGgSgRb354L8OFZkomYMhxWviN1Z15xE5sotLsbZRKqu4
         HeLTs6Nt/u9PdO0k2WShrBgjhzlUjtvjqqA5Tr5lH/CtLHE2P0G1Bu1A+RlTrocdZUwb
         4M3CP+xX4wtllapLQfPfJF1iucmA1QNGvvY+EODMWdQARHnXTO0BtPJXzY1zq49iYw+0
         3vdx6z6LXaKOSvXlCQEf6w7CCHpZHX79GQY72sfDUXf8VaTiVWLurnT2ViZUNC1rjfwF
         iCfg==
X-Forwarded-Encrypted: i=1; AJvYcCXBuUAEXqAk8bN/6U0IJCssZ4BSeVPBSRKb+nerIM7bUBNOxNOYqWet84OLM5sEoYD47ca8xrOSWhNvkc7bTlMN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlb9JI2iDrikdiQFhLZfatEHLjV5gshfuKU+5RL3og5hiUW2YU
	EzyT77S6OQaw8WAzZC0Ctx+amjZLC+LDQjBGOBjhnU02RKYlkaOY5xH8O1Y9+4Bp
X-Gm-Gg: ASbGnctwhitXcEgC4r0HLELrrnJL8krpRj3Wbdap5PgNQLUhxjmSORndk5elEmqmuzs
	kARt5rIFsie2fFQv1ruJw5gCKoFix/GPGIme3MhZJM3MmK412a0dS5IPAyK8S4ttyTky1+Sanua
	cGLAm4UIkj0zFi9vghxp76Qv6axybc3oNKbEPM59i/82lboXxknMxJLkb2TUkB3LjXllF/RKcu3
	TMW51q5bBcUhsq7RWsFuqxt+Bo4jdlE22Lji68xFMUNrDQJfF55ez2Gehmrw5ablhupnsdxTOt5
	cWi2ri0mKE2FbMmvgV1Fspd2u/gFsDCFKgWQeyUEC1BvVvqUQ+3t1xFlHs9jO63y1dSMYt/mbMe
	LJut9iJturj5A+ojWRnZZv/WsIOOd4OOw5GG3+Pkx9iUp4NSgQ9vFa/rKiSL7
X-Google-Smtp-Source: AGHT+IE2Ueiej+HPc/dl/mHxXMNTqgSYWGUNkvxg43tRf8+yv4qxK+UUy4AFpIAzYV0dOwh6+nPwjQ==
X-Received: by 2002:a05:6102:f07:b0:522:a762:8e5d with SMTP id ada2fe7eead31-5560a011ca5mr5538214137.13.1758017980654;
        Tue, 16 Sep 2025 03:19:40 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55370649fe7sm3306288137.7.2025.09.16.03.19.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 03:19:40 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-55785303d1fso2041558137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 03:19:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCRSKLAREDenGarv6RE9fZ9vaQSYT79UjxP7QCXXpWmZLCZ6UBIDZZTKUQMBR0lcopU0R+OGYzbhOEDl3kXNiK@lists.infradead.org
X-Received: by 2002:a05:6102:374f:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-5560908dc48mr5549412137.5.1758017979210; Tue, 16 Sep 2025
 03:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com> <87qzw7i0k9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87qzw7i0k9.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 12:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQTftuiPGw3j-u7bzScs=UmsFruCKvSq-t_=JuKmpB=Q@mail.gmail.com>
X-Gm-Features: AS18NWAlUh-W1y7BXcMGcm9tJYfZlPplczM9NMOiyqYXewDD8MKxNGtLUFMdjw4
Message-ID: <CAMuHMdVQTftuiPGw3j-u7bzScs=UmsFruCKvSq-t_=JuKmpB=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: renesas: Identify R-Car X5H
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_031942_265645_9765800B 
X-CRM114-Status: GOOD (  19.05  )
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

On Tue, 16 Sept 2025 at 04:38, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
>
> Add support for identifying the R-Car X5H SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Already commit 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
in soc/for-next.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

