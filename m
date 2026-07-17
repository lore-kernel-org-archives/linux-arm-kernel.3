Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74DBC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT+bu1nR22jG3svg0QpVCjdccwM9QhJkJ6q8Ga7Koes=; b=IToZ6A5J0n0d92
	Wk+dM+OLTEwMD0rvTyzqMP+mg2OCHU8eoJ83Okb9h1RtGpO9SVlJEGduWHLcAR4Ky1sy1nt44Eh1f
	bMAm+G5vwxY1UpJXpMFxsXoADaNQCuBHu7aRB4XXc8gjZXgMzjq9j8kAkAnVhlS8GWaEhNURyOxoc
	+/ehcp5O8gq5KlcwX0y5DHWboD1h9tTDrDwJ7e0T+HEggqPyqRSklvHQwF7305k0wXcnv63SNQF4L
	sMhw000P4KFe2uBRMWx2EX9/2RnBPQ5TAwvSMYEDpSC/3XhdzX1OrrFilwSwRPXFfcmPTLDTFwkuJ
	RIWW1Y3Bax+TuxuisBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDR-000000030Na-2UzK;
	Fri, 17 Jul 2026 18:23:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDQ-000000030Mg-27wJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 18:23:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F327144003;
	Fri, 17 Jul 2026 18:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EBC1F000E9;
	Fri, 17 Jul 2026 18:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784312595;
	bh=uT+bu1nR22jG3svg0QpVCjdccwM9QhJkJ6q8Ga7Koes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fTvyY7exskBBJ3sUMf7tkQM0dXLp4Dh0gFJeCZ2keVBp63ziyBOWMRgcJeb6B9SyN
	 do2nre2RWPxsnPr3MebejaKtdWGRYlNTDpR9gNr/HH1UjilUShzt1D6EtGiT00uCDM
	 RVswumwHYRggaXROvnppkQYDkTzJgfHUqwInlWm3oZzWjedQ/WvgEX12dgVAqhE1f1
	 txw1yYJhxsqBmGZqJLsx4IMP9Zs44hlusOa5YtPvuMvLCXwJ/cz31wgXpT+KWOIcb4
	 AkCC54qvbKqgf9HfRwM+p79ys/3c9VcEamZIluViubR0pygNmx/ghpDG2ad7/0orer
	 qr3Er2wpG8syg==
From: Will Deacon <will@kernel.org>
To: mhiramat@kernel.org,
	Pu Hu <hupu@transsion.com>
Subject: Re: [RFC v3 0/2] rm64: kprobes: Fix single-step fault and reentry handling
Date: Fri, 17 Jul 2026 19:23:06 +0100
Message-ID: <178431138979.1463087.7670145018336150916.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710063242.228714-1-hupu@transsion.com>
References: <20260710063242.228714-1-hupu@transsion.com>
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Will Deacon <will@kernel.org>, Jiazi Li <jiazi.li@transsion.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, naveen@kernel.org, yang@os.amperecomputing.com, kernel-team@android.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jul 2026 06:32:52 +0000, Pu Hu wrote:
> This series fixes two arm64 kprobes issues observed when running
> simpleperf with preemptirq tracepoints and dwarf callchains while a
> kprobe is active on a frequently executed kernel function.
> 
> The crash happens in the kprobe debug exception path. While a kprobe is
> preparing or executing its XOL single-step instruction, perf/trace code
> can run in the same window. That code may either take a fault of its own
> or hit another kprobe.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: kprobes: Only handle faults originating from XOL slot
      https://git.kernel.org/arm64/c/879a6754d3d1
[2/2] arm64: kprobes: Allow reentering kprobes while single-stepping
      https://git.kernel.org/arm64/c/23f851ac0078

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

