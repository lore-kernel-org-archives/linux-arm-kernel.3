Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F8DC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaufhRrPIIlGU9PSko9eDMbVVZpm59g+vXiWTKqYEnk=; b=aK7BVPUujYFw7urwhLthaVnVHw
	8pLcWK0uLaty26Zs+PSRKOuO/PTKPj8xPAdhRATe1thp3DjzOYm4T2BxHMC4/6wnFKUY5QMEhsI62
	zUcgLQ54KpNgHx/ldBejVTYqgEfoMzNFzvqnXhrdzJU7qCM7HHP+Xj4x2FVJdjPW7QKphasf2ewKu
	n/C6akyK4GbVpq6+JC/kWGjzveVtmGwNcGbt5fu0+pCsG7a6sdw5i8apd7a/3zfqLpia2Wa5mrdt7
	BLgBg+9lHVDnG2mz2/XuekF3lJj/ax0E3N7WRHHXDb0BQKQqOwAgOd/kxClnbdbkQtBkQ96ZyjAd1
	LWS07S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUj-0000000BFSz-1mi7;
	Thu, 30 Jul 2026 19:32:41 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWUd-0000000BFR2-3iGl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:32:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e0688b859so183498b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785439955; x=1786044755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaufhRrPIIlGU9PSko9eDMbVVZpm59g+vXiWTKqYEnk=;
        b=DO68BOY9t4swJf9Exe7cQQoSu4vnWiB+BB6Zqw/oOkTf8nuUMAydJVzedvsfSS1N34
         7l+/6oXLT+lv/UggkvJImWUYif1NGpSPLyOVPnHPrc6Aq1pl4onWy+Ds048RArgwjLtQ
         E1qgg+0aOdCdCPm5H/9mLOH3JS4+AZiIpfJFpraT+rPGrR6Wo5tmNPLZxqkmOfIGIHIn
         3kp9g4DYzeWAdHURUbk47KCo4psxfkQBpbZMsvoPSKg0Gw8qYc3htZ2UJxBmrAEcYUjl
         5iNeR356n+HBIjjCb60wRl/bcPIEh0716LVZwNJtsX9kNzy4yAZIAz51neB5Eei0YmUA
         SAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439955; x=1786044755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaufhRrPIIlGU9PSko9eDMbVVZpm59g+vXiWTKqYEnk=;
        b=nCSDYBkFoLseH4d7T1FpY8kTsRd3l3da4tp9VcAqfcBKbc+JHhW40LpZk/+XOc33Fr
         0Hsfe8358ZC4ZIhFpE6q1ULcWNRvdPW3CIH84SuAEm+W7WfAR8Fhy13av93dQQQlHnGN
         Xg1aKL78hZSF4eh/jIcLlIMoOwQ8QguCl/fzKe9LE4j1k4vW7/t9r/IHIRMJZpkHRDih
         /SEgs0Yr1AUal3yXx8iQpM8mEh2jxYpMVD+lO7HhD1lmh+lM4qyy7Zyh7ygCbHw8Zh1u
         29RYf1tsZ+evp2hGhewStluM2e/laRHji02I6oRYmPPmqFJq6QWXJoFGhQJQgaMxuW1B
         XwqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpABnDaBKPqFf8ugFX844UujTHX5+WrxZujbd47G7pbL96xltnfOW5SJtGUz8oR08T8oIuhiJdq1ziphKdc9f29@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjk3heADV8d1+DToqxnCl4+giBAju8nbuZ/SnLr54OpK+aAyw9
	8GI574n1TB/2c76RoEhzoyDyG8772frEAQKt+cev4tBWrb2+liuo/EVb
X-Gm-Gg: AR+sD13J73wKZ2xuCbTYgI37dF0/hRvnaImKLLNNdPSg/LKADDN0rav8jnId8gFwLY9
	FPL8zGvS8UGZu8LseeWm/8TAhjm2u8Yj+lZc9GVPZppEHqhNibga1247fs025I58B405DT2Vutm
	5qBwjJhQm8rI0KZRDOQzurNC4v2A4Py4oTVIcdMjS+hykCPX4srJYwEzGPq4qW6d1S/rqd/pRa+
	o1Gspw1B1ZBQA46yDNropiy1nx3hfRusljBMNBVE/tAoeCtYCgn1vYBds4Dj3X6GQospqVgUw8Q
	5fg5CmGNnAvNhSfgVW7YygH5LJJpu495Z/1gJTiIQlfR50j8qEpmZ7pHtgjO2R2ewNV3gYiAo4E
	y3MXLcy1tcgTcepuXVQEnn6Wer/GfevfGOkEJ2L6ocVDgHCXmbNei3Ma8m5LBy9meUSIZeeWSBi
	fKY2ELxUlfa5QyF3ir0MGi2ypjiN4wFxSyQZpTzghrZcg+a5YFA5bOFfvH5x6d
X-Received: by 2002:a05:6a00:c82:b0:84c:518b:d915 with SMTP id d2e1a72fcca58-84ebc4022b4mr3494498b3a.65.1785439954744;
        Thu, 30 Jul 2026 12:32:34 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe240acsm3526682b3a.7.2026.07.30.12.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:32:34 -0700 (PDT)
Date: Fri, 31 Jul 2026 03:32:26 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: will@kernel.org, joro@8bytes.org, akpm@linux-foundation.org
Cc: robin.murphy@arm.com, nicolinc@nvidia.com, cychu@google.com,
	hhchung@google.com, amitamishra@google.com, marscheng@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, kpsingh@kernel.org, mattbobrowski@google.com,
	song@kernel.org, jolsa@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, martin.lau@linux.dev, yonghong.song@linux.dev,
	emil@etsalapatis.com, rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] lib/sort: Clean up sort_nonatomic() and
 sort_r_nonatomic()
Message-ID: <amumyk_cHcffv9CC@google.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730181216.2709088-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_123235_929525_2B6AE104 
X-CRM114-Status: GOOD (  18.71  )
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

+Cc maintainers/reviewers of kernel/trace/bpf_trace.c

On Thu, Jul 30, 2026 at 06:12:14PM +0000, Kuan-Wei Chiu wrote:
> Remove the sort_nonatomic() and sort_r_nonatomic() APIs from the kernel
> library.
> 
> Currently, the arm-smmu-v3 driver is the sole in-tree user of 
> sort_nonatomic(). Because the array size being sorted is small in

I just realized that I missed another in-tree user: sort_r_nonatomic()
is actually being used in kernel/trace/bpf_trace.c.

Looking at the bpf code, the array size there is bounded by
MAX_TRACING_MULTI_CNT, which is set to (1u << 20). I guess sorting an
array of this size in a single go could potentially cause scheduling
latency spikes on certain configurations if we don't yield the cpu.

Because of this, it seems my proposal to completely remove
sort_r_nonatomic() and sort_nonatomic() from the core library was
premature.

Please let me know if you think otherwise, or if there is any
alternative approach for check_dup_ids() that would allow us to safely
drop sort_r_nonatomic(). Otherwise, please disregard this series.

Regards,
Kuan-Wei

> practice, there is no real risk of triggering a soft lockup. Therefore,
> the periodic cond_resched() calls provided by the _nonatomic variant
> are unnecessary.
> 
> With the only in-tree user updated, the _nonatomic APIs are no longer
> needed anywhere in the kernel. Removing them effectively drops the
> wrapper function and eliminates the may_schedule branch from the
> innermost loop of the core sorting logic, slightly simplifying the code.
> 
> Kuan-Wei Chiu (2):
>   iommu/arm-smmu-v3: Replace sort_nonatomic() with sort()
>   Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |   6 +-
>  include/linux/sort.h                        |  11 --
>  lib/sort.c                                  | 110 ++++++--------------
>  3 files changed, 34 insertions(+), 93 deletions(-)
> 
> -- 
> 2.55.0.508.g3f0d502094-goog
> 

