Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF245CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcurvrki+PQ3hlCSbHx5X7PXrbv6IecB2gkgSChOo2E=; b=oMuR02afNIpoHg6OpeN7CUYy+q
	9HZ0JmifNTEsEn1NeNs16h31buJR6tcwjyoWaaG68ovo5KO/1WzLNeaNof0AXKhr/5uVTZTSXBFUV
	W4iShRYnzN0xtRR6L+u3nYAzghXmFrueVyjOIWoN7EEufxdWbD6FR0P2DF1nCyrOZTm7C3++PHvO5
	L+o3Br1ODJuWD+/TXGAtsRfKah6qBEZae7OCCCiMPQxA9YrFMIyHpmL46Jga7YSeHBfjfFFi98kdc
	ay6ZwFDm8ODNzG9kLZU2vEdOjgMv8tv1gnoB0BRr5uEmiIQGO+ncLGRgpmljP0X/sRNAdNQ8OaL+g
	eyFDjsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HlY-00000007KrZ-0cB3;
	Sun, 21 Sep 2025 10:58:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0HlV-00000007Kr9-1zZD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 10:57:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFD77404E6;
	Sun, 21 Sep 2025 10:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40ADC4CEE7;
	Sun, 21 Sep 2025 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758452275;
	bh=8Op61nzSpVhT7RNzCmXUhBy/d+AQXo4ddYpTYafvvqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMc2JFpawOs1NCf2REhhEkTHNX9fUpIq361qjmtT7U/BmpovsSDZ7s/QfreyO47SG
	 RykgxkEZjd3BzyMNOD7b5Dny4PRdXauRP3Xm2lPP1wXq2erStMj/V5ho428gMs7HIU
	 uTr8lW6HZewvWPsdvkZAkP1JNYseW3O57VoXGQtbVFFZoCfoirrCRqQeg2zApm1QPj
	 /4avlvMR+5c78M7VAjMH7+9AU7Ph7hKeP2SboLi3Fa+4I/eDHsJ5n3OxFQ4R2QerV7
	 Q+9AMhWw6MmY/LuxP2dEv6cHgcbpxDJsFPkUb2UlqvZa0CTUOcnhGxysnQPkh6K0uQ
	 CoJxK7ae7XwzQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v0HlR-000000089rB-0xoW;
	Sun, 21 Sep 2025 10:57:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 00/16] KVM: arm64: TTW reporting on SEA and 52bit PA in S1 PTW
Date: Sun, 21 Sep 2025 11:57:49 +0100
Message-ID: <175845226586.1792635.11249464012956393475.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_035757_555340_D6596976 
X-CRM114-Status: GOOD (  12.97  )
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

On Mon, 15 Sep 2025 12:44:35 +0100, Marc Zyngier wrote:
> Yes, $SUBJECT rolls off the tongue.
> 
> This series was triggered by the realisation that when injecting an
> SEA while on a S1PTW fault, we don't report the level of the walk and
> instead give a bare SEA, which definitely violates the architecture.
> 
> This state of things dates back to the pre-NV days, when we didn't
> have a S1 page table walker, and really didn't want to implement one.
> I've since moved on and reluctantly implemented one, which means we
> now *could* provide the level if we really wanted to.
> 
> [...]

Applied to next, thanks!

[01/16] KVM: arm64: Add helper computing the state of 52bit PA support
        commit: 0090c0a247cd3dc37181be4a9af4750ae3fedbd0
[02/16] KVM: arm64: Account for 52bit when computing maximum OA
        commit: 23cf13def0c87d9ce234f12eb6132f6bf9442f29
[03/16] KVM: arm64: Compute 52bit TTBR address and alignment
        commit: e645226a9c238db919d105d0ee7b4e09d80d13b1
[04/16] KVM: arm64: Decouple output address from the PT descriptor
        commit: df1d0197a2b939e28321686cafaead4a183980fa
[05/16] KVM: arm64: Pass the walk_info structure to compute_par_s1()
        commit: e4bd479884a1353efd43aa950c996d333145642d
[06/16] KVM: arm64: Compute shareability for LPA2
        commit: c0cc438046eed8d906ac917bc70a7284b6cc3f03
[07/16] KVM: arm64: Populate PAR_EL1 with 52bit addresses
        commit: dd82412c2b2b30bf4aa08ef069eb38c7795cd9b8
[08/16] KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support
        commit: 5da3a3b27a0108562547086e0ba7d9593f147cfe
[09/16] KVM: arm64: Report faults from S1 walk setup at the expected start level
        commit: dabf9f73fed86e096255c5be12c7e1d08a939c67
[10/16] KVM: arm64: Allow use of S1 PTW for non-NV vcpus
        commit: 14d4802dc22acf670333c8aad4e1931e7d6ee412
[11/16] KVM: arm64: Allow EL1 control registers to be accessed from the CPU state
        commit: cb1762904c5000220a0facf9bcab68ba687ec417
[12/16] KVM: arm64: Don't switch MMU on translation from non-NV context
        commit: 61b0280a670bdbb3a209ae474625f387788af0a8
[13/16] KVM: arm64: Add filtering hook to S1 page table walk
        commit: 0c5471408cb5c518bce76b851aff89719283a428
[14/16] KVM: arm64: Add S1 IPA to page table level walker
        commit: b8e625167a321138f83b1f6c99cf25d1290cb04e
[15/16] KVM: arm64: Populate level on S1PTW SEA injection
        commit: 50f77dc87f133b09db44a5bbfdd64b1ca83a8d8e
[16/16] KVM: arm64: selftest: Expand external_aborts test to look for TTW levels
        commit: 00a37271c8a68070dc64f81a5d64644beb4cef2f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



