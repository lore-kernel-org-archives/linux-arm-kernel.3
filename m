Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC0C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuHg56hUzMWaFGcTZ4/izWmdvExwIURK3oiNVnL48J0=; b=aaR2G0P/1a5le58L5xBw2xtwfF
	Dg2PzwLwRwUP4zu8R4NSUcceMzlwk6JQcxAPza1x2KWZQIpV15wJmz8jlWSg22SJYfyLjToYsnArv
	2wpNT9WRVEn5D5z5xfXmYwpoN/4nBDHcpCQcn3PQFtRIh9tW6ZovSGEVvshEnwrN69ENjlySYmI8S
	CXAk+nYS+4ST3YAqv42q++5FVLti/bgLpg+mXtXvNL06DOMl2QrFZhHMuTFD4xPGzqI7hROI1VdcZ
	tAKz5zirw/igE8ADfH6rzBHXg0mNG/650vXFqOvSzV1T9C0AfPI/S2IkuZIlLPj7gXiJO19t9g6XF
	YrmJWttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBI9-0000000F9lj-0nnI;
	Fri, 27 Jun 2025 15:47:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAy7-0000000F5wd-0OTs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38FE8A52FA3;
	Fri, 27 Jun 2025 15:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399C3C4CEE3;
	Fri, 27 Jun 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751037981;
	bh=RatpN4hC+NcY4yGtEkZqmtlwklWVrfLKA5pwlAyXJzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jzu6/tZgXHT4sNclSF+VDE+bZtMYOHNd09Ybww2nqb3GqLIRrgdQaDVF8+tw6+2a+
	 LTS0e2Z5v893zDrBuHj/sbwNgjWVEBU45l4hOsUnHh+Fa9LN7wWJFD6DSCXfVUq3IC
	 pHlFq9YJAiAj9+qpJqJK+YHXNey+2dDvXtYf2kA5v74zsaZJn+ifRTAKVH1HGQHegR
	 rainIlqccfE8qJm5/Ok9bS31TaIQNDJXqZrIqSy2WDxjOmgu+H4B2qF2uPSGmpCWih
	 AU7JEkoXrdX8l2eXbKS7SjQndXltjO3C0EKhWETszx0NBkwuwihcWzx1JoMzoo7vXT
	 nVI8bR30DXjTQ==
Date: Fri, 27 Jun 2025 16:26:15 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
	dianders@chromium.org, sumit.garg@linaro.org, kernelfans@gmail.com,
	lecopzer.chen@mediatek.com, tglx@linutronix.de, song@kernel.org,
	linux-arm-kernel@lists.infradead.org, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, prime.zeng@hisilicon.com,
	yangyicong@hisilicon.com, linuxarm@huawei.com
Subject: Re: [PATCH v2 0/2] Update the watchdog period according to real CPU
 frequency
Message-ID: <aF64F2cW3aratui5@willie-the-truck>
References: <20250512130919.23915-1-yangyicong@huawei.com>
 <20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512160612.c10464075df3c7842b13da11@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082623_195274_9369F7EA 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, May 12, 2025 at 04:06:12PM -0700, Andrew Morton wrote:
> On Mon, 12 May 2025 21:09:17 +0800 Yicong Yang <yangyicong@huawei.com> wrote:
> 
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > watchdog perf needs architecture to provide method for converting the watchdog
> > thresh to counter period. For arm64 we're using the max CPU frequency for
> > doing the conversion which is from cpufreq driver. But some cpufreq driver
> > are registered lately, for example cppc_cpufreq will be registered at late
> > initcall which is after the initialization of watchdog perf (initialized in
> > armv8_pmuv3 of device initcall). In such case the period of watchdog will not
> > be accurate enough. Fix this by registering a cpufreq notifier and update the
> > watchdog period once the cpufreq driver is initialized.
> > 
> 
> Thanks.  Thoughts.
> 
> 1: What is the impact of this change?  Is the current code causing
>    problems?  If so, what are they?  How is the end-user experience
>    improved by this change?  Important info!
> 
> 2: As far as I can tell, this patchset impacts arm64 only.  Do you
>    think that other architectures should implement this?
> 
> 3: As far as I can tell, this patchset affects all cpufreq drivers
>    which use late_initcall() (on arm64, of course).  Is this correct?
> 
> 4: It is asserted that we should use the *maximum* possible CPU
>    frequency for this calculation.  Why?  I assume this is because we
>    care about the minimum watchdog period?
> 
> Can I assume that the ARM maintainers will be handling this?

Argh, this has all ended up in my spam for some reason...

Lemme go fish the patches back out. Andrew -- we can take these via
arm64 if you like (although I have some comments on the code first).

Will

