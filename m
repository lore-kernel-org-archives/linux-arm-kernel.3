Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C17C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtoYSu4x5hUvpMtc8AEQqneJMFZgrjOsjFGPP0nbSKs=; b=ZN5BA4UaRjTmFRtUdKe1+zvOAv
	qH/VIZcEBCGXDr0Js49LCLq66pZrRxywtxNQ+VQgLqS1CPOG3hv3rwt7gZ5lSKIXkkt7mA+4DWpKm
	0Z8OuI6pJrY8/CrdEDwyiGjDCrHM7Y+4c8E6ik4Km1nswYC1YkRq3gSAxbf80ytefM/fYYMacuG/j
	OXKG3oX+ffO6edF1KVC4/PZq8ic/oFl+jhr74n6+s0mRGXDSRrXrASKzFKQw9+8Ap7kkAuhO8gaY2
	+6vE0zOTojD9PnCPCSh1n47rfTmCqgAocDEi9DocRM8coms6MC6pUDN1PvvEVbJv5Vti8If9IC8G1
	Z0tN/oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfK87-00000005exd-0rkq;
	Mon, 12 Jan 2026 15:46:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfK85-00000005exM-3mKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06ACD600AA;
	Mon, 12 Jan 2026 15:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4532AC19422;
	Mon, 12 Jan 2026 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232812;
	bh=JEeaRryvCEJ/W41M0JBPJiMLbD1SKq+cht4PwCoyAKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HzhRKxsRlhqCAiWzSEiMSQZQDqlq/ySiuzXFs720/BU7rqJckInmInBEy/v/VASUb
	 OLXslX69v2sY2Ij2MoVNx4oNU50PENWyQKeMdaqyUQRRjSLIG4eaQUvJ+mh9oqZDhe
	 CgjztB4su9fUU9C3oQclrEdEPird1v+rKTTKRmzIoqm2GC1ujwqAC037OLbwfOgPjr
	 usQ7e4Qvh6zHFscn+NToTXYczmv5MLX1PNBWw099YLFMv/iU/qgVgGYZMxz4xIGCT3
	 ZBEZ6DrI2P8w2wH/54nhFiSUxlvUdYCAiyKqnonZj5Xhy1SyPQpg728YyPsb1OJDe+
	 SHDtJUDUXiBdw==
Date: Mon, 12 Jan 2026 10:46:53 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Laura
 Abbott <labbott@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, puranjay@kernel.org,
 usamaarif642@gmail.com, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Fix annotated branch unbootable kernel
Message-ID: <20260112104653.301e1177@gandalf.local.home>
In-Reply-To: <74f52o5tq2nodc3otsvknrsf2rpzphtaba7lxia5u3i7322vni@giqfw3ofnnyk>
References: <20251231-annotated-v1-1-9db1c0d03062@debian.org>
	<aVwp_BJx84gXHPlD@willie-the-truck>
	<20260109145022.35da01a3@gandalf.local.home>
	<74f52o5tq2nodc3otsvknrsf2rpzphtaba7lxia5u3i7322vni@giqfw3ofnnyk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 12 Jan 2026 01:42:47 -0800
Breno Leitao <leitao@debian.org> wrote:

> > OK, so by adding -DDISABLE_BRANCH_PROFILING to the Makefile configs and for
> > the files that were audited, could be opt-in?  
> 
> How to do the audit in this case? I suppose we want to disable branch
> profiling for files that have any function that would eventually call
> noinstr functions, right?

IIUC, noinstr is mostly used for the transition between user space and the
kernel (interrupts, exceptions, syscalls, etc). There shouldn't be any
random calls to noinstr functions unless it's going into user space, right?

-- Steve

