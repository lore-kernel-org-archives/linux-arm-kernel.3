Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB32606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oOq70Xlk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OOYpymob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uuLCQ5vdJSCNf8EK2nOCyp7/0y68brkrYFtyf0bFFsc=; b=oOq70XlkBPSOfpjK06ZeYtDGCC
	UXtZIfz3pCpdI0iIgP0SPjoNXKJRfGjtgR+Ei48BKT0CQQlm/Cf0ebmKyflEk5jZwqJbQk2V7nlq3
	gbObke5hB4A9f6Ij0L/23RVgJULB984fIcGXqnSwtbUJftALzhYD0W5se2JPgh4WvIM9AzWCAmiOS
	NTB05ss7aoditWr1/HzEll0L4PJl8CqgZn7+AduU3rMmHgIcIuv0MXMTJSc/eFHyEfRfAqO0GOwJ9
	ET89vhaaalrytGi6QAMFA0InVQ4+axoXihOl0Dj+Xl20LvoBWAEE+aM9Kt1fHPfzK8NtVgxcAzSUI
	Q/EG/6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv6r-00000008VKf-2pcG;
	Thu, 05 Nov 2026 10:54:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv6p-00000008VJu-1Sns
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:54:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BB411516;
	Thu,  5 Nov 2026 02:54:15 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976C73F673;
	Thu,  5 Nov 2026 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793876058; bh=sIBaP94YRtB79rtMZyrt9dVTqFG1JE1zf+vMbgJ9phU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOYpymobwadPTFqvrgvEgaxVMzn4xZAL9tqSsDkcyJBBigjWGT1qJ7UJxmH+BPP/d
	 OQHPaUqlAi2jkjp0Hk67m0pgS6q6DsuPy8elY/zkJkasFSWoE5tq1APhhM4r3fPREY
	 NAi/HbgohI/9lUg6sX+7+n2SX27ex0lSOrfTEqFE=
Date: Thu, 5 Nov 2026 10:54:15 +0000
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
Subject: Re: [PATCH v3 04/18] perf cs-etm: Use per-CPU queues for per-thread
 mode
Message-ID: <20261105105415.GP9176@e132581.arm.com>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-4-dbcb0c281b9b@linaro.org>
 <20261104142412.GI9176@e132581.arm.com>
 <54182c51-8dfe-46fa-9369-5e4e31a63796@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54182c51-8dfe-46fa-9369-5e4e31a63796@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025419_446533_592EA222 
X-CRM114-Status: GOOD (  17.39  )
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

On Wed, Nov 04, 2026 at 03:07:24PM +0000, James Clark wrote:

[...]

> > Why not use PERF_RECORD_AUX events as an opportunity to update threads,
> > similar to how we handle PERF_RECORD_SWITCH_CPU_WIDE?
> > 
> 
> In cs_etm__queue_aux_fragment() we check if the TID from the AUX record is
> the same as the one on the buffer, so it doesn't make a difference. They're
> always the same:
> 
> 		if (auxtrace_event->tid != sample->tid)
> 			return 1;
> 
> We can't use it directly in cs_etm__process_event() because we're not
> decoding in order with Perf events yet. In my WIP JIT patches we do, but it
> still makes sense to continue to use the TID from the buffer because you
> don't always have timestamps available to update threads when the AUX event
> comes.

Makes sense. Thanks for the explanation.

Reviewed-by: Leo Yan <leo.yan@arm.com>

