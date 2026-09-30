Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B768CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkELDc4NESnRGBNUzyYEKc06oG3nPHsRKGEhMIz7kp8=; b=17K9TYuNtF0DkVpAFya0Cm1pT8
	wuZaVDL/gtN2dE7ZuG/YeH15TrHJDmMQlFog/Am8nxvexdILBLTV59GsTEMkNjnUVc8OV2l2/1DpX
	esvucsr6SrpOIKv+5nFzM/JvFwkVNIZpejFFGxrCw95E9MvJ7AhL3UvVHqceZPHcIFQjen3pfaeK5
	c6DhQTGv5EzsQUEJgDNtyd9y3s10SkI/oLxQAaox+Muo1fvC9KXQJH4+6oq4cSlzGSusoI5owbada
	03oeSPs8muVcF3PfaWRNFoHq3LLdSwftRb3+AakedXZaBynhASc+Gxe/ebCEZ7t7lRuHAX+7JVzVK
	rfwMBBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ef-00000007C8M-2qtH;
	Wed, 30 Sep 2026 20:49:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC1Ec-00000007C7W-1yg7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 20:49:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 852DC497
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:48:55 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2C753F85F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790801338; bh=7cw+2uirxLu0HD1zySTwhFF6oAhV9dULExV1Z7f8/aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KG7km24EHa7spw+uDrZxdwaeP6w3q+bQZyDooKXaR93a0Q+ChkoFb4K0W8wOqBC4N
	 oDBLcQTLVPjz34+l4iNC63WQp9IwlYDpi5UTx61DyXir8q3mf26JDkhbvvSYIwz+pP
	 NsDfNJyWofzbQAtV8Id0THMVW7rLfB8deo0ndokc=
Date: Wed, 30 Sep 2026 21:48:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: vexpress: fix device_node refcount leak in
 vexpress_flags_set()
Message-ID: <ar11s6PaXaXhiswh@e142607>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
 <20260925173252.933705-2-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925173252.933705-2-geoffreyhe2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_134902_548882_F043F113 
X-CRM114-Status: GOOD (  25.18  )
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

On Sat, Sep 26, 2026 at 03:32:51AM +1000, Weigang He wrote:
> vexpress_flags_set() obtains a reference to the "arm,vexpress-sysreg"
> device node via of_find_compatible_node() and passes it to of_iomap(),
> but never calls of_node_put() on it. of_iomap() only reads the node's
> reg property to create the mapping and does not take ownership, so the
> node reference is leaked. The function runs from the __init SMP prepare
> path and caches the mapping in a static, so this is a one-shot leak of a
> single refcount during boot, with no functional impact.
> 
> The lookup was added to drivers/mfd/vexpress-sysreg.c by the commit
> below and later moved here by commit 9b06fc39084e ("ARM: vexpress: Move
> vexpress_flags_set() into arch code").
> 
> Annotate node with the __free(device_node) cleanup attribute so the
> reference is released when it goes out of scope.
> 
> Found by static analysis tool CodeQL.
> 
> Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Notes:
>     Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
>     hardware; I have no Versatile Express board.
>     
>     The CodeQL query behind this report was synthesized with LLM assistance,
>     and the fix and changelog were drafted with LLM assistance; I have
>     reviewed them.
> 
>  arch/arm/mach-versatile/v2m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/v2m.c b/arch/arm/mach-versatile/v2m.c
> index 79afdf2a90b6f..c86b38386cf7c 100644
> --- a/arch/arm/mach-versatile/v2m.c
> +++ b/arch/arm/mach-versatile/v2m.c
> @@ -13,8 +13,8 @@ void vexpress_flags_set(u32 data)
>  	static void __iomem *base;
>  
>  	if (!base) {
> -		struct device_node *node = of_find_compatible_node(NULL, NULL,
> -				"arm,vexpress-sysreg");
> +		struct device_node *node __free(device_node) =
> +			of_find_compatible_node(NULL, NULL, "arm,vexpress-sysreg");
>  
>  		base = of_iomap(node, 0);
>  	}
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

