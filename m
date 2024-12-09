Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehJkuMga426CGN2hUyJhWL85NBKi9F+9i7V05St6jF4=; b=n+A3QrAa0qVTgOf+8mx0b98s4x
	PWqubtWLf1BKWKW9coiwJPVxShkgRSS4i02ChmeStCJTaYOmx1yu2ORxC1Crk2shmWtPnlwaOcEXQ
	aix0TZjQmDwLeEEYfHskXVHxczzDwzS9oZMfIaQ2+zIiNrOQW9P3Tqejlu6nSWRz4+GIaNogg0bV5
	tJi6zXkzmSg5kHvYZkZ/iiria8BPVuEuJmr2BWIqLIB71DRLKoCPY68qLk2LSU/dWmC/IzBMVXXKj
	1EwXfsutkT11csUUN26YHvkT+H1b9aGFKyPDqs73vRAV9pfxOo8/7nBDFFQrpWuBo+XClYYcMIrDQ
	895Xofzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKg0z-00000008RLu-2qXu;
	Mon, 09 Dec 2024 15:49:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfzw-00000008RD0-3Fk2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:48:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65D46A40CA1;
	Mon,  9 Dec 2024 15:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBCBC4CED1;
	Mon,  9 Dec 2024 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733759315;
	bh=n94RWrYLM2f3wV2fEkioXHzMKrGMfSEIO328mG7Pu8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdZmPT0JlVKvRNrHjnH8eY03R64FM8g8psftS1dD1qCQx87NhLQ/alfgJF6z2pRyb
	 3gy/kQM1w2/SUHXu4MDmRXyZzfTPtQycgoYwBcPn+xhvWQhB5G/dFzf2S0MdDCH8ng
	 T4XZbnVooqUGITuWFk4cTx9KZwTn0WmZbKwj8hPlIPA2L5gCroNl1+pHV3j9XyPicR
	 g9c1fGk5vRN4+UQBzECDsazDUDrPAbUX5+ytqm5nlzqkUanTwZEKodSTZt1QyzozVJ
	 NDTM18wj2KAImyxfDBDxwd6Eelk8RDurC7+woVhzIGlAwaS1RuY9Iai2QUFj4d7wKL
	 vvHgKn/fsY2iQ==
Date: Mon, 9 Dec 2024 15:48:30 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: jonathan.cameron@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, yangyicong@hisilicon.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v4 08/10] drivers/perf: hisi: Export associated CPUs of
 each PMU through sysfs
Message-ID: <20241209154830.GC12428@willie-the-truck>
References: <20241203125049.39458-1-yangyicong@huawei.com>
 <20241203125049.39458-9-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203125049.39458-9-yangyicong@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_074836_881951_32860A63 
X-CRM114-Status: GOOD (  21.58  )
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

On Tue, Dec 03, 2024 at 08:50:47PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Although the event of the uncore PMU can only be opened on a single
> CPU, some PMU does have the affinity on a range of CPUs. For example
> the L3C PMU is associated to the CPUs sharing the L3T it monitors.
> Users may infer this affinity by the PMU name which may have SCCL ID
> and CCL ID encoded (for L3C etc), but it's not that straightforward.
> So export this information by adding an "associated_cpus" sysfs
> attribute then user can get this directly.
> 
> Reviewed-by: Jonathan Cameron <Joanthan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst |  5 ++++-
>  drivers/perf/hisilicon/hisi_uncore_pmu.c    | 10 ++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index 5cc248d18c63..48992a0b8e94 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -35,7 +35,10 @@ e.g. hisi_sccl1_hha0/rx_operations is RX_OPERATIONS event of HHA index #0 in
>  SCCL ID #1.
>  
>  The driver also provides a "cpumask" sysfs attribute, which shows the CPU core
> -ID used to count the uncore PMU event.
> +ID used to count the uncore PMU event. An "associated_cpus" sysfs attribute is
> +also provided to show the CPUs associated with this PMU. The "cpumask" indicates
> +the CPUs to open the events, usually as a hint for userspaces tools like perf.
> +It only contains one associated CPU from the "associated_cpus".

What is userspace expected to do with this information? Can you point me
to patches that add the corresponding support to the 'perf' tool, please?

Will

