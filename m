Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F22FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGw+UYhvYV3BtxhuQqdUqDZnqK5ssKAj5k0NHneU8OM=; b=E9PbzVuBVX+gz+lWsdMlpmkat4
	KVbNTgO/tR5hye7M5QExzldcw2HAn6pbUYhfkdlWsSxkAlgmWu/g0vZ4t9werUS3W8+Q9hVehHU3z
	aHitE1MPbLS6mWji0qh23EZNUQ0ICeRwfE/CEee7F0S3x0Pjz5GxQZ3x0qU6P7pL4V5NK3vYDpWwg
	Oho9koTnUZ8Cbzw3ywb5+m1QmUdItSR0zROnB7wSfZTtCpwAlwQVHPbWX56euATm4EkL13KH0bi6a
	nN2WDCB2coANTEuBH5ipZDpHiFhfHqUD9pnNXwWatevWoIAJ07ixBKgKZWo0TFLa7xGKtBkW1XF65
	eTInh2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghp-0000000FSr5-1q7s;
	Wed, 21 May 2025 10:29:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHg7E-0000000FN5u-2Ukw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 09:52:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 364E61515;
	Wed, 21 May 2025 02:51:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E2003F6A8;
	Wed, 21 May 2025 02:51:58 -0700 (PDT)
Date: Wed, 21 May 2025 10:51:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
Message-ID: <20250521095154.GV412060@e132581.arm.com>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520134632.GR412060@e132581.arm.com>
 <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
 <20250520161003.GT412060@e132581.arm.com>
 <20250520162243.GU412060@e132581.arm.com>
 <5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_025200_684167_F9DBDFD8 
X-CRM114-Status: GOOD (  20.28  )
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

On Wed, May 21, 2025 at 09:54:48AM +0100, James Clark wrote:
> On 20/05/2025 5:22 pm, Leo Yan wrote:

[...]

> I'm thinking I'd rather leave it consistent with PMSFCR_EL1.FT and
> automatically enable PMSFCR_EL1.FDS for any non zero data-source filter.

This is fine for me.

Just a minor thing, for the case PMSDSFR_EL1 = 0xFFFF,FFFF,FFFF,FFFF,
we might consider to clear the PMSFCR_EL1.FDS bit.  This would be a bit
performance benefit for disabling data source filter rather than
enabling the filter with unaffecting all data sources.

> This means we don't need a tool change to set some other flag when a filter
> is provided (even if it's zero) and it's much simpler. It also doesn't
> prevent the possibility of adding the enable flag in the future if someone
> comes out with a need for it, but I don't think it needs to be done now.

The question comes down to the complexity in user-space tools.

Perf initializes the attribute configs to zeros. If we want to set all
bits in config4 as a default value, we would need additional change
in the perf tool. Also initializing config4 to all ones is likely to
cause confusion if other tools want to enable the feature.

I agree that a cleaner way would be to use an enable flag + mask, we can
defer to add flag if needed.

> TBH I can't imagine a case where someone would want to filter out any samples
> that have any data source. Surely you'd only be looking for a selected set
> of data sources, or no filtering at all.

Agreed this is a rare case.

Thanks,
Leo

