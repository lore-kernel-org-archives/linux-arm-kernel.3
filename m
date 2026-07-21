Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40601C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4VW3Zl4tM8OMhekRjLVwl1T8VLsGUrJuwlMfWx5k8o=; b=yfsRQ/Y5hKMYxKJGqHaUesoD8Q
	8G8ClOj3KyKvoJ9bkpfC4vBXQPf2gBBGdTd3BiIIp+qH/j5B5xt7l6BqSHyP7PRfGU0VyAZG/pwa3
	u+W4t2+x07Cw50CSJc71oKjRv2etF3IGhX7JYAEh9vSLfEiowP4Ak1JMLlYzlGKR9Noki6lUkSo68
	tGLntlUZUADQ3Jua2l8ZaxLK2gbLjmxPRQ07wM7+mtGjwuRfTODJSJ2b8FBAd6MHVmCe8aFcVw1Hg
	Mf0C2qGglsxSDeXqk3jsD8iGwD9H7dVb0+7ZXpu8XZl9B/9SDjJuelS0HRNO5a2Z6CFxqP/pITyp7
	AzQyn7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFAm-0000000ACTi-1AAO;
	Tue, 21 Jul 2026 18:26:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFAl-0000000ACTU-2ZG3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:26:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55FB2417E0;
	Tue, 21 Jul 2026 18:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051AF1F00A3F;
	Tue, 21 Jul 2026 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658389;
	bh=k4VW3Zl4tM8OMhekRjLVwl1T8VLsGUrJuwlMfWx5k8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kjFng8c+xvne2cPnxtse0Hq0rrqrs24bVcFmakyTk1pzLZYgOeEuvfzKiLrrEOqYD
	 RSJH9GITWED9B6WMRRzFISbdeGGj+tRAt+91cM9dnJ0OuJsItKumTQzE2JlrjHn3+6
	 70gSPA6dKhlKckr7xiGNDyTVYd51+VAW371DA07gGdk6/RAcRUeRCIB+39mIM1wUEi
	 1CmYxvkw+M6W0Z69u/BMg8lDrJyBCbk1O00Os2M3OVnJh18NVZT/9j8c2G/2dcT2IY
	 wmEJUElK+RRAS/kQ+d9YDaTjD0cwUCjVMOyaVUMhjBvrP6NF0OmLIjgrWUOa0Qk1De
	 MIhZQ/ULYij/g==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Sync SCTLR_EL1 when injecting an exception into a pVM
Date: Tue, 21 Jul 2026 11:26:26 -0700
Message-ID: <178465838257.2067495.10864103489169140924.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721161624.3983041-1-fuad.tabba@linux.dev>
References: <20260721161624.3983041-1-fuad.tabba@linux.dev>
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

On Tue, 21 Jul 2026 17:16:24 +0100, Fuad Tabba wrote:
> When pKVM injects a synchronous exception into a protected guest,
> enter_exception64() reads SCTLR_EL1 to set the new PSTATE's PAN and
> SSBS bits. pKVM refreshes VBAR_EL1 from the live value before injecting
> but not SCTLR_EL1, which is untrapped for protected guests, so a guest
> that updates it and then traps takes the exception with stale PAN/SSBS.
> 
> Sync SCTLR_EL1 alongside VBAR_EL1.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Sync SCTLR_EL1 when injecting an exception into a pVM
      https://git.kernel.org/kvmarm/kvmarm/c/596289fe4836

--
Best,
Oliver

