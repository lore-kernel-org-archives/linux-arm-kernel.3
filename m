Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF4BCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK4Lf4oijCtUZFtlZV654o9J48yPjUYbcF3QEjX+jjA=; b=LIX3xkfMi+wHE8d79AxaNAYbKb
	7KT8oaf4QojmvB5vu4P1py3jYtsWSDpUsEdPM3gf0XCw9h75SXwKzR9DTo1uyJHXhUTYb1J1q6peW
	g/hArB5KCVP1kw8fIduStNGaJaF8IIfDbkqvGp9nAzy3DI9316SOJItK7I7GYBBIK+ry//xFA3Vp+
	C5j0K+e799tNigfRR1HX6AyEBTM5mtmvA1Ov6GvPO1l5KN8m83nXRDzoQBCzgKA2yUH2VESuHdpHf
	r0GrcbMQ6TjMqUeMJBL4zl6hQShGyjBVe5Ll0wxaO9/wR432f238Dr/OFGJCDp6GUcXPeNmudbrDD
	s7yZsC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvci-0000000A1lr-1tZc;
	Mon, 03 Nov 2025 14:33:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFvch-0000000A1lU-0CzH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 14:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FF974019F;
	Mon,  3 Nov 2025 14:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AD8C4CEE7;
	Mon,  3 Nov 2025 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762180410;
	bh=ADIEP2R4Ye3a32o5urTgbZq2x2MIrVSu4eY4ppawa+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu0EgPfzvjxNzAIsMUXSORw/6lYc9GfU4GaBq2sILlsDpGtjsrmRc+YdwDv3m6ake
	 JHxJ2Yay279m0qKorZ3WYC67v1gF4ln6k4IMb6+HwrSwsVQeFUbzJzigRn5MHI9OeY
	 qjVx5buHc9KVTKW/R1cvEsti/x+qNEUhwlk0a9XjuQEbOoV9QnImX50GUpNci/qCxz
	 vql1rTt+ETn/+hUSJH3lr6oIYzPVgxk82JOo7j5i+UALRm5az5Ofga8DTAx6ACk3f9
	 rlAw2wYpEkHIcl89YFRv2J0vO2tS295cEnBqrcyv1DbPNunAfRoPNJeAmmKBbkbkzT
	 q/NtfE39BpBVA==
Date: Mon, 3 Nov 2025 14:33:22 +0000
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
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v9 1/5] perf: Add perf_event_attr::config4
Message-ID: <aQi9MstZTsloKmeo@willie-the-truck>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-1-d22536b9cf94@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-1-d22536b9cf94@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_063331_128606_154135B4 
X-CRM114-Status: GOOD (  17.88  )
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

On Wed, Oct 29, 2025 at 03:46:01PM +0000, James Clark wrote:
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> +#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
>  
>  /*
>   * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>  	__u64	sig_data;
>  
>  	__u64	config3; /* extension of config2 */
> +	__u64	config4; /* extension of config3 */

Please can one of the core perf maintainers ack/nak this extension?

Cheers,

Will

