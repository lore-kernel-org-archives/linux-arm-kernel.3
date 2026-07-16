Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E452C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pviMfnX/HUaOmx/ovGW50P9j3K4uudlc7YTeokSyPvE=; b=FnrObdTOieiAvB9uuVh8LjLAsR
	HGf+aSyjRNzkJIULaev0gtCLovjlhZDQPL93rc2O6PpI1vHU2qDbUiJMM21w8o3zOcc2mExmV8FiP
	v+xI8wjpyAp9WZypxOrPsQD7WV5w88Slruc6CuZepEhudUe1N9B5XaP9AUIUK0U8p7rtVs2qfDOiX
	W36jqVgPUKRyfXHrAe3ZF2vqrSZEab6CsM0M+5CQSH550mwOGyJicRpjs/PqLum6k7RjxV//AUwGB
	ZwLaiXqmY1HACcxzRkhAypIKZJ8YOd4mxhRRuyvlWayT1i1T77vJPk1GKQZ96Fh/LRU/xJuYCzqR+
	yE8aA+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM4c-0000000HNjl-0wwl;
	Thu, 16 Jul 2026 13:24:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM4b-0000000HNjY-1Fhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 13:24:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12285434E3;
	Thu, 16 Jul 2026 13:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AE41F00A3E;
	Thu, 16 Jul 2026 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208261;
	bh=pviMfnX/HUaOmx/ovGW50P9j3K4uudlc7YTeokSyPvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H76DTIwwU8Z72uPRHja7ie2zD8snRxH7/gCNKaWMv6sk/6GsfZoYKdczqoJhsLPGt
	 pwV03mBycS61lRZn9ovWs8wXMGJs55CECUzKcSeRqdPaALEVbn7LLXluCitQeQcNPb
	 zywiB/k0km18wCd1EW6LUYZpjOo26guc22ctDzakcYhztOQr6BjaHmch6x4bc7/aad
	 7Qvtdyewx4crUQqOHjjgqCw6DMYPJLC8jcxFpw8knR20bh+fsHunXCBvLANptTrLuS
	 M5bn65A8Jm1JHboMxIKZo3r37oAxYXi4WpnsnDHmVCdcRQL2gCNwmlS4xdcjBo35eY
	 tz8YLt8kD4U3A==
Date: Thu, 16 Jul 2026 14:24:15 +0100
From: Will Deacon <will@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-ID: <aljbf_RmOd9U2KDT@willie-the-truck>
References: <20260710063242.228714-1-hupu@transsion.com>
 <20260710063242.228714-3-hupu@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710063242.228714-3-hupu@transsion.com>
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2026 at 06:32:55AM +0000, Pu Hu wrote:
> From: Pu Hu <hupu@transsion.com>
> 
> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> can happen when tracing or perf code runs from the debug exception path
> while the first kprobe is preparing or executing its out-of-line
> single-step instruction.

I don't understand this part. The single-step runs with debug exceptions
disabled (kprobes_save_local_irqflag() sets PSTATE.D) so how do we end
up taking one?

Will

