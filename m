Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9456C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL14dA5i1F5k9SpGfkhx5F65mfvG+9VmnkaNtWzoOaM=; b=lAbQrLmCTpoi/qYon+8NRpoIFh
	2s9TX6OxnQq8qZ88/O0CV18pWSkAHcEF+1dji5HlCAtugxwveOZBjzLMR+IXNzp0U+J27J1WZMVYI
	E6J96ZYJmuRF0mPoI4OwH98lkm0NrDrnoU8Y6zR5tSAPSchhNMPxmMByW4zs9CuKhQM1UVT8L7k7+
	vsQ/0skkl0dg6ad+ZDh5R5H/4aoKbT3S5fDZO9jE9a5dwzsSDgGqcJO4PrgAl33E2V3ymAwhTadFR
	tmU9e/Uce7XklCzTuSCXajaXdKv5dpV0nfl7e37C9AjeMy7ffCIQj7aYcXdL9OgKh0lCeVNPBYrQN
	zQ4pwBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckQm-0000000CbPV-3hKo;
	Fri, 18 Jul 2025 12:43:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjUS-0000000CUgc-2cuy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:43:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B2EF7A5701B;
	Fri, 18 Jul 2025 11:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27582C4CEEB;
	Fri, 18 Jul 2025 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752838979;
	bh=c1aJonaSn7m5jpxkZVQAbObN+591/3gbJ6vAeHNRkOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wit5SPbmg2PXTNyuXevhjnuEUrLjnleqAlzHzBm8sweT1IhJutppROwa55ClUnAne
	 ctEekz23EnBWWnlt39mCkEpBNMJct3yoFW4SNPgPETdE2gdb1xPplkazMfFuwv6l+s
	 UhLelyFejw/O2WRCuMJYEYv1Bp4wkGL3+Gyih0+MndeCWZT5w7CfdDaqSzRY1qcR6V
	 NsBylB7FXKSmxqwYeyWjpTrxue8gGFP434e30I8XoUCdP+uR/wwK754BLYCL7i3GB8
	 hz91wLv9mLBAc1e889aUWhEVTixS5SaSO8wyQcRS90DaKOeRhOelb1KsmPRlKnT7ox
	 tQZDkGi32WX5w==
Date: Fri, 18 Jul 2025 12:42:54 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Dao Huang <huangdao1@oppo.com>
Subject: Re: [PATCH bpf-next v10 3/3] arm64/cfi,bpf: Support kCFI + BPF on
 arm64
Message-ID: <aHozPj7NIudHmmgM@willie-the-truck>
References: <20250715225733.3921432-5-samitolvanen@google.com>
 <20250715225733.3921432-8-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715225733.3921432-8-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_044300_736725_BCD2AFF4 
X-CRM114-Status: GOOD (  17.56  )
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

On Tue, Jul 15, 2025 at 10:57:37PM +0000, Sami Tolvanen wrote:
> From: Puranjay Mohan <puranjay12@gmail.com>
> 
> Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
> calling BPF programs from this interface doesn't cause CFI warnings.
> 
> When BPF programs are called directly from C: from BPF helpers or
> struct_ops, CFI warnings are generated.
> 
> Implement proper CFI prologues for the BPF programs and callbacks and
> drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
> prologue when a struct_ops trampoline is being prepared.
> 
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> Co-developed-by: Maxwell Bland <mbland@motorola.com>
> Signed-off-by: Maxwell Bland <mbland@motorola.com>
> Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Dao Huang <huangdao1@oppo.com>
> ---
>  arch/arm64/include/asm/cfi.h  |  7 +++++++
>  arch/arm64/net/bpf_jit_comp.c | 22 +++++++++++++++++++---
>  2 files changed, 26 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/include/asm/cfi.h

> diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
> new file mode 100644
> index 000000000000..ab90f0351b7a
> --- /dev/null
> +++ b/arch/arm64/include/asm/cfi.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_CFI_H
> +#define _ASM_ARM64_CFI_H
> +
> +#define __bpfcall
> +
> +#endif /* _ASM_ARM64_CFI_H */

So close to not needing the arch header at all!

Acked-by: Will Deacon <will@kernel.org>

Will

