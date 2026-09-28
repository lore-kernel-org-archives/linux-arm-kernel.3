Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40096CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wXI30xoHEFIzp1nZZ3HcM6IjWcoLUOaEIDAeAGQdHQ=; b=s85VQt2FdFSbgDFWiiMa9Pn83Q
	hhUfMLt6nuVqiYTb0EU6WAub4GXsYWStj2vXFyl0wWXu8g/uEHRnErkkqO92XGfhPcbVoIJLYuonC
	n9MN+JirvAehK7G5yU2ECJxiFi1XcIFdNKfs5oEw6D0fopZagqe2u0ZCyj/gtACCOGZuCAjQuKUn3
	vljEorz1+TWHLLXarXB49Z1sfnbQXwKD9Rm1OHuoDA9xVQSjeCxgy48xMd7u9FB9dEsXjxeBHf1Tr
	gwOJA2ueh6Uo02ZBLXqSaVbCb6j5g8D42YVY2qXFDNoksKux1hkpZpXmMSaIRstLSNBaiuzU3+yjq
	JeTXMGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3la-0000000HLvZ-1Sww;
	Mon, 28 Sep 2026 05:19:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3lU-0000000HLuk-0rJd;
	Mon, 28 Sep 2026 05:19:00 +0000
Date: Sun, 27 Sep 2026 22:19:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org,
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
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Message-ID: <arn4xOIxFRD8qY_x@infradead.org>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
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

On Sat, Sep 26, 2026 at 12:55:13PM +0800, Matthias Goergens wrote:
> This RFC adds offload-only swap areas for deliberate cold-page offload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.

Out of tree code not matter.  Out of tree that violates the linux
license terms even less.

Either way block devices must be safe to be called from paging paths,
not just for swap but also for file system based paging.  So this is a
bug in the implementation, and not something worked around in the swap
code.

