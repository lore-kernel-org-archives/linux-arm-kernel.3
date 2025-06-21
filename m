Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0EDC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K53OHQtco+C4OOl+U7ewg0kzbauTn40f0HAI0Y5us8g=; b=F0NLUNBtgury6Swu6NME96tBZq
	0gvwgkeZdHhu2eheSweASlJUTi2sbiecBSwRC+R8OTtmAKGULBWMdAFUVPVz9jLwzxtNGu4XZQdAe
	C1LQmDlFYSilh/eyXU/BiQvbgdU0Eyvg9RgFNkeZTTJAKJUbDYdnacIwPY969c7oiqoLgztowccB7
	jM0W3fAOpgj4GLcCQ5xZ11867kfWXxe+dASI+7sKNCAth6UqRUGz/GvOx3Vl/5+41Mf2MfHUI7G2v
	27Zb7L1wUm6z5wM8rJMdUsazAVfsAQ8skL9r+ttD7x8F8akEacNbfLe5IaAqdVx7FURFgSLJv17lg
	5lnwuItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT2Z5-000000006zM-2Nwl;
	Sat, 21 Jun 2025 18:03:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT2Wq-000000006he-11eb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 18:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E5655C1114;
	Sat, 21 Jun 2025 17:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11EBC4CEE7;
	Sat, 21 Jun 2025 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750528882;
	bh=K6wWKdxfoJmEUGL2+UeCRmUF89MpBtsNEIYpPp04RJE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dDgrMuarT08zkHVw5uEu2aCVPP/5D6ZuIW3ehj8zblXuVQkbuTFAMNBsdEzPM6jqe
	 COmJhPIaPqSGXfdNAeJ+R1CWpRfCuIzNT5hl0VZqn8sVvDGr4dzp5TAQk+ATDTQCTw
	 phLWTyM83Qxaqnt2uSOqOOwsIxJOQVmMinUmtJ8iAW+d84E8bHYXuhmCC+/i3lmT5u
	 zPpok0jnjD920q+PbntDJiQA7UHwYQHOr6uJP8tNJkoK0ZqPGhQ0sqRU76N6FgHX5k
	 et+wJNU8h5aJf9Zy12wOqQjPy2oRMzGrbGTEgdyGp1ImLaHIKCgmniNpKoQjSseSid
	 R0FwZ96TojOGA==
From: Namhyung Kim <namhyung@kernel.org>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kotaro, Tokai" <fj0635gf@aa.jp.fujitsu.com>
In-Reply-To: <20250618063618.1244363-1-fj0635gf@aa.jp.fujitsu.com>
References: <20250618063618.1244363-1-fj0635gf@aa.jp.fujitsu.com>
Subject: Re: [PATCH] perf vendor events arm64: Update FUJITSU-MONAKA pmu
 event
Message-Id: <175052888168.2250071.12313515494828594139.b4-ty@kernel.org>
Date: Sat, 21 Jun 2025 11:01:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_110124_326955_9527BCD7 
X-CRM114-Status: UNSURE (   6.09  )
X-CRM114-Notice: Please train this message.
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

On Wed, 18 Jun 2025 15:35:42 +0900, Kotaro, Tokai wrote:
> Update pmu events for FUJITSU-MONAKA.
> And, also updated common-and-microarch.json.
> 
> FUJITSU-MONAKA PMU Events Specification v1.1 and Errata v1.0 URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Arm Architecture Reference Version L.b URL:
> https://developer.arm.com/documentation/ddi0487/lb/?lang=en
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



