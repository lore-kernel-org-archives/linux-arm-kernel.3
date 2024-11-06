Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D403D44D59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVuOhTx5v4qB0ljx0iaK++os+TE50YnCzkgWkLTj+Zg=; b=s1juxqhZ882Ge2IV/w2ckbso4+
	3sMHFgRaw3TKAtQu7pty4eoOs57wnb3GDerW0011OHdbgu7Ui1qaUQOZTJvNpfojUfTDJjoldeJ5T
	Q+LWwZpw5JStjJPF6TRMqwQKudLnECUrv3QNQHwtBkp6T7EjaTMWxShbfRTdgwcEj7qfg8K3A4qWA
	oSeNZg5fusJGDhxOeQQzHumBNQn32KyGl+yZufpTM51FCrj0ptS3CFxNAc8xsg/BJMrI63uKTPxih
	wB+6BzftMF6GhLtR8oo/9Wz4MneC1NWJrMZ3HRkRF+cf0W8poAChfkXoa3r9J0W8VYrEUpSJjxdAl
	5K79jn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fFr-00000003DA1-2Ein;
	Wed, 06 Nov 2024 12:35:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eSj-00000002yL8-13Sc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:44:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69E0A1063;
	Wed,  6 Nov 2024 03:45:06 -0800 (PST)
Received: from [10.57.88.115] (unknown [10.57.88.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF9C13F6A8;
	Wed,  6 Nov 2024 03:44:35 -0800 (PST)
Message-ID: <3e26ec9a-4dc0-42e7-a383-2c1bd0a08412@arm.com>
Date: Wed, 6 Nov 2024 11:44:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/slab: Avoid build bug for calls to kmalloc with a
 large constant
Content-Language: en-GB
To: Dave Kleikamp <dave.kleikamp@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
 <20241014105912.3207374-6-ryan.roberts@arm.com>
 <44312f4a-8b9c-49ce-9277-5873a94ca1bb@oracle.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <44312f4a-8b9c-49ce-9277-5873a94ca1bb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_034437_357741_9DAC4962 
X-CRM114-Status: GOOD (  17.46  )
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

On 01/11/2024 20:16, Dave Kleikamp wrote:
> When boot-time page size is enabled, the test against KMALLOC_MAX_CACHE_SIZE
> is no longer optimized out with a constant size, so a build bug may
> occur on a path that won't be reached.
> 
> Found compiling drivers/net/ethernet/qlogic/qed/qed_sriov.c
> 
> Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
> ---
> 
> Ryan,
> 
> Please consider incorporating this fix or something similar into your
> mm patch in the boot-time pages size patches.
> 
>  include/linux/slab.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 9848296ca6ba..a4c7507ab8ec 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -685,7 +685,8 @@ static __always_inline unsigned int __kmalloc_index(size_t
> size,
>      if (size <= 1024 * 1024) return 20;
>      if (size <=  2 * 1024 * 1024) return 21;
>  
> -    if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
> +    if (!IS_ENABLED(CONFIG_ARM64_BOOT_TIME_PAGE_SIZE) &&

Thanks for the patch! I think this may be better as:

       if (PAGE_SHIFT_MIN == PAGE_SHIFT_MAX &&

Since that is independent of the architecture. Your approach wouldn't work if
another arch wanted to enable boot time page size, or if arm64 dropped the
Kconfig because it decided only boot time page size will be supported in future.

Thanks,
Ryan

> +        !IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
>          BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>      else
>          BUG();


