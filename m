Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842EDCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0NvfzIhMgoDaAcmLO9lnbeC2A03mNxAZEcGsZ2ya18=; b=HhnFXF/PYwf44EP9AF8RkU8U6/
	GzKnvGRhZC25eo15NY6x5wr8eSbAPeu8rbggEeNp1iUUSem2lxAdYoNHb+cjuVdxFPlBOpzNc3g7N
	2WnHVE6b0TBDMIB7wDHbIFM7Q0mL92NPxwdjXuykP1FZEweqqbRf3CNyYEmPrtvDSb0ZKOInRpq2T
	GmiSpNN2IIMKTdso3fSHJvej+MmtSOHMx216dNEnYfw6ahblAAIcSU4ymubJvjTg7pmZ8xMJtpopa
	6Du9Iq6/auQyr5GsFsh0feFKvtiGgxlHCoYSLNvLqjblW/fNPG05+Tfbda1P7GuDrDHIS/Qysy4SE
	hW1nnkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD8k-00000000sYW-2KiQ;
	Mon, 28 Sep 2026 15:19:38 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD8i-00000000sY5-0h3b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:19:37 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc750a1482fso1725433a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608775; x=1791213575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0NvfzIhMgoDaAcmLO9lnbeC2A03mNxAZEcGsZ2ya18=;
        b=rDpTJ/p6dl2pB1RnNHo1IHB1xsYF3KMB5uq7YwCjd+xr8XUOP0xND5OWuZOwbQWNEl
         DsoYGS9LZojoY+S1sK/59iIWE8+KyGV7S7cQ8qIB+EepgBJRtodeYnoGD4YplpzSRbCU
         rqpSbgz2aw+YQg++aXwOuf0TYlamoRR3DndZ+eyCGaNZbI1m3mwlCL+JkIw3rPBbT4qv
         unuNhU2eH846bepJfT1/atM8ElHJHEmqsht6ncM8PvILyj9q+Saxr4H2rkJBCivYFSEQ
         5q4rnV6RmgtsRJ5XMXCMYxk0bln40fyGRBPLSQ1ECKCw1pqRwa4CrCcz1GFoXMHy/Z0b
         vEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608775; x=1791213575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0NvfzIhMgoDaAcmLO9lnbeC2A03mNxAZEcGsZ2ya18=;
        b=NhBlStzsIJN9oPShab9y0q6WNtjmXQGzYvPd2nzuMrzTMYKJQoE+lmb3gK5ur/rG/F
         G++6dp/EILR/uWKvcr/ya1STbvOvCE4ZoIDrXrGL8IyWf7KzSTrDx8UdBKqdPT+EPOZL
         X4jpENkNWYOwKNJC+hikFpF2forUzO5iuSGub7ORtEPgTv/kis00IsIo9Nl3lZHsce8C
         qHJ0cH4VC9bwGZn+oDf1fzh3aPwESS6U92kTIlh+qecszNdWj5Lh8Zcq+5oR0LLFuURQ
         mxwcH6Zf6ju7U7VBTw5shZlQwfKdABNcf1Bc5f/FnQsm56eHPmfxxDJ7xWqmZhpdIqi1
         Xc7Q==
X-Forwarded-Encrypted: i=1; AKwUvBysdPTm2aI3yWEUaV7I/8V6YtHGuxco+jCL/kgxIbMf+D8AjCxO5YDMCBZCmWs+2qeyhaPFDLQxxJIZC4FIsatX@lists.infradead.org
X-Gm-Message-State: AFq9FYKzPpwgxQgpLhyiDKyg8Ynu4DscGqIqQ38sNA03UncKubln1dbW
	+r1CAOhQ/tMi2c7pPb6RVcb/Bwdaqv2kMzh0Z/0kwwTnC79M5Fx+WvNN
X-Gm-Gg: AYBFou2S9DFp+0cYcotfA3p4PSucLzghSef7DAfx3pjGgEdTZaRl3P4JaACfvJp42Wm
	vec6rl7zjGcqcCW7mXKpUe6IXgWpcSByxhZb3WLeWdpQklbbRPq0hfg2tCORhS0spPu6TPVXQaZ
	GB20DNCViShLPDJj0Lx9M24zwKh3cBEAmTXUvuHI9NLr8vKSjAp91ewBSl+OkxSWGRWa05tlhs7
	QffNXN8q0RwUcbijLpDo/tfgnThCLypcw0I5riwvRqCZzj5BQC8sT6BUl85Aunv3cdZ4UzXoHPD
	QzbacfsraUeTPbMYufpBMnT9ZCM9y0+wYBwrMYAF9Jmghj3M815vjdACbIqfb4Kf0r8+DGTtO3t
	yc0+W7Dglc37QB8rDTflfjTKcHEJfm1Kh+1FMktfXULqm9sORqvW/w5bBLaF7T9gGeNkFiWPYg6
	VnKMY0ichRT22ntXAOckiAytNEjME0o+Vblq6x2Wyuo/I5FUAy5DfZwRRLAz+ks7LLSyujW0LuM
	/R4RNmTxeMhcRUlzmei4Er1ktBTwEz5vyAsROxQZMVUyOv76h737CvCoLruoyLGY9ndVV9Fxcme
	YZ1D/aaIWVbU3mTmrth9o6kh/DBWYRoYXZoRBClREZr/qIdhVLvpRl+v8pI=
X-Received: by 2002:a17:90b:384c:b0:39e:5acb:2849 with SMTP id 98e67ed59e1d1-3a0bb576e5cmr8742632a91.17.1790608774215;
        Mon, 28 Sep 2026 08:19:34 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm20891502a91.16.2026.09.28.08.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:19:33 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Chris Li <chrisl@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 28 Sep 2026 23:19:24 +0800
Message-ID: <20260928151924.2686290-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACePvbWM8kMjtJbH4vc6Qt=TBZQ-0d-Yj9NOtkepZmtNN3wd9w@mail.gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <CACePvbWM8kMjtJbH4vc6Qt=TBZQ-0d-Yj9NOtkepZmtNN3wd9w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_081936_214996_7B26656C 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Chris,

Thanks for resolving the conflicts yourself and reviewing it.

> What is the high-level user-visible impact of this series?

Being able to use more interesting swap backends and logic when the
machine is not under memory pressure.  It is much easier to write a
swap backend that may occasionally allocate memory than one that is
guaranteed never to, so today such backends are either unsafe as swap
or ruled out (btrfs, for example, refuses swapfiles that are
copy-on-write, checksummed or compressed).

> I am curious: if we never run out of swap file space on the
> non-offload swap area, does that mean we don't need this patch series?

No: running out of conventional swap isn't the point.  Without the
series, any active swap area may be written under pressure, so a
backend that may allocate can't be used as swap at all, however much
conventional swap there is next to it.

> However, direct reclaim can use both types of swap areas.

In v2 it can't: only memory.reclaim, per-node reclaim and MGLRU's
debugfs eviction may write new data to an offload-only area; direct
reclaim, kswapd, MADV_PAGEOUT and DAMON reclaim may not.  But I think
your suggestion to flip it round is closer to what I want: mark the
areas whose writes may allocate, and keep pressure reclaim away from
those, rather than tying it to what started the reclaim.  I'll work
that into v3, together with Kairui's suggestion to build on the swap
tiers work.

Thanks,
Matthias

