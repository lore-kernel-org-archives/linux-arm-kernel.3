Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB575FF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKuREs4KyYSqlCLyCmZNLUkxhpCqsbBRHcbOAJHeuHs=; b=JzRH3qJz0AlnnoXBmpIBR3mTsn
	Aiio+TLfovC5PgiQXs4soDJzwzjaN8DZKLDaFXi34rBHM/gy5WkxHM9d6tmJd/WT6D+7BRLTBoTay
	R4ntE4SszGwSwQOBmbK6WCIoQRAGIHOeupL1QrgkfTbC2SV7/1K73R9ukRwDJplClgTL3Ie9wrOzL
	WT6cy9pxLz2iRtOCg2JQjRPGLl1jvdnQlzyLqlJPyJFZnzXNNRtXmcRwZqDQyuGnQOWZnMZnoS7je
	OOscraUMaCipWBNel8nGXDW2/eybWcxFlpTkWIrTup+QyL5hggnnU/QNYyhs7aQ0Wl5/KKC9RPJFR
	7jgzSeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8bA-00000006jaf-22bC;
	Tue, 07 Apr 2026 15:44:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8b7-00000006ja8-2BeW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:44:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D3216F2;
	Tue,  7 Apr 2026 08:44:06 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2633F7D8;
	Tue,  7 Apr 2026 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775576652; bh=EjYqOhtLEqmY+b7rAs62lsA48b8Hs7qduxXC5kiQPUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Slq0f9JGTcRm7UT+H0qe2Bqpub1A70mpb8xXMOtHtS+cFF39GaEXOPXJk3g0cmDVq
	 1mgapIMhlGD0XMDZP2M1i1t1vjJctYa5BQU159ca0wBEo3YQJ+SjdUy3m/QnG5k/+s
	 E70bStER7y6hx48R7k3JYbRMu/tStUCR6hnBB3GU=
Date: Tue, 7 Apr 2026 16:44:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] perf arm_spe: Decode Arm N1 IMPDEF events
Message-ID: <20260407154409.GP356832@e132581.arm.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-5-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-james-spe-impdef-decode-v2-5-55d3ef997c48@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084413_596034_AB6CD3CA 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, Apr 07, 2026 at 03:05:19PM +0100, James Clark wrote:
> From the TRM [1], N1 has one IMPDEF event which isn't covered by the
> common list. Add a framework so that more cores can be added in the
> future and that the N1 IMPDEF event can be decoded. Also increase the
> size of the buffer because we're adding more strings and if it gets
> truncated it falls back to a hex dump only.
> 
> [1]: https://developer.arm.com/documentation/100616/0401/Statistical-Profiling-Extension/implementation-defined-features-of-SPE
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

