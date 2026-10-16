Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394D4CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81vadtNXxo+a0m/OaxtcZsE1Y77H6s1M3y9Uyifc/Ww=; b=go0Q4p0Awe0m0EiMqrF3EL67iM
	UNg5c73t9A0jlhPQ4WZCOiua67oeuFEZecBhQmxa5h3JyJ9VNkv6UvkXMHnaR4SU0W8dMfOGR+5Dl
	6pNTC0770sw6GZSRhQIk9PcjR9K956T3pt3Bz3glMbf+vMlcZ7Sp8KRQWBD5wlav91xBXz0mk3cW6
	1+wBTO1KHNFs34FIGX7nSKeBr685JyZrRC7BlZiEQqZWXNvm6JsaqTkuf20JQmsMrL2kVe1qb+li4
	HGra0ewxanc+yJeJbdL2OqvCdBFitVUb1EMqDjdlYhoJFnfq9ta5Fn5ivq4fvtbEiheWe5zKUt6vg
	rB/ldtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeot-00000002ZLW-2o0v;
	Fri, 16 Oct 2026 10:05:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeos-00000002ZL8-0J1s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:05:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A56614BF;
	Fri, 16 Oct 2026 03:05:39 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E7D3F871;
	Fri, 16 Oct 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792145142; bh=Lr4z80TttA9CAj46C7TTaxQIkqHJjPbuCEYVhj/R2RE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIBC6cNjFrf2xJ3onlfJxxXZJso7mCRvMSP5GGPQHeVUbtaYLIBKPoOsOZ8fQMWCt
	 WPNzABduNKk3UA8BO3A7cMpnYyKSwCRjqtydQrHkcSWAKt6kvQiz5SW0mVLA19OFfw
	 YoJHrsnBJWxKR2yAZQrq5H9sOkVv7nE904yPJ4ls=
Date: Fri, 16 Oct 2026 11:05:38 +0100
From: Leo Yan <leo.yan@arm.com>
To: Johnny Fan <johnny.fan@cixtech.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.clark@linaro.org, jeremy.linton@arm.com,
	cix-kernel-upstream@cixtech.com, bob.zhang@cixtech.com,
	jie.fu@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
Message-ID: <20261016100538.GE26205@e132581.arm.com>
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org>
 <20261015141926.GC26205@e132581.arm.com>
 <atGY5+kzQggCZboX@JohnnyFan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atGY5+kzQggCZboX@JohnnyFan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030546_181594_E6D2436E 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, Oct 16, 2026 at 11:24:23AM +0800, Johnny Fan wrote:
> On Thu, Oct 15, 2026 at 03:19:26PM +0100, Leo Yan wrote:
> > The SPE driver probes its capabilities on one CPU selected by
> > smp_call_function_any(), then performs local setup on every CPU in
> > supported_cpus. It therefore relies on that mask being accurate;
> > including a CPU without SPE could lead to accesses to unimplemented
> > SPE system registers.
> 
> Right. On ACPI the driver gets no affinity information for this
> device, so supported_cpus falls back to cpu_possible_mask. That only
> works today because registration is limited to homogeneous systems.
> The PMSVer trimming in this patch works around the heterogeneous case;
> with the mask taken from the MADT walk, both go away.

SPE driver supports heterogeneous systems. If firmware creates proper
devices based on CPU topology, the driver can probe multiple instances.

So "registration is limited to homogeneous systems" is not quite right.

Thanks,
Leo

