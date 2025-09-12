Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A30CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=498i8tCI9MSUM+q+wRJio2Lx+zISexAwe/ChRr7QB9I=; b=VynknzX/BZeLgKwUVSgVWiMgu0
	VGXMZohlFfQjaUNDebwAY0L2hsobA78UxSDCxAMq7RCzHqBDlyxS599KDMWr96PGCBGLu7Wo6f1Il
	tJggUCqqW7SRwz+MDPNZt7zlLUJ9J8oYFuBrbD0MBstd7HqJepgrrTiPxgKnU6smo/eaocoSlhY7t
	7ymJTPB5RqJDNukLF/Ig7jq9XXPde3RlpfZ58lXKvgrR8pDSURqHICh+sF9Ylpta9b+CsNvbVLTOi
	bvnYpUP5Hy58n1RuoWwuGrYvn5bVJZUYTUhlItWAtNx57BF6esbBqhk2thrB2AzEn6UoZzVsK/F98
	beH4hQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6ZP-0000000AW6O-22zM;
	Fri, 12 Sep 2025 16:24:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6ZN-0000000AW5c-2ooZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5EA0601E8;
	Fri, 12 Sep 2025 16:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D026BC4CEF1;
	Fri, 12 Sep 2025 16:24:13 +0000 (UTC)
Date: Fri, 12 Sep 2025 17:24:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 3/6] arm64: Kconfig: add LSUI Kconfig
Message-ID: <aMRJK3x-K0HktAPA@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-4-yeoreum.yun@arm.com>
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

On Sat, Aug 16, 2025 at 04:19:26PM +0100, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> It's enough to add CONFIG_AS_HAS_LSUI only because the code for LSUI uses
> individual `.arch_extension` entries.

The subject could be improved slightly: Detect toolchain support for
LSUI.

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..c474de3dce02 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2239,6 +2239,11 @@ config ARM64_GCS
> 
>  endmenu # "v9.4 architectural features"
> 
> +config AS_HAS_LSUI
> +	def_bool $(as-instr,.arch_extension lsui)
> +	help
> +	 Supported by LLVM 20 and later, not yet supported by GNU AS.

binutils 2.45 added support for LSUI.

Nitpick: we tend to add a two-space indentation from "help".

Otherwise it looks fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

