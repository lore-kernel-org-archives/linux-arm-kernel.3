Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F18FD5D69F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 01:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o24KjceWcQ6ZOzyNbuvvntCqzJDAatQpXgVj7Y0CVIA=; b=dQm6TUJPY7aphh8pByGg2RHgkW
	la7Sd3kgIUjEKJ9Uywscmv89xZBRzc5e8D1Ujb0ZfBiX9O99XeXO7yQBuMfd5bwUxoSeAaukX2oCl
	fwUGiXfzwRbY3k8zs3ZNw6lBgc4LO0Zo4cfKJ/GY10B0Gu5j5lO8DtIXBZTQo7lLHtpoJmDJpPU2T
	FXOOJxgUfzqkU05ny2rZR853DakhDUrXhXcVReRJV4jHsL+JQdWzHyLfMDWQaVTKlNCJGuidRv5Oy
	H0RwEjg3LA63rHb1KRh8zRNGMyFoKmg+p5zEMXVwcNiBolhLrrvxQ9ftQWKxjXSgUNZymSgfymHjg
	KB2yyc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9DkL-00000008vNE-2nlc;
	Fri, 08 Nov 2024 01:25:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Dib-00000008vEt-3fUk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 01:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2EFF85C1180;
	Fri,  8 Nov 2024 01:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F0DC4CECC;
	Fri,  8 Nov 2024 01:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731029000;
	bh=DGbyf/rovFNQPhr6Y7TGGaqTfWcDQ4P9WoM8/4ykUbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhhjWIvvGtwGyLr1KzV29U/LcFROauzgf1669f9mR1dPmnvO8bWkg2RBx3tQeE+Tf
	 X4q8zwCUxe06LoYsKfNs9FRRy87dvXPZMmnN3CHrr0d6wVh6QkTM9EjArUeSvCrcWZ
	 2HcDaKsleAcY0AOteq7r8EN6JVdaON5ahdlpab5U++59FEjFM+pJd2jWnlA7Wrng9v
	 6NXdxdAzgoD9ok9kwyb/+sw3p2uovSQzB/d64bTU5QS6BqWtkHhHW6gOz/zCnYZeef
	 D2TV4eceiX1EoL4jKMfe5z/e/dbYq5D6aex+bBP91uQwNHkz8Xswh96Vkzutzsfd0m
	 Jbw3xcTIO7DDg==
Date: Thu, 7 Nov 2024 17:23:17 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, Greg Thelen <gthelen@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Tuan Phan <tuanphan@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
Message-ID: <Zy1oBfroZLBwN6Jf@google.com>
References: <20241107215921.3518636-1-ctshao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107215921.3518636-1-ctshao@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_172321_965885_B1292EE3 
X-CRM114-Status: GOOD (  21.08  )
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

On Thu, Nov 07, 2024 at 09:59:20PM +0000, Chun-Tse Shao wrote:
> Same as
> https://lore.kernel.org/all/20240514180050.182454-1-namhyung@kernel.org/,
> we should skip `for_each_sibling_event()` for group leader since it
> doesn't have the ctx yet.
> 
> Fixes: f3c0eba28704 ("perf: Add a few assertions")
> Reported-by: Greg Thelen <gthelen@google.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Tuan Phan <tuanphan@os.amperecomputing.com>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> ---
>  drivers/perf/arm_smmuv3_pmu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index d5fa92ba8373..09789599fccc 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -431,6 +431,11 @@ static int smmu_pmu_event_init(struct perf_event *event)
>  			return -EINVAL;
>  	}
>  
> +	hwc->idx = -1;

I think you should update the event->cpu as well.

Thanks,
Namhyung

> +
> +	if (event->group_leader == event)
> +		return 0;
> +
>  	for_each_sibling_event(sibling, event->group_leader) {
>  		if (is_software_event(sibling))
>  			continue;
> @@ -442,8 +447,6 @@ static int smmu_pmu_event_init(struct perf_event *event)
>  			return -EINVAL;
>  	}
>  
> -	hwc->idx = -1;
> -
>  	/*
>  	 * Ensure all events are on the same cpu so all events are in the
>  	 * same cpu context, to avoid races on pmu_enable etc.
> -- 
> 2.47.0.277.g8800431eea-goog
> 

