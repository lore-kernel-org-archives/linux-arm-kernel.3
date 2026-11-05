Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nn8lGUAt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WjVvJR2t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ADmQIxAo8HDM9v3jLMAtpR5tdAcgtAcz2GrlhHdH0M=; b=Nn8lGUAtmmzw/gbDbCX5DSeRw3
	FvmfYKP5YVps5aiJJekcQdSg8TNCtTmuC8nS2B64fX4IJDMurz+oSdncMed6sDkVu4KHtECxSLiX5
	S7YazgptmhBAHOs5RKDbAKlGj/j6ZXvkw1dsDMrw9vvu3u/Hu02OuMTqjglXtSomK5TMRLKGTbInY
	BBEz5x818+5W/lfEOrFUMzA8YnmZ0lPxKI/AsT1WzREwBQ8vFoGiPLu10rHWKq5Bv7nsbYbjtVBTO
	S/YXLnLZX2sItAsPoIn4b+XL46C5X6xOqS7gb5f25t5zERLDx3thta9ub03wG6YAG3x5k37i870SZ
	anizBL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtgS-00000008Hjn-29G6;
	Thu, 05 Nov 2026 09:23:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtgP-00000008Hie-1Y3S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:22:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C866E19F6;
	Thu,  5 Nov 2026 01:22:52 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D05D3F628;
	Thu,  5 Nov 2026 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793870575; bh=3ADmQIxAo8HDM9v3jLMAtpR5tdAcgtAcz2GrlhHdH0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjVvJR2tAoFJSufvpND4tfqyE+S7lXAB15rdV43IYRwoa05K89GDHf2rs4DM15kCe
	 eK6nxhLWcUYRKamtKzGFDQHr8ywB/C86Ioujk6V61bYHa93TFkNhVnnrL6U+V9o6h9
	 00JeJ1XMwFX1sgh7mCiAKJNbQSmjj95+kxrw+MR0=
Date: Thu, 5 Nov 2026 09:22:53 +0000
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
Subject: Re: [PATCH v3 15/18] perf auxtrace: cs-etm: Capture wrapped snapshots
Message-ID: <20261105092253.GO9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-15-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-15-dbcb0c281b9b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012257_539912_48FA1203 
X-CRM114-Status: GOOD (  15.20  )
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

On Mon, Nov 02, 2026 at 12:15:29PM +0000, James Clark wrote:

> Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
> A monotonic head can't be auto-detected in the default find_snapshot()
> by checking if head > buffer size, because before the first wrap a
> monotonic head looks the same as a wrapped one. The search would then
> falsely detect a wrap when head is near the end of the buffer, and the
> wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
> driver's head. With a wrapped head that doesn't matter because only the
> offset within the buffer is used, but with a monotonic head the next
> snapshot would either save already saved data again or drop up to a
> buffer's worth of new data.

As mentioned, the default find_snapshot() can falsely report a wrap,
which now prevents us from using it for the monotonic-head case.
However, I don't think this block consolidation; I see the decision
not to consolidate as a design preference.

If an AUX driver transitions from an arbitrary head to a monotonic head
in the future, we might still need to consolidate the find_snapshot()
implementations.

Reviewed-by: Leo Yan <leo.yan@arm.com>

