Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0F9C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KTNxMlIN0pnUs3TRuIuX660Ecy/2UP8DgaHWLgMlGk=; b=dwqxHEb1ffPSoldxJyiCEkN+jX
	LKa7tnTOf5pVTWMfXI69UxFPLdgEGH/tCLRS5+cwlT/P5ICqm8TzUNd8XF3vgj3s6w6wZo3yb2g8U
	q2DDh6/6gPOPNmlxdf7oLOysODIaJX8wCcWS1gw+iq1Mo6rArY4A5c2sYdq4pYS5eocTgzn2mewg2
	N6kZu0/pfA1AElyhtlCxlPcRe51vXtvp9xYhLb2I9bvIhtk66s1lFZEErLnLC/7KwgM2MH5iTielT
	5bg9PYNtQzJeHK+vJcsfC/EhmHUYBOUKeH4ORJfVJI2tXFlKFQZxZS7Lrbw1mJn86IWNuKApe1Xf7
	mA716lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKp-0000000DPn2-1Dfo;
	Fri, 31 Jul 2026 18:51:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsKn-0000000DPmF-42Wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 18:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82B40435F4;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8C81F00ADE;
	Fri, 31 Jul 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523913;
	bh=8KTNxMlIN0pnUs3TRuIuX660Ecy/2UP8DgaHWLgMlGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eUKHKA1wuLnW5C0nJ6eCTWgN2NNB2COcAONC9dmowBvJRyotWWR8nJjY800XArEqm
	 ShwKrH1J/wpVbLwroRnNcWXS2yTGwg+Xmn1DG0kfYC/i9lqP4XQC1LyQguPB2rBJW4
	 LvAyR2GZISsiCYTTWJyK2hyGmHHWUnTUEraodNLsn/YhThYMIliE28HLD3aeUSnDrp
	 hXzLGiV/dfTSLQaAFJrW3bK/JOxT81dKGG3NQ+fHJHoG5i6WbVy2lnEvSG1uYkQM3o
	 Dn7yZytY4lSMzlxVyDiFZZ+FV2g9hKegE2LYD3Ypc+7ccfI49uPxsAZo0qn+rf7+4f
	 vuM3y+awkqg1A==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH 0/2] KVM: arm64: Fix host-directed debug for non-protected pKVM guests
Date: Fri, 31 Jul 2026 11:51:45 -0700
Message-ID: <178552142330.30097.7850333849629828287.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726143643.303456-1-fuad.tabba@linux.dev>
References: <20260726143643.303456-1-fuad.tabba@linux.dev>
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

On Sun, 26 Jul 2026 15:36:41 +0100, Fuad Tabba wrote:
> Under pKVM, host-directed hardware debug of a non-protected guest
> (KVM_GUESTDBG_USE_HW) and userspace single-step never fire.
> 
> When the host owns the debug registers, the world switch loads
> MDSCR_EL1 from external_mdscr_el1, where the host's MDE/KDE/SS bits
> live. flush_debug_state() copies the guest's debug_owner and the
> owner-selected debug register state to the hyp vCPU, but not
> external_mdscr_el1, so the field reaches hardware as zero and the debug
> exceptions stay disabled. Patch 1 propagates it.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Flush external_mdscr_el1 to the pKVM hyp vCPU
      https://git.kernel.org/kvmarm/kvmarm/c/119a9a23fbae
[2/2] KVM: arm64: selftests: Add a userspace watchpoint test
      https://git.kernel.org/kvmarm/kvmarm/c/3be99f8751c9

--
Best,
Oliver

