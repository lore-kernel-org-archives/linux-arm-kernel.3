Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DACBC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bygnlyduWNX9bGl+OAOhRpG2bzPfJz7Wo7gATpHhbZ0=; b=krRLKqLlAoty1NMRHVb375dFAx
	LMPJPUfIZ2luXW5nqMLL2ox+zP5EssiFaiEJh/YjMxzzh/c/Wri3qBG1csjwkbUYYBsrqqBnQrLmo
	tw+DUsxcfauWtMmdFCZ6qY4Vu8ETP4Tl9+5jiJxl5NfO6oTYx8IUKuqXxJ2fAgelzPJW2FINYOWu6
	ttBTnjO4vbgpR8Rx/KxjC04hENBIdj2xvTWbGS9aZfrsNOsO60zFsdwY+ZHWzc2nX50dgY6X9du1A
	lq/bMsbRWXubyQr63UH/GIhU5Uhc+l6oIGARAGmz52qAiOq+jvUCpw6PTclRnxfydAdMqwh1TGXjj
	J47rlDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MaC-00000008KBk-3Jk8;
	Wed, 23 Sep 2026 13:00:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MaA-00000008KB6-03KR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:00:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27BF1601FB;
	Wed, 23 Sep 2026 13:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46E81F000FF;
	Wed, 23 Sep 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790168416;
	bh=bygnlyduWNX9bGl+OAOhRpG2bzPfJz7Wo7gATpHhbZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GSejrNXcWpOIhzmDIgz77w5u8mRJlnIHTcFuakWa+LN4RJ/GWzRCYCTlaKyEaF6qh
	 PFH8GvS+RkCjHo3jXbZ85iR5PV3EJt52wNg798gUdjROejL9ssUTX6aNMzk/MHy2+U
	 IzZ+xAtk2Ph9TZJ6mtcCLJV2GjYWOF2T0LmrddSAfa1Ug6MlPcTxwYcAg8ZS+pIn0x
	 zb4NoK17FNt7tZcwSLyBA6ylQD9yDixwXpDn71N+jWgTXUG+WX30ry0KJ/HXt9yA4x
	 DGDOAt+Oobz74m4tH66qILPGlbrizeNTrHE1A8RS+MZB4Y5sMBkw9/yBr0uIIA97qB
	 ArMpJjI90PiAQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rob Herring <robh@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
Date: Wed, 23 Sep 2026 14:00:05 +0100
Message-ID: <179016687079.3278822.12341361045842371613.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922181430.3532371-1-fuad.tabba@linux.dev>
References: <20260922181430.3532371-1-fuad.tabba@linux.dev>
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

On Tue, 22 Sep 2026 19:14:30 +0100, Fuad Tabba wrote:
> __init_el2_fgt2() writes one mask to both HDFGRTR2_EL2 and HDFGWTR2_EL2.
> PMZR_EL0 is write-only, so its trap bit, nPMZR_EL0, exists only in
> HDFGWTR2_EL2 and is therefore never set: a PMZR_EL0 write from the host
> traps to EL2, where the nVHE hypervisor has no handler and BUG()s. The
> kernel never writes PMZR_EL0, but kernel.perf_user_access=1 has the PMU
> driver set PMUSERENR_EL0.UEN for a task with a user-read event, so a
> write from EL0 reaches the trap and takes the host down without a panic
> message.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
      https://git.kernel.org/arm64/c/2bc6b218717b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

