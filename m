Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF3C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIyxF+Qi7k1CAbmUUDi7CNayfp2ZfTJ/5aoOCD+IJaw=; b=wdCHPzZCO+w+kuS9QBmGS3ZiFN
	lCwQHbjQzVAm+M6bN+quB1UpIAzN0S7Wew9+8W0dPMR34ySfegWTzIwnGfW0zkJluYcRL28AF1KeP
	yhUr/9b85GGlMPurwUClV8W2sJLTCwwRjzJaL+tyWlIzioeGQY0cc+SyJYosiuY42AA1oRkz1O3rb
	ZzfY/Fa4ON1IwULYnP7BXpG5gnScmI2qNc35bCCYWoyaGEMJV2Wob9CBGfgmC+Tvusm/ZIyfMhlnI
	CiDCpd4CYed0Nsh5rozIAEZgwTdUMUSXP8UH5mY2kfeBwJreE4l6oUTx3N2//jbuX2+w8XOKX+I7G
	+zHI+6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xHp-0000000EKFw-1fcI;
	Thu, 24 Apr 2025 14:10:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w0Z-0000000E54k-3BRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:48:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 123541063;
	Thu, 24 Apr 2025 05:48:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAD703F59E;
	Thu, 24 Apr 2025 05:48:50 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:48:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, wangyushan12@huawei.com, caijingtao@huawei.com,
	xueshan2@huawei.com, prime.zeng@hisilicon.com, acme@kernel.org,
	namhyung@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	jolsa@kernel.org, john.g.garry@oracle.com, leo.yan@linux.dev,
	irogers@google.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
Message-ID: <20250424124848.GA551819@e132581.arm.com>
References: <20250408122809.37884-1-yangyicong@huawei.com>
 <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
 <20250422102952.GD28953@e132581.arm.com>
 <ccb8ce65-8241-0670-25c8-f8245fbc5e22@huawei.com>
 <20250422132006.GG28953@e132581.arm.com>
 <0098923f-0982-8d08-3c4f-810170ca0b87@huawei.com>
 <2fa27176-f820-a03f-033e-7da811643cff@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa27176-f820-a03f-033e-7da811643cff@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_054851_837962_AE7204CC 
X-CRM114-Status: GOOD (  20.99  )
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

Hi Yicong,

On Thu, Apr 24, 2025 at 07:57:39PM +0800, Yicong Yang wrote:

[...]

> >> If so, you might need to revise the cache levels for:
> >>
> >>   ARM_SPE_HISI_HIP_PEER_CPU
> >>   ARM_SPE_HISI_HIP_PEER_CPU_HITM
> >>
> >> IIUC, cluster CPUs share L3 cache, and every CPU in a cluster has
> >> L1/L2 cache, for PEER_CPU cases, the memory level should be L2.
> >>
> > 
> > confirmed with our hardware people, should be L2 for these two data sources.
> > I misunderstood here, thanks for pointing it out.
> 
> I recalled why the handling is like this. considering 2 threads have potential false
> sharing issues which are running on core0 thread0 and core 1 thread 0 in the same
> cluster, we'll have some ARM_SPE_HISI_HIP_PEER_CPU_HITM samples to indicate the
> cacheline contention. If the cache level is L2 then we cannot observe this by
> `perf c2c report -d tot`, since L2 is not counted for HITM.
> 
> does it make sense to have below change to account L2 hitm for lcl_hitm? just like
> we account L2 peer snoop for lcl_peer.

Yes.  The change below makes sense to me.

> diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
> index 884d9aebce91..a384a866a562 100644
> --- a/tools/perf/util/mem-events.c
> +++ b/tools/perf/util/mem-events.c
> @@ -680,7 +680,10 @@ do {                               \
>                         if (lvl & P(LVL, LFB)) stats->ld_fbhit++;
>                         if (lvl & P(LVL, L1 )) stats->ld_l1hit++;
>                         if (lvl & P(LVL, L2)) {
> -                               stats->ld_l2hit++;
> +                               if (snoop & P(SNOOP, HITM))
> +                                       HITM_INC(lcl_hitm);
> +                               else
> +                                       stats->ld_l2hit++;
> 
>                                 if (snoopx & P(SNOOPX, PEER))
>                                         PEER_INC(lcl_peer);

