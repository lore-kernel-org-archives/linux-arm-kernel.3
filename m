Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55987E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQeYkLHt8PB8bm1R0gE4E4lckuiahAwGVKIicwKow5w=; b=U8SjB7AYfm8Tx7ZvFaUiwGA/ET
	Uxei4WgRUdmgRdY8eHEGYqYH4n0HAdd9mC9h8J0NkWN5MRbpp6ftsz3yH1DXAm/rc5Z8kd2RcaBLO
	koqcjtSrXr3NMCvpPbScT7d1PzLvG+zEG/p2YuX5ziUfS+0JwXAqSByGW1A4cUcQa9Q9SHgETj1NE
	Yvzb0ZWlWaWQUgbkQ00T6JAo1UNCJiz9HW1VuWYDhJkoOWwr20gnK1mUrTuVJ/9jV4zZwBuViUthI
	Y/wh79bsoqBniZaEmcrTb/zGz7SalC0prDN4x1K4K1rZKvKdtGfu2FhEySzfrYRXBHRvV00SGdaJZ
	pEzFV1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHy7-0000000GI4V-0QdG;
	Fri, 10 Jan 2025 16:34:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmm-0000000GDoD-4AWe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B1EEA42667;
	Fri, 10 Jan 2025 16:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC202C4CED6;
	Fri, 10 Jan 2025 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526179;
	bh=mQgh00oTBEnPK3eaiUyErqe8gGMKiHL5sXNk/n6ICaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGZU3Ef8D33bvTFUX/Tu2lXX4npAID97EObM21P4W+vsfHcYTVH9Qt4o+18iAeWc7
	 7+8up9z5xJj1tOzhINprHuhW8DGO8CaHO/utbP6vAj4NEuN2vMKZ5/iuud5yB8smDO
	 +sY1QsydT5KVI4C839eN1K91nD6/amLZKnmkKRbNSIzIJfpDdFn7CkhdH8u+LDO2/j
	 HyxY9Yejs1Y/1M1nZmZ2JdYd5RFQS4OQq69FcIkSa3Q1s30RYKw6KaDE8OxMwNgWgb
	 o+NWQQi/txTHozc/9RXdJeXpnJlluskdVyd+LTSLhzvdRzd3oE2hEkGoOz9RGi//Xi
	 lVT8XHiPC1bPA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	mark.rutland@arm.com,
	namhyung@kernel.org,
	acme@kernel.org,
	James Clark <james.clark@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robh@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Veronika Molnarova <vmolnaro@redhat.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH v3 0/5] perf: arm_spe: Add format option for discard mode
Date: Fri, 10 Jan 2025 16:22:48 +0000
Message-Id: <173652065683.3245172.11665292685923367751.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250108142904.401139-1-james.clark@linaro.org>
References: <20250108142904.401139-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_082301_103057_41A34BF3 
X-CRM114-Status: GOOD (  16.79  )
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

On Wed, 08 Jan 2025 14:28:55 +0000, James Clark wrote:
> Discard mode (Armv8.6) is a way to enable SPE related PMU events without
> the overhead of recording any data. Add a format option, tests and docs
> for it.
> 
> In theory we could make the driver drop calls to allocate the aux buffer
> when discard mode is enabled. This would give a small memory saving,
> but I think there is potential to interfere with any tools that don't
> expect this so I left the aux allocation untouched. Even old tools that
> don't know about discard mode will be able to use it because we publish
> the format option. Not allocating the aux buffer will have to be added
> to tools which I've done in Perf.
> 
> [...]

Applied driver and docs patches to will (for-next/perf), thanks!

[1/5] perf: arm_spe: Add format option for discard mode
      https://git.kernel.org/will/c/d28d95bc63cb
[2/5] perf docs: arm_spe: Document new discard mode
      https://git.kernel.org/will/c/ba113ecad81a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

