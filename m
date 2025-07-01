Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B22CC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Xcu9w9ZhCeXf1QoQwzhZrINeBk2+lm0fa9zXifzq9w=; b=Q2a6A/DEeXUINWIUDCqzHeLYDp
	p9jYU1HPXfaBK59wvvXj/MpaNagtSEgz2Aop6sS+iGaLar/aVaY3bWZtYvhlWXgneX/pCnU3mc+IA
	3Zov7RckXkpMRDJAICzXXXSiT2z0CP1R4wpQcK5+x9T9o+eDPLvRtqE/bn99ibLA9QFJSdJ+4kHTc
	SR6hjDC/7mP2RPUFtc7yc1PXtVTh1Q9bxrnX95SE/TubTCq0zRjh2W3QCNeieuFenp78BcLF7ieDx
	sDVKS0p+WAwrSAR5HbXhT1da/y/VoCtlt16I9Ku6lwq1FfsLMEXS71A7hFFA2n/bKbRjZYFxuWlrY
	0Falqrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj4-00000004Tan-2PC7;
	Tue, 01 Jul 2025 08:52:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWE8-00000004OfX-42X0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:20:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC73B1595;
	Tue,  1 Jul 2025 01:20:12 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4D13F58B;
	Tue,  1 Jul 2025 01:20:27 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:20:25 +0100
From: Leo Yan <leo.yan@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 11/13] perf arm_spe: Refactor
 arm_spe__get_metadata_by_cpu()
Message-ID: <20250701082025.GU794930@e132581.arm.com>
References: <20250630-arm_spe_support_hitm_overhead_v1_public-v2-0-2e1afab313b9@arm.com>
 <20250630-arm_spe_support_hitm_overhead_v1_public-v2-11-2e1afab313b9@arm.com>
 <CAP-5=fUPfKB5Va_+sO25yf5Y-SjQTR6WsauqcmxirVzgjRNVAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fUPfKB5Va_+sO25yf5Y-SjQTR6WsauqcmxirVzgjRNVAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012029_036882_A1DC5B65 
X-CRM114-Status: GOOD (  12.67  )
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

On Mon, Jun 30, 2025 at 09:53:18AM -0700, Ian Rogers wrote:

[...]

> > +       /* CPU ID is -1 for per-thread mode */
> > +       if (cpu < 0) {
> > +               /*
> > +                * On the heterogeneous system, due to CPU ID is -1,
> > +                * cannot confirm the meta data.
> > +                */
> > +               if (!spe->is_homogeneous)
> > +                       return NULL;
> > +
> > +               /* In homogeneous system, simply use CPU0's metadata */
> 
> Could this be derived from the spe's pmu_type? Something like
> perf_pmus__find_by_type(spe->pmu_type)->cpus ?

Good point, I will give a try. Thanks for suggestion!

Leo

