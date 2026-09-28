Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD5ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=; b=EdXeKSOp1P/jxtpKUSVJZXc9Y5
	esCApfm8g0bEYvr+NLcOHvX75aUenL375iOP+l0HyogwTAAraf5XAoLMdZuuVL1NqnkGSW/vnhQWq
	j9766/LTzY4h5WVGRkRXFIS8Nj5XSnyClBndL+ef4RWIyXua8DhOxzfAL6L/FKwkh3v1065qAav1a
	C9bom0eeQ4PVV9rtgTNb/vabwGzBIu3tyEhQe9BwcM86CVP2rs3GjbXngpD0jCeEZfvsE8zIfHFtb
	TF6v5QF31HumArxMCE7Qv2SYk7UGEHQyn7tAerasrk8Y5e0kj019LHEpFl/hmBH6U2FFdBs3xhNiD
	v1lGgezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDDn-00000000tDL-2KHT;
	Mon, 28 Sep 2026 15:24:51 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDDl-00000000tCk-1o2b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:24:50 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d91ede8035so27688465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609088; x=1791213888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
        b=VmNnk/+rZEnUsXAWajkrsFe2q6ajrXmL7MTFATE/EinWMZOzSjfC7C5qZs1acDdKo2
         IgaqpTExAr+nLlpgHegBS3UfuPwqcLWrverPHRGfdW1+zqVg4vrmm+1L++CPvbQQpgN3
         XMeh9qrYiJ8v4aVGQLcRYYEWeit6rUsdN0Q9dkHLofXLNYIPNBbkGKwPpGXJTFM0EDFZ
         rPzfKhA7kSHcHBzWvcTSetNTN1QWZxzV1dPvHX3LPCN6W9F8R0NrFtI6fmIQVFJmnVoi
         1eDnFYEjK3lZrPwIsVcyN3MPlkAqlal3KaWFwqadrY0jiPA2LtNyATrzi2g3keEki7UR
         TaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609088; x=1791213888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
        b=ZZdBH1yPHkIPiEOLVZ5fs9hqg/l20afC/SPrrR+eRUWB7bkUQvL4HuN507s08JTJdm
         Mj1fMS3LFDRbsVxeD7t3euFIov7Om+yAe975jSgg5wkQi6u31geMTtKEnqqWF0fVNMBt
         x5UmWPcnAZZmKaixMaVBubKTvBStH4SM+t4xvwn/pzVFazO2tf3/UZXbGdTJ7KBzPkgH
         L8sU/UAJUlIQJbkm6/4WevQKxx3b3CbeqtXTt3mpeUfkxPKNKe+4eT7zp6ZOHydJEZVe
         EeFcOCTt1P6osKXUi1pi6JVqg8NgJHT4VhU/Ob8D0Fe2cXR6k+mBKVLhZCz1/Wfr/QpH
         aJuA==
X-Forwarded-Encrypted: i=1; AKwUvBw7RxC4UgYYhm0sNv8r2X9SmjFNzTlOvgTauQNYrXJZIeZl23kU7tc61ipAF0AUh8aaO1LluE7MxOfGYBLl75cM@lists.infradead.org
X-Gm-Message-State: AFq9FYIVa1QkJR82FvVu/PuKszc/XhEy0axSpVmOavSB8z7KGb9sU77z
	DA4UfdlW+0PkvDnJMKwfGKyZ3vP3oaJ3aFcaGbhEFZdytUM5UWA8S1Xr
X-Gm-Gg: AYBFou250qpUan6vWzWJ9In4rhKD14Zp+zSuW40wai39WJoJNFUYGyVjDLnH2gGoO7Z
	FaBnmDSfIejciGlOzX0ndsTYdOI3E7Nod2PPAOdhs5NuDitweECiaUEjh4NB2owpTpha+ZXYfIv
	MjqXtVnfj6ct+61dvOUXY30vW/Rf8tGSUxed7C3vVAoWJmbnXvhoUyPWj5M6PzeoNotI7BLIFuE
	8PltjIz2fc/ShtMCvVqH72rg4gtvQnF1YN9dBYnQKn2F3Jm6HXjhFI3VEW3rWt+Wsa+FhLCIxnc
	nSHLj3b+D2pLGXy6OHFt6DOT7oYPsLUgu1Qam16nOuOWIGSTrbFiFg4V9lLRrlzIymCofH2klTf
	XwSlvoslMLZg4nwVMAX7c7hcFvkBNEoyy7F1uHKMuy0B+PU2c0MuNpeGOAnAbkpUzE4HgZ8ttQN
	pKj9Vs9aQ1aAaYmMcD8w879yhTEZIGoXWgWJ70RY8Vb/jjfENQkQnxKd4eNBXoMVBv9vAVxiOkt
	iEYdPM0scYBDqQZD+9SOaBz8XYOUyEOWG6/srff7B0IFt4Gg83ZWU1PKDNIAWpi/e/o3FSSPt8P
	fd2sqsbYcsjEMK9HjEeaB5SLjdGJPVB4R2ia/Ug8qnBoyg5HDsuzT0c7YNM=
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr71037265ad.51.1790609088305;
        Mon, 28 Sep 2026 08:24:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfafe765cdsm25166465ad.33.2026.09.28.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Vivi Rodrigo <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rafael J Wysocki <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 28 Sep 2026 23:24:38 +0800
Message-ID: <20260928152438.2694783-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082449_473776_1040D250 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Andy,

Thanks for reading it, and for the direct feedback.

> if the system is under overall memory pressure, why do you care what
> triggered the particular swap operation that is being processed?

You're right, and that question gets at what I actually want better
than the series does.  The goal is: when there is no memory pressure,
swap-out may do more work, including allocating memory (compression,
copy-on-write, filesystem-backed swap), because moving cold pages out
to make room for page cache is what swap is for most of the time.
Under real pressure, swap-out must not depend on that.

The RFC was the smallest change I could think of in that direction.
It used "who started the reclaim" as a stand-in for "is there
pressure", and that is wrong both ways: memory.reclaim during global
pressure may allocate, while kswapd with plenty of free memory may
not.  Building on Kairui's suggestion in this thread (swap tiers), or
on virtual swap, may well be the better route, and I'm looking at both
for v3.

> Why can't the kernel figure this out itself?

It can: the backend knows whether its writes may allocate (zram knows
it compresses, a filesystem knows at swapon whether the swapfile is
copy-on-write or compressed), so it should declare that, rather than
the administrator setting a flag.

On the practical questions: v2 does nothing to balance fullness
between areas or to empty conventional swap, and does not change OOM
selection.  Those are fair gaps and I'll address them, or say
explicitly what is out of scope, in v3.

On the recursion question: within the reclaiming task it can't
happen.  memory.reclaim and per-node reclaim both run with PF_MEMALLOC
set (memalloc_noreclaim_save() in try_to_free_mem_cgroup_pages() and
__node_reclaim()), so an allocation the backend makes in that task
never enters direct reclaim; it either fails or, unless it passes
__GFP_NOMEMALLOC, dips into the reserves.  Two things do need care.  A
backend allocating there can drain the emergency reserves unless it
passes __GFP_NOMEMALLOC or fails fast.  And work the backend hands to
another thread, such as a filesystem or zvol worker, runs without
PF_MEMALLOC and can enter reclaim itself; that is only safe if that
reclaim never waits for the write the worker is meant to complete.

> The remainder of the writeup is IMO somewhat incoherent.

Agreed.  I cut the v1 cover letter down too far and lost the
definitions it depended on.  v3's will start from the goal above and
define its terms.

> Adding "eligible" to a bunch of calls does nothing to explain what's
> going on.

It exists because v2 made "how much swap is free" depend on who asks.
Reclaim itself checks free swap before scanning anonymous pages
(can_reclaim_anon_pages(), MGLRU's get_swappiness()) and before
allocating a slot (folio_alloc_swap()), and callers such as the GPU
shrinkers check it before pushing objects towards swap.  With an
offload-only area, each of those would otherwise count space that the
calling reclaim may not use.  In v3 I'd keep get_nr_swap_pages()
meaning "usable by ordinary reclaim", so those checks stay as they are
and only the offload path asks for a different count.

Thanks,
Matthias

