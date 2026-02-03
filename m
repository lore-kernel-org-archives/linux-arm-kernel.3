Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0322E8B363
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP/Lgj+hwumaUtS0VKa82AuzZprUPcAU6XT35ug87KA=; b=RJ3BiSifH8+oC9n31JYurC1BIL
	pcEGZJHcGdEVN83gDmw+2ejxbB0/Ovdwu08boIZmp1cry6admK/wCz82yY01oR5WSrz8nkK76LGl0
	NBluSTu0c6UyYPRMVxL2o8xRfZBQXqi0wIr2d5nHw0TZUDjvhuQgVMaRc/vyF2sVp1t/NFfQG88kq
	lJrpE18Lxgo6RytjUvEv2aA1qzZDWemIHk5R2k1D3c7mStRrvRu+2OkHWudE8E2wgps2CjKRCmLoK
	xail0RoLzYv9XKTcUWZ45lGQ5c84U21RcLPb66ZF+vB1T1q0b2tSM8yxNXjGLcmUIvIrskaxmqVrj
	NkfTuEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1P-00000007K9d-0Bso;
	Tue, 03 Feb 2026 20:29:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1O-00000007K9I-2DFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 20:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F289F6013C;
	Tue,  3 Feb 2026 20:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF4EC116D0;
	Tue,  3 Feb 2026 20:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770150553;
	bh=HV9GtDj+hx1JotaPaT2FhgGu/piJ23CCSZj/DKzldBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hrar6Kr0tachNUhq+EIJ0VQ4KiFJ9cEHPth9Ue/TKJP6BiLld3Z/fY7/qeRVRXhoU
	 hhGAeWmcQPXPomEaEIrACKJGaqm7UKJ7vohFZtZ2K6s6GOwmn0+FZpPbB6BXzm7qcB
	 DLHWzb7odWmsv8ZuixLPn9i8ghjPLCNBVi29rMFiVQ+D68BcVF0aUk2yBdOMQ3aWRP
	 pY+RUp9P6YyigPa6yerOp1FnK7+IGSfglzeAYwGu2skY0uIaJPDNDfyqcMcSQmLBe4
	 kTxHWd8ZKIer7X/EiaGniIu2LW+pANXL0O7xEywWOHRLv9RdB6R9wP+EI9xUKDtjqx
	 0A54yuiFdcEOA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] perf: arm_spe: Properly set hw.state on failures
Date: Tue,  3 Feb 2026 20:29:02 +0000
Message-ID: <177014771123.2668461.9075722971112388662.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260203-arm_spe_fix_truncated_flag-v4-1-1e07df317584@arm.com>
References: <20260203-arm_spe_fix_truncated_flag-v4-1-1e07df317584@arm.com>
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

On Tue, 03 Feb 2026 14:40:43 +0000, Leo Yan wrote:
> When arm_spe_pmu_next_off() fails to calculate a valid limit, it returns
> zero to indicate that tracing should not start.  However, the caller
> arm_spe_perf_aux_output_begin() does not propagate this failure by
> updating hwc->state, cause the error to be silently ignored by upper
> layers.
> 
> Because hwc->state remains zero after a failure, arm_spe_pmu_start()
> continues to programs filter registers unnecessarily.  The driver
> still reports success to the perf core, so the core assumes the SPE
> event was enabled and proceeds to enable other events.  This breaks
> event group semantics: SPE is already stopped while other events in the
> same group are enabled.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] perf: arm_spe: Properly set hw.state on failures
      https://git.kernel.org/arm64/c/283182c1c239

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

