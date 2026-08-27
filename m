Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83E7C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpasPaJ9xcduX7UHA5UZyCSC91SDyBuKj0LkeZOtSOo=; b=yKxP7iGi0NPgdbg98qsBDm0xGF
	66IafbedOOBHl6Oj92jHtqdvPoTzu+GjnHc6/NgXcwIn7nGoOjVzNMqbw9Snb2d9nPbpKnLFjQqLs
	cOPNMXAD2y52vbGfWmnnOACnHmSPUSbztDyI1SvTfBQRrU3YxRFSKLRKs0MqqFKmR9n5/akGeNXP0
	iiRUrs/HnSxHb4fdxlftmmOvQcAXXip51flCIDLNRtkJEADivNXva5UBxdnGc0XHUkZrbOXefh1NN
	hHmLgAuaP1AgE8sTI/xY5v57g1Nwqno1hvUHWH6fiWlGrljBUnz5NPNlAyaxD4DnbWegko17eXG8A
	GRepLZTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdhQ-00000004RHt-1QDI;
	Thu, 27 Aug 2026 17:15:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdhN-00000004RGs-2Q93
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:15:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D27D1596;
	Thu, 27 Aug 2026 10:15:28 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F25713F7D8;
	Thu, 27 Aug 2026 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787850932; bh=WpasPaJ9xcduX7UHA5UZyCSC91SDyBuKj0LkeZOtSOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOTKxzn5p/AkoQJ7PBJNwSjNBSp8gpcXK73cXC0GhcHQ6r7k7r0mc8F/jsyM0AKRY
	 /QwQz5TQClQsVnglpZUdMghT+ZoX+cLrL1OJofm3+aP+ynWJxyVKYCzYRupw1mek1o
	 U62qjMsG0smeawdJO85xjKR2OsachZzARvxRRaW4=
Date: Thu, 27 Aug 2026 18:15:30 +0100
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
Subject: Re: [PATCH v2 10/14] perf cs-etm: Don't print missing buffers in
 snapshot mode
Message-ID: <20260827171530.GP8904@e132581.arm.com>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-10-00c4fd0701b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-10-00c4fd0701b4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_101533_661624_710AD2CD 
X-CRM114-Status: GOOD (  11.28  )
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

On Fri, Aug 21, 2026 at 10:49:08AM +0100, James Clark wrote:
> The driver produces lots of AUX records for trace data that was never
> captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
> only an error in normal mode.

This reminds why we should use circular mode instead of snapshot mode,
so that redundant AUX records can be avoided directly in the driver.

> Signed-off-by: James Clark <james.clark@linaro.org>

For this patch itself:

Reviewed-by: Leo Yan <leo.yan@arm.com>

