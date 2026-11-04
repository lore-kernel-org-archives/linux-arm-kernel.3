Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gbHeN0YW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UXLMpGxG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oSNa+6EgMP31eq9znADgKJ9V9b1c1bhoiuJTbui30b0=; b=gbHeN0YWLhGw9LxcipEHpFP8WZ
	HurbLKBQcYTQmBOAWBxsAQNx8uOvJqOxOZtwjasLlZQupfHZs/naL4Q2XssSo2esKRrGyzSRaOdI7
	e1jQdwUYKrB+JKRfy5nab6hH3fIo+SuDVwN7Vinj9GlSCbeoDHPUH3S+DU3xlL88meJ4fL390cqoq
	OJi4dXGXk71qa0nKXo6NjyBIZYoSe2qc/knvmGMhZLL5RWMkCR4P5/NYeBH/UxdU2HPVFnhypfK6a
	8NyGrDM0Vq7hZBrAbbFps5+jGar7mJiBkE44tAQ+2Pry97svTCaOMyaPCuJONap5O8ime/vcWR9VG
	V4vVzQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeRp-000000068uO-3PJC;
	Wed, 04 Nov 2026 17:06:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeRl-000000068t5-0WPZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26A8D1BB0;
	Wed,  4 Nov 2026 09:06:45 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C84183F673;
	Wed,  4 Nov 2026 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793812008; bh=yN67DXvGqeKiP0SGfMP0gC2ilJy21fo6QeXH2VYEQSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXLMpGxGPfCa4+tnAZly5xo5JM25E6VmWkrcDUdYxndl1rxLajmnRhWQ19/vCQLLn
	 BxRNBcE6kowKQ0QDixK/5DG8VBD0Ew+SpLBhY0rG5wvluh8cgcN6vp5Fb+n14poJii
	 sCz4Yx/bYJ4GW3B5Jgq5QLna1ZPa8BuWuFr/Iyvo=
Date: Wed, 4 Nov 2026 17:06:45 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org, John Garry <john.garry@linux.dev>
Subject: Re: [PATCH v3 08/18] perf cs-etm: Use instruction length in
 disassembly script
Message-ID: <20261104170645.GM9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-8-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-8-dbcb0c281b9b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090649_219396_DFCC9439 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:15:22PM +0000, James Clark wrote:
> The disassembly script adds four bytes to each branch sample's IP to
> include the final instruction in the range. For an exception sample
> whose IP identifies a faulting or interrupted instruction, this
> incorrectly includes an instruction that did not execute.
> 
> Use the decoder-supplied insn_len to calculate the exclusive end
> address. This preserves zero-length exception entries, includes executed
> syscall instructions and also uses the decoded size for Thumb
> instructions.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

