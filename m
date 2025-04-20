Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B791C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9zrrDOxME57GBJZTg9k9R5znLyd2GM1hIcVvK4ssio=; b=01cZcB+L5NawlLv14MhunrtBng
	q7i+q6yhZeIyf+zc2352wvyNWWX9JOEQgLPgM6wwiMAwpwJ5SGoHAYhb7lE7hN/y4kdBQf9e78ofD
	ZpkxuukmNKacU4++m2sF9WoAVWkQJgZAbYbERKbJ085Llg6X2AuMpf4/XTqA4oN9FfyKz5t9biT6j
	uRlYdgAlvBjPj1vhO5jVwf1Rtp7U4waJilsRrsgIW2jI/l52U2DyXGHerAn7/JIygqtj3LegY6drh
	eUuSl2BD5TyxQENFY0PxkNTiHYx3O+PwDpi5qS+epoExfjYQs/8DxDhqfs1ZnBn9nL582LJ5Bc8UZ
	ARkUp/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6cSi-000000035Rp-04Vj;
	Sun, 20 Apr 2025 21:44:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6cQn-000000035JR-3B7l;
	Sun, 20 Apr 2025 21:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E51BA61127;
	Sun, 20 Apr 2025 21:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E842BC4CEE2;
	Sun, 20 Apr 2025 21:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745185348;
	bh=o3lK09+otg6DgvlTkRd0uEq2A+YS26/sGwIIKbHBcag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V14kX5gVKJQ4TKr1kjqcj4uB/vdwkcoBtAzqAd6oYHr/0UFPi5Xb4XNt2bgobpadx
	 fHLW4TYVRN58fg+nvS5iX8RxLw4WD2uHHLtRHXM8Fdzq0zf/m9Jea3Dw9SN4//RZic
	 ATxeSy8c398InEkzqu0EoYWWLNR9+5n7gOY+jzhg+foAWNabfgvGsLuAiv1wAU1p5q
	 gEJO9Hc83boZUsPd9mdUX74gegIaxXpsyScNdEd5NPpa5d0+pAveQwe+GXHrNRv35O
	 JZfCuQ5QtXX/qaeCAd7eOiMQFvnuGssZ557aDkUuMoDftndQ6sqUI8SdS8WUi74F4v
	 27V1otuThl43w==
Date: Sun, 20 Apr 2025 14:42:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 05/13] crypto: arm - move library functions to
 arch/arm/lib/crypto/
Message-ID: <20250420214226.GA14633@sol.localdomain>
References: <20250420192609.295075-1-ebiggers@kernel.org>
 <20250420192609.295075-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420192609.295075-6-ebiggers@kernel.org>
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

On Sun, Apr 20, 2025 at 12:26:01PM -0700, Eric Biggers wrote:
> diff --git a/arch/arm/lib/crypto/Makefile b/arch/arm/lib/crypto/Makefile
> new file mode 100644
> index 0000000000000..dbdf376e25336
> --- /dev/null
> +++ b/arch/arm/lib/crypto/Makefile
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_CRYPTO_BLAKE2S_ARM) += libblake2s-arm.o
> +libblake2s-arm-y:= blake2s-core.o blake2s-glue.o
> +
> +obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
> +chacha-neon-y := chacha-scalar-core.o chacha-glue.o
> +chacha-neon-$(CONFIG_KERNEL_MODE_NEON) += chacha-neon-core.o
> +
> +obj-$(CONFIG_CRYPTO_POLY1305_ARM) += poly1305-arm.o
> +poly1305-arm-y := poly1305-core.o poly1305-glue.o
> +
> +quiet_cmd_perl = PERL    $@
> +      cmd_perl = $(PERL) $(<) > $(@)
> +
> +$(obj)/%-core.S: $(src)/%-armv4.pl
> +	$(call cmd,perl)
> +
> +clean-files += poly1305-core.S
> +
> +# massage the perlasm code a bit so we only get the NEON routine if we need it
> +poly1305-aflags-$(CONFIG_CPU_V7) := -U__LINUX_ARM_ARCH__ -D__LINUX_ARM_ARCH__=5
> +poly1305-aflags-$(CONFIG_KERNEL_MODE_NEON) := -U__LINUX_ARM_ARCH__ -D__LINUX_ARM_ARCH__=7
> +AFLAGS_poly1305-core.o += $(poly1305-aflags-y) $(aflags-thumb2-y)

As noticed by kernel test robot
(https://lore.kernel.org/oe-kbuild-all/202504210545.llc4JaKQ-lkp@intel.com), I
forgot to include the following line here:

    aflags-thumb2-$(CONFIG_THUMB2_KERNEL) := -U__thumb2__ -D__thumb2__=1

