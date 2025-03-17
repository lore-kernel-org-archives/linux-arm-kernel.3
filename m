Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9C7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 21:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSZJLW97BnTzAu8NS31UcxSB955MIJF2br4GBQsYj5I=; b=zcREs4p5zKRBlWV66ZJfcwk4sN
	3YJm6QlbEEp1IAAyT+8HVBcPO18dwbUkyirVior3BofB0XfpJ776H5VANIqVrYskocbfFfMD8lqqn
	l6YMQyufB9nkW70czhNTbAjdqdYmR/XcIqkPPpI5bCjWD21QG/LxCpD9ii8C3doKhRruG7sxbEAHv
	QJhrjO9gbRIHcPt0FS4MFVlHqozT1eOduGZAsAA97N0csTE93yaorLIBCCd5si7JdnhqR7Pf/H5+/
	J/IgAENteiEfYcoURJqO9IfwlX+T9Su/s7WRKtLHo43la9gqI/qfInk+IFHMynphmpis/PY7VhRFv
	nJM4xjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuI0B-0000000427X-3G2S;
	Mon, 17 Mar 2025 21:28:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHyU-000000041uq-33Ph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 21:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 365AE5C564D;
	Mon, 17 Mar 2025 21:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153D3C4CEEF;
	Mon, 17 Mar 2025 21:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742246777;
	bh=e14NawIhXbX+rpgKdFPfVEzD7XfiMfMMeC3WCU8SXTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMvaMsnbPJ8uauQ8F3z8KXAnLMkpC+5wZSCYWXdVAbffN+VMLD7kcQ+QymC8RNkBG
	 LWAtAglEZTtV0IfmJevbJRpwp5DltHIZTT9jYUO30DpV3dltp36ITMp4mA2gAIoDbK
	 aFPTLhS220mZteiM69TPYxS0EXxAnngA315K/HuWjOSYtpK6tELUkhT8PsC3dX7qdW
	 Sp4LIUF2EYoOGSo/uvoGPvjB0BD1fcQ1sLlesKrGii7uNBoG6M/agH9NmaPL59/aZW
	 qPj7efURhvh7DzI7O0Cmp/JJA87UrXUQ+GNsxCUv6Quv4PsDyU9RthOs/WqwTpAP7v
	 VNE6rrqAz4uOw==
Date: Mon, 17 Mar 2025 21:26:12 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH 0/4] arm64: mitigate CVE-2024-7881 in the absence of
 firmware mitigation
Message-ID: <20250317212611.GA12724@willie-the-truck>
References: <20250128155428.210645-1-mark.rutland@arm.com>
 <174197730164.734861.6726211221092480832.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174197730164.734861.6726211221092480832.b4-ty@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_142618_851489_992D3118 
X-CRM114-Status: GOOD (  28.21  )
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

On Fri, Mar 14, 2025 at 06:37:25PM +0000, Catalin Marinas wrote:
> On Tue, 28 Jan 2025 15:54:24 +0000, Mark Rutland wrote:
> > On some CPUs from Arm Ltd, it is possible for unprivileged code to cause
> > a hardware prefetcher to form an address using the contents of a memory
> > location which is accessible by privileged accesses in the active
> > translation regime, potentially leaking the contents of this memory
> > location via a side channel. This has been assigned CVE-2024-7881:
> > 
> >   https://developer.arm.com/Arm%20Security%20Center/Arm%20CPU%20Vulnerability%20CVE-2024-7881
> > 
> > [...]
> 
> Applied to arm64 (for-next/leaky-prefetcher), thanks!
> 
> There hasn't been much review (thanks Oliver for looking at the KVM
> bits) and there's some implied work that can go on top of this series.
> But the patches looked fine to me, so I queued them. Mark or others,
> please shout if you'd like them dropped, they are on a branch.

I'm really not comfortable with this series and would prefer to see it
dropped while we continue the discussion, especially as it's causing
minor conflicts with the KVM/arm64 tree in -next.

The series is pitched a bit like an erratum workaround, but the overall
problem that a memory-dependent prefetcher can bypass permission checks
is fairly general and, even if nobody else gets this wrong, I doubt that
it's the last time Arm will mess it up. So, while the EL3 mitigation may
be Arm-specific, I don't think the rest of it really is. That's
especially true given the sorry state of spectre mitigations on
third-party derivatives of Arm designs, such as the Qualcomm Kryo parts,
and the fact that we provide userspace with a mechanism today for
querying the state of those mitigations via sysfs.

The immediate question, then, is whether this broken behaviour is
prohibited by CSV3. The text in the latest Arm ARM just refers to
"Data loaded under speculation", so it's not entirely clear whether that
applies to a prefetcher. If it *does*, then I can see the argument for
treating this like an erratum, but then we should zap CSV3 and treat
these parts as being affected by meltdown. On the other hand, if CSV3
is not intended to cover these prefetchers, then we probably need to
add a new "CVE-2024-7881" entry to /sys/devices/system/cpu/vulnerabilities.

As it stands with this patch series, userspace has no way to know about
the problem. kpti gets silently enabled in dmesg:

  | CPU features: detected: Kernel page table isolation (KPTI)

but the contents of the vulnerabilities directory is pretty misleading:

  gather_data_sampling: Not affected
  ghostwrite: Not affected
  itlb_multihit: Not affected
  l1tf: Not affected
  mds: Not affected
  meltdown: Not affected
  mmio_stale_data: Not affected
  reg_file_data_sampling: Not affected
  retbleed: Not affected
  spec_rstack_overflow: Not affected
  spec_store_bypass: Mitigation: Speculative Store Bypass disabled via prctl
  spectre_v1: Mitigation: __user pointer sanitization
  spectre_v2: Mitigation: CSV2, BHB
  srbds: Not affected
  tsx_async_abort: Not affected

The meltdown entry doesn't even mention that KPTI has been enabled.

If we decide to go with a new entry for this, then we also need to
change the default behaviour along the lines of Doug's Spectre-BHB
changes queued on for-next/spectre-bhb-assume-vulnerable so that we
assume vulnerable if we don't know better. To do otherwise will result
in false assurances to userspace on derivative and third-party
implementations.

To be clear: I'm not at all against mitigating this problem and
advertising the status of that mitigation. I *am* against quietly
handling it like a CPU erratum whilst simultaneously telling userspace
that meltdown is not a problem regardless of the mitigation state.

Will

