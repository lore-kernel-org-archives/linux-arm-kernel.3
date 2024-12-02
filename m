Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3684D78334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSd25E3FspRtO4F4jkydJrP1lvCL/PgtK5lYakvCZCw=; b=BTMP489+7YEeRinLJ60uEBFHh3
	KBg//Ys1r3k/1cB0PRISB8K/zp3tSjUtVxAzKJYEQ6wPOMsGYrjrNdGx6Z/9axmnHOsjEjMb9+XNS
	nPuPMLMoxqUj3k3Av4LnAi8jVOgd/QnAdMLv7dLT2axLqn40oLlYSdlgsYfv0LwvlXiSeTHNXT4gQ
	okUYM4nouW8kjXrkHx8voUSqQn+av3//xKkS6wQG/grOUmr10je4XQxt5JBA/GAM6Rl3tgjdmw0xi
	ZTSMV3sPh/RAxPaFLCQoexIK5OgSolfL+GKUlkQ3sCvOSj/k7Cfo9TOFTJCn+CpP/wI9qtDhfNOgv
	BzREXe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI91f-00000006nNC-26bU;
	Mon, 02 Dec 2024 16:11:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8hi-00000006jGo-0Ssc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:51:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DFAE5C5838;
	Mon,  2 Dec 2024 15:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3F2C4CED6;
	Mon,  2 Dec 2024 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154677;
	bh=w3NWLI4KLgT4dwNTEWZOaquyn8q5LoNO7IbYT08kOhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1gACQe7pbQ63vIYvLOl2iS0pHLrxq/xlA8hsxZERrAbNjaAgR6SJ1HTYrl3kl0T8
	 GJ74eum+Eu3brFtUGevA4CH8viR0TUpPmbDF7hxhNN/hwWYZEnsTzotDYpYRJ+30i8
	 m+fKYaI95hrK0e8BH9la/CA/lJCrKk4y3dMx8ie6/hSrxm4y2Tl++2tFgyIg7zwUfY
	 Io3IHIsooK8PoAqjgXL5WNvgxXhro9B555GvFN8l8nIIil0QE6/ys966sGe/w9T1Xs
	 kSq7k1o0/Myl3cJGg7j5EAc1V/9RuPawhf4QGVogw2rVu2N1zIuIF2biXhlMA0JMKa
	 WwVrVZiKgTGRA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v5 0/5] Add initial support for QCS615 SoC and QCS615 RIDE board
Date: Mon,  2 Dec 2024 09:51:03 -0600
Message-ID: <173315466527.263019.11318467939121751784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_075118_187929_E45D726E 
X-CRM114-Status: UNSURE (   9.47  )
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


On Mon, 04 Nov 2024 17:10:07 +0800, Lijuan Gao wrote:
> Introduces the Device Tree for the QCS615 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - QFPROM
> - TLMM
> - Watchdog
> - RPMH controller
> - Sleep stats driver
> - Rpmhpd power controller
> - Interconnect
> - GCC and Rpmhcc
> - QUP with Uart serial support
> 
> [...]

Applied, thanks!

[5/5] arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615
      commit: 9eec6ce36b5dc981327e9f58025d012e524687b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

