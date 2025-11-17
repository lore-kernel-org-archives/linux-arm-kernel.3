Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D56CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJuiS1wQ2iajfA76Bp1LrqWo1liqiY5CRAx0RHmLEYc=; b=hxDkWUhOcGG3zlbd5WDbRUiW6E
	TnE/7nqoUGxzQX6YMDDVrPD99TKmcU9VIthl6ETeB8WRsG2NeUa22ASkqCpQB1Ke2DmM2ObaO2Y12
	/ygHCVgqrv7UflTZIVqMRPXHYeMQ/qvnyl0tacMEOVJSRpeSChvHe3WU3ioGRhTdSrsLAM5RLcbVB
	TH9TCXgncrE2+JcfwTBdsMO2YAkJFL9WnZ7m6rlcpGnNvmZCPm0KbKGe7q4XfG1OCppC1SkpgDmLy
	fN52wQK0FlQBCwa1OUdcy5D3DsuVYo2VC4s4K53GkFHIMuViwc4RbFvWsnuzYdd3PS0lsCrXSR54Q
	w2IjFaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Mo-0000000Gr3i-41ke;
	Mon, 17 Nov 2025 21:02:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6Mn-0000000Gr3a-3zTp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D411605D0;
	Mon, 17 Nov 2025 21:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F2DC116B1;
	Mon, 17 Nov 2025 21:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763413348;
	bh=bE0iENGKX931P1EKdTaVZ4dDp+hh3qF3ZbwQ/1IU8a4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kcyvUuOPrdgEKf+IiV3Mi2NKan7arkgRprfH91oavZjFzs0eoDWaaZz79bMU+Fmge
	 /AV0gI4kU8w85+0kRmMIEO3oioTpSlLpCnIWv7Vy93oifWgB0HWCFo9j9jNL6oNKg6
	 E8AfflGx+KvsYNur2oB7lDY1aJTMon55P/UQZbTpqhI7NcSspyICzblzBnjCzBcedx
	 9dMk0U/X+Bb/3X48uLP1Rs95dHVt1LSAocSBqocq89Sc/5bbQ79zwhMST+1P2a/LD0
	 WYQHHGKdxVfXtdqXq5SaAUv618wWJnlHJ7WWyU74Yy7dejZ8L/tYbqf9z/tSMGqYM6
	 bGQJgHvy0l/RA==
From: Catalin Marinas <cmarinas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Spickett <david.spickett@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Luis Machado <luis.machado.foss@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64/sme: Support disabling streaming mode via ptrace on SME only systems
Date: Mon, 17 Nov 2025 21:00:59 +0000
Message-ID: <176341325906.789443.15370787298292895484.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Wed, 15 Oct 2025 18:56:35 +0100, Mark Brown wrote:
> Currently it is not possible to disable streaming mode via ptrace on SME
> only systems, the interface for doing this is to write via NT_ARM_SVE but
> such writes will be rejected on a system without SVE support. Enable this
> functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
> via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
> writes currently error since we require that a vector length is specified
> which should minimise the risk that existing software is relying on current
> behaviour.
> 
> [...]

I don't think we'll get gdb feedback soon. Thanks David for the LLDB
ack.

Applied to arm64 (for-next/sme-ptrace-disable), thanks!

[1/3] arm64/sme: Support disabling streaming mode via ptrace on SME only systems
      https://git.kernel.org/arm64/c/472800cd5e38
[2/3] kselftst/arm64: Test NT_ARM_SVE FPSIMD format writes on non-SVE systems
      https://git.kernel.org/arm64/c/eb9df6d69a96
[3/3] kselftest/arm64: Cover disabling streaming mode without SVE in fp-ptrace
      https://git.kernel.org/arm64/c/a0245b42f881

-- 
Catalin


