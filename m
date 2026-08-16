Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA57C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E22bAb27mfMqnbRiG04AZdJeCfsHv2IcYh0cVnbi8Vk=; b=zE0WAZmoPHMXmhAUfdfRT82dm1
	zswvddQaXUDugXe8FnbWwdd25ISchrPSrqO0DXnC+I9LkVcdnAgchrcjbaJTAYm4MwitAmbUsnyhO
	1JY4wh/FfKpnvn+vSJ2V0SzY5HFZJEsCRfVNPw202Af8OlJgn1vOojCWc5S5k2f/hfUgOVEX0pEWr
	fJTYOSAxZnIH51mR+XJoDZMJjLvCeRY5upLewsuZI97sryJrzT/cLsllYmC8HR0RNMYU5MPG7aDqp
	9OtB3YChQb+H33HvXaEzUV4j9V/Lf0bwrYI7tSsVxyGAart7wdkaVEnuZmywGCb8AF6joS48D3qHt
	sKwU6UxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveA7-00000004uJ2-2NNq;
	Sun, 16 Aug 2026 16:56:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveA5-00000004uIw-27mX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 16:56:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECE1B60120;
	Sun, 16 Aug 2026 16:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2391F000E9;
	Sun, 16 Aug 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786899399;
	bh=E22bAb27mfMqnbRiG04AZdJeCfsHv2IcYh0cVnbi8Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MoTWVWmF1j3YIqeKXe6Zcl3S0IhuZuEXW4jICpFS155i0lG9Qduxj7ysRpwX9Rgoa
	 ED7J//lF0Bnks4pHOgZHXMMwA5nvtc2VY5nxlyHyT3QklK20SQAQTJuLmaZZaFsNBr
	 aFrIdXvX/J8uhi3M6tdpTAqhNH4D+J5vLvfng/llZ69dSBB5V6OdohPrhwnc8jYF3i
	 g4Zt4UEY3jah8KoVVRCUFF7NFE8BxjyNyHDgpodZcBjbgORLHg1iutERtC9A6sElQr
	 AACpNqLU/y15qDx76bzdFvhg8CMvrYlKKZuTj0LsSE274QrxQzlEKKIyWufwrXs62J
	 zoUQ/yrdU7xTg==
From: SJ Park <sj@kernel.org>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	will@kernel.org,
	mark.rutland@arm.com,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	kunwu.chan@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] mm/damon/perf: add ARM SPE AUX backend
Date: Sun, 16 Aug 2026 09:56:30 -0700
Message-ID: <20260816165630.84808-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816142222.689624-1-kunwu.chan@linux.dev>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello Kunwu,

On Sun, 16 Aug 2026 22:22:17 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:

> From: Kunwu Chan <kunwu.chan@gmail.com>
> 
> This series adds an AUX trace-buffer backend to the DAMON perf
> observability framework, enabling ARM SPE (Statistical Profiling
> Extension) to deliver hardware-sampled access reports into DAMON's
> existing SPSC report ring.

Awesome.  Thank you for making this.  This will make DAMON be more useful on
ARM machines.

> 
> Patch 2 touches drivers/perf/arm_spe_pmu.c to expose the PMU matcher.
> This change is tightly coupled with the DAMON AUX backend.  ARM SPE
> PMU driver maintainers only need to review patch 2.
> 
> This series is based on the Ravi's hardware-sampled access reports 
> branch [1], and depends on the perf AUX kernel-consumer RFC series [2].
> The dependencies is not upstream yet, so this series remains RFC.

Unfortunately I haven't had a time to thoroughly read the dependent patches.  I
believe the basic idea of this patch series is aligned with the ongoing DAMON
extension roadmap [1], though.  That is, this series is supposed to be a part
of the milestone 3.  We are currently at the near end of milestone 1, and aim
to complete milestone 2 by the time around next year's LSFMMBPF.

I will hold review of this series for now, and take more time on making
milestones 1 and 2 for thier planned delivery timeline.  Sorry for being a
bottleneck of your work, and thanks in advance for your patience.

Please feel free to let me know if you have specific parts that need my review
right now, though.  Otherwise, please make sure this is aligned with the
roadmap until we finish the milestone 2.  I do want ARM SPE support of DAMON.

[1] https://lore.kernel.org/all/20260525225208.1179-1-sj@kernel.org/


Thanks,
SJ

[...]

