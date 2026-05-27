Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AC8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBtVQtrG2D+f9Z/sho+DSeJtMa0aOiwSm/AF9v+I85o=; b=FjeeNCOHp0oCfCO1W1qB+RTsc4
	XIMHJhgGHSyzKzRkmy0+3Sbpr1MNby7AAB5Ir3kkNiaXN0lcsGM9hflPSAKH2hjCQ8K317Sn7mzkh
	0IXkFml85f1icIWZSsclPjYRIy09nBhEbNmYrcDrJ2+f55l3qGZaDLdmMbGN6iPh/x54ZYFNk/bWo
	ilyYv0knTN6O6xDVu9WwNtp105JRh532IRR0BgtAqWhmvTR1+HF/a4f/vTq+69Ql4mdVZRGnAR15D
	9Q2ytBWO2K98DQhQMY4nOLIHCWpT9xwYuWA0IkaE+NvVPbUry4+gzfVfwCa/WTB221P1Nr4RMSvdC
	cOLSRc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANO-00000003c7P-3qA5;
	Wed, 27 May 2026 09:16:34 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANJ-00000003c5w-41PB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779873383; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=sBtVQtrG2D+f9Z/sho+DSeJtMa0aOiwSm/AF9v+I85o=;
	b=Ca+fO0k3wSiKcac6DMzYaE3yJ5dcTSM/Nko6QY44XiZb4pwoCKcTy5aV4QXjRFqcUGHouPs8PiAccUDgfy+nNflhpZDdDc2MEkggsquC9zEmBE/J9qCXNlfFRhKDMNRgdtmAENy4j+VKqpkB7jkF5ZbTUxjRfb9WaSUPRR1dXIQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=29;SR=0;TI=SMTPD_---0X3jFQTK_1779873377;
Received: from 30.246.179.14(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X3jFQTK_1779873377 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 17:16:19 +0800
Message-ID: <1cc534eb-b323-4cf3-9301-77e3925c613b@linux.alibaba.com>
Date: Wed, 27 May 2026 17:16:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/8] uaccess: add generic fallback version of
 copy_mc_to_user()
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, tony.luck@intel.com,
 guohanjun@huawei.com, mchehab@kernel.org, tongtiangen@huawei.com,
 james.morse@arm.com, robin.murphy@arm.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
 <20260518084956.2538442-2-tianruidong@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260518084956.2538442-2-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021630_170243_2D2440DB 
X-CRM114-Status: GOOD (  15.15  )
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



On 5/18/26 4:49 PM, Ruidong Tian wrote:
> From: Tong Tiangen <tongtiangen@huawei.com>
> 
> x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
> fallback in include/linux/uaccess.h prepare for other architechures to
> enable CONFIG_ARCH_HAS_COPY_MC.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   arch/powerpc/include/asm/uaccess.h | 1 +
>   arch/x86/include/asm/uaccess.h     | 1 +
>   include/linux/uaccess.h            | 8 ++++++++
>   3 files changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index e98c628e3899..073de098d45a 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -432,6 +432,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
>   
>   	return n;
>   }
> +#define copy_mc_to_user copy_mc_to_user
>   #endif
>   
>   extern size_t copy_from_user_flushcache(void *dst, const void __user *src, size_t size);
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 3a0dd3c2b233..308b0854d1d5 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -496,6 +496,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
>   
>   unsigned long __must_check
>   copy_mc_to_user(void __user *to, const void *from, unsigned len);
> +#define copy_mc_to_user copy_mc_to_user
>   #endif
>   
>   /*
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 56328601218c..c53a65394f80 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -250,6 +250,14 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
>   }
>   #endif
>   
> +#ifndef copy_mc_to_user
> +static inline unsigned long __must_check
> +copy_mc_to_user(void *dst, const void *src, size_t cnt)
> +{
The prototype of this generic fallback diverges from both copy_to_user()
and the existing arch implementations of copy_mc_to_user() in two
non-trivial ways:

   1. The destination pointer drops the __user annotation.

      copy_to_user() is declared as:

          unsigned long copy_to_user(void __user *to,
                                     const void *from,
                                     unsigned long n);

      and arch/x86/include/asm/uaccess.h declares the arch version as:

          unsigned long copy_mc_to_user(void __user *to,
                                        const void *from,
                                        unsigned long len);

      With this fallback typed as 'void *dst', sparse will silently
      accept a kernel pointer being passed in, and the address-space
      check is effectively lost for any architecture that ends up using
      the fallback. The annotation is the whole point of __user; please
      keep it.

   2. The size parameter is 'size_t cnt' instead of 'unsigned long n'.

      copy_to_user() and the x86/ppc copy_mc_to_user() implementations
      all use 'unsigned long'. On all supported arches this happens to
      be the same width as size_t, so it is not a functional bug, but
      the inconsistent signature is a foot-gun: when an arch later
      switches from the fallback to its own implementation, every
      caller signature has to be re-checked.

Please align the fallback prototype exactly with the arch versions:

     #ifndef copy_mc_to_user
     static inline unsigned long __must_check
     copy_mc_to_user(void __user *dst, const void *src, unsigned long cnt)
     {
         return copy_to_user(dst, src, cnt);
     }
     #endif

With that fixed:

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

