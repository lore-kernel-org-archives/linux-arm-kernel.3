Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527FCCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NJpAaLVEZOl4JnKY8fUm20R2JSvuBJYu+/COo9746o=; b=GGFN8ejpenFmoI8HzekznyDwFR
	tWQ78/vSGTgYzT+PLO/fXKRIrmv4f3eTckjio5+15qN/QKJ6wn+rD3uXJEClct0fAL817j6e3xFiG
	Ep6iqr0jb+uOxV9p8qmQKBLrLbx/HHLB8VeJ5FiVCRlMrlFJdsU9jxJT0S9SeMELLzq5uUHGMX4ND
	0yHXQ0J8UoqV2yvcERJWv7oA+LMO5wXc3ykHS7OUMO7NipnGsh9wXR6J/MLE/Ls8Ifx+q3a5Zl/qe
	8EAVmbuLgGm3aN465EHYifwZRVYozQYRD2sd8CoNwcEq7+O4JYetMc9fLvvt2paOYP671LEG8ZByF
	HpeKU0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5U-0000000CEbo-1v9D;
	Mon, 24 Nov 2025 19:19:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5K-0000000CEZQ-1N0l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 968AC41AEB;
	Mon, 24 Nov 2025 19:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD7AC4CEF1;
	Mon, 24 Nov 2025 19:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011928;
	bh=rDkSwbW4xoasbdAG1a25incEAfgJNunRzcR8e9Kx9qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7Vox0tiC6aEBy+NvJaadSN3/y2+MnSeI16LLh4WWU7Wt1gcm7dngn98Eidpbh+Zi
	 uiiuASO0fqEp+TXKWvf0/zEp9FV1oGU+xaNcZpFi7aTPesnk81dS6cBEoRFZz6gotJ
	 0XG1DpTk1Y9N1fjuK1rCaYdIxKvwLfw2bNAkA/22FbzwPXFISHtAO5ky794Fp8f5Pn
	 ikwAnf3fH6xzB/d29obYib/CuWsaz3JJpw8MhGpEHoPo8LXM48dX5S3uFQkfMeuUVV
	 pXHjDz2toelygeC/7FhZnqgn/omotVps3GjsGPCkppJ+Z3SDoDzdpgv02dQxBQwaWh
	 S7uz3yF4CeFmQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v10 0/5] perf: arm_spe: Armv8.8 SPE features
Date: Mon, 24 Nov 2025 19:18:31 +0000
Message-Id: <176399995950.525942.8372760882667197136.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111850_389511_21D3F4E9 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

On Tue, 11 Nov 2025 11:37:54 +0000, James Clark wrote:
> Support SPE_FEAT_FDS data source filtering.
> 

Applied kernel changes to will (for-next/perf), thanks!

[1/5] perf: Add perf_event_attr::config4
      https://git.kernel.org/will/c/cbbfba4847b8
[2/5] perf: arm_spe: Add support for filtering on data source
      https://git.kernel.org/will/c/e6a27290d800

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

