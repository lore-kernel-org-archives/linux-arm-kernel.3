Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21946CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGf/WqSQ3/Zjx2h0MCS70VhsrXikjW8UIPjwUNHeoFw=; b=XKC5rIEze7dZvz7fgNoA8AXwbz
	juMeplf7Ewus9pyO3BYdFMx19UF5/O1E6+GorlSWQS1tuoyk/HFGBI678EEAm+womlyar/LTl44Vv
	CZsSKrigiafPRRpV3XxJac7/yPbuRZC7fxw92hp0GOyVvMexF+Ki76JTMcQA/HN5zj0po3pYQvdPc
	i7qk6olJ8pextzrfFl5EIyXvZ8I6f79wulnJFncCVE+yTLqFd8oSKD845vj/ajmmyozUMfBf7F5gB
	KMOl0nRJoTsQTjbTKLvlD0Tav5AcIIIU/8/ystLu+MK2QsN4r9WmoQguH01rJk+TK+yRVajRYKRE3
	6eemwQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGPv-00000005yKb-25Va;
	Fri, 08 May 2026 08:18:39 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGPt-00000005yK5-2MWZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nGf/WqSQ3/Zjx2h0MCS70VhsrXikjW8UIPjwUNHeoFw=; b=jEm56S9yeQiHcVoKJlqQlGqbNH
	QMg+C9fTPmKTGc60w68AuWcGGnIvHaXD+S6rbs0KJNAPgiYeQTg8D8YFFPeauj42qXOplA5IPNqMr
	giFeg8MVqLTqb3C6R9Njwa1ZWXu2VDcT3KOESpjaCVfc3X46MuNLX0b7xwH7TNmQrD4qDaMMzBPTw
	QEc09p0xnnlNraynrDcr3vwtaTTl/lrniRufb++QDuDkKKVPxotef/p5XihQwI5swP5PyKA910148
	0t83H0vwyO64B3KSt9HHAW7DNUSLgWfU4vNSqQCBUi7OVjUL4koNzTpnb9uX3lRx6mgFD6NmR1dSY
	Io1Fkrxw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wLGPL-0050jK-1G;
	Fri, 08 May 2026 08:18:03 +0000
Date: Fri, 8 May 2026 01:17:57 -0700
From: Breno Leitao <leitao@debian.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Sumit Gupta <sumitg@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dcostantino@meta.com, pjaroszynski@nvidia.com, Al.Grant@arm.com, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH] cpufreq: cppc: discard out-of-range delivered_perf
 samples
Message-ID: <af2cEiouQbdpoavG@gmail.com>
References: <20260501-cur_freq-fix-v1-1-f84c9a423366@debian.org>
 <26deca86-44e3-4fd5-950e-59f913d9ee37@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26deca86-44e3-4fd5-950e-59f913d9ee37@hisilicon.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_011837_611621_A68242D7 
X-CRM114-Status: GOOD (  13.27  )
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

Hello Jie,

On Fri, May 08, 2026 at 11:23:18AM +0800, Jie Zhan wrote:
> On 5/2/2026 12:32 AM, Breno Leitao wrote:
> > cppc_cpufreq_get_rate() derives delivered_perf as:
> > 
> >     delivered_perf = reference_perf * delta_delivered / delta_reference
> > 
> > over a short udelay()-bounded window between two cppc_get_perf_ctrs()
> > calls. Per-read latency jitter on the underlying CPC register access
> > can skew the ratio, occasionally producing delivered_perf >
> > highest_perf. cppc_perf_to_khz() then linearly extrapolates above
> > (nominal_perf, nominal_freq), so the value reported via
> > /sys/.../cpufreq/cpuinfo_cur_freq exceeds cpuinfo_max_freq.
> > 
> > Observed on an arm64 host (governor=performance,
> > cpuinfo_max_freq=3339 MHz): 15 back-to-back reads returned values
> > between 2997 and 4230 MHz.
> Hi Breno,
> 
> Frequency sampling discrepancy through 'cpuinfo_cur_freq' in the
> cppc_cpufreq driver has been an issue discussed for a very long time.

Thanks for the heads-up.

> If the CPPC feedback counters are FFH on your platform, can you have a look
> at [1] and see if that helps?

Have you forgot to get the [1] link here?

Thanks for looking at this,
--breno

