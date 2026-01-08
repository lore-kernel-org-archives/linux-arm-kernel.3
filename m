Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4640D1D47D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BY9If1RYwYCyGK49BrKflpoWzpk4Qn7Xd3bZKs9C/fk=; b=r5ne1jWUZEkDvRBwKw8syeOUJk
	sTYSnPSmJMoVK0MdG+WydL0BXHLD61fxozx6z5GgYKhIGvvXbrMQWQUri4f370VawZWDCGy6aC5h1
	F+8tx7eMPoZFSIapw0zkfVGyHBEYAMicy93gnXZdCBFkbog7swWX2Y/oJ3osjj+eY0FTHz15a6XEw
	3bOY2GCRdWge8PRR0gsMjzt64SMbHkj9Lo6jXPn7kAW7IDcYAhfqo0zSyFi53rgDedsrBmeNJfUiC
	I5a0h44VEQ+1DKFwqoB4YGvTOF14ZgV3BmA7dPx3O3vLyKebNNsJEIf/67OEf1rw6RPpwdA5TfDMP
	gPD7yLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsnv-000000007Ge-10Hj;
	Thu, 08 Jan 2026 16:24:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsnt-000000007Fs-0Thy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2333B6012B;
	Thu,  8 Jan 2026 16:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53863C16AAE;
	Thu,  8 Jan 2026 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767889443;
	bh=0OpJxL0ZfJjzU+rADilRhLH8eNcLAwN3xdBX/MHTSpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7LmxENwwRg0TYsfSeCh2f2XPjwy9+w07avTbSP11JtQAgc8rJBGFoHuC313e6zj3
	 VPcq7KMRIobeNKL+j0wi1toMggKJmlAVZJ9TwAB0iHKfxQRirvPOy5CEkVdKiBsT7q
	 2nHa6t/rC3TVIz16BPmayA+dgb15Pm+bDQ/+6JCgonC6G3HUMATbVuGClwZmRd39f9
	 nfG9SQ3gqMcMqeFEu5m9Lt+K5ApPo9GqHln6cHYBYbLhUsUpUckJIMf7hufjwOjJBi
	 ZSLxOXo5kXmMANq4JHh+11oRj3sMVePhO/gXklRob4jQ1cMlEB5twcAwtLftlf5RBG
	 Lls+c8IyBpCvQ==
Date: Thu, 8 Jan 2026 16:23:58 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] perf: arm_spe: Correct setting the
 PERF_HES_STOPPED flag
Message-ID: <aV_aHi9BLFzjnmx7@willie-the-truck>
References: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
 <20251110-arm_spe_fix_truncated_flag-v2-1-a629740985cc@arm.com>
 <aSSEXzMr1drvL2zz@willie-the-truck>
 <20251124184815.GC724103@e132581.arm.com>
 <aSSrrmX_nAl82GKE@willie-the-truck>
 <20251125142036.GE724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125142036.GE724103@e132581.arm.com>
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

On Tue, Nov 25, 2025 at 02:20:36PM +0000, Leo Yan wrote:
> On Mon, Nov 24, 2025 at 07:02:06PM +0000, Will Deacon wrote:
> 
> [...]
> 
> > > > If __arm_spe_pmu_next_off() fails, it will call perf_aux_output_end()
> > > > with the TRUNCATED flag set, which should then disable the event
> > > > via arm_spe_pmu_del() and update the state there.
> > > > 
> > > > Is that not happening?
> > > 
> > > Correct.  However, this patch is not for the flow you mentioned.
> > 
> > How is it not for this flow? You're talking about:
> > 
> > arm_spe_pmu_start
> > 	=> arm_spe_perf_aux_output_begin
> > 		=> arm_spe_pmu_next_off // Returns error
> > 
> > The only way arm_spe_pmu_next_off() returns an error is if
> > __arm_spe_pmu_next_off() fails, and that's the flow I'm talking about.
> 
> My bad.  Because you mentioned the TRUNCATED flag, I incorrectly assumed
> it had to be used in interrupt handler with the disable irq work.
> 
> > > If an error is returned from arm_spe_pmu_next_off(), because hw.state
> > > is not set to PERF_HES_STOPPED, the caller arm_spe_pmu_start() cannot
> > > detect error properly:
> > 
> > But why isn't PERF_HES_STOPPED set by the sequence I described?
> 
> Fair point.  I can confirm after settting the TRUNCATED flag,
> arm_spe_pmu_del() will be invoked to disable the trace unit and state
> will be updated to PERF_HES_STOPPED.
> 
> > I have a feeling you're right, but I can't piece it together from the
> > information here.
> 
> Let me explain in another way:
> 
> The issue is a mismatch between the state machine and the hardware
> state.  When arm_spe_perf_aux_output_begin() detects an error and does
> not set PMBLIMITR_EL1_E, the trace unit is effectively stopped, but
> the state machine is not updated to PERF_HES_STOPPED. This causes
> callers to handle errors incorrectly [1][2].
> 
> It is arguable that the disable IRQ work will eventually disable the
> trace unit and update hw.state, but the state should be updated in the
> first place by the PMU driver to notify even core layer.

From what I can tell, perf_aux_output_end() will call
perf_event_disable_inatomic() which should end up invoking
perf_pending_disable() via an IPI-to-self to disable the event and put
it in the PERF_HES_STOPPED state before we return to userspace.

So I still struggle to see the problem here.

Will

