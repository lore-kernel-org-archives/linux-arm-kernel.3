Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C2CA5FD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 18:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Djg3KJBPhdkjdILia13m0B7f9/fhXs3D5J8791PKRM8=; b=wDdvuZoajk0dJeqBXNhGkjDH3q
	O21DnDcJKeOU2t6WFlQ3nP/XHil6Xw7DFaZ9gzPfJotgYzCYCY1w5y/DjpmVcezDF1V4VQm/9Ijqr
	22r1Mvh+4sx3VkOZwFBey9BKRjNMlWJ+wBinBnLSGVMNgVNzSRynlJm4pIvhrphMQGqerjsxPAhAL
	RtCUeBTz6A9hLEySYYzFoyWhHKO9dS5MYHEmWk+0mzYNsEInZ1CS4WbsWrAaKA0gvkXyWWGxdQ2Hy
	1IG0GFXMJaf7oUfCiJSc+RwXXhlJYbJt//xD/6pVmDtQylnmgZDLsn7uagRIpARwr4yIpczwsYCZJ
	hyTuN1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGGw-00000004IIC-45iD;
	Tue, 20 Jan 2026 18:16:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGGe-00000004IHb-0kLK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 18:16:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9AB51476;
	Tue, 20 Jan 2026 10:15:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF2533F694;
	Tue, 20 Jan 2026 10:15:49 -0800 (PST)
Date: Tue, 20 Jan 2026 18:15:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <20260120181547.GI2732125@e132581.arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
 <aSSrrmX_nAl82GKE@willie-the-truck>
 <20251125142036.GE724103@e132581.arm.com>
 <aV_aHi9BLFzjnmx7@willie-the-truck>
 <20260114175240.GA1286628@e132581.arm.com>
 <aW-wfy3u5OD3BQAQ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-wfy3u5OD3BQAQ@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_101552_278115_3D44CCF1 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, Jan 20, 2026 at 04:42:39PM +0000, Will Deacon wrote:

[...]

> Ok, so looking at this and the next patch I wonder if we could simplify
> things a little by having arm_spe_perf_aux_output_begin() return an 'int'
> to indicate success/failure instead of touching 'hwc->state'.
> 
> Then arm_spe_pmu_start() and the interrupt handler could call into
> arm_spe_pmu_stop() if they get an error code back. Would that work?

Yes, your suggested approach is cleaner.  I will respin patches.

Thanks for the suggestions!

Leo

