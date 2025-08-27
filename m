Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4171CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB/U1vduxZJMUc4C3XcbfsTNrbRms+v/21L2Hk9RIPQ=; b=rHLpqihZB0tuBa8T22S2OXh3k1
	oa6zOT/PYKB0sJgCIcIpVvL/XtHbFmXvM7fhx/QWGAJODEHFj2yrKhHrM79UBKxyxr7ncINQhp+bN
	CnPBOq5INWrJmTfja+pjntwwf9B4+kqiCuIhWLZHCupPJHYDW6uh49qPBj5DOTMph35n4ePf15jpc
	UgWkDPMtsePyN4S152gov6Fi0sZ/fwMViZTGn9/OZUkZPidihNO0M3faZ3ymDZan0fLXUeJhId/Ki
	mA6hvoxpJ5AAboHr+q0S2eOEblHcZTsczNzL4uWfHPtFO/pzVaoaBAlqqr08qcPuGOVUKUMJe0Uoj
	3+HRRFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBFA-0000000EbZg-1T9k;
	Wed, 27 Aug 2025 08:10:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBB0-0000000Eag4-00KL;
	Wed, 27 Aug 2025 08:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yB/U1vduxZJMUc4C3XcbfsTNrbRms+v/21L2Hk9RIPQ=; b=S8rhYYTueLzv4C2TRH5h+9i3cb
	NvASLzvP7aD08bSgVuakPT5KbhZxHlqSrP+4S0aX4uyME4KrcaTIntzQnrlmXQOXw67BckNh9PMpS
	Dl+lDlq+bXkh+dGAufx6ST5efYmYav0KOTZl2tg329T3nAP+ZhHbDs3l+88eSvmjgKdEIKhorL1w1
	WFUzSfJq0mhejEQkKIPueuVTjm4LKswNEWdS2SOZUzvpgfOjB9dpyfXdQePHMi4yambWjuNETJJfX
	uLIvUjzgQ1DaZef6dQAK60hHcQjl4jdUx4KWS98ssapmCMrRu9OYHNN3MJEOEawilEDjo8A8B0a1b
	9Y8k+Ygw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBAw-00000002NsV-2R0Y;
	Wed, 27 Aug 2025 08:06:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FE122FC;
	Wed, 27 Aug 2025 01:06:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B8693F694;
	Wed, 27 Aug 2025 01:06:32 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:06:30 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 16/19] perf: Introduce positive capability for sampling
Message-ID: <20250827080630.GC745921@e132581.arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <ae81cb65b38555c628e395cce67ac6c7eaafdd23.1755096883.git.robin.murphy@arm.com>
 <20250826131124.GB745921@e132581.arm.com>
 <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <983df32a-ba74-421d-bc20-06e778b4d2c9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_090634_897544_46953B51 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, Aug 26, 2025 at 04:53:51PM +0100, Robin Murphy wrote:

[...]

> > Genearlly, AUX events generate interrupts based on AUX ring buffer
> > watermark but not the period. Seems to me, it is correct to set the
> > PERF_PMU_CAP_SAMPLING flag for them.
> 
> This cap is given to drivers which handle event->attr.sample_period and call
> perf_event_overflow() - or in a few rare cases, perf_output_sample()
> directly - to do something meaningful with it, since the intent is to convey
> "I properly handle events for which is_sampling_event() is true". My
> understanding is that aux events are something else entirely, but I'm happy
> to be corrected.

If the discussion is based only on this patch, my understanding is
that the PERF_PMU_CAP_SAMPLING flag replaces the
PERF_PMU_CAP_NO_INTERRUPT flag for checking whether a PMU event needs
to be re-enabled in perf_adjust_freq_unthr_context().

AUX events can trigger a large number of interrupts under certain
conditions (e.g., if we set a very small watermark). This is why I
conclude that we need to set the PERF_PMU_CAP_SAMPLING flag to ensure
that AUX events are re-enabled properly after throttling (see
perf_adjust_freq_unthr_events()).

> Otherwise, perhaps this suggests it deserves to be named a little more
> specifically for clarity, maybe PERF_CAP_SAMPLING_EVENTS?

Seems to me, the naming is not critical. If without setting the
PERF_PMU_CAP_SAMPLING flag, AUX events might lose chance to be
re-enabled after throttling.

Thanks,
Leo

