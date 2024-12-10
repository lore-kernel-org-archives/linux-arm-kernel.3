Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpW7m5uuICtFPgspxDlv3wWrFtnVJieor8nqxD00z6A=; b=KpDkHt05HfvlFiLJmxc/WLnT4+
	jnX68bJXUuvOaO2Crjz2VZpkRNkAVQOxdI2Ad3OA+wXSP7e8YQbGjDmy5Oke/Jyivfg53MA7n18Hq
	4HhaWK+UOV2t50l3v34tD5HEoG9l1dsRKm/LHWnnvLmDBpTQKJrr7Gz2Q/TUc8tTWIThhmYsw6A8s
	ETWsoKjGSeCD5LpPci6DtLTtlEI1uIuIVF21HQoauVyvK0cFVh9xugWRb1MCaXdQLfXRGy3jDZayS
	3UngWEWRzwuyXMQ4BILsYIz3QY3ZJxTJ+HpvD1ABWTV4UkybUrvm13CxXVF35EsH8Ic9rSSDr1cfO
	xLH1b58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKybt-0000000BLCq-1q3M;
	Tue, 10 Dec 2024 11:41:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyaq-0000000BL75-1nM2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D098A412FF;
	Tue, 10 Dec 2024 11:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1436C4CED6;
	Tue, 10 Dec 2024 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733830795;
	bh=5dBiAPqZNKfTXC1kDarzjcPYvBYZxN9i53zu014mgCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGH0IhuWGevmvsRAlJmmRZdaUzAideSV4DdnhT02eCimPu1AD/etEsVMGhZbfPnpx
	 ChF+daCu8iEUNb+wEuiixnwCeAjugqISPJPr9uWNYX4ajEuMGWBgfWpSBjf4ArT21h
	 ed8cp6o8gmUG3cIoDoZxtl2vbC/77jeIEVGbW/+xViTIpxJVd4g0E5bnBfAseQc+Gu
	 GwTBQYM7085MiqjmoMTDyeeCPuW9cUbsZg4TUVvMkzeRM6VSYeevXJ4iI98HBjrQXS
	 CWse3CqU16vKw5HUmVMTNTE7RlxL8DjmRh7uVCEgmUiovi3uPUGUBYD2aNFkAkCO6M
	 RtC9QAyZRnDUw==
Date: Tue, 10 Dec 2024 11:39:50 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, jonathan.cameron@huawei.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v4 08/10] drivers/perf: hisi: Export associated CPUs of
 each PMU through sysfs
Message-ID: <20241210113949.GE14735@willie-the-truck>
References: <20241203125049.39458-1-yangyicong@huawei.com>
 <20241203125049.39458-9-yangyicong@huawei.com>
 <20241209154830.GC12428@willie-the-truck>
 <22a35ead-0f0b-39a8-16bd-333143081ea8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a35ead-0f0b-39a8-16bd-333143081ea8@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_033956_590640_175A8566 
X-CRM114-Status: GOOD (  34.65  )
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

On Tue, Dec 10, 2024 at 06:49:15PM +0800, Yicong Yang wrote:
> On 2024/12/9 23:48, Will Deacon wrote:
> > On Tue, Dec 03, 2024 at 08:50:47PM +0800, Yicong Yang wrote:
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >>
> >> Although the event of the uncore PMU can only be opened on a single
> >> CPU, some PMU does have the affinity on a range of CPUs. For example
> >> the L3C PMU is associated to the CPUs sharing the L3T it monitors.
> >> Users may infer this affinity by the PMU name which may have SCCL ID
> >> and CCL ID encoded (for L3C etc), but it's not that straightforward.
> >> So export this information by adding an "associated_cpus" sysfs
> >> attribute then user can get this directly.
> >>
> >> Reviewed-by: Jonathan Cameron <Joanthan.Cameron@huawei.com>
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >>  Documentation/admin-guide/perf/hisi-pmu.rst |  5 ++++-
> >>  drivers/perf/hisilicon/hisi_uncore_pmu.c    | 10 ++++++++++
> >>  2 files changed, 14 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> >> index 5cc248d18c63..48992a0b8e94 100644
> >> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> >> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> >> @@ -35,7 +35,10 @@ e.g. hisi_sccl1_hha0/rx_operations is RX_OPERATIONS event of HHA index #0 in
> >>  SCCL ID #1.
> >>  
> >>  The driver also provides a "cpumask" sysfs attribute, which shows the CPU core
> >> -ID used to count the uncore PMU event.
> >> +ID used to count the uncore PMU event. An "associated_cpus" sysfs attribute is
> >> +also provided to show the CPUs associated with this PMU. The "cpumask" indicates
> >> +the CPUs to open the events, usually as a hint for userspaces tools like perf.
> >> +It only contains one associated CPU from the "associated_cpus".
> > 
> > What is userspace expected to do with this information? Can you point me
> > to patches that add the corresponding support to the 'perf' tool, please?
> > 
> 
> two attributes here, "cpumask" and "associated_cpus". For "cpumask" it's used in
> perf [1], this patch does no change to this attribute but only update the
> description in the doc.
> 
> I think you're questioning about the "associated_cpus" introduced by this patch,
> which is not intended to be used by the perf tools but provides a hint for the
> user to know the CPUs monitored by which uncore PMU, for example which uncore
> L3C PMU's monitoring the events by the CPU(s) the application's running on, or
> if the counts is imbalanced among the L3C PMUs user can figure out what's running
> on the CPUs provided by the "associated_cpus". As described in the commit this
> can also inferred by the PMU name to map SICL ID and CCL ID to certain CPU cluster,
> but these ID's aren't readable enough and it'll be more straightforward and
> friendly to provide an "associated_cpus" information, considering we've already
> maintain it in the drvier.

Bah. I just noticed that there's precedent for this in the Arm CSPMU driver,
so I don't really have a leg to stand on despite my objections to funneling
firmware information through to userspace without a confirmed user.

Will

