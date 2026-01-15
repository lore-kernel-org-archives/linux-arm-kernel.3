Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D90D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeUmCRW+Mclyi1WYRL9bNCzrvtiPLzMJk5midvN9YUk=; b=jDjpm7WDMzOiqcKgrHkr4JYvuv
	KdYludcvUZlffcm4/pBibqOIpoe8mP9V2S2awQLGra/dnl3GEEGTa5tl6A00wEcDMujaIxXRukYkL
	OKJtB34ORtp3r8OULlNivoH+72lJn0v9J3XE0BzoR00rmQwvxC76dK6vklz+reozAXtXWVfr+n8w5
	FRxStE4yeX/z0T8l74/apSFf8FuOldBZNiAmNFMlrIhMKban87XYJgLGYL7T1NA25E4SSdFgDOABC
	g+9RkBTx7tKTSyGO1rI/44YSESFH8RmTQQnihgRsi3gq0xsd1c56RIkFlJX8cJ/fFj264IT1Ao1q+
	zDaX+AQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN0D-0000000CNYk-1hf4;
	Thu, 15 Jan 2026 13:03:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgN0A-0000000CNYH-3cM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86FEC4018A;
	Thu, 15 Jan 2026 13:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63564C116D0;
	Thu, 15 Jan 2026 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768482181;
	bh=1gDjKnngSQPKg3Vknl3yXRygZb7k/1wDPmUo8MM+pc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMG03Zuo6Csrn6WHfCHjDfqu1QbA8uAASYMKnXqefFqhoOux1p1rY/Bwqbw/hy4De
	 bFSSVdOGRrHgXAccrBwi+7qgrFZK3oqciJJa4Uj9MUJXFp4w+glQNmNY2dQ8RgkuhR
	 W9XKUFkXsbs7TrN6K7Qd5J7y7xu5ls6lKJhot/zqZZfA9ce+XmsUHF+MEx9fPq/7PJ
	 Qz+ztj4Z/wba1kgw/z69ZjK534VDYhrcs3m/ZYfZGq5RGFynVoMIWZdrAK1ceHmXSG
	 1/PTmhGrATF9c7+kHeA+pEWO5a7+fGhRjvvWo1OfFy1C8slWsPpCOMGyLqxZ3VwTXr
	 2/NGACdF6j6CA==
Date: Thu, 15 Jan 2026 13:02:54 +0000
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oupton@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 00/24] ARM64 PMU Partitioning
Message-ID: <aWjlfl85vSd6sMwT@willie-the-truck>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <aTiqK7gKKKzGGwgW@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTiqK7gKKKzGGwgW@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_050302_922532_864E487B 
X-CRM114-Status: GOOD (  19.83  )
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

On Tue, Dec 09, 2025 at 03:00:59PM -0800, Oliver Upton wrote:
> On Tue, Dec 09, 2025 at 08:50:57PM +0000, Colton Lewis wrote:
> > This series creates a new PMU scheme on ARM, a partitioned PMU that
> > allows reserving a subset of counters for more direct guest access,
> > significantly reducing overhead. More details, including performance
> > benchmarks, can be read in the v1 cover letter linked below.
> > 
> > An overview of what this series accomplishes was presented at KVM
> > Forum 2025. Slides [1] and video [2] are linked below.
> > 
> > The long duration between v4 and v5 is due to time spent on this
> > project being monopolized preparing this feature for internal
> > production. As a result, there are too many improvements to fully list
> > here, but I will cover the notable ones.
> 
> Thanks for reposting. I think there's still quite a bit of ground to
> cover on the KVM side of this, but I would definitely appreciate it if
> someone with more context on the perf side of things could chime in.
> 
> Will, IIRC you had some thoughts around counter allocation, right?

Right, I was hoping that the host counter reservation could be more
dynamic than a cmdline option. Perf already has support for pinning
events to a CPU, so the concept of some counters being unavailable
shouldn't be too much for the driver to handle. You might just need to
create some fake pinned events so that perf code understands what is
happening.

Will

