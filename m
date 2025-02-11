Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A42FC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR937MKov7698ZKKXNDbmvVpccCMvHeGhDEc93munOk=; b=QOSiOzG0qCQpHeli2A8MMJtHad
	LGGFJAHG+1tPYdYkkVbbYzHz53vyReAzzCyWzGAvCAayBTIHxJChs5gEc70/hXSgscVjd+MHwwFWH
	fUE5CMg3u79oUGAkjWAlh9kp3/zr2BaZeBhCFq9Y3QVUs/9cFNsDF8coW80oWEF2V7R4DI4BmWPm1
	/YHXJTFtDxqPcCFuK4ohPGiZDbHzsRhf7L90mw4vfjVdD/q73XvOZmj3ncK+lPA/0pXDHrbB6hEa/
	q9vd+HRGUU2QsaYk1peOHVZUWhbr+HDbIJpeiPOD6gWIcL24q206W//dOgmc8V8plqbX0pRV7JZce
	tIbv+sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho43-00000003T4R-2e8e;
	Tue, 11 Feb 2025 11:04:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnuC-00000003Qtr-0Y65
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:54:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861D95C109F;
	Tue, 11 Feb 2025 10:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53B8C4CEDD;
	Tue, 11 Feb 2025 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271254;
	bh=gvR5Gc98h3L06ABJw2i/dOoJfPGho486AqmDRVgdMOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFSyAug4djM4VTvlW8FibumaKBvYyycTQ4EuBGQg8H5bkMvWCWMXnONvdHt9B5GFN
	 frKMeJW+8w7G1xoiQ8pt8HXhKr2tYRgSTe3qyynJDGh24UhvdfCsKtQV+KR7YBi8le
	 5diAMPikhsHrZSQl+TkZP0MHa42H5WEVw3PpoIbTSe5X1p13cJIwaSbrfMciwibS7U
	 4Cxb4ykpw3hkE1hZKRnB1LoNd6558478BJs4sy5ONvOV8Dw5f41i2YMROyaefMkbJz
	 rcwGCRmeMbGRN8qYD36jvOVbM4UIN4rAX0/0GWyYTtwrkJYKR7f5QREt8rlkzmpZbs
	 8qluE4hc/fEfg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thnu7-002wLB-Uj;
	Tue, 11 Feb 2025 10:54:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	eauger@redhat.com,
	eric.auger@redhat.com,
	fweimer@redhat.com,
	jeremy.linton@arm.com,
	oliver.upton@linux.dev,
	pbonzini@redhat.com,
	stable@vger.kernel.org,
	tabba@google.com,
	wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3 0/8] KVM: arm64: FPSIMD/SVE/SME fixes
Date: Tue, 11 Feb 2025 10:54:08 +0000
Message-Id: <173927124349.2205649.5810375580627240253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210195226.1215254-1-mark.rutland@arm.com>
References: <20250210195226.1215254-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, broonie@kernel.org, catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com, oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_025416_215272_02C43309 
X-CRM114-Status: GOOD (  10.45  )
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

On Mon, 10 Feb 2025 19:52:18 +0000, Mark Rutland wrote:
> These patches fix some issues with the way KVM manages FPSIMD/SVE/SME
> state. The series supersedes my earlier attempt at fixing the host SVE
> state corruption issue:
> 
>   https://lore.kernel.org/linux-arm-kernel/20250121100026.3974971-1-mark.rutland@arm.com/
> 
> Patch 1 addresses the host SVE state corruption issue by always saving
> and unbinding the host state when loading a vCPU, as discussed on the
> earlier patch:
> 
> [...]

Applied to fixes, thanks!

[1/8] KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      commit: b671313b36591cab3d4cb4fe40ffdbac213635d1
[2/8] KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      commit: f000c2b1bcb471e35bb65cc0f0c31cb18d8677d8
[3/8] KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      commit: 82695cf636f155917eae61b9f86565184a683d76
[4/8] KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
      commit: 8adb7db3c85f917ca59a76205e4be1ee82a289da
[5/8] KVM: arm64: Refactor CPTR trap deactivation
      commit: 1afdd3f832570aa27ae82819020bd319820337ce
[6/8] KVM: arm64: Refactor exit handlers
      commit: d59128af7ac954f80636548a60f1b1b41a7d067f
[7/8] KVM: arm64: Mark some header functions as inline
      commit: 03ce3e0db4f42252de4eeae01c5e5fa832af7585
[8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
      commit: 9a053b84b508b32b824d4a088cf3f5091a3e7c15

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



