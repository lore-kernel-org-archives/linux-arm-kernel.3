Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B0D61011
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt3DwzrEOQENRSQGjVMp4rVNQPFMrSkUxT73+crldJo=; b=bEBAdqbH/iPJXresgGyco0dJ5z
	S4RNfEqh87StAN9IeGDwSZOKoSKpsGMsg932sF8A4Ukyh7Fj4RLgeAIUNdcHbSaEBAm2uVwBYYgAh
	FVmZXjrmJ5uXt7SOdF0pJi5GNgiy6o6fFXAln8smnl3wb0OgC0w2pU8S0Pi05xlhOSMAUzobZBnyX
	jR5F4NWSTGUqIUtzcW49A+xurJGG/qCHWU9gUvxzORNebaQo3yX3GP/nmSdCLdfDznL3rXigrj0ri
	vmkNTe19n45D5byG7IZJkpYZQ6dr07UvwhPmpKbNX1c8nvORhy/cRpsbtffx6ldYvp8MnpRNXIA0h
	r6a2wvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRbx-000000007oQ-2AUm;
	Thu, 29 Jan 2026 12:59:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRbw-000000007oK-0VIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E2B6001A;
	Thu, 29 Jan 2026 12:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2AFC116D0;
	Thu, 29 Jan 2026 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769691539;
	bh=1Fj+r2uLORJAG+zkGC7tWDcZ0ldnTD7zhdJQF3oY6Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FxAXmH6Qvbo3zRUvnJ+U9dGn5nYLCWC5pdy6422pyarQsDG4fRggiQKjpeTGHrkSU
	 NCeT9Hzc2j2GU0huuHzHiQpV3zFTy0cbvSRkbe4kyz7KLrm/opkyogJ6W3bbmljQB+
	 ynBRzGOm8unqEMXHOuFXzxP79EAqfnXbNa8omxsvKPCyeY7109hzyeHjvE01hjQeBS
	 c/Tx1hE1KWL+6JEweAp1gK7mVl/gFYfDVr7IEXkBfdJlyd/5SP0YkRRb2mK/Sal9Pt
	 lgrEfouv7x740CtmXTrsHysTfo/To1i9+0MGzAAbMtDwMyhbwLSiAjQNHytDYJsw5R
	 DsauZy485BHHw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	david.spickett@arm.com,
	kevin.brodsky@arm.com,
	mark.rutland@arm.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: poe: fix stale POR_EL0 values for ptrace
Date: Thu, 29 Jan 2026 12:58:51 +0000
Message-ID: <176961836556.4090706.13306795344334749447.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127133926.2677180-1-joey.gouly@arm.com>
References: <20260127133926.2677180-1-joey.gouly@arm.com>
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

On Tue, 27 Jan 2026 13:39:26 +0000, Joey Gouly wrote:
> If a process wrote to POR_EL0 and then crashed before a context switch
> happened, the coredump would contain an incorrect value for POR_EL0.
> 
> The value read in poe_get() would be a stale value left in thread.por_el0.  Fix
> this by reading the value from the system register, if the target thread is the
> current thread.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: poe: fix stale POR_EL0 values for ptrace
      https://git.kernel.org/arm64/c/1f3b950492db

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

