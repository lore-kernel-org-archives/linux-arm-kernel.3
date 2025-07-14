Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCXVmDCpka1BY1S4KZNsgRr5IQSraxRTqTe3Zpg088k=; b=MhRx2sezwz0lViHKsvaXTyUQeW
	oilDJi53tlL4hBNQb+zs7tZFhE+35EVX7Gk2F74v6Wu0pU2m+wFMpKQiR+ltm+LNG9lDj0dqqzvCu
	J/dk4xUNAVoVN4i1KO4KtryiZsWw5XLzNMrJRlje+Op7hXj22BY2cJgLJfGxE6aMCYqaF2YitVLVL
	qaU+teS5SORVtdHvYSfNwa6OyupnMRPs7gBczawzH8d6iUjwCIe6Nndwr7yj/rew5htURMNOy4dyA
	njnhq1EfgDtNJiGJEYFlGg3PkhwercvkyrHhDL1Ony3oKTEY1kuAGmGWytFL7Bcpq4bjq/oEVE47l
	F9Aam1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK1K-00000002RqP-1KV5;
	Mon, 14 Jul 2025 14:19:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJfn-00000002O4f-1WBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE12345650;
	Mon, 14 Jul 2025 13:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97C5C4CEED;
	Mon, 14 Jul 2025 13:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752501410;
	bh=RvhIzF1178EACH5sRBxk0JJFnaECIpOn0lv+2agGFrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHVMsFiV2nhGLVS79/uw7C6EfvU6dSKDBpwo22vUR3TF4ARaRaSmJPfS1WWtNMXFB
	 HNq4WazkdXXB/PbdkiYBgHZ+OLynQQksyImyyDrWJN0DvUp1mK7jSO4+zI5LDc28ZQ
	 DqwnGnkrwBPjmzMjskBHhB2mdMZ5oxXfqZCA4UPtX1auC9eDUCBfWZPeeeGqaDhkA0
	 wW+KD9z8wVi9op8wlL5riVWjYhLoIslAEgvHbxQKPK+qAsZkyNOp9bLkEtq/8f78mV
	 ildM5/001t+rqW+Wtl/DB6Jbd7NS75u/cahn8ZlGvwYMFNwAORQn/raUQn6ZtjQa0H
	 7xCtq57AlezTA==
Date: Mon, 14 Jul 2025 14:56:42 +0100
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
Subject: Re: [PATCH v3 06/10] perf: Add perf_event_attr::config4
Message-ID: <aHUMmgt2fCSfxy6f@willie-the-truck>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_065651_428675_AA05BC6B 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Jun 05, 2025 at 11:49:04AM +0100, James Clark wrote:
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
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
>  };

Looks straightforward to me, but this will need an Ack from one of the perf
core maintainers.

Will

