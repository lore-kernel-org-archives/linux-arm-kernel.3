Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA0EF532E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXBQfE+qIq4iKBPJA5WNcQ9bvTOgUSypfCQq6gDNnJI=; b=icTjyVMW+EdRRTM7pdyYgg7Feq
	wian5Mtd6Q9aVjAtelcKqeNs2StrdbjEJe5/xnKK2WEmCUXjApGnjokF/qRfNVww2QUE9bVT61dbt
	3iQrHvH1MG4+KYx5RBVpBYd85bPYCf7+z8hD/RC+bEXxo827mHr19YqEVaRB669gaYrvEjAiYO7SH
	TUlvri4OPoFnhfMFULTaIW9a/4SU80OyZaey/5LEwJdj2gFHjIYTNWzspROBJGhX/NCvPCygYiyzP
	SiXP5rQid40hF+zW+dAnr/dZdNPxkMAGwyafxcLGnTznS648NAorx/F1VXEUd/d26xc7XVKd3I6GY
	7MRotKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvi-00000000dYY-2Z0F;
	Tue, 24 Mar 2026 06:07:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvc-00000000dQ0-0uho;
	Tue, 24 Mar 2026 06:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D93B4419C8;
	Tue, 24 Mar 2026 06:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1BAC2BCB2;
	Tue, 24 Mar 2026 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332467;
	bh=6+dvKOT4g/k0Y///kbeYb81X6mcfuooOow0a3vXI29s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C/ypJECeek5S8XTR2ocF92FlRbSJ2HwfE0y5yOQ06i3e4bmUASX+VJ1yLNKS85vWf
	 ZiH+KDcEdZ7N49IKaVpGPfNsPZ4lUwTiFmeSgtwn4KYdqcjSV2/FGzf3o7OKapXsyE
	 lbNUQu4TTSRMfh9MZ4ed/OBBomg8FbyS3cJBnROn6HtDNHw3VIaQ18MUwwdNONfpIk
	 npFVs//XXQS//chpaamPdTs5CyJwVgKU/C/noyccoChE1RdVmh/EaHc/h/NGilrEdX
	 eyzwi3E7gr2Bk6PUDqK547mfVSKlBgk/iaOEL78kRAbw7CjrA38kAnBOoTRuhAIf1A
	 7lR2HrP6b5QMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CA83808200;
	Tue, 24 Mar 2026 06:07:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] perf regs: Refactor use of arch__sample_reg_masks to
 perf_reg_name
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245578.469836.9909443703543629128.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:35 +0000
References: <20260121021735.3625244-1-irogers@google.com>
In-Reply-To: <20260121021735.3625244-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, jolsa@kernel.org,
 adrian.hunter@intel.com, james.clark@linaro.org, john.g.garry@oracle.com,
 will@kernel.org, leo.yan@linux.dev, guoren@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 shimin.guo@skydio.com, atrajeev@linux.ibm.com, stephen.s.brennan@oracle.com,
 howardchu95@gmail.com, thomas.falcon@intel.com, ak@linux.intel.com,
 linux@treblig.org, dvyukov@google.com, krzysztof.m.lopatowski@gmail.com,
 ctshao@google.com, aditya.b1@linux.ibm.com, haibo1.xu@intel.com,
 slyich@gmail.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, dapeng1.mi@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_230748_279875_AB8EE0A9 
X-CRM114-Status: GOOD (  10.78  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Tue, 20 Jan 2026 18:17:35 -0800 you wrote:
> arch__sample_reg_masks isn't supported on ARM(32), csky, loongarch,
> MIPS, RISC-V and s390. The table returned by the function just has the
> name of a register paired with the corresponding sample_regs_user mask
> value. For a given perf register we can compute the name with
> perf_reg_name and the mask is just 1 left-shifted by the perf register
> number. Change __parse_regs to use this method for finding registers
> rather than arch__sample_reg_masks, thereby adding __parse_regs
> support for ARM(32), csky, loongarch, MIPS, RISC-V and s390. As
> arch__sample_reg_masks is then unused, remove the now unneeded
> declarations.
> 
> [...]

Here is the summary with links:
  - [v2] perf regs: Refactor use of arch__sample_reg_masks to perf_reg_name
    https://git.kernel.org/riscv/c/3d06db9bad1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



