Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B5FCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Tbk7L7m6upWMi97LsgJsenKd/RNgyZ7+DtaMqeGC6Y=; b=DKSV2UQD0PVlYOfd/iexpFhMIP
	raYs6DBZIVaCO+h4rJacJRZfNTEP5evJeFbWY7YWt2YIc018pWXF/jlyt43HW/9taHTP78Gm5v9p9
	ep9WC38kr0ccSVgQFt9ruJvdeWDZRTSdUKWyBz1h8ivbHOe+uBiIXQbexqNwK2fD7f0dUmgd6wasS
	ylpURx57vXt/DlKIC6GQFGEH01zER1jKkCSB0xzp8U6zMGgOy9L2g+UFAvnsiLrC96GaLM9A4iLqO
	0ndtQcgEbdlCJhPlQ6Rx+OLaU7D6LNHdqFkxhdSe6n53zSbt28l7+DvBcfUJ1yM5vQlVzBlROuA6E
	QJ2sqByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYng-00000002CiN-1j9z;
	Tue, 02 Sep 2025 21:44:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUAq-00000001231-2uBb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19A436000A;
	Tue,  2 Sep 2025 16:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A091AC4CEED;
	Tue,  2 Sep 2025 16:47:58 +0000 (UTC)
Date: Tue, 2 Sep 2025 17:47:56 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active on
 local CPU
Message-ID: <aLcfvIfFb6xD-NXp@arm.com>
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829153510.2401161-1-ryan.roberts@arm.com>
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

On Fri, Aug 29, 2025 at 04:35:06PM +0100, Ryan Roberts wrote:
> Beyond that, the next question is; does it actually improve performance?
> stress-ng's --tlb-shootdown stressor suggests yes; as concurrency increases, we
> do a much better job of sustaining the overall number of "tlb shootdowns per
> second" after the change:
> 
> +------------+--------------------------+--------------------------+--------------------------+
> |            |     Baseline (v6.15)     |        tlbi local        |        Improvement       |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> | nr_threads |     ops/sec |    ops/sec |     ops/sec |    ops/sec |     ops/sec |    ops/sec |
> |            | (real time) | (cpu time) | (real time) | (cpu time) | (real time) | (cpu time) |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> |          1 |        9109 |       2573 |        8903 |       3653 |         -2% |        42% |
> |          4 |        8115 |       1299 |        9892 |       1059 |         22% |       -18% |
> |          8 |        5119 |        477 |       11854 |       1265 |        132% |       165% |
> |         16 |        4796 |        286 |       14176 |        821 |        196% |       187% |
> |         32 |        1593 |         38 |       15328 |        474 |        862% |      1147% |
> |         64 |        1486 |         19 |        8096 |        131 |        445% |       589% |
> |        128 |        1315 |         16 |        8257 |        145 |        528% |       806% |
> +------------+-------------+------------+-------------+------------+-------------+------------+
> 
> But looking at real-world benchmarks, I haven't yet found anything where it
> makes a huge difference; When compiling the kernel, it reduces kernel time by
> ~2.2%, but overall wall time remains the same. I'd be interested in any
> suggestions for workloads where this might prove valuable.

I suspect it's highly dependent on hardware and how it handles the DVM
messages. There were some old proposals from Fujitsu:

https://lore.kernel.org/linux-arm-kernel/20190617143255.10462-1-indou.takao@jp.fujitsu.com/

Christoph Lameter (Ampere) also followed with some refactoring in this
area to allow a boot-configurable way to do TLBI via IS ops or IPI:

https://lore.kernel.org/linux-arm-kernel/20231207035703.158053467@gentwo.org/

(for some reason, the patches did not make it to the list, I have them
in my inbox if you are interested)

I don't remember any real-world workload, more like hand-crafted
mprotect() loops.

Anyway, I think the approach in your series doesn't have downsides, it's
fairly clean and addresses some low-hanging fruits. For multi-threaded
workloads where a flush_tlb_mm() is cheaper than a series of per-page
TLBIs, I think we can wait for that hardware to be phased out. The TLBI
range operations should significantly reduce the DVM messages between
CPUs.

-- 
Catalin

