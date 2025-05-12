Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC55C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VKNu3k1qRi+5qa5jDexJ0Fa6z5NeNNhjQuMwQxkqWU=; b=cbePgcJ1FU4o2BOgmInmjNaNJL
	ov/MIWnqc+yL7C9SHhDvJJFY6vB0g7FrLg+J7f3zNqvYe3+2NZTeLdTkFLlx4TZY7MdOMOwvaRg3y
	BYb74w/y45IX1t/dtm2MGuofOyE1nYlgaJ3KiZ/cNebAla2VNFrVIQX6YXnQINx0kddn7uf6I4p33
	XIasT2a8V4QyTNOlUbXxHwdRfk6kqo2Cc5sCGfDim17awHUVyrAO10KyxupH7W7UAZ4CB11o1CMM6
	wQhPW5ECv+IgGL+FtCNn/e3evg4kObi17iUJwqbHIejp8k4X1h2i4Hz2HuPPS2akRtG4iPgLK/rUO
	TIvE+k5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVrQ-0000000A0RH-0zOZ;
	Mon, 12 May 2025 16:18:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVRB-00000009wWt-2gXg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:51:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC01B14BF;
	Mon, 12 May 2025 08:51:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 318C73F63F;
	Mon, 12 May 2025 08:51:28 -0700 (PDT)
Date: Mon, 12 May 2025 16:51:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Makefile: Ensure initrd parameters in /chosen are
 up-to-date
Message-ID: <aCIY_bKyj6Pl7ZZm@J2N7QTR9R3>
References: <20250512150944.38322-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512150944.38322-1-Dave.Martin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_085129_720927_83E1576F 
X-CRM114-Status: GOOD (  23.67  )
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

On Mon, May 12, 2025 at 04:09:44PM +0100, Dave Martin wrote:
> The initrd parameters in the FDT /chosen node are fixed when the device
> tree blob is generated, so it is important to regenerate the device
> tree if the initrd image has been updated.
> 
> Currently this does not happen, so the parameters can be stale.
> In particular, if the initrd image is bigger than it was when the
> device tree was first generated then the value of the linux,initrd-end
> parameter is too small, leading to truncation of the initrd image on
> boot even though the whole image is present in linux-system.axf.
> 
> Make $(FILESYSTEM) a dependency of fdt.dtb so that the parameters are
> refreshed properly based on the current initrd image (if any).
> 
> Without --with-initrd, FILESYSTEM is the empty string and the
> dependency evaporates, which is just fine.
> 
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>

Applied.

Mark.

> ---
>  Makefile.am | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile.am b/Makefile.am
> index a8d5c1b..0178e5d 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -185,7 +185,7 @@ model.lds: $(LD_SCRIPT) Makefile
>  DTC_NOWARN  = $(call test-dtc-option,-Wno-clocks_property)
>  DTC_NOWARN += $(call test-dtc-option,-Wno-gpios_property)
>  
> -fdt.dtb: $(KERNEL_DTB) Makefile
> +fdt.dtb: $(KERNEL_DTB) Makefile $(FILESYSTEM)
>  	( $(DTC) -O dts -I dtb $(KERNEL_DTB) ; echo "/ { $(CHOSEN_NODE) $(PSCI_NODE) }; $(CPU_NODES)" ) | $(DTC) -O dtb -o $@ $(DTC_NOWARN) -
>  
>  # The filesystem archive might not exist if INITRD is not being used
> -- 
> 2.34.1
> 

