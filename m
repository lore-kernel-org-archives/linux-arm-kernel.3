Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36755C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruehIbIKiqQhWMoPChu6I4YKwyIhcaA9SBDc092VbNk=; b=zlygZYIhvOfAWwTN5aVmH7YJ/q
	cluFGkrx2t7HDFE4UrfJjQByMr3u/kbWbnZwBjJBQotDFlDknalDIF4s8OsCPSqNfmYIIikPT+y6v
	DOQ1JcfMz8V2r2+zkiyFFR3hnLyUaeTSjywNI0I3Awob0WncC3o2056b5Bl/YhKTTczODS4+gb4Is
	FC7LeuFU23WJRVBFnJ2jAOpshyj5KdOSdMUJq3SSPrKIqf5LL847hMci3AipVOXeffFmyKH5dibK/
	U8QeUeVGb2S6FYRIRRIhcSHS/4BnUCLy/c7bWOOA3iZ+O3tcWNmqCft81vWnzFs8o6l1UIgqDmFyE
	6OmjXCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv0f-00000001DqP-02bA;
	Tue, 25 Aug 2026 17:32:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv0c-00000001Dpy-2UvO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:32:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 343261A9A;
	Tue, 25 Aug 2026 10:32:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1E5D3F85F;
	Tue, 25 Aug 2026 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787679143; bh=q1Lqfg3g5fiRXim4OSaoLhq/YwRQEguS7BM61Mgap40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+9DQjP+y9cNuiOismBM8Ue92KCRXT3qeaDf/+3wUgqo8h44U1PzjTArLEz9BGf+o
	 ywA5dEy+4uCI/J9ChI7KVR6TGxY0CSH9nOqcsCiaCCPfsmjUSEhgEmD1AAkUAvpvFg
	 oIbCl7UTxxbMCgE289Fuu2ciWV1dg6y3S2IDaE/I=
Date: Tue, 25 Aug 2026 18:32:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events
 from sharing a sink
Message-ID: <20260825173220.GG8904@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
 <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
 <20260819084515.GF8904@e132581.arm.com>
 <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7e11c2c-fd83-4ea5-8218-29a5af768578@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103226_799719_32BBE6E3 
X-CRM114-Status: GOOD (  28.43  )
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

On Thu, Aug 20, 2026 at 12:09:25PM +0100, James Clark wrote:

[...]

> > I am just wandering if we can improve the sink driver to only allocate
> > a single bounce buffer that is independent of any threads (and any
> > associated events).
> > 
> >                  | T1 |
> >    CPU0        ------------------------------
> >                     |   T2      |
> >    CPU1        ------------------------------
> >                                 `> T2 stops and can sync trace
> >                                    from the shared bounce buffer
> >                                    to AUX_BUF(T2).
> > 
> >    AUX_BUF(T1) |                            |
> >    AUX_BUF(T2) |                            |
> > 
> >    ETR_BUF     | Bounce buf                 |  -> Used by H/W trace
> > 
> > This might also simplify the CPU-wide case. Each CPU would still have
> > its own AUX buffer, but the ETR driver would maintain only one bounce
> > buffer for the shared sink. A reference count could track how many
> > events are using the sink, with the final event responsible for
> 
> Isn't this how it's already working? get_perf_etr_buf_cpu_wide() allocates a
> single shared buffer with a refcount. I didn't change this, I only changed
> the rules about what is considered shared or not so that it matches the
> semantics of the perf events that back the tracing session.

I think this is slightly different from my point.

The CPU-wide path already uses a shared buffer with a reference count
to support multiple events, while the per-thread path does not.

For the longe term, I would prefer to unify the sink buffer management.
Ideally, ETR/ETF/ETB should manage the sink buffer in the same way
regardless of whether the users come from CPU-wide or per-thread modes.
This would keep perf event semantics out of the low-level sink drivers
as much as possible. However, this would be a larger change and we could
defer in the future.

Now I treat the multiple events in per-thread mode as an implementation
limitation. For the immediate fix, we just reject this case instead.

> > We use a central place etm_event_build_path() to record and compare
> > event's owner and target process, then we don't need to spread the
> > check into sink drivers. We only care about if owner and target must
> > be consistent.

I experimented with moving the check to a common place during buffer
allocation: https://termbin.com/dib3r

It needs locking to keep the check in atomicity, but seems doable. We
don't need to spread event checks across the different sink drivers.

> But we don't know where the target will run when the event is created.
> That's why the check is delayed until etm_event_start() and the process has
> been scheduled. Where it runs needs to be taken into account to calculate if
> this sink can be shared.

Adding the check in etm_event_start() makes the result depend on task
scheduling.

I understand some cases you mentioned may benefit from this, but it also
makes the behaviour less deterministic. I would prefer to reject
unsupported cases explicitly when opening the events.

Thanks,
Leo

