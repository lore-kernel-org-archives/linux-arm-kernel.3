Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEE6D0E6EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 14:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9o1wwpIYi9tHEAO5QAe0o4ZxwGUVqA2UnODsjGefpw=; b=33s/JZBoJHx5tHxY3nt5wXLa/I
	hOPtn0doLrH/MOPmO+8akx9oj7t/PjTxLsmtZtldR6dKUlJ4xK8Z0IE3DUeq6bjPWikeBa3PPlDyU
	1ybeVb7vAi0mujbEmXS/ZZTp7OL20kExZyrShMlpwXVVonYEN/55fFN+1iLSdmcuQGxsVwLFmacNA
	SKbctOdKxN2KtQmv3C0L9m/GMl4Uyr2z5RF38vvXV+tbfPRp758loiAIhxkFSXJmeyL41AjbbOPSa
	SFEVq12bBlCbE5yLQEhOjvDCvWT/PA6PvpesIUcpiuencwIVkakM9ueyE4KF3KSNxXVj/aP5nLYm5
	oFsRJt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtuN-0000000DQAa-2TxT;
	Tue, 25 Nov 2025 14:20:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtuK-0000000DQA6-2ne2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 14:20:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 368AF168F;
	Tue, 25 Nov 2025 06:20:31 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B743F86F;
	Tue, 25 Nov 2025 06:20:38 -0800 (PST)
Date: Tue, 25 Nov 2025 14:20:36 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <20251125142036.GE724103@e132581.arm.com>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
 <aSSrrmX_nAl82GKE@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSSrrmX_nAl82GKE@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_062040_743225_3C580198 
X-CRM114-Status: GOOD (  23.87  )
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

On Mon, Nov 24, 2025 at 07:02:06PM +0000, Will Deacon wrote:

[...]

> > > If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
> > > with the TRUNCATED flag set, which should then disable the event
> > > via arm_spe_pmu_del() and update the state there.
> > > 
> > > Is that not happening?
> > 
> > Correct.  However, this patch is not for the flow you mentioned.
> 
> How is it not for this flow? You're talking about:
> 
> arm_spe_pmu_start
> 	=> arm_spe_perf_aux_output_begin
> 		=> arm_spe_pmu_next_off // Returns error
> 
> The only way arm_spe_pmu_next_off() returns an error is if
> __arm_spe_pmu_next_off() fails, and that's the flow I'm talking about.

My bad.  Because you mentioned the TRUNCATED flag, I incorrectly assumed
it had to be used in interrupt handler with the disable irq work.

> > If an error is returned from arm_spe_pmu_next_off(), because hw.state
> > is not set to PERF_HES_STOPPED, the caller arm_spe_pmu_start() cannot
> > detect error properly:
> 
> But why isn't PERF_HES_STOPPED set by the sequence I described?

Fair point.  I can confirm after settting the TRUNCATED flag,
arm_spe_pmu_del() will be invoked to disable the trace unit and state
will be updated to PERF_HES_STOPPED.

> I have a feeling you're right, but I can't piece it together from the
> information here.

Let me explain in another way:

The issue is a mismatch between the state machine and the hardware
state.  When arm_spe_perf_aux_output_begin() detects an error and does
not set PMBLIMITR_EL1_E, the trace unit is effectively stopped, but
the state machine is not updated to PERF_HES_STOPPED. This causes
callers to handle errors incorrectly [1][2].

It is arguable that the disable IRQ work will eventually disable the
trace unit and update hw.state, but the state should be updated in the
first place by the PMU driver to notify even core layer.

Thanks,
Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/perf/arm_spe_pmu.c?//h=v6.18-rc7#n855
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/events/core.c#n2742

