Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990FEF54ACE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dX91cjvlM2yf0by5+MQRb4126il7+nZRZllt3soyyC4=; b=qfkubN4/8JThxYun+FAVBgvowr
	EP217GGiJOixqczNl5zy7DUwup+7dmg8q9A2IvRk+uv4n5b6bJ1rDZy9mg0jeGrMcCyYAFbP8ZOre
	PIyy9E1Z59e4kOg4x7xKeyCX3wxj1F5c//VzS76NZV5MlbXdFLD6ZUxR7iQHTisO792Vzwbur+Sfl
	iPGX32A6xI4KcVHCIGJmmQYabxgn/z5NStpzOFJHUkwTBYqbYDquBSfym/+5UvaN3H1JFwMkTK/0Q
	wHOo2JaLM/kmINQUIuZTQSUZudTqTfZrWIatJU5kRfPfnEZJTWZhtX/R1+fcnjf0RT+xi+Jg8sFVI
	LXt7h2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53km-00000001lnk-1kHp;
	Tue, 24 Mar 2026 15:33:12 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53kk-00000001lnE-2vJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:33:11 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-950baad7b69so731517241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774366389; x=1774971189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX91cjvlM2yf0by5+MQRb4126il7+nZRZllt3soyyC4=;
        b=rk1lhfmkm+SvgYUtL4AY6zbAvHrrRy2+qBQ2KinGIiG+vHtiBXc3sp+GIfk1dGn8bI
         OS6/G6buLm4LahSpSrivIJUCRh4AVDbbjIdVGQc25T0phv3W9KGjQ8E8iSSVKoRFW4vU
         UNkJIZuD7Li0M3WjsrKwbpxyjUcGz7caWswayU9PA39jP4Jo1g57xfxeMiXaaiQ0FLq4
         wBJeBra4hU9trLRgjs5h97G3qXrq/qyDLZr80JexYIVl575WDkQd6gvbFfnhsEIWSsVM
         jEgnPYN1MZ8jA09DBmIPVNjrKWtUo37TxuSgZAAUuD6PTOsqCCENdv5TvTVCsqlqqy67
         ExqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJKHeQDyLxsMGbhKUTaoRyV62jwgT0m+5DeoeTlwyXly4lU68OD0GRYdnCoLw7dycMiD7YuvOwpgsfOGuObpZb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Ykcw1C6yVpKO/jzQc+v9m9weIkygIcfiBb9oWJApN12fEtik
	MoD/fjrSLOjV4H/s785ZQDtWc0OZpCgTrDO0o0QQl4zq9gD98fZcKI+j7CyNexINWcQ=
X-Gm-Gg: ATEYQzxKjfp+dnNGnqKIaurk89d4CXycCSTMNLS4WdeFJSO+Had1DjJ1bYhWGyVl/81
	3xG3MZ+nHHqcUsG283BDQsE3a85Hykj2EXgggQsimpeS+JY6XAGrE4v1rDFuRLTt78U3grc7nf+
	P3pT6yws6cigaUo1CCU0uSmtkIt0P+8u9Q7drmkW9jIONFdZjUjKjNJ5P1zHGSwQbEANWC/wy7s
	e6EW/n3adcQebQDZyN/qXoHH9Nw3byTIFZ5yT7ABsMb8u03hwVTsuFmLhAWBR9ufQ2aDxIpTcDY
	FK/96ePxrnJdj5l9x/UM2BjiwUG3pUB4leM4OMawIvCpjwGQOwfzyjAvgl4YQMLwwIq7qQGBiS1
	cakXwMQh2RzOs+BUHCpQUiyaEH4zQLdovXvsWYiEYuxB2qy7ySMITBtGEtUwCM5TVwjipazCBLq
	iwNbGj09z1uPcoj/rkpo4XskeSO5tSFm4SbbL4uMv/1PL0aW9j+VfqOrGCO4A9
X-Received: by 2002:a05:6102:580d:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-60394891e72mr160289137.18.1774366389053;
        Tue, 24 Mar 2026 08:33:09 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ea547sm10868826137.6.2026.03.24.08.33.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 08:33:08 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffe6887e29so1017710137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 08:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn7q8gpphrDS8sxKV3t1mEM2SwxsFOXd3gvYF84CEEakXtCzKTOOj1bWJx83/vyNdpPz20oqbW6GcGaDgokNp9@lists.infradead.org
X-Received: by 2002:a05:6102:3710:b0:602:6c8b:4c1 with SMTP id
 ada2fe7eead31-60394984ea4mr160731137.34.1774366387796; Tue, 24 Mar 2026
 08:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-scmi-clock-fix-v1-v1-1-65c21935824b@nxp.com>
 <20260324-lean-bobcat-of-reputation-6628b5@sudeepholla> <acJI7o79lVNMjV_d@pluto>
 <CAMuHMdVcE439Cyn-TCoioLZXP-YpqObZ0UF8F2NvMCZ41eO6QQ@mail.gmail.com> <acKhJ8Z9WDvHEnYL@pluto>
In-Reply-To: <acKhJ8Z9WDvHEnYL@pluto>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 16:32:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
X-Gm-Features: AQROBzBN0dbSC98PQ2QVW1vr96tinjmd_XI_AcUn3qO4saxxiTbxjn88h5qmDk0
Message-ID: <CAMuHMdW==oMpCS==L8ADexPC=4uczNwK5UD6DequBjGOKQfOZw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: clock: Relax check in scmi_clock_protocol_init
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_083310_742295_B9D6D287 
X-CRM114-Status: GOOD (  39.19  )
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

Hi Cristian,

On Tue, 24 Mar 2026 at 15:35, Cristian Marussi <cristian.marussi@arm.com> wrote:
> On Tue, Mar 24, 2026 at 02:15:36PM +0100, Geert Uytterhoeven wrote:
> > On Tue, 24 Mar 2026 at 09:41, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Looking at the spec 3.6.2.5 CLOCK_ATTRIBUTES
> > >
> > > "This command returns the attributes that are associated with a specific clock. An agent might be allowed access to only
> > > a subset of the clocks available in the system. The platform must thus guarantee that clocks that an agent cannot access
> > > are not visible to it."
> > >
> > > ...not sure if this sheds some light or it is ambiguos anyway...I'd say that
> > > NOT_FOUND does NOT equate to be invisible...
> > >
> > > ...BUT at the same time I think that this practice of exposing a non-contiguos
> > > set of resources IDs (a set with holes in it) is the a well-known spec-loophole
> > > used by many vendors to deploy one single FW image across all of their platforms
> > > without having to reconfigure their reosurces IDs ro expose a common set of
> > > contiguos IDs like the spec would suggest...
> > >
> > > Having said that, since we unfortunately left this door open in the
> > > implementation, now this loophole has become common practice
> > > apparently...
> >
> > When I first read that paragraph, I was also confused.
> > What does "not visible" mean?
> >   - Not present in the clock ID space exposed to that client of
> >     the system?
> >     Yeah, multiple different sequences of contiguous IDs, depending
> >     on client!
>
> Yes that is the most spec-compliant interpretation usually; in general
> across all protocols the SCMI server, through customized enumeration
> results, should provide a per-agent view of the system: this should help
> handling shared or virtualized resources, since the agent always see
> only the 'illusion' provided by the server...
>
> ...under this assumption if you dont even need a resource at all (not
> RW nor RO) you should NOT even be able to see it...this in turn of
> course means that in order to expose a contiguous set of IDs you should
> be able to properly configure at build time the FW resources on a per
> platform basis...
>
> >   - Return failure on CLOCK_ATTRIBUTES?
> >     Which is what implementations seem to do.
>
> Yes this is what is done leveraging the gap in the implementation...I am
> not sure that the non-contiguous set of IDs is supported if not by
> chance as of now :P (especially in other protocols)
>
> > The next step in the fun is when the system actually needs to know the
> > clock rate of such a clock...
>
> Well...that seems a bit of wishful thinking ...

Unfortunately it is real... [cliffhanger, to be continued... :-]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

