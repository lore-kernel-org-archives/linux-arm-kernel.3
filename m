Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA6CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2+B+TCtU6LhjPX3KEHp5ZhDWyuT2oD8RctAdhdkStc=; b=no3NIOlQ1Magpp7hjS5P3+59Sf
	CxT5GEVXbjG4US/chWyLT3uXFwk1GLNY0CQ4bjrdlHYirpKGjPtZ4nykqwMvBPxiOoXdzADU+QONh
	qPeta0EBdzU7jt7Pa6/LiStmYY42MEVJri2Wr+pmpzRQmrwQuGfzXTb66OVwEwupCiJR8yzacqsIj
	4+22PUe4gKf/bVSfNZrxnvBrabYB9PTfWjR5zXX5j2I5j2SQOZJchKugH2aemQKC2igMZFxN+0aEO
	hk9puq4GKG8XKwry/yWK8FHON7D71ZVpXmuT8TH1ayEOU8hwgHGpcGH75AmrNRhaxxfnkWpWA/efN
	HDB6UblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD8t-00000000saV-2jQQ;
	Mon, 28 Sep 2026 15:19:47 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBD8r-00000000sZf-1SzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:19:46 +0000
Received: by mail-pj2-x2b.google.com with SMTP id 98e67ed59e1d1-3a47d2cf261so440210a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608784; x=1791213584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2+B+TCtU6LhjPX3KEHp5ZhDWyuT2oD8RctAdhdkStc=;
        b=Q1Oq31Md44SKMdjCMrRklaaIPQ4OT80dP5wB8rN/N4h6JJpMszS6FcvRizJrPrbbjb
         RrUBrQw4Iywt/fGC4ymkKTXkZZ3T5QyaBwtX+xwwU18YK2I0TvqNI0ktaqOje9L8/diO
         NQ5PIbQMl9p6uA/skkenwU0KY627MI0zaKWGzrxQPJaGvl+2QhJw3IQ00uBaF5bWyQRH
         yvrKSrO6G6D/0iNHNMGETwvZOTbuJdYIp/5UgUij85igjM94xQ5sYzZDS3/NKXlmNqZ4
         H2X8LNPBmWHWLaBvzWeHP+9Xd/viLVULOE/NSrTAauXCJ7d/pMUR3fwUmENMtylKw5cZ
         ko8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608784; x=1791213584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2+B+TCtU6LhjPX3KEHp5ZhDWyuT2oD8RctAdhdkStc=;
        b=RDcDEz8lgaQ+A13uAifM6+iJteUlr/P8Y9jbXUxTO4JiulbkMvtSd5ss25QJTcLR83
         P5E3xvnZru5HWMLe5Q+0lmJK+fxWucElLL+jwXCca6hsae7DNSwJivmUfOdePo2hwa1+
         5yFUIfCiO/I4liCT5iGlgaN2sU2ymVBBX7HAnXyLb8mdZL8Lvwi7BJFijnJNAE5D2P2q
         NIteS4CMXaX2PzH2n307iOf35nCwXepcq3xtPAYOuaciq6dmTOGuIXVEj0JgIHTe8KF1
         /7ivDOoRMDxsbFFw+2lyZK0Y7FyV454kjrEc0T6P8JbfOSuZBrGHtW2VfVaykpKzHuZs
         AUYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUkTZGiXXtmL4+us9SJSQfrqtCZCAZByLl1K1KqITdBvAM34PlpguIpGH39et4xBx8TB0FVd7Fysv2cxSIn4Vj@lists.infradead.org
X-Gm-Message-State: AFq9FYLvnG7DWG02KGNiHJg37RJHyhddU2mUzmSOvTvqIvPqfyDMnSNV
	wuxtuto0wPiXRO1WZxcLla735RttGCpZ8kZQMpmItR2KLSO1cD2p/Dwk
X-Gm-Gg: AYBFou3n9kZFdBQcNWjQ3CcGAtm7Z+nFeAvmdQ6nUCX0soB+I/OmdF83dliwfUsPPIE
	27AdUkCUmf0l0HUEosmXH8Zs0EiZgwYH8HjGdrMUTIVwGKBbU2pQM4w99q/2FZ3AneCvg3aT0DE
	yBs0vnCJtRRfp+LvbLLiqrlGR8ffn837F7UEpm8EX1qeUanoWHh/1EPWqHrzT9d1lsAsL0Ogj5m
	QuE0MF6znGnw2Jm25kvZ38pzDcpIsTGpOfIa2ublTDlf/esXeT3EuJFS7BrtaTNowY+SGQOU5Cl
	DG1UT24i7N62e2xXQA+kVDsFh7PH7VZ5QsSMUgffaKrwGL7+3sG9o3hQ0x67htVNocylrWyhsf9
	hNXCtmx8Lh173Tnl+Bl8CH9JV3aEeq9fnOdEq/QmCgne0r3u/R2D1XP1Hls/oXDRMFVDvbm6IhH
	OV1B0nke3c98er8qUKwIMbJuxiIdsIewLzmEU6i5hyHjFD3do8I3XbD0cWMcvJ1rZFp8i9oq4Sq
	I8I7FenA8YHKoKK2xmZy4oXdAX95GDtQNM19hT6aJJH6DL+lb2s1rTmA9fexRYlzSkBgu+BGfta
	UpO2krgP4ZmTmOA3IT9VRngEI6QHh4CnkxTNAf9fcTzfgyRO+VyvePOuHfk=
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr6450444a91.17.1790608784281;
        Mon, 28 Sep 2026 08:19:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm7247965a91.2.2026.09.28.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:19:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
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
Date: Mon, 28 Sep 2026 23:19:34 +0800
Message-ID: <20260928151934.2686418-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arn4xOIxFRD8qY_x@infradead.org>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <arn4xOIxFRD8qY_x@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_081945_397409_3F38E76B 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Christoph,

> Either way block devices must be safe to be called from paging paths,
> not just for swap but also for file system based paging.  So this is
> a bug in the implementation, and not something worked around in the
> swap code.

Agreed that a backend used for paging has to make progress under
pressure, and the zvol example was a poor lead.  The series isn't
meant to excuse a backend that can deadlock; that would still be a bug
to fix in the backend.

What I'm after is different: backends that are correct but need
memory to accept a write, where the better policy is to use them for
cold-page offload when memory isn't tight and keep pressure reclaim on
areas that don't need to allocate.  Two in-tree examples: zram
allocates on writes and fails with -ENOMEM, with no fallback, while its
logical size still shows free slots; and filesystem swapfiles must
give up copy-on-write, checksums and compression today, because swap
writes bypass the filesystem.  I'll make that the case for v3 instead.

Thanks,
Matthias

