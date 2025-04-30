Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B1C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oq+eCJc0gw3GIz/xcLSjgk7dmNoEtZGEP0Cyk65cVQM=; b=HWGn8pLY2fdUMOmBWuzMO2UibC
	jBQyLEDUMt40PiaEIMT3AliDM4IQ4O6diMhrUZn4jvNmCREuGrvycAx9j33rKfYN03eRX3rl0kw9v
	SX4LGKDurybQr2ZaPyGi3KMnkbEl+mDDhzgIZHCkDZe9OJirM3frO2Mv++7PatTo9DC5stsdaEBcV
	zvib1ufImnqO5vYhrzf7hY2LcGUCRGi1B4ek8OCalxiCEnmUXlhHCU8p/MrUkASrhOQugyec34iW9
	jkBO+uf/RDvzt2ot3a0znRXcgm8dMpaixdaupuG14M/V9EGzj8XFV9y3sQFQ/1WOoiinWha5AZx1T
	8AEHmsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACK2-0000000DiA9-3V64;
	Wed, 30 Apr 2025 18:38:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACEN-0000000DhLt-2kr2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 18:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7CE1A4B6ED;
	Wed, 30 Apr 2025 18:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A331C4CEE7;
	Wed, 30 Apr 2025 18:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037946;
	bh=TYhgix12dGzxcZC8EV8jdnO88G/BhDWgXBe6jHhLI8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IB2X2j/TomWE4MnvUk8n5a4msFY5rPtItY31T/FdMJyQc/vE7POD5ctE1hHyWVhBo
	 xgmxVKXZHEuJZfiEeimc8LhMhbpqHzzt1fgnySSyw76jxjchTvd1WoRVqQ2mVhiX/k
	 FnGCRet0XJwNjHQfgwDWVpRTpFpmWLpLjxvvtp5khqq5F4dLBO82E4bXdpsyocoUBW
	 5lGBWvGntuH2bJX3xAmp/gBXg3tj09DHNTw48bp/Ct/Mf53GMb2yFzEfV8JtPd8gHD
	 EXeohERnPfRCUtSvD2k+f7GJpzZqY0acWyBcjPUhjA6JbcRFRGmGV4xWGWrlrxzseK
	 ok32P1l0oUmcA==
Date: Wed, 30 Apr 2025 11:32:23 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202504301131.3C1CBCA8@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_113227_756104_1D450A6E 
X-CRM114-Status: GOOD (  11.52  )
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

On Wed, Apr 30, 2025 at 04:27:07PM +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.

This touches both UBSAN and arm64 -- I'm happy to land this via the
hardening tree, but I expect the arm64 folks would rather take it via
their tree. What would people like to have happen?

-Kees

-- 
Kees Cook

