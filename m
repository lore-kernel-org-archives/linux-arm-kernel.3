Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135DFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h/BaKRTPYdLXDxNQmGYix2G3Kidpo6pHZzmvCG51PA=; b=gEVDPzJj8Gb/ljQvUJ7xum79P2
	J+UADgkvpS58go1orkUqUCxTmJBr5PUSAdIM++mbgOPE0DVycyPaNkeKC+ixVIX2XBLqp2CmruV8+
	QI38CUXn25OgdSaySlXcgVrdOKyDey8yXqJzKgFCGI0KowJeSuXEOeWX7SBrRD+OIHcMoZV6rIGEB
	xzn/iP/p/lEqPsXerRd5Ikoe7iXa5DvoeMp21JG5GyjQ1QFJrN4NpkzLvCJaMMJK5dMAKbhw1OPTx
	tDsZgPs+8yrzgchdMt9rJ+S2PT1dFPpNk7LJvE/ID65EmejBMoU3UxE6el7EcoIAFD3q2bzKYINl8
	Wqs456Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UC4-00000007LbP-3DoA;
	Mon, 28 Apr 2025 19:31:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9U75-00000007Klx-1sPs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:25:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8D20614AE;
	Mon, 28 Apr 2025 19:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B96FC4CEE4;
	Mon, 28 Apr 2025 19:25:56 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	daniel.kiss@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tamas.petz@arm.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH] arm64/fpsimd: signal: Clear TPIDR2 when delivering signals
Date: Mon, 28 Apr 2025 20:25:54 +0100
Message-Id: <174586835122.250615.2378305002313638533.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417190113.3778111-1-mark.rutland@arm.com>
References: <20250417190113.3778111-1-mark.rutland@arm.com>
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

On Thu, 17 Apr 2025 20:01:13 +0100, Mark Rutland wrote:
> Linux is intended to be compatible with userspace written to Arm's
> AAPCS64 procedure call standard [1,2]. For the Scalable Matrix Extension
> (SME), AAPCS64 was extended with a "ZA lazy saving scheme", where SME's
> ZA tile is lazily callee-saved and caller-restored. In this scheme,
> TPIDR2_EL0 indicates whether the ZA tile is live or has been saved by
> pointing to a "TPIDR2 block" in memory, which has a "za_save_buffer"
> pointer. This scheme has been implemented in GCC and LLVM, with
> necessary runtime support implemented in glibc.
> 
> [...]

Applied to arm64 (for-next/sme-fixes), thanks!

[1/1] arm64/fpsimd: signal: Clear TPIDR2 when delivering signals
      https://git.kernel.org/arm64/c/b376108e1f88

-- 
Catalin


