Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4520C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxVVW6a/lQSsUjWI/xpP2rf8YwOhJRusQGd2Ltf1NSo=; b=FEIyqwHwgoRC1snKilGjRBd4Kk
	ijODRtYAAr8U/6fO0wMKo/slCpbSrvgFh4gxbeQTOlJIIS9BCdGHD4X7k/bz4p2lN5zYOdhJpO9cL
	ZKdPQ+3t4q0MmvO7ytdbvkfTj/xXd6DKMna3vczkAdp+fj2oTImP8f9rx6V/jXIAwOnQrU4ts2IEx
	3l9PS9QEK5mianW/UXSCmfbaPH10Kj9Nq787Ku1by5VrvbonS1PgcPw0cLQ3eqS+fcbmqoC6sz2el
	J/pAA2AkwmQlZe8DvaOpj3EoTnLAu4G2y2TVZEsq2MZo5HRrSy8WMUydU63jkEY7iCqmM2s+77qFK
	1TTShfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWw3-00000000Zp9-1GZi;
	Mon, 10 Feb 2025 16:47:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWtM-00000000Z7R-1Q9F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E2265C5BBC;
	Mon, 10 Feb 2025 16:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6BDC4CED1;
	Mon, 10 Feb 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205855;
	bh=pJIYPWJ+5c+OJAajVySyzvOkJYxLdGI/XLkulyWGlJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sap1xWyb/Xua4wOkYzVszhdi1qatQ6+kI68L3yl8aizC4TP6ZfceuQNPR4xa3UP4a
	 GcGTPc4GzCih4oxnvKRM/JRcfJuxnwVJIPoBOP1pO4+IDJnyNmdLDruSE2QX9xhwvX
	 EhUrumg/0Jp5TOiR5H4oAa8Nh6yapeQllKnvCKasdsEqs/3JdNOjgUxdnbJMtu2bKj
	 uu5e23d5Ub57GKgZKwkPFpklHe4zyCPoxx37+rrOX/YBbmpHvx75c8jQAkjW+Mm5Ih
	 f6h4+4B0fGSmfE1IbxIjpBOqxH9dXNOp9s5TIWkHXgqzUov/To0QI/h/YJy73ztR71
	 aOcRpvV+6+PbA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, ukleinek@kernel.org, alexandre.torgue@foss.st.com, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 wbg@kernel.org, jic23@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
 olivier.moysan@foss.st.com
In-Reply-To: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
Subject: Re: (subset) [PATCH v3 0/8] Add STM32MP25 timers support: MFD,
 PWM, IIO and counter drivers
Message-Id: <173920585199.1896384.5521926980550161552.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:44:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084416_427047_F70F89FE 
X-CRM114-Status: UNSURE (   9.41  )
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

On Fri, 10 Jan 2025 10:19:14 +0100, Fabrice Gasnier wrote:
> This series adds STM32MP25 support on MFD PWM, IIO, counter timer drivers.
> This new timer variant is managed by using a new DT compatible string.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC. There is also a new instance (TIM20).
> Same feature list as on STM32MP1x is supported currently, except for PWM
> capture (not enabled, by DT).
> The device tree files add all instances in stm32mp251 dtsi. PWM, counter
> and trigger examples are provided for stm32mp257f-ev1 board.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: mfd: stm32-timers: add support for stm32mp25
      commit: 4c1d04d013e3e5073a7e78e57cba82c3cd81d586
[2/8] mfd: stm32-timers: add support for stm32mp25
      commit: 3c81d423568ad28540a7dab4ca8ea66ded9b352f

--
Lee Jones [李琼斯]


