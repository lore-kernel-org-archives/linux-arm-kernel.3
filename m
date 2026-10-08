Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B9CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKtEOQHPigAoAwo8CF9T0jDnPNUFJucXM8EW3aRhA50=; b=lN5V8vDRRKJt87EJzsCL8gBsRx
	c3KuWrgfdAam0cdb+4K0ciJx754qYi1KCPS/oe+87RJFbd/w5olHNeoRzO+4nq5hDULQnvjGOY18e
	rJgM1UPYbZu/mkDplbZj9C7SCjWA8YW3jp1dxTndkhXXBQIRBMxgeqxMA4EQezTFKdr68WhPr2VXq
	5jdInebBTZRR7XzjAQvdObu/onPiAKPu/B8IiZ4H2YbPqJS1nc25RLF7KmnF9DMyCum19P0r63Pot
	j/yhablWTSWZiV3xSYNqWeprXAUIG6IiMVrofGw2IOHE+A42KdR37sk0LuH1ftxI049tvUDa3WKmz
	kpKWZjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkaA-0000000415U-3WR4;
	Thu, 08 Oct 2026 09:38:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEka8-0000000415F-3Nux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:38:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6D7D601DB;
	Thu,  8 Oct 2026 09:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467581F000FF;
	Thu,  8 Oct 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452311;
	bh=RKtEOQHPigAoAwo8CF9T0jDnPNUFJucXM8EW3aRhA50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCW3V0Kp5hNle2v72y2LEevLzHCpdOqLK/fpTYlnoTB/LQcXo579B1SmOK0hU+ygc
	 d675R8yy1aR3N2aXDitLuVqAvAn7+XbesNNfsltkPeX8mWG/kbMVtr+cr0bgQH85XT
	 zNm1mWl+cNM8vWgYAM+zK5vIIQ9HE0GfQgqJxN8UOOI0b80oWDlqGUxI+RUMhcSe8N
	 /KH4wgCVhSuZP9PGYva4A9B6UFAwB5N/RT9jlL4qW4rWPqDFEqtt0iz3FfYsFGF0Gi
	 gTTtBiXNpXnRidLvgnpMQ+Cj8RbT/qaNiDA6uzXyXtGAokBPtCdQ9s+GlCFW8un1OG
	 hzurksoo9zvjg==
Date: Thu, 8 Oct 2026 10:38:25 +0100
From: Will Deacon <will@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
Message-ID: <asdkkXWg_M3TwMrN@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>
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

On Tue, Sep 29, 2026 at 02:26:03PM +0530, Pankaj Patil wrote:
> On 9/7/2026 10:10 PM, Will Deacon wrote:
> > Hi folks,
> > 
> > This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
> > the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
> > previous series from Jinjie [1], and I'm grateful to him for his support
> > getting this alternative version in shape for posting.
> > 
> > I previously spoke at KVM forum about this work last year:
> > 
> >   https://www.youtube.com/watch?v=Q6kOshnnQuE
> > 
> > There are three major benefits realised by these changes:
> > 
> > 1. We ditch our home-brew secondary CPU synchronisation in favour of
> >    constructs in the core code.
> > 
> > 2. They offer a performance advantage on some platforms, where getting a
> >    CPU into the kernel can take time. I'm hoping Jinjie can provide
> >    numbers in this case.
> > 
> 
> Tested on Glymur-CRD - 18 core qcom,oryon-2-2 CPU, saw ~6% improvement
> in smp bringup and ~12% improvement in cpu hotplug kselftest
> 
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Nice, thanks for giving this a go, Pankaj! I'll post a v2 soon, so it
would be great if you can try that as well.

Cheers,

Will

