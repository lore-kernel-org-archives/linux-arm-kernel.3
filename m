Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1531CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APJhL/UXcBCjjwICTLFT+qLin1KDXiRR0y2N5bPp8T8=; b=J6jJadywHz4AmoBt8cLLspi8LK
	6VhVoBNWezkuyWax/EQuW2xlbZBchokExdneC9yIBtL3ZQfcYskzNDjvU9tRnH4dd3BWpD0oLXkPE
	Lr27vFFEJpc/BdhVe/Y5VyAqhe5Uy5AUXGUfY4v6PMb+S1fhCg96q+Q60eGQSy0KAe/YrOKT1FFam
	V8ob2e3d5I3uwY3OzSETW/o/JpBkmVeBcYxR+mnVXIyPX/4wgT6Bc/JHrGpV+Q0KFjz3MqYF2t6U5
	muHl0DDQ5avfFh5PQ4jAKAOhYHQxAf0RjYIpH/YQmA8zTgHyj0T+Oj0e4Q3Kuu9T2b1m7CNQOTqKz
	sukY4XWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLhD-00000001xz0-42Wr;
	Tue, 29 Sep 2026 00:27:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLhD-00000001xyq-12Fg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:27:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB47544797
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A721F008A1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790641666;
	bh=APJhL/UXcBCjjwICTLFT+qLin1KDXiRR0y2N5bPp8T8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ESq97FFaS8q6O+WGq8mTMUSToYKUb+XzvsNnBGTw4Yfq//3liXu2B3bAv7bcygdli
	 EcHwpI4uM9pG+PUVngoWR6FzLO0tgC/0cKz935SPY0E8pLtZbxVA2GkK9LZprUpqw2
	 kp586WFL9UgLZZQwTNyhbLUWzYUgkY8T2hW91Gxa2Jj7QLSxcnI/egjRJOFsyE6zTH
	 MQitmOsQu/01PuHkjjIBs3OQA+lJn8aPHg151owirTWk+5lo2DtlA/4bwfsWrrPey4
	 MOb1YDPRUwN4TweCY78GvrHPfK0ZNR7urK4fizgTgf4M+q8ttD/pIntwgzWSW9hTmc
	 eAfxlQdMmxqdg==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2da4eea067so305553966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:27:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfyZKpKeCkD0NZzfBJNheudjZD+miGQRH5hC5RwdG61dVDnI3GlK5FKFZanOx+o6OxuGzE+GaUf1VXC7AbTozv@lists.infradead.org
X-Gm-Message-State: AFuF++kEMZcCO1VJKcR9llBWyNtitZlcP8YM3iX5gd4ohJj/+EAUdHek
	pqM8w8lG6I7MroLSzEzygpEHeA2aV7pRgDZcDouOdl9M89WWJ+/u+J9TqoeLJ/vpciRsDiULMjR
	tKLckR6dYKBaSBD4m1MLGHzxeS9GlavBngfSnsGm6ew==
X-Received: by 2002:a17:907:a909:b0:c26:1649:47b4 with SMTP id
 a640c23a62f3a-c2ac53fbdb4mr1170576266b.42.1790641665270; Mon, 28 Sep 2026
 17:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CACePvbWM8kMjtJbH4vc6Qt=TBZQ-0d-Yj9NOtkepZmtNN3wd9w@mail.gmail.com> <20260928151924.2686290-1-matthias.goergens@gmail.com>
In-Reply-To: <20260928151924.2686290-1-matthias.goergens@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Mon, 28 Sep 2026 14:27:33 -1000
X-Gmail-Original-Message-ID: <CACePvbW=fZ3G1JwnbiRo+_qsteN2smbbf3jX0UPFmhVyWA5_6A@mail.gmail.com>
X-Gm-Features: AclHuK_oifA42INPrgsCc_iqlMTCQtFcDVPMyqJSWfGYorE6tGAaJtv8iXHRTRc
Message-ID: <CACePvbW=fZ3G1JwnbiRo+_qsteN2smbbf3jX0UPFmhVyWA5_6A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-api@vger.kernel.org, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>, 
	util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 28, 2026 at 5:19=E2=80=AFAM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> Hi Chris,
>
> Thanks for resolving the conflicts yourself and reviewing it.
>
> > What is the high-level user-visible impact of this series?
>
> Being able to use more interesting swap backends and logic when the
> machine is not under memory pressure.  It is much easier to write a
> swap backend that may occasionally allocate memory than one that is
> guaranteed never to, so today such backends are either unsafe as swap

I actually don't know of a swap backend that absolutely will not
allocate memory on swap out yet. Some backends allocate more than
others. Because the proactive reclaim can write to the non-offloaded
swap backend. That brings me back to my original question, in what way
this series helps.

So the answer seems to be that previously, some backends were unusable
by swap, due to possible memory allocation. With this series, those
back ends are usable for the proactive reclaim now. It is a 0 to 0.5
improvement because direct reclaim can't use it yet.


> or ruled out (btrfs, for example, refuses swapfiles that are
> copy-on-write, checksummed or compressed).
>
> > I am curious: if we never run out of swap file space on the
> > non-offload swap area, does that mean we don't need this patch series?
>
> No: running out of conventional swap isn't the point.  Without the
> series, any active swap area may be written under pressure, so a
> backend that may allocate can't be used as swap at all, however much
> conventional swap there is next to it.

But proactive reclaim can also use the non-offload swap area. So if we
have plenty of non-offload swap area, both proactive reclaim and
direct reclaim can use that non-offload area. The value of this series
isn't apparent. If you don't have a traditional swap-capable backend,
then your non-offload area is zero.  That is considered a special case
of running out of non-offload swap area: never having a traditional
swap area in the first place.

>
> > However, direct reclaim can use both types of swap areas.
>
> In v2 it can't: only memory.reclaim, per-node reclaim and MGLRU's

Sorry I meant proactive reclaim can use both types, nothing constrains
proactive reclaim.

> debugfs eviction may write new data to an offload-only area; direct
> reclaim, kswapd, MADV_PAGEOUT and DAMON reclaim may not.  But I think
> your suggestion to flip it round is closer to what I want: mark the

Flipping it around might provide additional benefit. I know some users
maintain off tree patches to turn off zswap on the direct reclaim path
exactly because zswap might allocate more memory before it can free
some. If the kernel can be smart about it. It provides additional
value to the status quo.

> areas whose writes may allocate, and keep pressure reclaim away from
> those, rather than tying it to what started the reclaim.  I'll work
> that into v3, together with Kairui's suggestion to build on the swap
> tiers work.

Yes, I feel that cluster-level marking might not be needed, you can
remember which si has the offload flag. However the per cpu cache
needs to know which context might require using a different cached
cluster. That is the trickiest part. The rest of the patch is just
enough plumbing to preserve whether the swap-out context is proactive
or not.

Chris

