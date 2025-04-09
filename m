Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EC4C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EotVFPxxm+qaWAuKhUMVGy15GEJafbc7HzUvSPG+v9g=; b=BNiHIzOKaDlbJo8iqbwC7uqKg2
	cgp51cqxYUGVFj4FT6oFMep8sjF+5MGhIgwGkckiDBHvV9msozeoAheO77d04U1n/TE/gz5JiL3qD
	ht2iVelF42DJOZkuvy36rIKjPyHKX8hl80Hn2RlS6d58c4vKXxeg73HknvpC25Kf+riijGrZlfDvb
	tBpPJFnoGYn2aTSRjpycKMfa74kgo2rnQBT2k2+1Uw9R3Ag8LDV8jVHFqGuamF/TJLgFfjIBz5upO
	vSkRlHzKPkWzzzn105Q6sxAOUg1ETeXXwESkkPR0VFC2lR7rMeNU6cgSXgZle49bdWIKzn5LVeQHt
	tiyW7HwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T9s-00000006vJJ-1SxK;
	Wed, 09 Apr 2025 10:59:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T4s-00000006uXX-2UWK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:54:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30FA76844E;
	Wed,  9 Apr 2025 10:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6D2C4CEE9;
	Wed,  9 Apr 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744196081;
	bh=afhU1dWHc1n2usOgVXlNTp6Z03tRmuPrfnW4JN6sGnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYUaGBT4bXK9TCbssJPfEPUva0lZneoBqwQa0OgLrsIkYaC0XT5A2FDeWRqmvLn4b
	 b4KPKLJByHOuQPm8Dcx/o4vG0huxiFJUHdES81SZmIerrt2LxHP6iaIhFJt/2De7zm
	 F0RravFF/v/qBlZCNhoa991MvZ43K9Q4GghxU/ixUEvtBts6i71ZzH/MwSpY0gn5vb
	 +WK26KNWBuOeaBNV1P67Rdpc0TSpFYMw/MIfQThpwx6WtGsSRR89FwIDZ4XYEbPGlH
	 6JQMUqRisD9NsnnmCQeNuDi0+ClH8/+mvRoJUiJon3Oc5OybOSyOuguOiuFp8RCki6
	 xIYuuEFAfEkmQ==
Date: Wed, 9 Apr 2025 12:54:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: mark.barnett@arm.com
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
	james.clark@arm.com, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] perf: Allow adding fixed random jitter to the
 sampling period
Message-ID: <Z_ZR65SK9hEm561W@gmail.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
 <20250408171530.140858-4-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408171530.140858-4-mark.barnett@arm.com>
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


* mark.barnett@arm.com <mark.barnett@arm.com> wrote:

> @@ -14384,6 +14409,7 @@ static void __init perf_event_init_all_cpus(void)
>  		cpuctx->online = cpumask_test_cpu(cpu, perf_online_mask);
>  		cpuctx->heap_size = ARRAY_SIZE(cpuctx->heap_default);
>  		cpuctx->heap = cpuctx->heap_default;
> +
>  	}
>  }

A stray newline snuck up on you here I think. ;-)

	Ingo

