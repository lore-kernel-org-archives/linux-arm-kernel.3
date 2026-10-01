Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E24CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmJNy3oFWhIRZFtfF6YAIvJtvccvbrXx+2twIX2a7lc=; b=YmfVjbhMzWjF32kiLt69H8Vnew
	mt8oEyyy+XocU5V+V5Gx3sTdb3/wDxC4I4uBulkBeYnf3/nZSRktiws++Yt1vT2D23sL7fFk2PHNw
	kV9FXhxTucW7DYuNw9SlmPKyIpd0ZTrpLLrdLdPLDGjAe0+Fysl5R94Bh48jJaJLEAx6h/8HBhrye
	R0p4CwpACUvXJTES0UvwLki+t1nbmO90atyqu+vFcYNiYFXoQ5Ys5Xb3WUrnizJWUznToZBdRMf2z
	CqOy7k3jabpIBAnEPdi67Kax9aTItOEHiGFgSyBS+I3NRMgJVdsYfHEysiNQ1vUjtSTP69EKoguy0
	8LTVg9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ3h-00000009aZS-2pHr;
	Thu, 01 Oct 2026 15:50:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ3e-00000009aXt-3uSb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6296360A6D;
	Thu,  1 Oct 2026 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF1C1F00898;
	Thu,  1 Oct 2026 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790869854;
	bh=YmJNy3oFWhIRZFtfF6YAIvJtvccvbrXx+2twIX2a7lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mi3RXaYSY4tqfSNdPxdE8W/s6uZpmmUa+wH8hCOiyWg0AmeysR2AIhiCxvV6WqI31
	 E7Cgvt2zChm+dZI8RPDXoszRx8WpjEA0/tw3K4QYl47KaVDSzm2XRVwSg3Cy8OAgLs
	 ZlprY/QyzgZrOPS0P9HmsrOpPAlfQGZJ28Fj79GWMAWuLeIhJfs16cbmf/Ez3HwKBZ
	 +R3qZ0bv/l1FvYzQ9QHO6yp/pjpL06FeTBzgXVBgBYLbx88bc6y8KNVAi4jdLCN4zm
	 n39XixA+nKp0LF/CMkjbKoqbC1iLTNRsjRB7+Lc2P/V6qL06zmE+GgmuHMKQNpvrOs
	 e28pMnkCDxT5A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
Date: Thu,  1 Oct 2026 16:50:43 +0100
Message-ID: <179086063838.2740899.986966739708665243.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001130836.1410888-1-mark.rutland@arm.com>
References: <20261001130836.1410888-1-mark.rutland@arm.com>
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

On Thu, 01 Oct 2026 14:08:36 +0100, Mark Rutland wrote:
> When system_supports_sme() is true but system_supports_sve() is false,
> restoring a specifically crafted SVE signal context can result in the
> task erroneously having non-streaming SVE state. Subsequent attempts to
> manipulate the task's FPSIMD/SVE/SME state can result in a variety of
> problems, including fatal EL1 UNDEFs.
> 
> In such configurations, the kernel always creates an SVE signal context
> when delivering a signal, and this can only be in one of two states:
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/fpsimd: signal: Forbid non-streaming SVE payload on SME-only systems
      https://git.kernel.org/arm64/c/e060d9069b49

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

