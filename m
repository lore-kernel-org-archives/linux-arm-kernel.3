Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883FDCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5VYDkpgC3X7ZjRCyPt2XIA8+FkicoAmNfPSCP18dx0=; b=OtaVWaePZENFsChGa3MaNDACBu
	UESHD9bFk1ab+RVk2igzYBXLmymw0aU0527H+nZo+bXLSjJAjjRBzvvr7zlY7LVb86UW19qOPRIME
	yO5SEePyw1ToAjVoerMBB6lqCtJ0xz+vfmuEIP7R72vmTc6XZrv/haTs1ZgHjzQAbZKrOppcqG5RP
	Q3AqRWsMV/B5OEPUWfPxzXeOxXpNm2AAnWD7aPmjHZtfpKWSmtKb8MNOux00oqPuUVl3YrMkYWqro
	ZYld9rQekLmTypw0lD3cdWikidBOIyI6Q23hqkyhSAQ53UsgbVb5bokoHMBrTnAANnovsXBuj43Wm
	M8xcomfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXu5-00000002TUn-2T5z;
	Fri, 19 Sep 2025 09:59:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXu3-00000002TSw-3DCZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:59:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17571688;
	Fri, 19 Sep 2025 02:59:32 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C03E73F673;
	Fri, 19 Sep 2025 02:59:40 -0700 (PDT)
Date: Fri, 19 Sep 2025 10:59:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
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
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v8 00/12] perf: arm_spe: Armv8.8 SPE features
Message-ID: <20250919095939.GR12516@e132581.arm.com>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
 <175820142456.3469431.6863967464115578024.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175820142456.3469431.6863967464115578024.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_025943_840623_11D3E2A3 
X-CRM114-Status: GOOD (  14.18  )
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

On Thu, Sep 18, 2025 at 05:43:08PM +0100, Will Deacon wrote:
> On Mon, 01 Sep 2025 13:40:29 +0100, James Clark wrote:
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
> > [...]
> 
> I took the first 6 patches but 7 and 8 still need maintainer acks before
> I can pick up 9 as well.

Thanks Will!

Just ping Arm64 virtualization and perf maintainers if could take a look
patch 7 and 8 before the merge window.

Thanks,
Leo

