Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441FFD35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9v5lvOeAbnU5WRkV8e9FAHwjqaCgL1App5Bln83ChE=; b=I+H1vZp49LT4GgRJxYHdfubf7Z
	CYIWLGrlvpjbLaB7ntDUOYrIFujqDTgB+QwdOeg0Z0VLhkuKA1Kg0sd8QS5ZVDqKm2HDefdTL1qfJ
	VaTgdLNN4iiETZHNz6/7zskCOV7HPf3G3aaC9O2/vU1M1HBlrCnBnZybdmGIlF+jHEzEGbbbO/9Jw
	kszXJDInPkJrIJk0pc1R3tYUY2XxVSCMbTFd3JlzrrSugmYOpgLWtaRu+egjS6P92LT0hnd6UD+9v
	3186Oc12Js7oxVW7jugFELIrKrEonzgy2B02bzSZJpY9ifNlEcqqzT3kzqx25et0reWr96Z0PTRur
	8d3fHzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1nb-0000000FkSP-2Ay5;
	Wed, 28 Jan 2026 09:25:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1nZ-0000000FkSG-2gXR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67526600AA;
	Wed, 28 Jan 2026 09:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D00C4CEF1;
	Wed, 28 Jan 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769592316;
	bh=NOYUzAYOaQDLTtBB91+2pLZKvr04FAxNg/6BUtcW8aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpTbuYAL5IAPWPvdsK/lVylxFhuznKwArTPCxaxNlbm6TeghX4LEUY2EY8Tr40fgZ
	 s3y/+08DEkG7+VltextLP64GqASv9orzxSqgu79+Z89MUwcr/Gy+5l24Jq0ESZIYjd
	 Yyw7X64kgIoHd1wO/v92yKqV4W94UQoAmNRg+TTgbhI1fRcbL4d3qIY4nOV/5M4Z+K
	 MBOq3DFvjVyFiXUv7mJiiFwHqfEXT2gG3FZd6IjFzw7UplYzVFUFI23dPOMyd+iDsZ
	 iKMJdsYztI8EgAZktEpm7J0pedv99v9o3HMQ03me2UT1XLcGXXGJt2rixME8r5PCRA
	 H7sxJy+jTPjPA==
Date: Wed, 28 Jan 2026 11:25:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ardb@kernel.org, leitao@debian.org, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, mingo@kernel.org, pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com,
	arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com,
	bhelgaas@google.com, bhe@redhat.com, dave.hansen@linux.intel.com,
	cfsworks@gmail.com, osandov@fb.com, sourabhjain@linux.ibm.com,
	jbohac@suse.cz, ryan.roberts@arm.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aXnV8HBOzTTWBbsI@kernel.org>
References: <20260126081334.699147-1-ruanjinjie@huawei.com>
 <aXnJd_Xghj9JLsnK@kernel.org>
 <3407c779-9e7e-8f90-353f-c2b58992aae2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3407c779-9e7e-8f90-353f-c2b58992aae2@huawei.com>
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

On Wed, Jan 28, 2026 at 05:10:15PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2026/1/28 16:31, Mike Rapoport wrote:
> > On Mon, Jan 26, 2026 at 04:13:34PM +0800, Jinjie Ruan wrote:
> >> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> >> crashkernel= command line option") and commit ab475510e042 ("kdump:
> >> implement reserve_crashkernel_cma") added CMA support for kdump
> >> crashkernel reservation.
> >>
> >> Crash kernel memory reservation wastes production resources if too
> >> large, risks kdump failure if too small, and faces allocation difficulties
> >> on fragmented systems due to contiguous block constraints. The new
> >> CMA-based crashkernel reservation scheme splits the "large fixed
> >> reservation" into a "small fixed region + large CMA dynamic region": the
> >> CMA memory is available to userspace during normal operation to avoid
> >> waste, and is reclaimed for kdump upon crash—saving memory while
> >> improving reliability.
> >>
> >> So extend crashkernel CMA reservation support to arm64. The following
> >> changes are made to enable CMA reservation:
> >>
> >> - Parse and obtain the CMA reservation size along with other crashkernel
> >>   parameters.
> >> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> >> - Include the CMA-reserved ranges for kdump kernel to use.
> >> - Exclude the CMA-reserved ranges from the crash kernel memory to
> >>   prevent them from being exported through /proc/vmcore.
> >>
> >> Update kernel-parameters.txt to document CMA support for crashkernel on
> >> arm64 architecture.
> > 
> > I'm looking at this and at almost identical patch for riscv 
> > https://lore.kernel.org/all/20260126080738.696723-1-ruanjinjie@huawei.com
> > and it feels wrong that we have duplicate the code that excludes cma
> > ranges.
> > CMA ranges are known to the crash_core and I don't see why we cannot
> > exclude them there.
> 
> Youa are right, x86 and powerpc has similar implementations that
> excludes crashkernel cma ranges.
> 
> x86 [1]
> 
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;
> +	}

So if this loop was in crash_prepare_elf64_headers() it would work for
arm64, riscv and x86, right?

> +
> +	return 0;
> 
> But powerpc [2] is a little different which uses a wrapper for
> crash_exclude_mem_range() and more check and realloc_mem_ranges().
> 
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range_guarded(mem_ranges,
> crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}

As for powerpc crash_exclude_mem_range_guarded() could only check if
mem_ranges is large enough and reallocate and then actual exclusion in
crash_prepare_elf64_headers() should also work.

> [1]: https://lore.kernel.org/all/ZWEAWMJtesa3O9M5@dwarf.suse.cz/
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4a96ab50f368afc2360ff539a20254ca2c9a889

-- 
Sincerely yours,
Mike.

