Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B59606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M3I7L+Xt;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s3GrBJOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+vNGczHMw6FkUVcnbhV7x1VPiBIGfUMOUBD2hJJTm1k=; b=M3I7L+Xt6vk8feNi+9t7gUbIw2
	mwycjU8q+v8xLWGtKZp7ihCOSAfUHAC1b8lV9rARQ5HNfubnoLWZsBBh+/zRX85a6vmhqffp/WZbf
	/dwqKyUgmhtD+ubx3eJLfnMlO777RtqH96qX8yDIGHRGpuY6m9RrgYWE7OETFQpAYbftxsyjRjaaZ
	xzEdRKrrT5zlaLiia4f/ALgfoJn66BJuk7am9XvExYykTLNHVqUnnUMOazkN5Cnz1qyL30NG5qph2
	lA1eEetMnDDeWtx9tBOE9e1GsmUN4lJQeeCFTqe6hKd6yWtFBDkig/G0zFCMJQfUAlpMXpaehuxBg
	nxXda91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe0u-000000061Iw-1idK;
	Wed, 04 Nov 2026 16:39:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe0s-000000061IH-2W8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:39:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B20B0169C;
	Wed,  4 Nov 2026 08:38:58 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 729103F632;
	Wed,  4 Nov 2026 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793810341; bh=H3gLXSBeer+KOTYX0U8MNDqI+dszeoRWQK+rfNP4N3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3GrBJOlaKBDpmlHDKGW96IzubpnPtY8t5ctXlsyAV4MK+ONTKqPQTkHivad2c5tx
	 O4lZXz2Bz4NoJowwdj09EEllgdkMcLLdoAKvPlptuWB+3j/9Ls5mi98fTNuF6cVYQx
	 8cFJFaCFWdliJyzZR0XDmvCJOo2xkUs3lw/TECxM=
Date: Wed, 4 Nov 2026 16:38:59 +0000
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
Subject: Re: [PATCH v3 06/18] perf cs-etm: Don't drop previous target for
 kernel samples
Message-ID: <20261104163859.GK9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-6-dbcb0c281b9b@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-6-dbcb0c281b9b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_083902_682024_08BE0916 
X-CRM114-Status: GOOD (  14.24  )
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

On Mon, Nov 02, 2026 at 12:15:20PM +0000, James Clark wrote:
> The branch target of the previous sample is used as the start of the
> range to disassemble, but if that sample's DSO is "[unknown]" then we'll
> drop it even though it's useful information. This happens when recording
> userspace only. Save the address earlier for "Trace On" samples, before
> we get to the early exit condition for unknown DSOs.
> 
> In a later commit to change the default timestamp interval, trace will
> be collected that triggers this issue, so fix it now.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

