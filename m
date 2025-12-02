Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BBCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlEnA6yr6XAexgheDSPP0SgGR4c9sRywkiK2h74ttRM=; b=QC9WEj7cRcWOWECAN85QcYJvRa
	cHlHw1Wf5W5H1ml8GAj4ddY9feu0ECYPsuGE44CHVXH4B5e6rYJbCKmrXOYhUjXCpNcP/IPyXLqHg
	OU+z/GKAPHFowjRbSLPpXfdOBcY7HYxtn8sQBdui8AbM6qudbPfl1VeMrpz1CgBIzc7Bk7sERW8ZO
	6x7ngIogYpbRGyDVsNb6J4THGpJufir3hWG7Bcys/QyL44jNvoMvo9wh0owp2OIQidPB9uxKewbW0
	j/xpvuFHtmH2BuVZRPuOu0VxdrTZybfGMsl0eM41j+H/O+CmpqW6dZSRNCAFlnrygQrRNXULrTAOj
	BiewXhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRGV-00000005Uqs-0bnp;
	Tue, 02 Dec 2025 14:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRGR-00000005UqX-2Uw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36C081477;
	Tue,  2 Dec 2025 06:21:50 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0A23F73B;
	Tue,  2 Dec 2025 06:21:57 -0800 (PST)
Date: Tue, 2 Dec 2025 14:21:55 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 07/19] coresight: trbe: Refactor AUX flag setting
Message-ID: <20251202142155.GB724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-7-7da32b076b28@arm.com>
 <e315b489-2ebf-4ab6-8a60-347f1b1dca16@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e315b489-2ebf-4ab6-8a60-347f1b1dca16@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_062159_673877_A76F6B2F 
X-CRM114-Status: GOOD (  26.66  )
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

On Tue, Dec 02, 2025 at 11:15:47AM +0000, Suzuki K Poulose wrote:

[...]

> > @@ -687,6 +668,23 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
> >   		goto out_fatal;
> >   	}
> > +	/*
> > +	 * Mark the buffer to indicate that there was a WRAP event by
> > +	 * setting the COLLISION flag. This indicates to the user that
> > +	 * the TRBE trace collection was stopped without stopping the
> > +	 * ETE and thus there might be some amount of trace that was
> > +	 * lost between the time the WRAP was detected and the IRQ
> > +	 * was consumed by the CPU.
> > +	 *
> > +	 * Setting the TRUNCATED flag would move the event to STOPPED
> > +	 * state unnecessarily, even when there is space left in the
> > +	 * ring buffer. Using the COLLISION flag doesn't have this side
> > +	 * effect. We only set TRUNCATED flag when there is no space
> > +	 * left in the ring buffer.
> > +	 */
> > +	if (!is_trbe_running(trbsr))
> 
> Is this really required ? There is a WARN_ON(is_trbe_running(trbsr))
> above ?

The WARN_ON() will reports warning for running case, here it sets
COLLISION flag for not running case, which is not conflict.

This works for the Fill mode (stop collection), we always set the
COLLISION flag for it.  Once we enable trigger and wrap modes, due to
the trace continues to run, we don't set the flag for these modes.

> > +		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> 
> Also, setting this would unnecessarily mark COLLISION while stopping the
> TRBE buffer normally (when called from arm_trbe_update_buffer), when
> there is no WRAP event ?

Good point.  I should refactor arm_trbe_update_buffer(), it firstly
reads out TRBSR, stop trace afterwards, and then call
trbe_get_fault_act().

In this case, it is in running mode so COLLISION will not be set for
normal disable flow.

I will add a new patch for this and place it before this one.

> > +
> >   	if (is_trbe_wrap(trbsr))
> >   		return TRBE_FAULT_ACT_WRAP;
> 
> Couldn't this be :
> 
> 	/* Move the big fat comment here */
> 	if (is_trbe_wrap(trbsr)) {
> 		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> 		return TRBE_FAULT_ACT_WRAP;
> 	}

It deliberately de-couples the COLLISION flag from the WRAP event.

In later change, a WRAP event only means buffer wrap around, it does
mean the trace has been stopped.  The AUX flag is only set for
stopping case.

Thanks,
Leo

