Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AF5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkKkfn9RZYpOXUy1js9dF0h3N+oOvgZyHXslAX7StVo=; b=4sTJ6na5JCWBz7FqrVoONjaYgd
	j3hNzMAducvNzY7YyffRPL8TjM/ZSX/oh3PKIGZCgE2tWeq6KkELaOJ3CLHpTH95sNeGxP/JSuJCO
	0UyBtXY0YycPeY6hl83Q5kPUnkrzjpeDAAu3y+rrV9eIlthBxlGKHYU5sERd6aL2Mj++KCSNXeCky
	MUF4SVFx4C8XASHgyktZAXJFTQiroumyGz+CoCYU3Uf3LzVmdoCOI1AmVWTh7u67febFQOD3DZsqO
	SF4M0tKwDcGVGeoQ/FiL+UvotbW1x5/r4wxCLWyDnHqFUqCkBTlBWUtXCFPgPQC8iHcjBKfYo//P5
	pOIng2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8tH-00000006kTf-3TyV;
	Wed, 12 Feb 2025 09:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8rs-00000006kME-2ka0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Feb 2025 09:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gkKkfn9RZYpOXUy1js9dF0h3N+oOvgZyHXslAX7StVo=; b=UvcHBjIDImLXSx122KLXeXB+E7
	KoiVbl31dYtUDknrBK4nf6zhgFUWUwgwT/mfOM/gnDaFxOiUbNkgP9faSkIjm+Oext0WTZq7SRlrK
	sWUCc9t7y/xQJSU3/1SWptUTKdjIlVpiqV5LZ6UxqvFB99v3QIrnurJ8IyruxiPlfmW5TGK1kXuF8
	/5aamdyGGzsF0N7IgLRO5gHq/mTOSyYv/qYNqZvnGx3zXW4jFy0byilRTeYxhNOwY2qSCAByfsw10
	xwVU34JD6NiBG4a6X4h1tiwEYGeu856iOp+k165oP6S6JCwFj0epHoo8aUNGNEDNk+PVHlU/K4DgT
	ppAOs07A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8rp-00000000mzV-1Tny;
	Wed, 12 Feb 2025 09:17:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 60EB8300318; Wed, 12 Feb 2025 10:17:11 +0100 (CET)
Date: Wed, 12 Feb 2025 10:17:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Cristian Prundeanu <cpru@amazon.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Geoff Blake <blakgeof@amazon.com>, Csaba Csoma <csabac@amazon.com>,
	Bjoern Doebel <doebel@amazon.com>,
	Gautham Shenoy <gautham.shenoy@amd.com>,
	Joseph Salisbury <joseph.salisbury@oracle.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2] [tip: sched/core] sched: Move PLACE_LAG and
 RUN_TO_PARITY to sysctl
Message-ID: <20250212091711.GA19118@noisy.programming.kicks-ass.net>
References: <20250119110410.GAZ4zcKkx5sCjD5XvH@fat_crate.local>
 <20250212053644.14787-1-cpru@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212053644.14787-1-cpru@amazon.com>
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

On Tue, Feb 11, 2025 at 11:36:44PM -0600, Cristian Prundeanu wrote:
> Replacing CFS with the EEVDF scheduler in kernel 6.6 introduced
> significant performance degradation in multiple database-oriented
> workloads. This degradation manifests in all kernel versions using EEVDF,
> across multiple Linux distributions, hardware architectures (x86_64,
> aarm64, amd64), and CPU generations.
> 
> Testing combinations of available scheduler features showed that the
> largest improvement (short of disabling all EEVDF features) came from
> disabling both PLACE_LAG and RUN_TO_PARITY.
> 
> Moving PLACE_LAG and RUN_TO_PARITY to sysctl will allow users to override
> their default values and persist them with established mechanisms.

Nope -- you have knobs in debugfs, and that's where they'll stay. Esp.
PLACE_LAG is super dodgy and should not get elevated to anything
remotely official.

Also, FYI, by keeping these emails threaded in the old thread I nearly
missed them again. I'm not sure where this nonsense of keeping
everything in one thread came from, but it is bloody stupid.

