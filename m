Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE32CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAw2mrLc4CtBwBWchbqYHpR1Dru7LqeQjl+J9umVBSY=; b=kfPAr7c4IbJbzfd9Q1/3nFtq++
	nvYTc5pv7cfETj34ullQBiP8o+lpU6LGFOdJT/v1Qp3hpTxk15JEXy+g5FOi0OZWmPes56OliTA4G
	/xDK/keYtTy5fh6Xrz6gP/c9vS4rm38kteUhvoBdrYRXfp/fIRg0oGu1MY9McZ7ANo91A+V7Da7+B
	dJBrlUlQn8c5TXkj5KjmTqHscWUe9tFFmV4DRFwUJUyB2WSVTELPx/kuj4jBGhLNfULuL/Wv4QJWy
	v7k9e/FZNFt3f+QyLCMNpOz8jKL1paym/hmnjrdDvtScSDerSoX7ynrzzNO2jTBeQQDuNkERWXBA+
	xYfZnMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rrc-0000000Amwx-0uWo;
	Tue, 29 Apr 2025 20:47:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYx-0000000AkXY-3EHf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 152415C02BC;
	Tue, 29 Apr 2025 20:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25B3C4CEEA;
	Tue, 29 Apr 2025 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958499;
	bh=UcHVSdsNl83YVYs97yxyIXsnWeVius4kIYuiTanaakY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dmHse4nzSC0xWNL4u/4jmwhwqNq4C+kaqNKOcH9vNXevTJgqxMCmNecz6kK0J3B4K
	 7CYa89bITs71Mr/XFTpgTv6hoaL9apAO/QImvekdvtC8otfrsaZIzMKBUDdHVpdv5f
	 Sr1UCApB4gUlIxA85rYbPbhsK48P3ergbjlupCyu0/gDt6iEgKljJXBpeu8NU7PRNc
	 HEcgL/oAVQ0V44ZoSjXAVno8S7IrX7LY+qYU6l7Q4Tu0faTpm73M/FilDOLqKIJiXy
	 hxY0GldFfrAELs4wk04hazBONREJGTC9jwfNSXwsDFuUNRJEjJvIcXN7q03oz+c/8G
	 w0uDwvsIGGjjw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Expose AIDR_EL1 via sysfs
Date: Tue, 29 Apr 2025 21:27:51 +0100
Message-Id: <174593179853.437254.7295109441381830803.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250403231626.3181116-1-oliver.upton@linux.dev>
References: <20250403231626.3181116-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132819_864298_538ED066 
X-CRM114-Status: GOOD (  11.17  )
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

On Thu, 03 Apr 2025 16:16:26 -0700, Oliver Upton wrote:
> The KVM PV ABI recently added a feature that allows the VM to discover
> the set of physical CPU implementations, identified by a tuple of
> {MIDR_EL1, REVIDR_EL1, AIDR_EL1}. Unlike other KVM PV features, the
> expectation is that the VMM implements the hypercall instead of KVM as
> it has the authoritative view of where the VM gets scheduled.
> 
> To do this the VMM needs to know the values of these registers on any
> CPU in the system. While MIDR_EL1 and REVIDR_EL1 are already exposed,
> AIDR_EL1 is not. Provide it in sysfs along with the other identification
> registers.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: Expose AIDR_EL1 via sysfs
      https://git.kernel.org/arm64/c/17efc1acee62

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

