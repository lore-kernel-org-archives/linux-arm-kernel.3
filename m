Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EeH7yVpz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=H/Yx1tU3;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kvWm3ELs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EolUrwZQiSAM3PJ9+udGnUgOcc9Wxy4cF8sTcB/x8RU=; b=EeH7yVpzQxuWD+2q+Cch78n1LX
	m5sztjwJ++rvGPflB7laslJd6FZ9Z8Ln4Ex5rXwDdlPhCdDLS0+zTu3hyvu6pQ5mdphiRqwK7WDAH
	7KboYMHkcZgDORoe7s+rKoyWQKHw1acaFfiMvHAKeGBRnXWsjmhe1Jn/TkAW77UWqXG+83j2p4RF3
	Us5eQtz8s4kRonT2DSrF/xIDLqHg6ZB2BF4LQLy9k+zAdSOlEslY/4ct8zZSPN2xYbOivXwfVcZYp
	BigshEmibgx76ycCoCkDB/pThbu4bf1fRGF7CuKj85r23JOf6thryCFvO1fY0wpRAJLwHiRxLBMKb
	f3areuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw51-00000008n2t-35uI;
	Thu, 05 Nov 2026 11:56:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw4z-00000008n1i-1eZE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 11:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EolUrwZQiSAM3PJ9+udGnUgOcc9Wxy4cF8sTcB/x8RU=; b=H/Yx1tU3IrOEUZZ2TxWDh8/TiR
	huTYHMamEY3UgT6J/BcSonB1tQ8QP5vt7MrVnAPu4T/AxyH8YMomgN3tKATPFxxDG4atrV1wWuqdW
	fzXEUAVnXfxlUkrULg7D4WqyLkFF3HkMXBWHFNf4lB/riHAQahYUmFpWapJ+X/xke/2AvpSlZnxIe
	UubSmN86aywMeCErB8GKx4ubtDXwd51sXQupemo023hWmeMF0Knmia3mpbaYlFf4j1QWAOkcUntvk
	jMB2/nRU09y/dvnhtm8nB1Z6A7Q3PYGXotJfd/C8pm+YCVVl8hMNG+f+mtUxJhqxtft03pOmITwXH
	43NNaX3g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw4q-00000002vPV-1ED6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:56:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2818419F6;
	Thu,  5 Nov 2026 03:56:14 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9F0E3F628;
	Thu,  5 Nov 2026 03:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793879777; bh=uUU6WeGNbp8M9D1RIW4g77izG8IRnf63cU3yGo6J/dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvWm3ELsUjqKVzgkvpVtDptptSL4Njbe3RH8DGaRRtTXzqka5gd1HBJYbMtiX/K3o
	 PztZdmeNuezuXoUYnyvcj/TbSJ0RGqeAR6gawSmV0f17+CDWwgfXKb5pgpc+7VObw3
	 S4c3wtZ9Xx3hjxqN4IYHBija3RB4SMUiBZ/xTr5Y=
Date: Thu, 5 Nov 2026 11:56:14 +0000
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
Subject: Re: [PATCH v4 19/19] perf test: cs-etm: Increase snapshot size
Message-ID: <20261105115614.GU9176@e132581.arm.com>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
 <20261105-james-cs-unformatted-per-thread-fix-v4-19-7759e0ce2449@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-19-7759e0ce2449@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115625_549195_AA9AE118 
X-CRM114-Status: GOOD (  10.18  )
X-Spam-Score: -2.5 (--)
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

On Thu, Nov 05, 2026 at 11:45:07AM +0000, James Clark wrote:
> AUX maps require at least two pages, so for machines with 64K pages,
> 128K is the minimum.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

