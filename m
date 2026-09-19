Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE00C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 18:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9vVM2tMTDcLQ7MTmdYRaKZNtkheWY0pH5YNF/l7tWw=; b=4XINxnNlkdrH6Ls0PE1hkCXcsQ
	T3Rv4IaODfrePZmpuPPGTT2/g0hkSrXqpyFjPaMZgMXuM+25/IlWAALPcgPP3SgVnu199D4m0s9Pk
	We14Hd/PrE1h0dwgA0pDBlCTOB3xq+3yDdOH+aNJ6EDH8cOh7nZzacZs/EaB9obuc1fYvRkkOlVrc
	toUWmcUeGrTKedxhr0TWvHn37kJb9kymEvq1+EkrohN9yXmQ+u4ic/CLbj53JoJFLe6Or9Dm2lO+V
	2o4VmuVZrc90rlVwZBcei+9jCcxtNmbhp4NvDOItB9NQw92IcJ7M20wOruWFkfkDlLfBb1kQ7vDv1
	h51L1WbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zWy-0000000GZBp-0IR9;
	Sat, 19 Sep 2026 18:11:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zWw-0000000GZBi-2bIh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 18:11:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C510860258;
	Sat, 19 Sep 2026 18:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C7C1F000FF;
	Sat, 19 Sep 2026 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789841477;
	bh=i9vVM2tMTDcLQ7MTmdYRaKZNtkheWY0pH5YNF/l7tWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UQq4YRL8vpyzhOa3jR+GwyVRYi9UjMAhG3+Ueip91Q+T0OctKW9a/9ofnXFXcR35Z
	 MwaUC1lnh9dIsnkhN6CUgiOaZn8U4zB5v/aq2/jF8JsvCj4cSWGQBoZCsi3c6fgtfl
	 pbWRHt9/4D66jh0HjRdxo2Q7isbXsNlFPJ3WERYPBAtDyItbnoBoRphq9wXpi6U1vQ
	 qrV9rQJW5JoMaq/UMooOQtToSQOlj/ng8xe1tvdS/kLPq4ZtwVmxSwTm0ikdzLHYpY
	 /fynCZoYyZTtlr3vzfsXV+YLCeN1xVOMNncmXhGkq7Cj0TwuWjuuyM+TmJbKfmXuXA
	 kkMVwbnhVf7wA==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
Date: Sat, 19 Sep 2026 11:11:14 -0700
Message-ID: <178984145401.38162.12449211285441501967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810005616.13227-1-kmehltretter@gmail.com>
References: <20260810005616.13227-1-kmehltretter@gmail.com>
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

On Mon, 10 Aug 2026 02:56:16 +0200, Karl Mehltretter wrote:
> The consolidation of the breakpoint and watchpoint register accessors
> switched DBGBXVR<n> from trap_bvr() to trap_dbg_wb_reg(). The latter
> selects backing storage with demux_wb_reg(), which only handles Op2 values
> 4 through 7. Since DBGBXVR<n> uses Op2 1, an AArch32 guest access hits
> KVM_BUG_ON() and marks the VM dead.
> 
> DBGBXVR<n> aliases DBGBVR<n>_EL1[63:32], and its AA32(HI) descriptor
> already selects the upper half. Map Op2 1 to dbg_bvr[] alongside Op2 4,
> restoring the pre-regression behavior.
> 
> [...]

Thanks for pinging, this slipped between the cracks.

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
      https://git.kernel.org/kvmarm/kvmarm/c/239763bda716

--
Best,
Oliver

