Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+3ToxkDkXKSTYa3CW80v6cGbf1lnA9p9fs5IAEEyPQ=; b=HzcBg2bNiOPEHYRDZuLbe17RjI
	ENdaaZGgAxNgyoYZN+7ns0y0oAYacwh/h1/n9rWt66H9Hs+SnzJujnA1YkbtsRGTbEA8/ZwMx8z9d
	fM50BqiqNZNfZeKQA8ImxHMgRsLymvG2M90N8pDlV8gxMeFjGlfdvHK01ZVCgwxKjFz65rib3eOog
	SsPadxV3TF0bNkdo0UJ0lmqft9UjE+UoFZf5fJnwMi2A0eCg/oaQZkRphgKTFzRABRPTpKbWniQLO
	Bg9ash6bdC/r54iWofin9+axYQu/0/AhSpSAW8NfjX9akekW/stMc9E+56M4dMVZPcXIq87R9551A
	hqIxTFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVO-0000000E5R5-20Hm;
	Wed, 15 Jul 2026 07:58:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuVD-0000000E5O2-00bk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:57:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4333A601ED;
	Wed, 15 Jul 2026 07:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C099A1F00A3F;
	Wed, 15 Jul 2026 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102278;
	bh=k+3ToxkDkXKSTYa3CW80v6cGbf1lnA9p9fs5IAEEyPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HTutL9NdcqRpRYT54c12udtzTJi3wGe5m4SOk8p5hKYZ+njZxCfKpYXpQogx46YMU
	 YDCEWW27ssqY6Xp8oW5rc763DtqXXg2ad5YkwPx4l6Irl6thyCrGezaqfUiKpYV5Ul
	 VwY7S1/N9PPiVG2IH59estqB1Ps9fq4obKlm/nIRRGOAWpNtV3rfPFVV+ssy6Lg84H
	 PFtrD3SnfBXnvMx9ELNfRagL83EcByE5xgSIBKG4vykWbjjd1unuBfiPP4wVnm2dcY
	 yv7Fn42DMtfzhujvqJ8EGCH0A/AtALR1A72nIdQVOPHUjoVna8+qpp++Vp0UyRXy+N
	 hEag4wR/VOnZg==
From: Oliver Upton <oupton@kernel.org>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	seiden@linux.ibm.com,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	vdonnefort@google.com,
	tabba@google.com,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v2] KVM: arm64: Avoid naming collision in tracing
Date: Wed, 15 Jul 2026 00:57:55 -0700
Message-ID: <178410226171.1693421.5370206670309948931.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713141320.4065600-1-smostafa@google.com>
References: <20260713141320.4065600-1-smostafa@google.com>
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

On Mon, 13 Jul 2026 14:13:20 +0000, Mostafa Saleh wrote:
> When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> defines a static inline stub for trace_clock().
> 
> However, trace_clock() is already declared as an extern function in
> linux/trace_clock.h which is pulled in EL2 compilation.
> 
> If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> is disabled (by including it manually in setup.c) it will cause:
> In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Avoid naming collision in tracing
      https://git.kernel.org/kvmarm/kvmarm/c/007e0f0fd9b7

--
Best,
Oliver

