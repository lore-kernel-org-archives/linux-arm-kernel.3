Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478C0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv83E4tPSD63A3UUXDSXWnWSJxMjdFVFuiXuH8ewpAo=; b=vxGSJfLOrjzo19iBVEgF1zyo12
	o2U1Dsj70QaFDtsEjCZUdObdW1hhsGFvt2B/eG6REaryLwo8iasd/oc7/j8nP2QYe2ti3TOv64pyU
	aeT8Vmr1fuU4sTpdlcBOWQ0KybDm6+qzJ75gWk+asd44rxAlnGipFcJ7QbYreDkz3KbBM3QQkWWPp
	1UAQ2GVrPYQSOputZAd4nTCVYFIMpkArxt5MFzKYwVAhfqmrwYIm6blgQpIXm5uX5ms749WlBrhEr
	q7YHU1jnE0DOhyF+3ZWkM6wZJ9vSszEngb2JSebPYco+doJHlYX6BL3lKuuDkAgt7NHZRpFLOdHnX
	CyZs4olQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMDo-00000002rC2-3iyq;
	Mon, 14 Jul 2025 16:40:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKqs-00000002bo6-43HO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32EE15C625F;
	Mon, 14 Jul 2025 15:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BA4C4CEED;
	Mon, 14 Jul 2025 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505941;
	bh=mXB87Bpc3vfmGJ3xVQnf0jSRexpExNYLcwlFgBP5krk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/H0NoqvGLmDRq2iwlyOPEE0dpYcGJaPGpn6tdKz68CeIpoluy6/VJQqcLSPCLdg
	 t2AmcHR216SD5vFfy+XvAI/hLiHuRhBK1HSgzafBx9vJ/1CTqobJbo7hgf6QDM/zDW
	 MU+VL0tJ0IeuOIwxp+dEtaTgIg8wl21ALR+lMmJW8DfZib02JL8ar2NVqFbEVnbdSL
	 /dmbMT4B6YbFOEugb47P2/ioekwZcBYS+OQ0EqtLFJTDYxlRvWEAUhUkJomL3R+P79
	 dw4ZSAc8zeI4MWUSgxQbhmo89zPOtFjzts7nyn5Vx9CSEWuZHl+xLQWevxszvWGE6c
	 NacDlA62rUTbg==
Date: Mon, 14 Jul 2025 16:12:16 +0100
From: Will Deacon <will@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple
 A7-A11, T2 SoC support
Message-ID: <aHUeUMmn_19EayL1@willie-the-truck>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081223_041875_D52B7D3D 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
> This series adds support for the CPU PMU in the older Apple A7-A11, T2
> SoCs. These PMUs may have a different event layout, less counters, or
> deliver their interrupts via IRQ instead of a FIQ. Since some of those
> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> be enabled by the driver where applicable.
> 
> Patch 1 adds the DT bindings.
> Patch 2-7 prepares the driver to allow adding support for those
> older SoCs.

Modulo my nits, the patches look alright to this point...

> Patch 8-12 adds support for the older SoCs.

... but I'm not sure if anybody actually cares about these older SoCs
and, even if they do, what the state of the rest of Linux is on those
parts. I recall horror stories about the OS being quietly migrated
between CPUs with incompatible features, at which point I think we have
to question whether we actually care about supporting this hardware.

On the other hand, if it all works swimmingly and it's just the PMU
driver that needs updating, then I could get on board with it.

Will

