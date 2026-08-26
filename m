Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFKzf2e63+SUGBeC6LAsBmBAhfeCzGJAKmalQX4SqN0=; b=jglNThffYG14SSCwtHCBUV8TG4
	6ww2P+DkpcZR+ejeJPyF8ROs28Rz1DvNRDXW6OxkWOZhNt+eq0CvCc4BLiAgG4aJWPm10lY/69YbP
	d6d7t6wML7F8orbFP6p/7W7p/0nf+X3EqOq7XrNsPcULadCWZKuY0idqmKhv06V9IVMOmU1kCy8Hy
	wvev1oJBZ1s7y4YVyXyAhPWU5rQQQ6QiV4QECmrOMApHSVLU1t88lIyNbQj92A5qEWt0t1uQ1io7/
	dt7eU08XW55R68gjKilF7KxZr/UqaULxXlXzkZ9WYkgfL3mXE8eAgIFyqaKUfyEWsGAa29gLSWVLJ
	cu+W4/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzF8Y-00000002dK1-1ELU;
	Wed, 26 Aug 2026 15:01:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzF8V-00000002dJc-3gfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 15:01:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C379416F2;
	Wed, 26 Aug 2026 08:01:50 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FA4D3F7D8;
	Wed, 26 Aug 2026 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787756514; bh=ephLTZo60aLchZTC8JPArjDYj9cSMJNs4QXwAT0nfNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciRmwxR6vL9yxxc3rqvSD2GqOFqzd/uI7aq0IG1hiF3ZglJ1qmbnq0zxSpjZ3wMQa
	 m2SSYM6vz5esS/0h7GRlM0pXdnOomYldR6p+iIhZ9rqoZG+ZdYzGOhDM1aquXZMSba
	 Mb5wdUXppYVGufJ0Dz+i8tf2m9oRewaqwSKKZqkw=
Date: Wed, 26 Aug 2026 16:01:52 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/14] perf cs-etm: Fix nVHE per-thread decoding
Message-ID: <20260826150152.GI8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-1-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-1-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_080156_000642_1221DCA9 
X-CRM114-Status: GOOD (  13.42  )
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

On Fri, Aug 21, 2026 at 10:48:59AM +0100, James Clark wrote:
> pid_fmt is unset in per-thread mode because we don't need PIDs, so we
> can't use it as a hint to determine which EL the host is running at.
> That results in falling though to the next part where EL1 is treated as
> guest, which is wrong for nVHE.
> 
> Fix it by only returning a guest machine when run from perf kvm where a
> guest image would be provided, which matches existing behavior in other
> parts of Perf.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

