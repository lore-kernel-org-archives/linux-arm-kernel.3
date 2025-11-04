Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DFECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0F7ZrSKM7u2nUul9wV6xQgYjVJl928YliXgn45fMfw=; b=kuzHutPBm99JksRD96n/7b5gh3
	KBng4bi3pR7DBYfya3yMmCiZQxygMznSxQkbLfK50pcS2M7wyuS7sD/xUqrXo6SWID76pm/ozbtkQ
	dr1rx0d1rGFpkGjytyBWrtRgVO7fkAvEUktKbFfMpUZhOC/PqqkfrPbmHn8mV0CNOTLeajPQ0HuiB
	bJUmflZD/XNRuMgCOGnx26F0PJBCrIOKmVwQ0bs7UXyfX4ZvsXk2MQGCYM04dnPCKosA1Bhhopurm
	79VHWEyysTx5mDwCTGkJjVu8Zg7MxLUP4KTWXqBZdsAy5ZsGHsgod1jZO+z9IJXR02qmox29ytNWO
	eQFWBvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGO6r-0000000CZlA-1Gpt;
	Tue, 04 Nov 2025 20:58:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGO6q-0000000CZl1-1V4f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 20:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 704C1601EC;
	Tue,  4 Nov 2025 20:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAC8C4CEF7;
	Tue,  4 Nov 2025 20:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762289911;
	bh=SBhTMzB2HppxP29WSrGYUcVzx1C3A9Tmx0XRlfClTik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmyQwHRYVH98mM9tPSqyM19/4C7aB0A0mWmK32Iw3kveUvwN30drOf5QYiVIR4ybA
	 3im06eo6gHW+ppdDWHufpSwxiGHMT6MECorbVyYJac1HOodGFlBAlo5+uQGxXpJTjz
	 wTXtQ3sb8CbtItFpKY/qdVX1+vGefLumBBvF7Yp5ET5+WO5qRZLPOW1MphFTwgkkZr
	 tawc2zTO/0P67edAjoVFqjPmF6RYRY14aN6qKyZp2x4Sv+jnp0CexuaBqj2weSDMjh
	 YzGZvuS1NqLso4Gcp7+OEeJwdRYzId6FY7UnZQQCeZm2Hmr2ioefUhMGl6NXTZjMKC
	 qcxCnzQPf2aQA==
From: Puranjay Mohan <puranjay@kernel.org>
To: leitao@debian.org
Cc: catalin.marinas@arm.com,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	paulmck@kernel.org,
	rmikey@meta.com,
	will@kernel.org,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Date: Tue,  4 Nov 2025 20:57:53 +0000
Message-ID: <20251104205753.42224-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
References: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Breno,

I tried your benchmark on AWS graviton platforms:

On EC2 c8g.metal-24xl (96 cpus Neoverse-V2) (AWS Graviton 4):

With ldadd, it was stable and LSE is always better than LL/SC

But with stadd, I saw some spikes in p95 and p99:

 CPU: 28 - Latency Percentiles:
====================
LL/SC:   p50: 6.61 ns     p95: 6.61 ns    p99: 6.62 ns
LSE  :   p50: 4.64 ns     p95: 4.65 ns    p99: 4.65 ns

 CPU: 30 - Latency Percentiles:
====================
LL/SC:   p50: 6.61 ns     p95: 6.61 ns    p99: 6.62 ns
LSE  :   p50: 4.64 ns     p95: 14.24 ns  ***p99: 27.74 ns***


On EC2 m6g.metal (64 cpus Neoverse-N1) (AWS Graviton 2):

Here both stadd and ldadd were stable and LSE was always better than LL/SC

with ldadd:

ARM64 Per-CPU Atomic Add Benchmark
===================================
Running percentile measurements (100 iterations)...
Detected 64 CPUs

 CPU: 0 - Latency Percentiles:
====================
LL/SC:   p50: 8.40 ns     p95: 8.40 ns    p99: 8.42 ns
LSE  :   p50: 5.60 ns     p95: 5.60 ns    p99: 5.61 ns

 CPU: 1 - Latency Percentiles:
====================
LL/SC:   p50: 8.40 ns     p95: 8.40 ns    p99: 8.41 ns
LSE  :   p50: 5.60 ns     p95: 5.60 ns    p99: 5.61 ns


[....]

 CPU: 62 - Latency Percentiles:
====================
LL/SC:   p50: 8.40 ns     p95: 8.40 ns    p99: 8.40 ns
LSE  :   p50: 5.60 ns     p95: 5.60 ns    p99: 5.60 ns

 CPU: 63 - Latency Percentiles:
====================
LL/SC:   p50: 8.40 ns     p95: 8.40 ns    p99: 8.41 ns
LSE  :   p50: 5.60 ns     p95: 5.60 ns    p99: 5.60 ns

=== Benchmark Complete ===

With stadd:

ARM64 Per-CPU Atomic Add Benchmark
===================================
Running percentile measurements (100 iterations)...
Detected 64 CPUs

 CPU: 0 - Latency Percentiles:
====================
LL/SC:   p50: 8.00 ns     p95: 8.01 ns    p99: 8.02 ns
LSE  :   p50: 5.20 ns     p95: 5.21 ns    p99: 5.21 ns

 CPU: 1 - Latency Percentiles:
====================
LL/SC:   p50: 8.00 ns     p95: 8.01 ns    p99: 8.01 ns
LSE  :   p50: 5.20 ns     p95: 5.21 ns    p99: 5.22 ns


[.....]

 CPU: 62 - Latency Percentiles:
====================
LL/SC:   p50: 8.00 ns     p95: 8.01 ns    p99: 8.14 ns
LSE  :   p50: 5.20 ns     p95: 5.21 ns    p99: 5.21 ns

 CPU: 63 - Latency Percentiles:
====================
LL/SC:   p50: 8.00 ns     p95: 8.01 ns    p99: 8.01 ns
LSE  :   p50: 5.20 ns     p95: 5.20 ns    p99: 5.20 ns

=== Benchmark Complete ===

