Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94250CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tA4gxlI4HFEqfMmCwKcvFRn/xh6mMAmbFPW/PJjH2g=; b=e+cbmaAS1aKzG4XVDCDmrl80RR
	pv2oK3uDImwEuTXiHhJ9+c9B3x6/wZN5/wVki/KV4ZIo88pWQx0SO3G274TViKnIbZlhswZfiDyUt
	J9geUKNDRk+x+fT5iZ6dTJaQEvToFujyMb7/xGhyEEbcfgzPM8iKwNhtmoANMwok1p1MRr6J3ZONp
	8z+IPfp+1t8egtHr57dX6PCd+VcPP46vAXyWAcfJ5WPJqgHfKo++3YrXLmZ8CWUhZgyw3l2Yyz5tz
	NTeg2+obYGkcBWoVqeDIFZqGvR8GP9YbOEm9uznBv9elJ7649Noq4KtjUymeXiOC3BoX3wHyfxEpa
	VzUCj8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvtT-0000000DY2z-0LF9;
	Wed, 17 Sep 2025 17:24:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvtQ-0000000DY1A-476I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:24:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A59F74341A;
	Wed, 17 Sep 2025 17:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F226AC4CEE7;
	Wed, 17 Sep 2025 17:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129872;
	bh=4UoXPczKg9TI8gT2C8XoVlv2Ynl1q/uZ3VhRzWWWyL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhENdb70ih5gEPAaGFnU9gvOL5vnLYRihU/D1e97SBANv3lOG9ooDfnxdId2zkmRL
	 /P6thmnX0eCCuNi/lvxGQkj9nr3VSv4mUr9aliqnlnnD7sNDR+GOZy3fQQDfEc/yce
	 cBNxIkPUd/2YHXWpJD1ZJp9cx4yWAixjHilt9qTLg5E/XQiJogwZyiTuP3l7VyXz1z
	 3ulFWme/QBIAOptneJigS3xJIGophNq4birSAF3ZI+OS0cAOleG+s7zxMxoMFGu5G6
	 hvncvb8HMzSZg1XqmChn0bAgVbr60lrNuvupZSS6lLxHqoRUcruFa8rXLNqv9htg+G
	 2ByyKb4ozUbdQ==
Date: Wed, 17 Sep 2025 14:24:29 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v6 00/12] perf: arm_spe: Armv8.8 SPE features
Message-ID: <aMruzdTu74rZ0RZ9@x1>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
 <20250808123913.GD3420125@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808123913.GD3420125@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_102433_041709_091A4214 
X-CRM114-Status: GOOD (  14.74  )
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

On Fri, Aug 08, 2025 at 01:39:13PM +0100, Leo Yan wrote:
> On Fri, Aug 08, 2025 at 12:22:57PM +0100, James Clark wrote:
> > Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
> > filtering, and SPE_FEAT_FDS data source filtering. The features are
> > independent can be applied separately:
> > 
> >   * Prerequisite sysreg changes - patch 1
> >   * FEAT_SPEv1p4 - patches 2 - 3
> >   * FEAT_SPE_EFT - patch 4
> >   * FEAT_SPE_FDS - patches 5 - 9
> >   * FEAT_SPE_FDS Perf tool changes - patches 10 - 12
> > 
> > The first two features will work with old Perfs but a Perf change to
> > parse the new config4 is required for the last feature.
> 
> I tested FEAT_SPE_EFT (xxx_filter_mask), inv_data_src_filter
> and inv_event_filter, all of them work as expected.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>

Please let me know when I can merge the tools/perf bits.

- Arnaldo

