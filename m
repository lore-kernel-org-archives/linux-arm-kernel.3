Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5666E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eunLVmiOCIlwJDi/pkp6aFEd+4b8QvjpyFRv4gnX4pc=; b=iJynDiIijzCJbo3emPlKjKi1h4
	7XQYzq+yHEBt6n36iacg8r8mBPcxO13Xqo89yjKg2JAfzwu8oBQyHKAG68QppZFT3ofIE/kDcamLk
	NanD3gEb8RbNzJvriBzNe1fCLpVJw7ZeBQVzR2DUDB2pwofPuuBD+gXHs3Bxkkcz0u2eMAR7b6R0t
	dLifoV5lG9OZiVTck4aKrOvGAhJLoAv0zB5ouljcoahVgErlpeoCcM+3zCk4FvoxYBVwlDvPdJelE
	3YdeLUnnYcLZtdDm6hJADI8Lm/rya4Rz+YGcZytNUI4A12eS3LhsH37mFUeWcYOkp+LHs1OKmZyPo
	+AzukW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL58Y-0000000CQ8L-3Cf6;
	Tue, 10 Dec 2024 18:39:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54Y-0000000CPL7-351g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81392A419C1;
	Tue, 10 Dec 2024 18:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308C4C4CEDF;
	Tue, 10 Dec 2024 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855701;
	bh=NaoW2XYUkM/DqsZGjkM8Izv9P6koZoIMPQ7uTpu9s5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ALCANVvObH03L/0We+6GkNNw4Q7avtq8khyjeqDHgIvpnkyqkSeodUkwD+mGYFHoH
	 HLUHjjuCJpXZ8cl1B+M97MXVh7+Y306t4b0zIbjxHDt0VjucmyR+n/JOKKx0eb91NN
	 ODgYOZXRcvzWycRSVwoZt9uN4wYLJCsvVw3PKcatqdaeGh25HNZAifkptBdvyH3Jk9
	 D4b9oalrdlVbpqJ374jU733yFKiqpMzl3MPeGycLv6KAuSri6kOlyG/MQyNhTMMVaj
	 AUniXivMev41wMSAnZ9Ir/AcePWy1WdqIF8h2Ej/r/IWkljXP38iRtPisTBU4bdgis
	 /GohIHv1T2WEA==
From: Will Deacon <will@kernel.org>
To: broonie@kernel.org,
	anshuman.khandual@arm.com,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64/cpufeature: Refactor conditional logic in init_cpu_ftr_reg()
Date: Tue, 10 Dec 2024 18:34:45 +0000
Message-Id: <173383298019.2041619.15466719029042277892.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241115053740.20523-1-hardevsinh.palaniya@siliconsignals.io>
References: <20241115053740.20523-1-hardevsinh.palaniya@siliconsignals.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103502_835188_89E223F8 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On Fri, 15 Nov 2024 11:06:35 +0530, Hardevsinh Palaniya wrote:
> Unnecessarily checks ftr_ovr == tmp in an extra else if, which is not
> needed because that condition would already be true by default if the
> previous conditions are not satisfied.
> 
> 		if (ftr_ovr != tmp) {
> 		} else if (ftr_new != tmp) {
> 		} else if (ftr_ovr == tmp) {
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64/cpufeature: Refactor conditional logic in init_cpu_ftr_reg()
      https://git.kernel.org/arm64/c/e52163df7721

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

