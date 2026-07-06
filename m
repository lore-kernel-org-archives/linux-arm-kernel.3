Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86261C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqDsh2QaLKyHlaA9B2wG1IbFv9bbWVtFohll3WxV0wI=; b=hTy2a6vGrT7d3+8MZF2fJDp/5a
	r6hW9ccdvs5uzXsq6mh0LlbkHNOZck7bKWbfNtS7FA5hD0ltWWYgrGlj0R3+NeeXNdWAE8OfucIVz
	CEwiqQOXpU/ibjwrEhFmBIJZu3Zw3Q/S63ja1hZjS758POsNPvSEz0LW1wxvTQSzG/gvt30F1z3P1
	OeCagVxa2jvLApKf99TDY+ngKlhBI4FjrzzczoeuPAUEepZ1/evaf61SaIByiCqghlb54F845Xdx9
	c+Toc+itcbTRcNwNPS5y3O3VogFNQ4K9HReYDJDVvdcRc3ZNoCsat96V1Ek2/2ODIeumBdhamyiIc
	Fx3rxTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfRK-0000000BzQ9-1Kpp;
	Mon, 06 Jul 2026 09:16:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfRI-0000000BzPe-3eqe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:16:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8EF40C2A;
	Mon,  6 Jul 2026 09:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6433E1F000E9;
	Mon,  6 Jul 2026 09:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329392;
	bh=GqDsh2QaLKyHlaA9B2wG1IbFv9bbWVtFohll3WxV0wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WRLy7BXmrQwuhcKKUQeEVftjBJSq86DS94OZuPCDtxVVR4EzjIwIyxHW19+RNTnl/
	 agnpZdEOj4r2UwCF4o5qz9ShTdxFLQEX08eSDco8+NxfukYNxIVJBOgpmCgrFG3tSI
	 HtHIc3dFLxKbhmlCYLBlMggzaB5gUNP5NeCeJhDqy6vv7l5ICeFT9kHpwdRUK8OhPS
	 7U/1s8+0E9kv2R9QUFEjqDz30TX+Q+zpmiu2NKA4NMis4c8iU1krFfrUDcUdZsdPpT
	 eE5fhi/IFdyQe0zB0qDbod27nr5AAy5VLFqTkCgDwFmpXOPZkHoDdOpXh8bwtQbwVF
	 wBWkGIoAbbEMw==
Date: Mon, 6 Jul 2026 10:16:27 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
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

On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
> 
> Hi Sudeep,
> 
> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
> > (It is always good to cc all PSCI maintainer for any ARM64 CPU
> > hotpug/suspend related changes)
> > 
> > On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> > > The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
> > > the SoC to ACPI S3 similar state where SoC is turned off and DDR is
> > > retained. The hardware design on these SoCs forces a constraint to suspend
> > > and resume the system on boot CPU / CPU0.
> > > 
> > And you fail to explain why they have that constraint.
> > 

I still need the above to understand the issue/constraint better.

> > Is it because some secure context is not allowed to migrate ?
> > 
> > We already have a mechanism for that in place and this hack is not at all
> > required.
> Do you mean a mechanism for the secure context or for preventing CPU0 ?
> 

I meant constraint based on secure context.

-- 
Regards,
Sudeep

