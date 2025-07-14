Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68446C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47bHO58vgJ57qoX7LfobNf05gWeEK8YWrZPwsxwYZuA=; b=XbtUg+rdWdYxAMvnQ/qa30SIWk
	LBG8lV+DUF8DieZZkUgeH/05BAyim3/0S4f3smBITkKOyo5mPSjIRuQ00TMvw26wzu5buW1ZTa2kO
	NYNhb/BeVMTh8eGZB7HB4aSFfUu/jfIY16jh4VjBm1UvTXsFap2lKJen4JIkiZZfdKVooQZOsQRee
	2c6EreBatN29gsIucX4Bd4n2QEa+CF0H5tMSiN6d2tD8UUGbYa4+p84ZcEh4451aJXCsjyZX4w7OD
	ozPlKk9MMoVM3psbzY96M2qNJ0eZcWiFcpPUEYzI8/syQqqapdJ8NUYjic+BvPgrF1BYC4cJ9EGWh
	gXijpUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJOB-00000002KOo-1Dg3;
	Mon, 14 Jul 2025 13:38:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJIU-00000002JIf-1qZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4889A56F57;
	Mon, 14 Jul 2025 13:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD2C4CEF6;
	Mon, 14 Jul 2025 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752499965;
	bh=zYLFg0UGybuPu0kCXHDSNl+grvOFE2zIo70Nf4XZjj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=touKXH+Qb7rjyg66pw1fVCbvQAzWsmxh7egKqLtOjYEBZTBcu2FM0jsxz01I+6I+W
	 qpx2dBxkQUHNwnTr8g1wySB0VzzJkWQ1HkEjzP4H8qQMlmS3GYAOFlQtFBEfgwfD7f
	 h9qKA82Xbb2GMrrQe4yEps7c9OUXrT0CB4zDSq9VuSMxBa2jpXnFQy32+n0EtlT9Rx
	 vR8aRyRhZVeIpSYKNV9CsRLZMcKy721QXGwV6BIr/1tB5qXF4dJDGrsZ3FEHOGaUbF
	 51B6L3i/YubBnIfdXnO/Z1yeEBc84d8Fn4m5sKHweSjgXUhqzUH/jqTes+x+lxunU9
	 cvDEhaNXyyZyA==
Date: Mon, 14 Jul 2025 14:32:37 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 01/10] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Message-ID: <aHUG9bVy9pdwfumh@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_063246_536959_FF956C5C 
X-CRM114-Status: GOOD (  11.60  )
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

On Thu, Jun 05, 2025 at 11:48:59AM +0100, James Clark wrote:
> Add new fields and register that are introduced for the features
> FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
> filtering).
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/tools/sysreg | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

