Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604BED0BB73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITSlBcmdKUBoR2+a1SNIWkpnRKbgwmB5a0/kaSKYmq8=; b=z3fP7NJgez+cdyD7x4oLqm2Oss
	XlTh3bLNVAZQHkVrJbO2siLrVzOplg9/7g0Z6cgHpQCGa4MCqa/67NOuMNVD/bmZtmyMv8X8pReuW
	5wGh4/HrU4//EjyS61Qae/f0n0AbGWMgwBdtsdyXE2TI/D2jRkMJD4hBoudSw7Cm2ctMOIiO7eAb/
	yDpEDTlgu62/vXd9LJ7XZb5NT1OjxWvcJ0QZ+74uFPJw+STPCaJgO9SCZU49MuckFskZ2jnC/EZre
	41a0KrtHbed5XaD+3DeJ52YayPTjbmjZ9zmGeSxHJETQVqjZvE3HCIMCJcXUQa8TNNcFodjeXlW5i
	G9DaMKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tXY-0000000HLzQ-0BKa;
	Thu, 24 Oct 2024 08:49:56 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tOD-0000000HKI7-0yhB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 08:40:19 +0000
Date: Thu, 24 Oct 2024 10:40:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729759214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ITSlBcmdKUBoR2+a1SNIWkpnRKbgwmB5a0/kaSKYmq8=;
	b=ub1S7pKXI97oebLi2oaD1dJYspFyor7IlAvysM648Lbyc/mwRaS51w04urtDipyN9PKZiF
	6ePGROwZ9+V69oJgo/pO1KwazBhNRp5wbeZzztEjk5Sy/a2urhwyA+sHtzl9uoaBXFFXAQ
	yEwT/kma/4BEgHMPDJ07VFtm2JmRymI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Subhasish Ghosh <subhasish.ghosh@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests PATCH v2 0/4] Fix arm64 clang errors on fpu tests
Message-ID: <20241024-ab42773f235945c68dd99d68@orel>
References: <20241023152638.3317648-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023152638.3317648-1-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_014017_667971_9673D295 
X-CRM114-Status: GOOD (  12.47  )
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

On Wed, Oct 23, 2024 at 03:26:34PM +0000, Raghavendra Rao Ananta wrote:
> When compiled with clang for arm64, some build errors were observed
> along the fpu code. Moreover, data aborts were seen while running
> the arm/fpu test due to misconfigured input/output args in the inline
> assembly.
> 
> The series tries to address these issues.
> 
> v2:
>  - Fix build errors for newer clang versions that push 'q' registers out
>    of scope under '-mgeneral-regs-only'. (Andrew)
> 
> v1:
> https://lore.kernel.org/all/20241022004710.1888067-1-rananta@google.com/
> 
> - Raghavendra
> 
> Raghavendra Rao Ananta (4):
>   arm: Fix clang error in sve_vl()
>   arm: fpu: Convert 'q' registers to 'v' to satisfy clang
>   arm: fpu: Add '.arch_extension fp' to fpu macros
>   arm: fpu: Fix the input/output args for inline asm in fpu.c
> 
>  arm/fpu.c                 | 52 ++++++++++++++++++++-------------------
>  lib/arm64/asm/processor.h |  2 +-
>  2 files changed, 28 insertions(+), 26 deletions(-)
> 
> 
> base-commit: f246b16099478a916eab37b9bd1eb07c743a67d5
> -- 
> 2.47.0.105.g07ac214952-goog
>

I've merged this along with the cross clang series and the 5/4 patch I
tacked onto this series which adds aarch64 clang testing to gitlab CI.

Thanks,
drew

