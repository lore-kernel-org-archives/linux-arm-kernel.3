Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ED4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=; b=KM+3bdYmw+kr3D1UIxTfHmLBQm
	jFM4L1/qT2vgxvsYx9Lr9512tG0d8jgAIol7+NquDznEOse0C4wEeBU526mjuPm7YOe0lEt5iaep8
	M82y3jOKL2WqjJeQ6gUlgm7Ca7SEsDTcP3UTzrx4WHA4wHYgSnPYzDT+eVPlROVonzfo7nnuqzi4j
	zWobVVCX10VP70kqtPeyofAUa8xXWEk3b6pFIeQE7Beg8TUVrKE+vRYO9KGuA5PJxwUhhyJAUOLFg
	32NDhaqb+NumLIAM/LzAxSzejLv757x+0zfo+ISMRc43GooLQFkdEEzZt9wvcmyZV2Xp154DDT4WZ
	ff10UrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjxk-0000000GN1s-2JxX;
	Tue, 12 May 2026 10:03:40 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjxh-0000000GN1R-2JI3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:03:38 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4232323a7daso2466777fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 03:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778580216; cv=none;
        d=google.com; s=arc-20240605;
        b=FH1F8NnIW5HIsw3dYxRing115Cz89p+cbpWZ2ne36UNQbr+rcuWZnI7r3V6PfOu2Vj
         9oA9xhI2vz9fujlHgdYTesjdeATz0P+RBGu9yj3BLsWh8vG5CWCapBD8ASvWd4gz6B7t
         ms9LCe9Aq0Bn5EYbUBYBh1+WK4oDEWEwi3WnH25fdpc5dO87tfzRoc5ATo4pWk7T5623
         cvMiPzZpZYYz2F48AJOaQmwuOes3VxHRwIQluYwEV+lGt3x/WMLsDZfqOk6vQmvoqq55
         phNHU10FRzN//nBfpeY8rOm/xRP25AiV5cssdZO543jDbNUFMMmAtMVK9Tb+dFO35KHD
         S+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        fh=2munFbRi39ZED7t9H8hPbTULjaWZxec1lqQcpleceVo=;
        b=ACOQaWN0pOIjNon8dh+v2nrWScaylduEEd92rsqUq54VPuvhz3ir5NJmlK6y2tdd0G
         gTDhxqkn2wP/kcj1TAYC3GJ7uPnhLbpZGCkilXsmdm+M7kjTRCJmN4QI114cHOyucD1H
         aSyiFPcadFiwuG1K+ZdHFu6zrlaXqXt6q2qoSJZV6gtqY3FiUuYxQ23g4qx6Kcxf+cqq
         c+JSqMG06xdmwjlo0pa691Lqk/WD4mXRs9FhA25KYuFIsp9O22RKSI05uszwu08eUMLz
         PsKFJ3X1VsjCgBNLs22p1qHP9adIXyprNOjOLZHWe/PpjMHusHfx5dtKr17clJjQI02J
         SySg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580216; x=1779185016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        b=DpPrq3AeJ2JThZ3W4oMwj+1R4SoHtZUxYJOpItoX64m18vMdQoQy491VQMX8W7nnkA
         shOscSXM3RoF5Vr1/vWcIzmisaMRzJhguH1noAIniMS5kFSjtDjptfr/ZnKktyI8lnYO
         1PYTR+PL5wSNiQ7J7lGnEsRLFAw6BrM22RbjWDbG1BSR2bj5ol1yo1VVdOqroQ21/Ots
         /hlXxohrt8NOhq9AUyTPy5vw+ggSANx5Y8tqPKY6IwwFz+d2LsVOyZ611lEAalNgSfEe
         nqH4ppAH0uP3xCq6eXt3BhbSQ6ZAz31O/0x/tMgkrnLguX/Jy9YMfHuugvJF3lr5R5P4
         bjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580216; x=1779185016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vpyC9g/4a6soW3baW1ZfRfFD5ejqC8VcJYB7ujrZwE=;
        b=edawYibds4DfnlVxaawlPfy0dlgsIMDKXVW7q9b3aL/OTFcEzSPzhHOK/mK1VnJ5Tf
         mbs6d4u8pDhLyC+RvlCna7s+B20lqxnEe1N8cZegb0rZt7qpRAXmAByEzjppoA+rA+N5
         VvEw5OK1FmRIF0QYQOsdZKSKpH/tBFuudmeJp2OGySw6vRPTkq+1y7LMqxAApw13431n
         rHUm0urqidNCtz0ycpoXSM/kkveJcvovsz1hYvODdCe7Hxuvs1zklUi559Px1twyJt82
         MJfgZ1KvrQ+3tAXEfjzxi6e3oc5hiQCN5A/4QxHI1mIMls+vpcfMdUmXsQhqElWuOlPL
         +brQ==
X-Forwarded-Encrypted: i=1; AFNElJ/O1LduA0wOfASx3Yp8+FCAIgkm/Lmi/rCBxKV1vdjNMzGXjz6nNtWIWz/iJuTdElmfL4zqssyDWVz/juFyQzc2@lists.infradead.org
X-Gm-Message-State: AOJu0YwjeRBUUitaLgnTk32g0Mbcuw9h8iMwwtcd7xa50Bon1myqTyEw
	4ndZGjkMzWHBsGdZIFNl6o7vIF7fWKJowl36KfWm3nSbWfHAnDG4o3Yt06JBJDA7jdo47x07WPf
	I97BUmuQW4r8HZQeBjgYe0U79rhoxhc8=
X-Gm-Gg: Acq92OHGFvKTT+YMTCJp6N/h+TZZXIStBXcSmDJilVZPfn5IFX0K3E6EtreoSTxEaUK
	Cg6hMV3WCWrpiyoEV7fZRYOtkUpuDYxBOnFqBqCfT7jtEieZDungm0gBzA3KypqhKqadRBxzB19
	6WDWE5WqOBbwuTtHSbg7gYCc+B5PfVMxzmkNmME2szsc0WOm+k7+NEh/25999nnhv5hJV/oDJsR
	WJsZdRJObC4VWme36JyBL9MCnoBSglKAfHBkynb/8kmuVi/nJ2GUx3SR27fc2pmirUs7BYona3l
	hfmLhSY+6xDXNM/CZ3WBESrL7U7ng1GQwDdRCQ==
X-Received: by 2002:a05:6870:55c6:b0:42b:d0fa:771 with SMTP id
 586e51a60fabf-439a29aa5d3mr1258410fac.21.1778580216477; Tue, 12 May 2026
 03:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260512060627.3781329-1-danishanwar@ti.com> <20260512060627.3781329-2-danishanwar@ti.com>
 <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com> <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
In-Reply-To: <6a1f411c-d7ed-463b-abf1-277d8cc0c184@ti.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 12 May 2026 11:03:23 +0100
X-Gm-Features: AVHnY4JoBEuCCshjttiiP4pUrkdFzUklGWLsHa6Nwoh6aUuuy2gt7vVqJ1dT2a4
Message-ID: <CA+XhMqzx9CUX5H7q1UqL=heGWLFjZVfyiTx6b45VW=E9t13Fow@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: MD Danish Anwar <danishanwar@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jacob Keller <jacob.e.keller@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Kevin Hao <haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030337_601853_5A136804 
X-CRM114-Status: GOOD (  40.64  )
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

Hi Danish,


On Tue, 12 May 2026 at 10:40, MD Danish Anwar <danishanwar@ti.com> wrote:
>
> Hi David,
>
> On 12/05/26 1:28 pm, David CARLIER wrote:
> > Hi MD,
> >
> > On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrot=
e:
> >>
> >> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
> >> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
> >> directly from the corresponding stat descriptor arrays, so that adding
> >> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longe=
r
> >> requires a separate update to a numeric constant.
> >>
> >> To make this self-contained, break the circular include dependency
> >> between icssg_stats.h and icssg_prueth.h:
> >>
> >>   - icssg_stats.h previously included icssg_prueth.h (transitively
> >>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
> >>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
> >>     "icssg_switch_map.h".
> >>
> >>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
> >>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
> >>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS=
.
> >>
> >> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> >> ---
> >>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
> >>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/ne=
t/ethernet/ti/icssg/icssg_prueth.h
> >> index df93d15c5b78..e2ccecb0a0dd 100644
> >> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> >> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> >> @@ -43,6 +43,7 @@
> >>
> >>  #include "icssg_config.h"
> >>  #include "icss_iep.h"
> >> +#include "icssg_stats.h"
> >>  #include "icssg_switch_map.h"
> >>
> >>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
> >> @@ -57,8 +58,6 @@
> >>
> >>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
> >>
> >> -#define ICSSG_NUM_PA_STATS     32
> >> -#define ICSSG_NUM_MIIG_STATS   60
> >>  /* Number of ICSSG related stats */
> >>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
> >>  #define ICSSG_NUM_STANDARD_STATS 31
> >> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net=
/ethernet/ti/icssg/icssg_stats.h
> >> index 5ec0b38e0c67..b854eb587c1e 100644
> >> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> >> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> >> @@ -8,10 +8,15 @@
> >>  #ifndef __NET_TI_ICSSG_STATS_H
> >>  #define __NET_TI_ICSSG_STATS_H
> >>
> >> -#include "icssg_prueth.h"
> >> +#include <linux/ethtool.h>
> >> +#include <linux/kernel.h>
> >> +#include "icssg_switch_map.h"
> >>
> >>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
> >>
> >> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
> >> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
> >> +
> >>  struct miig_stats_regs {
> >>         /* Rx */
> >>         u32 rx_packets;
> >> --
> >> 2.34.1
> >>
> >
> > One thing that caught my eye: icssg_all_miig_stats[] and
> >   icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
> >   ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
> >   and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
> >   includes icssg_stats.h, so every .c in the driver (classifier,
> >   common, config, mii_cfg, queues, switchdev, ...) ends up with its own
> >   static-const copy of both tables.
> >
> >   Would a static_assert() work for what you're after? Something like:
> >
>
> While adding more stats manually, The ARRAY_SIZE() approach was
> explicitly requested by maintainer [1]:
>
> This patch is a direct response to that feedback. static_assert() would
> still require updating the numeric constant on every array change. The
> goal here is to eliminate the need of manually incrementing stats count
> whenever new stats are added
>
> Your concern about multiple copies of table is noted and valid. Could
> you advise on the preferred way to reconcile these two requirements? I
> am happy to restructure if there is an approach that satisfies both.
>
> [1]
> https://lore.kernel.org/all/20260112181436.4s5ceywwembn674r@skbuf/#:~:tex=
t=3DCan%27t%20this%20be%20expressed%20as%20ARRAY_SIZE(icssg_all_pa_stats)%3=
F%20It%20is%20very%0Afragile%20to%20have%20to%20count%20and%20update%20this=
%20manually.
>
>
> >     static const struct icssg_miig_stats icssg_all_miig_stats[] =3D {
> >         ...
> >     };
> >     static_assert(ARRAY_SIZE(icssg_all_miig_stats) =3D=3D ICSSG_NUM_MII=
G_STATS);
> >
> >   next to each array, keeping the numeric #defines as-is. Then 2/2 fail=
s
> >   to build the moment a new entry is added without bumping the count,
> >   which is the case you're guarding against =E2=80=94 without touching =
the
> >   include graph.
> >
> > What do you think ?
> >
> > Cheers.
>
> --
> Thanks and Regards,
> Danish
>


  Thanks for digging up the context =E2=80=94 fair point, I'd missed Vladim=
ir's
  earlier ask. Reading it again though, what he calls fragile is the
  silent miscount, not the keystroke of typing a number. A static_assert
  turns "forgot to bump" into a build error, which I think gets you
  there.

  What about moving the two arrays into icssg_stats.c, declaring them
  extern in the header, and dropping a static_assert next to each
  definition? Numeric #defines stay where they are, icssg_prueth.h
  doesn't need to know about icssg_stats.h, and the tables live in one
  TU instead of every .o in the driver. If the count and the array
  disagree, you get a compile error on the spot.

  Probably worth keeping Vladimir on Cc for v2 in case he had something
  else in mind.

  Cheers,

