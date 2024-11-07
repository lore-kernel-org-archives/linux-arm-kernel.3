Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391DCD43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gY4l8zaylZkdbzVqS6zyz/xiZ1Bv36W4aQV8p/yM1g=; b=yQvJmoBcK7rflmb0s0KnoMJWqm
	bbFlTTUOOp8kxvh/tpyh34gyyaVl/G23UsJUqRnH9o42fpz1VKUMtcVLNhVFS/FoXp88vgprJLAWW
	D+kVcMKtz+paUS7N1ZOso0gwWp+l2RyQmgRhJgimRPjrVh2Is7iiA/jhWy4jmDOkkbe9cjJakbjPU
	1QSDnpqwbrwZEWfKsWia+Z0bhpnT5mhCin/VpTbzJnzcB7Jo42JZfQnAYJRerEV2KPH7DcDdoXbBi
	+zOZtnwqBdcM/qlqhMlTtmOMbsUf7FokJRf/AXoo3ymJ9CjmdgjB2+Z5fbo5iqErUFxEkvvlRmgMi
	c6sJbceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90eM-00000006h3K-1iwJ;
	Thu, 07 Nov 2024 11:26:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90cY-00000006gdu-2FpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE49BA41F74;
	Thu,  7 Nov 2024 11:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA30C4CECC;
	Thu,  7 Nov 2024 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730978653;
	bh=GoNe6/q7REWxoVhFOfRrz2ijnlCfaDTpIKKYt2g7RSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKNcUSySUY2gcgPgoGjUqf2LVi4NQw+GwGsz/vb7uTNqed46LWPa39tyTR21mrziR
	 P96LakLbAsrR78ibhRehpVwYT1clA6AIdXbaSgrFLsslyivM8hikKPHLfyunkRmk4S
	 Z8vJM96Kql1eCqEXQvq78C+n5VptHcW4Hl305AsyKxmBFdRgoltIPOU0ymkkqbterM
	 E1IoT/bh3l/slCRtP7qYIefMDZrtQv7cW5sX/9z5xzGc/lbflaEKCuwWWsrTcgrXgg
	 FGFYSVLavAQi5ONUEuzvEKh9rlyTnetwqMhzN0yEGp4+e0UoT4xE/pGR/GOXFcnFWc
	 UV2jlhU1T4DXg==
Date: Thu, 7 Nov 2024 11:24:08 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kselftest/arm64: fp-stress signal delivery
 interval improvements
Message-ID: <20241107112407.GB15424@willie-the-truck>
References: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_032414_662661_CE6445D4 
X-CRM114-Status: GOOD (  14.27  )
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

On Wed, Oct 30, 2024 at 12:02:01AM +0000, Mark Brown wrote:
> One of the things that fp-stress does to stress the floating point
> context switching is send signals to the test threads it spawns.
> Currently we do this once per second but as suggested by Mark Rutland if
> we increase this we can improve the chances of triggering any issues
> with context switching the signal handling code.  Do a quick change to 
> increase the rate of signal delivery, trying to avoid excessive impact
> on emulated platforms, and a further change to mitigate the impact that
> this creates during startup.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Changes in v2:
> - Minor clarifications in commit message and log output.
> - Link to v1: https://lore.kernel.org/r/20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org
> 
> ---
> Mark Brown (2):
>       kselftest/arm64: Increase frequency of signal delivery in fp-stress
>       kselftest/arm64: Poll less often while waiting for fp-stress children

With these changes, I was easily able to reproduce the SVCR=0 bug so:

Acked-by: Will Deacon <will@kernel.org>

for both.

Will

