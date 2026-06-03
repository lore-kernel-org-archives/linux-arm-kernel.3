Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93012CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A7+X8eZmyoc1i4vmgDGETla0lDDfCLzGK/eA0mNZd8=; b=UlYh6txYEdxmEtpkX8C23rAmZV
	yupLvxrpyFhAZEX/DYm1KjPk8pN/tR/lw125ZAly2PY78FVIoUhNKKBy15LacbOOEHIbNaynBNv7H
	+vkXEYW0kw3q3U/Ra4TrJPxbYk1EnZkdzhl4l6nXeog91mf1lLQEgS0xeLaabiBIVxb2mcW73hqMZ
	9Qni8zdF12gXbwxDCmZi5Hwr+Yh1qRtXirQGbSV57WVklX9Y67Mq3Azo2rqwGLq0pH4RUdpS6akD9
	YEJ/hLB9QwZPvpeSC5PrfAZLgnJkfCOXwdEnq5F0MqaJGy0QYd5kqhVYyitRgAtyk8WiCegIAtj8N
	mfO/Zhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsnj-0000000FpXF-2Rc2;
	Wed, 03 Jun 2026 21:06:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsng-0000000FpWD-0ykK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 21:06:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5009418A5;
	Wed,  3 Jun 2026 21:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1406F1F00898;
	Wed,  3 Jun 2026 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520815;
	bh=0A7+X8eZmyoc1i4vmgDGETla0lDDfCLzGK/eA0mNZd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oBlRaD34vBZeBpEWh0RDka5ZDK3j5ozFHCbAA05jkVVLGjJLORfEbxZ92A0YzicD0
	 89Z4ICbuLLj2HW54kbtlNPSF+QkCYc8v/6sUsaE0m5ustrSkJbYt/kf2FlfiwD0rnP
	 xiy/iuHuywYn47LXn07o1dBzUflfiAxP794zI2l9sjcexFyJeqsBPG0HXdJEPl14A0
	 4keVct/og4eG15+4kydngH/fVOQsRQ9NM/NJ/IFWqCDPoohWTMqpcyu5ShpfIy1ZPk
	 t801mSQbW1dWFOJrR1aqiNaGEYaGMWUSS3PEqcgDuqiut6ljIQWo/Te4CePTcuiu4m
	 YOI/dZlIb9xfg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	james.morse@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com
Subject: Re: [PATCH v4 00/20] arm64+KVM: FPSIMD/SVE/SME cleanups
Date: Wed,  3 Jun 2026 22:06:28 +0100
Message-ID: <178050185086.377054.3392422151485171644.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_140656_324212_A3FDE42D 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, 03 Jun 2026 12:06:10 +0100, Mark Rutland wrote:
> This series cleans up low-level FPSIMD/SVE/SME state management code,
> making it easier to maintain and extend (e.g. adding SME support to
> KVM), and enabling better debugging (e.g. by making SVE/SME save/restore
> visible to KASAN and KCSAN).
> 
> The first two patches fix a couple of latent issues that don't seem to
> have occurred in practice so far, but would be good to fix for stable to
> avoid any future issues. The rest of the series is purely cleanup.
> 
> [...]

Applied to arm64 (for-next/fpsimd-cleanups), thanks!

[01/20] arm64: fpsimd: Fix type mismatch in sve_{save,load}_state()
        https://git.kernel.org/arm64/c/ae24f6b06e90
[02/20] arm64: fpsimd: Fix type mismatch in sme_{save,load}_state()
        https://git.kernel.org/arm64/c/247bd1539050
[03/20] KVM: arm64: Don't include <asm/fpsimdmacros.h>
        https://git.kernel.org/arm64/c/79e66bb7e8b4
[04/20] KVM: arm64: Don't override FFR save/restore argument
        https://git.kernel.org/arm64/c/dc2337625880
[05/20] KVM: arm64: pkvm: Save host FPMR in host cpu context
        https://git.kernel.org/arm64/c/da20bb4bc5e6
[06/20] KVM: arm64: pkvm: Remove struct cpu_sve_state
        https://git.kernel.org/arm64/c/afd7af2b56ec
[07/20] arm64: fpsimd: Fold sve_init_regs() into do_sve_acc()
        https://git.kernel.org/arm64/c/3efb6c7f22c6
[08/20] arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
        https://git.kernel.org/arm64/c/e0cde2d2bb1b
[09/20] arm64: fpsimd: Use assembler for SVE instructions
        https://git.kernel.org/arm64/c/f27fe9aa2d06
[10/20] arm64: fpsimd: Use assembler for baseline SME instructions
        https://git.kernel.org/arm64/c/db9d63eafeba
[11/20] arm64: fpsimd: Move sve_get_vl() and sme_get_vl() inline
        https://git.kernel.org/arm64/c/3f26d7c6544c
[12/20] arm64: sysreg: Add FPCR and FPSR
        https://git.kernel.org/arm64/c/36a1d1726634
[13/20] arm64: fpsimd: Split FPSR/FPCR from SVE save/restore
        https://git.kernel.org/arm64/c/1277531fca43
[14/20] arm64: fpsimd: Move fpsimd save/restore inline
        https://git.kernel.org/arm64/c/890712d4507b
[15/20] arm64: fpsimd: Use opaque type for SVE state
        https://git.kernel.org/arm64/c/e1b163e40553
[16/20] arm64: fpsimd: Use opaque type for SME state
        https://git.kernel.org/arm64/c/eb1a68a00c0a
[17/20] arm64: fpsimd: Move SVE save/restore inline
        https://git.kernel.org/arm64/c/2768101b3976
[18/20] arm64: fpsimd: Move sve_flush_live() inline
        https://git.kernel.org/arm64/c/18618d9ea1fb
[19/20] arm64: fpsimd: Move SME save/restore inline
        https://git.kernel.org/arm64/c/bfdfafd90720
[20/20] arm64: fpsimd: Remove <asm/fpsimdmacros.h>
        https://git.kernel.org/arm64/c/987ec51e1841

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

