Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV/3Pz7Wzm8ZwlFU3fSYfBzlnE9jSVU2V5jX/R2UlXw=; b=hgCuucvCqqjKibWfc6CQdIHQHF
	3TQcs9MW/Ko7Yo65yHhv0b/oWxAWX0YQJENiNN5LsEANaFqWxkQVagqcxD28p6MQasTFT4pwm7g6n
	QYSSnRFIPpQdVXAj7I1PcHCtYcp+oVUIIGXm7u3Bq/V8nf0qEjdngKKblp6jRlqC1QpUjs7Uwr8Nr
	OMPxa3YnPgFIF/+FH8nVmMHg+0DxSfzEi1K3e8e9Vu/Ee0CfIiM5qQH/Q0Fn8VHMKR6T3f0A63nGu
	cW2khL57BSyz5pilylKmvJkZRu/EstvuVXoVH8sOtEMUTxauk4L4xDocuQwUadkypG7mQnbaZWbFk
	N98mVCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fu-0000000B3MZ-0p7z;
	Fri, 12 Sep 2025 18:39:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8ft-0000000B3L3-37X1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 18:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oV/3Pz7Wzm8ZwlFU3fSYfBzlnE9jSVU2V5jX/R2UlXw=; b=lpEOVf2JswI+dI4GpbeaT7Awru
	PtPPi+k4JdxlLuMq5wNormgHukRdm0hbEPqa/K+X5W7Wp2gfqPgLBhzzwDnlkIobja3i1D+gIP6D1
	c/QLCW9xj/n0lChT5ME1/0PmRoQEHOD5gQ1CsiNfgdQk89omLTYf4l9iVextAS9NBZoNUckLy9lj9
	J738zySPeGwUVHLiuTw4P/uoL4XdhCZkt/Po6CvM7M2P9i+ypJcQs0RTlidhaa+2MbNSO6+wUCCjo
	NH+ed5MIAxzcSLKMqmRHOI3wjTFbL1nUl/tylpRnLt1S3/YwGxoV7pcaoHOPyCCh3dXSuceTju4VR
	utVAEk0Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fq-00000006PXY-24Yo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:39:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8409544C2D;
	Fri, 12 Sep 2025 18:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D7AC4CEF1;
	Fri, 12 Sep 2025 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757702343;
	bh=YEEaCZO5aN1y/1zb1AbHYkqAatzlAvFXSfhR1nYo2v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBh+Slp03NFbbnGWPogR3V+Y6ccKy1YKEh+TT890SB1Mi6o6VrykNOSey1A0LF35R
	 35uabzq+f2zPB7r8tnlKVkaE6LiimTlE9u0To0ck5X/ji5r7mEhsPmsovQUctfyI52
	 IeEjoSxvHPAfY8wDD/vmWIr87II2awQiwlYVjbvhIYjVbeJ3VGDbyhxcndAgVOZ9xz
	 npEX0gRRaGFOlWCN9JEPASOm3jrclSOe4XF38YKFku5XNh8BvpXbgfDUCxIfg8AT4b
	 7iLLlKi4JZJY2RwgPzQjbw6LL2ksJSwBfSuLNW4Sm0sUq3s9HCviazZ8AaKZ8y12+I
	 tmT+ot12r7N5w==
Date: Fri, 12 Sep 2025 15:39:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Yunseong Kim <ysk@kzalloc.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf: arm64: Sync ESR_ELx_EC_* macros in
 arm64_exception_types.h with esr.h
Message-ID: <aMRoxL9Zok_pGZ8u@x1>
References: <20250822145855.53071-2-ysk@kzalloc.com>
 <20250829132434.GI745921@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829132434.GI745921@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_193906_745404_942F3607 
X-CRM114-Status: GOOD (  11.34  )
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

On Fri, Aug 29, 2025 at 02:24:34PM +0100, Leo Yan wrote:
> On Fri, Aug 22, 2025 at 11:58:56PM +0900, Yunseong Kim wrote:
> > Update perf util arm64_exception_types.h to match the exception class
> > macros defined in tools/arch/arm64/include/asm/esr.h. This ensures
> > consistency between perf tooling and the kernel header definitions for
> > ESR_ELx_EC_* values.
> > 
> > In v2, ESR_ELx_EC_OTHER and ESR_ELx_EC_GCS, which were missing in v1, were
> > included.
> > 
> > Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks, applied to perf-tools-next,

- Arnaldo

