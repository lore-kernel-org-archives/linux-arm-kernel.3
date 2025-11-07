Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786CCCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFoPuo7XBUym0xWyaEiSt61yFaX1b6BZ/yCRg/qihtg=; b=T6e6py+jdkBEYDq3XiBWx7HJsS
	rlO0Ez3jlXNJoF1U94F6vumtP42qOb2pkYg8R/5+NTRRZbNJ5MyejNb0YjhHpBeX7f+uRIi+ZLD7i
	ajc/WLv98P9Fj4KOyAs0B6HWBUJM1EtGFyY1fumorB8Ic2nhIuiJf/HU7Lw04pejif85BWKixOEAt
	XBp2Be+7Bc3LaUtuNy+mxKB+IX7xQQJaNzvmTzboTofCGO5kF815+/rznREf6L5WeJJH/o8n4i/0e
	x10OihJYWo9aymy31GeP16vOcARZmdkGbRNWBXjdGIVu5C5DzvmC2SMaEltla6FaZmdoNeaToQ7N8
	Mky2ZiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOml-000000000xy-20Uq;
	Fri, 07 Nov 2025 15:53:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmk-000000000xf-0ne3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FD8C6191F;
	Fri,  7 Nov 2025 15:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FAFC4CEF7;
	Fri,  7 Nov 2025 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530836;
	bh=ettcBPzq9vc4d1Q2YzwL5tu0nxYFQpwu/MvrU+Xm5OY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxplMiDsGPW2hmIqOmG3M/34/cHrntNpLBakDz8CGs09Ju7aioqGhBVXUiEaOdMMU
	 rsjxWJIsDBBJpzxXPX7b0B4px02H130YHfddFe6GVGcohU3s5F/wYS4QPqM/0GFh6j
	 t2rlVnta2EhUvPpaCXXXuPSg19DwBV7c9yJkGSjObvt0d8yKZgcqq4sgvA/e5F6l/c
	 sWxSpNs9QqdeqZ9G9WYsd4fszlCoxx2ZLuSQ9wH5Jy8/Hh6U3PoK8466RX5+ALmy49
	 6EjBQ5ixXvm7Ubf1ikeCUeblmht2MXhvB41+o9cgjkdb4oMUpRKeusUcKfxWKvqvJM
	 7BS2bsd86M31w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adrian=20Barna=C5=9B?= <abarnas@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dylan Hatch <dylanbhatch@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 0/2] arm64: modules: Reject loading of malformed modules
Date: Fri,  7 Nov 2025 15:53:42 +0000
Message-Id: <176252752075.602788.16693792309857347530.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250922130427.2904977-1-abarnas@google.com>
References: <20250922130427.2904977-1-abarnas@google.com>
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

On Mon, 22 Sep 2025 13:04:25 +0000, Adrian Barnaś wrote:
> Here is version two of the patches I previously posted here:
> 
>   v1: https://lore.kernel.org/all/20250919122321.946462-1-abarnas@google.com/
> 
> Changes:
>   * Renamed the parameter `is_module` to `skip_dry_run` in scs_patch()
>   * Moved comments to module_finalize() and improve justification
>   * Instead of rejecting all modules with callback, reject those with cb
>     pointing outside core kernel text
>   * Replace -EPERM to -ENOEXEC when rejecting modules with incorrect cb
>   * Fix missing return in apply_alternatives_module() placeholder
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: Fail module loading if dynamic SCS patching fails
      https://git.kernel.org/arm64/c/6d4a0fbd34a4
[2/2] arm64: Reject modules with internal alternative callbacks
      https://git.kernel.org/arm64/c/8e8ae788964a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

