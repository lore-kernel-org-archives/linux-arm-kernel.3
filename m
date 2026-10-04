Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F7CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIysZCZmDY+hsmraxBJHQH/HCXeMIwx5nXj3FwnpnSI=; b=o4PSMAxxGuX+EVwULsKJ1pvl9S
	r8I8bhOWPYxlevubvm9puq4oWGTOdufL6EEmU/Hy6Hhd3OP/uNghrAe4WvZH3kgQxAdmEx7aepZZZ
	xBBwZnSPrLLlQRVrhLFwwHUpZtpi9n/Nx/u2rzq7djSkAG0m1ehWQDnBX3dfsf4g0zUPNhaquPNfT
	NwPeYZ5IrZ/T89KYYSApZ0M5IyAFYSS7wg1GPSePLv+1pLPUD969hzIbM+Sbn3tsY5xYlWSZCefIO
	FEie8sPMHw9zQzgxEpnKzghVzva9AJnoxpvTZptq2TRHXPqqY3DgRlCJk25YVx69eeUAqI27aD0Wh
	WfOS0jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOr-0000000FP9N-0El2;
	Sun, 04 Oct 2026 22:09:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUOp-0000000FP98-2rru
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:09:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22C96444F3;
	Sun,  4 Oct 2026 22:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDDA1F00893;
	Sun,  4 Oct 2026 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151779;
	bh=CIysZCZmDY+hsmraxBJHQH/HCXeMIwx5nXj3FwnpnSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RbZJVM4aJi45z4MD6FnfIIwGAZCzBlIK2SKaDsBl8ypr7Tk53Qis+r/5UedLY+0Xa
	 5MTaU7LSg0MsWm8HkKGlPyaOZM0MoHliMPdi3TZiG88ToSEOT+u4DjhSNXqjv6LcZ8
	 aBgZM3o9PVTKNHRHvUoRRmtZCV42Z2Bf2O0Aq0OF6NnRsndGAIx86Tpm1iEAmS3kCF
	 FbmPZZW2KdsFJ6nU6fu0Y2U5ff4DmLaeJiboUxUdXZ9oj4pGagrE+AdN9Idyp0pSpZ
	 tDGr4geVL0YIiwGrIZCFVjzJgUmup98Ibw7OQf+JxYbrCk0tNgDh87JN8DCFuEZHaV
	 c4Rqs044oq/rQ==
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH 0/3] perf: Suppress redundant ITRACE start records for Arm SPE and CoreSight
Date: Sun,  4 Oct 2026 23:09:16 +0100
Message-ID: <179113376395.1496517.2313914567669442516.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 01 Sep 2026 17:36:14 +0100, Leo Yan wrote:
> Thanks to Tamas Petz for noticing that Arm CoreSight perf data can contain
> many PERF_RECORD_ITRACE_START records.
> 
> PERF_RECORD_ITRACE_START provides the decoder with the initial thread
> context when that information is absent from the trace stream. Once
> tracing has started, Arm SPE and CoreSight decoders track subsequent
> context changes using context packets or recorded sched_switch events.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/3] perf/core: Export perf_event_itrace_started()
      https://git.kernel.org/arm64/c/ce512db53e0d
[2/3] perf: arm_spe: Suppress redundant ITRACE start records
      https://git.kernel.org/arm64/c/87f78017e8c8
[3/3] coresight: perf: Suppress ITRACE start records
      https://git.kernel.org/arm64/c/8f8301eaa400

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

