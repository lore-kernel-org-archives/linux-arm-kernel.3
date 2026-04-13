Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659FEBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/SMBC9yRYGf0XbER6Ur66ZFjK0zOU/D87oQBKDvXAY=; b=zYZFZDqdXnSAtrjUpShblNbwlq
	PmCvqO532+RH3LuHiwLnZ5J68w033ycBl9kr91p8J41YNXqFkq79y9FEOCWdbd5Ujjq8cSWtbNP29
	5KtoyxfUIvLZGbpCxDBcumwBt0bIIYXqSguaw3NzPgkx9BPgI4VCh/m+/mXggOqmD9K6/uaohXQts
	OLn4/4eeEf8okA+Jn/jGTWJaciisIUWcm3alHthO0tMv5flwZHd+TX6IACkqFGMmgrsr7T263Orpx
	jMtMbHEM4BPCRkkRzEB9eIEVdEkGH6jg4pZMTIS554JaextgUDSj7liZ9aA/bGLROixUDtf/INWOA
	ZtQeHS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCyJ-0000000FISu-39I9;
	Mon, 13 Apr 2026 08:48:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCyE-0000000FIRA-2Kt7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:48:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79B4435A8;
	Mon, 13 Apr 2026 01:48:30 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A23423F641;
	Mon, 13 Apr 2026 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776070116; bh=NQmFn1PimPCAqFY30vqDVw2kc/djlMNBDIQMV74NYVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsrH1zWN9mihvHzu1/m+H2nuWo8kI5kPDCIXP5qEip9aF3Ek/r0Yaqm8MVbd/cTCs
	 6dVKYgsWn9s3W4Xrarq+jhSiMWJ6pGuLBWDyse2KGBXDtx0u8Jn7BOwD2pR0w2GKBY
	 HAbauDoUwllDA2LZd1t/zbN9EuF7/yvAr59xQTQE=
Date: Mon, 13 Apr 2026 09:48:33 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 16/20] coresight: Add PM callbacks for sink device
Message-ID: <20260413084833.GA356832@e132581.arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-16-13e94754a8be@arm.com>
 <227b77b9-5232-4cff-b26a-458477e9eb32@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227b77b9-5232-4cff-b26a-458477e9eb32@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_014838_752981_BA32F7E0 
X-CRM114-Status: GOOD (  20.59  )
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

On Mon, Apr 13, 2026 at 01:45:50PM +0800, Jie Gan wrote:

[...]

> > @@ -1787,15 +1808,32 @@ static int coresight_pm_save(struct coresight_path *path)
> >   	to = list_prev_entry(coresight_path_last_node(path), link);
> >   	coresight_disable_path_from_to(path, from, to);
> > +	ret = coresight_pm_device_save(coresight_get_sink(path));
> > +	if (ret)
> > +		goto sink_failed;
> > +
> >   	return 0;
> > +
> > +sink_failed:
> > +	if (!coresight_enable_path_from_to(path, coresight_get_mode(source),
> > +					   from, to))
> > +		coresight_pm_device_restore(source);
> 
> I have go through the history messages. I have a question about this point
> here:
> 
> how can we handle the scenario if coresight_enable_path_from_to failed? It
> means we are never calling coresight_pm_device_restore for the ETM and
> leaving the ETM with OS lock state until CPU reset?

From a design perspective, if any failure occurs in the idle flow, the
priority is to avoid further mess, especially partial enable/disable
sequences that could lead to lockups.

The case you mentioned is a typical risk - if a path after source to
sink fails to be enabled, it is unsafe to arbitrarily enable the source
further.  We rely on the per-CPU flag "percpu_pm_failed" to disable idle
states, if ETE/TRBE fails to be disabled, if CPU is turned off, this
also might cause lockup.

> Consider we are calling etm4_disable_hw with OS lock:
> etm4_disable_hw -> etm4_disable_trace_unit -> etm4x_wait_status (may timeout
> here?)

This is expected.  I don't want to introduce a _recovery_ mechanism for
CPU PM failures, which is complex and over-engineering.  CPU PM notifier
is low level code, and in my experience, PM issues can be easily
observed once CPU idle is enabled and should be resolved during the
development phase.

In many cases PM issues are often not caused by CoreSight drivers but by
other modules (e.g., clock or regulator drivers).  The log "Failed in
coresight PM save ..." reminds developers the bugs.  As said,
percpu_pm_failed is used as a last resort to prevent the platform from
locking up if there is a PM bug.

Thanks,
Leo

