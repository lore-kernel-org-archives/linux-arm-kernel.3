Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ACB606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MnoDgcVE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMK/YGbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPEMm3KzAtIRLiKQFUHumEFY4JPYUMG3s2HtauHhtLU=; b=MnoDgcVEeaOatYmB1w1Hy/9dhu
	OZB37ouf1eJFtrmJDd+N4vJV0WmcNgr8MacQm5YdMPV3MB6A301ga5d+vI0N2o3+yJOXqUp9GxL/x
	4C/XvowkfKnlroprtwr2Y3TjDpYcke6zYUthaLikBtiTxFd8e9qfQ1OJiQl8I+XFC4fTowReuaVLb
	4JDcsg1J3//E8LSEURc/K0m5lt2rQo6tiuMTWASibw7dAzD7yHQI33WDmAP7LUjyOzHdxGSipKNNj
	IdhX3y3XtfLUTqdP/jXFzqYyNeqSL+2xl1E0kpjeTRWTAMUOmPeWnUX01BTdqn1VkAQACOCEu2tzQ
	zA3u1lLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFJM-0000000AWZX-2FOn;
	Tue, 20 Oct 2026 19:15:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFJL-0000000AWZN-28br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:15:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A73B860136;
	Tue, 20 Oct 2026 19:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E248F1F000C9;
	Tue, 20 Oct 2026 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523746;
	bh=HPEMm3KzAtIRLiKQFUHumEFY4JPYUMG3s2HtauHhtLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MMK/YGbfoxlDs/mSVwc1CLP4DQfUFyh6QS/8vR0xl8Hh5SjHZ7xaQBUycOTbI/vhT
	 5JBOwNF4SjX3xxIAi6pBZPkl2WM5v4xDXUNWToOrXJlcAr2OdNLshXwWyCYaBKQdI7
	 LLXo2Nzqhwhs5hOnjTPxD/6D2y7VviqSihArdwRHl5VepVF/XELd81TYMuLg1DH5kn
	 zVG9nIab9mwvBjH+TPAYU9TZgq2WvERhYBRTquZ3USxxKygWIRRt+O5ZioiRtBHqMk
	 AWkQvsmyHjoGuEH7FI+t76yHBDHLQ9hYGSDKo1uoFtKsBEu8sWn0rpC8km1497GCME
	 hNeZjW4vhQhpQ==
Date: Tue, 20 Oct 2026 16:15:43 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Besar Wicaksono <bwicaksono@nvidia.com>, namhyung@kernel.org,
	irogers@google.com, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com,
	mochs@nvidia.com, rajjoshi@nvidia.com, treding@nvidia.com,
	jonathanh@nvidia.com, john.garry@linux.dev, will@kernel.org,
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, ctshao@google.com
Subject: Re: [PATCH 0/6] perf jevents: Add NVIDIA Tegra410 uncore PMU events
 and metrics
Message-ID: <ate93zQFkfAecIv2@x2>
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
 <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f58af0-fa3f-41c5-ab03-216c60fbe2f1@linaro.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 06:23:16PM +0100, James Clark wrote:
> On 19/10/2026 17:42, Besar Wicaksono wrote:
> > Add event aliases and derived metrics for the NVIDIA Tegra410 uncore
> > PMUs.
 
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks, applied to perf-tools-next, for v7.4.

- Arnaldo

