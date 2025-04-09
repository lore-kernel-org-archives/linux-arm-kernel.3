Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17549C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfxegZ0KYTJ8SeY85RB4SV1VMpClIouJSyJAqXohpDM=; b=1I6sb386/RhHCC0ceJgkfQ0NFx
	tO1La7nsjyyxDDPfb76+zhypk0SV+GtJcRaSzhrqkyWdI3u+aswpyDz1Lzi38EGJbP8EhrQbyzvbL
	sbwg7U+oNMKJFOb+6Bm6jhb6NAF7uumbYJ+Sy9EdOfOXOVcDmTjdcIe2fPL5Qmqo5urt5mywa5+R0
	uKZO/GtGpf3HmyutUaCuUEEPaBWz6qk2PIqLl7/fr5hfSbju+XmM6I+kf1W7DkaBw/r5MnnsGIT3i
	DFymgHtd3PT6qY1EzQQOpjuB6+4902UlrB/XViHei5Sd6ad1qFCHVC1Nz5AbLKkYELmyMe/T+AU+Q
	R09ap7tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WuS-00000007a8n-2QY8;
	Wed, 09 Apr 2025 15:00:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WQJ-00000007SPh-3hGv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 14:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GfxegZ0KYTJ8SeY85RB4SV1VMpClIouJSyJAqXohpDM=; b=VUfZDKMhsTtFBu6EgVZG5tJoim
	0nnQ8Cm4/YlWFxcQEeW39XR5+4L9v8zC95D6/xGnVxmqS2b5R26A3gUYFwlBuqNwUcFAs38t6+Znb
	ihm3rIKycq9g6+P+OdvQTdOjFwe/psZEp9Uuar1e6+p7B8orKVx0ZKvDqo8M1wyQwG06aPOMLrZ8g
	HzHUFO/rjAUDuZN+i+TcF8fPpHLnD7o4b/GhCKnUrDWaruTHCB9k70y7Dai2VDNp+NsDj/VjJhS4A
	iFww5vvFO5p2g/5TScvmN6KUNeyUd25lKzjpkDhsbt/mJohLP5r0PQgKGMaQxvRt20HVlJFAZMXw0
	VVT5zg4w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2WQH-00000008dLA-0I5A;
	Wed, 09 Apr 2025 14:29:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9DAC03003FA; Wed,  9 Apr 2025 16:29:00 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:29:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mark.barnett@arm.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, ben.gainey@arm.com, deepak.surti@arm.com,
	ak@linux.intel.com, will@kernel.org, james.clark@arm.com,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] A mechanism for efficient support for
 per-function metrics
Message-ID: <20250409142900.GD9833@noisy.programming.kicks-ass.net>
References: <20250408171530.140858-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408171530.140858-1-mark.barnett@arm.com>
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

On Tue, Apr 08, 2025 at 06:15:25PM +0100, mark.barnett@arm.com wrote:

>     perf record -T --sample-cpu --call-graph fp,4 --user-callchains \
>         -k CLOCK_MONOTONIC_RAW \
>         -e '{cycles/period=999700,alt-period=300/,instructions,branch-misses,cache-references,cache-misses}:uS' \
>         benchmark 0 1

>     perf record -i -vvv -e '{cycles/period=999700,alt-period=300/,instructions}:uS' benchmark 0 1

Should be updated to read something like:

	cycles/period=1000000,hf-period=300/

right?

Also, cycles/freq=1000,hf-period=300/ should now also work, right?

Anyway, the kernel bits look good to me now (with the nits fixed), so:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

