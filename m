Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4D1CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=; b=GCYdbQCvr/U8rLJcwphrHh7gq9
	sc20K0olqQT8y6Kl3cZBee/M8ZT3kztdTLvpRvxDEVtYOiSeqMHO9RhKzkWZ7XCCtdy28s45NRnv9
	vjOCq6oCRFzWwI9NK54ZS30SqyxkL52MV2gShDECoOtEKdWSV/fdZZs86QXEtl5WLbo7seF+OZHs7
	PZkUNmFiHbVvlZQGoZoHTIod21RhEXgVwsOWV4PEMAs0M8FR1nX3jXHOOO6dyetIQbQVrhJV12uqO
	tOzlmKdde6yXZjoCeQJPTS3nOVgyLEIwplbWHip2+AbM4jtmSzsBJ/SEE4vFalnlXWJ8psB6YF4b7
	jXa/k4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQiz-0000000F9od-1Lin;
	Sun, 04 Oct 2026 18:14:13 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQiw-0000000F9oC-1SmJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 18:14:11 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so567203a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791137648; x=1791742448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
        b=duGhMeSrsXCK1iGiEAU5KxlJBB9/tsxBqF7UzUfPKC0ZnEeNknq+IttUS2PV466UEK
         rCQlJNiZ3mrUgHEnm/foZXO3zbUC/Io8uXUe/L53prKEJCLm27gliFTTHrxpdwtWTzCy
         CScXwDa/q0bcQ1Nr41bwiyDg51fo+nP+6U9yxFvavOBIIHKnrJFuVsnvgfAjGTe07jql
         CWrNZR1qXpnWtE2Mu2kyF3h1pBkQHiaOt3lAqRfwMaIavMeU7TdV9M+V1HAay1qRFLOV
         0j6Gn6Oma1OI3ZYekds1uPtiwfZH6FTcX54o2Auxfo6RAOnX1pTSamEehYeDb5+1UA0p
         53bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137648; x=1791742448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
        b=vOprb/XvOeqRoFjW6kAJ8mGHvPTKeaJ7/PZQ28IH4yS5QQgSdIKzzlm1wpKGQsAJF1
         zSH3Y+TmlI0cZZxCAM/DASgknwA92MequD2xFOFAEFUZFTkf41+mjXZW0jzmDksRal6h
         Zk3E30rARxLwj4FsKj2HUWdLgaYtxEbTt9jqtKoXpIfRcXMk2746wNbmKl8zcV5srFey
         sgSyJSb+tIfG7WVNnXqqXXRCnvS/JIFm0d+sRedX3jeG+jpIMa9DXlsAA7sq07gY0qnO
         pQ9kqwHLi3phiNx2E+oYHrxIenBeVEPi+XDd6MooBJkEpesXDClqbQwCMM5SoL4kWJ8H
         NA1w==
X-Forwarded-Encrypted: i=1; AKwUvBw3gsP8nDMOn1uWl9glT8SUJ6Mc2HRm2JEIK4iYzvWXgoV4PLQJmgQZ+wBWC2faXYn2oP5/4cvlCfglMzxS2foB@lists.infradead.org
X-Gm-Message-State: AFq9FYLZ2dJrJWTBpD/AOiXl/+rSNskLc1DlNkrDN3HrKc5sQbaTYM6N
	qug0odcNgYE6/JViszmqViyfoehxc8oTOBpj74h5zYIsNr6qaedQ7vhw
X-Gm-Gg: AYBFou1XqAljfmzirXN02we+cjduyQaCm92bnJ6weCvM8gOgUyDDagqaL1pvfIhVcxW
	lMnLQoFqKDVSuWr/WSDeee/Pi4Kd6AW2D8xNIb+qQR9KikrCyS0psfuZDaBwm7DEOxHimmSoBV5
	NBY/cATwgJO27V1wUjSINSz9yZzJRjOONpDy2nS+KoJbkuCQg7mzD97TFHIl8qWe1An+4C913xK
	qzY4wGxwUiacxiurVFx0G9q0D7+1GGhP6/Gcd0WzRzWjrH2PT4adsciJjdTBp+3se5w3fNCl5gT
	GPrK+8i7+MDdc/Vce2Z6E97yuhPpReUdxZSh0atCQHcuSYiG1vyH55jrBRTk6GcPxasnFMfx0iE
	3x4FTgSIDJ74nvHBlYJlZODKVmRor3FxEcmF108S54drec27HNWwAghL//+mYCvhfyQf0/J1Wgv
	omjnx1qVJRfcAn8A6WGknrPPKX/gIu8sJFiPfVWg8aOT47WywYr88tXOb9MjN6nMH0Wibwh35Vu
	deR+Iz8wFxqFklmfc5QHXfwEpNPQQPi1eYNdBg69g==
X-Received: by 2002:a17:90b:4ac3:b0:3a0:a781:2c39 with SMTP id 98e67ed59e1d1-3a6ce3a978dmr7662178a91.7.1791137648512;
        Sun, 04 Oct 2026 11:14:08 -0700 (PDT)
Received: from gmail.com ([220.85.166.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d59f1cdsm7460304a91.0.2026.10.04.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:14:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 03:13:58 +0900
From: Youngjun Park <her0gyugyu@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Kairui Song <ryncsn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Message-ID: <asKXZv5SxBtxQxqf@gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
 <20260928151944.2686626-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928151944.2686626-1-matthias.goergens@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_111410_399656_2B18E319 
X-CRM114-Status: GOOD (  20.05  )
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

On 2026-09-28 23:19, Matthias Goergens wrote:

Hi Matthias !

> > Just like we already have a "swappiness=" parameter in the reclaim
> > interface, perhaps adding a "swap.tier=" would be better and much
> > cleaner to achieve the same goal? Based on Youngjun's work here:
> > https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/
>
> Thanks, I think that's the right base.  I tried it: on top of
> Youngjun's v11, a "swap.tier=" argument to memory.reclaim is about 40
> lines.  In a VM with zram at a higher priority than a disk swap
> device, and a cgroup whose tier mask allowed only the disk, ordinary
> reclaim in that cgroup stayed on the disk, while memory.reclaim with
> "swap.tier=" pointing at zram went to zram only.

There is an earlier attempt that may be worth a look.
https://lore.kernel.org/all/20260618044857.69439-1-jiahao.kernel@gmail.com/

If you go this way, the discussion in that thread worth refering too.

> What it doesn't cover yet is reclaim outside any configured cgroup:
> under global pressure, a cgroup nobody configured still reached the

Right, so for now every cgroup has to be set to exclude zram, unless
another idea or more code covers it.

> zram tier.  So for v3 I'd like to add a system-wide limit on which
> tiers pressure reclaim may use, on top of the per-cgroup settings.
> I'll wait for Youngjun's v12 and build on that.

I have looked through the whole series, and I will keep this use case
in mind while working on v12. :)

Also, to share what I had in mind, I was planning a sysfs interface
for each swap tier, /sys/kernel/mm/swap/tiers/<tier name> (exact
naming TBD). Maybe the system-wide limit could be handled there as one
of its use cases?

Let's discuss it in more detail after v12.

Thanks,
Youngjun

