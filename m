Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA6D1D483
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OODmGsMJR8KkWVIwL3oduI42mZW6JkdE7mQV95TGWGk=; b=sZsrvqiWwklA2HRKBCebvdp5gt
	JgUM8F0l4RGc1qHUx2R4VbVkOFXdWF/a1yHHqMrhS8NVP+JEzT7Tz8IKvhih0MHZ3kdZyExz7H6i0
	5nXr/rKhZuaD1l6pTYFioMMy6zN6UzKp52HUhN6H9YOePnVVH8OcXYKr15xw+hU7UDK6+hBmNP736
	v/Kk3sDpVdGq166oCQPBh2qKWASme4jcn0/gNJp2uthkEdr8ANgAD/yZAID3WKvhkTXAR3gDaTQWY
	04hJyi8z9pv+EE0NJM6FxJg5Jj//WWrr/LmeyKcTGMXVt0Yba3rl3wduBJrnQzKQOFDec/8HdMBrI
	YPOeEoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduFd-00000000WnH-2zOj;
	Thu, 08 Jan 2026 17:56:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduFc-00000000Wmi-0kTs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82EAF60132;
	Thu,  8 Jan 2026 17:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEA0C116C6;
	Thu,  8 Jan 2026 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767895007;
	bh=w/QLun24lbtHii2xsaLuuKpk/iaodRrWwMtJGRI8v2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+78jq3RqBJgK4cIrQuLNVR/+PIoAzqHbdf1iJY5WrJNo1abFBr86lp4LW7IGujGf
	 7NqmWKUeZDNHD5CG29NJ8TnXtEDD/YyH6zzywPW+6zBaBftYsQuaXGDGXtkKEk7sWO
	 9o4sWunISQpCrz9w2ezuPrfH2AePhh/IrwnTiO9mcmYROnjVcOiGQI7YOyAvL7ajlt
	 YLw5m6RuGa388VqebBzQgZYooFD7zqe7IlVWUTG5oCyQVlrF+HhJGN4xunCJpJfXgT
	 EYED+MQWHyIxG79yg9HHk7Xg/Nlv3hD2u+6bmmAqHVmdKA07TfrmlQkHUOW0HbWio4
	 IK2OvPsjiBVmA==
Date: Thu, 8 Jan 2026 17:56:39 +0000
From: Will Deacon <will@kernel.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 02/15] kasan: arm64: x86: Make special tags arch
 specific
Message-ID: <aV_v18YWCHXMETVK@willie-the-truck>
References: <cover.1765386422.git.m.wieczorretman@pm.me>
 <0db7ec3b1a813b4d9e3aa8648b3c212166a248b7.1765386422.git.m.wieczorretman@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0db7ec3b1a813b4d9e3aa8648b3c212166a248b7.1765386422.git.m.wieczorretman@pm.me>
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

On Wed, Dec 10, 2025 at 05:28:43PM +0000, Maciej Wieczor-Retman wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Min and max values. 0xFD is the highest value that can be randomly
>   generated for a new tag. 0 is the minimal value with the exception of
>   arm64's hardware mode where it is equal to 0xF0.
> 
> Metadata macro is also defined:
> - Tag width equal to 8.
> 
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
> 
> Make tag width and native kernel tag arch specific for x86 and arm64.
> 
> Base the invalid tag value and the max value on the native kernel tag
> since they follow the same pattern on both mentioned architectures.
> 
> Also generalize KASAN_SHADOW_INIT and 0xff used in various
> page_kasan_tag* helpers.
> 
> Give KASAN_TAG_MIN the default value of zero, and move the special value
> for hw_tags arm64 to its arch specific kasan-tags.h.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v7:
> - Reorder defines of arm64 tag width to prevent redefinition warnings.
> - Remove KASAN_TAG_MASK so it's only defined in mmzone.h (Andrey
>   Konovalov)
> - Merge the 'support tag widths less than 8 bits' with this patch since
>   they do similar things and overwrite each other. (Alexander)
> 
> Changelog v6:
> - Add hardware tags KASAN_TAG_WIDTH value to the arm64 arch file.
> - Keep KASAN_TAG_MASK in the mmzone.h.
> - Remove ifndef from KASAN_SHADOW_INIT.
> 
> Changelog v5:
> - Move KASAN_TAG_MIN to the arm64 kasan-tags.h for the hardware KASAN
>   mode case.
> 
> Changelog v4:
> - Move KASAN_TAG_MASK to kasan-tags.h.
> 
> Changelog v2:
> - Remove risc-v from the patch.
> 
>  MAINTAINERS                         |  2 +-
>  arch/arm64/include/asm/kasan-tags.h | 14 ++++++++++++++
>  arch/arm64/include/asm/kasan.h      |  2 --
>  arch/arm64/include/asm/uaccess.h    |  1 +
>  arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
>  include/linux/kasan-tags.h          | 19 ++++++++++++++-----
>  include/linux/kasan.h               |  3 +--
>  include/linux/mm.h                  |  6 +++---
>  include/linux/page-flags-layout.h   |  9 +--------
>  9 files changed, 44 insertions(+), 21 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7bf6385efe04..a591598cc4b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13420,7 +13420,7 @@ L:	kasan-dev@googlegroups.com
>  S:	Maintained
>  B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
>  F:	Documentation/dev-tools/kasan.rst
> -F:	arch/*/include/asm/*kasan.h
> +F:	arch/*/include/asm/*kasan*.h
>  F:	arch/*/mm/kasan_init*
>  F:	include/linux/kasan*.h
>  F:	lib/Kconfig.kasan
> diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm/kasan-tags.h
> new file mode 100644
> index 000000000000..259952677443
> --- /dev/null
> +++ b/arch/arm64/include/asm/kasan-tags.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL	0xFF /* native kernel pointers tag */
> +
> +#ifdef CONFIG_KASAN_HW_TAGS
> +#define KASAN_TAG_MIN		0xF0 /* minimum value for random tags */
> +#define KASAN_TAG_WIDTH		4
> +#else
> +#define KASAN_TAG_WIDTH		8
> +#endif

Shouldn't this be 0 when KASAN is not in use at all?

Will

