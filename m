Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2ED606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wvoLQYPI;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hu04Qx2P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6w6jR99bB94qAc68qR7iE7VIhnx4AziUbUQ0fbongs=; b=wvoLQYPIleOzPHeGEzn77YNggx
	yAGpqu1+TUU+c1tDMMytWS/UlOCXhDlxuDvXJncMYDJZpbg+I2oEJrBGkKIllh0tFCge6zcnMZbsX
	u6b9RULZilRshd4u5kNp6CtUkyWy33R2I+sotZ0Sef5rewox/OI1z36oyWLxsrX2KvqZsSmGJ3/av
	hTnI4zAdkjtnjerVsQRK/heu8GnQjQGaaO6+IEbCJjtR130L/IuYk0KkfoFvpR8BeRTlk960htiD1
	qTeecGs0K+dbSuvvuAO+FzezAvvY0E75eyfLMW6EC70tGt5W8uEl+r0YhByIUJZWKYVffonu/cOFo
	8NBZNJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdyx-000000060oD-2haA;
	Wed, 04 Nov 2026 16:37:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdyu-000000060nV-3eUp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:37:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79F6A169C;
	Wed,  4 Nov 2026 08:36:56 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25CEC3F632;
	Wed,  4 Nov 2026 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793810219; bh=VvHXa2PKN/PXsjHg761V8vVCnlwth46l0sbGcvt/N9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu04Qx2PtBWMFTy6e0QSl/q4rHhJYgWmAcqqx4YB+BkD26yFTgCa6wz1MabgdLErS
	 y/K0GBMMcE/iG9/bglXlhZ1TyoXSxJzGMQFJvutQFbhwI7+wuCYK4FKLpb+og8meRX
	 Xi58ZxsS0WFud0JY03LcT8OWOOJDupHT0yuu82rI=
Date: Wed, 4 Nov 2026 16:36:57 +0000
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
Subject: Re: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
Message-ID: <20261104163657.GJ9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_083700_953999_7C890C0A 
X-CRM114-Status: GOOD (  14.59  )
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

On Mon, Nov 02, 2026 at 12:15:19PM +0000, James Clark wrote:
> When we increase the default timestamp interval in a later commit, less
> trace will be recorded. At the moment the amount of trace overflows the
> 64K buffer, so the exit snapshot trace is what happened at the end of
> the process rather than the beginning. With the new default interval,
> the entire execution will be contained in one buffer and the first few
> samples are always various instruction and data faults. These go to the
> kernel so don't result in ranges that can be disassembled.
> 
> Increase the window to 6 samples to ensure something with a branch can
> be disassembled even with the fault samples.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

I don't mind to set even a bigger sample number (like 50). I did test
and 50 samples just add 0.5s run time.

Either is fine:

Reviewed-by: Leo Yan <leo.yan@arm.com>

