Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88773C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBypZx28DGH1xHAdRgF/GPZt1kfDgjeZrLUDThEoBnQ=; b=Wb2O/nzLDrYukdxoht0Pclyvfq
	7qsvRfZk5/FrD7oUPiaGhNG8VoVY0uaQFlYlujQ3hUJpazGgSIGLEhKrbvdp1z+X9sid9G7lzYVxi
	Fg7OfwTNXy1EeVkW8NZy2H6EiMFw97l74jDVtJstqVylcuw5wPO5ejox+z4gu3UZD19plWKG3sASO
	c3b7LdipBaUV/d6tuzsSF9uGY+9Oo+5U6q6uDdu6YmzJOagK4zD+eVOsWPC1MFmUoVJ87hpE6B57k
	szMxHLNkKqtS4j6oUkUfpBCyJ47wnfLs6rJml1YkEdlJcpsqkiIzyuDxXTBnDpgf1N8SOM+xn8dA6
	AaJTRXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGO-0000000HWM4-29jX;
	Thu, 13 Aug 2026 06:50:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGA-0000000HWFv-1W9K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 061D74350C;
	Thu, 13 Aug 2026 06:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B399D1F00AC4;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603789;
	bh=JBypZx28DGH1xHAdRgF/GPZt1kfDgjeZrLUDThEoBnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X/vtw0oWy9/2x0AvPu5sBingZREkmoMrDXIxHyckkdhGlKIbCN0vtGsLCbO4jEiRO
	 GQfoMDm0UTAgTqN9HoG3Rd1vgY3jT6i0qQd7D3pwxrNqvAfxz2E2+dZx5tgqMAlJdp
	 Sek42X/EGho9OGfqL+r3g2CguGibQIA5ZCrBGHyxo4BFyKAidIFcm0uKDR/VxA3XDZ
	 QTtiFz0Jsq94+4oWA+oFVNHleQvoNOllqjTpyRlO7R2Mm2gmixF7CeK8ssytkrJxer
	 kZ3ed0+G6pwvLo2CPBPA8bt9q+ZDZWlOhZ4i0bvKEHqstvXt1EQ8X/jY59j6Wqf+bp
	 pt1eB/BjWnRtg==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Preserve GPRs for AArch32 CP64 reads generating an UNDEF
Date: Wed, 12 Aug 2026 23:49:44 -0700
Message-ID: <178660378174.666424.3801842450908120016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802182222.2239-1-kmehltretter@gmail.com>
References: <20260802182222.2239-1-kmehltretter@gmail.com>
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

On Sun, 02 Aug 2026 20:22:22 +0200, Karl Mehltretter wrote:
> kvm_handle_cp_64() only seeds params.regval for writes. If a CP64 read is
> decoded but UNDEFs, emulate_cp() still returns handled and the caller
> writes params.regval back to Rt/Rt2.
> 
> This can happen for PMU counter read accesses generating an UNDEF. KVM
> injects the exception into the guest, so the MRRC GPRs must remain
> unchanged.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Preserve GPRs for AArch32 CP64 reads generating an UNDEF
      https://git.kernel.org/kvmarm/kvmarm/c/47746d4b7436

--
Best,
Oliver

