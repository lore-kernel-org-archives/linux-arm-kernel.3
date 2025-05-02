Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB0FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa8NpxSOGVmQu6T5ufF8oRUtfgmRs5iiG+n6O5i1XQQ=; b=Oxy6KG0GXrFoPcbguNOvmiJkNS
	0JbczJn7D21OSl8jafEJTKyQh+F37k2GjSdYE6aEkoyeerxl4Ae5f+G6jp1l48yZSDqF3h7slHL9n
	KRvdYJB9fTyJu8uhDondxJ/XqgEoxo4pWXPn2jKxJsZWXxPQK7oohd22vf0YDOQzjNybLZy1lwl/9
	39kgWGSPJ4nt54pYLri3xzG9CE1Ei5ANVDFDfv1EkAX4oLWJZQWaVzSPSux3LZkIaD/dL9OGcRG/I
	76+W1b/ZEnkHx3n/9K6cms2DNMOkNTrSOn9N+TM5GK6pipuQ2lV4pP8W+oR8MKV8uE6SSQuclL0Q6
	upIA29gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArMf-00000002Bwl-0gee;
	Fri, 02 May 2025 14:27:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArF7-00000002Adi-1bcT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C22B56116E;
	Fri,  2 May 2025 14:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496BFC4CEE4;
	Fri,  2 May 2025 14:19:54 +0000 (UTC)
Date: Fri, 2 May 2025 15:19:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jan Stancek <jstancek@redhat.com>
Subject: Re: [PATCH v2 1/2] arm64: vdso: Work around invalid absolute
 relocations from GCC
Message-ID: <aBTUh6WwC0_jl5_e@arm.com>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
 <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>
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

Hi Thomas,

On Wed, Apr 30, 2025 at 11:20:13AM +0200, Thomas Weiﬂschuh wrote:
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler emits
> PC-relative relocations.
> However GCC emits absolute relocations for symbol-relative references with
> an offset >= 64KiB. After recent refactorings in the vDSO code this is the
> case in __arch_get_vdso_u_timens_data() with a page size of 64KiB.
> 
> Work around the issue by preventing the optimizer from seeing the offsets.
> 
> Reported-by: Jan Stancek <jstancek@redhat.com>
> Closes: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
> Fixes: 83a2a6b8cfc5 ("vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index 92a2b59a9f3df4d20feb483e6d8ebd1d813b7932..3322c7047d84fecae316a2904f1adec0cb458f6f 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -99,6 +99,19 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
>  	return res;
>  }
>  
> +#if IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB)
> +static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
> +{
> +	const struct vdso_time_data *ret = &vdso_u_time_data;
> +
> +	/* Work around invalid absolute relocations */
> +	OPTIMIZER_HIDE_VAR(ret);
> +
> +	return ret;
> +}
> +#define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
> +#endif /* IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB) */

Thanks for the fix. We may have to chase other such cases in the future
but I don't have any better suggestion.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Question for the other Thomas (tglx): what's your preference, do you
plan to take these through tip or shall I queue them via the arm64 tree?

Thanks.

-- 
Catalin

