Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB85CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy+fOa1xjY8i284m44/fZDl63yX20Ah34xZQpmbapvc=; b=sTHDd8sBKW17nPwI7JG8DeyI64
	bovmOo40Nf1neHb0f5Ve38WJrQjjhZgr0+ZGa/TstJ24cZd13NL33jNzSvS+619Nlu5kK371he7GR
	ud25o2dSr9gZHoHpKnMsoIIa8DxjUOT8THxKHAn0X4IwEo7+QXsTyiLjfACZjTic2TxHhJg6ZD7oY
	1Zifh9g5l6eF+z7qO+Czl5vYfWjJQQgOj92OIYdJzDVXOs7LKsei+gSSTsxgBytK05dOdzNwYzwaR
	thn5AKtXiLEBYlOnPntSyH9BZkjwtbvV3WqSc5M6wT5XXo0Sa6P/gs2kln80HtUzATBlJwdpuaMsH
	il7QXwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEG8-000000012Gc-2RLG;
	Mon, 28 Sep 2026 16:31:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEG6-000000012GB-3LIW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:31:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37992406A1;
	Mon, 28 Sep 2026 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6866C1F00899;
	Mon, 28 Sep 2026 16:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613078;
	bh=jy+fOa1xjY8i284m44/fZDl63yX20Ah34xZQpmbapvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ib25uwSyLD/KOs+hQ+BjeDKF+XD2P5kMw6ajYcP2wsXRyJXp4HXGU80+6NyL/0W5j
	 QwgB804Hojoro3FPNI/TluOYwXvJK1ldHx5BlmogpSbQqHbEjaZa84axiJ/nlS3lnX
	 uX8gHDJ9UEEPm+zJwWM7bzXpnedlD2Wjmm67zQ6k8tyGzFxocXZHt+vJL+HEc4/hEX
	 w8vO73oPJ+xmfsAUAMloOMJzNvBK+MPcbFgxJ1JZwgZFxeAl2NQoKNvUzsYwcCgbTS
	 LttMP4y+Hfl02y6t2bmor/d6yX5rGYSZYViCttqoI+cTEfynBAc6BVoczYbamYQ0Py
	 JNT0kCIRakD4Q==
Date: Mon, 28 Sep 2026 18:31:14 +0200
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf test: Record kcore for the CoreSight callchain
 test
Message-ID: <arqWUi5qJketJ3KQ@x2>
References: <20260928-perf_cs_etm_callchain_test_add_kcore-v2-1-24fff6fab009@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-perf_cs_etm_callchain_test_add_kcore-v2-1-24fff6fab009@arm.com>
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

On Mon, Sep 28, 2026 at 11:15:51AM +0100, Leo Yan wrote:
> The CoreSight callchain test traces both userspace and kernel execution
> and checks the callchain across a syscall.
 
> Add --kcore to perf record to save the running kernel image alongside
> the trace data so perf script can use it to decode the kernel trace.
> If kcore is not available, the test will be skipped.
 
> Fixes: ca0e19074bd6 ("perf test: Add Arm CoreSight callchain test")
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks, applied to perf-tools-next, for v7.4.

- Arnaldo

