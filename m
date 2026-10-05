Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03888CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qo4xR1q1NsbK0Jqv7gJMpCILZ1T8CSmK9ju1GsfOPWs=; b=DEcy7H86XfhXSE+0h4kwufcSTk
	z7S/EGl2420/0B//DNfrnle8wYxvo360tU35JKTaJxusRdpw+gGQ6r7llmdn1+MniUjHdWa/kLe31
	AWIBxoFBIpPikVS5h0ycYtjEnLvkLaknl20y1Q5/yG60sUxP0e3plGHTnRfzLg73/Bw3zqpeqAfeY
	E6vbcLhZpWnF4lAVK40HTNpWGRB20sVZl06ba02RhhfoLQyJSP+9sgslMaVr6J9R5zKkZ5FS44xbx
	Ebnp6B0ZkxDgMvf6xxwDs4DN2PX036okUaOlIafs1zdMBHm2cHWdqfD3zuu7/LPIMZX89DSIpmk1e
	EyvFjnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe3C-0000000Fso5-0Yer;
	Mon, 05 Oct 2026 08:27:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe3B-0000000Fsnc-06oC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:27:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C525543F51;
	Mon,  5 Oct 2026 08:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1021E1F00893;
	Mon,  5 Oct 2026 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188876;
	bh=qo4xR1q1NsbK0Jqv7gJMpCILZ1T8CSmK9ju1GsfOPWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSRZ0AiCazN5TjrtDop8t3K6xVt9WxYch2HGvKPMUbczSZ6D0iqg04MNztQXDyLS4
	 La4LfMLGeGVzM3PGWIpdKx6Vc5phiV20Q1fs+j7VBv+9ljPkDC70xxWvCJXqWuDKiU
	 8yAs661YvZxdnC5Tghav0ONL1fWlVL+49gB9mJsnWYGEwoT7XeZq8ZnbIet0uqCkA1
	 W+O3CREIwVOMqTBffehQDMLXX6NgMz+qILZU8rvMzwisJDYCxd3PdJakMdipfW+qbH
	 2ftDJkxNyN8gZiOEkyWCxsopzMYNaY2ecE+7q1aekSxhytDOhb8Cj764LdJ2JvNf0K
	 DVni6KUSHK9mg==
Date: Mon, 5 Oct 2026 09:27:51 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Al Grant <Al.Grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
Message-ID: <asNfh-qywjOPxajj@willie-the-truck>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
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

On Wed, Aug 05, 2026 at 04:01:52PM +0100, James Clark wrote:
> Discard mode doesn't call perf_aux_output_begin() or emit aux records,
> and enabling it never fails. We'll add a second discard mode in the
> next commit so it will be cleaner if there is a separate begin function
> just for discard mode.
> 
> No functional changes intended.

[...]

> +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
> +				      struct perf_event *event)
> +{
> +	u64 limit;
> +
> +	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
> +	limit |= PMBLIMITR_EL1_E;
> +
> +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> +}
> +
>  static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  					 struct perf_event *event)
>  {
>  	u64 base, limit;
>  	struct arm_spe_pmu_buf *buf;

Is it worth checking that we have a discard event in begin_discard() and
similarly that we don't have a discard event in output_begin()? It looks
like quite an error-prone interface for the caller, otherwise.

> @@ -775,6 +785,12 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
>  		arm_spe_pmu_disable_and_drain_local();
>  		break;
>  	case SPE_PMU_BUF_FAULT_ACT_OK:
> +		if (arm_spe_discard_mode(event)) {
> +			arm_spe_pmu_begin_discard(handle, event);
> +			isb();
> +			break;
> +		}

This looks like new behaviour?

Will

