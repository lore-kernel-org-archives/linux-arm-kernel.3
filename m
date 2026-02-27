Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA09AFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBGkBtEWokOLgcSdPmAa82OORRqpC4SG2ZWxOsrxZF0=; b=PTV2DydxshvpmAWT0YctLga+cS
	RhDjiDfEYkg0/1gzQRkHIuNQpuQ0O1GNjTFudLexY8iEpFbZE8dFCUPjKXUY+AfH26YoKHzxgPfrg
	iVVN94IUjzV4ch4eUGt2i5nWNBDKKp8O65TRR6ydHttkLjSTBtPBUpnpGfl1zrNm4vxJgEa1GHBj1
	brSU+GN93awC1njggro/wDmGhUzktxQe3SeKXABLD3AsKRzg5Og9pkVThgTbPGQfyZVebI2pj9EzQ
	PtN8Ip0S9ibOhW5HHKgb0YfT1oWprnjK7NGNnwhyR0OWH9Bi9QMXpLCrrnvde/NY6XRnFHJZ9pxYE
	YK+TMV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyUG-00000008SzF-47Xx;
	Fri, 27 Feb 2026 14:06:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyUE-00000008Syu-1pyq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:06:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6953E14BF;
	Fri, 27 Feb 2026 06:06:23 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AD2F3F62B;
	Fri, 27 Feb 2026 06:06:28 -0800 (PST)
Message-ID: <7b5e4218-5961-4874-bbb1-89770cd2c744@arm.com>
Date: Fri, 27 Feb 2026 14:06:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm_mpam: Force __iomem casts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_060634_599782_4A629A09 
X-CRM114-Status: GOOD (  18.79  )
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

Hi Krzysztof,

On 2/16/26 11:02, Krzysztof Kozlowski wrote:
> Code allocates standard kernel memory to pass to the MPAM, which expects
> __iomem.  The code is safe, because __iomem accessors should work fine
> on kernel mapped memory, however leads to sparse warnings:
> 
>   test_mpam_devices.c:327:42: warning: incorrect type in initializer (different address spaces)
>   test_mpam_devices.c:327:42:    expected char [noderef] __iomem *buf
>   test_mpam_devices.c:327:42:    got void *
>   test_mpam_devices.c:342:24: warning: cast removes address space '__iomem' of expression
> 
> Cast the pointer to memory via __force to silence them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/resctrl/test_mpam_devices.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/test_mpam_devices.c b/drivers/resctrl/test_mpam_devices.c
> index 3e8d564a0c64..2de41b47c138 100644
> --- a/drivers/resctrl/test_mpam_devices.c
> +++ b/drivers/resctrl/test_mpam_devices.c
> @@ -324,7 +324,7 @@ static void test_mpam_enable_merge_features(struct kunit *test)
>  
>  static void test_mpam_reset_msc_bitmap(struct kunit *test)
>  {
> -	char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
> +	char __iomem *buf = (__force char __iomem *)kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
>  	struct mpam_msc fake_msc = {};
>  	u32 *test_result;
>  
> @@ -339,7 +339,7 @@ static void test_mpam_reset_msc_bitmap(struct kunit *test)
>  	mutex_init(&fake_msc.part_sel_lock);
>  	mutex_lock(&fake_msc.part_sel_lock);
>  
> -	test_result = (u32 *)(buf + MPAMCFG_CPBM);
> +	test_result = (__force u32 *)(buf + MPAMCFG_CPBM);
>  
>  	mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
>  	KUNIT_EXPECT_EQ(test, test_result[0], 0);


This change looks good to me. As sparse is more broken I needed to use
the patch from [1] to reproduce this. Copied here for convenience.

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 2b30a0529d48..90536b2bc42e 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -14,8 +14,8 @@ struct vm_area_struct;
 struct mempolicy;

 /* Helper macro to avoid gfp flags if they are the default one */
-#define __default_gfp(a,...) a
-#define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,)
GFP_KERNEL)
+#define __default_gfp(a,b,...) b
+#define default_gfp(...) __default_gfp(,##__VA_ARGS__,GFP_KERNEL)

 /* Convert GFP flags to their corresponding migrate type */
 #define GFP_MOVABLE_MASK (__GFP_RECLAIMABLE|__GFP_MOVABLE)

There is a kernel test robot report [2] and that asks for these tags:

Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202512160133.eAzPdJv2-lkp@intel.com/

Acked-by: Ben Horgan <ben.horgan@arm.com>

[1]
https://lore.kernel.org/all/CAHk-=wijD-giccF6sJ+BdJpGDX9kPEUT6kryaQG0GRyJ3QQwng@mail.gmail.com/
[2] https://lore.kernel.org/all/202512160133.eAzPdJv2-lkp@intel.com/

Thanks,

Ben


