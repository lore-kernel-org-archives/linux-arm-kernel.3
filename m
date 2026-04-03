Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F079E7E351
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4JimXEL2ToG/y4AcgAjGdDXlKuKAxN7w6RE/97EUsY=; b=poeKsPhEE3zeEalD1Nij7CMLe0
	p35n7B59mss37zc12kT8vg07GXFjArXTjegHV4s94O1LpR0Clq/eGIxS0yck9d+fR7ifJ0lMktDcj
	o2PwRJmsoDiezXNDBFW/ZDGbq+Icyr+Djd+ZY8dujs1Z9pHAR8Dw1vtbmtt54WDznJ2kPlcZGrTxQ
	sl253lr3yrqJaaPYP6DR9ynT2CZKwEcqWq43Rhcn6jmIEw/Rmp/M41h4G4R/kj8T7sv/J/LbNVn9t
	khJsUadgBpTZbdAzyVjQr1dFN4X9xFeA9wzkkmo/BVo1txTb/TUyMTBadrdkwppMvsP4jw05zBlT/
	HE2pM/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aX9-00000001mFE-1twW;
	Fri, 03 Apr 2026 09:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aX6-00000001mEO-3ocO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0B9A437D6;
	Fri,  3 Apr 2026 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE73C4CEF7;
	Fri,  3 Apr 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775207379;
	bh=mN88sqnTr8cnCrx28wONP+6i/YzQAg1ti02VWjNZU8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0//KYtleZ1Omr7pkZ7gxs2FacEx3cG5ktS+Hj7kYcpmXT/Ds8xnp9qgXnOr9CBeq
	 6ZHp/u0BnpyR/86cw2zFkRDOvXpvR50gjEphv0j6ZtjRmsWpakzzH7WZoAvdI/Dmce
	 RFK2eoNkh1vL8t+W35/qa9DFQSsiHFRbATUfkFzvcdtxwLfinx5dgOpINF483IlrD0
	 eFE6UDvkm2HuYn4GfFDAz7HgAVZMzos/d9Lc69dzQYZKyHdNXvAxOwktOjhi/x3Id5
	 beEi6fFYZf2adqwaWyT7sB4PiiNzu8GzEYdg860HaUJWRJ90vbxzOX9rbqU5BNqtgT
	 qEtLynS0u5jmQ==
Date: Fri, 3 Apr 2026 10:09:35 +0100
From: Will Deacon <will@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, ardb@kernel.org
Subject: Re: [PATCH] arm64: pi: validate bootargs before parsing them
Message-ID: <ac-Dz3biyutiYclj@willie-the-truck>
References: <20260403143004.4-arm64-pi-bootargs-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403143004.4-arm64-pi-bootargs-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_020940_972392_E809F1CB 
X-CRM114-Status: GOOD (  16.81  )
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

On Fri, Apr 03, 2026 at 11:56:05AM +0800, Pengpeng Hou wrote:
> get_bootargs_cmdline() fetches the raw bootargs property from the FDT
> and immediately calls strlen() on it before later passing the same
> pointer into the early command-line parser. Flat DT properties are
> external boot input, and this path does not prove that bootargs is
> NUL-terminated within its declared bounds.
> 
> Use fdt_stringlist_get() so malformed unterminated bootargs are
> rejected before the local parser treats them as C strings.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index bc57b290e5e7..310ed279ef26 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -373,11 +373,11 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
>  	if (node < 0)
>  		return NULL;
>  
> -	prop = fdt_getprop(fdt, node, bootargs, NULL);
> +	prop = fdt_stringlist_get(fdt, node, bootargs, 0, NULL);
>  	if (!prop)
>  		return NULL;
>  
> -	return strlen(prop) ? prop : NULL;
> +	return *prop ? prop : NULL;
>  }

I'm not exactly sure why we need to go out of our way to handle a
malformed DT at this stage, tbh. If it's corrupted in other ways (e.g.
random ASCII replacement) then we're probably still going to crash and
burn. There's nothing particularly special about NUL terminators.

If we _do_ decide that this is worth fixing, what about the other
early callers of fdt_getprop (kaslr, EFI stub)?

Will

