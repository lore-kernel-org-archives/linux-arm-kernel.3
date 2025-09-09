Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EDFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTyS+QCFhgFeS1IxoYr3OEoG0C2bu13Hw4qRgmJ0SQA=; b=y9eHShhs05KINY6UERByNR+bQX
	sHbofgracZqv+jfA44BMS+ZN+vdQklPy2qWHAjNR0/zHZhgdlXnHU/qMcCHLkez2FhAoNp/oIAQAT
	ghpAKoTppVlL6qYC/nl9v3WXXKB2q1csndyChNrbmCq3oJ3d3gi4qlV/C7syguAuje9CF1YbxlF2H
	q0q0H84TGpaq3pYmfjIHxjWHVVm2SoHdilD+7AO1WnMp784ip1QvSHQ6BkYwjRPnOAf/GdspQ9afz
	DbWMUdNiuba90xre15acx9gLTxabHR19UUDSkAVMbaliHPB1emKdF7EKEKVFqh6naX0XywXAuIpV2
	oh3Oxb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vt-00000008ni0-1RiM;
	Tue, 09 Sep 2025 17:15:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuwt-000000066wW-1vLj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:47:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A30A113E;
	Tue,  9 Sep 2025 02:47:28 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F7013F63F;
	Tue,  9 Sep 2025 02:47:36 -0700 (PDT)
Date: Tue, 9 Sep 2025 10:47:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	George Wort <George.Wort@arm.com>,
	Graham Woodward <Graham.Woodward@arm.com>,
	Ben Gainey <Ben.Gainey@arm.com>,
	Michael Williams <Michael.Williams@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] perf arm-spe: Downsample all sample types equally
Message-ID: <20250909094734.GA12516@e132581.arm.com>
References: <20250908-james-perf-spe-period-v1-0-7ccd805af461@linaro.org>
 <20250908-james-perf-spe-period-v1-2-7ccd805af461@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-james-perf-spe-period-v1-2-7ccd805af461@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_024739_719774_056808A3 
X-CRM114-Status: GOOD (  20.97  )
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

On Mon, Sep 08, 2025 at 01:10:19PM +0100, James Clark wrote:
> The various sample types that are generated are based on the same SPE
> sample, just placed into different sample type bins. The same sample can
> be in multiple bins if it has flags set that cause it to be.
> 
> Currently we're only applying the --itrace interval downsampling to the
> instruction bin, which means that the sample would appear in one bin but
> not another if it was skipped due to downsampling. I don't thing anyone
> would want or expect this, so make this behave consistently by applying
> the downsampling before generating any sample.
> 
> You might argue that the "instructions" interval type doesn't make sense
> to apply to "memory" sample types because it would be skipping every n
> memory samples, rather than every n instructions. But the downsampling
> was already not an instruction interval even for the instruction
> samples. SPE has a hardware based sampling interval, and the instruction
> interval was just a convenient way to specify further downsampling. This
> is hinted at in the warning message shown for intervals greater than 1.
> 
> This makes SPE diverge from trace technologies like Intel PT and Arm
> Coresight. In those cases instruction samples can be reduced but all
> branches are still emitted. This makes sense there, because branches
> form a complete execution history, and asking to skip branches every n
> instructions doesn't really make sense. But for SPE, as mentioned above,
> downsampling the instruction samples already wasn't consistent with
> trace technologies so we ended up with some middle ground that had no
> benefit. Now it's possible to reduce the volume of samples in all groups
> and samples won't be missing from one group but present in another.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

The reason for unifying period for all samples is reasonable to me:

Reviewed-by: Leo Yan <leo.yan@arm.com>

