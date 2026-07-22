Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FAC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A14ppm5s1tdrlsW/OlHvzkknoaEf+T+jw9oz7qfeSvE=; b=vL1Zibk9wa6vR3TwyITUmyUS3e
	ksrtZP+31yoeZgcFBWHQMV3ghfH9TcrAzNqHZaK3a8/nwmbY03a6mY+OOAncU+DTMmG8qqnsSljef
	0NlVi4AiUnMLtWDNAvClFA3DzLI1wwyjawrPZV/6MRtFlqt09rCZ+a0n2LndrXpB7WaD7HUrRrw8S
	FRFNfZO/NTLoug3qPgsT23q7yc8TiFD+79GtEjT51hOVaL4y+AZ6Q/hwjaSp3NBu9P/va6cELUsS4
	8rloBeHgHpayGRt219tifNWokxuupKMDKfO98QOQED8HhAu6VTo95SnMNNzIChIF9BR/oNQsLkv62
	QIcW2uVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEs-0000000BEWj-3gpa;
	Wed, 22 Jul 2026 08:23:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSEr-0000000BEWP-2Y2w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1852541351;
	Wed, 22 Jul 2026 08:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735B41F000E9;
	Wed, 22 Jul 2026 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708615;
	bh=A14ppm5s1tdrlsW/OlHvzkknoaEf+T+jw9oz7qfeSvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/Jb9GJs/idWGsjadocqbEp6fF0jbCsip9MABnnd6HtnhvyGdIsSr1hkRxIHVvH9K
	 RBbCEtRciFzLvXKQ43w/l38tbNC29xgYOqSdXImJ6SiwF+b9cjKPWejq/fDhFfpPw/
	 2RV8un8hXB/myo5CkB83QDucwlPp1MVd4hbDanUa3jJLdkDWeBbcNeQhkAKMEC+x3Q
	 2ArxToAHEDeMqTjSoeeMY2kGzM0F2N14Xb7HsmBYhhaSomANRe9j+yk6em6B3lCBTK
	 eD7svQwQTV98imDn5ZNpjEBg6sEIlMHlxj6URBOWl4no5j0zYaIMwVVGA7G6OUAf05
	 exXHnJq01ONVg==
From: Will Deacon <will@kernel.org>
To: mark.rutland@arm.com,
	james.clark@linaro.org,
	yangyccccc@gmail.com,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	rwiley@nvidia.com,
	sdonthineni@nvidia.com,
	mochs@nvidia.com,
	nirmoyd@nvidia.com,
	skelley@nvidia.com
Subject: Re: [PATCH v5] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Date: Wed, 22 Jul 2026 09:23:20 +0100
Message-ID: <178467005826.101695.3006121587111968763.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608234135.1856911-1-bwicaksono@nvidia.com>
References: <20260608234135.1856911-1-bwicaksono@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Mon, 08 Jun 2026 23:41:35 +0000, Besar Wicaksono wrote:
> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
> in WFI/WFE, which does not align with counting CPU_CYCLES
> on a programmable counter. Add a MIDR range entry and refuse
> PMCCNTR_EL0 for cycle events on affected parts so perf does
> not mix the two behaviors.
> 
> Also keep PMCCNTR_EL0 unavailable to EL0 direct counter reads
> on affected CPUs. When userspace counter access is enabled,
> avoid setting PMUSERENR_EL0.CR for PMUs that must avoid
> PMCCNTR_EL0, while still allowing direct reads from programmable
> event counters. For 64-bit userspace CPU_CYCLES events on PMUs
> without native long event counters, reject the event if the only
> valid direct-read path would be PMCCNTR_EL0.
> 
> [...]

Applied to arm64 (for-next/perf), thanks!

[1/1] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
      https://git.kernel.org/arm64/c/49f2413f9b55

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

